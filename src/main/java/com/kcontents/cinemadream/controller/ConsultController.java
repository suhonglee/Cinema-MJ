package com.kcontents.cinemadream.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import surem.api.sms.SureSMSAPI;
import surem.api.tcp.sms.SureSMSDeliveryReport;
import surem.api.tcp.sms.SureSMSSendReport;

import com.kcontents.cinemadream.common.util.SecurityUtil;
import com.kcontents.cinemadream.common.util.SureSMSUtil;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Reply;
import com.kcontents.cinemadream.domain.Sample;
import com.kcontents.cinemadream.service.ConsultService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/consult")
public class ConsultController {
	@Autowired
	public ConsultService consultService;
	private static final Logger logger = LoggerFactory.getLogger(ConsultController.class);

	private static final int SHOW_ITEM_SIZE=20;
	private static final int SHOW_PAGE_SIZE=10;

	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String insertBbs(@Valid Consult consult
			, BindingResult bindingResult) throws UnsupportedEncodingException
	{
		if(bindingResult.hasErrors())
		{
			return "consult/write";
		}
		if(consultService.insertBbs(consult)==1)
		{
			String[] tel = consult.getTel().split("-");
			SureSMSUtil.sendBbsSMS(consult.getWriter(), consult.getTitle(), "견적의뢰문의", tel[0], tel[1], tel[2], SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3);
			SureSMSUtil.sendBbsSMS(consult.getWriter(), consult.getTitle(), "견적의뢰문의", SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3, tel[0], tel[1], tel[2]);
			return "redirect:/consult/"+consult.getNo();
		}
		return "redirect:/consult/";
	}
	
	@RequestMapping(value ="/{bbsNo}/reply", method=RequestMethod.GET)
	public @ResponseBody ArrayList selectConsultReply(@PathVariable int bbsNo)
	{
		return (ArrayList) consultService.selectReply(bbsNo);
	}

	@RequestMapping(value = "/{bbsNo}/reply", method=RequestMethod.POST)
	public @ResponseBody Map insertConsultReply(@Valid Reply reply
			,BindingResult bindingResult)
	{
		Map response = new HashMap();
		if(bindingResult.hasErrors())
		{
			List<ObjectError> errorList = bindingResult.getAllErrors();
			Map<String,String> errorResponse =new HashMap<String,String>();
			for(int i=0;i<errorList.size();i++)
			{
				ObjectError error = errorList.get(i);
				if(error instanceof FieldError)
				{
					errorResponse.put(((FieldError)error).getField(),error.getDefaultMessage());
				}
			}
			response.put("errors",errorResponse);
			return response;
		}
		if(consultService.insertReply(reply))
		{
			Consult consult = consultService.selectBbs(reply.getBbsNo());
			String[] tel = consult.getTel().split("-");
			SureSMSUtil.sendReplySMS(consult.getWriter(), consult.getTitle(), "견적의뢰문의", SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3, tel[0], tel[1], tel[2]);
			response.put("success", true);
		}
		return response;
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String list(@RequestParam(value="page", defaultValue="1") int currentPage
			, ModelMap model)
	{
		HashMap require = new HashMap();
		require.put("page",currentPage);
		require.put("startNumber", currentPage*SHOW_ITEM_SIZE-SHOW_ITEM_SIZE);
		require.put("limit",SHOW_ITEM_SIZE);
		
		ArrayList list = (ArrayList) consultService.selectBbsList(require);
		model.addAttribute("dataList", list);
		
		model.addAttribute("pageSize", (consultService.selectBbsMaxSize(require)-1)/SHOW_ITEM_SIZE+1);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("firstPage", (((int)((currentPage-1)/SHOW_PAGE_SIZE))*SHOW_PAGE_SIZE)+1);
		model.addAttribute("pageListSize", SHOW_PAGE_SIZE);
		model.addAttribute("pageCount", ((currentPage-1)/SHOW_PAGE_SIZE)+1);
		return "consult/list";
	}
	
	@RequestMapping(value="/{no}", method=RequestMethod.GET)
	public String detail(@PathVariable int no
			, @RequestParam(value="password", required=false) String password
			, ModelMap model
			, HttpSession session)
	{
		Consult consult = consultService.selectBbs(no);
		if(consult.getPassword() != null && ! SecurityUtil.checkRole("ROLE_ADMIN") && consult.isSecret())
		{
			if(! consult.getPassword().equals(password))
			{
				if(session.getAttribute("loginNo") != null)
				{
					if((Integer)session.getAttribute("loginNo") == no)
					{
						if(session.getAttribute("loginCount")==null)
						{
							session.setAttribute("loginCount",0);
						}
						int loginCount = (Integer) session.getAttribute("loginCount");
						session.setAttribute("loginCount", loginCount+1);
						model.addAttribute("errorCode",1);
					}
					else
					{
						session.setAttribute("loginCount", 0);
						model.addAttribute("errorCode",2);
					}
				}
				model.addAttribute("no",no);
				session.setAttribute("loginNo", no);
				return "consult/detailChkPw";
			}
			else
			{
				session.setAttribute("loginNo", 0);
				session.setAttribute("loginCount",0);
			}
		}
		model.addAttribute("consult",consult);
		return "consult/detail";
	}
	
	@RequestMapping(value = "/{no}", method=RequestMethod.DELETE)
	public @ResponseBody boolean deleteConsultBbs(@PathVariable int no)
	{
		return consultService.deleteBbs(no);
	}
	
	@RequestMapping(value = "/{bbsNo}/reply", method=RequestMethod.DELETE)
	public @ResponseBody boolean deleteConsultReply(Reply reply
			, @RequestParam(value="secret") boolean secret
			, @RequestParam(value="isAdmin") boolean isAdmin)
	{
		Map require = new HashMap();
		require.put("reply",reply);
		if(! isAdmin) require.put("secret",secret);
		
		return consultService.deleteReply(require);
	}
	
	@RequestMapping(value="/write")
	public String showConsultBbsWrite(ModelMap model)
	{
		model.addAttribute("consult", new Consult());
		return "consult/write";
	}
	
}

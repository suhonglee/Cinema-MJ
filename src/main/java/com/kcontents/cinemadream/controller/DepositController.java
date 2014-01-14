package com.kcontents.cinemadream.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.kcontents.cinemadream.common.util.SecurityUtil;
import com.kcontents.cinemadream.common.util.SureSMSUtil;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.domain.Reply;
import com.kcontents.cinemadream.service.DepositService;
import com.kcontents.cinemadream.service.DepositService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/deposit")
public class DepositController {
	@Autowired
	public DepositService depositService;
	private static final Logger logger = LoggerFactory.getLogger(DepositController.class);

	private static final int SHOW_ITEM_SIZE=20;
	private static final int SHOW_PAGE_SIZE=10;

	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String insertBbs(@Valid Deposit deposit
			, BindingResult bindingResult) throws UnsupportedEncodingException
	{
		if(bindingResult.hasErrors())
		{
			return "deposit/write";
		}
		if(depositService.insertBbs(deposit)==1)
		{
			String[] tel = deposit.getTel().split("-");
			SureSMSUtil.sendBbsSMS(deposit.getWriter(), deposit.getTitle(), "예약입금확인", tel[0], tel[1], tel[2], SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3);
			SureSMSUtil.sendBbsSMS(deposit.getWriter(), deposit.getTitle(), "예약입금확인", SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3, tel[0], tel[1], tel[2]);
			return "redirect:/deposit/"+deposit.getNo();
		}
		return "redirect:/deposit/";
	}
	
	@RequestMapping(value ="/{bbsNo}/reply", method=RequestMethod.GET)
	public @ResponseBody ArrayList selectDepositReply(@PathVariable int bbsNo)
	{
		return (ArrayList) depositService.selectReply(bbsNo);
	}

	@RequestMapping(value = "/{bbsNo}/reply", method=RequestMethod.POST)
	public @ResponseBody Map insertDepositReply(@Valid Reply reply
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
		if(depositService.insertReply(reply))
		{
			Deposit deposit = depositService.selectBbs(reply.getBbsNo());
			String[] tel = deposit.getTel().split("-");
			SureSMSUtil.sendReplySMS(deposit.getWriter(), deposit.getTitle(), "예약입금확인", SureSMSUtil.TEL1, SureSMSUtil.TEL2, SureSMSUtil.TEL3, tel[0], tel[1], tel[2]);
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
		
		ArrayList list = (ArrayList) depositService.selectBbsList(require);
		model.addAttribute("dataList", list);
		
		model.addAttribute("pageSize", (depositService.selectBbsMaxSize(require)-1)/SHOW_ITEM_SIZE+1);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("firstPage", (((int)((currentPage-1)/SHOW_PAGE_SIZE))*SHOW_PAGE_SIZE)+1);
		model.addAttribute("pageListSize", SHOW_PAGE_SIZE);
		model.addAttribute("pageCount", ((currentPage-1)/SHOW_PAGE_SIZE)+1);
		return "deposit/list";
	}
	
	@RequestMapping(value="/{no}", method=RequestMethod.GET)
	public String detail(@PathVariable int no
			, @RequestParam(value="password", required=false) String password
			, ModelMap model
			, HttpSession session)
	{
		Deposit deposit = depositService.selectBbs(no);
		if(deposit.getPassword() != null && ! SecurityUtil.checkRole("ROLE_ADMIN"))
		{
			if(! deposit.getPassword().equals(password))
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
				return "deposit/detailChkPw";
			}
			else
			{
				session.setAttribute("loginNo", 0);
				session.setAttribute("loginCount",0);
			}
		}
		model.addAttribute("deposit",deposit);
		return "deposit/detail";
	}
	
	@RequestMapping(value = "/{no}", method=RequestMethod.DELETE)
	public @ResponseBody boolean deleteDepositBbs(@PathVariable int no)
	{
		return depositService.deleteBbs(no);
	}
	
	@RequestMapping(value = "/{bbsNo}/reply", method=RequestMethod.DELETE)
	public @ResponseBody boolean deleteDepositReply(Reply reply
			, @RequestParam("isAdmin") boolean isAdmin)
	{
		Map require = new HashMap();
		require.put("reply",reply);
		require.put("isAdmin",isAdmin);
		
		return depositService.deleteReply(require);
	}
	
	@RequestMapping(value="/write")
	public String showDepositBbsWrite(ModelMap model)
	{
		model.addAttribute("deposit", new Deposit());
		return "deposit/write";
	}
}

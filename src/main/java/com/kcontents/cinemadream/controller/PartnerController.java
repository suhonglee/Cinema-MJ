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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kcontents.cinemadream.common.util.SecurityUtil;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Partner;
import com.kcontents.cinemadream.domain.Partner;
import com.kcontents.cinemadream.domain.Reply;
import com.kcontents.cinemadream.service.PartnerService;
import com.kcontents.cinemadream.service.PartnerService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/partner")
public class PartnerController {
	@Autowired
	public PartnerService partnerService;
	private static final Logger logger = LoggerFactory.getLogger(PartnerController.class);

	private static final int SHOW_ITEM_SIZE=20;
	private static final int SHOW_PAGE_SIZE=10;

	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String insertBbs(HttpServletRequest request
			, @Valid Partner partner
			, BindingResult bindingResult) throws UnsupportedEncodingException
	{
		if(bindingResult.hasErrors())
		{
			return "partner/write";
		}
		MultipartHttpServletRequest mReq = (MultipartHttpServletRequest)request;
		Map map = new HashMap();
		map.put("partner",partner);
		map.put("files",mReq);
		partnerService.insert(map);
		return "redirect:/partner/";
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String list(ModelMap model)
	{
		HashMap require = new HashMap();
		
		ArrayList list = (ArrayList) partnerService.selectList();
		model.addAttribute("dataList", list);
		System.out.println(list);
		return "partner/list";
	}
	
	@RequestMapping(value = "/{no}", method=RequestMethod.DELETE)
	public @ResponseBody boolean deletePartnerBbs(@PathVariable int no)
	{
		return partnerService.delete(no);
	}
	
	@RequestMapping(value="/write")
	public String showPartnerBbsWrite(ModelMap model)
	{
		model.addAttribute("partner", new Partner());
		return "partner/write";
	}
}

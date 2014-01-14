package com.kcontents.cinemadream.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;

import org.apache.http.HttpException;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.kcontents.cinemadream.domain.Community;
import com.kcontents.cinemadream.domain.Scheduler;
import com.kcontents.cinemadream.service.CommunityService;
import com.kcontents.cinemadream.service.SchedulerService;
import com.kcontents.cinemadream.common.util.FacebookAPI;
import com.kcontents.cinemadream.common.util.FileUtil;
import com.kcontents.cinemadream.common.util.NaverAPI;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/scheduler")
public class SchedulerController {
	@Autowired
	public SchedulerService schedulerService;
	
	private static final int SHOW_ITEM_SIZE=5;
	private static final int SHOW_PAGE_SIZE=10;
	
	private static final String NAVER_CAFE_URL = "/community/naver/cafe";
	private static final String NAVER_BLOG_URL = "/community/naver/blog";
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/POST", method=RequestMethod.POST)
	public String insert(HttpServletRequest request
			, @Valid Scheduler scheduler
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model)
	{
		if(bindingResult.hasErrors())
		{
			return "scheduler/write";
		}
		return "redirect:/scheduler/"+scheduler.getNo();
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String post(@Valid Scheduler scheduler
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model)
	{
		if(bindingResult.hasErrors())
		{
			return "scheduler/write";
		}
		System.out.println(scheduler);
		schedulerService.post(scheduler);
		Calendar calendar = Calendar.getInstance();
		return "redirect:/scheduler/"+calendar.get(Calendar.YEAR)+"/"+calendar.get(Calendar.MONTH)+1;
	}
	
	@RequestMapping(value="/schedule/{no}", method=RequestMethod.GET)
	public String schedule(@PathVariable int no
			,ModelMap model)
	{
		model.put("scheduler",schedulerService.select(no));
		System.out.println(schedulerService.select(no));
		return "scheduler/detail";
	}
	
	@RequestMapping(value="/schedule/{no}", method=RequestMethod.DELETE)
	public @ResponseBody boolean cancel(@PathVariable int no
			,@RequestParam(value="cancel") boolean cancel)
	{
		Map require = new HashMap();
		require.put("no",no);
		require.put("cancel",!cancel);
		return schedulerService.cancel(require);
	}
	@RequestMapping(value="/{year}/{month}/schedule", method=RequestMethod.GET)
	public @ResponseBody List scheduleList(@PathVariable int year
			,@PathVariable int month)
	{
		Map require = new HashMap();
		require.put("year", year);
		require.put("month",month);
		List list = schedulerService.list(require);
		return list;
	}
	@RequestMapping(value = "/{year}/{month}", method=RequestMethod.GET)
	public String list(@PathVariable int year
			, @PathVariable int month
			, HttpServletRequest request)
	{
		int schedulerYear = year;
		int schedulerMonth = month;
		Calendar calendar = Calendar.getInstance();
		if(schedulerYear<2000)
		{
			schedulerYear = calendar.get(Calendar.YEAR);
		}
		if(schedulerMonth<1)
		{
			schedulerMonth = 12;
			schedulerYear -=1;
		}
		else if(month>12)
		{
			schedulerMonth = 1;
			schedulerYear += 1;
		}
		request.setAttribute("year", schedulerYear);
		request.setAttribute("month",schedulerMonth);
		return "scheduler/list";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm(ModelMap model)
	{
		model.put("scheduler", new Scheduler());
		return "scheduler/write";
	}
}

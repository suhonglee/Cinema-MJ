package com.kcontents.cinemadream.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcontents.cinemadream.common.util.SecurityUtil;
import com.kcontents.cinemadream.domain.Consult;
import com.kcontents.cinemadream.domain.Deposit;
import com.kcontents.cinemadream.service.ConsultService;
import com.kcontents.cinemadream.service.DepositService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, HttpSession session)
	{
		return showMain(request,session);
	}
	@RequestMapping(value="/main")
	public String showMain(HttpServletRequest request,
			HttpSession session)
	{
		return "main";
	}
	
	@RequestMapping(value="{url}")
	public String forward(@PathVariable String url)
	{
		logger.debug("Mapping in URL :: " +  url);
		return url;
	}
	
	@RequestMapping(value="/login")
	public String login(@RequestParam(value="failed",defaultValue="false") boolean isFailed
			,ModelMap model)
	{
		System.out.println(isFailed);
		model.addAttribute("isFailed",isFailed);
		return "login";
	}
	@RequestMapping(value="/checkRole")
	public @ResponseBody boolean checkRole(@RequestParam("ROLE") String ROLE)
	{
		System.out.println("IN CHK ROLE" + SecurityUtil.checkRole(ROLE));
		return SecurityUtil.checkRole(ROLE);
	}
	@RequestMapping(value="/logout")
	public String showAdmin(@RequestParam(value="timeout", defaultValue="0") final int timeout
			,final HttpSession session)
	{
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				try {
					Thread.sleep(timeout*1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.invalidate();
			}
		}).start();
		return "adminPageLogin";
	}
}

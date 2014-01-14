package com.kcontents.cinemadream.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kcontents.cinemadream.domain.Sample;
import com.kcontents.cinemadream.service.SampleService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/sample")
public class SampleController {
	@Autowired
	public SampleService sampleService;
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/{no}", method=RequestMethod.POST)
	public String insert(@Valid Sample sample
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model)
	{
		if(bindingResult.hasErrors())
		{
			return "sample/bbsWriteOrUpdate";
		}
		sampleService.insertBbs(sample);
		return "redirect:/sample/"+sample.getNo();
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/{no}", method = RequestMethod.PUT)
	public String update(@PathVariable int no
			, Sample sample
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model)
	{
		if(bindingResult.hasErrors()) return "sample/bbsWriteOrUpdate";
		sampleService.updateBbs(sample);
		return "redirect:/sample/"+sample.getNo();
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String list(ModelMap model)
	{
		ArrayList<HashMap> list = (ArrayList<HashMap>) sampleService.selectBbsList();
		for(HashMap map : list)
		{
			model.addAttribute("dataList", list);
		}
		return "sample/bbsList";
	}
	
	@RequestMapping(value="/{no}", method = RequestMethod.GET)
	public String detail(@PathVariable int no
			,ModelMap model)
	{
		sampleService.postHit(no);
		model.addAttribute("sample",sampleService.selectBbs(no));
		Map require = new HashMap();
		require.put("perPrefix",1);
		require.put("perSuffix",1);
		require.put("no",no);
		model.addAttribute("near", sampleService.selectNear(require));
		return "sample/bbsDetail";
	}
	
	@RequestMapping(value="/{no}/near", method=RequestMethod.GET)
	public @ResponseBody List near(@PathVariable int no
			,@RequestParam("perPrefix") int perPrefix
			,@RequestParam("perSuffix") int perSuffix)
	{
		Map require = new HashMap();
		require.put("perPrefix",perPrefix);
		require.put("perSuffix",perSuffix);
		require.put("no",no);
		return sampleService.selectNear(require);
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/{no}", method= RequestMethod.DELETE)
	public @ResponseBody boolean bbsDelete(@PathVariable int no)
	{
		return sampleService.deleteBbs(no);
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/write")
	public String showWriteForm(ModelMap model)
	{
		model.addAttribute("isWrite",true);
		model.addAttribute("sample", new Sample());
		return "sample/bbsWriteOrUpdate";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/update/{no}")
	public String showUpdateForm(
			@PathVariable int no
			,ModelMap model)
	{
		model.addAttribute("isWrite",false);
		model.addAttribute("sample",sampleService.selectBbs(no));
		return "sample/bbsWriteOrUpdate";
	}
}

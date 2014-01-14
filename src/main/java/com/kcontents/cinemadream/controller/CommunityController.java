package com.kcontents.cinemadream.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
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
import com.kcontents.cinemadream.service.CommunityService;
import com.kcontents.cinemadream.common.util.FacebookAPI;
import com.kcontents.cinemadream.common.util.FileUtil;
import com.kcontents.cinemadream.common.util.NaverAPI;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	public CommunityService communityService;
	
	private static final int SHOW_ITEM_SIZE=5;
	private static final int SHOW_PAGE_SIZE=10;
	
	private static final String NAVER_CAFE_URL = "/community/naver/cafe";
	private static final String NAVER_BLOG_URL = "/community/naver/blog";
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/POST", method=RequestMethod.POST)
	public String insert(HttpServletRequest request
			, @Valid Community community
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model)
	{
		if(bindingResult.hasErrors())
		{
			return showWriteForm(model);
		}
		MultipartHttpServletRequest mReq = (MultipartHttpServletRequest)request;
		Map map = new HashMap();
		map.put("community", community);
		map.put("files", mReq);
		communityService.insert(map);
		return "redirect:/community/"+community.getNo();
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/PUT", method = RequestMethod.POST)
	public String update(@Valid Community community
			, BindingResult bindingResult
			, SessionStatus sessionStatus
			, ModelMap model
			, HttpServletRequest request)
	{
		if(bindingResult.hasErrors()) return showUpdateForm(community.getNo(), model);
		HashMap map = new HashMap();
		map.put("community",community);
		MultipartHttpServletRequest mReq = (MultipartHttpServletRequest)request;
		map.put("files",mReq);
		communityService.update(map);
		return "redirect:/community/"+community.getNo();
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int currentPage
			, ModelMap model)
	{
		HashMap require = new HashMap();
		require.put("page",currentPage);
		require.put("startNumber", currentPage*SHOW_ITEM_SIZE-SHOW_ITEM_SIZE);
		require.put("limit",SHOW_ITEM_SIZE);
		
		ArrayList<HashMap> list = (ArrayList<HashMap>) communityService.selectList(require);
		model.addAttribute("dataList", list);
		
		model.addAttribute("pageSize", (communityService.getMaxSize(require)-1)/SHOW_ITEM_SIZE+1);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("firstPage", (((int)((currentPage-1)/SHOW_PAGE_SIZE))*SHOW_PAGE_SIZE)+1);
		model.addAttribute("pageListSize", SHOW_PAGE_SIZE);
		model.addAttribute("pageCount", ((currentPage-1)/SHOW_PAGE_SIZE)+1);
		return "community/list";
	}
	
	@RequestMapping(value="/recent", method=RequestMethod.GET)
	public @ResponseBody List recent(@RequestParam(value="perCount") int count)
	{
		HashMap require = new HashMap();
		require.put("limit", count);
		require.put("page", 1); // need for use selectList. not used.
		require.put("startNumber", 0);
		
		List list = communityService.selectList(require);
		System.out.println(list);
		return list;
	}
	@RequestMapping(value="/{no}", method = RequestMethod.GET)
	public String detail(@PathVariable int no
			,ModelMap model)
	{
		model.addAttribute("community",communityService.select(no));
		
		Map require = new HashMap();
		require.put("perPrefix",1);
		require.put("perSuffix",1);
		require.put("no",no);
		model.addAttribute("near", communityService.selectNear(require));
		return "community/detail";
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
		return communityService.selectNear(require);
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/{no}", method= RequestMethod.DELETE)
	public @ResponseBody boolean bbsDelete(@PathVariable int no
			,ModelMap model)
	{
		return communityService.delete(no);
	}
	
	@RequestMapping(value="/facebook")
	public @ResponseBody List facebookGetPosts()
	{
		FacebookAPI facebookAPI = FacebookAPI.getInstance();
		return facebookAPI.getPosts();
	}
	
	@RequestMapping(value="/naver/cafe/generate")
	public @ResponseBody String naverGenerate(HttpServletRequest request)
			throws OAuthMessageSignerException, OAuthNotAuthorizedException, OAuthExpectationFailedException, OAuthCommunicationException, IOException, URISyntaxException, HttpException
	{
		NaverAPI naverAPI = NaverAPI.getInstance();
		
		naverAPI.setCallback((String)request.getAttribute("FULLPATH")+NAVER_CAFE_URL+"/keygen");
		return naverAPI.getRequestTokenURL();
	}
	
	//시간 나면 사용자로부터 토큰 입력받기 구현
	@RequestMapping(value="/naver/cafe/keygen", method=RequestMethod.GET)
	public String naverKeygen(HttpServletRequest request
			,@RequestParam(value="oauth_token") String token
			,@RequestParam(value="oauth_verifier") String verifier
			,ModelMap map)
	{
		NaverAPI.getInstance().setAccessToken(verifier);
		return "redirect:/community/";
	}
	
	@RequestMapping(value="/naver/cafe/{clubId}", method=RequestMethod.GET)
	public @ResponseBody Object cafeRecentPosts(@PathVariable int clubId
			,@RequestParam(value="perPage",defaultValue="5") int perPage)
	{
		
		try {
			SAXReader reader = new SAXReader();
			InputStream is = new ByteArrayInputStream(NaverAPI.getInstance().getCafeRecentPosts(clubId, perPage).getBytes("UTF-8"));
			Document document = reader.read(is);
			Element root = document.getRootElement();
			Element result = root.element("result");
			Element error = root.element("error_code");
			if(error==null)
			{
				Element articles = result.element("articles");
				List list = new ArrayList();
				for(Iterator i = articles.elementIterator("article"); i.hasNext();)
				{
					Map map = new HashMap();
					Element articleElement = (Element) i.next();
					String articleId = articleElement.element("articleid").getStringValue();
					String subject = articleElement.element("subject").getStringValue();
					String newArticle = articleElement.element("newArticle").getText();
					map.put("articleId",articleId);
					map.put("subject",subject);
					map.put("newArticle",newArticle);
					list.add(map);
				}
				return list;
			}
			else
			{
				Map map = new HashMap();
				map.put("error",error.getStringValue());
				return map;
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/naver/blog/{blogId}", method=RequestMethod.GET)
	public @ResponseBody List blogRecentPosts(@PathVariable String blogId
			,@RequestParam(value="requestId") String requestId
			,@RequestParam(value="requestApiPw") String requestApiPw
			,@RequestParam(value="perPost") int perPost)
	{
		List result = (ArrayList) NaverAPI.getInstance().getBlogRecentPosts(blogId, requestId, requestApiPw, perPost);
		return result;
	}
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/write")
	public String showWriteForm(ModelMap model)
	{
		model.addAttribute("isWrite",true);
		if(model.get("community")==null)
		{
			model.addAttribute("community", new Community());
		}
		return "community/writeOrUpdateForm";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/update/{no}")
	public String showUpdateForm(
			@PathVariable int no
			,ModelMap model)
	{
		model.addAttribute("isWrite",false);
		model.addAttribute("community",communityService.select(no));
		return "community/writeOrUpdateForm";
	}
}

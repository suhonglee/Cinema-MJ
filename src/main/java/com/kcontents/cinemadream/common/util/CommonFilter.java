package com.kcontents.cinemadream.common.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CommonFilter implements Filter {
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse response,
			FilterChain fc) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		request = scriptFilter(request);
		addCommonParams(request);
		checkSession(request);
		fc.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
	
	public static void addCommonParams(HttpServletRequest request)
	{
		String context = request.getContextPath();
		request.setAttribute("CONTEXT", context);
//		로컬 테스트용 port 포함
//		request.setAttribute("FULLPATH", "http://"+request.getServerName()+":"+request.getServerPort()+context);
//		실개발용 port 미포함
		request.setAttribute("FULLPATH", "http://"+request.getServerName()+context);
	}
	
	public static void checkSession(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		if(session.getAttribute("isAdmin")==null)
		{
			session.setAttribute("isAdmin",false);
		}
		if(session.getAttribute("last_no")==null)
		{
			session.setAttribute("last_no",0);
		}
		if(session.getAttribute("last_bbs")!=null)
		{
			if(session.getAttribute("last_bbs").equals(""))
			{
				session.setAttribute("last_bbs", "default");
			}
		}
	}
	
	public static HttpServletRequest scriptFilter(HttpServletRequest request)
	{
		HttpRequestWithModifyParams newRequest = new HttpRequestWithModifyParams(request);
		Enumeration<String> e = newRequest.getParameterNames();
		while(e.hasMoreElements())
		{
			String paramName = e.nextElement();
			newRequest.setParameter(paramName, checkScript(newRequest.getParameter(paramName)));
		}
		return newRequest;
	}
	
	private static String checkScript(String obj)
	{
		obj = obj.replace("&", "&amp");
		obj = obj.replace("\\", "&quot;");
		obj = obj.replace("<", "&lt;");
		obj = obj.replace(">", "&gt;");
		obj = obj.replace("\n", "<br/>");
		return obj;
	}
}

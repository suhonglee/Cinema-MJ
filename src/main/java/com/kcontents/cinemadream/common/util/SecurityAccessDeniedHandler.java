package com.kcontents.cinemadream.common.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class SecurityAccessDeniedHandler implements AccessDeniedHandler {
	private int errorCode;
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException exception) throws IOException, ServletException {
		String errorMessage="";
		switch(errorCode)
		{
			case 403:
				errorMessage="접근 권한이 없습니다";
				break;
			default:
				errorMessage="접근이 금지되었습니다";
				break;
		}
		Enumeration e = request.getHeaderNames();
		while(e.hasMoreElements())
		{
			String name = (String) e.nextElement();
			System.out.println(name + " :: " + request.getParameter(name));
		}
		request.setAttribute("errorMessage", errorMessage);
		request.getRequestDispatcher("/showError").forward(request, response);
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	
}

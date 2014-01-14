package com.kcontents.cinemadream.common.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class HttpRequestWithModifyParams extends HttpServletRequestWrapper {

	private HashMap params;
	public HttpRequestWithModifyParams(HttpServletRequest request) 
	{
		super(request);
		this.params = new HashMap(request.getParameterMap());
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String getParameter(String name) 
	{
		String returnValue = null;
		String[] paramArray = getParameterValues(name);
		if(paramArray != null && paramArray.length > 0)
		{
			returnValue = paramArray[0];
		}
		return returnValue;
	}
	
	@Override
	public Map getParameterMap() 
	{
		return Collections.unmodifiableMap(params);
	}
	
	@Override
	public String[] getParameterValues(String name) 
	{
		String[] result = null;
		String[] temp = (String[])params.get(name);
		if(temp != null)
		{
			result = new String[temp.length];
			System.arraycopy(temp, 0, result, 0, temp.length);
		}
		return result;
	}
	
	public void setParameter(String name, String value)
	{
		String[] oneParam = {value};
		setParameter(name, oneParam);
	}
	
	public void setParameter(String name, String[] values)
	{
		params.put(name, values);
	}

}

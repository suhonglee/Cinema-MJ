package com.kcontents.cinemadream;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

public class Translater {
	private static Translater translater;
	
	private Translater() {}

	public static Translater getInstance()
	{
		if(translater==null)
		{
			translater = new Translater();
		}
		return translater;
	}
	
	//test용
	public List translateForAllSupportedLanguage(int sendLan, String message)
	{
		List list = new ArrayList();
		for(int i=0;i<11;i++)
		{
			if(sendLan!=i)
			{
				list.add(translate(sendLan, i, message, "<div dir=\"ltr\" class=\"t0\">", "</div>"));
			}
		}
		return list;
	}
	public String translate(int sendLan, int targetLan, String keyword, String startKey, String endKey)
	{
		String subs="";
		try {
			String translateURL = "http://translate.google.co.kr/m";
			String searchKeyword = URLEncoder.encode(keyword,"UTF-8");
			HttpGet get = new HttpGet(translateURL+"?hl="+Language.getCountryCode(sendLan)
													+"&sl="+Language.getCountryCode(sendLan)
													+"&tl="+Language.getCountryCode(targetLan)
													+"&ie=UTF-8&prev=_m&q="+searchKeyword);
			HttpClient client= new DefaultHttpClient();
			HttpResponse response = client.execute(get);
			String encoding = response.getFirstHeader("Content-Type").getValue().substring(19);
			InputStream is = response.getEntity().getContent();
			Reader reader = new BufferedReader(new InputStreamReader(is, encoding));
			
			int readResult;
			char[] chars = new char[1024];
			StringBuffer buffer = new StringBuffer();
			while((readResult = reader.read(chars)) != -1)
			{
				buffer.append(chars, 0, readResult);
			}
			
			subs = buffer.substring(buffer.indexOf(startKey));
			return subs.substring(startKey.length(), subs.indexOf(endKey));
			
			//this is test code. insert 
			/*File file = new File("C:\\Users\\slbi\\"+targetLan+".html");
			file.createNewFile();
			FileOutputStream fos = new FileOutputStream(file);
			String j = buffer.substring(buffer.indexOf(startKey));
			j = j.substring(startKey.length(), j.indexOf(endKey));
			String temp = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\"></head><body>"+j+"</body></html>";
			fos.write(temp.getBytes());
			fos.close();*/
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subs;
	}
}

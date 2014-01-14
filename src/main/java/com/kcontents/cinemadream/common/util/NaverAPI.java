package com.kcontents.cinemadream.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Vector;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import oauth.signpost.OAuth;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.OAuthProvider;
import oauth.signpost.basic.DefaultOAuthConsumer;
import oauth.signpost.basic.DefaultOAuthProvider;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;
import org.apache.xmlrpc.client.XmlRpcCommonsTransportFactory;
import org.apache.xmlrpc.client.XmlRpcSun14HttpTransport;
import org.apache.xmlrpc.client.XmlRpcSunHttpTransport;
import org.apache.xmlrpc.client.XmlRpcTransport;
import org.apache.xmlrpc.client.XmlRpcTransportFactory;

public class NaverAPI{
	private static final String NAVER_BLOG_URL = "https://api.blog.naver.com/xmlrpc";
	
	private static final String REQUEST_TOKEN_URL = "https://nid.naver.com/naver.oauth?mode=req_req_token";
	private static final String AUTHORIZE_URL = "https://nid.naver.com/naver.oauth?mode=auth_req_token";
	private static final String ACCESS_TOKEN_URL = "https://nid.naver.com/naver.oauth?mode=req_acc_token";
	private static final String CONSUMER_KEY = "GNFGV5QAzfAlRQTHxm22";
	private static final String CONSUMER_SECRET = "Vef9w8GJ8K";
	private static final String CALL_URL = "http://nid.naver.com/naver.oauth";
	
	private static OAuthProvider provider = new DefaultOAuthProvider(REQUEST_TOKEN_URL, ACCESS_TOKEN_URL, AUTHORIZE_URL);
	private static OAuthConsumer consumer = new DefaultOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);
	private static String CALLBACK = "oob";
	private static final String NONCE=""+new Date().getTime();
	private static final String SIGNATURE_METHOD="HMAC-SHA1";
	private static final String TIMESTAMP= ""+Calendar.getInstance().getTimeInMillis()/1000;
	private static final String VERSION="1.0";
	private static NaverAPI naverAPI = null;
	
	public static NaverAPI getInstance()
	{
		if(naverAPI==null)
		{
			naverAPI = new NaverAPI();
		}
		return naverAPI;
	}
	
	
	private NaverAPI() {
	}


	public void setCallback(String callbackURL)
	{
		CALLBACK = callbackURL;
	}
	
	public Object getBlogRecentPosts(String blogId, String requestId, String requestApiPw, int perPost)
	{
		try {
			XmlRpcClientConfigImpl xrcConf = new XmlRpcClientConfigImpl();
				xrcConf.setServerURL(new URL(NAVER_BLOG_URL));
			xrcConf.setBasicEncoding("UTF-8");
			xrcConf.setEncoding("UTF-8");
			XmlRpcClient xrc = new MyXmlRpcClient();
			xrc.setConfig(xrcConf);
			
			Vector params = new Vector();
			params.addElement(blogId); //blogId
			params.addElement(requestId); //naverId
			params.addElement(requestApiPw); //apiPw
			params.addElement(perPost); //per count
			
			Object[] resultData = (Object[]) xrc.execute("metaWeblog.getRecentPosts",params);
			List result = new ArrayList(Arrays.asList(resultData));
			
			return result;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String getCafeRecentPosts(int clubId, int perPage)
	{
		URL url;
		StringBuffer buffer = new StringBuffer();
		try {
			url = new URL("http://openapi.naver.com/cafe/getArticleList.xml?search.clubid="+clubId+"&search.perPage="+perPage);
			HttpURLConnection request = (HttpURLConnection) url.openConnection();
			consumer.sign(request);
			request.connect();
			InputStream is = request.getInputStream();
			Scanner scann = new Scanner(is, "UTF-8");
			while(scann.hasNextLine())
			{
				buffer.append(scann.nextLine());
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthMessageSignerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthExpectationFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthCommunicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buffer.toString();
	}
	
	public String getRequestTokenURL()
	{
		try {
			return provider.retrieveRequestToken(consumer, CALLBACK);
		} catch (OAuthMessageSignerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthNotAuthorizedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthExpectationFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthCommunicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void setAccessToken(String accessToken)
	{
		try {
			provider.retrieveAccessToken(consumer, accessToken);
		} catch (OAuthMessageSignerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthNotAuthorizedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthExpectationFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (OAuthCommunicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//실컷 만들어놔도 안쓰인다. ㅡㅡ
	public String makeSignature() throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException
	{
		String signatureBaseString=OAuth.percentEncode("GET")
				+"&"
				+OAuth.percentEncode(CALL_URL)
				+"&"
				+OAuth.percentEncode("oauth_callback")
				+"="
				+OAuth.percentEncode(CALLBACK)
				+"&"
				+OAuth.percentEncode("oauth_consumer_key")
				+"="
				+OAuth.percentEncode(CONSUMER_KEY)
				+"&"
				+OAuth.percentEncode("oauth_nonce")
				+"="
				+OAuth.percentEncode(NONCE)
				+"&"
				+OAuth.percentEncode("oauth_signature_method")
				+"="
				+OAuth.percentEncode(SIGNATURE_METHOD)
				+"&"
				+OAuth.percentEncode("oauth_timestamp")
				+"="
				+OAuth.percentEncode(TIMESTAMP)
				+"&"
				+OAuth.percentEncode("oauth_version")
				+"="
				+OAuth.percentEncode(VERSION);
		SecretKey key = null;
		if(key==null)
		{
				String keyString = OAuth.percentEncode(CONSUMER_SECRET)+"&";
				//+OAuth.percentEncode(TOKEN_SECRET)을 해주어야하나 키발급단계에선 없기에 생략.
				byte[] keyBytes = Base64.encodeBase64(keyString.getBytes());
				key = new SecretKeySpec(keyBytes, "HmacSHA1");
		}
		Mac mac = Mac.getInstance("HmacSHA1");
		mac.init(key);
		return new String(Base64.encodeBase64(mac.doFinal(signatureBaseString.getBytes())));
	}
}

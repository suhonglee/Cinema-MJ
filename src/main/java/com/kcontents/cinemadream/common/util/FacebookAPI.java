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
import org.json.JSONArray;
import org.json.JSONObject;

public class FacebookAPI{
	private static FacebookAPI facebookAPI = null;
	private static String CLIENT_ID = "570320393052744";
	private static String CLIENT_SECRET="aece89bd56ad982850b24f792352cd11";
	private static String REDIRECT_URI="http://1.214.125.167:8080/cinemadream/";
	
	public class Post{
		private String message;
		private String link;
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("Post [message=").append(message).append(", link=")
					.append(link).append("]");
			return builder.toString();
		}
	}
	private String getAccessToken()
	{
		URL url;
		InputStream is = null;
		try {
			url = new URL("https://graph.facebook.com/oauth/access_token"
					+"?client_id="+CLIENT_ID
					+"&client_secret=" +CLIENT_SECRET
					+"&grant_type=client_credentials");
			HttpURLConnection request = (HttpURLConnection) url.openConnection();
			is = request.getInputStream();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result;
		StringBuffer buffer = new StringBuffer();
		Scanner scan = new Scanner(is, "UTF-8");
		while(scan.hasNextLine())
		{
			buffer.append(scan.nextLine());
		}
		String access_token = buffer.substring(13);
		return access_token;
	}
	
	public List getPosts()
	{
		URL url;
		InputStream is = null;
		String access_token = getAccessToken();
		try {
			url = new URL("https://graph.facebook.com/CinemaDream2012/posts"
					+"?access_token="+access_token
					+"&locale=ko_KR"
					+"&limit=300");
			HttpURLConnection request = (HttpURLConnection) url.openConnection();
			is = request.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		StringBuffer buffer = new StringBuffer();
		Scanner scan = new Scanner(is, "UTF-8");
		while(scan.hasNextLine())
		{
			buffer.append(scan.nextLine());
		}
		JSONObject obj = new JSONObject(buffer.toString());
		JSONArray array = obj.getJSONArray("data");
		List<Post> postList = new ArrayList<Post>();
		for(int i=1;i<array.length();i++)
		{
			JSONObject ob = (JSONObject) array.get(i);
			System.out.println(ob);
			if(ob.has("message"))
			{
				Post post = new Post();
				post.message = ob.getString("message");
				if(post.message.length()>50)
				{
					post.message = post.message.substring(0, 50)+"....";
				}
				post.link = ob.getString("link");
				postList.add(post);
			}
		}
		return postList;
	}
	
	public static FacebookAPI getInstance()
	{
		if(facebookAPI==null)
		{
			facebookAPI = new FacebookAPI();
		}
		return facebookAPI;
	}
	
	private FacebookAPI() {}
}

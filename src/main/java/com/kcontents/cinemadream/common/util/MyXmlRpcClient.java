package com.kcontents.cinemadream.common.util;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.XmlRpcRequest;
import org.apache.xmlrpc.client.XmlRpcClient;

public class MyXmlRpcClient extends XmlRpcClient {

	@Override
	public Object execute(XmlRpcRequest pRequest) throws XmlRpcException {
		
		Object obj = super.execute(pRequest);
		System.out.println(obj);
		return obj;
	}
	
}

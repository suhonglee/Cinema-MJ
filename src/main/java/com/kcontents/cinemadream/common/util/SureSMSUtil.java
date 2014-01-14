package com.kcontents.cinemadream.common.util;

import java.util.Calendar;

import surem.api.sms.SureSMSAPI;
import surem.api.tcp.sms.SureSMSDeliveryReport;
import surem.api.tcp.sms.SureSMSSendReport;

public class SureSMSUtil {
	public static final String TEL1 = "010";
	public static final String TEL2 = "8981";
	public static final String TEL3 = "0805";
//	public static final String TEL2 = "9489";
//	public static final String TEL3 = "4548";
	
	public static boolean sendBbsSMS(String writer, String title, String category, String sendTel1, String sendTel2, String sendTel3, String receiveTel1, String receiveTel2, String receiveTel3)
	{
		SureSMSAPI sms = new SureSMSAPI() {
			@Override
			public void report(SureSMSDeliveryReport dr) {
				System.out.print("msgkey="+dr.getMember()+"\t");	// 메시지 고유값
				System.out.print("result="+dr.getMember()+"\t");	// '2': 전송 결과 성공.  '4': 전송 결과 실패
				System.out.print("errorcode="+dr.getErrorCode()+"\t");	// 결과 코드 
				System.out.print("recvtime="+dr.getRecvDate()+dr.getRecvTime()+"\t");	// 단말기 수신 시간
				System.out.println();
			}
		};
		if(writer.length() > 5) writer = writer.substring(0, 5)+"..";
		if(title.length() > 15) title = title.substring(0,15)+"...";
		Calendar calendar = Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		StringBuffer when = new StringBuffer();
		when.append(date.getYear()+1900);
		if((date.getMonth()+1)<10) when.append("0");
		when.append(date.getMonth()+1);
		if(date.getDate()<10) when.append("0");
		when.append(date.getDate());
		
		SureSMSSendReport sr = sms.sendMain(Integer.parseInt(when.toString())
				, "finalgoku1"
				, "47-Y9L-4A"
				, "시네마드림"
				, sendTel1, sendTel2, sendTel3
				, "시네마드림"
				, receiveTel1, receiveTel2, receiveTel3
				, writer+"님의 "+category+" 글["+title+"]이 접수되었습니다. -CinemaMJ"
				, "00000000"
				, "000000");
		System.out.println("STATUS CODE :: " + sr.getStatus());
		if(sr.getStatus().equals("O")) return true;
		else return false;
	}
	
	public static boolean sendReplySMS(String writer, String title, String category, String sendTel1, String sendTel2, String sendTel3, String receiveTel1, String receiveTel2, String receiveTel3)
	{
		SureSMSAPI sms = new SureSMSAPI() {
			@Override
			public void report(SureSMSDeliveryReport dr) {
				System.out.print("msgkey="+dr.getMember()+"\t");	// 메시지 고유값
				System.out.print("result="+dr.getMember()+"\t");	// '2': 전송 결과 성공.  '4': 전송 결과 실패
				System.out.print("errorcode="+dr.getErrorCode()+"\t");	// 결과 코드 
				System.out.print("recvtime="+dr.getRecvDate()+dr.getRecvTime()+"\t");	// 단말기 수신 시간
				System.out.println();
			}
		};
		if(writer.length() > 5) writer = writer.substring(0, 5)+"..";
		if(title.length() > 8) title = title.substring(0,15)+"...";
		Calendar calendar = Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		StringBuffer when = new StringBuffer();
		when.append(date.getYear()+1900);
		if((date.getMonth()+1)<10) when.append("0");
		when.append(date.getMonth()+1);
		if(date.getDate()<10) when.append("0");
		when.append(date.getDate());
		
		SureSMSSendReport sr = sms.sendMain(Integer.parseInt(when.toString())
				, "finalgoku1"
				, "47-Y9L-4A"
				, "시네마드림"
				, sendTel1, sendTel2, sendTel3
				, "시네마드림"
				, receiveTel1, receiveTel2, receiveTel3
				, writer+"님의 "+category+" 글["+title+"]에 답변이 등록되었습니다. -CinemaMJ"
				, "00000000"
				, "000000");
		System.out.println("STATUS CODE :: " + sr.getStatus());
		if(sr.getStatus().equals("O")) return true;
		else return false;
	}
}

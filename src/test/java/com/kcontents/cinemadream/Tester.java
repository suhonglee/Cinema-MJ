package com.kcontents.cinemadream;

public class Tester {
	public static void main(String[] args) {
//		String message ="﻿안녕하세요 커빙이에요~ :) 오늘은 여행블로그를 준비해 보았어요 !! ﻿2013년이 한 달도 채 남지 않은 이 시점!! 연말 행복하게 보내고 있나요? 커빙이가 준비한 이번 여행은, 한 해를 정리하면서 괜스레 울적해진 마음을 달래기 위한 여행! 낭만 가득, 겨울 바다!바로 ‘정동진’입니다!!";
		String message = "Hello there! I am keobing";
		int send = Language.ENGLISH;
		Translater t = Translater.getInstance();
		t.translateForAllSupportedLanguage(send, message);
		/*System.out.println(t.translate(send
				, Language.ENGLISH
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.CHINESECN
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.CHINESETW
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.JAPANESE
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.GERMAN
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.FRENCH
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.SPANISH
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.PORTUGUESE
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.ITALIAN
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));
		System.out.println(t.translate(send
				, Language.GREEK
				, message
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>"));*/
	}
}

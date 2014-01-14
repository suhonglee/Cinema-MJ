package com.kcontents.cinemadream;

public class Language {
	
	private int countryNo;
	public String countryCode;
//	public String encoding;
	
	public static final int KOREAN = 0;
	public static final int ENGLISH = 1;
	public static final int CHINESECN = 2;
	public static final int CHINESETW = 3;
	public static final int JAPANESE = 4;
	public static final int GERMAN = 5;
	public static final int FRENCH = 6;
	public static final int SPANISH = 7;
	public static final int PORTUGUESE = 8;
	public static final int ITALIAN = 9;
	public static final int GREEK = 10;
	
	private static final String Korean = "ko";
	private static final String English = "en";
	private static final String ChineseCN = "zh-CN";
	private static final String ChineseTW = "zh-TW";
	private static final String Japanese = "ja";
	private static final String German = "de";
	private static final String French = "fr";
	private static final String Spanish = "es";
	private static final String Portuguese ="pt";
	private static final String Italian = "it";
	private static final String Greek = "el";
	/*보내는 언어에 따라 받는 인코딩이 달라지므로 주석처리함.
	private static final String E_Korean = "ms949";
	private static final String E_English = "UTF-8";
	private static final String E_ChineseCN ="GB2312";
	private static final String E_ChineseTW ="UTF-8";
	private static final String E_Japanese = "Shift_JIS";
	private static final String E_German ="UTF-8";
	private static final String E_French ="UTF-8";
	private static final String E_Spanish ="UTF-8";
	private static final String E_Portuguese ="UTF-8";
	private static final String E_Italian ="UTF-8";*/
	
	private Language(int countryNo, String countryCode)
	{
		this.countryNo = countryNo;
		this.countryCode = countryCode;
//		this.encoding = encoding;
	}
	
	public static String getCountryCode(int code)
	{
		String countryCode = null;
		switch(code)
		{
		case KOREAN:
			countryCode = Korean;
			break;
		case ENGLISH:
			countryCode = English;
			break;
		case CHINESECN:
			countryCode = ChineseCN;
			break;
		case CHINESETW:
			countryCode = ChineseTW;
			break;
		case JAPANESE:
			countryCode = Japanese;
			break;
		case GERMAN:
			countryCode = German;
			break;
		case FRENCH:
			countryCode = French;
			break;
		case SPANISH:
			countryCode = Spanish;
			break;
		case PORTUGUESE:
			countryCode = Portuguese;
			break;
		case ITALIAN:
			countryCode = Italian;
			break;
		case GREEK:
			countryCode = Greek;
			break;
		}
		return countryCode;
	}
	
	public static Language get(int code)
	{
		String countryCode = null;
//		String encoding = null;
		
		switch(code)
		{
		case KOREAN:
			countryCode = Korean;
//			encoding = E_Korean;
			break;
		case ENGLISH:
			countryCode = English;
//			encoding = E_English;
			break;
		case CHINESECN:
			countryCode = ChineseCN;
//			encoding = E_ChineseCN;
			break;
		case CHINESETW:
			countryCode = ChineseTW;
//			encoding = E_ChineseTW;
			break;
		case JAPANESE:
			countryCode = Japanese;
//			encoding = E_Japanese;
			break;
		case GERMAN:
			countryCode = German;
//			encoding = E_German;
			break;
		case FRENCH:
			countryCode = French;
//			encoding = E_French;
			break;
		case SPANISH:
			countryCode = Spanish;
//			encoding = E_Spanish;
			break;
		case PORTUGUESE:
			countryCode = Portuguese;
//			encoding = E_Portuguese;
			break;
		case ITALIAN:
			countryCode = Italian;
//			encoding = E_Italian;
			break;
		case GREEK:
			countryCode = Greek;
			break;
		}
		return new Language(code, countryCode);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Language [countryCode=").append(countryCode).append("]");
		return builder.toString();
	}
	
	
	
	/*public static void main(String[] args) {
		String resultValue = Translater.getInstance()
		.translate(Translater.ENGLISH
				, Translater.KOREAN
				, "elephant"
				, "<div dir=\"ltr\" class=\"t0\">"
				, "</div>");
		System.out.println(resultValue);
	}*/
}

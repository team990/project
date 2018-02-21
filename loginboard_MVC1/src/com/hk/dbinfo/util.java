package com.hk.dbinfo;

public class util {

	public static String jsForward(String msg, String url){
	String str= "<script type='text/javascript'>"
		+	"alert('"+msg+"');"
		+	"location.href='"+url+"';"
		+ "</script>";
	return str;
	
	}
}

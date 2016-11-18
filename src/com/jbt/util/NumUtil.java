package com.jbt.util;


/**
 * 主要用于生成各种激活码,校验码,GUID等等
 * @author DuoNuo
 *
 */
public class NumUtil {
	
	//随机生成指定位数的随机字符串
	public static String getRandomCode(int len){
		StringBuffer key = new StringBuffer();
		String chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		while(key.length()<len){
			key.append(chars.charAt((int)(Math.random()*62)));
		}		
		return key.toString();
	}
	public static String getRandomTelCode(int len){
		StringBuffer key = new StringBuffer();
		String chars = "0123456789";
		while(key.length()<len){
			key.append(chars.charAt((int)(Math.random()*9)));
		}		
		return key.toString();
	}

}

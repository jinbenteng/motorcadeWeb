/******************************************************************************
 * Copyright (C) 2013 GE All rights reserved.
 ******************************************************************************/
package com.jbt.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
public class DateUtil {

	public static final String DATE_FORMAT = "dd.MM.yyyy";
	
	public static final String DATE_FORMAT_1 = "MM/dd/yyyy";
	
	public static final String DATE_FORMAT_2 = "yyyy-MM-dd";
	
	public static final String DATE_FORMAT_3 = "yyyy-MM-dd HH:mm:ss" ;
	
	public static final String DATE_FORMAT_4 = "HH:mm" ;
	
	public static final String DATE_FORMAT_5 = "yyyy-MM-dd-HH-mm-ss" ;
	
	public static final String DATE_FORMAT_6 = "HH:mm:ss" ;
	
	/**
	 * Get current date.
	 * @return
	 
	public static String getCurrentDate(){
		return getCurrentDate(DATE_FORMAT);
	}
	*/
	public static String getNow(){
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_3);
        return sdf.format(Calendar.getInstance().getTime());
	}
	
	public static long getCurrentTimeMillis(){
	    return System.currentTimeMillis();  
	}
	
	public static String getCurrentDate(String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(Calendar.getInstance().getTime());
    }
	
	public static String getCurrentDate(String dateFormat,long currentTimeMillis){
        String datesString = "";
        java.util.Date date = new java.util.Date(currentTimeMillis);
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        datesString = sdf.format(date);
        return datesString;
    }
	/**
	 * 
	 * @param afterDay
	 * @return
	 */
	public static String getAfterDate(int afterDay){
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, afterDay);
		return sdf.format(calendar.getTime());
	}
	
	/**
	 * 
	 * @param afterYear
	 * @return
	 */
	public static String getAfterYear(int afterYear){
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_3);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.YEAR, afterYear);
		return sdf.format(calendar.getTime());
	}
	
	/**
	 * convert the give date string to Date object with the given format
	 * 
	 * @param dateString
	 * @param formatStr
	 */
	public static Date stringToDate(String dateString, String formatStr) {
		SimpleDateFormat format = new SimpleDateFormat();
		Date date = null;
		try {
			date = format.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 比较三个时间段大小
	 */
	public static boolean compairTime(String statrTime,String endTime)
	{
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_6);
        String now = sdf.format(Calendar.getInstance().getTime());
		String[] d = statrTime.split(":");
		String[] e = now.split(":");
		String[] f = endTime.split(":");
		int i = Integer.parseInt((d[0])) * 60 * 60 + Integer.parseInt((d[1])) * 60
				+ Integer.parseInt((d[2]));
		int n = Integer.parseInt((e[0])) * 60 * 60 + Integer.parseInt((e[1])) * 60
				+ Integer.parseInt((e[2]));
		int g = Integer.parseInt((f[0])) * 60 * 60 + Integer.parseInt((f[1])) * 60
				+ Integer.parseInt((f[2]));
		if (n >= i && n <= g)
			return true;
		return false;
		
	}
}

/*******************************************************************************
 * Revision History [type 'revision' & press Alt + '/' to insert revision block]
 * 
 * [Revision on 2012-4-7 2:09:09 by Cuckoo]<BR>
 * Create a tool for Date.
 * Copyright 2011 Cuckoo Systems All rights reserved.
 ******************************************************************************/

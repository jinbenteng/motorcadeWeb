package com.jbt.util;

import java.util.Random;

public class MathUtil {
	
	

	//获取0 - max之间的随机整数
	public static int getRandomNum(int max){
		return new Random().nextInt(max);
	}
	
	//获取min - max之间的随机整数
	public static int getRandomNum(int min , int max){
		return new Random().nextInt(max - min) + min;
	}
	
}

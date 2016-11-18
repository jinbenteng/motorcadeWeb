package com.jbt.util;

import net.sf.json.JSONObject;

public class JSONTest {
public static void main(String[] args) {
	JSONObject json = new JSONObject();
	json.put("sd", "sd");
	System.out.println(json.toString());
}
}

package com.jbt.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;


public class MessageUtil {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(sendMessage("18611551449","呵呵哒"));
		System.out.println(sendMessage("1861155","呵呵哒"));
	}
	public static boolean sendMessage(String telno,String msg) throws Exception{
		try {
			String param = "id=075585537300" + "&pwd=x285857" + "&to="
					+ telno + "&content=" + msg + "&time="
					+ DateUtil.getCurrentDate(DateUtil.DATE_FORMAT_3);
			URL url = new URL(
					"http://service.winic.org:8009/sys_port/gateway/index.asp");
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);
			OutputStreamWriter out = new OutputStreamWriter(
					connection.getOutputStream(), "GB2312");
			out.write(param); // 向页面传递数据。post的关键所在！
			out.flush();
			out.close();

			connection.connect();

			// 发送数据到服务器并使用Reader读取返回的数据
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(connection.getInputStream()));
			String lines = reader.readLine();
			reader.close();
			connection.disconnect();
			return lines.startsWith("000");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}

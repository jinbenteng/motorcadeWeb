package com.jbt.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

public class TCPUtil {
	
	public static void main(String[] args) throws IOException {
		sendOrder("localhost",9999,"1234567812345678");
	}
	private final static Logger logger = LoggerFactory.getLogger(TCPUtil.class);
	
	public static boolean sendOrder(String ip,int port,String sn) throws IOException{
		logger.info("sn: '" + sn + "' send order to :" + ip + ":" + port);
		Socket client = null;
		try {
			client = new Socket(); 
			client.connect(new InetSocketAddress(ip, port), 200);
			byte[] msg = getMsg(sn);
			OutputStream os = client.getOutputStream();
			os.write(msg);
			os.flush();
			BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));
			String result = br.readLine();
			logger.info("recv msg : " + result);
			if(result != null && result.equals("success")){
				return true; 
			}
			return false;
		} catch (Exception e) {
			logger.error("send order error:" + e.getMessage());
			return false;
		}finally{
			if(client != null){  
				//如果构造函数建立起了连接，则关闭套接字，如果没有建立起连接，自然不用关闭  
				client.close(); //只关闭socket，其关联的输入输出流也会被关闭  
			}
		}
	}

	//7E 01 11 00 10   01 86 11 55 14   49 00 01 31 32   33 34 35 36 37   38 31 32 33 34   35 36 37 38 9F   7E
	private static byte[] getMsg(String sn) {
		// TODO Auto-generated method stub
		byte[] model = new byte[]{0x7E ,0x01 ,0x11 ,0x00 ,0x10 ,0x01 , 0x33 ,0x11 ,0x55 ,0x14 ,0x49 ,0x00 ,0x01};
		byte[] b = new byte[31];
		for (int i = 0; i < model.length; i++) {
			b[i] = model[i];
		}
		byte[] snArr = sn.getBytes();
		for (int i = 0; i < 16; i++) {
			b[13 + i] = snArr[i];
		}
		byte checkCode = b[0];
		for (int i = 1; i < b.length; i++) {
			checkCode ^= b[i];
		}
		b[29] = checkCode;
		b[30] = 0x7e;
		return b;
	}

}

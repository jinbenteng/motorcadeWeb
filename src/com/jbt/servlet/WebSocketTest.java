package com.jbt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONArray;

import org.springframework.web.context.ContextLoader;

import com.jbt.service.CarMsgInfoService;


@ServerEndpoint("/websocket")
public class WebSocketTest {
private int serviceno = 0;
private int sectorId = 0;
private String sn;
private Timer timer;
//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
//private static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<WebSocketTest>();
 
//与某个客户端的连接会话，需要通过它来给客户端发送数据
private Session session;
  
  
  @OnMessage
  public void onMessage(String  message,Session session)
    throws IOException, InterruptedException {
	  this.session = session;
	  String[] s = message.split("&");
	  serviceno = Integer.parseInt(s[0]);
	  switch (serviceno) {
	case 1:
		sectorId = Integer.parseInt(s[1]);
		showAll();
		break;
	case 4:
		sn = s[1];
		showCar();
		break;
	case 3:
		onClose();
		break;
	default:
		break;
	}
	 
  }
  /**
   * 根据部门或者单个车显示所有车辆
   * @param sectorId
   */
  public void showAll()
  {	  
		timer = new Timer();
		TimerTask task = new TimerTask() {

			@Override
			public void run() {

				CarMsgInfoService carMsgInfoService = (CarMsgInfoService) ContextLoader
						.getCurrentWebApplicationContext().getBean(
								"CarMsgInfoService");
				List<Map<?, ?>> carList = carMsgInfoService
						.searchBySnList(sectorId);
				String str = JSONArray.fromObject(carList).toString();
				try {
					session.getBasicRemote().sendText(str);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		};
		timer.schedule(task, 0, 10000);// 10秒一次

  }
  
  /**
   * 根据SN查询单个车辆
   * @param sn
   */
  public void showCar()
  {	  
		timer = new Timer();
		TimerTask task = new TimerTask() {

			@Override
			public void run() {

				CarMsgInfoService carMsgInfoService = (CarMsgInfoService) ContextLoader
						.getCurrentWebApplicationContext().getBean(
								"CarMsgInfoService");
				Map<?, ?> carList = carMsgInfoService
						.searchBySn1(sn);
				String str = JSONArray.fromObject(carList).toString();
				try {
					session.getBasicRemote().sendText(str);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		};
		timer.schedule(task, 0, 10000);// 10秒一次

  }
  
   
  @OnOpen
  public void onOpen(Session session) {
    System.out.println("Client connected");
  }
 
  @OnClose
  public void onClose() {
    System.out.println("Connection closed");
    timer.cancel(); 
  }
}

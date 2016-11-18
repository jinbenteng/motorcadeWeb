package com.jbt.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jbt.bean.MessageInfo;
import com.jbt.dao.MessageInfoMapper;
import com.jbt.service.MessageInfoService;
import com.jbt.util.ConfigUtil;
import com.jbt.util.MessageUtil;
import com.jbt.util.NumUtil;

@Service("MessageInfoService")
public class MessageInfoServiceImpl implements MessageInfoService {
	private final Logger log = LoggerFactory.getLogger(MessageInfoServiceImpl.class);
	@Resource
	private MessageInfoMapper MessageInfoMapper;
	
	public int deleteByPrimaryKey(Integer id) {

		return this.MessageInfoMapper.deleteByPrimaryKey(id);
	}

	public int insert(MessageInfo record) {

		return this.MessageInfoMapper.insert(record);
	}

	public int insertSelective(MessageInfo record) {

		return this.MessageInfoMapper.insertSelective(record);
	}

	public MessageInfo selectByPrimaryKey(Integer id) {

		return this.MessageInfoMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(MessageInfo record) {

		return this.MessageInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(MessageInfo record) {

		return this.MessageInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public JSONObject getTelMessageCode(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		JSONObject obj = new JSONObject();
		String tel = request.getParameter("tel");

		//判断参数是否为空以及数字型参数格式是否正确
		if(ConfigUtil.isNull(tel)){
			obj.put("resultCode","0001");
			return obj;
		}
		//发送短信并保存到数据库
		MessageInfo msg = new MessageInfo();
		String code = NumUtil.getRandomTelCode(6);
		try{
			String str = "注册校验码 ：" + code + "请及时完成注册。";
			if(MessageUtil.sendMessage(tel, str)){
				msg.setTel(tel);
				msg.setData(str);
				msg.setType(0);
				msg.setState(0);//默认可用
				insert(msg);
				log.info("send "+ code +" to " + tel + "suc .");
			}else{
				log.error("send "+ code +" to " + tel + "error .");
				obj.put("resultCode", "0002");
				return obj;
			}
		}catch(Exception e){
			log.error("insert essage error ." + e.getMessage());
		}
		obj.put("msgCode", code);
		obj.put("resultCode","0000");
		return obj;		
	}

}

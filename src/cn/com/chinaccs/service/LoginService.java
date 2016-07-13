package cn.com.chinaccs.service;

import java.io.Serializable;

import cn.com.chinaccs.bean.entity.TNLoginLog;
import cn.com.chinaccs.dao.impl.LoginDao;

public class LoginService extends BaseService{
	
	public String saveLoginLog(TNLoginLog loginLog){
		String logMsg = "登陆日志保存失败";
		LoginDao dao = new LoginDao();
		Serializable id =  dao.save(loginLog);
		if(null != id) 
			logMsg= "登陆日志保存成功";	
		return logMsg;
	}

}

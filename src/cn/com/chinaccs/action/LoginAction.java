package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.bean.entity.TNLoginLog;
import cn.com.chinaccs.service.LoginService;
import cn.com.chinaccs.service.UserService;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.utils.SystemConstant;

public class LoginAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5594617329480307768L;

	private String userName;
	private String password;
	private String code;
	
	public String execute() throws Exception {
		String result = FAIL;
		/** 验证码登录
		if(!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(password) && !StringUtil.isEmpty(code)) {
			Object codeObj = getSessionByKey(SESSION_CAPTCHA_LOGIN);
			msg = "验证码输入错误";
			if(null != codeObj && code.equalsIgnoreCase(codeObj.toString())) {
				msg = "用户名或密码错误";
				UserService userServ = new UserService();
				chResponse = userServ.login(userName, password);
				if(OP_SUCCESS.equals(chResponse.getResult())) {
					userInfo = (UserInfo)chResponse.getData();
					msg = "用户登录成功";
					setUserToSession(userInfo);
					result = INDEX;
				}
			}
				
				String ip  = getRequest().getRemoteAddr();
				String loginMode = TNLoginLog.MODE_WEB;
				Integer state = Integer.parseInt(chResponse.getResult());
				String userId = "";
				if(state ==1)
					userId = StringUtil.handNull(userInfo.getId());

				TNLoginLog loginLog = new TNLoginLog();
				loginLog.setIp(ip);
				loginLog.setLoginMode(loginMode);
				loginLog.setMsg(msg);
				loginLog.setState(state);
				loginLog.setUserName(userName);
				loginLog.setUserId(userId);
				LoginService logServ = new LoginService();
				String logMsg = logServ.saveLoginLog(loginLog);
				log.info(logMsg);
		}**/
		//取消验证码
		if(!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(password)) {
				msg = "用户名或密码错误";
				UserService userServ = new UserService();
				chResponse = userServ.login(userName, password);
				if(OP_SUCCESS.equals(chResponse.getResult())) {
					userInfo = (UserInfo)chResponse.getData();
					msg = "用户登录成功";
					setUserToSession(userInfo);
					if(userInfo.getIsPortal().equals(SystemConstant.USER_TYPE_PORTAL)){
						result = PORTAL;
					}else
						result = INDEX;
				}
				String ip  = getRequest().getRemoteAddr();
				String loginMode = TNLoginLog.MODE_WEB;
				Integer state = Integer.parseInt(chResponse.getResult());
				String userId = "";
				if(state ==1)
					userId = StringUtil.handNull(userInfo.getId());
	
				TNLoginLog loginLog = new TNLoginLog();
				loginLog.setIp(ip);
				loginLog.setLoginMode(loginMode);
				loginLog.setMsg(msg);
				loginLog.setState(state);
				loginLog.setUserName(userName);
				loginLog.setUserId(userId);
				LoginService logServ = new LoginService();
				String logMsg = logServ.saveLoginLog(loginLog);
				log.info(logMsg);
		}
		log.info(msg);
		if("json".equals(returnType)) {
			return json();
		}
		return result;
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception {
		getSession().clear();
		return LOGIN;
	}
	
	public String logPortalOut() throws Exception {
		getSession().clear();
		return PORTAL;
	}
	
	/**
	 * 判断用户是否已登录
	 * @return
	 * @throws Exception
	 */
	public String isLogin() throws Exception {
		chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("用户登录超时");
		chResponse.setData("");
		UserInfo userInfo = getUserBySession();
		if(null != userInfo) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("用户已登录");
		}
		userInfo = null;
		return super.json();
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}

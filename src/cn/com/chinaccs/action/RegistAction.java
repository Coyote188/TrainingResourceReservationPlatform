package cn.com.chinaccs.action;

import java.util.Date;

import cn.com.chinaccs.IConstant;
import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.bean.entity.TNInfo;
import cn.com.chinaccs.bean.entity.TNLoginLog;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.dao.impl.InfoDao;
import cn.com.chinaccs.dao.impl.RoleDao;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.service.LoginService;
import cn.com.chinaccs.service.UserService;
import cn.com.chinaccs.utils.SignMD5;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.utils.SystemConstant;

/**
 * 信息管理
 * 
 * @author Administrator
 *
 */
public class RegistAction extends BaseImplAction {
	/**
	 * 注册
	 */
	private UserService userServ = new UserService();
	@Override
	public String execute() throws Exception {
		chResponse = new CHResponse();
		String result_msg = "0";
		String result = null;
		// Title=C1&Author=abc&SubTitle=%E8%BA%AB%E4%BB%BD%E8%AF%81&Summary=220&mobil_no=13308800013&username=admin&Password=111111
		String title = getRequest().getParameter("Title");  //驾照类型
		String author = getRequest().getParameter("Author");// 姓名
		String subTitle = getRequest().getParameter("SubTitle"); //证件类型
		String summary = getRequest().getParameter("Summary"); //证件号码 
		String mobileNo = getRequest().getParameter("mobil_no");//手机号码 
		String username = getRequest().getParameter("username");//用户名
		String password = getRequest().getParameter("Password");//密码 
		String valCode = getRequest().getParameter("validateCode");//验证码
		String email = getRequest().getParameter("Email"); //email
		TNUser user = new TNUser();
		
		UserDao dao = new UserDao();
		Object codeObj = getSessionByKey(SESSION_CAPTCHA_LOGIN);
		msg = "验证码输入错误";
		if(null != codeObj && valCode.equalsIgnoreCase(codeObj.toString())) {
			boolean bol = dao.checkUserName(username);
			if(!bol){
				RoleDao roleDao = new RoleDao();
				TNRole role = roleDao.getPortalRole();
				
				user.setCallName(author);
				user.setCreateTime(new java.sql.Date(System.currentTimeMillis()));
				user.setEmail(email);
				user.setIdNo(summary);
				user.setIdType(subTitle);
				user.setLicense(title);
				user.setMobileNo(mobileNo);
//				String _password = SignMD5.execute(password);
				user.setPassword(password);
				user.setPortal(SystemConstant.USER_TYPE_PORTAL);
				user.setPostName("公众用户");
				user.setProfeName("Public Visitor");
				user.setRemark("Register via page");
				user.setState(1);
				user.setTelephone("-- --");
				user.setUserName(username);
				userServ.save(user, role.getId());
			}
			
			//用ajax时，该部分不启作用
			if(!StringUtil.isEmpty(username) && !StringUtil.isEmpty(password)) {
				msg = "该用户已经注册，登录用户名或密码错误";
				UserService userServ = new UserService();
				chResponse = userServ.login(username, password);
				if(OP_SUCCESS.equals(chResponse.getResult())) {
					userInfo = (UserInfo)chResponse.getData();
					msg = "用户登录成功";
					setUserToSession(userInfo);
					if(userInfo.getIsPortal().equals(SystemConstant.USER_TYPE_PORTAL)){
						result = PORTAL;
					}
					result_msg = "1";
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
				loginLog.setUserName(username);
				loginLog.setUserId(userId);
				LoginService logServ = new LoginService();
				String logMsg = logServ.saveLoginLog(loginLog);
				log.info(logMsg);
			}
		}else{
			msg = "验证码错误，请重试！";
			result_msg = "0";
		}
		
		chResponse.setMsg(msg);
		chResponse.setResult(result_msg);
		log.info(msg);
		returnType = "json";
		if("json".equals(returnType)) {
			return json();
		}
		return SUCCESS;
	}
	private static final long serialVersionUID = 1L;

	public String notice() {
		return "notice";
	}

	public String adpiclist(){
		return SUCCESS;
	}
	
	public String trainNoticeList(){
		return SUCCESS;
	}
	
	public String addInfo() throws Exception {
		return super.add();
	}

}

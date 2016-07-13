package cn.com.chinaccs.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import cn.com.chinaccs.IConstant;
import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.init.InitConfig;
import cn.com.chinaccs.utils.DateJsonValueProcessor;
import cn.com.chinaccs.utils.StringUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport implements IBaseAction,IConstantAction {

	protected static final Logger log = Logger.getLogger(BaseAction.class);
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String msg;

	protected String projectName = InitConfig.getInstance().getValue("project.name");

	protected String title = projectName;

	protected CHResponse chResponse = new CHResponse();

	protected String id;

	protected String output;
	
    protected String claszName;
    
    protected String returnType;
    
    protected String currentUri;  //不带参数
    protected String currentUriParam; //带参数
    protected String currentAction;
    
    protected UserInfo userInfo;

	public String execute() throws Exception {
		if("json".equals(returnType)) {
			return json();
		}
		return SUCCESS;
	}
	
	/**
	 * 获取当前URI
	 */
	protected String getUri() {
		if(null != getRequest()) {
			currentUri = getRequest().getRequestURI();
			try {
				currentUri = URLDecoder.decode(currentUri, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String proName = getRequest().getContextPath();
			if (!StringUtil.isEmpty(proName)) {
				currentUri = currentUri.replace(proName + "/", "");
			}
			if(currentUri.startsWith("/")) {
				currentUri = currentUri.substring(1);
			}
			if(!StringUtil.isEmpty(currentUri)) {
				String[] actions = currentUri.split("/");
				if(actions.length>1) {
					int pos = currentUri.lastIndexOf("/"+actions[actions.length-1]);
					currentAction = currentUri.substring(0, pos);
				} else {
					currentAction = currentUri;
				}
			}
		}
		return currentUri;
	}
	
	protected String getUriParam() {
		if(null != getRequest()) {
			currentUriParam = getRequest().getRequestURI();
			String queryParams = getRequest().getQueryString();
			if (!StringUtil.isEmpty(queryParams)) {
				currentUriParam = currentUriParam + "?" + queryParams;
			}
			try {
				currentUriParam = URLDecoder.decode(currentUriParam, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String proName = getRequest().getContextPath();
			if (!StringUtil.isEmpty(proName)) {
				currentUriParam = currentUriParam.replace(proName + "/", "");
			}
			if(currentUriParam.startsWith("/")) {
				currentUriParam = currentUriParam.substring(1);
			}
		}
		return currentUriParam;
	}

	
	/**
	 * 转为json数据
	 * @return
	 */
	protected String getDataJson() {
		if(null == chResponse) {
			chResponse = new CHResponse();
			chResponse.setResult(IConstant.OP_FAIL);
			chResponse.setMsg(IConstant.OP_FAIL_MSG);
		}
		try {
			JsonConfig config=new JsonConfig();  
		    config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		    JSONObject jsonObject = JSONObject.fromObject(chResponse, config);
//			JSONObject jsonObject = JSONObject.fromObject(chResponse);
			output = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return output;
	}
	
	/**
	 * 转为json数据
	 * @return
	 */
	protected String getDataJson(CHResponse chResponse) {
		if(null == chResponse) {
			chResponse = new CHResponse();
			chResponse.setResult(IConstant.OP_FAIL);
			chResponse.setMsg(IConstant.OP_FAIL_MSG);
		}
		try {
			JSONObject jsonObject = JSONObject.fromObject(chResponse);
			output = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return output;
	}
	
	
	/**
	 * 从session中获取当前省份
	 * @return
	 */
	public String getProvinceFromSession() {
		Object obj = getSessionByKey(SESSION_PROVINCE_NAME);
		return (null != obj)?obj.toString():null;
	}
	
	/**
	 * 
	 * @param value
	 */
	public void setProvinceToSession(String value) {
		setSession(SESSION_PROVINCE_NAME, value);
	}
	
	public String json() {
		output = getDataJson();
		return "json";
	}

	protected String getFileSeparator() {
		return System.getProperty("file.separator");
	}
	
	/**
	 * 获取客户端IP地址
	 * @return
	 */
	public String getRemoteAddr() {
		HttpServletRequest request = getRequest();
		String ip = request.getRemoteAddr();
		log.info("remoteAddr[" + ip + "]");
		request = null;
		return ip;
	}
	
	
	/**
	 * 
	 * @return
	 */
	public String getUserAgent() {
		HttpServletRequest request = getRequest();
		String agent = request.getHeader("User-Agent");
		return agent;
	}
	
	/**
	 * 获取session对象 <br>
	 * 
	 * @return
	 */
	protected Map<String, Object> getSession() {
		return ActionContext.getContext().getSession();

	}

	/**
	 * 通过key获取保存在session里面的信息
	 * 
	 * @param key
	 * @return
	 */
	public Object getSessionByKey(Object key) {
		return this.getSession().get(key);
	}

	/**
	 * 在session设置 <br>
	 * 
	 * @param key
	 * @param value
	 */
	public void setSession(String key, Object value) {
		this.getSession().put(key, value);
	}

	/**
	 * 用户信息保存到session
	 * 
	 * @param user
	 */
	protected void setUserToSession(UserInfo user) {
		if (null != user) {
			this.getSession().put(SESSION_USER_INFO, user);
		}
	}

	/**
	 * 从session获取用户信息
	 * 
	 * @return
	 */
	public UserInfo getUserBySession() {
		Object obj = this.getSession().get(SESSION_USER_INFO);
		return (null != obj)?(UserInfo)obj:null;
	}
	
	/**
	 * 获取登录前的URL
	 * @return
	 */
	public String getLoginBeforeUrl() {
		Object obj = getSessionByKey(SESSION_BEFORE_LOGIN_URL);
		return (obj != null)?obj.toString():null;
	}
	
	/**
	 * 设置登录前的URL
	 * @param url
	 */
	public void setLoginBeforeUrl(String url) {
		setSession(SESSION_BEFORE_LOGIN_URL, String.valueOf(url));
	}

	/**
	 * 获取用户的ID
	 * @return
	 */
	public String getUserId() {
		UserInfo user = getUserBySession();
		return (user != null)?user.getId():null;
	}
	
	/**
	 * 获取用户名
	 * @return
	 */
	public String getUserName() {
		UserInfo user = getUserBySession();
		return (user != null)?user.getUsername():null;
	}
	
	/**
	 * 获取Request <br>
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		return (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
	}

	/**
	 * 将数据保存到Request
	 * 
	 * @param key
	 *            键
	 * @param datas
	 *            数据List
	 */
	protected void setRequest(String key, List<?> datas) {
		this.getRequest().setAttribute(key, datas);
	}

	/**
	 * 将数据保存到Request
	 * 
	 * @param key
	 *            键
	 * @param data
	 *            字符串数
	 */
	protected void setRequest(String key, String data) {
		this.getRequest().setAttribute(key, data);
	}
	
	protected String getDomainUrl() {
		String path = getRequest().getContextPath();
		int port = ServletActionContext.getRequest().getServerPort();
		String baseUrl = null;
		String serverUrl = getRequest().getScheme()+"://"+ServletActionContext.getRequest().getServerName();
		if(port==80) {
			baseUrl = serverUrl+path;
		} else {
			baseUrl = serverUrl+":"+port+path;
		}
		return baseUrl;
	}
	
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	
	
	
	// setter and getter
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public CHResponse getChResponse() {
		return chResponse;
	}

	public void setChResponse(CHResponse chResponse) {
		this.chResponse = chResponse;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	public String getCurrentUri() {
		return currentUri;
	}

	public void setCurrentUri(String currentUri) {
		this.currentUri = currentUri;
	}

	public String getCurrentAction() {
		return currentAction;
	}

	public void setCurrentAction(String currentAction) {
		this.currentAction = currentAction;
	}

	public String getCurrentUriParam() {
		return currentUriParam;
	}

	public void setCurrentUriParam(String currentUriParam) {
		this.currentUriParam = currentUriParam;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
}

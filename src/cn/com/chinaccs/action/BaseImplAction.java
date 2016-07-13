package cn.com.chinaccs.action;

import java.util.Map;


public class BaseImplAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4571614221178723814L;
	
	public BaseImplAction() {
		getUri();
		getUriParam();
		userInfo = getUserBySession();
	}
	
	 /**
	 * 获取session对象 <br>
	 * 
	 * @return
	 */
	public static Map<String, Object> getSessions() {
		return new BaseImplAction().getSession();

	}
	
	public String show() throws Exception {
		return SUCCESS;
	}
	
	public String add() throws Exception {
		return SUCCESS;
	}
	
	public String edit() throws Exception {
		return SUCCESS;
	}
	
	public String del() throws Exception {
		return SUCCESS;
	}
	
	public String list() throws Exception {
		return SUCCESS;
	}
	

}

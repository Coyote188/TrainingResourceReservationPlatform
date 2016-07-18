package cn.com.chinaccs.action;

import cn.com.chinaccs.IConstant;


public interface IConstantAction extends IConstant {
	
	public final static String OBJECT_EXT = "edu"; 

	//////////////Session常量定义/////////////////
	public final static String SESSION_USER_INFO = OBJECT_EXT+"_user_info";
	
	//用户登录验证码
	public final static String SESSION_CAPTCHA_LOGIN = OBJECT_EXT+"_captcha_login";
	
	/**
	 * 登录之前的URL
	 */
	public final static String SESSION_BEFORE_LOGIN_URL = OBJECT_EXT+"_before_login_url";
	
	public final static String SESSION_PROVINCE_NAME = OBJECT_EXT+"_province_name";
	
	//短信验证码ID
	public final static String SESSION_SMS_CODE_ID = "sms_code_id";
	
	public final static String SESSION_SMS_LICENSEE = "sms_licensee"; 
	
	
	
	/////////////Action返回常量定义////////////
	public final static String JSON = "json";
	
	//////////////回应下发短信接口//////////////////
	public final static String SMS_RES_JSON = "sms_res_json";
	
	public final static String XML = "xml";
	
	public final static String FAIL = "fail";
	
	//注册
	public final static String REGISTER = "register";
	
	//弹出登录框
	public final static String  POP_LOGIN = "pop_login";
	
	public final static String  INDEX = "index";
	public final static String  PORTAL = "portal";
	
	public final static String ADD = "add";
	
	public final static String EDIT = "edit";
	
	public final static String LIST = "list";
	
	public final static String DEL = "del";
	
	public final static String SHOW = "show";
	
	public final static String UPLOAD_RESULT = "upload_result";
	
	public final static String ADMIN_OP_RESULT = "admin_op_result";
	
	public final static String DOWNLOAD = "download";
	
	//资源不存在
	public final static String NOT_EXIST_RES = "not_exist_res";
	
	//分页常量值
	public final static int PRE_PAGE_SIZE = 15;
	
	
	//头像
	public final static String BUSI_PIC_TYPE_AVATAR = "avatar";
	
	
}

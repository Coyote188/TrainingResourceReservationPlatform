package cn.com.chinaccs.action.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import cn.com.chinaccs.action.BaseAction;
import cn.com.chinaccs.action.BaseImplAction;
import cn.com.chinaccs.action.IConstantAction;
import cn.com.chinaccs.bean.UserInfo;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ACLInterceptor extends AbstractInterceptor implements IConstantAction  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5507013642378963338L;
	
	private static final Logger log = Logger.getLogger(ACLInterceptor.class);

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		String result = BaseAction.LOGIN;
		log.info("-----访问控制列表拦截------");
		BaseAction baseAction = new BaseImplAction();
		HttpServletRequest request = baseAction.getRequest();
		UserInfo userInfo = baseAction.getUserBySession();
		log.info("-----访问控制列表拦截------判断是否已登录");
		String actionName = arg0.getProxy().getActionName();
		if(actionName.startsWith("public/") || actionName.startsWith("publicJson/") || actionName.startsWith("systemstart")|| actionName.startsWith("portal")){
			result = arg0.invoke();
		}
		if(userInfo != null) {
			log.info("-----访问控制列表拦截------用户已经登录");
			result = arg0.invoke();
		} else {
			result = BaseAction.LOGIN;
			log.info("-----访问控制列表拦截------用户未登录");
			log.info("-----访问控制列表拦截------记住用户的URL");
			String queryParams=request.getQueryString();
			String beforeURL = "";
			if(queryParams != null && !"".equals(queryParams.trim())){
				beforeURL = actionName+"?"+queryParams;
			} else {
				beforeURL = actionName;
			}
			baseAction.setLoginBeforeUrl(beforeURL);
			log.info("-----登录之前的URL为:"+beforeURL);
		}
		userInfo = null;
		request = null;
		baseAction = null;
		return result;
	}

}

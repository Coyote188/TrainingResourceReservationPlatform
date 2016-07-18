package cn.com.chinaccs.action;

import java.util.Date;

import cn.com.chinaccs.IConstant;
import cn.com.chinaccs.bean.entity.TNInfo;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.dao.impl.InfoDao;
import cn.com.chinaccs.dao.impl.RoleDao;
import cn.com.chinaccs.service.UserService;
import cn.com.chinaccs.utils.SignMD5;
import cn.com.chinaccs.utils.SystemConstant;

/**
 * 信息管理
 * 
 * @author Administrator
 *
 */
public class RegistAction extends BaseImplAction {
	/**
	 * 
	 */
	
	private UserService userServ = new UserService();
	@Override
	public String execute() throws Exception {
		// Title=C1&Author=abc&SubTitle=%E8%BA%AB%E4%BB%BD%E8%AF%81&Summary=220&mobil_no=13308800013&username=admin&Password=111111
		String title = getRequest().getParameter("Title");
		String author = getRequest().getParameter("Author");
		String subTitle = getRequest().getParameter("SubTitle");
		String summary = getRequest().getParameter("Summary");
		String mobileNo = getRequest().getParameter("mobil_no");
		String username = getRequest().getParameter("username");
		String password = getRequest().getParameter("Password");
		String email = getRequest().getParameter("Email");
		TNUser user = new TNUser();
		
		RoleDao roleDao = new RoleDao();
		TNRole role = roleDao.getPortalRole();
		
		user.setCallName(author);
		user.setCreateTime(new java.sql.Date(System.currentTimeMillis()));
		user.setEmail(email);
		user.setIdNo(summary);
		user.setIdType(subTitle);
		user.setLicense(title);
		user.setMobileNo(mobileNo);
//		String _password = SignMD5.execute(password);
		user.setPassword(password);
		user.setPortal(SystemConstant.USER_TYPE_PORTAL);
		user.setPostName("公众用户");
		user.setProfeName("Public Visitor");
		user.setRemark("Register via page");
		user.setState(1);
		user.setTelephone("-- --");
		user.setUserName(username);
		userServ.save(user, role.getId());
		return super.execute();
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

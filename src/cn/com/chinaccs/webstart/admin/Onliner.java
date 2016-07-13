package cn.com.chinaccs.webstart.admin;

import java.util.Date;

public class Onliner {
	private String userId;
	private String userName;
	private String org;
	private String loginIp;
	private Date createtime;
	

	
	public Onliner() {
		
	}
	
	public Onliner(String userId, String userName, String org, String loginIp,
			Date createtime) {
		this.userId = userId;
		this.userName = userName;
		this.org = org;
		this.loginIp = loginIp;
		this.createtime = createtime;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	

}

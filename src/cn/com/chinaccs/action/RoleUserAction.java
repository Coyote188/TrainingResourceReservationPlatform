package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.entity.TNRoleUser;
import cn.com.chinaccs.service.RoleUserService;

public class RoleUserAction extends BaseImplAction {

	/**
	 * 
	 */
	
	private static final String OP_ADD = "add";
	private static final String OP_EDIT = "edit";
	
	private static final long serialVersionUID = 1L;
	private TNRoleUser objBean;
	private String op;
	private String roleId;
	private String userId;
	private String orgId;
	private String queryOrgId;
	private String queryOrgName;
	
	/**
	 *  用户角色 选项 单个组织机构 角色
	 * */
	public String rolezTree() throws Exception {
		RoleUserService ruServ = new RoleUserService();
	
		chResponse = ruServ.queryRoleZtree(userId,orgId);
		return json();
	}
	
	/**
	 * 全组织机构 角色树
	 * 
	 * */
	public String allRolezTree() throws Exception {
		RoleUserService ruServ = new RoleUserService();
		String userOrgId = userInfo.getOrgId();
		chResponse = ruServ.queryAllRoleZtree(queryOrgId,queryOrgName,userOrgId);
		return json();
	}
	
	
	public TNRoleUser getObjBean() {
		return objBean;
	}
	public void setObjBean(TNRoleUser objBean) {
		this.objBean = objBean;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getQueryOrgId() {
		return queryOrgId;
	}

	public void setQueryOrgId(String queryOrgId) {
		this.queryOrgId = queryOrgId;
	}

	public String getQueryOrgName() {
		return queryOrgName;
	}

	public void setQueryOrgName(String queryOrgName) {
		this.queryOrgName = queryOrgName;
	}
	
	

}

package cn.com.chinaccs.webstart.admin;


import cn.com.chinaccs.webstart.WebStartAction;

public class AdminAction extends WebStartAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1762435882749490342L;
	private String userId = null;
	private String pwd = null;
	private String newPwd = null;
	private String output = null;
	private String roleId = null;
	private String menuIds = null;
	private String orgIds = null;
	private String tag;

	/**
	 * 数据字典按tag查询接口
	 * 
	 * @return
	 */
	public String getDictTree() {
		AdminBusi busi = new AdminBusi();
		output = busi.getDictChildren(tag);
		return SUCCESS;
	}

	/**
	 * 获取菜单权限接口
	 * 
	 * @return
	 */
	public String customMenu() {
		userId = (String) getRequest().getSession().getAttribute("userId");
		log.info("获取菜单权限接口------userId:" + userId);
		AdminBusi busi = new AdminBusi();
		output = busi.getCustomMenu(userId);
		return SUCCESS;
	}

	/**
	 * 修改密码接口
	 * 
	 * @return
	 */
	public String changePwd() {
		userId = (String) getRequest().getSession().getAttribute("userId");
		log.info("修改密码接口------userId:" + userId);
		AdminBusi busi = new AdminBusi();
		output = busi.getChangePwd(userId, pwd, newPwd);
		return SUCCESS;
	}

	/**
	 * 获取菜单树形select数据接口
	 * 
	 * @return
	 */
	public String selectMenu() {
		log.info("获取菜单树形select数据接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getSelectMenu();
		return SUCCESS;
	}

	/**
	 * 获取机构树形select数据接口
	 * 
	 * @return
	 */
	public String selectOrg() {
		log.info("获取机构树形select数据接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getSelectOrg();
		return SUCCESS;
	}

	/**
	 * 获取数据字典树形select数据接口
	 * 
	 * @return
	 */
	public String selectDict() {
		log.info("获取数据字典树形select数据接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getDictOrg();
		return SUCCESS;
	}

	/**
	 * 获取菜单树形配置数据接口
	 * 
	 * @return
	 */
	public String limitMenuTreeData() {
		log.info(" 获取菜单树形配置数据接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getLimitMenuTreeDataBusi(roleId);
		return SUCCESS;
	}

	/**
	 * 更新角色菜单配置接口
	 * 
	 * @return
	 */
	public String limitMenuReConfig() {
		log.info("更新角色菜单配置接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getLimitMenuReConfigBusi(menuIds, roleId);
		return SUCCESS;
	}

	/**
	 * 获取组织机构树形配置数据接口
	 * 
	 * @return
	 */
	public String limitOrgTreeData() {
		log.info("获取组织机构树形配置数据接口------");
		AdminBusi busi = new AdminBusi();
		output = busi.getLimitOrgTreeDataBusi(roleId);
		return SUCCESS;
	}

	/**
	 * 更新角色菜单配置接口
	 * 
	 * @return
	 */
//	public String limitOrgReConfig() {
//		log.info("更新角色菜单配置接口------");
//		AdminBusi busi = new AdminBusi();
//		output = busi.getLimitOrgReConfigBusi(orgIds, roleId);
//		return SUCCESS;
//	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	public String getOrgIds() {
		return orgIds;
	}

	public void setOrgIds(String orgIds) {
		this.orgIds = orgIds;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

}

package cn.com.chinaccs.action;

import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNRoleUser;
import cn.com.chinaccs.dao.impl.RoleDao;
import cn.com.chinaccs.dao.impl.RoleUserDao;
import cn.com.chinaccs.service.OrgService;
import cn.com.chinaccs.service.RoleService;
import cn.com.chinaccs.service.RoleUserService;
import cn.com.chinaccs.utils.StringUtil;

public class RoleAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1121550201995529219L;
	
	private static final String OP_SAVE = "save";
	private static final String OP_DEL = "del";
	
	private static final String OP_TREE_ALL = "tree1";
	private static final String OP_TREE_ALL_EDIT = "tree2";
	private static final String OP_TREE_COM = "tree3";
	private static final String OP_TREE_BASE = "tree4";


//	private CHResponse menuTrees;
//	private CHResponse orgTrees;
//	private String menuTreesJson;
//	private String orgTreesJson;
//	private String orgId;
//	private String[] ck;
	
	private TNRole objBean;
	private String op;
	private String roleId;
	private String parentRoleId;
	private RoleService roleServ;
	private String permitIds;
	private String menuIds;
	private String panertRoleIds;
	private String userId;
	private String roleOrgId;
	private String roPid;
	private String roPcode;

	
	/**
	 * 获取权限树
	 * 
	 * */
	public String permitZtree() throws Exception {
		   //String user_orgId = userInfo.getOrgId();
		   roleServ = new RoleService();
		   if(OP_TREE_ALL.equals(op))
			   chResponse = roleServ.getzTree1();
		   else if(OP_TREE_ALL_EDIT.equals(op))
			   chResponse = roleServ.getzTree2(roleId);
		   else if(OP_TREE_COM.equals(op))
			   chResponse = roleServ.getzTree3(roleId);
		   else if(OP_TREE_BASE.equals(op))
			   chResponse = roleServ.getzTree4(panertRoleIds,roleId);
		 
		   return json();
		}
	
	/**
	 * 添加基础角色
	 * */
	public String addRole() throws Exception {
			roleServ = new RoleService();
			String userCallName = userInfo.getCallName();
		    chResponse = roleServ.addRole(objBean,panertRoleIds,permitIds,menuIds,userCallName);
		    return json();
	}
	/**
	 * 修改基础角色
	 * */
	public String editRole() throws Exception {
			roleServ = new RoleService();
		    chResponse = roleServ.editRole(objBean,panertRoleIds,permitIds,menuIds);
		    return json();
	}
	
	/**
	 * 删除角色
	 * 
	 * */
	public String delRole() throws Exception{
		roleServ = new RoleService();
	    chResponse = roleServ.delRole(id);
		return json();
	}
	
	/**
	 * 添加 公共角色
	 * */
	public String addRoleCom() throws Exception {
			roleServ = new RoleService();
			String userCallName = userInfo.getCallName();
		    chResponse = roleServ.addRoleCom(objBean,permitIds,menuIds,userCallName);
		    return json();
	}
	/**
	 * 修改 公共角色
	 * */
	public String editRoleCom() throws Exception {
		roleServ = new RoleService();
	    chResponse = roleServ.editRoleCom(objBean,permitIds,menuIds);
	    return json();
	}
	/**
	 * 删除公共角色
	 * 
	 * */
	public String delRoleCom() throws Exception{
		roleServ = new RoleService();
	    chResponse = roleServ.delRoleCom(id);
		return json();
	}
	
	/**
	 * 获取公共角色checkbox
	 * */
	public String getRoleComList()throws Exception{
		roleServ = new RoleService();
	    chResponse = roleServ.queryRoleCom(roleId);
		return json();
	}
	
	
	
	/**
	 * 角色详细信息
	 * */
	public String roleInfo() throws Exception {
		RoleDao roleDao = new RoleDao();
		List<Object> objList = new ArrayList<Object>();
		String sql = "select t.id,t.role_name,(select o.org_seq_name from t_n_org o where o.id = t.org_id) as org_name,t.role_des from t_n_role t where t.id='"+id+"'";
		objList = roleDao.queryObjSql(sql);	
		if(objList.size()>0){
			TNRole role = new TNRole();
			Object[] obj = (Object[])objList.get(0);
			role.setId(StringUtil.handNull(obj[0]));
			role.setRoleName(StringUtil.handNull(obj[1]));
			role.setOrgId(StringUtil.handNull(obj[2]));
			role.setRoleDes(StringUtil.handNull(obj[3]));
			objBean = role;
		}
	
		RoleService roleServ = new RoleService();
		chResponse = roleServ.getzTree5(id);
		roleServ = null;
		output = getDataJson();
		
//		if(StringUtil.isEmpty(orgId)) {
//			orgId = userInfo.getOrgId();
//		}
		return SUCCESS;
	}
	
	public String permissionsConfig() throws Exception {
		RoleDao roleDao = new RoleDao();
		objBean = roleDao.find(id);		
		roleServ = null;
		roleOrgId = objBean.getOrgId();
		TNOrg org = new TNOrg();
		OrgService orgServ = new OrgService();
		CHResponse chResponse2 = orgServ.getOrgInfo(roleOrgId);
		if(OP_SUCCESS.equals(chResponse2.getResult())) {
			org = (TNOrg)chResponse2.getData();
			roPcode = org.getOrgCode();
			roPid = org.getId();
		}

		chResponse = orgServ.getSoloOrgzTree(roPcode);
		orgServ = null;
		output = getDataJson();
		
//		if(StringUtil.isEmpty(orgId)) {
//			orgId = userInfo.getOrgId();
//		}
		return SUCCESS;
	}
	
	/**
	 * 
	 * @return
	 */
	public String roleUser() throws Exception {
		chResponse = new CHResponse();
		if(!StringUtil.isEmpty(roleId) && !StringUtil.isEmpty(id)) {
			if(OP_SAVE.equals(op)) {
				String[] ids = id.split(",");
				TNRoleUser roleUser = null;
				List<TNRoleUser> lists = new ArrayList<TNRoleUser>();
				for (int i = 0; i < ids.length; i++) {
					roleUser = new TNRoleUser();
					roleUser.setRoleId(roleId);
					roleUser.setUserId(ids[i]);
					lists.add(roleUser);
				}
				RoleUserDao dao = new RoleUserDao();
				if(dao.save(lists)) {
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg(OP_SUCCESS_MSG);
				}
				lists = null;
				roleUser = null;
				ids = null;
			} else if(OP_DEL.equals(op)) {
				RoleUserService roleUserServ = new RoleUserService();
				chResponse = roleUserServ.delete(id, roleId);
			}
		}
		return json();
	}
	
	
	public TNRole getObjBean() {
		return objBean;
	}

	public void setObjBean(TNRole objBean) {
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

	public String getPermitIds() {
		return permitIds;
	}

	public void setPermitIds(String permitIds) {
		this.permitIds = permitIds;
	}

	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	public String getPanertRoleIds() {
		return panertRoleIds;
	}

	public void setPanertRoleIds(String panertRoleIds) {
		this.panertRoleIds = panertRoleIds;
	}

	public String getParentRoleId() {
		return parentRoleId;
	}

	public void setParentRoleId(String parentRoleId) {
		this.parentRoleId = parentRoleId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleOrgId() {
		return roleOrgId;
	}

	public void setRoleOrgId(String roleOrgId) {
		this.roleOrgId = roleOrgId;
	}

	public String getRoPid() {
		return roPid;
	}

	public void setRoPid(String roPid) {
		this.roPid = roPid;
	}

	public String getRoPcode() {
		return roPcode;
	}

	public void setRoPcode(String roPcode) {
		this.roPcode = roPcode;
	}


	
	
	
	
	
//	/**
//	 * 
//	 * @return
//	 * @throws Exception
//	 */
//	public String roleMenu() throws Exception {
//		if(!StringUtil.isEmpty(roleId)) {
//			RoleMenuService roleMenuServ = new RoleMenuService();
//			chResponse = roleMenuServ.save(roleId, ck);
//		}
//		return json();
//	}
	
//	/**
//	 * 
//	 * @return
//	 * @throws Exception
//	 */
//	public String roleOrg() throws Exception {
//		if(null != ck && !StringUtil.isEmpty(roleId)) {
//			RoleOrgService roleOrgServ = new RoleOrgService();
//			chResponse = roleOrgServ.save(roleId, ck);
//		}
//		return json();
//	}

	

//	public CHResponse getMenuTrees() {
//		return menuTrees;
//	}
//
//	public void setMenuTrees(CHResponse menuTrees) {
//		this.menuTrees = menuTrees;
//	}
//
//	public CHResponse getOrgTrees() {
//		return orgTrees;
//	}
//
//	public void setOrgTrees(CHResponse orgTrees) {
//		this.orgTrees = orgTrees;
//	}
//
//	public String getMenuTreesJson() {
//		return menuTreesJson;
//	}
//
//	public void setMenuTreesJson(String menuTreesJson) {
//		this.menuTreesJson = menuTreesJson;
//	}
//
//	public String getOrgTreesJson() {
//		return orgTreesJson;
//	}
//
//	public void setOrgTreesJson(String orgTreesJson) {
//		this.orgTreesJson = orgTreesJson;
//	}
	
//	public String getOrgId() {
//		return orgId;
//	}
//	public void setOrgId(String orgId) {
//		this.orgId = orgId;
//	}
//	public String[] getCk() {
//		return ck;
//	}
//
//	public void setCk(String[] ck) {
//		this.ck = ck;
//	}
	

	

}

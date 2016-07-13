package cn.com.chinaccs.bean;

import java.util.List;


public class UserInfo {

	private String id;
	
	private String username;
	
	private String callName;
	
	private String orgId;
	
	private String departmentId;
	
	private List<String> roleIds;
	
	private List<String> comRoleIds;//继承的公共角色
	
	private List<String> orgIds;
	
	/*private String email;
	
	private String tel;
	
	private String sex;
	
	private String city;*/
	
	private String anonymous;
	
	private String avatar;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public List<String> getOrgIds() {
		return orgIds;
	}

	public void setOrgIds(List<String> orgIds) {
		this.orgIds = orgIds;
	}

	public String getCallName() {
		return callName;
	}

	public void setCallName(String callName) {
		this.callName = callName;
	}

	public List<String> getComRoleIds() {
		return comRoleIds;
	}

	public void setComRoleIds(List<String> comRoleIds) {
		this.comRoleIds = comRoleIds;
	}
	
	
}

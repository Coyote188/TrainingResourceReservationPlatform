package cn.com.chinaccs.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.BaseBean;

/**
 * 角色继承表
 * @author 
 *
 */
@Entity
@Table(name = "T_N_ROLE_LINK")
public  class TNRoleLink implements BaseBean {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String roleId;
	private String parentRoleId;
	
	
	@Id
	@Column(name = "id", length = 32)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "role_id", length = 32)
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	@Column(name = "parent_role_id", length = 32)
	public String getParentRoleId() {
		return parentRoleId;
	}
	public void setParentRoleId(String parentRoleId) {
		this.parentRoleId = parentRoleId;
	}
	
	
	@Override
	@Transient
	public String getPrefix() {
		return "role";
	}
	

}

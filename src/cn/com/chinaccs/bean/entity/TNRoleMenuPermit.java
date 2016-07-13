package cn.com.chinaccs.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
/**
 * 角色菜单 映射操作权限
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_ROLE_MENU_PERMIT")
public class TNRoleMenuPermit extends BaseBeanImpl {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String roleMenuId;//角色菜单映射ID
	private String permitVal;//操作值
	
	@Id
	@Column(name = "id",length=32)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "permit_val", length=32)
	public String getPermitVal() {
		return permitVal;
	}
	public void setPermitVal(String permitVal) {
		this.permitVal = permitVal;
	}
	@Column(name = "role_menu_id", length=32)
	public String getRoleMenuId() {
		return roleMenuId;
	}
	public void setRoleMenuId(String roleMenuId) {
		this.roleMenuId = roleMenuId;
	}
	
	

}

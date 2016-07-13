package cn.com.chinaccs.bean.entity;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.DateBean;
import cn.com.chinaccs.valid.Validate;


/**
 * 角色
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_ROLE")
public class TNRole implements DateBean {
	
	/**
	 * 公共角色
	 */
	public static final String ROLE_TYPE_COMMON = "common";
	
	/**
	 * 基础角色
	 */
	public static final String ROLE_TYPE_BASE = "base";

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String roleName;
	private String roleType;// 基础：0、普通：1
	private String orgId;  //普通角色必须有组织机构 、基础角色无组织机构
	private String roleDes;//角色描述
	private String creator;//操作用户ID
	private Date createTime;
	



	
	@Id
	@Column(name = "id", length = 32)
	@Validate(nullable=false,length="1,32")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "role_name", length = 128)
	@Validate(nullable=false,length="1,64")
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "role_des", length = 1024)
	@Validate(length="0,512")
	public String getRoleDes() {
		return this.roleDes;
	}

	public void setRoleDes(String roleDes) {
		this.roleDes = roleDes;
	}
	
	

	@Column(name = "role_type", length = 12)
	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	@Column(name = "org_id", length = 32)
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	@Column(name = "creator", length = 32)
	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_time")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	@Override
	@Transient
	public String getPrefix() {
		return "role";
	}

}
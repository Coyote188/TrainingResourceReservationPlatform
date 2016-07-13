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
import cn.com.chinaccs.valid.DataFormatType;
import cn.com.chinaccs.valid.Validate;

/**
 * 用户
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_USER")
public class TNUser implements DateBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 唯一编号（系统自动编号）
	 */
	private String id; 
	
	/**
	 * 如果用户类型为其他;则该字段填写用户名；
	 * 否则该字段为空
	 */
	private String userName;
	
	private String password;
	
	private String callName;
	
	private String mobileNo;
	
	private String telephone;
	
	private String qqNo;
	
	private String email;
	
	private String orgId;
	
	private String postName;
	
	private String profeName;
	
	private String remark;
	
	
	/**
	 * 是否有效(1--有效;0--无效)
	 */
	private Integer state;
	
	private Date createTime;

	@Id
	@Column(name="id",length=32)
	@Validate(nullable=false,length="1,32")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name="user_name",length=32,nullable=false)
	@Validate(nullable=false,length="1,16")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name="password",length=32)
	@Validate(nullable=false,length="1,32")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="call_name",length=32)
	@Validate(nullable=false,length="1,16")
	public String getCallName() {
		return callName;
	}

	public void setCallName(String callName) {
		this.callName = callName;
	}

	@Column(name="mobile_no",length=32,nullable=true)
	@Validate(nullable=true,dataFormatType = DataFormatType.MOBILE_PHONE)
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Column(name="telephone",length=32)
	@Validate(nullable=true,dataFormatType = DataFormatType.FIXED_TELPHONE)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name="qq_no",length=32)
	@Validate(nullable=true,dataFormatType = DataFormatType.QQ)
	public String getQqNo() {
		return qqNo;
	}

	public void setQqNo(String qqNo) {
		this.qqNo = qqNo;
	}

	@Column(name="email",length=64)
	@Validate(length="0,64",nullable=true,dataFormatType = DataFormatType.EMAIL)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="org_id",length=64)
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	@Column(name="post_name",length=64)
	@Validate(length="0,32")
	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	@Column(name="profe_name",length=64)
	@Validate(length="0,32")
	public String getProfeName() {
		return profeName;
	}

	public void setProfeName(String profeName) {
		this.profeName = profeName;
	}

	@Column(name="remark",length=255)
	@Validate(length="0,200")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name="state",length=2)
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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
		return "u";
	}
	
	
}
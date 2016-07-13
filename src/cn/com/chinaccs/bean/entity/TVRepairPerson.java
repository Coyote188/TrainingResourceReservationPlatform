package cn.com.chinaccs.bean.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.bean.DateBean;
import cn.com.chinaccs.valid.DataFormatType;
import cn.com.chinaccs.valid.Validate;

/**
 * 维修保养人
 * @author hw
 *
 */
@Entity
@Table(name = "T_V_REPAIR_PERSON")
public class TVRepairPerson extends BaseBeanImpl implements DateBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 唯一编号（系统自动编号）
	 */
	private String id; 
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 联系电话
	 */
	private String mobileNo;
	
	/**
	 * 所属组织机构
	 */
	private String orgId;
	
	/**
	 * 是否有效(1--有效;0--无效)
	 */
	private Integer state;
	
	/**
	 * 创建时间
	 */	
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

	@Column(name="mobile_no",length=32)
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Column(name="org_id",length=64)
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
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
	
}
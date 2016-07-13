package cn.com.chinaccs.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.BaseTree;
import cn.com.chinaccs.valid.Validate;

/**
 * 组织机构
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_ORG")
public class TNOrg implements BaseTree {
	
	/**
	 * 机构
	 */
	public static final String ORG_TYPE_ORG = "org";
	
	/**
	 * 部门
	 */
	public static final String ORG_TYPE_DEPARTMENT = "department";

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String orgName;
	private String orgCode;
	private Integer orgLevel;
	private String parentId;
	private String orgSeq;
	private String orgContact;
	private String orgTel;
	private Integer seqNum;
	private String isExtend;
	
	/**
	 * 类型(org--组织机构、department--部门)
	 */
	private String type;
	private String orgSeqName;

	
	@Id
	@Column(name = "id", length=32)
	@Validate(nullable=false,length="1,32")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "org_name", length = 64)
	@Validate(nullable=false,length="1,32")
	public String getOrgName() {
		return this.orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	@Column(name = "org_code", length = 32)
	@Validate(nullable=false,length="1,16")
	public String getOrgCode() {
		return this.orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	@Column(name = "org_level", precision = 2, scale = 0)
	public Integer getOrgLevel() {
		return this.orgLevel;
	}

	public void setOrgLevel(Integer orgLevel) {
		this.orgLevel = orgLevel;
	}

	@Column(name = "parent_id", length=32,nullable=false)
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "org_seq", length = 512)
	public String getOrgSeq() {
		return this.orgSeq;
	}

	public void setOrgSeq(String orgSeq) {
		this.orgSeq = orgSeq;
	}

	@Column(name = "org_contact", length = 64)
	@Validate(nullable=false,length="1,32")
	public String getOrgContact() {
		return this.orgContact;
	}

	public void setOrgContact(String orgContact) {
		this.orgContact = orgContact;
	}

	@Column(name = "org_tel", length = 32)
	@Validate(nullable=false,length="1,16")
	public String getOrgTel() {
		return this.orgTel;
	}

	public void setOrgTel(String orgTel) {
		this.orgTel = orgTel;
	}

	
	@Column(name="seq_num",length=5)
	public Integer getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}
	
	@Column(name="type",length=50)
	@Validate(nullable=false,length="1,25")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	@Column(name="org_seq_name",length=256)
	public String getOrgSeqName() {
		return orgSeqName;
	}

	public void setOrgSeqName(String orgSeqName) {
		this.orgSeqName = orgSeqName;
	}
	
	
	@Column(name="is_extend",length=12)
	public String getIsExtend() {
		return isExtend;
	}

	public void setIsExtend(String isExtend) {
		this.isExtend = isExtend;
	}

	@Override
	@Transient
	public String getPrefix() {
		return "org";
	}

}
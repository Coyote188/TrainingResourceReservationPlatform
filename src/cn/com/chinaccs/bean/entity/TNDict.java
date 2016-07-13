package cn.com.chinaccs.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.BaseTree;
import cn.com.chinaccs.valid.Validate;

/**
 * 数据字典
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_DICT")
public class TNDict implements BaseTree {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String parentId;
	
	private String busiName;
	
	private String busiValue;
	
	private Integer busiLevel;
	
	private Integer seqNum;
	
	private Integer state;

	@Id
	@Column(name="id",length=32)
	@Validate(nullable=false,length="1,32")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "parent_id", length = 32,nullable=false)
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "busi_name", length = 128,nullable=false)
	@Validate(nullable=false,length="1,128")
	public String getBusiName() {
		return this.busiName;
	}

	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}

	@Column(name = "busi_level", precision = 5, scale = 0)
	public Integer getBusiLevel() {
		return this.busiLevel;
	}

	public void setBusiLevel(Integer busiLevel) {
		this.busiLevel = busiLevel;
	}

	@Column(name = "seq_num",length=5)
	public Integer getSeqNum() {
		return this.seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}

	@Column(name = "state", length=2)
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	@Column(name="busi_value",length=127,nullable=false)
	@Validate(nullable=false,length="1,127")
	public String getBusiValue() {
		return busiValue;
	}

	public void setBusiValue(String busiValue) {
		this.busiValue = busiValue;
	}

	@Override
	@Transient
	public String getPrefix() {
		return "d";
	}

}
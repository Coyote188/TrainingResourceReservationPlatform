package cn.com.chinaccs.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.com.chinaccs.bean.BaseTree;
import cn.com.chinaccs.valid.Validate;

/**
 * TNMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "T_N_MENU")
public class TNMenu implements BaseTree {

	// Fields
	
	public static final String MENU_URI_PORTAL = "portal";
	
	/**
	 * 普通菜单
	 */
	public static final String MENU_TYPE_BASE = "b_menu";
	
	/**
	 * 流程菜单
	 */
	public static final String MENU_TYPE_FLOW = "f_menu";

	/**
	 * 
	 */
	private static final long serialVersionUID = -516084667117152167L;
	private String id;
	private String menuName;
	private String parentId;
	private String uri;
	private Integer seqNum;
	private Integer level;
	private Integer state;
	private String menuType;
	
	@Id
	@Column(name="id",length=32)
	@Validate(nullable=false,length="1,32")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "menu_name", length = 64)
	@Validate(nullable=false,length="1,64")
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "parent_id", length=32,nullable=false)
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name="uri",length=255)
	@Validate(nullable=false,length="1,255")
	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	@Column(name="seq_num",length=3)
	public Integer getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}

	@Column(name="level",length=3)
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name="state",length=2)
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	@Column(name = "menu_type", length = 12)
	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	@Override
	@Transient
	public String getPrefix() {
		return "m";
	}

}
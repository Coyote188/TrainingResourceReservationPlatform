package cn.com.chinaccs.bean.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.bean.DateBean;

/**
 * 信息类
 * 
 * @author Administrator
 *
 */
@Entity
@Table(name = "T_N_INFO")
public class TNInfo extends BaseBeanImpl implements DateBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String title;
	private String content;
	private String contentAbstract;
	private String html;
	private String imgAttId;
	private String imgUrl;	//直接存路径
	private Date createTime;
	private String infoType; // 信息类型  数据字典
	private String creatorId;	//创建用户id
	private String state; // 状态

	@Id
	@Column(name = "id", length=32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	@Column(name = "title", length=512)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	@Column(name = "content", length=16777215)
	public String getContent() {
		return content;
	}

	
	
	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "contentAbstract", length=512)
	public String getContentAbstract() {
		return contentAbstract;
	}

	public void setContentAbstract(String contentAbstract) {
		this.contentAbstract = contentAbstract;
	}

	@Column(name = "html", length=16777215)
	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	@Column(name = "imgAttId", length=32)
	public String getImgAttId() {
		return imgAttId;
	}

	public void setImgAttId(String imgAttId) {
		this.imgAttId = imgAttId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createTime")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "infoType", length=32)
	public String getInfoType() {
		return infoType;
	}

	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}

	@Column(name = "state", length=16)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "creatorId", length=16)
	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	@Column(name = "imgUrl", length=512)
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	

}

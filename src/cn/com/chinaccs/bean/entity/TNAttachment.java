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


/**
 * 附件
 * @author lmq
 *
 */
@Entity
@Table(name="t_n_attachment")
public class TNAttachment extends BaseBeanImpl implements DateBean {

	private static final long serialVersionUID = 1L;

	private String id;
	
    private String fileName;
	
	private String filePath;
	
	private String fileType;
	
	private long fileSize;
	
	private String userId;
	
	private Date createTime;
	
	private String attType; //附件类型
	
	private String descr;	//描述
	
	private long downCount;	//下载次数

	
	@Id
	@Column(name="id",length=32)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name="file_name",length=255)
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name="file_path",length=255)
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Column(name="file_type",length=1024)
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	@Column(name="file_size")
	public long getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	
	@Column(name="user_id",length=32,nullable=false)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_time",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	@Transient
	public String getPrefix() {
		return "att";
	}
	
	@Column(name="att_type",length=255)
	public String getAttType() {
		return attType;
	}

	public void setAttType(String attType) {
		this.attType = attType;
	}
	
	@Column(name="descr",length=1000)
	public String getDescr() {
		return descr;
	}
	
	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	@Column(name="down_count", columnDefinition = "bigint default 0")
	public long getDownCount() {
		return downCount;
	}
	
	public void setDownCount(long downCount) {
		this.downCount = downCount;
	}
	
}

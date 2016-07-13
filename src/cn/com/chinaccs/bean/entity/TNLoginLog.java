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
 * 用户登录日志
 * @author lmq
 *
 */
@Entity
@Table(name = "T_N_LOGIN_LOG")
public class TNLoginLog extends BaseBeanImpl implements DateBean {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -8368756499304249621L;
	private String id;
	private String userId;
	private String userName;
	private Integer state;
	private String msg;
	private Date createTime;
	private String ip;
	private String loginMode;
	
	/**
	 * 登陆模式为WEB
	 * */
	public static final String MODE_WEB = "web";


	// Property accessors
	@Id
	@Column(name = "id", length=32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "user_id", length = 32)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "state", length=2)
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "msg",length=255)
	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time")
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "ip",length=50)
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "login_mode", length=32)
	public String getLoginMode() {
		return loginMode;
	}

	public void setLoginMode(String loginMode) {
		this.loginMode = loginMode;
	}

	@Column(name = "user_name", length=32)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

}
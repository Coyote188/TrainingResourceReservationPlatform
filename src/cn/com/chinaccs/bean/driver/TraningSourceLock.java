package cn.com.chinaccs.bean.driver;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.dao.TraningSourceLockDao;

/**
 * 资源占用锁<br>
 * 用户预约缴费后，对应训练场地、车辆、教练将被占用<br>
 * 用户在操作订单过程中，资源将被暂时占用，超时将释放
 * @author Coyote
 *
 */
@Entity
@Table(name="train_resource_lock")
public class TraningSourceLock extends BaseBeanImpl{
	/**
	 * 预锁定
	 */
	public static final String LOCK_STATUS_PRE = "001";
	/**
	 * 锁定
	 */
	public static final String LOCK_STATUS_LOCKED = "000";
	/**
	 * 解锁
	 */
	public static final String LOCK_STATUS_UNLOCK = "002";
	/**
	 * 
	 */
	private static final long serialVersionUID = 3063335984121243101L;
	private String id;
	//资源id
	private String resourceId;
	//资源名称
	private String resourceName;
	//资源类型
	private String resourceType;
	//资源锁定开始时间
	private java.sql.Timestamp lockedTime;
	//资源锁定时长（单位：小时）
	private int duration;
	//资源解锁时间（计算获得）
	private java.sql.Timestamp unlockTime;
	//占用资源人
	private String whoLocksResource;
	//锁定状态--预锁定（保持半小时）--锁定
	private String status;
	//锁定状态变更时间
	private java.sql.Timestamp statusDate;
	
	
	/**
	 * 资源锁
	 * @param resourceId
	 * @param resourceName
	 * @param resourceType
	 * @param whoLocksResource
	 */
	public TraningSourceLock(String resourceId, String resourceName, String resourceType, String whoLocksResource) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceType = resourceType;
		this.whoLocksResource = whoLocksResource;
		this.status = LOCK_STATUS_PRE;
		this.statusDate = new Timestamp(System.currentTimeMillis());
	}
	
	public boolean lock(){
		TraningSourceLockDao dao = new TraningSourceLockDao();
		this.status = LOCK_STATUS_LOCKED;
		this.setStatusDate(new Timestamp(System.currentTimeMillis()));
		return dao.update(this);
	}
	
	/**
	 * 资源锁定
	 * @return
	 */
	public String hold(int duration, java.sql.Timestamp lockTime){
		TraningSourceLockDao dao = new TraningSourceLockDao();
		this.setStatus(LOCK_STATUS_PRE);
		this.setLockedTime(lockTime);
		this.setDuration(duration);
		this.setStatusDate(new Timestamp(System.currentTimeMillis()));
		return dao.save(this).toString();
	}
	/**
	 * 资源解锁
	 * @return
	 */
	public boolean unhold(){
		TraningSourceLockDao dao = new TraningSourceLockDao();
		
		return dao.delete(this.id);
	}
	/**
	 * @return the id
	 */
	@Id
	@Column(name="id")
	public String getId() {
		return id;
	}
	/**
	 * @return the resourceId
	 */
	@Column(name="resource_id")
	public String getResourceId() {
		return resourceId;
	}
	/**
	 * @return the resourceName
	 */
	@Column(name="resource_name")
	public String getResourceName() {
		return resourceName;
	}
	/**
	 * @return the resourceType
	 */
	@Column(name="resource_type")
	public String getResourceType() {
		return resourceType;
	}
	/**
	 * @return the lockedTime
	 */
	@Column(name="lock_time")
	public java.sql.Timestamp getLockedTime() {
		return lockedTime;
	}
	/**
	 * @return the duration
	 */
	@Column(name="duration")
	public int getDuration() {
		return duration;
	}
	/**
	 * @return the unlockTime
	 */
	@Column(name="unlock_time")
	public java.sql.Timestamp getUnlockTime() {
		return unlockTime;
	}
	/**
	 * @return the whoLocksResource
	 */
	@Column(name="who_lock_resource")
	public String getWhoLocksResource() {
		return whoLocksResource;
	}
	/**
	 * @return the status
	 */
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	/**
	 * @return the statusDate
	 */
	@Column(name="status_date")
	public java.sql.Timestamp getStatusDate() {
		return statusDate;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @param resourceId the resourceId to set
	 */
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	/**
	 * @param resourceName the resourceName to set
	 */
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	/**
	 * @param resourceType the resourceType to set
	 */
	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}
	/**
	 * @param lockedTime the lockedTime to set
	 */
	public void setLockedTime(java.sql.Timestamp lockedTime) {
		this.lockedTime = lockedTime;
	}
	/**
	 * @param duration the duration to set
	 */
	public void setDuration(int duration) {
		this.duration = duration;
	}
	/**
	 * @param unlockTime the unlockTime to set
	 */
	public void setUnlockTime(java.sql.Timestamp unlockTime) {
		this.unlockTime = unlockTime;
	}
	/**
	 * @param whoLocksResource the whoLocksResource to set
	 */
	public void setWhoLocksResource(String whoLocksResource) {
		this.whoLocksResource = whoLocksResource;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @param statusDate the statusDate to set
	 */
	public void setStatusDate(java.sql.Timestamp statusDate) {
		this.statusDate = statusDate;
	}
	
	
}

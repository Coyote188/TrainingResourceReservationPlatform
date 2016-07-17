package cn.com.chinaccs.bean.driver;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.dao.OrderDetailDao;
import cn.com.chinaccs.utils.IDGen;

/**
 * 订单详细信息<br>
 * 包括场地预约信息、车辆预约信息、教练预约信息及对应的费用以及资源锁<br>
 * 包括预约开始时间、结束时间、时长
 * @author Coyote
 *
 */
@Entity
@Table(name="t_order_detail")
public class OrderDetail extends BaseBeanImpl{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8624941135189794420L;
	private String id;
	//驾照级别
	private String licenseLv;
	private BigDecimal licenseLvMoney;
	//训练场地
	private String trainingField;
	private String trainingFieldLock;
	private BigDecimal trainingFieldMoney;
	//训练车辆
	private String instructionVehicle;
	private String instructionVehicleLock;
	private BigDecimal instructionVehicleMoney;
	//教练员
	private String coach;
	private String coachLock;
	private BigDecimal coachMoney;
	//训练开始时间
	private java.sql.Timestamp trainingStTime;
	//训练时长（小时）
	private int duration;
	//训练结束时间（计算获得）
	private java.sql.Timestamp trainingEdTime;
	
	
	public String save(){
		this.setId(IDGen.getId());
		OrderDetailDao dao = new OrderDetailDao();
		dao.persist(this);		
		return this.getId();
	};
	public boolean update(){
		OrderDetailDao dao = new OrderDetailDao();
		return dao.update(this);
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
	 * @return the licenseLv
	 */
	@Column(name="license_level")
	public String getLicenseLv() {
		return licenseLv;
	}
	/**
	 * @return the licenseLvMoney
	 */
	@Column(name="license_level_money")
	public BigDecimal getLicenseLvMoney() {
		return licenseLvMoney;
	}
	/**
	 * @return the trainingField
	 */
	@Column(name="training_field")
	public String getTrainingField() {
		return trainingField;
	}
	/**
	 * @return the trainingFieldLock
	 */
	@Column(name="training_field_lock")
	public String getTrainingFieldLock() {
		return trainingFieldLock;
	}
	/**
	 * @return the trainingFieldMoney
	 */
	@Column(name="training_field_money")
	public BigDecimal getTrainingFieldMoney() {
		return trainingFieldMoney;
	}
	/**
	 * @return the instructionVehicle
	 */
	@Column(name="instruction_vehicle")
	public String getInstructionVehicle() {
		return instructionVehicle;
	}
	/**
	 * @return the instructionVehicleLock
	 */
	@Column(name="instruction_vehicle_lock")
	public String getInstructionVehicleLock() {
		return instructionVehicleLock;
	}
	/**
	 * @return the instructionVehicleMoney
	 */
	@Column(name="instruction_vehicle_money")
	public BigDecimal getInstructionVehicleMoney() {
		return instructionVehicleMoney;
	}
	/**
	 * @return the coach
	 */
	@Column(name="coach")
	public String getCoach() {
		return coach;
	}
	/**
	 * @return the coachLock
	 */
	@Column(name="coach_lock")
	public String getCoachLock() {
		return coachLock;
	}
	/**
	 * @return the coachMoney
	 */
	@Column(name="coach_money")
	public BigDecimal getCoachMoney() {
		return coachMoney;
	}
	/**
	 * @return the trainingStTime
	 */
	@Column(name="training_start_time")
	public java.sql.Timestamp getTrainingStTime() {
		return trainingStTime;
	}
	/**
	 * @return the duration
	 */
	@Column(name="duration")
	public int getDuration() {
		return duration;
	}
	/**
	 * @return the trainingEdTime
	 */
	@Column(name="training_end_time")
	public java.sql.Timestamp getTrainingEdTime() {
		return trainingEdTime;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @param licenseLv the licenseLv to set
	 */
	public void setLicenseLv(String licenseLv) {
		this.licenseLv = licenseLv;
	}
	/**
	 * @param licenseLvMoney the licenseLvMoney to set
	 */
	public void setLicenseLvMoney(BigDecimal licenseLvMoney) {
		this.licenseLvMoney = licenseLvMoney;
	}
	/**
	 * @param trainingField the trainingField to set
	 */
	public void setTrainingField(String trainingField) {
		this.trainingField = trainingField;
	}
	/**
	 * @param trainingFieldLock the trainingFieldLock to set
	 */
	public void setTrainingFieldLock(String trainingFieldLock) {
		this.trainingFieldLock = trainingFieldLock;
	}
	/**
	 * @param trainingFieldMoney the trainingFieldMoney to set
	 */
	public void setTrainingFieldMoney(BigDecimal trainingFieldMoney) {
		this.trainingFieldMoney = trainingFieldMoney;
	}
	/**
	 * @param instructionVehicle the instructionVehicle to set
	 */
	public void setInstructionVehicle(String instructionVehicle) {
		this.instructionVehicle = instructionVehicle;
	}
	/**
	 * @param instructionVehicleLock the instructionVehicleLock to set
	 */
	public void setInstructionVehicleLock(String instructionVehicleLock) {
		this.instructionVehicleLock = instructionVehicleLock;
	}
	/**
	 * @param instructionVehicleMoney the instructionVehicleMoney to set
	 */
	public void setInstructionVehicleMoney(BigDecimal instructionVehicleMoney) {
		this.instructionVehicleMoney = instructionVehicleMoney;
	}
	/**
	 * @param coach the coach to set
	 */
	public void setCoach(String coach) {
		this.coach = coach;
	}
	/**
	 * @param coachLock the coachLock to set
	 */
	public void setCoachLock(String coachLock) {
		this.coachLock = coachLock;
	}
	/**
	 * @param coachMoney the coachMoney to set
	 */
	public void setCoachMoney(BigDecimal coachMoney) {
		this.coachMoney = coachMoney;
	}
	/**
	 * @param trainingStTime the trainingStTime to set
	 */
	public void setTrainingStTime(java.sql.Timestamp trainingStTime) {
		this.trainingStTime = trainingStTime;
	}
	/**
	 * @param duration the duration to set
	 */
	public void setDuration(int duration) {
		this.duration = duration;
	}
	/**
	 * @param trainingEdTime the trainingEdTime to set
	 */
	public void setTrainingEdTime(java.sql.Timestamp trainingEdTime) {
		this.trainingEdTime = trainingEdTime;
	}
	
}

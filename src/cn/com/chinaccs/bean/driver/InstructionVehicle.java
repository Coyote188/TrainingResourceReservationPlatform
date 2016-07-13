package cn.com.chinaccs.bean.driver;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;

/**
 * 车信息
 * @author Tsui
 *
 */
@Entity
@Table(name = "instruction_vehicle_infomation")
public class InstructionVehicle extends BaseBeanImpl {

	private String id;
	private String plateNumber;
	private String status;
	private String coach;
	private String bands;
	private String model;
	private String calculationMethod;
	private BigDecimal price;
	private String description;
	private String vehicleType;
	private String belong;
	
	@Override
	@Id
	@Column(name="id")
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	/**
	 * @return the plateNumber
	 */
	@Column(name="plate_number")
	public String getPlateNumber() {
		return plateNumber;
	}

	/**
	 * @return the status
	 */
	@Column(name="status")
	public String getStatus() {
		return status;
	}

	/**
	 * @return the coach
	 */
	@Column(name="coach")
	public String getCoach() {
		return coach;
	}

	/**
	 * @return the bands
	 */
	@Column(name="bands")
	public String getBands() {
		return bands;
	}

	/**
	 * @return the model
	 */
	@Column(name="model")
	public String getModel() {
		return model;
	}

	/**
	 * @return the calculationMethod
	 */
	@Column(name="calculation_method")
	public String getCalculationMethod() {
		return calculationMethod;
	}

	/**
	 * @return the price
	 */
	@Column(name="price")
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * @return the description
	 */
	@Column(name="description")
	public String getDescription() {
		return description;
	}

	/**
	 * @return the vehicleType
	 */
	@Column(name="vehicle_type")
	public String getVehicleType() {
		return vehicleType;
	}

	/**
	 * @param plateNumber the plateNumber to set
	 */
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @param caoch the coach to set
	 */
	public void setCoach(String coach) {
		this.coach = coach;
	}

	/**
	 * @param bands the bands to set
	 */
	public void setBands(String bands) {
		this.bands = bands;
	}

	/**
	 * @param model the model to set
	 */
	public void setModel(String model) {
		this.model = model;
	}

	/**
	 * @param calculationMethod the calculationMethod to set
	 */
	public void setCalculationMethod(String calculationMethod) {
		this.calculationMethod = calculationMethod;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @param vehicleType the vehicleType to set
	 */
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	@Column(name="belong")
	public String getBelong() {
		return belong;
	}

	public void setBelong(String belong) {
		this.belong = belong;
	}

}

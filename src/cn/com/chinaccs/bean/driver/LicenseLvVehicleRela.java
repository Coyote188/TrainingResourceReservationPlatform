package cn.com.chinaccs.bean.driver;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
/**
 * 驾照与车类型关系
 * @author Tsui
 *
 */
@Entity
@Table(name="license_lv_vehicle_rela")
public class LicenseLvVehicleRela extends BaseBeanImpl {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2383111677958067816L;
	private String id;
	private String level;
	private String vehicle;
	
	
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
	 * @return the level
	 */
	@Column(name="lecense_level")
	public String getLevel() {
		return level;
	}

	/**
	 * @return the vehicle
	 */
	@Column(name="vehicle_type")
	public String getVehicle() {
		return vehicle;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @param vehicle the vehicle to set
	 */
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

}

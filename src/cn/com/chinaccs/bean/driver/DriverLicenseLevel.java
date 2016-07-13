package cn.com.chinaccs.bean.driver;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;

/**
 * 回归类型
 * @author Tsui
 *
 */
@Entity
@Table(name = "driving_license_level")
public class DriverLicenseLevel extends BaseBeanImpl {

	private String id;
	private String level;
	private String name;
	private String remark;
	
	
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
	@Column(name="level")
	public String getLevel() {
		return level;
	}

	/**
	 * @return the name
	 */
	@Column(name="name")
	public String getName() {
		return name;
	}

	/**
	 * @return the remark
	 */
	@Column(name="remark")
	public String getRemark() {
		return remark;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}


}

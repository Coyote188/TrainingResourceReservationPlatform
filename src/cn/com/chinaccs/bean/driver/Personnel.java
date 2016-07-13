package cn.com.chinaccs.bean.driver;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;

/**
 * 人员信息
 * @author Coyote
 *
 */
@Entity
@Table(name="personnel_infomation")
public class Personnel extends BaseBeanImpl {

	private String id;
	private String name;
	private String gender;
	private String seniority;
	private String drvingExperience;
	private String level;
	private BigDecimal price;
	private int starLevel;
	private String licenseType;
	private String techLicenseType;
	private String telNbr;
	
	
	@Override
	@Id @Column(name="id")public String getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	/**
	 * @return the name
	 */
	@Column(name="name")
	public String getName() {
		return name;
	}

	/**
	 * @return the gender
	 */
	@Column(name="gender")public String getGender() {
		return gender;
	}

	/**
	 * @return the seniority
	 */
	@Column(name="seniority")public String getSeniority() {
		return seniority;
	}

	/**
	 * @return the drvingExperience
	 */
	@Column(name="drving_experience")public String getDrvingExperience() {
		return drvingExperience;
	}

	/**
	 * @return the level
	 */
	@Column(name="level")public String getLevel() {
		return level;
	}

	/**
	 * @return the price
	 */
	@Column(name="price")public BigDecimal getPrice() {
		return price;
	}

	/**
	 * @return the starLevel
	 */
	@Column(name="star_level")public int getStarLevel() {
		return starLevel;
	}

	/**
	 * @return the licenseType
	 */
	@Column(name="license_type")public String getLicenseType() {
		return licenseType;
	}

	/**
	 * @return the techLicenseType
	 */
	@Column(name="tech_license_type")public String getTechLicenseType() {
		return techLicenseType;
	}

	/**
	 * @return the telNbr
	 */
	@Column(name="tel_nbr")public String getTelNbr() {
		return telNbr;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @param seniority the seniority to set
	 */
	public void setSeniority(String seniority) {
		this.seniority = seniority;
	}

	/**
	 * @param drvingExperience the drvingExperience to set
	 */
	public void setDrvingExperience(String drvingExperience) {
		this.drvingExperience = drvingExperience;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * @param starLevel the starLevel to set
	 */
	public void setStarLevel(int starLevel) {
		this.starLevel = starLevel;
	}

	/**
	 * @param licenseType the licenseType to set
	 */
	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}

	/**
	 * @param techLicenseType the techLicenseType to set
	 */
	public void setTechLicenseType(String techLicenseType) {
		this.techLicenseType = techLicenseType;
	}

	/**
	 * @param telNbr the telNbr to set
	 */
	public void setTelNbr(String telNbr) {
		this.telNbr = telNbr;
	}

}

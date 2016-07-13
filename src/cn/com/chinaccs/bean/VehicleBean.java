package cn.com.chinaccs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.dao.impl.VehicleDao;

@Entity
@Table(name = "t_v_vehicle_basicinfo")
public class VehicleBean extends BaseBeanImpl{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6918704016298883007L;
	/**
	 * 卡号、车牌号、车架号、车主、联系人、联系电话、车辆所属公司---车辆基本信息
	 */
	private String id;
	private String licensePlate;
	private String frameNbr;
	private String owner;
	private String contacts;
	private String contactNbr;
	private String vehicleCompany;
	private String orgId; //固定维修点（检测站）
	

	@Override
	@Id
	@Column(name="card_id")
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the licensePlate
	 */
	@Column(name="license_place")
	public String getLicensePlate() {
		return licensePlate;
	}

	/**
	 * @param licensePlate the licensePlate to set
	 */
	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	/**
	 * @return the frameNbr
	 */
	@Column(name="frame_number")
	public String getFrameNbr() {
		return frameNbr;
	}

	/**
	 * @param frameNbr the frameNbr to set
	 */
	public void setFrameNbr(String frameNbr) {
		this.frameNbr = frameNbr;
	}

	/**
	 * @return the owner
	 */
	@Column(name="owner")
	public String getOwner() {
		return owner;
	}

	/**
	 * @param owner the owner to set
	 */
	public void setOwner(String owner) {
		this.owner = owner;
	}

	/**
	 * @return the contacts
	 */
	@Column(name="contacts")
	public String getContacts() {
		return contacts;
	}

	/**
	 * @param contacts the contacts to set
	 */
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	/**
	 * @return the contactNbr
	 */
	@Column(name="contact_number")
	public String getContactNbr() {
		return contactNbr;
	}

	/**
	 * @param contactNbr the contactNbr to set
	 */
	public void setContactNbr(String contactNbr) {
		this.contactNbr = contactNbr;
	}

	/**
	 * @return the vehicleCompany
	 */
	@Column(name="vehicle_company")
	public String getVehicleCompany() {
		return vehicleCompany;
	}

	/**
	 * @param vehicleCompany the vehicleCompany to set
	 */
	public void setVehicleCompany(String vehicleCompany) {
		this.vehicleCompany = vehicleCompany;
	}
	
	public String save(){
		VehicleDao dao = new VehicleDao();
		return dao.persist(this);
	}

	public static void main(String[] args){
		VehicleBean bean = new VehicleBean();
		bean.setContactNbr("12233344444");
		bean.setContacts("cccbbb");
		bean.setFrameNbr("slie1343243243241432");
		bean.setId("VEH89053471998543");
		bean.setLicensePlate("云A223344");
		bean.setOwner("fu");
		bean.setVehicleCompany("丽江旅游");
		System.out.println(bean.save());
		
	}
	
	public boolean remove(){
		VehicleDao dao = new VehicleDao();
		return dao.delete(this.getId());
	}

	/**
	 * @return the orgId
	 */
	@Column(name="org_id")
	public String getOrgId() {
		return orgId;
	}

	/**
	 * @param orgId the orgId to set
	 */
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

}

package cn.com.chinaccs.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.dao.impl.VehicleMaintenanceDao;

@Entity
@Table(name="t_v_vehicle_maintenance")
public class VehicleMaintenanceInfo extends BaseBeanImpl{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4280241461761655852L;
	
	/**
	 * 例保日期、例保地点、例保情况、例保检测人
	 */
	private String id;
	private String vehicleId;
	private String maintenance;
	private String inspector;
	private String orgId;
	private java.util.Date mtnTime;

	@Override
	@Id
	@Column(name="m_id")
	public String getId() {
		return this.id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
		
	}
	
	/**
	 * @return the maintenance
	 */
	@Column(name="maintenance")
	public String getMaintenance() {
		return maintenance;
	}

	/**
	 * @param maintenance the maintenance to set
	 */
	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}

	/**
	 * @return the inspector
	 */
	@Column(name="inspector")
	public String getInspector() {
		return inspector;
	}

	/**
	 * @param inspector the inspector to set
	 */
	public void setInspector(String inspector) {
		this.inspector = inspector;
	}

	/**
	 * @return the vehicleId
	 */
	@Column(name="vehicle_id")
	public String getVehicleId() {
		return vehicleId;
	}

	/**
	 * @param vehicleId the vehicleId to set
	 */
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	
	public String save(){
		VehicleMaintenanceDao dao = new VehicleMaintenanceDao();
		return dao.persist(this);
	}
	
	public static void main(String[] args){
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

	/**
	 * @return the mtnTime
	 */
	@Column(name="mtn_time")
	public java.util.Date getMtnTime() {
		return mtnTime;
	}

	/**
	 * @param mtnTime the mtnTime to set
	 */
	public void setMtnTime(java.util.Date mtnTime) {
		this.mtnTime = mtnTime;
	}

}

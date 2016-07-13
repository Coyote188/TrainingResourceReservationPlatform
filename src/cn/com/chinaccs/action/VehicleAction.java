package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.VehicleBean;
import cn.com.chinaccs.service.VehicleService;

public class VehicleAction extends BaseImplAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7818179476391560794L;

	private VehicleBean objBean;
	private String vCardId,orgId;
	
	
	@Override 
	public String add() throws Exception {
		VehicleService serv = new VehicleService();
		if(null != objBean) {
			if(null == objBean.getId())
				objBean.setId(vCardId);
		   chResponse = serv.vehicleSave(objBean);
		   return json();
		}
		return super.add();
	}
	
	public String add4CardReader() throws Exception {
		VehicleService serv = new VehicleService();
		if(null != objBean) {
			if(null == objBean.getId())
				objBean.setId(vCardId);
		   chResponse = serv.vehicleSave(objBean);
		   return json();
		}
		return super.add();
	}
	
	@Override
	public String edit() throws Exception {
		VehicleService serv = new VehicleService();
		if(null != objBean) {
		   chResponse = serv.vehicleSave(objBean);
		   return json();
		}else{
			objBean = serv.loadVehicle(id);
		}
		return super.add();
	}
	
	@Override
	public String del() throws Exception {
		VehicleService serv = new VehicleService();
	   chResponse = serv.remove(id);
	   return json();
	}
	

	public VehicleBean getObjBean() {
		return objBean;
	}

	public void setObjBean(VehicleBean objBean) {
		this.objBean = objBean;
	}

	/**
	 * @return the vCardId
	 */
	public String getVCardId() {
		return vCardId;
	}

	/**
	 * @param vCardId the vCardId to set
	 */
	public void setVCardId(String vCardId) {
		this.vCardId = vCardId;
	}

	/**
	 * @return the orgId
	 */
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

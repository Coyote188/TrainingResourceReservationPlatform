package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.VehicleBean;
import cn.com.chinaccs.bean.VehicleMaintenanceInfo;
import cn.com.chinaccs.service.VehicleService;

public class MaintanenceAction extends BaseImplAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7818179476391560794L;

	private VehicleMaintenanceInfo objBean;
	private VehicleBean veBean;
	private String orgId;
	private String con;
	private String l,p,m;
	private String vCardId;
	
	public String listQr() throws Exception {
		// TODO Auto-generated method stub
		return super.list();
	}
	
	public String maintainList() throws Exception {
		// TODO Auto-generated method stub
		return super.list();
	}
	
	@Override 
	public String add() throws Exception {
		VehicleService serv = new VehicleService();
		orgId = userInfo.getOrgId();
		if(null != objBean) {
		   chResponse = serv.maintanence(objBean);
		   return json();
		}else{
			objBean = new VehicleMaintenanceInfo();
			objBean.setOrgId(orgId);
		}
		return super.add();
	}
	
	public String main_add() throws Exception {
		VehicleService serv = new VehicleService();
		orgId = userInfo.getOrgId();
		
		veBean = serv.loadVehicle(vCardId);
		
		return super.add();
	}
	
	@Override
	public String edit() throws Exception {
		VehicleService serv = new VehicleService();
		if(null != objBean) {
		   chResponse = serv.maintanence(objBean);
		   return json();
		}
		return super.add();
	}
	
	@Override
	public String del() throws Exception {
		VehicleService serv = new VehicleService();
	   chResponse = serv.removeMaintainLog(id);
	   return json();
	}

	/**
	 * @return the objBean
	 */
	public VehicleMaintenanceInfo getObjBean() {
		return objBean;
	}

	/**
	 * @param objBean the objBean to set
	 */
	public void setObjBean(VehicleMaintenanceInfo objBean) {
		this.objBean = objBean;
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

	/**
	 * @return the con
	 */
	public String getCon() {
		return con;
	}

	/**
	 * @param con the con to set
	 */
	public void setCon(String con) {
		this.con = con;
	}

	/**
	 * @return the l
	 */
	public String getL() {
		return l;
	}

	/**
	 * @param l the l to set
	 */
	public void setL(String l) {
		this.l = l;
	}

	/**
	 * @return the p
	 */
	public String getP() {
		return p;
	}

	/**
	 * @param p the p to set
	 */
	public void setP(String p) {
		this.p = p;
	}

	/**
	 * @return the m
	 */
	public String getM() {
		return m;
	}

	/**
	 * @param m the m to set
	 */
	public void setM(String m) {
		this.m = m;
	}

	/**
	 * @return the veBean
	 */
	public VehicleBean getVeBean() {
		return veBean;
	}

	/**
	 * @param veBean the veBean to set
	 */
	public void setVeBean(VehicleBean veBean) {
		this.veBean = veBean;
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
	

	
}

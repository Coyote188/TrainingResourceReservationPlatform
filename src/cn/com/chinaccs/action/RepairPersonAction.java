package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.entity.TVRepairPerson;
import cn.com.chinaccs.service.RepairPersonService;
import cn.com.chinaccs.utils.StringUtil;

public class RepairPersonAction extends BaseImplAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7818179476391560794L;

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	private TVRepairPerson objBean;
	private String orgId;
	
	@Override 
	public String add() throws Exception {
		RepairPersonService serv = new RepairPersonService();
		if(null != objBean) {
		   chResponse = serv.repairPersonSave(objBean);
		   return json();
		}
		return super.add();
	}
	
	@Override
	public String edit() throws Exception {
		RepairPersonService serv = new RepairPersonService();
		if(null != objBean) {
		   chResponse = serv.upd(objBean);
		   return json();
		}
		return super.edit();
	}
	
	@Override
	public String del() throws Exception {
		RepairPersonService serv = new RepairPersonService();
	   chResponse = serv.remove(id);
	   return json();
	}
	
	@Override
	public String list() throws Exception {
		if(StringUtil.isEmpty(orgId)) {
			orgId = userInfo.getOrgId();
		}
		return super.list();
	}

	/**
	 * 查询维修保养人下拉列表信息
	 */
	public String itemPerson() throws Exception {
		if(StringUtil.isEmpty(orgId)) {
			orgId = userInfo.getOrgId();
		}
		RepairPersonService serv = new RepairPersonService();
		chResponse = serv.getItem(orgId);
		return json();
	}
	
	public TVRepairPerson getObjBean() {
		return objBean;
	}

	public void setObjBean(TVRepairPerson objBean) {
		this.objBean = objBean;
	}
}

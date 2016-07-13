package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.service.OrgService;
import cn.com.chinaccs.service.UserService;


public class orgAction extends BaseImplAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -622631673389953202L;
	
	private String queryOrgId;
	private String queryOrgName;
	private TNOrg objBean;
	private OrgService orgServ;
	private String flag;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	@Override
	public String add() throws Exception {
		if(null != objBean) {
			orgServ = new OrgService();
		   chResponse = orgServ.save(objBean);
		   return json();
		}
		return super.add();
	}

	@Override
	public String edit() throws Exception {
		if(null != objBean) {
			orgServ = new OrgService();
		   chResponse = orgServ.upd(objBean);
		   return json();
		}
		return super.edit();
	}
	
	@Override
	public String del() throws Exception {
		orgServ = new OrgService();
		chResponse = orgServ.del(id);
		return json();
	}

	public String orgZtree() throws Exception {
	   String user_orgId = userInfo.getOrgId();
	   orgServ = new OrgService();
	   chResponse = orgServ.getzTree(queryOrgId,queryOrgName,user_orgId);
	 
	   return json();
	}
	
	/**
	 * author: xiaoliping 
	 * descr: 表单中的组织机构下拉树
	 */
	public String orgFormZtree() throws Exception {
		   String user_orgId = userInfo.getOrgId();
		   orgServ = new OrgService();
		   chResponse = orgServ.getFormzTree(queryOrgId,queryOrgName,flag,user_orgId);		 
		   return json();
	}
	
	public String getQueryOrgId() {
		return queryOrgId;
	}

	public void setQueryOrgId(String queryOrgId) {
		this.queryOrgId = queryOrgId;
	}





	public String getQueryOrgName() {
		return queryOrgName;
	}

	public void setQueryOrgName(String queryOrgName) {
		this.queryOrgName = queryOrgName;
	}

	public TNOrg getObjBean() {
		return objBean;
	}

	public void setObjBean(TNOrg objBean) {
		this.objBean = objBean;
	}

	public OrgService getOrgServ() {
		return orgServ;
	}

	public void setOrgServ(OrgService orgServ) {
		this.orgServ = orgServ;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
}

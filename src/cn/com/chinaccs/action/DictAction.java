package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.entity.TNDict;
import cn.com.chinaccs.service.DictService;
import cn.com.chinaccs.service.OrgService;

public class DictAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9169739565142888476L;
	
	private DictService dictServ;
	
	private String busiValue;
	
	private TNDict objBean;
	
	@Override
	public String add() throws Exception {
		if(null != objBean) {
			DictService serv = new DictService();
		   chResponse = serv.save(objBean);
		   return json();
		}
		return super.add();
	}
	
	@Override
	public String edit() throws Exception {
		if(null != objBean) {
			DictService serv = new DictService();
		   chResponse = serv.upd(objBean);
		   return json();
		}
		return super.add();
	}
	
	@Override
	public String del() throws Exception {
	   DictService serv = new DictService();
	   chResponse = serv.del(id);
	   return json();
	}
	
	public String item() throws Exception {
		dictServ = new DictService();
		chResponse = dictServ.getItem(busiValue);
		return json();
	}

	public String getBusiValue() {
		return busiValue;
	}

	public void setBusiValue(String busiValue) {
		this.busiValue = busiValue;
	}

	public TNDict getObjBean() {
		return objBean;
	}

	public void setObjBean(TNDict objBean) {
		this.objBean = objBean;
	}

	
}

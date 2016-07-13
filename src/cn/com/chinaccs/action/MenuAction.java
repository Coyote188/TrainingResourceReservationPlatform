package cn.com.chinaccs.action;

import java.util.List;

import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.service.MenuService;
import cn.com.chinaccs.service.OrgService;

public class MenuAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6063096323193557116L;
	
	private TNMenu objBean;
	private MenuService menuServ;
	
	public String add() throws Exception {
		if(null != objBean) {
		   menuServ = new MenuService();
		   List<String> roleIds =  userInfo.getRoleIds();
		   chResponse = menuServ.save(objBean,roleIds);
		   menuServ = null;
		   return json();
		}
		return SUCCESS;
	}
	
	@Override
	public String edit() throws Exception {
		if(null != objBean) {
		   menuServ = new MenuService();
		   chResponse = menuServ.upd(objBean);
		   menuServ = null;
		   return json();
		}
		return super.edit();
	}
	
	@Override
	public String del() throws Exception {
		menuServ = new MenuService();
		chResponse = menuServ.del(id);
		menuServ = null;
		return json();
	}

	public TNMenu getObjBean() {
		return objBean;
	}

	public void setObjBean(TNMenu objBean) {
		this.objBean = objBean;
	}

	public MenuService getMenuServ() {
		return menuServ;
	}

	public void setMenuServ(MenuService menuServ) {
		this.menuServ = menuServ;
	}
	
	


	
}

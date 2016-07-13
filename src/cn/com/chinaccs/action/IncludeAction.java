package cn.com.chinaccs.action;

import java.util.List;

import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.service.MenuHelper;
import cn.com.chinaccs.service.MenuService;
import cn.com.chinaccs.service.OrgService;


public class IncludeAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3610273146959114728L;
	
	private MenuService menuServ;
	
	private List<TNMenu> menus;
	
	private TNMenu menu;
	
	private String menuTreeHtml;
	

	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
//	@SuppressWarnings("unchecked")
//	public String header() throws Exception {
//		if(null == menuServ) {
//			menuServ = new MenuService();
//		}
//		chResponse = menuServ.getRootMenus(getUserId());
//		if(chResponse.getResult().equals(OP_SUCCESS)) {
//			menus = (List<TNMenu>)chResponse.getData();
//		}
//		if("json".equals(returnType)) {
//			return json();
//		} else {
//			return SUCCESS;
//		}
//	}
	
	@SuppressWarnings("unchecked")
	public String header() throws Exception {
		if(null == menuServ) {
			menuServ = new MenuService();
		}
		List<TNMenu> mymenus = menuServ.getMenus(userInfo.getRoleIds(),userInfo.getComRoleIds());
		chResponse = menuServ.getRootMenus(mymenus);
		if(chResponse.getResult().equals(OP_SUCCESS)) {
			menus = (List<TNMenu>)chResponse.getData();
		}
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	public String headerMaintain() throws Exception {
		if(null == menuServ) {
			menuServ = new MenuService();
		}
		List<TNMenu> mymenus = menuServ.getMenus(userInfo.getRoleIds(),userInfo.getComRoleIds());
		chResponse = menuServ.getRootMenus(mymenus);
		if(chResponse.getResult().equals(OP_SUCCESS)) {
			menus = (List<TNMenu>)chResponse.getData();
		}
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	
	public String fullHeader() throws Exception {
		return SUCCESS;
	}
	
//	public String menu() throws Exception {
//		if(null == menuServ) {
//			menuServ = new MenuService();
//		}
//		menu = menuServ.getMenuByAction(currentUri,getUserId());
//		chResponse = menuServ.getChildTree(menu,getUserId());
//		output = getDataJson();
//		if("json".equals(returnType)) {
//			return json();
//		} else {
//			return SUCCESS;
//		}
//	}
	
	public String menu() throws Exception {
		if(null == menuServ) {
			menuServ = new MenuService();
		}
		List<TNMenu> mymenus = menuServ.getMenus(userInfo.getRoleIds(), userInfo.getComRoleIds());
		menu = menuServ.getHeadMenu(currentUri,mymenus);
		chResponse = menuServ.getMenuTree(menu,mymenus);
		menus = (List<TNMenu>)chResponse.getData();
		MenuHelper helper = new MenuHelper( (List<TreeProp>)chResponse.getData());
		menuTreeHtml = helper.getMenuHtml();
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	public String menuMaintain() throws Exception {
		if(null == menuServ) {
			menuServ = new MenuService();
		}
		List<TNMenu> mymenus = menuServ.getMenus(userInfo.getRoleIds(), userInfo.getComRoleIds());
		menu = menuServ.getHeadMenu(currentUri,mymenus);
		chResponse = menuServ.getMenuTree(menu,mymenus);
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	/**
	 * zTree 组织机构树
	 * */
	public String orgZtree() throws Exception {
		OrgService orgServ = new OrgService();
		String user_orgId = userInfo.getOrgId();
		chResponse = orgServ.getzTree("","",user_orgId);
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	
	/**
	 * orgZtree4Main 组织机构树
	 * */
	public String orgZtree4Main() throws Exception {
		OrgService orgServ = new OrgService();
		String user_orgId = userInfo.getOrgId();
		chResponse = orgServ.getzTree("","",user_orgId);
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}

	/**
	 * orgZtree4Repair 组织机构树
	 * */
	public String orgZtree4Repair() throws Exception {
		OrgService orgServ = new OrgService();
		String user_orgId = userInfo.getOrgId();
		chResponse = orgServ.getzTree("","",user_orgId);
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	
	/**
	 * 组织机构树
	 * @return
	 * @throws Exception
	 */
	public String orgTree() throws Exception {
		OrgService orgServ = new OrgService();
		chResponse = orgServ.getSubTree(userInfo.getOrgId());
		output = getDataJson();
		if("json".equals(returnType)) {
			return json();
		} else {
			return SUCCESS;
		}
	}
	
	public String footer() throws Exception {
		return SUCCESS;
	}

	public List<TNMenu> getMenus() {
		return menus;
	}

	public void setMenus(List<TNMenu> menus) {
		this.menus = menus;
	}

	public MenuService getMenuServ() {
		return menuServ;
	}

	public void setMenuServ(MenuService menuServ) {
		this.menuServ = menuServ;
	}

	public String getMenuTreeHtml() {
		return menuTreeHtml;
	}

	public void setMenuTreeHtml(String menuTreeHtml) {
		this.menuTreeHtml = menuTreeHtml;
	}

	public TNMenu getMenu() {
		return menu;
	}

	public void setMenu(TNMenu menu) {
		this.menu = menu;
	}
	
}

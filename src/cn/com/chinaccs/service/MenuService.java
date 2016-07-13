package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.dao.impl.MenuDao;
import cn.com.chinaccs.helper.TreeHelper;
import cn.com.chinaccs.memory.menu.MenuMemory;
import cn.com.chinaccs.utils.StringUtil;

public class MenuService extends BaseService {

	private MenuDao menuDao;
	
	public MenuService() {
		menuDao = new MenuDao();
	}
	
	/**
	 * 保存
	 * @param roleIds 
	 * */
	public CHResponse save(TNMenu menu, List<String> roleIds) {
		CHResponse chResponse = new CHResponse();
		if(null != menu){
			MenuDao menuDao = new MenuDao();
			Serializable id = menuDao.save(menu,roleIds);
			if(null != id) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
				MenuMemory.getInstance().importDate();//重置菜单角色缓存
			}
			menuDao = null;
		}
		return chResponse;
	}
	
	/**
	 * 更新
	 * */
	public CHResponse upd(TNMenu menu) {
		CHResponse chResponse = new CHResponse();
		if(null != menu){
			String pId = menu.getParentId();
			TNMenu pmenu = new TNMenu();
			pmenu = menuDao.find(pId);
			if (pmenu != null && pmenu.getLevel() != null) {
				menu.setLevel(pmenu.getLevel() + 1); // 添加菜单等级
			} else {
				menu.setLevel(1); // 添加菜单等级
			}
			if(StringUtil.isEmpty(menu.getParentId())) {
				menu.setParentId("0");
			}
			if(menuDao.update(menu)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("菜单修改成功");
				MenuMemory.getInstance().initMenu();//重置菜单角色缓存
			}
			menuDao =null;
		}
		return chResponse;
	}
	
	/**
	 * 删除
	 * */
	public CHResponse del(String id) {
		CHResponse chResponse = new CHResponse();
		if(null != id) {
			if(menuDao.delete(id)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("用户数据删除成功");
				MenuMemory.getInstance().importDate();//重置菜单角色缓存
			}
		}
		menuDao = null;
		return chResponse;
	}
	/**
	 * 获取根菜单
	 * 
	 * @return
	 */
//	public CHResponse getRootMenus(String userId) {
//		CHResponse chResponse = new CHResponse();
//		MenuDao menuDao = new MenuDao();
//		List<TNMenu> menus = menuDao.getUserMenus(userId);
//		List<TNMenu> tmpMenus = new ArrayList<TNMenu>();
//		if (null != menus && menus.size() > 0) {
//			for (TNMenu menu : menus) {
//				if (menu.getParentId().equals("0")) {
//					tmpMenus.add(menu);
//				}
//			}
//		}
//		if (tmpMenus.size() > 0) {
//			chResponse.setResult(OP_SUCCESS);
//			chResponse.setMsg(OP_SUCCESS_MSG);
//			chResponse.setData(tmpMenus);
//		}
//		tmpMenus = null;
//		menus = null;
//		return chResponse;
//	}
	
	public CHResponse getRootMenus(List<TNMenu> menus) {
		CHResponse chResponse = new CHResponse();
		List<TNMenu> tmpMenus = new ArrayList<TNMenu>();
		if (null != menus && menus.size() > 0) {
			for (TNMenu menu : menus) {
				if (menu.getParentId().equals("0")) {
					tmpMenus.add(menu);
				}
			}
		}
		if (tmpMenus.size() > 0) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg(OP_SUCCESS_MSG);
			chResponse.setData(tmpMenus);
		}
		tmpMenus = null;
		menus = null;
		return chResponse;
	}
	

	/**
	 * 
	 * @param actionName
	 * @param userId
	 * @return
	 */
//	public TNMenu getMenuByAction(String actionName,String userId) {
//		List<TNMenu> menus = menuDao.getUserMenus(userId);
//		TNMenu tmpMenu = null;
//		if(null != menus && menus.size()>0) {
//			for (TNMenu menu : menus) {
//				if (menu.getUri().equals(actionName)) {
//					tmpMenu = menu;
//					break;
//				}
//			}
//			if (tmpMenu == null) {
//				tmpMenu = menus.get(0);
//			}
//			menus = null;
//		}
//		return tmpMenu;
//	}
	
	/**
	 * 
	 * @param menuName
	 * @return
	 */
	public TNMenu getMenuByMenuName(String menuName,String userId) {
		List<TNMenu> menus = menuDao.getUserMenus(userId);
		TNMenu tmpMenu = null;
		for (TNMenu menu : menus) {
			if (menu.getMenuName().equals(menuName)) {
				tmpMenu = menu;
				break;
			}
		}
		if (tmpMenu == null) {
			tmpMenu = menus.get(0);
		}
		menus = null;
		return tmpMenu;
	}

	/**
	 * 
	 * @param menu
	 * @param userId
	 * @return
	 */
//	public CHResponse getChildTree(TNMenu menu,String userId) {
//		CHResponse chResponse = new CHResponse();
//		List<TNMenu> menus = null;
//		if (null != menu) {
//			menus = getShowMenus(userId);
//			if(null != menus && menus.size()>0) {
//				
//				List<TreeProp> trees = new ArrayList<TreeProp>();
//				TreeProp treeProp = null;
//				for (TNMenu menuTmp : menus) {
//					treeProp = new TreeProp();
//					treeProp.setId(menuTmp.getId());
//					treeProp.setName(menuTmp.getMenuName());
//					treeProp.setParentId(menuTmp.getParentId());
//					treeProp.setSeqNum(menuTmp.getSeqNum());
//					treeProp.setFlag("");
//					treeProp.setUri(menuTmp.getUri());
//					trees.add(treeProp);
//				}
//				menus = null;
//				treeProp = new TreeProp();
//				treeProp.setId(menu.getId());
//				TreeHelper<TreeProp> treeHelper = new TreeHelper<TreeProp>();
//				try {
//					trees = treeHelper.outPutTree(trees, treeProp, false);
//					if (null != trees && trees.size() > 0) {
//						chResponse.setResult(OP_SUCCESS);
//						chResponse.setMsg(OP_SUCCESS_MSG);
//						chResponse.setData(trees);
//						chResponse.setSize(trees.size());
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					trees = null;
//					treeProp = null;
//				}
//			}
//				
//		}
//		return chResponse;
//	}

	/**
	 * 获取可以显示在页面上的菜单
	 * @param userId
	 * @return
	 */
	protected List<TNMenu> getShowMenus(String userId) {
		List<TNMenu> menus = menuDao.getUserMenus(userId);
		/*List<TNMenu> menuTmps = new ArrayList<TNMenu>();
		for (TNMenu menu : menus) {
			if (menu.getState().intValue()==1) {
				menuTmps.add(menu);
			}
		}*/
		return menus.size() > 0 ? menus : null;
	}

	
	/**
	 * 获取导航菜单及菜单树
	 * @param currentUri 
	 * @param menu
	 * @param userId
	 * @return
	 */
	public CHResponse getMenuTree(TNMenu tmpMenu,List<TNMenu> menus) {
		CHResponse chResponse = new CHResponse();

		if (null != tmpMenu) {
			if(null != menus && menus.size()>0) {
				List<TreeProp> trees = new ArrayList<TreeProp>();
				TreeProp treeProp = null;
				for (TNMenu menuTmp : menus) {
					treeProp = new TreeProp();
					treeProp.setId(menuTmp.getId());
					treeProp.setName(menuTmp.getMenuName());
					treeProp.setParentId(menuTmp.getParentId());
					treeProp.setSeqNum(menuTmp.getSeqNum());
					treeProp.setFlag("");
					treeProp.setUri(menuTmp.getUri());
					trees.add(treeProp);
				}
				menus = null;
				treeProp = new TreeProp();
				treeProp.setId(tmpMenu.getId());
				TreeHelper<TreeProp> treeHelper = new TreeHelper<TreeProp>();
				try {
					trees = treeHelper.outPutTree(trees, treeProp, false);
					if (null != trees && trees.size() > 0) {
						chResponse.setResult(OP_SUCCESS);
						chResponse.setMsg(OP_SUCCESS_MSG);
						chResponse.setData(trees);
						chResponse.setSize(trees.size());
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					trees = null;
					treeProp = null;
				}
			}
				
		}
		return chResponse;
	}
	
	/**
	 * 获取当前被点击 导航栏 对象
	 * */
	public TNMenu getHeadMenu(String actionName,List<TNMenu> menus) {
		TNMenu tmpMenu = null;
		if(null != menus && menus.size()>0) {
			for (TNMenu menu : menus) {
				if (menu.getUri().equals(actionName)) {
					tmpMenu = menu;
					break;
				}
			}
			if (tmpMenu == null) {
				tmpMenu = menus.get(0);
			}
			menus = null;
		}
		return tmpMenu;
	}
	
	
	/**
	 * 根据用户角色过滤菜单
	 * @param comRoleId 
	 * */
	public List<TNMenu> getMenus(List<String> roleIds, List<String> comRoleId){
		List<TNMenu> temlist = new ArrayList<TNMenu>();
		List<TNMenu> menus = MenuMemory.menu_memory;
		List<TNRoleMenu> rms = MenuMemory.rm_memory;
		List<String> rmIds = new ArrayList<String>();
		Set<String> set = new HashSet<String>();
		if(null != comRoleId && comRoleId.size()>0)
			roleIds.addAll(comRoleId);
		if(null != roleIds && roleIds.size()>0){
			for(String uRoleId : roleIds){
				uRoleId = StringUtil.handNull(uRoleId);
				if(null != rms && rms.size()>0){
					for(TNRoleMenu rm : rms){
						String rmId = StringUtil.handNull(rm.getRoleId());
						if(uRoleId.equals(rmId))
							rmIds.add(rm.getMenuId());
					}
				}
			}
		}
		set.addAll(rmIds);
		rmIds.clear();
		rmIds.addAll(set);//去重
		
		if(null != menus && menus.size()>0){
			for(TNMenu menu : menus){
				String menuId = menu.getId();
				if(null != rmIds && rmIds.size()>0){
					for(String rmId : rmIds){
						if(menuId.equals(StringUtil.handNull(rmId)))
							temlist.add(menu);
					}
				}
			}
		}
		return temlist;
	}
	

}

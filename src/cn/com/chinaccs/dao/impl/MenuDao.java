package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.helper.TreeHelper;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.StringUtil;

public class MenuDao extends BaseDaoImpl<TNMenu>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 220294470621336821L;
	
	private static SqlMapping sqlMap = new SqlMapping("/cn/com/chinaccs/res/sql/sql_menu.xml");
	private Map<String, Object> params;
	
	
	public List<TNMenu> getValidAll() {
		List<TNMenu> menus = null;
		String hql = sqlMap.getSQL("valid_menu");
		if(!StringUtil.isEmpty(hql)) {
			menus = queryHql(hql);
		}
		return (menus != null && menus.size()>0) ? menus : null;
	}
	
	/**
	 * 
	 * @return
	 */
	public List<TNMenu> getRootMenus() {
		List<TNMenu> menus = null;
		String hql = sqlMap.getSQL("root_menu");
		if(!StringUtil.isEmpty(hql)) {
			menus = queryHql(hql);
		}
		return (menus != null && menus.size()>0) ? menus : null;
	}
	
	
	/**
	 * 
	 * @param actionName
	 * @return
	 */
	public List<TNMenu> getMenuByAction(String actionName) {
		List<TNMenu> menus = null;
		String hql = sqlMap.getSQL("action_menu");
		if(!StringUtil.isEmpty(hql)) {
			params = new HashMap<String, Object>();
			params.put("action", actionName);
			menus = queryHql(hql,params);
			params = null;
		}
		return (menus != null && menus.size()>0) ? menus : null;
	}
	
	@Override
	public boolean delete(Serializable id) {
		boolean is = false;
		if(null != id && !StringUtil.isEmpty(id.toString())) {
			List<TNMenu> lists = findAll();
			String[] ids = id.toString().split(",");
			for(String idTmp : ids) {
				if(null != lists && lists.size()>0) {
					TreeHelper<TNMenu> treeHelper = new TreeHelper<TNMenu>();
					List<TNMenu> listTmps = null;
					String delIds = "'"+idTmp+"',";
					TNMenu tmp = new TNMenu();
					tmp.setId(idTmp);
					try {
						listTmps = treeHelper.outPutTree(lists, tmp,false);
						if(null != listTmps && listTmps.size()>0) {
							for (int i = 0; i < listTmps.size(); i++) {
								if(i != (listTmps.size()-1)) {
									delIds += "'"+listTmps.get(i).getId()+"',";
								} else {
									delIds += "'"+listTmps.get(i).getId()+"'";
								}
							}
						} else {
							delIds = delIds.replace(",", "");
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						treeHelper = null;
						listTmps = null;
						tmp = null;
					}
					if(!StringUtil.isEmpty(delIds)) {
						String delSql = "delete from T_N_MENU where id in ("+delIds+")";
						String delRMSql = "delete from T_N_ROLE_MENU where menu_id in("+delIds+")";
						if(executeSql(delSql)>0) {
							executeSql(delRMSql);//关联删除角色菜单数据
							is = true;
						} else {
							is = false;
						}
					}
				}
			}
		}
		return is;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<TNMenu> getUserMenus(String userId) {
		List<TNMenu> menus = null;
		if(!StringUtil.isEmpty(userId)) {
			String sql = sqlMap.getSQL("user_menu");
			if(!StringUtil.isEmpty(sql)) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("userId", userId);
				List<TNMenu> lists = (List<TNMenu>)querySql(sql, param);
				if(null != lists && lists.size()>0) {
					TNMenu menu = null;
					menus = new ArrayList<TNMenu>();
					for(Object obj : lists) {
						Object[] objs = (Object[]) obj;
						menu = new TNMenu();
						menu.setId(StringUtil.handNull(objs[0]));
						menu.setLevel(Integer.parseInt(StringUtil.handNumNull(objs[1]).toString()));
						menu.setMenuName(StringUtil.handNull(objs[2].toString()));
						menu.setParentId(StringUtil.handNull(objs[3].toString()));
						menu.setSeqNum(Integer.parseInt(StringUtil.handNumNull(objs[4]).toString()));
						menu.setState(Integer.parseInt(StringUtil.handNumNull(objs[5]).toString()));
						menu.setUri(StringUtil.handNumNull(objs[6]).toString());
						menus.add(menu);
					}
				}
				lists = null;
				param = null;
			}
		}
		return menus;
	}

	/**
	 * 
	 * @param o
	 * @param roleIds
	 * @return
	 */
	public Serializable save(TNMenu o,List<String> roleIds) {
		String pId = o.getParentId();
		TNMenu pmenu = find(pId);
		if (pmenu != null && pmenu.getLevel() != null) {
			o.setLevel(pmenu.getLevel() + 1); // 添加菜单等级
		} else {
			o.setLevel(1); // 添加菜单等级
		}
		if(StringUtil.isEmpty(o.getUri())) {
			o.setUri("index/"+o.getMenuName());
		}
		if(StringUtil.isEmpty(o.getParentId())) {
			o.setParentId("0");
		}
		o.setMenuType(TNMenu.MENU_TYPE_BASE);//添加菜单类型
		
		Serializable id = super.save(o);
		if(null != id) {
			TNRoleMenu roleMenu = null;
			List<TNRoleMenu> lists = new ArrayList<TNRoleMenu>();
			for (String roleId : roleIds) {
				roleMenu = new TNRoleMenu();
				roleMenu.setMenuId(id.toString());
				roleMenu.setRoleId(roleId);
				lists.add(roleMenu);
			}
			RoleMenuDao rmDao = new RoleMenuDao();
			rmDao.save(lists);
			lists = null;
			roleIds = null;
			o = null;
		}
		return id;
	}
	
	/**
	 * 判断用户是否为公众用户 
	 * @param roleId
	 * @return
	 */
	public boolean isPublicPortal(String roleId){
		String sql = "select a.* from t_n_menu a, t_n_role_menu b where a.id = b.menu_id and b.role_id = '" + roleId + "'";
		List<TNMenu> menus = this.querySql(sql);
		if(menus.size()>0){
			if(menus.get(0).getUri().equals(TNMenu.MENU_URI_PORTAL))
				return true;
		}
		return false;
	}
}

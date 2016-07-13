package cn.com.chinaccs.webstart.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

/**
 * @author Fddi
 * 
 */
public class AdminBusi extends WebStartBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5156374398716822568L;
	private SqlMapping sm;
	private Map<String, Object> params;

	public AdminBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_admin.xml");
	}

	/**
	 * 数据字典按tag查询
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getDictChildren(String tag) {
		params = new HashMap<String, Object>();
		params.put("tag", tag);
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			List<Object> list = dao
					.queryList(sm.getSQL("dataChildren"), params);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("获取数据字典按tag查询[" + tag + "]------" + json.toString());
		return json.toString();
	}

	/**
	 * 获取组织机构配置数据业务
	 * 
	 * @param roleId
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getLimitOrgTreeDataBusi(String roleId) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			params = new HashMap<String, Object>();
			params.put("roleId", roleId);
			List<Object> list = dao.queryList(sm.getSQL("limitOrg"), params);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			} else {
				json = WebStartBusi.getJson(RESULT_FAIL, MSG_NO_DATAS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("获取组织机构配置数据------" + json.toString());
		return json.toString();
	}

	/**
	 * 更新角色组织机构配置
	 * 
	 * @param menuIds
	 * @param roleId
	 * @return
	 */
//	@SuppressWarnings("unchecked")
//	public String getLimitOrgReConfigBusi(String orgIds, String roleId) {
//		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
//		try {
////			IDBDao<TNRoleOrg, Integer> dao = BaseDao.getInstance();
//			params = new HashMap<String, Object>();
//			params.put("roleId", roleId);
//			dao.delete(sm.getSQL("limitOrgDel"), params);
//			if (orgIds == null || orgIds.equals("")) {
//				json = WebStartBusi.getJson(RESULT_SCCESS, MSG_SUCCESS);
//			} else {
//				String[] arrayMId = orgIds.split(",");
//				List<TNRoleOrg> list = new ArrayList<TNRoleOrg>();
//				for (int i = 0; i < arrayMId.length; i++) {
//					TNRoleOrg om = new TNRoleOrg();
//					om.setId(arrayMId[i]);
//					om.setRoleId(roleId);
//					list.add(om);
//				}
//				if (dao.save(list))
//					json = WebStartBusi.getJson(RESULT_SCCESS, MSG_SUCCESS);
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			log.error(e);
//		}
//		log.info("更新角色组织机构配置------" + json.toString());
//		return json.toString();
//	}

	/**
	 * 获取菜单权限数据业务
	 * 
	 * @param roleId
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getLimitMenuTreeDataBusi(String roleId) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			params = new HashMap<String, Object>();
			params.put("roleId", roleId);
			List<Object> list = dao.queryList(sm.getSQL("limitMenu"), params);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			} else {
				json = WebStartBusi.getJson(RESULT_FAIL, MSG_NO_DATAS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("获取菜单权限数据------" + json.toString());
		return json.toString();
	}

	/**
	 * 更新角色菜单配置
	 * 
	 * @param menuIds
	 * @param roleId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getLimitMenuReConfigBusi(String menuIds, String roleId) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		try {
			IDBDao<TNRoleMenu, Integer> dao = BaseDao.getInstance();
			params = new HashMap<String, Object>();
			params.put("roleId", roleId);
			dao.delete(sm.getSQL("limitMenuDel"), params);
			if (menuIds == null || menuIds.equals("")) {
				json = WebStartBusi.getJson(RESULT_SCCESS, MSG_SUCCESS);
			} else {
				String[] arrayMId = menuIds.split(",");
				List<TNRoleMenu> list = new ArrayList<TNRoleMenu>();
				for (int i = 0; i < arrayMId.length; i++) {
					TNRoleMenu om = new TNRoleMenu();
					om.setId(arrayMId[i]);
					om.setRoleId(roleId);
					list.add(om);
				}
				if (dao.save(list))
					json = WebStartBusi.getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("更新角色菜单配置------" + json.toString());
		return json.toString();
	}

	/**
	 * 获取菜单树形select数据业务
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getSelectMenu() {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			List<Object> list = dao.queryList(sm.getSQL("selectMenu"), null);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("菜单树形select数据------" + json.toString());
		return json.toString();
	}

	/**
	 * 获取机构树形select数据接口
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getSelectOrg() {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			List<Object> list = dao.queryList(sm.getSQL("selectOrg"), null);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("机构树形select数据------" + json.toString());
		return json.toString();
	}

	/**
	 * 获取数据字典树形select数据接口
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getDictOrg() {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		try {
			List<Object> list = dao.queryList(sm.getSQL("selectDict"), null);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("获取数据字典select数据------" + json.toString());
		return json.toString();
	}

	/**
	 * 菜单权限业务
	 * 
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getCustomMenu(String userId) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> dao = BaseDao.getInstance();
		params = new HashMap<String, Object>();
		params.put("userId", userId);
		try {
			List<Object> list = dao.queryList(sm.getSQL("customMenu"), params);
			if (list.size() > 0) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS, getJSONArray(list));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("菜单权限业务------" + json.toString());
		return json.toString();
	}

	/**
	 * 密码修改业务
	 * 
	 * @param userId
	 * @param pwd
	 * @param newPwd
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getChangePwd(String userId, String pwd, String newPwd) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<TNUser, String> dao = BaseDao.getInstance();
		TNUser user = new TNUser();
		try {
			user = dao.query(user, userId);
			if (user != null) {
				if (pwd.equals(user.getPassword())) {
					user.setPassword(newPwd);
					try {
						dao.update(user);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					json = getJson(RESULT_SCCESS, MSG_SUCCESS);
				} else {
					json = getJson(RESULT_FAIL, "输入密码有误！");
				}
			} else {
				json = getJson(RESULT_FAIL, "用户检测失败");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info("密码修改业务------" + json.toString());
		return json.toString();
	}
}

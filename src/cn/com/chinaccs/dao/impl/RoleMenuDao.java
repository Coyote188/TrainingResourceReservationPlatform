package cn.com.chinaccs.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.utils.StringUtil;

public class RoleMenuDao extends BaseDaoImpl<TNRoleMenu>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6414558494311375912L;

	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public boolean delete(String roleId) {
		boolean is = false;
		if(!StringUtil.isEmpty(roleId)) {
			String sql = "delete from T_N_ROLE_MENU where role_id=:roleId";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("roleId", roleId);
			if(executeSql(sql, param)>0) {
				is = true;
			}
		}
		return is;
	}
	
	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<TNRoleMenu> getRoleMenus(String roleId) {
		String hql = "from TNRoleMenu where roleId=:roleId";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roleId", roleId);
		List<TNRoleMenu> lists = queryHql(hql, param);
		return lists;
	}
	
	
	public boolean delSql(String id) {
		
		boolean bol = false;
		if(null != id && !StringUtil.isEmpty(id.toString())) {
			String[] ids = id.toString().split(",");
			String delIds = "";
			for (int i = 0; i < ids.length; i++) {
				if(i != (ids.length-1)) {
					delIds += "'"+ids[i]+"',";
				} else {
					delIds += "'"+ids[i]+"'";
				}
			}
			
			String sql = "delete from t_n_role_menu where role_id in ("+delIds+")";
			int i = executeSql(sql);
			if(i>=0)
				bol = true;
		}
		
		return bol;

	}
	
}

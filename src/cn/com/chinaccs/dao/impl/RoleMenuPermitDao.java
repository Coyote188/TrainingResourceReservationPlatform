package cn.com.chinaccs.dao.impl;

import cn.com.chinaccs.bean.entity.TNRoleMenuPermit;
import cn.com.chinaccs.utils.StringUtil;

public class RoleMenuPermitDao extends BaseDaoImpl<TNRoleMenuPermit>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
			
			String sql = "delete from t_n_role_menu_permit where role_menu_id in (select id from t_n_role_menu  where role_id in ("+delIds+"))";
			int i = executeSql(sql);
			if(i>=0)
				bol = true;
		}
		
		return bol;
	}


}

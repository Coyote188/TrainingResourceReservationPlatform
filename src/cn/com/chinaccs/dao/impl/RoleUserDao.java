package cn.com.chinaccs.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNRoleUser;
import cn.com.chinaccs.utils.StringUtil;

public class RoleUserDao extends BaseDaoImpl<TNRoleUser>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7536201476892245174L;

	public boolean delForRoleIds(String roleIds) {
		boolean bol = false;
		if(null != roleIds && !StringUtil.isEmpty(roleIds.toString())) {
			String[] idsArr = roleIds.split(",");
			String ids = "";
			for (int i = 0; i < idsArr.length; i++) {
				if(i != (idsArr.length-1)) {
					ids += "'"+idsArr[i]+"',";
				} else {
					ids += "'"+idsArr[i]+"'";
				}
			}
			String sql = "delete from t_n_role_user where role_id in ("+ids+")";
			int k = executeSql(sql);
			if(k>=0)
				bol =true;
		}
		return bol;
		
	}
	
	public boolean delForUserIds(String userIds) {
		boolean bol = false;
		if(!StringUtil.isEmpty(userIds)){
			String[] idsArr = userIds.split(",");
			String ids = "";
			for (int i = 0; i < idsArr.length; i++) {
				if(i != (idsArr.length-1)) {
					ids += "'"+idsArr[i]+"',";
				} else {
					ids += "'"+idsArr[i]+"'";
				}
			}
			
			String sql = "delete from t_n_role_user where user_id in ("+ids+")";
			int k = executeSql(sql);
			if(k>=0)
				bol =true;
		}
		return bol;
	}


	public List<Object> sqlQueryRoleList(String userId, String orgId, String orgCode) {
		List<Object> objList = new ArrayList<Object>();
		if(!StringUtil.isEmpty(orgId)) {
			String sql = "";
			if(StringUtil.isEmpty(userId)) {// role_false 树形中角色标识   作为nocheck的参数 意为可勾选操作
				sql = "select t.id,t.org_id,t.role_name,'role_false','false' from t_n_role t where t.role_type='"+TNRole.ROLE_TYPE_BASE+"' and t.org_id  in (select t.id from t_n_org t where t.org_code like  '%"+orgCode+"_%' or t.id ='"+orgId+"')";
			}else{
				sql = " select a.id,a.org_id,a.role_name,'role_false',b.role_id from (select * from t_n_role c " +
						" where c.org_id in (select o.id from t_n_org o where o.org_code like  '%"+orgCode+"_%' or o.id = '"+orgId+"') ) a  " +
						"left join (select * from t_n_role_user d where d.user_id =  '"+userId+"') b on a.id= b.role_id  ";
			}
			objList = queryObjSql(sql);
		}
		return objList;
		
	}

	public List<Object> sqlQueryAllRoleList(String queryOrgName, String userOrgId) {
		List<Object> objList = new ArrayList<Object>();
		if(!StringUtil.isEmpty(userOrgId)) {
			String	sql = "";
			if(!StringUtil.isEmpty(queryOrgName)){
				sql = "select t.id,t.org_id,t.role_name,'role_false','false' from t_n_role t where t.role_type='"+TNRole.ROLE_TYPE_BASE+"' and t.org_id  in (select t.id from t_n_org t where (t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"') and (t.org_name like  '%"+queryOrgName+"%' or  t.parent_id in (select t.id from t_n_org t where t.org_name like  '%"+queryOrgName+"%' ) ) )";
			}else{
				sql = "select t.id,t.org_id,t.role_name,'role_false','false' from t_n_role t where t.role_type='"+TNRole.ROLE_TYPE_BASE+"' and t.org_id  in (select t.id from t_n_org t where t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"')";
			}
			objList = queryObjSql(sql);
		}
		return objList;
	}



	

}

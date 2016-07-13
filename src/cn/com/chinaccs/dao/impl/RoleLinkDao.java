package cn.com.chinaccs.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNRoleLink;
import cn.com.chinaccs.utils.StringUtil;

public class RoleLinkDao extends BaseDaoImpl<TNRoleLink>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 删除角色继承关系 根据公共角色
	 * 
	 * */
	public boolean delParentRoleIds(String roleComIds) {
		boolean bol = false;
		if(null != roleComIds && !StringUtil.isEmpty(roleComIds.toString())) {
			String[] idsArr = roleComIds.split(",");
			String ids = "";
			for (int i = 0; i < idsArr.length; i++) {
				if(i != (idsArr.length-1)) {
					ids += "'"+idsArr[i]+"',";
				} else {
					ids += "'"+idsArr[i]+"'";
				}
			}
			String sql = "delete from t_n_role_link where parent_role_id in ('"+ids+"')";
			int k = executeSql(sql);
			if(k>=0)
				bol =true;
		}
		return bol;
	}

	/**
	 * 删除角色继承关系 根据基础角色
	 * 
	 * */
	public boolean delBaseRoleIds(String roleIds) {
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
			String sql = "delete from t_n_role_link where role_id in ("+ids+")";
			int k = executeSql(sql);
			if(k>=0)
				bol =true;
		}
		return bol;
	}

	/**
	 * 
	 * */
//	public List<TNRoleLink> queryRoleParentList(String roleComIds) {
//		List<TNRoleLink> menuList = new ArrayList<TNRoleLink>();
//		String hql = "from TNRoleLink where parentRoleId =:roleId";
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("roleId", roleId);
//		menuList = queryHql(hql, param);
//		return menuList;
//		
//		
//	}

//	public CHResponse queryRoleIsLink(String roleIds) {
//		CHResponse chresponse = new CHResponse();
//		String newIds = "";
//		if(null != roleIds && !StringUtil.isEmpty(roleIds.toString())) {
//			String[] idsArr = roleIds.split(",");
//			String  hql = "from TNRoleLink where parentRoleId =:roleId";
//			Map<String, Object> param = new HashMap<String, Object>();
//			for(String id :idsArr){
//				param.put("parentRoleId", id);
//				List<TNRoleLink>list = new ArrayList<TNRoleLink>();
//				list = queryHql(hql,param);
//				if(list.size()>0){
//					chresponse.setMsg("部分");
//				}
//					
//				param.clear();
//				
//			}
//			
//		}
//		return chresponse;
//	}



}

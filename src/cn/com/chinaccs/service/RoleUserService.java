package cn.com.chinaccs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.dao.impl.OrgDao;
import cn.com.chinaccs.dao.impl.RoleUserDao;
import cn.com.chinaccs.utils.StringUtil;

public class RoleUserService extends BaseService {

	
	/**
	 *  add 获取当前机构角色选项数据
	 * */
	public CHResponse queryRoleZtree(String userId,String orgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("没有查询到相关角色!");
		OrgDao orgDao = new OrgDao();
		RoleUserDao roleDao = new RoleUserDao();
		TNOrg org = orgDao.find(orgId);
		String orgCode = org.getOrgCode();
		List<Object> orgList = orgDao.getSoloZnodes(orgCode);	
		List<Object> roleList = roleDao.sqlQueryRoleList(userId,orgId,orgCode);
		
		List<Object> newList = new ArrayList<Object>();
		
		for(Object obj1 : orgList){	
			newList.add(obj1);
		}
		for(Object obj2:roleList){
			newList.add(obj2);
		}
		
		if(roleList.size()>0){
			String dataStr = initZnodes(newList);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("角色树查询成功!");
			chResponse.setData(dataStr);		
		}
		
		return chResponse;
	}
	
	/**
	 *  add 获取全部角色选项数据
	 * @param userOrgId 
	 * @param queryOrgName 
	 * */
	public CHResponse queryAllRoleZtree(String queryOrgId, String queryOrgName, String userOrgId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("没有查询到相关角色!");
		OrgDao orgDao = new OrgDao();
		RoleUserDao roleDao = new RoleUserDao();
		List<Object> orgList = orgDao.getZnodes(queryOrgId, queryOrgName, userOrgId);	
		List<Object> roleList = roleDao.sqlQueryAllRoleList(queryOrgName,userOrgId);
		
		List<Object> newList = new ArrayList<Object>();
		
		for(Object obj1 : orgList){	
			newList.add(obj1);
		}
		for(Object obj2:roleList){
			newList.add(obj2);
		}
		
		if(roleList.size()>0){
			String dataStr = initZnodes(newList);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("角色树查询成功!");
			chResponse.setData(dataStr);		
		}
		
		return chResponse;
	}
	
	
	/**
	 * 拼接 机构 角色树json
	 * @author YB
	 * @param flag 
	 * */
	public String initZnodes(List<Object> list) {
		String str ="[";
		for(Object obj : list){
//			String isParent = "";
//			if("role_false".equals(((Object[])obj)[3].toString())){
//				isParent = "false";
//			}else{
//				isParent = "true";
//			}
			str +="{\"id\":\""+((Object[])obj)[0].toString()+"\",\"pId\":\""+((Object[])obj)[1].toString()+"\",\"name\":\""+((Object[])obj)[2].toString()+"\"";
			if( "true".equals(((Object[])obj)[3].toString())){
				str +=",\"nocheck\":\"true\",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}else if("role_false".equals(((Object[])obj)[3].toString())){
				str +=",\"iconSkin\":\"roleicon\",\"type\":\"role\"";
				if(!StringUtil.isEmpty(StringUtil.handNull(((Object[])obj)[4])))
					str +=",\"checked\":\"true\"";
			}else if("false".equals(((Object[])obj)[3].toString())){
				str +=",\"iconSkin\":\"orgicon\",\"nocheck\":\"true\",\"type\":\""+((Object[])obj)[4].toString()+"\"";
			}
			str +="},";
		} 
		str = str.substring(0,str.length()-1)+"]";
		System.out.println(str);
		return str;
	}
	


	/**
	 * 
	 * @param id
	 * @param roleId
	 * @return
	 */
	public CHResponse delete(String id,String roleId) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(id) && !StringUtil.isEmpty(roleId)) {
			String[] ids = id.split(",");
			String sql = "delete from t_n_role_user where role_id=:roleId and user_id=:userId";
			Map<String, Object> param = null;
			List<Map<String, Object>> params = new ArrayList<Map<String,Object>>();
			for (String idTmp : ids) {
				param = new HashMap<String, Object>();
				param.put("roleId", roleId);
				param.put("userId", idTmp);
				params.add(param);
			}
			RoleUserDao dao = new RoleUserDao();
			if(dao.executeSql(sql, params)>0) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
			}
			param = null;
			params = null;
			dao = null;
			ids = null;
		}
		return chResponse;
	}


	
}

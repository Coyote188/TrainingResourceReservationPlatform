package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.SignMD5;
import cn.com.chinaccs.utils.StringUtil;

public class UserDao extends BaseDaoImpl<TNUser> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5029547857381464635L;
	
	private static SqlMapping sqlMap = new SqlMapping("/cn/com/chinaccs/res/sql/sql_user.xml");
	private Map<String, Object> params;

	public Serializable save(TNUser user) {
		if(null != user) {
			user.setPassword(SignMD5.execute(user.getPassword()));
		}
		Serializable idSer = super.save(user);
		if(null != idSer) {
			log.info("用户[ID:"+idSer.toString()+"]信息保存成功....");
		} else {
			log.info("用户信息保存失败....");
		}
		return idSer;
	}
	
	/**
	 * 用户登录
	 * @param username
	 * @return
	 */
	public TNUser login(String username) {
		TNUser user = null;
		String hql = sqlMap.getSQL("user_login");
		if(!StringUtil.isEmpty(hql)) {
			params = new HashMap<String, Object>();
			params.put("username", username);
			user = find(hql, params);
			if(null == user) {
			   log.info("用户名错误--输入用户名["+username+"]--");
			}
		} else {
			log.info("HQL为空--");
		}
		return user;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<String> getRoleIds(String userId) {
		List<String> lists = null;
		String sql = sqlMap.getSQL("user_role");
		if(!StringUtil.isEmpty(sql)) {
			params = new HashMap<String, Object>();
			params.put("userId", userId);
			List<Object> list = queryObjSql(sql, params);
			if(null != list && list.size()>0) {
				lists = new ArrayList<String>();
				for(int i=0;i<list.size();i++) {
					lists.add(list.get(i).toString());
				}
			}
			list = null;
		}
		return lists;
	}
	
	/**
	 * 获取继承角色
	 * */
	public List<String> getComRoleIds(String userId) {
		List<String> lists = null;
		String sql = sqlMap.getSQL("user_com_role");
		if(!StringUtil.isEmpty(sql)) {
			params = new HashMap<String, Object>();
			params.put("userId", userId);
			List<Object> list = queryObjSql(sql, params);
			if(null != list && list.size()>0) {
				lists = new ArrayList<String>();
				for(int i=0;i<list.size();i++) {
					lists.add(list.get(i).toString());
				}
			}
			list = null;
		}
		return lists;
	}
	
	/**
	 * 
	 * @param orgIds
	 * @return
	 */
	public List<TNUser> queryByOrgIds(String orgIds) {
		List<TNUser> lists = null;
		if(!StringUtil.isEmpty(orgIds)) {
			String hql = " from TNUser where state='1' and orgId in("+orgIds+")";
			lists = queryHql(hql);
		}
		return lists;
	}
	
	public static void main(String[] args) {
		UserDao aa = new UserDao();
		String hql = "select * from t_n_user";
		System.out.println(aa.queryObjHql(hql));
	}


	public boolean checkUserName(String  userName) {
		boolean bol = true;
		List<TNUser> list = null;
		String sql = "select * from t_n_user t where t.user_name = '"+userName+"'";
		list = querySql(sql);
		if(list.size()>0)
			bol = false;
			return bol;
	}
	
	
	/**
	 * 通过用户ID获取组织机构IDs
	 * @param userId
	 * @return
	 */
	public List<String> getOrgIds(String userId) {
		List<String> orgIds = null;
		String sql = sqlMap.getSQL("user_role_org");
		if(!StringUtil.isEmpty(sql)) {
			params = new HashMap<String, Object>();
			params.put("userId", userId);
			List<Object> lists = queryObjSql(sql, params);
			if(null != lists && lists.size()>0) {
				orgIds = new ArrayList<String>();
				for (Object obj : lists) {
					orgIds.add(obj.toString());
				}
			}
			lists = null;
		}
		return orgIds;
	}
	
	@Override
	public boolean delete(Serializable id) {
		boolean is = false;
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
			String delHql = "delete from "+clazz.getName()+" where id in ("+delIds+")";
			if(executeHql(delHql)>0) {
				is = true;
			}
		}
		if(is){
			RoleUserDao ruDao = new RoleUserDao();
			ruDao.delForUserIds(id.toString());//删除用户的角色配置数据
			ruDao = null;
		}
		return is;
	}


	

}

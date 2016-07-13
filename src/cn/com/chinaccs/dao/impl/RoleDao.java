package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.utils.StringUtil;

public class RoleDao extends BaseDaoImpl<TNRole>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4474200980341825360L;
	
//	@Override
//	public boolean delete(Serializable id) {
//		boolean is = false;
//		if(null != id && !StringUtil.isEmpty(id.toString())) {
//			String[] ids = id.toString().split(",");
//			String delids = "";
//			for(String idTmp : ids){
//				delids +="'" +idTmp +"',";
//			}
//			delids = delids.substring(0, delids.lastIndexOf(","));
//			String sqlDr = "delete from t_n_role  where id in ("+delids+")";
//			String sqlDu = "delete from t_n_role_user  where role_id in ("+delids+")";
//			String sqlDo = "delete from t_n_role_org  where role_id in ("+delids+")";
//			String sqlDm = "delete from t_n_role_menu  where role_id in ("+delids+")";
//			
//			if(executeSql(sqlDr)>0){
//				executeSql(sqlDu);
//				executeSql(sqlDo);
//				executeSql(sqlDm);
//				is = true; 
//			};
//		}
//		return is;
//	}
	
	
	/**
	 * 
	 * @param orgIds
	 * @return
	 */
	public List<Object> queryByOrgIds(String orgIds) {
		List<Object> lists = null;
		if(!StringUtil.isEmpty(orgIds)) {
			String hql = "select r.id,r.roleName,ro.orgId from TNRole r,TNRoleOrg ro where ro.orgId in("+orgIds+") and r.id=ro.roleId";
			lists = queryObjHql(hql);
		}
		return lists;
	}


	/**
	 * 获取权限菜单数据  后两位参数为  checked状态  doCheck状态
	 * 
	 * */
		public List<Object> getMenu() {
			String sql = "";
			sql = "select t.id,t.parent_id,t.menu_name,'false' checked,'true' doCheck from t_n_menu t where t.state = 1  order by t.parent_id, t.seq_num" ;
			
			List<Object> list = null;
			list = queryObjSql(sql);
		
			return list;
		}


		/**
		 * 获取权限操作数据 后两位参数为  checked状态  doCheck状态
		 * 
		 * */
		public List<Object> getPermit() {
			String sql = "";
			sql = "select t.id,t.menu_id,t.permit_val,permit_name,'false' checked,'true' doCheck from t_n_permit t   order by t.menu_id" ;
			
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}

		/**
		 * 单个角色ID
		 * 获取 角色权限 已选 菜单数据 后两位参数为  checked状态  doCheck状态
		 * doCheck为false checked 不可被编辑
		 * */
		public List<Object> getSelectMenu(String roleId) {
			String sql = "";
			sql = "select t.id,t.parent_id,t.menu_name,'true' checked,'true' doCheck from t_n_menu t where t.id in (select t.menu_id from t_n_role_menu t where t.role_id = '"+roleId+"')  order by t.parent_id, t.seq_num " ;
			
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}

		/**
		 * 单个角色ID
		 * 获取 角色权限 已选 操作标签数据 后两位参数为  checked状态  doCheck状态
		 * doCheck为false checked可被编辑
		 * 
		 * */
		public List<Object> getSelectPermit(String roleId) {
			String sql = "";
			sql = " select t.id,t.menu_id,t.permit_val,permit_name,'true' checked,'true' doCheck from t_n_permit t where t.permit_val in (select t.permit_val from t_n_role_menu_permit t where t.role_menu_id in (select t.id from t_n_role_menu t where t.role_id = '"+roleId+"'))  order by t.menu_id " ;
			
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}
		
		/**
		 * 多个角色IDS
		 * 获取 角色权限 已选 菜单数据 后两位参数为  checked状态  doCheck状态
		 * doCheck为false checked不可被编辑
		 * @param roleId 
		 * */
		public List<Object> getSelectMenuRoleIdS(String sqlPrIds, String roleId) {
			String sql = "";
			sql +=" select * from (";
			sql += " (select t.id,t.parent_id,t.menu_name,'true' checked,'false' doCheck,t.seq_num from t_n_menu t where t.id in (select t.menu_id from t_n_role_menu t where t.role_id in ("+sqlPrIds+")) ) " ;
			sql += " union  (select t.id,t.parent_id,t.menu_name,'true','true',t.seq_num from t_n_menu t where t.id in (select t.menu_id from t_n_role_menu t where t.role_id ='"+roleId+"') )";
			sql +=" )c order by c.parent_id, c.seq_num ";
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}

		/**
		 * 多个角色ID
		 * 获取 角色权限 已选 操作标签数据 后两位参数为  checked状态  doCheck状态
		 * doCheck为false checked不可被编辑
		 * @param roleId 
		 * 
		 * */
		public List<Object> getSelectPermitRoleIdS(String sqlPrIds, String roleId) {
			String sql = "";
			sql += " select * from (";
			sql += " (select t.id,t.menu_id,t.permit_val,permit_name,'true' checked,'false' doCheck from t_n_permit t where t.permit_val in (select t.permit_val from t_n_role_menu_permit t where t.role_menu_id in (select t.id from t_n_role_menu t where t.role_id in ("+sqlPrIds+"))) )  " ;
			sql += " union (select t.id,t.menu_id,t.permit_val,permit_name,'true','true' from t_n_permit t where t.permit_val in (select t.permit_val from t_n_role_menu_permit t where t.role_menu_id in (select t.id from t_n_role_menu t where t.role_id ='"+roleId+"')) ) ";
			sql +=" )c order by c.menu_id";
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}


//		public List<Object> getNotSelectMenu(String sqlIds) {
//			String sql = "";
//			sql = "select t.id,t.parent_id,t.menu_name,'false' from t_n_menu t where t.id not in (select t.menu_id from t_n_role_menu t where t.role_id  in ("+sqlIds+"))  order by t.parent_id, t.seq_num " ;
//			
//			List<Object> list = null;
//			list = queryObjSql(sql);
//			return list;
//		}
//
//
//		public List<Object> getNotSelectPermit(String sqlIds) {
//			String sql = "";
//			sql = " select t.id,t.menu_id,t.permit_val,permit_name,'false' from t_n_permit t where t.permit_val not in (select t.permit_val from t_n_role_menu_permit t where t.role_menu_id in (select t.id from t_n_role_menu t where t.role_id in ("+sqlIds+")))  order by t.menu_id " ;
//			
//			List<Object> list = null;
//			list = queryObjSql(sql);
//			return list;
//		}
		
		/**
		 * 获取公共角色list<Object>
		 * 
		 * */
		public List<Object> queryRoleComList(String roleId) {
			String sql = "";
			if(!StringUtil.isEmpty(roleId)) {//查询出公共角色列表  并且标注出 当前角色的继承关系（已经勾选的公共角色）
				sql="select a.id,a.role_name,b.role_id,b.parent_role_id from (select * from t_n_role c where c.role_type =  '"+TNRole.ROLE_TYPE_COMMON+"'  ) a  left join (select * from t_n_role_link d where d.role_id =  '"+roleId+"') b on a.id= b.parent_role_id ";
			}else{//查询出公共角色列表 勾选标识为空
				sql = "select t.id,t.role_name,'' from t_n_role t where t.role_type = '"+TNRole.ROLE_TYPE_COMMON+"' " ;		
			}
			List<Object> list = new ArrayList<Object>();
			list = queryObjSql(sql);
			return list;
		}


		/**
		 * 根据角色自动关联 角色继承表 查询 已选  菜单数据
		 * */
		public List<Object> getAllRoleMenu(String roleId) {
			String sql = "";
			sql = "select t.id,t.parent_id,t.menu_name,'true' checked,'false' doCheck from t_n_menu t where t.id in (select t.menu_id from t_n_role_menu t where t.role_id in (select c.parent_role_id from t_n_role_link c where c.role_id = '"+roleId+"')  or t.role_id = '"+roleId+"')  order by t.parent_id, t.seq_num " ;
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}

		/**
		 * 根据角色自动关联 角色继承表 查询 已选  操作标签数据
		 * */
		public List<Object> getAllRolePermit(String roleId) {
			String sql = "";
			sql = " select t.id,t.menu_id,t.permit_val,permit_name,'true' checked,'false' doCheck from t_n_permit t where t.permit_val in (select t.permit_val from t_n_role_menu_permit t where t.role_menu_id in (select t.id from t_n_role_menu t where t.role_id in (select c.parent_role_id from t_n_role_link c where c.role_id = '"+roleId+"')  or t.role_id = '"+roleId+"'))  order by t.menu_id " ;
			
			List<Object> list = null;
			list = queryObjSql(sql);
			return list;
		}

}

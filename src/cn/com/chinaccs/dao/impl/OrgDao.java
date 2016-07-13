package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.List;

import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.helper.TreeHelper;
import cn.com.chinaccs.utils.StringUtil;



public class OrgDao extends BaseDaoImpl<TNOrg>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public boolean delete(Serializable id) {
		boolean is = false;
		if(null != id && !StringUtil.isEmpty(id.toString())) {
			List<TNOrg> dicts = findAll();
			String[] ids = id.toString().split(",");
			for(String idTmp : ids) {
				if(null != dicts && dicts.size()>0) {
					TreeHelper<TNOrg> treeHelper = new TreeHelper<TNOrg>();
					List<TNOrg> listTmps = null;
					String delIds = "'"+idTmp+"',";
					TNOrg tmp = new TNOrg();
					tmp.setId(idTmp);
					try {
						listTmps = treeHelper.outPutTree(dicts, tmp,false);
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
						listTmps = null;
						treeHelper = null;
						tmp = null;
					}
					if(!StringUtil.isEmpty(delIds)) {
						String delSql = "delete from T_N_ORG where id in ("+delIds+")";
						if(executeSql(delSql)>0) {
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
	 * 获取机构信息（不包含部门信息）
	 * @return
	 */
	public List<TNOrg> getOrgs() {
		List<TNOrg> lists = null;
		String hql = " from TNOrg where type='org'";
		lists = queryHql(hql);
		return lists;
	}
	
	/**
	 * 获取组织机构根目录数据
	 * @param userOrgId 
	 * @param userOrgId2 
	 * */
	public List<Object> getZnodes(String queryOrgId,String queryOrgName,String userOrgId) {
		String sql = "";
		if(!StringUtil.isEmpty(queryOrgName)){
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where (t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"') and (t.org_name like  '%"+queryOrgName+"%' or  t.parent_id in (select t.id from t_n_org t where t.org_name like  '%"+queryOrgName+"%' ) ) order by t.type, t.seq_num" ;
		}else{
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"' order by t.type, t.seq_num";
		}
		
		List<Object> list = null;
		list = queryObjSql(sql);
	
		return list;
	}
	
	
	/**
	 * author: xiaoliping 
	 * descr: 表单中获取组织机构目录数据（只查询用户所在组织机构及其以下机构的数据）
	 */
	public List<Object> getLowerFormZnodes(String queryOrgId,String queryOrgName,String userOrgId) {
		String sql = "";
		if(!StringUtil.isEmpty(queryOrgName)){
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where (t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"') and (t.org_name like  '%"+queryOrgName+"%' or  t.parent_id in (select t.id from t_n_org t where t.org_name like  '%"+queryOrgName+"%' ) ) order by t.type, t.seq_num" ;
		}else{
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where t.org_seq like '%"+userOrgId+".%' or t.id ='"+userOrgId+"' order by t.type, t.seq_num";
		}
		
		List<Object> list = null;
		list = queryObjSql(sql);
	
		return list;
	}
	
	
	/**
	 * author: xiaoliping 
	 * descr: 表单中获取组织机构目录数据（查询全部组织机构）
	 */
	public List<Object> getAllFormZnodes(String queryOrgId,String queryOrgName) {
		String sql = "";
		if(!StringUtil.isEmpty(queryOrgName)){
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where (t.org_name like  '%"+queryOrgName+"%' or  t.parent_id in (select t.id from t_n_org t where t.org_name like  '%"+queryOrgName+"%' ) ) order by t.type, t.seq_num" ;
		}else{
			sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t order by t.type, t.seq_num";
		}
		
		List<Object> list = null;
		list = queryObjSql(sql);
	
		return list;
	}
	
	
	/**
	 * 根据角色所属组织机构获取 组织机构根目录数据  （限制条件为list）
	 *  
	 * */
	public List<Object> getRoleOrgZnodes(String queryOrgId,String queryOrgName,List<String> userOrgIds) {
		List<Object> list = null;
		if(null != userOrgIds && userOrgIds.size()>0) {
			String sql = "";
			String likeOrgIds = "";
			String inOrgIds = "";
			for (int i=0;i<userOrgIds.size();i++) {
				if(i == (userOrgIds.size()-1)) {
					likeOrgIds = "'%"+userOrgIds.get(i)+".%'";
					inOrgIds = "'"+userOrgIds.get(i)+"'";
				} else {
					likeOrgIds += "  or t.org_seq like '%"+userOrgIds.get(i)+".%'";
					inOrgIds = ",'"+userOrgIds.get(i)+"'";
				}
			}
			
			if(!StringUtil.isEmpty(queryOrgName)){
				sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where (t.org_seq like "+likeOrgIds+" or t.id in("+inOrgIds+") ) and (t.org_name like  '%"+queryOrgName+"%' or  t.parent_id in (select t.id from t_n_org t where t.org_name like  '%"+queryOrgName+"%' ) ) order by t.type, t.seq_num" ;
			}else{
				sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where t.org_seq like "+likeOrgIds+" or t.id in("+inOrgIds+") order by t.type, t.seq_num";
			}
			
			list = queryObjSql(sql);
		}
	
		return list;
	}
	
	/**
	 * 获取 单个组织机构根目录数据
	 * @param orgId 
	 * @param userOrgId 
	 * @param userOrgId2 
	 * */
	public List<Object> getSoloZnodes(String orgCode) {
		String sql = "";
		sql = "select t.id,t.parent_id,t.org_name,t.is_extend,t.type from t_n_org t where t.org_code like  '%"+orgCode+"_%' or t.org_code ='"+orgCode+"' order by t.type, t.seq_num";
		
		List<Object> list = null;
		list = queryObjSql(sql);
	
		return list;
	}


	public int querySeqNum(String pId, String type) {
		List<Object> list = null;
		int seqNum = 1;
		if("department".equals(type)){
			seqNum = 1;
		}else{
			seqNum = 101;
		}
		String sql = "select max(t.seq_num) from t_n_org t where t.parent_id='"+pId+"' and t.type ='"+type+"'";
		list = queryObjSql(sql);
		if (list.size() > 0&& null!=list) {
			if(!StringUtil.isEmpty(StringUtil.handNull(list.get(0)))) {
				//try {
				seqNum = Integer.parseInt(list.get(0).toString())+1;
				//} catch (Exception e) {
				//	seqNum = 1;
				//}
			} else {
				seqNum = 1;
			}
		}
		return seqNum;
	}
	
	
}

package cn.com.chinaccs.webstart.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.bean.entity.TNRoleUser;
import cn.com.chinaccs.dao.impl.OrgDao;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.crud.CrudBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class RoleUserOIListBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> nParams;
	private SqlMapping sm;
	
	public RoleUserOIListBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_user.xml");
	}

	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {
		String oi = params.get("oi").toString();
		String flag = params.get("flag").toString();
		String orgId =  params.get("orgId").toString();
		String roleId =  params.get("roleId").toString();
		String orgCode = "";
		String likeOrgCode ="";
		if(!StringUtil.isEmpty(orgId)){
			TNOrg org = new TNOrg();
			OrgDao dao = new OrgDao();
			org = dao.find(orgId);
			orgCode = org.getOrgCode();
			likeOrgCode = "%"+orgCode+"_%";
			dao = null;
		}
		params.clear();
		if("out".equals(oi)){
			if("true".equals(flag)){
				params.put("likeOrgCode", likeOrgCode);
				params.put("roleId", roleId);
				params.put("orgCode", orgCode);
				sql = sm.getSQL("all_not_role_user");
			}else{
				params.put("orgId", orgId);
				params.put("roleId", roleId);
				sql = sm.getSQL("not_role_user");
			}
		}else if("in".equals(oi)){
			params.put("roleId", roleId);
			sql = sm.getSQL("select_role_user");		
		}
		 super.queryPage(response,sql,params,page,rows,sidx,sord);
	}
	

//	@Override
//	public void queryPage(HttpServletResponse response, String sql,
//			Map<String, Object> params, Integer page, Integer rows,
//			String sidx, String sord) {
//		// TODO Auto-generated method stub
//		this.combinSQL(params);
//		super.queryPage(response, nSql, nParams, page, rows, sidx, sord);
//	}
	
	@Override
	public String del(String sql, List<Map<String, Object>> deleteIds,Map<String, Object> params) {
		JSONObject json = getJson(RESULT_FAIL, MSG_FAIL);
		String roleId = params.get("roleId").toString();
		boolean isDel = true;
		if (deleteIds.size() > 0) {
			@SuppressWarnings("unchecked")
			IDBDao<TNRoleUser, Integer> dao = BaseDao.getInstance(null);
			sql = "delete from t_n_role_user t where t.role_id=:roleId and t.user_id=:userId";
			for (int i = 0; i < deleteIds.size(); i++) {
				nParams = new HashMap<String, Object>();
				nParams.put("roleId", roleId);
				nParams.put("userId", deleteIds.get(i).get("id"));
				try {
					isDel = isDel && dao.delete(sql, nParams);
				} catch (Exception e) {
					e.printStackTrace();
					log.error(e);
				}
			}
			dao.commit();
			if (isDel) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		}
		return json.toString();
	}


	@Override
	public String save(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		JSONObject json = getJson(RESULT_FAIL, MSG_FAIL);
		String roleId = params.get("roleId").toString();
		String saveIds = params.get("saveIds").toString();
		String[] ids = saveIds.split(",");
		if (ids.length > 0) {
			@SuppressWarnings("unchecked")
			IDBDao<TNRoleUser, Integer> dao = BaseDao.getInstance();
			List<TNRoleUser> list = new ArrayList<TNRoleUser>();
			for (int i = 0; i < ids.length; i++) {
				TNRoleUser ru = new TNRoleUser();
				ru.setRoleId(roleId);
				ru.setUserId(ids[i]);
				list.add(ru);
			}
			if (dao.save(list)) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		}
		return json.toString();
	}

//	private void combinSQL(Map<String, Object> params) {
//		SqlMapping sm = new SqlMapping(PATH_RESOURCE + "sql_admin.xml");
//		String roleId = params.get("roleId").toString();
//		String orgId = params.get("orgId").toString();
//		nParams = new HashMap<String, Object>();
//		String oi = params.get("oi").toString();
//		if (oi.equals("out")) {
//			nSql = sm.getSQL("roleUserOutList");
//		} else {
//			nSql = sm.getSQL("roleUserInList");
//		}
//		nParams.put("roleId", roleId);
//		if(null != orgId && !"".equals(orgId.trim())) {
//		    nParams.put("orgId", orgId);
//		}
//	}
}

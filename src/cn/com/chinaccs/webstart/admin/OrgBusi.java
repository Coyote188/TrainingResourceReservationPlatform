package cn.com.chinaccs.webstart.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.crud.CrudBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class OrgBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4128996450014948184L;
	

	//@SuppressWarnings("unchecked")
//	@Override
//	public String save(Object obj, Map<String, Object> params) {
//		// TODO Auto-generated method stub
//		
//		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
//		try {
//			TNOrg org = (TNOrg) obj;
//			String pId = org.getParentId();
//			TNOrg porg = new TNOrg();
//			IDBDao<TNOrg, String> dao = BaseDao.getInstance();
//			porg = dao.query(porg, pId);
//			//OrgDao dao = new OrgDao();
//			//porg = dao.find(pId);
//			
//			SqlMapping sm = new SqlMapping(PATH_RESOURCE + "sql_admin.xml");
//			String sql = sm.getSQL("orgCodeMax");
//			params.put("parentId", pId);
//			List<Object> objList = dao.queryList(sql, params);
//			//List<Object> objList = dao.queryObjHql(hql, params);
//			int orgCode = 0;
//			int seqNum = 0;
//			if (objList.size() > 0&& null!=objList) {
//				if(!StringUtil.isEmpty(StringUtil.handNull(objList.get(0)))) {
//					orgCode = Integer.parseInt(objList.get(0).toString())+1;
//				}
//				if(!StringUtil.isEmpty(StringUtil.handNull(objList.get(1)))) {
//					try {
//						seqNum = Integer.parseInt(objList.get(1).toString())+1;
//					} catch (Exception e) {
//						seqNum = 1;
//					}
//				} else {
//					seqNum = 1;
//				}
//			}
//			org.setId(String.valueOf(orgCode));
//			org.setOrgCode(orgCode);
//			org.setSeqNum(seqNum);
//
//			if (porg != null && porg.getOrgLevel() != null) {
//				org.setOrgLevel(porg.getOrgLevel() + 1); // 添加菜单等级
//				String orgSeq = porg.getOrgSeq()+"."+ String.valueOf(orgCode);
//				org.setOrgSeq(orgSeq);
//			} else {
//				org.setOrgLevel(1); // 添加菜单等级
//				org.setOrgSeq(String.valueOf(orgCode));
//			}
//			
//			if(dao.save(org)) {
//				json = WebStartBusi.getJson(RESULT_SCCESS, "数据添加成功");
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			log.error(e);
//		}
//		return json.toString();
//	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public String upd(Object obj, Map<String, Object> params) {
//		// TODO Auto-generated method stub
//		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
//		try {
//			TNOrg org = (TNOrg) obj;
//			String pId = org.getParentId();
//			TNOrg porg = new TNOrg();
//			IDBDao<TNOrg, String> dao = BaseDao.getInstance();
//			porg = dao.query(porg, pId);
//			
//			
//			SqlMapping sm = new SqlMapping(PATH_RESOURCE + "sql_admin.xml");
//			String sql = sm.getSQL("orgCodeMax");
//			params.put("parentId", pId);
//			List<Object> objList = dao.queryList(sql, params);
//			int orgCode = org.getOrgCode();
//			int seqNum = 0;
//			if (objList.size() > 0&& null!=objList) {
//				if(!StringUtil.isEmpty(StringUtil.handNull(objList.get(1)))) {
//					try {
//						seqNum = Integer.parseInt(objList.get(1).toString())+1;
//					} catch (Exception e) {
//						seqNum = 1;
//					}
//				} else {
//					seqNum = 1;
//				}
//			}
//			
//			org.setSeqNum(seqNum);
//			
//			if (porg != null && porg.getOrgLevel() != null) {
//				org.setOrgLevel(porg.getOrgLevel() + 1); // 添加菜单等级
//				String orgSeq = porg.getOrgSeq()+"."+ String.valueOf(orgCode);
//				org.setOrgSeq(orgSeq);
//			} else {
//				org.setOrgLevel(1); // 添加菜单等级
//				org.setOrgSeq(String.valueOf(orgCode));
//			}
//			return super.upd(org, params);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			log.error(e);
//		}
//		return json.toString();
//	}

	@Override
	public String del(String sql, List<Map<String, Object>> deleteIds,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String sqlDelOm = "delete from T_N_ORG_MENU t where t.org_id=:id";
		try {
			delete(sqlDelOm, deleteIds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.del(sql, deleteIds, params);
	}

	@Override
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		super.queryTree(response, sql, params);
	}

}

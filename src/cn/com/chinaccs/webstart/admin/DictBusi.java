package cn.com.chinaccs.webstart.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.entity.TNDict;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.crud.CrudBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class DictBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4128996450014948184L;

	@SuppressWarnings("unchecked")
	@Override
	public String save(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		try {
			TNDict dict = (TNDict) obj;
			String pId = dict.getParentId();
			TNDict porg = new TNDict();
			IDBDao<TNDict, String> dao = BaseDao.getInstance();
			porg = dao.query(porg, pId);
			if (porg != null && porg.getBusiLevel() != null) {
				dict.setBusiLevel(porg.getBusiLevel() + 1); // 添加等级
			} else {
				dict.setBusiLevel(1); // 添加等级
			}
			if(StringUtil.isEmpty(dict.getParentId())) {
				dict.setParentId("0");
			}
			return super.save(dict, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		return json.toString();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String upd(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		try {
			TNDict dict = (TNDict) obj;
			String pId = dict.getParentId();
			TNDict pdict = new TNDict();
			IDBDao<TNDict, String> dao = BaseDao.getInstance();
			pdict = dao.query(pdict, pId);
			if (pdict != null && pdict.getBusiLevel() != null) {
				dict.setBusiLevel(pdict.getBusiLevel() + 1); // 添加等级
			} else {
				dict.setBusiLevel(1); // 添加等级
			}
			if(StringUtil.isEmpty(dict.getParentId())) {
				dict.setParentId("0");
			}
			return super.upd(dict, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		return json.toString();
	}

	@Override
	public String del(String sql, List<Map<String, Object>> deleteIds,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.del(sql, deleteIds, params);
	}

	@Override
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		super.queryTree(response, sql, params);
	}

}

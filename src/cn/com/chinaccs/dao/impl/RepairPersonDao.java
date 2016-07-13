package cn.com.chinaccs.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TVRepairPerson;
import cn.com.chinaccs.utils.StringUtil;

public class RepairPersonDao extends BaseDaoImpl<TVRepairPerson> {

	/**
	 * 获取保养人姓名
	 * @param orgId
	 * @return
	 */
	public List<Object> getItem(String orgId) {
		List<Object> lists = null;
		if(!StringUtil.isEmpty(orgId)) {
			String sql = "select id,user_name from t_v_repair_person where org_id = :orgId and state='1' order by user_name";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("orgId", orgId);
			lists = queryObjSql(sql, params);
			params = null;
		}
		return (lists != null && lists.size()>0)?lists:null;
	}
}

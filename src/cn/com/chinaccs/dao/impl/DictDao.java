package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.entity.TNDict;
import cn.com.chinaccs.helper.TreeHelper;
import cn.com.chinaccs.utils.StringUtil;

public class DictDao extends BaseDaoImpl<TNDict> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public boolean delete(Serializable id) {
		boolean is = false;
		if(null != id && !StringUtil.isEmpty(id.toString())) {
			List<TNDict> dicts = findAll();
			String[] ids = id.toString().split(",");
			for(String idTmp : ids) {
				if(null != dicts && dicts.size()>0) {
					TreeHelper<TNDict> treeHelper = new TreeHelper<TNDict>();
					List<TNDict> listTmps = null;
					String delIds = "'"+idTmp+"',";
					TNDict tmp = new TNDict();
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
						String delSql = "delete from T_N_DICT where id in ("+delIds+")";
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
	 * 获取数据项
	 * @param busiValue
	 * @return
	 */
	public List<Object> getItem(String busiValue) {
		List<Object> lists = null;
		if(!StringUtil.isEmpty(busiValue)) {
			String sql = "select busi_value,busi_name from t_n_dict d where d.parent_id=(select id from t_n_dict where busi_value=:busiValue) and d.state='1' order by d.seq_num asc";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("busiValue", busiValue);
			lists = queryObjSql(sql, params);
			params = null;
		}
		return (lists != null && lists.size()>0)?lists:null;
	}
	/**
	 * 获取数据项
	 * @param busiValue
	 * @return
	 */
	public List<Object> getDictItem(String busiValue) {
		List<Object> lists = null;
		if(!StringUtil.isEmpty(busiValue)) {
			String sql = "select busi_value,busi_name from t_n_dict d where d.busi_value=:busiValue and d.state='1' order by d.seq_num asc";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("busiValue", busiValue);
			lists = queryObjSql(sql, params);
			params = null;
		}
		return (lists != null && lists.size()>0)?lists:null;
	}
	
}

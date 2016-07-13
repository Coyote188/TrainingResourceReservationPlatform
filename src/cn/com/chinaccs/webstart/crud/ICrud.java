package cn.com.chinaccs.webstart.crud;

import java.util.List;
import java.util.Map;

public interface ICrud {
	/**
	 * @param bean
	 */
	void setObjBean(Object objBean);

	/**
	 * @param busi
	 */
	void setObjBusi(Object objBusi);

	/**
	 * @param sql
	 */
	void setQuerySQL(String querySQL);

	/**
	 * @param deleteSQL
	 */
	void setDeleteSQL(String deleteSQL);

	/**
	 * @param params
	 */
	void setParams(Map<String, Object> params);

	/**
	 * @param deleteIds
	 */
	void setDeleteIds(List<Map<String, Object>> deleteIds);
}

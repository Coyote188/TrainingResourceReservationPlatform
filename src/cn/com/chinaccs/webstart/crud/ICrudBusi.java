package cn.com.chinaccs.webstart.crud;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

/**
 * @author fddi
 * 
 */
public interface ICrudBusi {
	/**
	 * @param obj
	 * @param params
	 * @return
	 */
	public String save(Object obj, Map<String, Object> params);

	/**
	 * @param obj
	 * @param params
	 * @return
	 */
	public String upd(Object obj, Map<String, Object> params);

	/**
	 * @param sql
	 * @param deleteIds
	 * @param params
	 * @return
	 */
	public String del(String sql, List<Map<String, Object>> deleteIds,
			Map<String, Object> params);

	/**
	 * @param response
	 * @param sql
	 * @param params
	 * @param sidx
	 * @param sord
	 */
	public void query(HttpServletResponse response, String sql,
			Map<String, Object> params, String sidx, String sord);

	/**
	 * @param response
	 * @param sql
	 * @param params
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 */
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord);

	/**
	 * @param response
	 * @param sql
	 * @param params
	 */
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params);

	/**
	 * @param name
	 * @param title
	 * @param response
	 * @param sql
	 * @param params
	 */
	public void exportExcel(String name, String[] titles,
			HttpServletResponse response, String sql, Map<String, Object> params);
}

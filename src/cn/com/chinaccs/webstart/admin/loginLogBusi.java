package cn.com.chinaccs.webstart.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.crud.CrudBusi;

public class loginLogBusi extends CrudBusi {

	private static final long serialVersionUID = 1L;
	private String newSql = "";
	private Map<String, Object> newPms = null;

	@Override
	public String save(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.save(obj, params);
	}

	@Override
	public String upd(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.upd(obj, params);
	}

	@Override
	public String del(String sql, List<Map<String, Object>> deleteIds,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.del(sql, deleteIds, params);
	}

	@Override
	public void query(HttpServletResponse response, String sql,
			Map<String, Object> params, String sidx, String sord) {
		// TODO Auto-generated method stub
		super.query(response, sql, params, sidx, sord);
	}

	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {
		// TODO Auto-generated method stub
		this.combinSQL(params);// 参数判断，重新组合sql
		super.queryPage(response, newSql, newPms, page, rows, sidx, sord);
	}

	@Override
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		super.queryTree(response, sql, params);
	}

	@Override
	public void exportExcel(String name, String[] titles,
			HttpServletResponse response, String sql, Map<String, Object> params) {
		// TODO Auto-generated method stub
		name = "登录日志";
		String[] excelTitles = { "ID", "用户ID", "用户名", "IP地址", "所属机构", "登录状态",
				"登录信息", "登录方式", "登录日期" };
		this.combinSQL(params);
		super.exportExcel(name, excelTitles, response, newSql, newPms);
	}

	private void combinSQL(Map<String, Object> params) {
		SqlMapping sm = new SqlMapping(PATH_RESOURCE + "sql_admin.xml");
		StringBuffer ns = new StringBuffer(sm.getSQL("loginLogList"));
		newPms = new HashMap<String, Object>();
		String mode = params.get("lMode").toString();
		if (!mode.equals("") && !mode.equals("0")) {
			ns.append(sm.getSQL("termLoginMode"));
			newPms.put("lMode", mode);
		} else {
			newPms = null;
		}
		ns.append(sm.getSQL("footerLog"));
		newSql = ns.toString();
	}
}

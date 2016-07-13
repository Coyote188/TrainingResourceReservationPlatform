package cn.com.chinaccs.webstart;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.crud.CrudBusi;

public class Maintain4CardBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5071131254226326396L;
	private SqlMapping sm;
	
	public Maintain4CardBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_vehicle.xml");
	}
	
	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {
String orgId = params.get("orgId").toString();
		
		String vCardId = params.get("vCardId")==null ? null: params.get("vCardId").toString();
		
		
		String likeOrgId = "%" + orgId + ".%";
		params.clear();
		params.put("likeOrgId", likeOrgId);
		params.put("orgId", orgId);
		params.put("vCardId", vCardId);
		
		sql = sm.getSQL("maintain4Card");
		super.queryPage(response, sql, params, page, rows, sidx, sord);
		
	}
	

}

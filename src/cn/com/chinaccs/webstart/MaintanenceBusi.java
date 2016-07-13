package cn.com.chinaccs.webstart;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.crud.CrudBusi;

public class MaintanenceBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5071131254226326396L;
	private SqlMapping sm;
	
	public MaintanenceBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_vehicle.xml");
	}
	
	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {

		String orgId = params.get("orgId").toString();
		
		String mtime = params.get("m")==null ? null: params.get("m").toString();
		String iPeople = params.get("p")==null ? null: params.get("p").toString();
		String lId = params.get("l")==null ? null: params.get("l").toString();
		
		String flag = params.get("con").toString();
		
		String likeOrgId = "%" + orgId + ".%";
		params.clear();
		params.put("likeOrgId", likeOrgId);
		params.put("orgId", orgId);
		
		if(flag.equals("1")){
			StringBuilder sqlSb = new StringBuilder();
			if(null != mtime && "" != mtime){
				params.put("m", mtime);
				sqlSb.append("and date_format(a.mtn_time,'%Y-%m-%d') = :m ");
			}
			if(null != iPeople && "" != iPeople){
				params.put("p", iPeople);
				sqlSb.append(" and a.inspector = :p ");
			}
			if(null != lId && "" != lId){
				params.put("l", "%" + lId + "%");
				sqlSb.append(" and b.license_place like :l ");
			}
			if(sqlSb.length() > 0){
				sql = sm.getSQL("maintenanceListQr") + sqlSb.toString();
				super.queryPage(response, sql, params, page, rows, sidx, sord);
			}else{
				params.put("condition", "1=1");
				sql = sm.getSQL("maintenanceListQr") + " and :condition ";
				super.queryPage(response, sql, params, page, rows, sidx, sord);
			}
		}else{
			sql = sm.getSQL("maintenanceList");
			super.queryPage(response, sql, params, page, rows, sidx, sord);
		}
	}
	
	public void query4Card(HttpServletResponse response, String sql,
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

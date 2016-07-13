package cn.com.chinaccs.webstart.admin;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.crud.CrudBusi;

public class UserBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5071131254226326396L;
	private SqlMapping sm;
	
	public UserBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_user.xml");
	}
	
	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {
		String flag = params.get("flag").toString();
		String orgId =  params.get("orgId").toString();
		String likeOrgId = "%"+orgId+".%";
		params.clear();
		if("true".equals(flag)){
			params.put("likeOrgId", likeOrgId);
			params.put("orgId", orgId);
			sql = sm.getSQL("all_userList");
		}else{
			params.put("orgId", orgId);
			sql = sm.getSQL("userList");
		}
		 super.queryPage(response,sql,params,page,rows,sidx,sord);
	}

}

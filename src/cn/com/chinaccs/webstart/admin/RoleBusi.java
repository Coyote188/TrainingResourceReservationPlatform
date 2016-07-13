package cn.com.chinaccs.webstart.admin;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.com.chinaccs.action.BaseAction;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.webstart.crud.CrudBusi;

public class RoleBusi extends CrudBusi {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5198405992301914747L;
	private SqlMapping sm;
	public RoleBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_role.xml");
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
			params.put("roleType", TNRole.ROLE_TYPE_BASE);
			params.put("likeOrgId", likeOrgId);
			params.put("orgId", orgId);
			sql = sm.getSQL("role_list");
		}else{
			params.put("roleType", TNRole.ROLE_TYPE_COMMON);
			sql = sm.getSQL("common_role_list");
		}
		 super.queryPage(response,sql,params,page,rows,sidx,sord);
	}

}



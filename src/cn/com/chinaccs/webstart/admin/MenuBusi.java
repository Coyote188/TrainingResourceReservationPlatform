package cn.com.chinaccs.webstart.admin;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.dao.impl.MenuDao;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.crud.CrudBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class MenuBusi extends CrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4128996450014948184L;
	private SqlMapping sm;
	public MenuBusi() {
		sm = new SqlMapping(PATH_RESOURCE + "sql_menu.xml");
	}

	@Override
	public String save(Object obj, Map<String, Object> params) {
		JSONObject json = WebStartBusi.getJson(RESULT_FAIL, MSG_FAIL);
		try {
			TNMenu menu = (TNMenu) obj;
			String pId = menu.getParentId();
			TNMenu pmenu = new TNMenu();
			MenuDao dao = new MenuDao();
			pmenu = dao.find(pId);
			if (pmenu != null && pmenu.getLevel() != null) {
				menu.setLevel(pmenu.getLevel() + 1); // 添加菜单等级
			} else {
				menu.setLevel(1); // 添加菜单等级
			}
			if(StringUtil.isEmpty(menu.getUri())) {
				menu.setUri("index/"+menu.getMenuName());
			}
			if(StringUtil.isEmpty(menu.getParentId())) {
				menu.setParentId("0");
			}
			Serializable id = dao.save(menu);
			if(null != id) {
				json = WebStartBusi.getJson(RESULT_SCCESS, "数据添加成功");
			}
		} catch (Exception e) {
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
			TNMenu menu = (TNMenu) obj;
			String pId = menu.getParentId();
			TNMenu pmenu = new TNMenu();
			IDBDao<TNMenu, String> dao = BaseDao.getInstance();
			pmenu = dao.query(pmenu, pId);
			if (pmenu != null && pmenu.getLevel() != null) {
				menu.setLevel(pmenu.getLevel() + 1); // 添加菜单等级
			} else {
				menu.setLevel(1); // 添加菜单等级
			}
			/*if(StringUtil.isEmpty(menu.getUri())) {
				menu.setUri("index/"+menu.getMenuName());
			}*/
			if(StringUtil.isEmpty(menu.getParentId())) {
				menu.setParentId("0");
			}
			return super.upd(menu, params);
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
		String sqlDelOm = "delete from T_N_ROLE_MENU t where t.menu_id=:id";
		try {
			delete(sqlDelOm, deleteIds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.del(sql, deleteIds, params);
	}

	@Override
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params) {
		String flag = params.get("flag").toString();
		params.clear();
		if(TNMenu.MENU_TYPE_BASE.equals(flag)){
			sql = sm.getSQL("b_menu_list");
		}else if(TNMenu.MENU_TYPE_FLOW.equals(flag)){
			sql = sm.getSQL("f_menu_list");
		}
		super.queryTree(response, sql, params);
	}

}

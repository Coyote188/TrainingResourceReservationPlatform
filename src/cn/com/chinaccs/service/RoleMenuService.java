package cn.com.chinaccs.service;

import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.dao.impl.RoleMenuDao;
import cn.com.chinaccs.utils.StringUtil;

public class RoleMenuService extends BaseService {

	/**
	 * 
	 * @param roleId
	 * @param menuIds
	 * @return
	 */
	public CHResponse save(String roleId,String[] menuIds) {
		CHResponse chResponse = new CHResponse();
		RoleMenuDao dao = new RoleMenuDao();
		if(!StringUtil.isEmpty(roleId)) {
			if(dao.delete(roleId)) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
			}
			if(null != menuIds && menuIds.length>0) {
				List<TNRoleMenu> list = new ArrayList<TNRoleMenu>();
				TNRoleMenu roleMenu = null;
				for (int i = 0; i < menuIds.length; i++) {
					roleMenu = new TNRoleMenu();
					roleMenu.setMenuId(menuIds[i]);
					roleMenu.setRoleId(roleId);
					list.add(roleMenu);
				}
				
				if(dao.save(list)) {
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg(OP_SUCCESS_MSG);
				} else {
					chResponse.setResult(OP_FAIL);
					chResponse.setMsg(OP_FAIL_MSG);
				}
			}
		}
		return chResponse;
	}
	
}

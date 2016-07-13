package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.SelectTreeProp;
import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNRoleLink;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.bean.entity.TNRoleMenuPermit;
import cn.com.chinaccs.dao.impl.RoleDao;
import cn.com.chinaccs.dao.impl.RoleLinkDao;
import cn.com.chinaccs.dao.impl.RoleMenuDao;
import cn.com.chinaccs.dao.impl.RoleMenuPermitDao;
import cn.com.chinaccs.dao.impl.RoleUserDao;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.memory.menu.MenuMemory;
import cn.com.chinaccs.utils.StringUtil;

public class RoleService extends BaseService {

	private RoleDao roleDao;
	
	public RoleService() {
		roleDao = new RoleDao();
	}
	
	/**
	 * 添加基础角色 及权限
	 * */
	public CHResponse addRole(TNRole role, String panertRoleIds,
			String permitIds, String menuIds, String userCallName) {
		
			CHResponse chResponse = new CHResponse();
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg("角色添加失败!");
			role.setCreator(userCallName);
			role.setRoleType(TNRole.ROLE_TYPE_BASE);
			Serializable roleId = roleDao.save(role);
			RoleLinkDao rlDao = new RoleLinkDao();
			if(!"".equals(roleId.toString())){
				List<TNRoleLink> rlList =  new ArrayList<TNRoleLink>();
				rlList = getRoleLinkList(panertRoleIds,roleId.toString());
				rlDao.save(rlList);
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("角色添加成功!");
				CHResponse chResponse2 = saveRoleMenuPermit(roleId.toString(),permitIds,menuIds);//添加角色权限
				if(OP_FAIL.equals(chResponse2.getResult()))
					chResponse.setMsg(chResponse2.getMsg());
				MenuMemory.getInstance().initRoleMenu();//重置角色缓存
			}
			rlDao = null;
		
		return chResponse;
	}
	
	/**
	 * 修改角色及权限  
	 * */
	public CHResponse editRole(TNRole role, String panertRoleIds,
			String permitIds, String menuIds) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("角色修改失败!");
		String roleId = role.getId();
		if(!"".equals(roleId)){
			TNRole oldRole = new TNRole();
			oldRole = roleDao.find(roleId);
			oldRole.setRoleName(role.getRoleName());
			oldRole.setRoleDes(role.getRoleDes());
			oldRole.setOrgId(role.getOrgId());
			if(roleDao.update(oldRole)){//更新基础角色
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("角色修改成功!");
				if(delRoleMenuPermit(roleId)){//删除角色与菜单  权限映射表 两表中的数据
					CHResponse chResponse2 =  saveRoleMenuPermit(roleId,permitIds,menuIds);//重新保存新的角色 菜单 权限 数据
					if(chResponse2.getResult().equals(OP_FAIL)){
						chResponse.setMsg(chResponse2.getMsg());
					}
						
				}
			}
			
			RoleLinkDao rlDao = new RoleLinkDao();
			boolean bol = rlDao.delBaseRoleIds(roleId);//删除角色继承关系
			if(bol){//重新添加 角色继承关系数据
				List<TNRoleLink> rlList =  new ArrayList<TNRoleLink>();
				rlList = getRoleLinkList(panertRoleIds,roleId.toString());
				rlDao.save(rlList);
			}
			MenuMemory.getInstance().initRoleMenu();//重置角色缓存
			rlDao = null;
			roleDao = null;
		}

		return chResponse;
	}
	
	/**
	 * 删除角色 及权限
	 * */
	public CHResponse delRole(String roleIds) {
		CHResponse chResponse = new CHResponse();
		RoleLinkDao rlDao = new RoleLinkDao();
		RoleUserDao ruDao = new RoleUserDao();
		boolean bol = rlDao.delBaseRoleIds(roleIds);//删除角色继承关系
		if(bol){
			if(roleDao.delete(roleIds)){//删除 角色
				ruDao.delForRoleIds(roleIds);//删除 角色用户
				delRoleMenuPermit(roleIds);//删除角色 菜单 权限
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("角色删除成功!");
				MenuMemory.getInstance().initRoleMenu();//重置角色缓存
			}
		}else{
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg("角色删除失败!");
		}
		rlDao = null;
		roleDao = null;
		return chResponse;
	}
	
	
	
	



	/**
	 * 添加公共角色数据 及 权限
	 * 
	 * */
	public CHResponse addRoleCom(TNRole role, String permitIds, String menuIds,String userCallName) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("公共角色添加失败!");
		role.setCreator(userCallName);
		role.setRoleType(TNRole.ROLE_TYPE_COMMON);
		Serializable roleId = roleDao.save(role);
		if(!"".equals(roleId.toString())){
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("公共角色添加成功!");
			CHResponse chResponse2 = saveRoleMenuPermit(roleId.toString(),permitIds,menuIds);//添加角色权限
			if(OP_FAIL.equals(chResponse2.getResult()))
				chResponse.setMsg(chResponse2.getMsg());
			MenuMemory.getInstance().initRoleMenu();//重置角色缓存

		}
		
		
		return chResponse;
	}
	
	/**
	 * 修改公共角色及权限
	 * */
	public CHResponse editRoleCom(TNRole role, String permitIds,
			String menuIds) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("角色修改失败!");
		String roleId = role.getId();
		if(!"".equals(roleId)){
			TNRole oldRole = new TNRole();
			oldRole = roleDao.find(roleId);
			oldRole.setRoleName(role.getRoleName());
			oldRole.setRoleDes(role.getRoleDes());
			if(roleDao.update(oldRole)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("角色修改成功!");
				if(delRoleMenuPermit(roleId)){
					CHResponse chResponse2 =  saveRoleMenuPermit(roleId,permitIds,menuIds);
					if(chResponse2.getResult().equals(OP_FAIL)){
						chResponse.setMsg(chResponse2.getMsg());
					}
						
				}
				MenuMemory.getInstance().initRoleMenu();//重置角色缓存
			}
		}

		return chResponse;
	}
	
	/**
	 * 删除公共角色 及权限
	 * */
	public CHResponse delRoleCom(String roleComIds) {
		CHResponse chResponse = new CHResponse();
		RoleLinkDao rlDao = new RoleLinkDao();
		boolean bol = rlDao.delParentRoleIds(roleComIds);//删除角色继承关系
		if(bol){
			if(roleDao.delete(roleComIds)){
				delRoleMenuPermit(roleComIds);
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("公共角色删除成功!");
				MenuMemory.getInstance().initRoleMenu();//重置角色缓存
			}
		}else{
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg("公共角色删除失败!");
		}
		rlDao = null;
		roleDao = null;
		return chResponse;
	}
	
	
	
	
/**
 * 添加查询获得完整的权限树数据 1
 * */
	public CHResponse getzTree1() {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("权限树获取失败");
		RoleDao dao = new RoleDao();
		List<Object> menuList = dao.getMenu();	
		List<Object> permitList = dao.getPermit();	
		if(menuList.size()>0){
			String dataStr = initZnodes(menuList,permitList);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}
		dao = null;
		return chResponse;
	}
	
	/**
	 * 修改查询权限树数据  2
	 * */
	public CHResponse getzTree2(String roleComId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("权限树获取失败");
		
		RoleDao dao = new RoleDao();
		List<Object> menuList = dao.getMenu();	
		List<Object> permitList = dao.getPermit();
		List<Object> menuSelectL = dao.getSelectMenu(roleComId);
		List<Object> permitSelectL = dao.getSelectPermit(roleComId);

		
		List<Object>newMenuList = new ArrayList<Object>();
		List<Object> newPermitList = new ArrayList<Object>();
		for(Object obj1 : menuList){
			String menuId1 = ((Object[])obj1)[0].toString();
			for(Object obj2:menuSelectL){
				String menuId2 = ((Object[])obj2)[0].toString();//menuId对比
				if(menuId1.equals(menuId2)){
					((Object[])obj1)[3]="true";
				}
			}
			newMenuList.add(obj1);
		}
		for(Object obj3 : permitList){
			String val1 = ((Object[])obj3)[2].toString();
			for(Object obj4:permitSelectL){
				String val2 = ((Object[])obj4)[2].toString();//permitVal对比
				if(val1.equals(val2)){
					((Object[])obj3)[4]="true";
				}
			}
			newPermitList.add(obj3);
		}
		
		if(newMenuList.size()>0){
			String dataStr = initZnodes(newMenuList,newPermitList);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}

		return chResponse;
	}
	
	/**
	 * 权限模板树
	 * */
	public CHResponse getzTree3(String roleComId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("权限树获取失败");
		RoleDao dao = new RoleDao();
		List<Object> menuSelectL = dao.getSelectMenu(roleComId);
		List<Object> permitSelectL = dao.getSelectPermit(roleComId);
		if(menuSelectL.size()>0){
			String dataStr = initZnodes(menuSelectL,permitSelectL);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}
		dao = null;
		return chResponse;
	}
	
	/**
	 * 角色权限 编辑模板  （公共模板-不可编辑 和 自定义模板-可编辑  组合）
	 * 
	 * */
	public CHResponse getzTree4(String prIds, String roleId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("权限树获取失败");
		RoleDao dao = new RoleDao();
		String sqlPrIds = splitIds(prIds);
//		if("".equals(sqlIds)){
//			sqlIds = "'"+roleId+"'";
//		}else{
//			sqlIds +=",'"+roleId+"'";
//		}
		List<Object> menuList = dao.getMenu();	
		List<Object> permitList = dao.getPermit();
		List<Object> menuSelectL = dao.getSelectMenuRoleIdS(sqlPrIds,roleId);
		List<Object> permitSelectL = dao.getSelectPermitRoleIdS(sqlPrIds,roleId);
		
		List<Object>newMenuList = new ArrayList<Object>();
		List<Object> newPermitList = new ArrayList<Object>();
		for(Object obj1 : menuList){
			String menuId1 = ((Object[])obj1)[0].toString();
			for(Object obj2:menuSelectL){
				String menuId2 = ((Object[])obj2)[0].toString();//menuId对比
				if(menuId1.equals(menuId2)){
					((Object[])obj1)[3]=((Object[])obj2)[3];//是否勾选
					((Object[])obj1)[4]=((Object[])obj2)[4];//是否编辑
				}
			}
			newMenuList.add(obj1);
		}
		for(Object obj3 : permitList){
			String val1 = ((Object[])obj3)[2].toString();
			for(Object obj4:permitSelectL){
				String val2 = ((Object[])obj4)[2].toString();//permitVal对比
				if(val1.equals(val2)){
					((Object[])obj3)[4]=((Object[])obj4)[4];//是否勾选
					((Object[])obj3)[5]=((Object[])obj4)[5];//是否编辑
				}
			}
			newPermitList.add(obj3);
		}
		
		
		if(newMenuList.size()>0){
			String dataStr = initZnodes(newMenuList,newPermitList);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}
		dao = null;
		return chResponse;
	}
	
	
	/**
	 * 自定义模板
	 * @param roleId 
	 * 
	 * */
//	public CHResponse getzTree4(String prIds, String roleId) {
//		CHResponse chResponse = new CHResponse();
//		chResponse.setResult(OP_FAIL);
//		chResponse.setMsg("权限树获取失败");
//		RoleDao dao = new RoleDao();
//		String sqlIds = splitIds(prIds);
//		if("".equals(sqlIds)){
//			sqlIds = "'"+roleId+"'";
//		}else{
//			sqlIds +=",'"+roleId+"'";
//		}
//		List<Object> menuSelectL = dao.getNotSelectMenu(sqlIds);
//		List<Object> permitSelectL = dao.getNotSelectPermit(sqlIds);
//		if(menuSelectL.size()>0){
//			String dataStr = initZnodes(menuSelectL,permitSelectL);
//			chResponse.setResult(OP_SUCCESS);
//			chResponse.setMsg("获取成功！");
//			chResponse.setData(dataStr);
//		}
//		dao = null;
//		return chResponse;
//	}

/**
 * tree5 查询该角色的所有权限
 * */	
	public CHResponse getzTree5(String roleId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("权限树获取失败");
		RoleDao dao = new RoleDao();
		List<Object> menuSelectL = dao.getAllRoleMenu(roleId);
		List<Object> permitSelectL = dao.getAllRolePermit(roleId);
		if(menuSelectL.size()>0){
			String dataStr = initZnodes(menuSelectL,permitSelectL);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("获取成功！");
			chResponse.setData(dataStr);
		}
		dao = null;
		return chResponse;
	}

	
	
	
	/**
	 * 添加角色权限数据
	 * */
	public CHResponse saveRoleMenuPermit(String roleId, String permitIds, String menuIds) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("该角色权限添加失败!");
		if(!"".equals(roleId)) {
			
			String[] menuArr = menuIds.split(",");
			String[] permitArr = permitIds.split(",");
			List<TNRoleMenu> rmList = new ArrayList<TNRoleMenu>();
			List<TNRoleMenuPermit> rmpList = new ArrayList<TNRoleMenuPermit>();
			for(String menuId : menuArr){
				TNRoleMenu rm = new TNRoleMenu();
				String rmId = "rm"+StringUtil.createSerialNum();
				rm.setId(rmId);
				rm.setMenuId(menuId);
				rm.setRoleId(roleId);
				rmList.add(rm);
				for(String permit : permitArr){
					TNRoleMenuPermit rmp = new TNRoleMenuPermit();
					String[]arr = permit.split(";");
					if(arr.length==2){
						String cMenuId = arr[0];
						String permitVal = arr[1];
						if(menuId.equals(cMenuId)){
							rmp.setRoleMenuId(rmId);
							rmp.setPermitVal(permitVal);
							rmpList.add(rmp);
						}
					}
				}
			}
			if(rmList.size()>0){
				RoleMenuDao rmDao = new RoleMenuDao();
				if(rmDao.save(rmList)){
					if(rmpList.size()>0){
						RoleMenuPermitDao rmpDao = new RoleMenuPermitDao();
						rmpDao.save(rmpList);
						rmpDao = null;
					}
				}
				rmDao = null;
			}
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("该角色权限添加成功!");
			roleDao = null;
			
		}
		return chResponse;
	}
	
	/**
	 *删除角色权限数据 可删除多条 也可单条  id或 ids都可以
	 *
	 * */
	public Boolean delRoleMenuPermit(String roleIds) {
		boolean bol = false;
		RoleMenuDao rmDao = new RoleMenuDao();
		RoleMenuPermitDao rmpDao = new RoleMenuPermitDao();
		if(rmpDao.delSql(roleIds))
			if(rmDao.delSql(roleIds))
				bol = true;
		rmDao = null; 
		rmpDao = null;
		return bol;
	}

		
	
	
	
	/**
	 * 拼接权限树json
	 * @author YB
	 * @param permitList 
	 * @param flag 
	 * */
	public String initZnodes(List<Object> menuList, List<Object> permitList) {
		String str ="[";
		for(Object obj : menuList){
			boolean isParent = true;
			String menuId = ((Object[])obj)[0].toString();
			str +="{\"doCheck\":\""+((Object[])obj)[4].toString()+"\",\"id\":\""+((Object[])obj)[0].toString()+"\",\"checked\":\""+((Object[])obj)[3].toString()+"\",\"pId\":\""+((Object[])obj)[1].toString()+"\",\"name\":\""+((Object[])obj)[2].toString()+"\",\"open\":\"true\",\"operates\":[";
			if(permitList.size()>0){
				String str2 = "";
				for(Object objPer :permitList){
					String pMenuId = ((Object[])objPer)[1].toString();
					if(menuId.equals(pMenuId)){
						str2 += "{\"id\":\""+((Object[])objPer)[0].toString()+"\",\"menuId\":\""+((Object[])objPer)[1].toString()+"\",\"val\":\""+((Object[])objPer)[2].toString()+"\",\"name\":\""+((Object[])objPer)[3].toString()+"\",\"disabled\":\""+((Object[])objPer)[5].toString()+"\",\"checked\":\""+((Object[])objPer)[4].toString()+"\"},";
					}
				}
				if(!"".equals(str2)){
					str2 = str2.substring(0,str2.length()-1);
					str +=str2;	
					isParent = false;
				}
				
			}
			str +="]";
			if(!isParent)
				str +=",\"iconSkin\":\"permiticon\"";
			str +="},";
		} 
		str = str.substring(0,str.length()-1)+"]";
		System.out.println(str);
		return str;
	}
	
	/**
	 * 查询公共角色列表
	 * @param roleId 
	 * */
	public CHResponse queryRoleCom(String roleId) {
		CHResponse chResponse = new CHResponse();
		chResponse.setResult(OP_FAIL);
		chResponse.setMsg("公共角色数据获取失败!");
		List<Object> list = new ArrayList<Object>();
		list = roleDao.queryRoleComList(roleId);
		if(list.size()>0){
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("公共角色查询成功！");
			chResponse.setData(list);
		}
		return chResponse;
	}
	
	/**
	 * 生成角色继承类 list
	 * */
		private List<TNRoleLink> getRoleLinkList(String panertRoleIds, String roleId) {
			List<TNRoleLink> list = new ArrayList<TNRoleLink>();
			if(null != panertRoleIds && !StringUtil.isEmpty(panertRoleIds.toString())) {
				String[] idsArr = panertRoleIds.split(",");
				for (int i = 0; i < idsArr.length; i++) {
					TNRoleLink roleLink = new TNRoleLink();
					roleLink.setParentRoleId(idsArr[i]);
					roleLink.setRoleId(roleId);
					list.add(roleLink);
				}
			}
			return list;
		}
		
		

	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public CHResponse getRole(String id) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(id)) {
			TNRole role = roleDao.find(id);
			if(null != role) {
				chResponse.setData(role);
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
			}
		}
		return chResponse;
	}
	
	
	/**
	 * 
	 * @param roleId
	 * @param userId
	 * @return
	 */
//	@SuppressWarnings("unchecked")
//	public CHResponse getSelectMenuTree(String roleId,String userId) {
//		CHResponse chResponse = new CHResponse();
//		if(!StringUtil.isEmpty(roleId)) {
//			MenuService menuServ = new MenuService();
//			TNMenu menu = new TNMenu();
//			menu.setId("0");
//			chResponse = menuServ.getChildTree(menu,userId);
//			List<SelectTreeProp> lists = new ArrayList<SelectTreeProp>();
//			if(OP_SUCCESS.equals(chResponse.getResult())) {
//				List<TreeProp> menus = (List<TreeProp>) chResponse.getData();
//				RoleMenuDao rmDao = new RoleMenuDao();
//				List<TNRoleMenu> rms = rmDao.getRoleMenus(roleId);
//				SelectTreeProp stProp = null;
//				for (TreeProp menuTmp : menus) {
//					stProp = new SelectTreeProp();
//					stProp.setId(menuTmp.getId());
//					stProp.setName(menuTmp.getName());
//					stProp.setParentId(menuTmp.getParentId());
//					stProp.setIsCheck("-1");
//					for(TNRoleMenu roleMenu : rms) {
//						if(menuTmp.getId().equals(roleMenu.getMenuId())) {
//							stProp.setIsCheck("1");
//							break;
//						}
//					}
//					lists.add(stProp);
//				}
//			}
//			if(lists.size()>0) {
//				chResponse.setData(lists);
//			} else {
//				chResponse.setResult(OP_FAIL);
//				chResponse.setMsg(OP_FAIL_MSG);
//			}
//		}
//		return chResponse;
//	}
	
	
	/**
	 * 
	 * @param roleId
	 * @param orgId
	 * @return
	 */
//	@SuppressWarnings("unchecked")
//	public CHResponse getSelectOrgTree(String roleId,String orgId) {
//		CHResponse chResponse = new CHResponse();
//		if(!StringUtil.isEmpty(roleId)) {
//			OrgService orgServ = new OrgService();
//			TNOrg org = new TNOrg();
//			org.setId("0");
//			chResponse = orgServ.getSubTree(orgId);
//			List<SelectTreeProp> lists = new ArrayList<SelectTreeProp>();
//			if(OP_SUCCESS.equals(chResponse.getResult())) {
//				List<TreeProp> orgs = (List<TreeProp>) chResponse.getData();
//				RoleOrgDao roDao = new RoleOrgDao();
//				List<TNRoleOrg> ros = roDao.getRoleOrgs(roleId);
//				SelectTreeProp stProp = null;
//				for (TreeProp orgTmp : orgs) {
//					stProp = new SelectTreeProp();
//					stProp.setId(orgTmp.getId());
//					stProp.setName(orgTmp.getName());
//					stProp.setParentId(orgTmp.getParentId());
//					stProp.setIsCheck("-1");
//					for(TNRoleOrg roleOrg : ros) {
//						if(orgTmp.getId().equals(roleOrg.getOrgId())) {
//							stProp.setIsCheck("1");
//							break;
//						}
//					}
//					lists.add(stProp);
//				}
//			}
//			if(lists.size()>0) {
//				chResponse.setData(lists);
//			} else {
//				chResponse.setResult(OP_FAIL);
//				chResponse.setMsg(OP_FAIL_MSG);
//			}
//		}
//		return chResponse;
//	}
	
	
	/**
	 * 
	 * @param orgId
	 * @return
	 */
//	public CHResponse getOrgRoleTree(String orgId) {
//		OrgService orgServ = new OrgService();
//		CHResponse chResponse = orgServ.getSubTree(orgId);
//		if(OP_SUCCESS.equals(chResponse.getResult())) {
//			@SuppressWarnings("unchecked")
//			List<TreeProp> lists = (List<TreeProp>) chResponse.getData();
//			String orgIds = "";
//			for(TreeProp treeProp : lists) {
//				orgIds = orgIds+"'"+treeProp.getId()+"',";
//			}
//			orgIds = orgIds.substring(0,orgIds.length()-1);
//			RoleDao roleDao = new RoleDao();
//			List<Object> roles = roleDao.queryByOrgIds(orgIds);
//			if(null != roles) {
//				TreeProp treeProp = null;
//				int seqNum = 1;
//				List<TreeProp> newTreeProp = new ArrayList<TreeProp>();
//				for(int i=0;i<lists.size();i++) {
//					newTreeProp.add(lists.get(i));
//					seqNum = 1;
//					for(Object obj : roles) {
//						Object[] objs = (Object[])obj;
//						if(lists.get(i).getId().equals(objs[2].toString())) {
//							treeProp = new TreeProp();
//							treeProp.setFlag("role");
//							treeProp.setId(objs[0].toString());
//							treeProp.setName(objs[1].toString());
//							treeProp.setParentId(lists.get(i).getId());
//							treeProp.setSeqNum(seqNum);
//							treeProp.setUri(objs[0].toString());
//							newTreeProp.add(i+1, treeProp);
//						}
//						seqNum++;
//					}
//				}
//				chResponse.setData(newTreeProp);
//				lists = null;
//				newTreeProp = null;
//				roles = null;
//				treeProp = null;
//			}
//		}
//		return chResponse;
//	}
	
	


	public CHResponse save(TNRole role) {
		// TODO Auto-generated method stub
		return null;
	}


public String splitIds(String ids){
	String newIds = "";
	if(null != ids && !StringUtil.isEmpty(ids.toString())) {
		String[] idsArr = ids.split(",");
		for (int i = 0; i < idsArr.length; i++) {
			if(i != (idsArr.length-1)) {
				newIds += "'"+idsArr[i]+"',";
			} else {
				newIds += "'"+idsArr[i]+"'";
			}
		}
	}else{
		newIds = "''";
	}
	return newIds;
}













}

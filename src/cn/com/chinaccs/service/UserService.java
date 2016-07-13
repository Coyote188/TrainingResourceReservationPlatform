package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNOrg;
import cn.com.chinaccs.bean.entity.TNRole;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.bean.entity.TNRoleUser;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.dao.impl.AutoDao;
import cn.com.chinaccs.dao.impl.OrgDao;
import cn.com.chinaccs.dao.impl.RoleUserDao;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.utils.SignMD5;
import cn.com.chinaccs.utils.StringUtil;

public class UserService extends BaseService {

	public CHResponse save(TNUser user, String roleIds) {
		CHResponse chResponse = new CHResponse();
		if(null != user) {
			UserDao dao = new UserDao();
			RoleUserDao ruDao = new RoleUserDao();

			String userName = user.getUserName()==null?"":user.getUserName();
			boolean bol = dao.checkUserName(userName);//验证用户名是否重复
			if(!bol){
				chResponse.setResult(OP_FAIL);
				chResponse.setMsg("用户名重复,请重新输入一个!");
				return chResponse;
			}
			Serializable  id = dao.save(user);
			if(null != id) {
				List<TNRoleUser> list = new ArrayList<TNRoleUser>();
				list = getRoleLinkList(roleIds, id.toString());
				ruDao.save(list);
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("用户添加成功");
				chResponse.setData(id.toString());
			}
			dao = null;
			ruDao = null;
		}
		return chResponse;
	}
	

	public CHResponse edit(TNUser user, String roleIds) {
		CHResponse chResponse = new CHResponse();
		if(null != user) {
			UserDao dao = new UserDao();
			RoleUserDao ruDao = new RoleUserDao();
			TNUser oldUser = new TNUser();
			String userId = user.getId();
			oldUser = dao.find(userId);
			String userName = user.getUserName()==null?"":user.getUserName();
			if(!oldUser.getUserName().equals(userName)){//如果用户名被修改了 ，就需要验证新名字是否冲突
				boolean bol = dao.checkUserName(userName);//验证用户名是否重复
				if(!bol){
					chResponse.setResult(OP_FAIL);
					chResponse.setMsg("用户名重复,请重新输入一个!");
					return chResponse;
				}
			}
			user.setPassword(oldUser.getPassword());
			user.setCreateTime(oldUser.getCreateTime());
			boolean  upbol = dao.update(user);
			if(upbol) {
				boolean delBol = ruDao.delForUserIds(userId);//删除该用户的相关角色
				if(delBol){
					List<TNRoleUser> list = new ArrayList<TNRoleUser>();
					list = getRoleLinkList(roleIds, userId);
					ruDao.save(list);
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg("用户信息修改成功");
					chResponse.setData(userId);
				}
			}
			dao = null;
			ruDao = null;
		}
		return chResponse;
	}
	
	public CHResponse del(String id) {
		CHResponse chResponse = new CHResponse();
		if(null != id) {
			UserDao dao = new UserDao();
			if(dao.delete(id)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("用户数据删除成功");
			}
		}
		return chResponse;
	}
	
	public CHResponse login(String username,String password) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(username) && !StringUtil.isEmpty(password)) {
			UserDao userDao = new UserDao();
			TNUser user = userDao.login(username);
			if(null != user) {
				String md5Pwd = SignMD5.execute(password);
				if(md5Pwd.equals(user.getPassword())) {
					UserInfo userInfo = new UserInfo();
					userInfo.setId(user.getId());
					userInfo.setUsername(user.getUserName());
					userInfo.setCallName(user.getCallName());
					OrgDao orgDao = new OrgDao();
					TNOrg org =  orgDao.find(user.getOrgId());
					orgDao = null;
					if(null != org) {
						if(TNOrg.ORG_TYPE_ORG.equals(org.getType())) {
							userInfo.setOrgId(org.getId());
						} else {
							userInfo.setDepartmentId(org.getId());
						}
						if(StringUtil.isEmpty(userInfo.getOrgId())) {
							OrgService orgServ = new OrgService();
							CHResponse chResponse2 = orgServ.getOrgInfo(user.getOrgId());
							if(OP_SUCCESS.equals(chResponse2.getResult())) {
								org = (TNOrg)chResponse2.getData();
								userInfo.setOrgId(org.getId());
							}
							chResponse2 = null;
						}
					} else {
						userInfo.setOrgId(user.getOrgId());
					}
					List<String>roleidsList = userDao.getRoleIds(user.getId());
					userInfo.setRoleIds(roleidsList);
					userInfo.setComRoleIds(userDao.getComRoleIds(user.getId()));
					userInfo.setOrgIds(userDao.getOrgIds(user.getId()));
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg(OP_SUCCESS_MSG);
					chResponse.setData(userInfo);
					org = null;
					userDao = null;
					userInfo = null;
				} else {
					log.info("密码错误--输入密码["+password+"]--");
				}
			} else {
				log.info("用户名错误--输入用户名["+username+"]--");
			}
			user = null;
		} else {
			log.info("HQL为空--");
		}
		return chResponse;
	}
	
	/**
	 * 
	 * @param orgId
	 * @return
	 */
	public CHResponse getOrgUserTree(String orgId) {
		OrgService orgServ = new OrgService();
		CHResponse chResponse = orgServ.getSubTree(orgId);
		if(OP_SUCCESS.equals(chResponse.getResult())) {
			@SuppressWarnings("unchecked")
			List<TreeProp> lists = (List<TreeProp>) chResponse.getData();
			String orgIds = "";
			for(TreeProp treeProp : lists) {
				orgIds = orgIds+"'"+treeProp.getId()+"',";
			}
			orgIds = orgIds.substring(0,orgIds.length()-1);
			UserDao userDao = new UserDao();
			List<TNUser> users = userDao.queryByOrgIds(orgIds);
			if(null != users) {
				TreeProp treeProp = null;
				int seqNum = 1;
				List<TreeProp> newTreeProp = new ArrayList<TreeProp>();
				for(int i=0;i<lists.size();i++) {
					newTreeProp.add(lists.get(i));
					seqNum = 1;
					for(TNUser userTmp : users) {
						if(lists.get(i).getId().equals(userTmp.getOrgId())) {
							treeProp = new TreeProp();
							treeProp.setFlag("user");
							treeProp.setId(userTmp.getId());
							treeProp.setName(userTmp.getUserName());
							treeProp.setParentId(lists.get(i).getId());
							treeProp.setSeqNum(seqNum);
							treeProp.setUri(userTmp.getId());
							newTreeProp.add(i+1, treeProp);
						}
						seqNum++;
					}
				}
				chResponse.setData(newTreeProp);
				lists = null;
				newTreeProp = null;
				users = null;
				treeProp = null;
			}
		}
		return chResponse;
	}
	
	
	/**
	 * 初始化管理员用户
	 */
	public void initAdminUser() {
		String userId = null;
		String roleId = null;
		try {
			TNUser user = new TNUser();
			user.setUserName("admin");
			user.setPassword("123456");
			user.setOrgId("0");
			user.setState(1);
			user.setCallName("超级管理员");
			UserDao userDao = new UserDao();
			userId = StringUtil.handNull(userDao.save(user));
			
			AutoDao<TNRole> roleDao = new AutoDao<TNRole>(TNRole.class);
			TNRole role = new TNRole();
			role.setRoleName("超级管理员角色");
			role.setRoleDes("系统超级管理员角色");
			role.setRoleType(TNRole.ROLE_TYPE_BASE);
			role.setOrgId("0");
			roleId = StringUtil.handNull(roleDao.save(role));
			
			if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(roleId)) {
				TNRoleUser roleUser = new TNRoleUser();
				roleUser.setUserId(userId);
				roleUser.setRoleId(roleId);
				AutoDao<TNRoleUser> ruDao = new AutoDao<TNRoleUser>(TNRoleUser.class);
				ruDao.save(roleUser);
				
			//	TNRoleOrg roleOrg = new TNRoleOrg();
//				roleOrg.setOrgId("0");
//				roleOrg.setRoleId(roleId);
//				AutoDao<TNRoleOrg> roDao = new AutoDao<TNRoleOrg>(TNRoleOrg.class);
//				roDao.save(roleOrg);
				
				TNMenu menu = new TNMenu();
				menu.setLevel(1);
				menu.setMenuName("系统管理");
				menu.setParentId("0");
				menu.setState(1);
				menu.setSeqNum(10);
				menu.setUri("system");
				
				AutoDao<TNMenu> menuDao = new AutoDao<TNMenu>(TNMenu.class);
				String menuId = StringUtil.handNull(menuDao.save(menu));
				if(!StringUtil.isEmpty(menuId)) {
					TNRoleMenu roleMenu = new TNRoleMenu();
					roleMenu.setMenuId(menuId);
					roleMenu.setRoleId(roleId);
					
					AutoDao<TNRoleMenu> rmDao = new AutoDao<TNRoleMenu>(TNRoleMenu.class);
					rmDao.save(roleMenu);
					
					TNMenu addMenu = new TNMenu();
					addMenu.setLevel(2);
					addMenu.setMenuName("菜单管理");
					addMenu.setParentId(menuId);
					addMenu.setState(1);
					addMenu.setSeqNum(1);
					addMenu.setUri("showPage/menu_list");
					
					String addMenuId = StringUtil.handNull(menuDao.save(addMenu));
					if(!StringUtil.isEmpty(menuId)) {
						roleMenu = new TNRoleMenu();
						roleMenu.setMenuId(addMenuId);
						roleMenu.setRoleId(roleId);
						rmDao.save(roleMenu);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 生成用户角色类 list
	 * */
		private List<TNRoleUser> getRoleLinkList(String roleIds, String userId) {
			List<TNRoleUser> list = new ArrayList<TNRoleUser>();
			if(null != roleIds && !StringUtil.isEmpty(roleIds.toString())) {
				String[] idsArr = roleIds.split(",");
				for (int i = 0; i < idsArr.length; i++) {
					TNRoleUser roleUser = new TNRoleUser();
					roleUser.setRoleId(idsArr[i]);
					roleUser.setUserId(userId);
					list.add(roleUser);
				}
			}
			return list;
		}
	
	
	public static void main(String[] args) {
		UserService userServ = new UserService();
		userServ.initAdminUser();
		System.out.println("初始化用户数据---成功---");
	}



}

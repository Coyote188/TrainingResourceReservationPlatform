package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.service.OrgService;
import cn.com.chinaccs.service.UserService;
import cn.com.chinaccs.utils.SignMD5;
import cn.com.chinaccs.utils.StringUtil;

public class UserAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8529083552305727144L;
	
	private String oldPwd;
	private String newPwd;
	private String confirmNewPwd;
	
	private TNUser objBean;
	
	private String orgId;
	private String flag;
	private String orgSeqName;
	private String roleIds;
	
	private UserService userServ;
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	
	@Override
	public String add() throws Exception {
		if(null != objBean) {
		   userServ = new UserService();
		   chResponse = userServ.save(objBean,roleIds);
		   return json();
		}
		return super.add();
	}

	@Override
	public String edit() throws Exception {
		if(null != objBean) {
			   userServ = new UserService();
			   chResponse = userServ.edit(objBean,roleIds);
			   return json();
		}
		return super.edit();
	}
	
	@Override
	public String del() throws Exception {
	   userServ = new UserService();
	   chResponse = userServ.del(id);
	   return json();
	}

	@Override
	public String list() throws Exception {
		if(StringUtil.isEmpty(orgId)) {
			orgId = userInfo.getOrgId();
		}
		return super.list();
	}
	
	public String userInfo() throws Exception {
		if(null != id) {
		   UserDao dao = new UserDao();
		   objBean = dao.find(id);
		}
		return SUCCESS;
	}
	
	public String changePwd() throws Exception {
		if(!StringUtil.isEmpty(newPwd) && !StringUtil.isEmpty(oldPwd) 
				&& !StringUtil.isEmpty(confirmNewPwd)) {
			chResponse = new CHResponse();
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg(OP_FAIL_MSG);
			if(newPwd.equals(confirmNewPwd)) {
				UserDao dao = new UserDao();
				TNUser user = dao.find(getUserId());
				if(null != user) {
					String md5Pwd = SignMD5.execute(oldPwd);
					if(user.getPassword().equals(md5Pwd)) {
						String md5NewPwd = SignMD5.execute(newPwd);
						user.setPassword(md5NewPwd);
						if(dao.update(user)) {
							chResponse.setResult(OP_SUCCESS);
							chResponse.setMsg("密码修改成功");
						} else {
							chResponse.setResult(OP_FAIL);
							chResponse.setMsg("密码修改失败");
						}
					} else {
						chResponse.setMsg("旧密码错误");
						chResponse.setData("2");
					}
				}
			} else {
				chResponse.setMsg("两次输入的密码不一致");
				chResponse.setData("1");
			}
			log.info(chResponse.getMsg());
			return json();
		}
		return SUCCESS;
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String userChangePwd() throws Exception {
		if(!StringUtil.isEmpty(newPwd) && !StringUtil.isEmpty(id)) {
			chResponse = new CHResponse();
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg(OP_FAIL_MSG);
			UserDao dao = new UserDao();
			TNUser user = dao.find(id);
			if(null != user) {
				String md5Pwd = SignMD5.execute(newPwd);
				user.setPassword(md5Pwd);
				if(dao.update(user)) {
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg("密码修改成功");
				} else {
					chResponse.setResult(OP_FAIL);
					chResponse.setMsg("密码修改失败");
				}
			}
			log.info(chResponse.getMsg());
			return json();
		}
		return SUCCESS;
	}
	

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getConfirmNewPwd() {
		return confirmNewPwd;
	}

	public void setConfirmNewPwd(String confirmNewPwd) {
		this.confirmNewPwd = confirmNewPwd;
	}


	public TNUser getObjBean() {
		return objBean;
	}


	public void setObjBean(TNUser objBean) {
		this.objBean = objBean;
	}


	public String getOrgId() {
		return orgId;
	}


	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}


	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	public String getOrgSeqName() {
		return orgSeqName;
	}


	public void setOrgSeqName(String orgSeqName) {
		this.orgSeqName = orgSeqName;
	}


	public String getRoleIds() {
		return roleIds;
	}


	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	

}

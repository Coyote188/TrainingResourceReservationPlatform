package cn.com.chinaccs.action;

import cn.com.chinaccs.IConstant;
import cn.com.chinaccs.bean.entity.TNInfo;
import cn.com.chinaccs.dao.impl.InfoDao;

/**
 * 信息管理
 * 
 * @author Administrator
 *
 */
public class InfoAction extends BaseImplAction {
	private TNInfo objBean;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String notice() {
		return "notice";
	}

	public String adpiclist(){
		return SUCCESS;
	}
	
	public String trainNoticeList(){
		return SUCCESS;
	}
	
	public String addInfo() throws Exception {
		if (null != objBean) {
			InfoDao dao = new InfoDao();
			objBean.setCreatorId(getUserId());
			objBean.setState("未发布");
			objBean.setInfoType("1");
			if (dao.save(objBean) != null) {
				chResponse.setResult(IConstant.OP_SUCCESS);
				chResponse.setMsg(IConstant.OP_SUCCESS_MSG);
			}
			return json();
		}
		return super.add();
	}


	public TNInfo getObjBean() {
		return objBean;
	}


	public void setObjBean(TNInfo objBean) {
		this.objBean = objBean;
	}

	
}

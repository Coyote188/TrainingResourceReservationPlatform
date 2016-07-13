package cn.com.chinaccs.action;

import cn.com.chinaccs.bean.BaseBean;
import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.dao.impl.BaseDaoImpl;
import cn.com.chinaccs.helper.DynamicLoadDao;
import cn.com.chinaccs.utils.StringUtil;

public class ShowPageAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3309857796520275532L;
	
	public static final String ADD = "add";
	public static final String EDIT = "edit";
	public static final String UPDATE = "update";
	public static final String DEL = "del";
	
	
	private String pagePath;
	private String dir="content";
	private String jspPage;
	private String op;
	private String busiName;
	private BaseBean objBean;
	private Integer seqNum;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String execute() throws Exception {
		if(!StringUtil.isEmpty(pagePath)) {
			String[] params = pagePath.split("_");
			if(params.length>0) {
				jspPage = params[params.length-1];
				if(params.length<5 && params.length>1){
					for (int i = 0; i < (params.length-1); i++) {
						dir += "/"+params[i];
					}
				}
			}
		} else {
			jspPage="index";
		}
		
		if(!StringUtil.isEmpty(op)) {
			if(EDIT.equals(op) || DEL.equals(op) || UPDATE.equals(op) || ADD.equals(op)) {
				DynamicLoadDao loadDao = new DynamicLoadDao();
				String daoName = busiName+"Dao";
				BaseDaoImpl dao = loadDao.getDao(daoName);
				if(null != dao ) {
					if(ADD.equals(op)) {
						seqNum = dao.getSeqNum(id);
					} else if(!StringUtil.isEmpty(id)) {
						if (DEL.equals(op)) {
							chResponse = new CHResponse();
							chResponse.setResult(OP_FAIL);
							chResponse.setMsg("数据删除失败");
							if(dao.delete(id)) {
								chResponse.setResult(OP_SUCCESS);
								chResponse.setMsg("数据删除成功");
							}
							return json();
						} else if(EDIT.equals(op)) {
							objBean = dao.find(id);
						}
					} else if(UPDATE.equals(op)){
						if(dao.update(objBean)) {
							chResponse.setResult(OP_SUCCESS);
							chResponse.setMsg("数据添加成功");
						} else {
							chResponse.setResult(OP_FAIL);
							chResponse.setMsg("数据添加失败");
						}
						return json();
					} 
				}//end dao
			}
		}
		if(StringUtil.isEmpty(id)) {
			id = "0";
		}
		return SUCCESS;
	}

	public String getPagePath() {
		return pagePath;
	}

	public void setPagePath(String pagePath) {
		this.pagePath = pagePath;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getJspPage() {
		return jspPage;
	}

	public void setJspPage(String jspPage) {
		this.jspPage = jspPage;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getBusiName() {
		return busiName;
	}

	public void setBusiName(String busiName) {
		this.busiName = busiName;
	}

	public BaseBean getObjBean() {
		return objBean;
	}

	public void setObjBean(BaseBean objBean) {
		this.objBean = objBean;
	}

	public Integer getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}
	
}

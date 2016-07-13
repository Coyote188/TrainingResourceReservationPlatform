package cn.com.chinaccs.action;

import java.util.HashMap;
import java.util.Map;

import cn.com.chinaccs.bean.BaseBean;
import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.dao.impl.BaseDaoImpl;
import cn.com.chinaccs.helper.DynamicLoadDao;
import cn.com.chinaccs.service.OPService;
import cn.com.chinaccs.utils.StringUtil;

public class OperateAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6830351477037595407L;
	
	public static final String ADD = "add";
	public static final String EDIT = "edit";
	public static final String UPDATE = "update";
	public static final String DEL = "del";
	
	private String paramName;
	private String paramValue;
	
	private String resId;
	
	private String op;
	private String busiName;
	private BaseBean objBean;
	private Integer seqNum;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String execute() throws Exception {
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
		/*if("json".equals(returnType)) {
			return json();
		}*/
		return SUCCESS;
	}

	
	/**
	 * 
	 */
	public String query() throws Exception {
		if(!StringUtil.isEmpty(resId)) {
			OPService opServ = new OPService();
			if(!StringUtil.isEmpty(paramName) && !StringUtil.isEmpty(paramValue)) {
				String[] paramNames = paramName.split(",");
				String[] paramValues = paramValue.split(",");
				if(paramNames.length == paramValues.length) {
					Map<String, Object> params = new HashMap<String, Object>();
					for (int i = 0; i < paramNames.length; i++) {
						params.put(paramNames[i], paramValues[i]);
					}
					chResponse = opServ.getDatas(resId, params);
					params = null;
				}
				paramNames = null;
				paramValues = null;
			} else {
				chResponse = opServ.getDatas(resId, null);
			}
			opServ = null;
		}
		return json();
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
    public String exe() throws Exception {
	   if(!StringUtil.isEmpty(resId)) {
			OPService opServ = new OPService();
			if(!StringUtil.isEmpty(paramName) && !StringUtil.isEmpty(paramValue)) {
				String[] paramNames = paramName.split(",");
				String[] paramValues = paramValue.split(",");
				if(paramNames.length == paramValues.length) {
					Map<String, Object> params = new HashMap<String, Object>();
					for (int i = 0; i < paramNames.length; i++) {
						params.put(paramNames[i], paramValues[i]);
					}
					chResponse = opServ.execute(resId, params);
					params = null;
				}
				paramNames = null;
				paramValues = null;
			} else {
				chResponse = opServ.execute(resId, null);
			}
			opServ = null;
		}
		return json();
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


	public String getParamName() {
		return paramName;
	}


	public void setParamName(String paramName) {
		this.paramName = paramName;
	}


	public String getParamValue() {
		return paramValue;
	}


	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}


	public String getResId() {
		return resId;
	}


	public void setResId(String resId) {
		this.resId = resId;
	}

}

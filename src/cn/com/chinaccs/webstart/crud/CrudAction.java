package cn.com.chinaccs.webstart.crud;

import java.util.List;
import java.util.Map;

import cn.com.chinaccs.webstart.WebStartAction;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

import com.opensymphony.xwork2.Action;

public class CrudAction extends WebStartAction implements ICrud {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4220162249342107193L;
	final String RESULT_GRID_QUERY = "jqGridQuery";
	final String RESULT_EDITVIEW = "editView";
	final String OPER_ADD = "add";
	final String OPER_EDIT = "edit";
	final String OPER_DEL = "del";
	private String oper; // 操作业务：add,edit,del
	private Integer page; // 要查询第几页的数据
	private Integer rows; // 每页显示的记录条数
	private String sidx; // 查询排序条件 依据的字段
	private String sord; // 排序方式
	private Object objBean;
	private Object objBusi;
	private String querySQL;
	private String deleteSQL;
	private String dataType;
	private Map<String, Object> params;
	private List<Map<String, Object>> deleteIds;
	private String output;
	private String editId;
	private String editUrl;
	private String excelName;// 表导出excel名称
	private String excelTitles;// 表导出excel字段名称

	@Override
	public String execute() throws Exception {
		ICrudBusi busi = null;
		if (objBusi != null && objBusi instanceof ICrudBusi) {
			busi = (ICrudBusi) objBusi;
		} else {
			busi = new CrudBusi();
		}
		if (oper != null) {
			if (oper.equals(OPER_ADD)) {
				output = busi.save(objBean, params);
			}
			if (oper.equals(OPER_EDIT)) {
				output = busi.upd(objBean, params);
			}
			if (oper.equals(OPER_DEL)) {
				output = busi.del(deleteSQL, deleteIds, params);
			}
		}
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String editView() {
		log.info("更新ID--[" + editId + "]");
		try {
			if (dataType == null || dataType.equals("")
					|| dataType.equals("null")) {
				if (WebStartBusi.isNumeric(editId)) {
					Integer id = Integer.parseInt(editId);
					IDBDao<Object, Integer> busi = BaseDao.getInstance();
					objBean = busi.query(objBean, id);
				} else {
					IDBDao<Object, String> busi = BaseDao.getInstance();
					objBean = busi.query(objBean, editId);
				}
			} else {// 指定id的数据类型
				int type = Integer.parseInt(dataType);
				switch (type) {
				case 0:
					IDBDao<Object, String> busi = BaseDao.getInstance();
					objBean = busi.query(objBean, editId);
					break;
				case 1:
					IDBDao<Object, Integer> busi1 = BaseDao.getInstance();
					Integer intId = Integer.parseInt(editId);
					objBean = busi1.query(objBean, intId);
					break;
				case 2:
					IDBDao<Object, Long> busi2 = BaseDao.getInstance();
					Long longId = Long.parseLong(editId);
					objBean = busi2.query(objBean, longId);
					break;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return RESULT_EDITVIEW;
	}

	public String query() {
		ICrudBusi busi = null;
		if (objBusi != null && objBusi instanceof ICrudBusi) {
			busi = (ICrudBusi) objBusi;
		} else {
			busi = new CrudBusi();
		}
		busi.query(getResponse(), querySQL, params, sidx, sord);
		return this.RESULT_GRID_QUERY;
	}

	public String queryPage() {
		ICrudBusi busi = null;
		if (objBusi != null && objBusi instanceof ICrudBusi) {
			busi = (ICrudBusi) objBusi;
		} else {
			busi = new CrudBusi();
		}
		busi.queryPage(getResponse(), querySQL, params, page, rows, sidx, sord);
		return this.RESULT_GRID_QUERY;
	}

	public String queryTree() {
		ICrudBusi busi = null;
		if (objBusi != null && objBusi instanceof ICrudBusi) {
			busi = (ICrudBusi) objBusi;
		} else {
			busi = new CrudBusi();
		}
		busi.queryTree(getResponse(), querySQL, params);
		return this.RESULT_GRID_QUERY;
	}

	public void exportExcel() {
		ICrudBusi busi = null;
		if (objBusi != null && objBusi instanceof ICrudBusi) {
			busi = (ICrudBusi) objBusi;
		} else {
			busi = new CrudBusi();
		}
		String[] titles = null;
		if (excelTitles != null) {
			titles = excelTitles.split(",");
		}
		busi.exportExcel(excelName, titles, getResponse(), querySQL, params);
	}

	@Override
	public void setObjBean(Object objBean) {
		// TODO Auto-generated method stub
		this.objBean = objBean;
	}

	@Override
	public void setObjBusi(Object objBusi) {
		// TODO Auto-generated method stub
		this.objBusi = objBusi;
	}

	@Override
	public void setQuerySQL(String querySQL) {
		// TODO Auto-generated method stub
		this.querySQL = querySQL;
	}

	@Override
	public void setDeleteSQL(String deleteSQL) {
		// TODO Auto-generated method stub
		this.deleteSQL = deleteSQL;
	}

	@Override
	public void setParams(Map<String, Object> params) {
		// TODO Auto-generated method stub
		this.params = params;
	}

	@Override
	public void setDeleteIds(List<Map<String, Object>> deleteIds) {
		// TODO Auto-generated method stub
		this.deleteIds = deleteIds;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public Object getObjBean() {
		return objBean;
	}

	public Object getObjBusi() {
		return objBusi;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public String getEditUrl() {
		return editUrl;
	}

	public void setEditUrl(String editUrl) {
		this.editUrl = editUrl;
	}

	public String getEditId() {
		return editId;
	}

	public void setEditId(String editId) {
		this.editId = editId;
	}

	public String getExcelName() {
		return excelName;
	}

	public void setExcelName(String excelName) {
		this.excelName = excelName;
	}

	public String getExcelTitles() {
		return excelTitles;
	}

	public void setExcelTitles(String excelTitles) {
		this.excelTitles = excelTitles;
	}

}

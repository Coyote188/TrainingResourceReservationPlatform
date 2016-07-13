package cn.com.chinaccs.webstart.crud;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fddi 存放curd信息实体类
 * 
 */
public class CrudInfo {
	private String url = "";
	private String busi = "";
	private List<CrudParams> paramNameList = new ArrayList<CrudParams>();
	private String deleteIds = "";
	private String querySQL = "";
	private String deleteSQL = "";

	public CrudInfo() {

	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBusi() {
		return busi;
	}

	public void setBusi(String busi) {
		this.busi = busi;
	}

	public List<CrudParams> getParamNameList() {
		return paramNameList;
	}

	public void setParamNameList(List<CrudParams> paramNameList) {
		this.paramNameList = paramNameList;
	}

	public String getDeleteIds() {
		return deleteIds;
	}

	public void setDeleteIds(String deleteIds) {
		this.deleteIds = deleteIds;
	}

	public String getQuerySQL() {
		return querySQL;
	}

	public void setQuerySQL(String querySQL) {
		this.querySQL = querySQL;
	}

	public String getDeleteSQL() {
		return deleteSQL;
	}

	public void setDeleteSQL(String deleteSQL) {
		this.deleteSQL = deleteSQL;
	}

}

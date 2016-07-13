package cn.com.chinaccs.bean;

import cn.com.chinaccs.IConstant;


public class CHResponse {
	
	private String result = IConstant.OP_FAIL;
	
	private String msg = IConstant.OP_FAIL_MSG;
	
	private Object data;
	
	private int totalPage;
	
	private long totalNum;
	
	private int size;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}

	

}

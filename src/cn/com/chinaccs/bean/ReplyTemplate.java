package cn.com.chinaccs.bean;

import java.util.List;

import net.sf.json.JSONObject;

public class ReplyTemplate {
	public static final String RESULT_ERROR = "-100";
	public static final String RESULT_SUCCESS = "100";
	public static final String RESULT_EXCEPTION = "102";
	public static final String RESULT_EMPTY = "101";
	public static final String RESULT_FAIL = "105";
	public static final String RESULT_UNACCEPT = "-200";
	public static final String RESULT_TIMEOUT = "-500";
	
	public static final String MSG_ERROR = "系统错误请与管理员联系！";
	public static final String MSG_SUCCESS = "操作成功";
	public static final String MSG_EXCEPTION = "系统异常请与管理员联系！";
	public static final String MSG_EMPTY = "没有查询到数据！";
	public static final String MSG_FAIL = "操作失败，请与管理员联系！";
	public static final String MSG_UNACCEPT = "非法输入，输入内容包含非法字符，系统无法为您处理！";
	public static final String MSG_TIMEOUT = "登录超时，请重新登录！";
	
	
	private String result;
	private String msg;
	private Object obj;
	private List<?> objs;
	private String start;
	private String total;
	
	
	public ReplyTemplate(String result, String msg) {
		this.result = result;
		this.msg = msg;
	}
	
	public ReplyTemplate(String result, Object obj) {
		this.result = result;
		this.setObj(obj);
	}
	
	public ReplyTemplate(String result, List<?> objs) {
		this.result = result;
		this.setObjs(objs);
	}
	public ReplyTemplate(String result, List<?> objs,String start,String total) {
		this.result = result;
		this.setObjs(objs);
		this.setStart(start);
		this.setTotal(total);
	}
	
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
	
	
	@Override
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
	protected static String getDefultResult(Object obj){
		return new ReplyTemplate(ReplyTemplate.RESULT_SUCCESS,obj).toString();
	}
	protected static String getDefultArrayResult(List<?> objs){
		return new ReplyTemplate(ReplyTemplate.RESULT_SUCCESS,objs).toString();
	}
	protected static String getDefultArrayResult(List<?> objs,String start,String total){
		return new ReplyTemplate(ReplyTemplate.RESULT_SUCCESS,objs,start,total).toString();
	}
	public static String getDefultErrorResult(){
		return new ReplyTemplate(ReplyTemplate.RESULT_ERROR,ReplyTemplate.MSG_ERROR).toString();
	}
	/**
	 * 超时
	 * @return
	 */
	public static String getDefultTimeoutResult(){
		return new ReplyTemplate(ReplyTemplate.RESULT_TIMEOUT,ReplyTemplate.MSG_TIMEOUT).toString();
	}
	
	public static String getDefultUnaccpetResult(){
		return new ReplyTemplate(ReplyTemplate.RESULT_UNACCEPT,ReplyTemplate.MSG_UNACCEPT).toString();
	}
	public static String getResult(String result, String msg){
		return new ReplyTemplate(result,msg).toString();
	}
	public static String toJson(Object o){
		if(null != o){
			return getDefultResult(o);
		}
		return getResult(ReplyTemplate.RESULT_EMPTY, ReplyTemplate.MSG_EMPTY);
	}
	public static String toJsonArray(List<?> o){
		if(null != o){
			return getDefultArrayResult(o);
		}
		return getResult(ReplyTemplate.RESULT_EMPTY, ReplyTemplate.MSG_EMPTY);
	}
	public static String toJsonArray(List<?> o,String start,String total){
		if(null != o){
			return getDefultArrayResult(o,start,total);
		}
		return getResult(ReplyTemplate.RESULT_EMPTY, ReplyTemplate.MSG_EMPTY);
	}
	
	

	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}

	/**
	 * @param obj the obj to set
	 */
	public void setObj(Object obj) {
		this.obj = obj;
	}

	/**
	 * @return the objs
	 */
	public List<?> getObjs() {
		return objs;
	}

	/**
	 * @param objs the objs to set
	 */
	public void setObjs(List<?> objs) {
		this.objs = objs;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
}
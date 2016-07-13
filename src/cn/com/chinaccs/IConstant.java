package cn.com.chinaccs;

public interface IConstant {

	
	/////////////操作结果常量定义///////////////////
	public final static String OP_SUCCESS = "1";
	public final static String OP_SUCCESS_MSG = "数据操作成功";
	
	public final static String OP_NOT_DATA_SUCCESS = "0";
	public final static String OP_NOT_DATA_SUCCESS_MSG = "没有查询到相关数据";
	
	public final static String OP_SW = "2";
	public final static String OP_SW_MSG = "有敏感词汇";
	
	public final static String OP_FAIL = "-1";
	public final static String OP_FAIL_MSG = "数据操作失败";
	
	//图标高宽
	public final static int ICON_MAX_WIDTH = 300;
	public final static int ICON_MAX_HEIGHT = 300;
	
}

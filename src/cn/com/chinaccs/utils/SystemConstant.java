package cn.com.chinaccs.utils;

public class SystemConstant {
	/**
	 * 消息类型--新闻
	 */
	public static final String INFO_TYPE_NEWS = "NEWS";
	/**
	 * 消息类型--首页轮播图
	 */
	public static final String INFO_TYPE_SLIDER = "SLIDER";
	/**
	 * 消息类型--公告
	 */
	public static final String INFO_TYPE_NOTICE = "NOTICE";
	/**
	 * 消息类型--协议
	 */
	public static final String INFO_TYPE_AGREEMENT = "AGREEMENT";
	
	/**
	 * 资源锁----预锁定
	 */
	public static final String RESOURCE_LOCK_STATUS_PRE = "001";
	/**
	 * 资源锁----锁定
	 */
	public static final String RESOURCE_LOCK_STATUS_LOCKED = "000";
	/**
	 * 资源锁----解锁
	 */
	public static final String RESOURCE_LOCK_STATUS_UNLOCK = "002";
	
	/**
	 * 订单已创建
	 */
	public static final String ORDER_STATUS_START = "001";
	/**
	 * 订单取消
	 */
	public static final String ORDER_STATUS_CANCELED = "002";
	/**
	 * 其他情况
	 */
	public static final String ORDER_STATUS_OTHER = "003";
	/**
	 * 订单已经保存
	 */
	public static final String ORDER_STATUS_SAVED = "004";
	/**
	 * 订单已缴费
	 */
	public static final String ORDER_STATUS_PAYED = "005";
	
	/**
	 * 用户状态--有效
	 */
	public static final int USER_STATUS_VAL = 1;
	/**
	 * 用户状态--无效
	 */
	public static final int USER_STATUS_INV = 0;
	
	/**
	 * 用户类型--公众用户
	 */
	public static final String USER_TYPE_PORTAL = "1";
	/**
	 * 用户类型--系统用户
	 */
	public static final String USER_TYPE_SYSTEM = "0";
	
	/**
	 * 资源类型--车
	 */
	public static final String RES_TYPE_VEHICLE = "VEHICLE";
	/**
	 * 资源类型--教练/人员
	 */
	public static final String RES_TYPE_COACH = "COACH";
	/**
	 * 资源类型--场地
	 */
	public static final String RES_TYPE_FIELD = "FIELD";
	
	/**
	 * 上午
	 */
	public static final String TIME_AM = "AM";
	/**
	 * 下午
	 */
	public static final String TIME_PM = "PM";
	/**
	 * 时间列表查询---查询月视图可状态
	 */
	public static final String QUERY_TIME_LIST_MONTH = "1";
	/**
	 * 时间列表查询--查询天可用小时
	 */
	public static final String QUERY_TIME_LIST_DAY = "2";
	
	/**
	 * 资源锁-预锁定
	 */
	public static final String RS_LOCK_STATUS_PRE = "001";
	/**
	 * 资源锁-锁定
	 */
	public static final String RS_LOCK_STATUS_LOCK = "002";
	/**
	 * 资源锁-解锁定
	 */
	public static final String RS_LOCK_STATUS_UNLOCK = "003";
	
	/**
	 * 上午开始时间
	 */
	public static final String AM_START = "07";
	/**
	 * 上午结束时间
	 */
	public static final String AM_END = "11";
	/**
	 * 下午开始时间
	 */
	public static final String PM_START = "14";
	/**
	 * 下午结束时间
	 */
	public static final String PM_END = "18";
	
	public static final String PLAT_FORM = "LJGF";
	
}

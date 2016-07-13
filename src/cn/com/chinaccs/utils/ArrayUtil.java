package cn.com.chinaccs.utils;

public class ArrayUtil {

	
	/**
	 * 数组转化为字符串
	 * @param obj 数组
	 * @param separator 分隔符
	 * @return
	 */
	public static String arrayToString(Object[] objs,String separator) {
		StringBuffer strBuff = null;
		if(null != objs && objs.length>0) {
			if(StringUtil.isEmpty(separator)) {
				separator = "";
			}
			strBuff = new StringBuffer();
			for (int i=0;i<objs.length;i++) {
				if(i < objs.length-1 ) {
					strBuff.append(String.valueOf(objs[i])+separator);
				} else {
					strBuff.append(String.valueOf(objs[i]));
				}
				
			}
		}
		objs = null;
		return (null != strBuff)?strBuff.toString():null;
	}
	
	
	/**
	 * 字符串转化为数组
	 * @param obj 原字符串
	 * @param separator 分隔符
	 * @return
	 */
	public static String[] stringToArray(String value,String separator) {
		String[] array = null;
		if(!StringUtil.isEmpty(value) && !StringUtil.isEmpty(separator)) {
			array = value.split(separator);
		}
		value = null;
		return array;
	}
	
	
	/**
	 * 按separater分离成数组,判断该数组里面是否包含subStr
	 * @param str
	 * @param regex
	 * @param separater
	 * @return
	 */
	public static boolean isArrayContains(String str,String subStr,String separater) {
		if(null == subStr) {
			return true;
		}
		boolean flag  = false;
		String[] strArray = str.split(separater);
		for (int i = 0; i < strArray.length; i++) {
			if(subStr.equals(strArray[i].trim())) {
				flag = true;
				break;
			}
		}
		return flag;
	}
	
	/**
	 * 按separater分离成数组,判断该数组里面是否包含subStr(不区分大小写)
	 * @param str
	 * @param regex
	 * @param separater
	 * @return
	 */
	public static boolean isArrayContainsIgnoreCase(String str,String subStr,String separater) {
		if(null == subStr) {
			return true;
		}
		boolean flag  = false;
		String[] strArray = str.split(separater);
		for (int i = 0; i < strArray.length; i++) {
			if(subStr.equalsIgnoreCase(strArray[i])) {
				flag = true;
				break;
			}
		}
		return flag;
	}
	
}

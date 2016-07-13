package cn.com.chinaccs.utils;

import net.sf.json.JSONObject;

public class Utils {
	public static String parseJson(Object obj){
		JSONObject jsObj = JSONObject.fromObject(obj);
		return jsObj.toString();
	}
}

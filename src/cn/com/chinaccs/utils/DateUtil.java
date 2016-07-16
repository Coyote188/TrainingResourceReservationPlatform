package cn.com.chinaccs.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	/**
	 * 时间转为日期格式
	 * @param date
	 * @param formatter
	 * @return
	 */
	public static String dateToStr(Date date,String formatter) {
		String value = null;
		if(null != date) {
			if(StringUtil.isEmpty(formatter)) {
				formatter = "yyyy-MM-dd HH:mm:ss";
			}
			SimpleDateFormat dateFormat = new SimpleDateFormat(formatter);
			value = dateFormat.format(date);
			dateFormat = null;
		}
		return value;
	}
	
}

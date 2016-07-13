package cn.com.chinaccs.action.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class DateConverter extends StrutsTypeConverter {

	private static String DATE_TIME_FOMART = "yyyy-MM-dd";

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		Date date = null;
		String dateString = null;
		if (values != null && values.length > 0) {
			dateString = values[0];
			if (dateString != null) {
				// 匹配IE浏览器
				SimpleDateFormat format = new SimpleDateFormat(DATE_TIME_FOMART);
				try {
					date = format.parse(dateString);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// 匹配Firefox浏览器
				if (date == null) {
					format = new SimpleDateFormat(DATE_TIME_FOMART);
					try {
						date = format.parse(dateString);
					} catch (ParseException e) {
						date = null;
					}
				}
			}
		}
		return date;
	}

	@Override
	public String convertToString(Map context, Object o) {
		Date date = (Date) o;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateTimeString = sdf.format(date);
		return dateTimeString;
	}

}

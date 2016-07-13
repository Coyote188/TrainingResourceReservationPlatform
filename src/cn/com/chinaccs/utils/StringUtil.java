package cn.com.chinaccs.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

	/**
	 * 判断是否为空
	 * @param value
	 * @return
	 */
	public static boolean isEmpty(String value) {
		return (null==value || "".equals(value.trim())) ? true : false;
	}
	
	/**
	 * null转换为“”
	 * @param obj
	 * @return
	 */
	public static String handNull(Object obj) {
		if (null == obj) {
			return "";
		} else {
			return obj.toString().trim();
		}
	}
	
	/**
	 * 数字null转换为“0”
	 * @param obj
	 * @return
	 */
	public static String handNumNull(Object obj) {
		if (null == obj) {
			return "0";
		} else {
			return obj.toString().trim();
		}
	}
	
	/**
	 * 判断是否为数字(包括小数)
	 * @param value
	 * @return
	 */
	public static boolean isNum(String value) {
		boolean is = false;
		Pattern pattern = Pattern.compile("\\d+|\\d+\\.\\d+");
		//Pattern pattern = Pattern.compile("\\d+");
		Matcher matcher = pattern.matcher(value);
		if(matcher.matches()) {
			is = true;
		} else {
			is = false;
		}
		return is;
	}
	
	
	/**
	 * 判断是否数字(包括小数)
	 * @param value
	 * @return
	 */
	public static boolean isInteger(String value) {
		boolean is = false;
		Pattern pattern = Pattern.compile("\\d+");
		Matcher matcher = pattern.matcher(value);
		if(matcher.matches()) {
			is = true;
		} else {
			is = false;
		}
		return is;
	} 
	
	/**
	 * 判断是否小数
	 * @param value
	 * @return
	 */
	public static boolean isDecimal(String value) {
		boolean is = false;
		Pattern pattern = Pattern.compile("\\d+\\.\\d+");
		Matcher matcher = pattern.matcher(value);
		if(matcher.matches()) {
			is = true;
		} else {
			is = false;
		}
		return is;
	} 
	
	
	/**
	 * 随机生成数
	 * @param num 要生成随机数的个数
	 * @return
	 */
	public static String randomNum(int num) {
		Random random = new Random();
		String numStr = "";
		for (int i = 0; i < num; i++) {
			numStr += random.nextInt(10);
		}
		return numStr;
	}
	
	
	/**
	 * 按日期格式生成序列号
	 * @param dateStr 日期格式
	 * @return
	 */
	public static String createSerialNum(String dateStr) {
		String serialNum = null;
		if(!isEmpty(dateStr)) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(dateStr);
			serialNum = dateFormatter.format(new Date());
			dateFormatter = null;
		}
		return serialNum;
	}
	
	
	/**
	 * 生成序列号
	 * @return
	 */
	public static String createSerialNum() {
		long time = System.currentTimeMillis();
		return time+randomNum(5);
	}
	
	/**
	 * 获取文件后缀
	 * @param fileName
	 * @return
	 */
	public static String getFileSuffix(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".")+1);
	}
	
	
	/**
	 * 去掉文件后缀
	 * @param fileName
	 * @return
	 */
	public static String trimFileSuffix(String fileName) {
		return fileName.substring(0,fileName.lastIndexOf("."));
	}
	
	/**
	 * 大写字母直接用下划线分割，并把大写转换为小写
	 * 如:HelloWorld转换为hello_world
	 * @return
	 */
	public static String upperSeparateUnderline(String value) {
		StringBuffer strBuff = null;
		if(!isEmpty(value)) {
			strBuff = new StringBuffer();
			byte[] values = value.getBytes();
			for (int i = 0; i < values.length; i++) {
				if(values[i]>=65 && values[i]<=90) {
					if(i>0 && i<(values.length-1)) {
						strBuff.append("_"+(char)((int)values[i]+32));
					} else {
						strBuff.append(String.valueOf((char)((int)values[i]+32)));
					}
				} else {
					strBuff.append(String.valueOf((char)values[i]));
				}
			}
			values = null;
		}
		return strBuff != null?strBuff.toString():null;
	}
	
	/**
	 * 首字母转为大写
	 * @param value
	 * @return
	 */
	public static String firstToUppercase(String value) {
		if(!StringUtil.isEmpty(value)) {
			String firstChar = value.substring(0, 1);
			String otherChar = value.substring(1);
			firstChar = firstChar.toUpperCase();
			value = firstChar+otherChar;
		}
		return value;
	}
	
	
	/**
	 * 过滤HTML标签.
	 * @param value
	 * @return
	 */
	public static String html2Text(String htmlContent) {
		Pattern pScript, pStyle, pHtml; //定义规则
	    Matcher mScript, mStyle, mHtml; //匹配规则
	    
	    //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
        String regExScript = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; 
        //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
        String regExStyle = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
         //定义HTML标签的正则表达式
        String regExHtml = "<[^>]+>";
        
        //过滤script标签
        pScript = Pattern.compile(regExScript, Pattern.CASE_INSENSITIVE);
        mScript = pScript.matcher(htmlContent);
        htmlContent = mScript.replaceAll(""); 

        //过滤style标签
        pStyle = Pattern.compile(regExStyle, Pattern.CASE_INSENSITIVE);
        mStyle = pStyle.matcher(htmlContent);
        htmlContent = mStyle.replaceAll(""); 

        //过滤html标签
        pHtml = Pattern.compile(regExHtml, Pattern.CASE_INSENSITIVE);
        mHtml = pHtml.matcher(htmlContent);
        htmlContent = mHtml.replaceAll("");
	    
		return htmlContent;
	}
	
	
	/**
	 * 验证手机号码
	 * @param phoneNo
	 * @return
	 */
	public static boolean isPhoneNO(String phoneNo){
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		Matcher m = p.matcher(phoneNo);
		return m.matches();
	}
	
	
	/**
	 * 验证固定电话号码
	 * @param tel
	 * @return
	 */
	public static boolean isFixedTelephone(String tel) {
		Pattern p = Pattern.compile("^[0][0-9]{2,3}-[2-9][0-9]{6,7}(-[0-9]{1,4})?");
		Matcher m = p.matcher(tel);
		return m.matches();
	}
	
	
	/**
	 * 验证匿名
	 * @param anonymous
	 * @return
	 */
	public static boolean isAnonymous(String anonymous){
		Pattern p = Pattern.compile("^[\\u4e00-\\u9fa5|A-Za-z]([\\w|\\u4e00-\\u9fa5]){1,7}$");
		Matcher m = p.matcher(anonymous);
		return m.matches();
	}
	
	/**
	 * 验证汉字
	 * @param value
	 * @return
	 */
	public static boolean isChinese(String value){
		Pattern p = Pattern.compile("^[\\u4E00-\\u9FFF]+$");
		Matcher m = p.matcher(value);
		boolean is = m.matches();
		return is;
	}
	
	/**
	 * 验证QQ号码
	 * @param value
	 * @return
	 */
	public static boolean isQQ(String value) {
		Pattern p = Pattern.compile("^[1-9]\\d{6,11}$");
		Matcher m = p.matcher(value);
		return m.matches();
	}
	
	
	/**
	 * 验证email
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email) {
		Pattern p = Pattern.compile("^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$");
		Matcher m = p.matcher(email);
		return m.matches();
	}
	
	/**
	 * 秒转换为:HH:mm:SS格式
	 * @param second
	 * @return
	 */
	public static String secondToHHMMSS(long second){
		long h=0,m=0,s=0,tmp=0;
		if(second>=3600){
		   h= second/3600;
		   tmp = second%36000;
		   if(tmp>=60) {
			   m = tmp/60;
			   s = tmp%60;
		   }else {
		     s = tmp;
		   }
		}else if(second>=60){
		   m = second/60;
		   s = second%60;
		}else {
		   s = second;
		}
		return (h>9?h:"0"+h)+":"+(m>9?m:"0"+m)+":"+(s>9?s:"0"+s);
	 }
	
	
	
	/**
	 * 过滤特殊字符
	 * @param str
	 * @return
	 */
	public static String filterSQLParams(String params) {
		if(!isEmpty(params)) {
		    StringBuffer strBuff = new StringBuffer();
		    strBuff.append("'|\"|update|delete|select|drop|insert|=|;|0x|\\(|\\)|\\s|\\*|\\?|\\%|\\$");
		    strBuff.append("|and|exec|execute|chr|mid|master|truncate|char|declare|sitename|net user|xp_cmdshell|or");
		    strBuff.append("|\\+|,|like'|table|from|grant|use|group_concat|column_name|information_schema.columns");
		    strBuff.append("|table_schema|union|where|order|by|count");
		    strBuff.append("|--|,|like|//|/|#");
		    String params1 = params.toLowerCase();

		    params1 = params1.replaceAll(strBuff.toString(), "");
		    if("".equals(params1)&&!"''".equals(params)){
		    	params = params1;
		    }
			params = params.replaceAll("&", "&amp");
			params = params.replaceAll("<", "&lt");
			params = params.replaceAll(">", "&gt");	
		}
		return params;
	}
	
	public String splitIds(String ids,String regex){
		String newIds = "";
		if(null != ids && !StringUtil.isEmpty(ids.toString())) {
			String[] idsArr = ids.split(regex);
			for (int i = 0; i < idsArr.length; i++) {
				if(i != (idsArr.length-1)) {
					newIds += "'"+idsArr[i]+"',";
				} else {
					newIds += "'"+idsArr[i]+"'";
				}
			}
		}
		return newIds;
	}

	
}

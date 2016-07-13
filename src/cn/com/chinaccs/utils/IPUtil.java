package cn.com.chinaccs.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import cn.com.chinaccs.bean.IPPosition;
import cn.com.chinaccs.cache.IPCache;

public class IPUtil {

	protected static final Logger log = Logger.getLogger(IPUtil.class);
	
	public static String getAreaCity(String ip) {
		String key = "city_"+ip;
		String province = IPCache.getInstance().get(key);
		if(StringUtil.isEmpty(province)) {
			if(!StringUtil.isEmpty(ip) && checkIp(ip)) {
				String urlStr = "http://www.ip138.com/ips138.asp?ip="+ip+"&action=2";
				HttpURLConnection urlConnection = null;
				try {
					URL url = new URL(urlStr);
					urlConnection = (HttpURLConnection)url.openConnection();
					urlConnection.setConnectTimeout(5000);
					urlConnection.setReadTimeout(8000);
					//setHeader(urlConnection);
					urlConnection.setRequestMethod("GET");
					urlConnection.setDoOutput(true);
					urlConnection.setDoInput(true);
					urlConnection.setUseCaches(false);
					
					InputStream in = urlConnection.getInputStream();
					BufferedReader reader = new BufferedReader(new InputStreamReader(in,"GBK"));
					Vector<String> collection = new Vector<String>();
					String line = reader.readLine();
					while(line != null) {
						collection.add(line);
						line = reader.readLine();
					}
					reader.close();
					if(urlConnection != null) {
						  urlConnection.disconnect();
				    }
					String regex = "<td align=\"center\"><ul class=\"ul1\">";
					String splitStr = "省";
					for (String str : collection) {
						
						if(str.trim().startsWith(regex)) {
							str = str.replaceAll(regex, "");
							str = str.replaceAll("<li>|</li>|</ul>|</td>|本站主数据：|参考数据一：(.*)", "").trim();
							if(!str.contains(splitStr)) {
								splitStr = "市";
							}
							log.info("用户的IP地址为["+ip+"]所属地区为["+str+"]");
							String[] values = str.split(splitStr);
							if(!StringUtil.isEmpty(values[0])) {
								province = values[0];
							}
							//System.out.println(str.trim());
						}
					}
					collection = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(!StringUtil.isEmpty(province)) {
					IPPosition pos = new IPPosition();
					pos.setPostion(province);
					pos.setCreatTime(System.currentTimeMillis());
					IPCache.getInstance().add(key, pos);
				}
			}
	     }
		return province;
	}
	
	
	public static String getAddress(String ip) {
		String key = "address_"+ip;
		String address = IPCache.getInstance().get(key);
		if(StringUtil.isEmpty(address)) {
			if(!StringUtil.isEmpty(ip) && checkIp(ip)) {
				String urlStr = "http://www.ip138.com/ips138.asp?ip="+ip+"&action=2";
				HttpURLConnection urlConnection = null;
				try {
					URL url = new URL(urlStr);
					urlConnection = (HttpURLConnection)url.openConnection();
					urlConnection.setConnectTimeout(5000);
					urlConnection.setReadTimeout(8000);
					//setHeader(urlConnection);
					urlConnection.setRequestMethod("GET");
					urlConnection.setDoOutput(true);
					urlConnection.setDoInput(true);
					urlConnection.setUseCaches(false);
					
					InputStream in = urlConnection.getInputStream();
					BufferedReader reader = new BufferedReader(new InputStreamReader(in,"GBK"));
					Vector<String> collection = new Vector<String>();
					String line = reader.readLine();
					while(line != null) {
						collection.add(line);
						line = reader.readLine();
					}
					reader.close();
					if(urlConnection != null) {
						  urlConnection.disconnect();
				    }
					String regex = "<td align=\"center\"><ul class=\"ul1\">";
					for (String str : collection) {
						
						if(str.trim().startsWith(regex)) {
							str = str.replaceAll(regex, "");
							str = str.replaceAll("<li>|</li>|</ul>|</td>|本站主数据：|参考数据一：(.*)", "").trim();
							address = str;
						}
					}
					collection = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(!StringUtil.isEmpty(address)) {
					IPPosition pos = new IPPosition();
					pos.setPostion(address);
					pos.setCreatTime(System.currentTimeMillis());
					IPCache.getInstance().add(key, pos);
				}
			}
		}
		return address;
	}
	
	
	public static boolean checkIp(String ip) {
		boolean is = false;
		String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(ip);
		if(matcher.matches()) {
			is = true;
		}
		return is;
	}
	
}

package cn.com.chinaccs.conf;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import cn.com.chinaccs.utils.StringUtil;

public class InitConfig {

	private static final Logger log = Logger.getLogger(InitConfig.class);
	
	private static InitConfig instance;
	
	private Properties prop = null;
	
	private static final String configFileName = "/config.properties";
	
	private InitConfig() {
		init();
	}
	
	public synchronized static InitConfig getInstance() {
		if(null == instance) {
			instance = new InitConfig();
		}
		return instance;
	}
	
	
	private void init() {
		log.info("初始化配置文件-------");
		InputStream in = null;
		try {
		  in = getClass().getResourceAsStream(configFileName);
		  if(null != in) {
			  prop = new Properties();
			  prop.load(in);
		  }
		  log.info("初始化配置文件[结束]-------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	/**
	 * 
	 * @param key
	 * @return
	 */
	public String getValue(String key) {
		String value = null;
		if(null != prop){
			value = StringUtil.handNull(prop.get(key));
			value = handleSysVar(value);
			value = handleVar(value);
		}
		return value;
	}
	
	/**
	 * 变量处理
	 * @param value
	 * @return
	 */
	protected String handleVar(String value) {
		if(!StringUtil.isEmpty(value)) {
			String regex = "(?<=\\$\\{)[^\\{\\}]+(?=\\})";
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(value);
			while(matcher.find()) {
				String varName = matcher.group();
				if(!StringUtil.isEmpty(varName)) {
					String val = null;
					try {
						val = getValue(varName);
					} catch (Exception e) {
						e.printStackTrace();
						val = null;
					}
					value = value.replace("${"+varName+"}", StringUtil.handNull(val));
				}
			}
			matcher = pattern.matcher(value);
			if(matcher.find()) {
				handleVar(value);
			}
			pattern = null;
			matcher = null;
			return value;
		}
		return value;
	}
	
	/**
	 * 处理值中含有的系统变量
	 * @param value
	 * @return
	 */
	protected String handleSysVar(String value) {
		String regex = "(?<=#\\{)[^\\{\\}]+(?=\\})";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(value);
		while(matcher.find()) {
			String varName = matcher.group();
			if(!StringUtil.isEmpty(varName)) {
				String val = null;
				try {
				   val = System.getProperty(varName);
				} catch (Exception e) {
					e.printStackTrace();
					val = null;
				}
				value = value.replace("#{"+varName+"}", StringUtil.handNull(val));
			}
		}
		matcher = pattern.matcher(value);
		if(matcher.find()) {
			handleSysVar(value);
		}
		pattern = null;
		matcher = null;
		return value;
	}
	
}

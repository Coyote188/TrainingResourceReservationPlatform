package cn.com.chinaccs.init;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

public class InitConfig extends Init {

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
	
	
	public void reInit() {
		init();
	}
	
	protected void init() {
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
		Object value = null;
		if(null != prop){
			value = prop.get(key);
		}
		return ((null != value)?value.toString():null);
	}
	
}

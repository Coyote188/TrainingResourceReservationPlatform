package cn.com.chinaccs.cache;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

import cn.com.chinaccs.bean.IPPosition;

/**
 * IP缓存
 * 用来存放IP和IP对应的地区等信息
 * @author lmq
 *
 */
public class IPCache {
	
	private static Map<String,IPPosition> IP_POS_MAP;
	private static final long EXPIR_TIME = 60*60*1000;
	
	private static IPCache instance;
	
	private IPCache() {
		init();
		exeTaskTime();
	}
	
	private void init() {
		IP_POS_MAP = new ConcurrentHashMap<String, IPPosition>();
	}
	
	public synchronized static IPCache getInstance() {
		if(null == instance) {
			instance = new IPCache();
		}
		return instance;
	} 
	
	public void add(String key,IPPosition value) {
		IP_POS_MAP.put(key, value);
	}
	
	public String get(String key) {
		IPPosition pos = null;
		try {
		    pos = IP_POS_MAP.get(key);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	pos = null;
		}
		return (pos != null)?pos.getPostion():null;
	}
	
	
	private void exeTaskTime() {
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				clear();
			}
		};
		Timer timer = new Timer();
		timer.schedule(task, EXPIR_TIME,EXPIR_TIME);
	}
	
	/**
	 * 
	 */
	private void clear() {
		if(null != IP_POS_MAP && IP_POS_MAP.size()>0) {
			long currentTime = System.currentTimeMillis();
			long intervalTime = 0;
			IPPosition value = null;
			for (Entry<String, IPPosition> entry : IP_POS_MAP.entrySet()) {  
			    String key = entry.getKey();  
			    value = entry.getValue(); 
			    intervalTime = currentTime-value.getCreatTime();
			    if(intervalTime>EXPIR_TIME) {
			    	IP_POS_MAP.remove(key);
			    }
			} 
			value = null;
		}
	}
}

package cn.com.chinaccs.init;

import org.apache.log4j.Logger;

public abstract class Init {
	
	protected static final Logger log = Logger.getLogger(Init.class);

	protected abstract void init();
	
	public abstract void reInit();
	
}

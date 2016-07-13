package cn.com.chinaccs.bean;

import java.io.Serializable;

import org.apache.log4j.Logger;

public interface BaseBean extends Serializable {

	public String getId();
	
	public void setId(String id);
	
	public String getPrefix();
	
}

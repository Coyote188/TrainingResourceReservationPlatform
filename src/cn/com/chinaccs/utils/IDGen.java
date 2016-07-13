package cn.com.chinaccs.utils;

import java.util.UUID;

public class IDGen {

	
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}

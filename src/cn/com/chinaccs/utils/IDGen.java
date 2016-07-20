package cn.com.chinaccs.utils;

import java.text.SimpleDateFormat;
import java.util.UUID;

public class IDGen {
	
	private static int SEQUENCE = 1;
	
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 订单编号生成<br>
	 * 规则  (平台编码4位)(时间yyyyMMddHHmmssSSS)(平台5位序列)
	 * @param pre
	 * @return
	 */
	public static String getSerialNumber(String pre){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		String _seq = String.valueOf(SEQUENCE);
		for(int i =_seq.length(); i<5 ; i++){
			_seq = "0" + _seq;
		}
		
		String serial = pre + time + _seq;
		
		if(SEQUENCE < 9999){
			SEQUENCE ++;
		}else{
			SEQUENCE = 0;
		}
		return serial;
	}
	
	
	public static void main(String[] args){
		for(int i =0; i< 10000; i++){
			System.out.println(IDGen.getSerialNumber("LIJ0"));
		}
		
	}
}

package cn.com.chinaccs.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

import org.apache.log4j.Logger;

public class FileUtil {

	private static final Logger log = Logger.getLogger(FileUtil.class);
	
	/**
	 * 获取文件分隔符
	 * @return
	 */
	public static String getFileSeparator() {
		return System.getProperty("file.separator");
	}
	
	/**
	 * 删除文件
	 * @param filePath
	 * @return
	 */
	public static boolean deleteFile(String filePath) {
		boolean is = false;
		log.info("删除文件...");
		if(!StringUtil.isEmpty(filePath)) {
			File file = new File(filePath);
			if(file.exists()) {
				is = file.delete();
				if(is) {
					log.info("["+filePath+"]文件删除[成功]..");
				} else {
					log.info("["+filePath+"]文件删除[失败]..");
				}
			} else {
				log.error("文件不存在["+filePath+"]");
			}
		} else {
			log.error("文件路径为空");
		}
		return is;
	}
	
	
	/**
	 * 
	 * @param filePath
	 * @return
	 */
	public static String readFile(String filePath) {
		StringBuffer content = null;
		if(!StringUtil.isEmpty(filePath)) {
			File file = new File(filePath);
			if(!file.exists()) {
				log.error("文件不存在["+filePath+"]");
			} else {
				try {
					BufferedReader buffReader = new BufferedReader(new FileReader(file));
					String line = null;
					content = new StringBuffer();
					while((line = buffReader.readLine()) != null) {
						content.append(line);
					}
					buffReader.close();
					buffReader = null;
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		} else {
			log.error("文件路径为空");
		}
		return (null == content)?null:content.toString();
	}
}

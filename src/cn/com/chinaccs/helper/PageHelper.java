package cn.com.chinaccs.helper;

import org.apache.log4j.Logger;

public class PageHelper {

    protected static final Logger log = Logger.getLogger(PageHelper.class);
	
    /**
     * 
     * @param total 总数据数
     * @param pageSize 每页显示数
     * @return
     */
	public int getTotalPage(long total,int pageSize) {
		return (int) Math.ceil((double)total/pageSize);
	}
	
}

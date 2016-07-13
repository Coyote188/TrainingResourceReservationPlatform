package cn.com.chinaccs.memory.menu;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;

public class InitMemory extends HttpServlet implements ServletContextListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = -606155587047985905L;
	//服务器停止时执行该事件
    public void contextDestroyed(ServletContextEvent sce) {
      //  DeleteFile();//删除启动服务器时建立的文件
    }
    //服务器启动时执行该事件
    public void contextInitialized(ServletContextEvent sce) {
    	MenuMemory.getInstance().importDate();
    }
}

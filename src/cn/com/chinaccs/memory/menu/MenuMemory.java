package cn.com.chinaccs.memory.menu;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.bean.entity.TNRoleMenu;
import cn.com.chinaccs.dao.impl.MenuDao;
import cn.com.chinaccs.dao.impl.RoleMenuDao;


public class MenuMemory {
	public static List<TNMenu> menu_memory = new ArrayList<TNMenu>();
	public static List<TNRoleMenu> rm_memory = new ArrayList<TNRoleMenu>();
	
	public static MenuMemory instance;
	
	private MenuMemory(){
		
	}
	public synchronized static MenuMemory getInstance() {
		if(null == instance) {
			instance = new MenuMemory();
		}
		return instance;
	}
	
	
	/**
	 * 菜单变动
	 * */
	public void  initMenu(){
		Lock lock = new ReentrantLock();
		String sql = "select m.* from t_n_menu m where  m.state='1' order by m.level, m.seq_num asc ";
		MenuDao mdao = new MenuDao();
		lock.lock();
		try{
			menu_memory.clear();
			menu_memory = mdao.querySql(sql);
		}finally{
			lock.unlock();
		}
		mdao = null;
	}
	
	/**
	 * 角色权限变动
	 * */
	public void  initRoleMenu(){
		Lock lock = new ReentrantLock();
		RoleMenuDao rmdao = new RoleMenuDao();
		lock.lock();
		try{
			rm_memory.clear();
			rm_memory = rmdao.findAll();
		}finally{
			lock.unlock();
		}
		rmdao = null;
	}
	
	/**
	 * 初始化缓存
	 * */
	public void importDate(){
		initMenu();
		initRoleMenu();
	}


}

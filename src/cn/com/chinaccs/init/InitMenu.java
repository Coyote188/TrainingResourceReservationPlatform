package cn.com.chinaccs.init;

import java.util.List;

import cn.com.chinaccs.bean.entity.TNMenu;
import cn.com.chinaccs.dao.impl.MenuDao;


public class InitMenu extends Init {

	private MenuDao menuDao;
	private static List<TNMenu> menus;
	private static InitMenu instance;

	private InitMenu() {
		init();
	}
	
	@Override
	protected void init() {
		if(null == menuDao) {
			menuDao = new MenuDao();
		}
		menus = menuDao.getValidAll();
	}
	
	public synchronized static InitMenu getInstance() {
		if(null == instance) {
			instance = new InitMenu();
		}
		return instance;
	}

	public List<TNMenu> getMenus() {
		reInit();
		return menus;
	}

	@Override
	public void reInit() {
		init();
	}
	
}

package cn.com.chinaccs.helper;

import org.apache.log4j.Logger;

import cn.com.chinaccs.conf.InitConfig;
import cn.com.chinaccs.dao.impl.BaseDaoImpl;
import cn.com.chinaccs.utils.StringUtil;

public class DynamicLoadDao {

	protected String DAO_PACKAGES = InitConfig.getInstance().getValue("dao.package");
	
	protected static final Logger log = Logger.getLogger(DynamicLoadDao.class);
	
	@SuppressWarnings("rawtypes")
	public BaseDaoImpl getDao(String daoName) {
		BaseDaoImpl dao = null;
		if(!StringUtil.isEmpty(daoName)) {
			daoName = StringUtil.firstToUppercase(daoName);
			if(!StringUtil.isEmpty(DAO_PACKAGES)) {
				String[] DAO_PACKAGE_ARRAY = DAO_PACKAGES.split(",");
				for (String DAO_PACKAGE : DAO_PACKAGE_ARRAY) {
					try {
						dao = (BaseDaoImpl)Class.forName(DAO_PACKAGE+"."+daoName).newInstance();
					} catch (InstantiationException e) {
						//e.printStackTrace();
						dao = null;
					} catch (IllegalAccessException e) {
						//e.printStackTrace();
						dao = null;
					}catch (ClassNotFoundException e) {
						//e.printStackTrace();
						dao = null;
					}
					if(null != dao) {
						break;
					}
				}
			}
		}
		if(null == dao) {
			log.error("["+daoName+"]类没有找到！！！");
		}
		return dao;
	}
	
}

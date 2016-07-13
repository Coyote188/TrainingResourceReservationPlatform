package cn.com.chinaccs.service.driver;

import java.util.List;

import cn.com.chinaccs.bean.driver.DriverLicenseLevel;
import cn.com.chinaccs.dao.DriverLicenseLevelDao;

public class BookingService {

	/**
	 * 查询用户关联的驾照级别
	 * @param user
	 * @return
	 */
	public List<DriverLicenseLevel> findAllDriverLicenseLv(String user) {
		DriverLicenseLevelDao dao = new DriverLicenseLevelDao();
		
		return dao.findAll();
	}
	
	
}

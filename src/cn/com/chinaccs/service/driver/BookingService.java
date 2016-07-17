package cn.com.chinaccs.service.driver;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import cn.com.chinaccs.bean.driver.DriverLicenseLevel;
import cn.com.chinaccs.bean.driver.TrainingSourceLock;
import cn.com.chinaccs.dao.DriverLicenseLevelDao;
import cn.com.chinaccs.dao.TrainingSourceLockDao;
import cn.com.chinaccs.utils.SystemConstant;

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
	
	
	/**
	 * 按月查询车辆预约情况
	 * @param vehicle
	 * @param mon
	 * @return 返回一个月的情况列表
	 */
	public List<java.util.Map<String, String>>  vehicleBookingStatusByMonthView(String vehicle, java.util.Date start, java.util.Date end){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cale = Calendar.getInstance();
		
		Calendar min = Calendar.getInstance();
		Calendar max = Calendar.getInstance();
		min.setTime(start);
		max.setTime(end);
		java.util.Date mon = null;
		if(min.get(Calendar.DATE) == 1){
			mon = start;
		}else if(max.get(Calendar.DATE) == max.getActualMaximum(Calendar.DAY_OF_MONTH)){
			mon = end;
		}else{
			min.add(Calendar.MONTH, 1);
			mon = min.getTime();
		}
		cale.setTime(mon);
		String sql = "select * from resourcelock where resource_id = '' and DATE_FORMAT(lock_time,'%Y%m') = '' and ((status = '001' and status_date > ADDDATE(NOW(), INTERVAL -30 MINUTE)) or status = '002') order by lock_time asc";
		TrainingSourceLockDao resDao = new TrainingSourceLockDao();
		List<TrainingSourceLock> resLockList = resDao.querySql(sql);
		List<java.util.Map<String, String>> res = new ArrayList<java.util.Map<String,String>>();
		for(int day =0; day< cale.getActualMaximum(Calendar.DAY_OF_MONTH); day++){
			java.util.Map<String,String> amEvent = new java.util.HashMap<String, String>(),pmEvent = new java.util.HashMap<String, String>();
			
			int am = 0;
			int pm = 0;
			for(TrainingSourceLock lock: resLockList){
				Calendar _cal = Calendar.getInstance();
				_cal.setTime(lock.getLockedTime());
				if(_cal.get(Calendar.DATE) == day+1){
					
					int timeSt = _cal.get(Calendar.HOUR_OF_DAY);
					for(;timeSt <= timeSt+lock.getDuration(); timeSt++){
						if(timeSt < 12){
							am++;
						}else{
							pm++;
						}
					}
				}
			}
			Calendar __cal = Calendar.getInstance();
			__cal.setTime(mon);
			__cal.set(Calendar.DATE, day+1);
			int amHour = Integer.parseInt(SystemConstant.AM_END)-Integer.parseInt(SystemConstant.AM_START);
			int pmHour = Integer.parseInt(SystemConstant.PM_END)-Integer.parseInt(SystemConstant.PM_START);
			String status = "";
			String color = "";
			{
				if((float)am/(float)amHour >= 0.6){
					status = "（拥挤）";
					color = "#FF0000";
				}else if((float)am/(float)amHour == 1){
					status = "（满）";
					color = "#FF00FF";
				}else{
					status = "（空）";
					color = "#00DD00";
				}
				amEvent.put("title", "上午" + status);
				amEvent.put("color", color);
				amEvent.put("start", sdf.format(__cal.getTime()) + "T" + SystemConstant.AM_START + ":00:00");
				amEvent.put("end", sdf.format(__cal.getTime()) + "T" + SystemConstant.AM_END + ":00:00");
			}
			{
				if((float)pm/(float)pmHour >= 0.6){
					status = "（拥挤）";
					color = "#FF0000";
				}else if((float)pm/(float)pmHour == 1){
					status = "（满）";
					color = "#FF00FF";
				}else{
					status = "（空）";
					color = "#00DD00";
				}
				pmEvent.put("title", "下午" + status);
				pmEvent.put("color", color);
				pmEvent.put("start", sdf.format(__cal.getTime()) + "T" + SystemConstant.PM_START + ":00:00");
				pmEvent.put("end", sdf.format(__cal.getTime()) + "T" + SystemConstant.PM_END + ":00:00");
			}
			res.add(amEvent);
			res.add(pmEvent);
		}
		
		return res;
	}
}

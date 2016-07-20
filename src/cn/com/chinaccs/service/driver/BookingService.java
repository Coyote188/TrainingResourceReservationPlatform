package cn.com.chinaccs.service.driver;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.driver.DriverLicenseLevel;
import cn.com.chinaccs.bean.driver.InstructionVehicle;
import cn.com.chinaccs.bean.driver.Order;
import cn.com.chinaccs.bean.driver.OrderDetail;
import cn.com.chinaccs.bean.driver.TrainingSourceLock;
import cn.com.chinaccs.dao.DriverLicenseLevelDao;
import cn.com.chinaccs.dao.InstructionVehicleDao;
import cn.com.chinaccs.dao.OrderDao;
import cn.com.chinaccs.dao.OrderDetailDao;
import cn.com.chinaccs.dao.TrainingSourceLockDao;
import cn.com.chinaccs.utils.IDGen;
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
	
	public List<InstructionVehicle> findVehicleByArea(String area, String licenseLevel){
		InstructionVehicleDao dao = new InstructionVehicleDao();
		String sql = "select * from instruction_vehicle_infomation where belong = '" + area + "' and vehicle_type = '" + licenseLevel + "'";
		
		return dao.querySql(sql);
	}
	
	public List<String> vehicleHourLeft(String vehicle, java.util.Date date, String time){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String lockTime = sdf.format(date);
		String sql = "select * from resourcelock where resource_id = '' and DATE_FORMAT(lock_time,'%Y%m%d') = '" + lockTime + "'";
		TrainingSourceLockDao resDao = new TrainingSourceLockDao();
		List<TrainingSourceLock> lockList = resDao.querySql(sql);
		List<String> timeLeft = new ArrayList<String>();
		Calendar now = Calendar.getInstance();
		if(time.equals(SystemConstant.TIME_AM)){
			for(int i = Integer.parseInt(SystemConstant.AM_START); i<= Integer.parseInt(SystemConstant.AM_END); i++){
				if(lockTime.equals(sdf.format(now.getTime()))){
					if(i > now.get(Calendar.HOUR_OF_DAY)){
						String hour = "";
						if(i < 10){
							hour = "0" + i;
						}else{
							hour = String.valueOf(i);
						}
						timeLeft.add(hour);
					}
				}else{
					String hour = "";
					if(i < 10){
						hour = "0" + i;
					}else{
						hour = String.valueOf(i);
					}
					timeLeft.add(hour);
				}
				
			}
		}else{
			for(int i = Integer.parseInt(SystemConstant.PM_START); i<= Integer.parseInt(SystemConstant.PM_END); i++){
				if(lockTime.equals(sdf.format(now.getTime()))){
					if(i > now.get(Calendar.HOUR_OF_DAY)){
						timeLeft.add("" + i);
					}
				}else{
					timeLeft.add("" + i);
				}
			}
		}
		Calendar cal = Calendar.getInstance();
		for(TrainingSourceLock lock: lockList){
			cal.setTime(lock.getLockedTime());
			int i = cal.get(Calendar.HOUR_OF_DAY);
			String hour = "";
			if(i < 10){
				hour = "0" + i;
			}else{
				hour = String.valueOf(i);
			}
			
			int idx = timeLeft.indexOf(hour);
			if(idx >=0)
				timeLeft.remove(idx);
		}
		
		return timeLeft;
	}
	
	/**
	 * 按月查询车辆预约情况
	 * @param vehicle
	 * @param mon
	 * @return 返回一个月的情况列表
	 */
	public List<java.util.Map<String, String>>  vehicleBookingStatusByMonthView(String vehicle, java.util.Date start, java.util.Date end){
		
		if(end.getTime() < System.currentTimeMillis()){
			return new ArrayList<java.util.Map<String,String>>();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"), __sdf = new SimpleDateFormat("yyyyMM");;
		Calendar cale = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		today.setTime(new java.util.Date(System.currentTimeMillis()));
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
		String sql = "select * from resourcelock where resource_id = '" + vehicle + "' and DATE_FORMAT(lock_time,'%Y%m') = '" + __sdf.format(mon) + "' and ((status = '" + SystemConstant.RS_LOCK_STATUS_PRE+ "' and status_date > ADDDATE(NOW(), INTERVAL -30 MINUTE)) or (status = '" + SystemConstant.RS_LOCK_STATUS_LOCK + "' and unlock_time < now())) order by lock_time asc";
		TrainingSourceLockDao resDao = new TrainingSourceLockDao();
		List<TrainingSourceLock> resLockList = resDao.querySql(sql);
		List<java.util.Map<String, String>> res = new ArrayList<java.util.Map<String,String>>();
		for(int day =1; day< cale.getActualMaximum(Calendar.DAY_OF_MONTH); day++){
			if(day >= today.get(Calendar.DAY_OF_MONTH)){
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
				__cal.set(Calendar.DATE, day);
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
		}
		
		return res;
	}
	
	/**
	 * 资源占用锁
	 * @param resId
	 * @param resName
	 * @param resType
	 * @param uId
	 * @param lockTime
	 * @param duration
	 * @return
	 */
	public String resourceHold(String resId, String resName, String resType, String uId, java.sql.Timestamp lockTime, int duration){
		TrainingSourceLock lock = new TrainingSourceLock(resId, resName, resType, uId);
		
		return lock.hold(duration, lockTime);
	}
	
	public String orderSave(JSONObject request) throws Exception{
		Order order = new Order(IDGen.getId()).newOrder(request.getString("userId"));
		//判断该时间是否可以预约
		InstructionVehicle veh = new InstructionVehicleDao().find(request.getString("vehicle"));
		String trainDate = request.getString("trainDate");
		String trainStart = request.getString("trainStart");
		String trainEnd = request.getString("trainEnd");
		int _trainStart = Integer.parseInt(trainStart);
		int _trainEnd = Integer.parseInt(trainEnd);
		int duration = _trainEnd - _trainStart + 1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date _trainDate = sdf.parse(trainDate);
		Calendar cal = Calendar.getInstance();
		cal.setTime(_trainDate);
		cal.set(Calendar.HOUR_OF_DAY, _trainStart);
		
		String resLockId = resourceHold(veh.getId(), veh.getBands(), SystemConstant.RES_TYPE_VEHICLE, order.getOrderUser(),new java.sql.Timestamp( cal.getTime().getTime()), duration);
		
		BigDecimal amount = veh.getPrice().multiply(new BigDecimal(duration));
		order.setOrderAmount(amount);
		order.setSerialNbr(IDGen.getSerialNumber(SystemConstant.PLAT_FORM));
		//getVehicle&Lock
		//getField&Lock
		//getCoach&Lock
		String orderDetailId = order.getOrderDetail();
		OrderDetailDao dao = new OrderDetailDao();
		OrderDetail detail = dao.find(orderDetailId);
		detail.setDuration(duration);
		detail.setInstructionVehicle(veh.getId());
		detail.setInstructionVehicleLock(resLockId);
		detail.setInstructionVehicleMoney(amount);
		detail.setLicenseLv(request.getString("license"));
		detail.setLicenseLvMoney(null);
		detail.setTrainingEdTime(new java.sql.Timestamp( cal.getTime().getTime()));
		detail.setTrainingField(request.getString("field"));
		detail.setTrainingFieldLock(null);
		detail.setTrainingFieldMoney(null);
		cal.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY) + duration);
		detail.setTrainingStTime(new java.sql.Timestamp( cal.getTime().getTime()));
		detail.update();
		order.update();
		return order.getId();
	}
	
	/**
	 * 订单查询
	 * @param isOutdatedOrderShow 是否显示已过时效订单
	 * @param userId 针对用户订单查询
	 * @param limitOrderDateStart 查询订单开始时间 (yyyy/MM/dd)
	 * @param limitOrderDateEnd 查询订单结束时间 (yyyy/MM/dd)
	 * @param orderStatus 返回订单状态
	 * @return
	 */
	public List<java.util.Map<String, Object>> findOrdersByArgs(boolean isOutdatedOrderShow, String userId, String limitOrderDateStart,String limitOrderDateEnd, String orderStatus){
		OrderDao oDao = new OrderDao();
		List<Object> result = oDao.findOrdersByArgs(isOutdatedOrderShow, userId, limitOrderDateStart, limitOrderDateEnd, orderStatus);
		List<java.util.Map<String, Object>> orderList = new ArrayList<java.util.Map<String, Object>>();
		for(Object line: result){
			Object[] item = (Object[])line;
			java.util.Map<String, Object> order = new java.util.HashMap<String, Object>();

			order.put("order_id", item[0]);
			order.put("order_date", item[1]);
			order.put("serial", item[2]);
			order.put("state", item[3]);
			order.put("order_money", item[4]);
			order.put("payment_id", item[5]);
			order.put("detail_id", item[6]);
			order.put("state_date", item[7]);
			order.put("pre_state", item[8]);
			order.put("cust_id", item[9]);
			order.put("vehiche_pic", item[10]);
			order.put("lv", item[11]);
			order.put("field_id", item[12]);
			order.put("vehicle_id", item[13]);
			order.put("vehicle_money", item[14]);
			order.put("training_st", item[15]);
			order.put("training_nd", item[16]);
			order.put("duration", item[17]);
			order.put("cust_name", item[18]);
			order.put("mobile", item[19]);
			order.put("id_no", item[20]);
			order.put("id_type", item[21]);
			order.put("reg_license", item[22]);
			order.put("sys_username", item[23]);
			order.put("vehicle_bands", item[24]);
			order.put("vehicle_model", item[25]);
			order.put("vehicle_price", item[26]);
			order.put("description", item[27]);
			order.put("area", item[28]);
			order.put("pay_serial", item[29]);
			order.put("pay_method", item[30]);
			order.put("payment_state_date", item[31]);
			order.put("payment_recv_time", item[32]);
			
			orderList.add(order);
		}
		
		return orderList;
	}
}

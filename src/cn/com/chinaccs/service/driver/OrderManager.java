package cn.com.chinaccs.service.driver;

import java.math.BigDecimal;

import cn.com.chinaccs.bean.driver.InstructionVehicle;
import cn.com.chinaccs.bean.driver.Order;
import cn.com.chinaccs.bean.driver.OrderDetail;
import cn.com.chinaccs.bean.driver.Personnel;
import cn.com.chinaccs.bean.driver.TrainingField;
import cn.com.chinaccs.bean.driver.TrainingSourceLock;
import cn.com.chinaccs.dao.InstructionVehicleDao;
import cn.com.chinaccs.dao.PersonnelDao;
import cn.com.chinaccs.dao.TrainingFieldDao;
import cn.com.chinaccs.dao.TrainingSourceLockDao;
import cn.com.chinaccs.utils.SystemConstant;
import cn.com.chinaccs.utils.Utils;

public class OrderManager {

	//资源预锁定
	public String resourceHold(String resourceId, String resType, String resName, String userId, java.sql.Timestamp stTime, int duration){
		
		TrainingSourceLock tsl = new TrainingSourceLock(resourceId, resName, resType, userId);
		
		return tsl.hold(duration,stTime);
	}
	//资源锁定
	public boolean resourceLock(String resId){
		TrainingSourceLockDao dao = new TrainingSourceLockDao();
		TrainingSourceLock lock = dao.find(resId);
		return lock.lock();
	}
	/**
	 * 预定场地
	 * @param userId
	 * @param field
	 * @param trainingTimeSt
	 * @param duration
	 * @return
	 */
	public String fieldBook(String userId, String field, java.sql.Timestamp trainingTimeSt, int duration){
		TrainingFieldDao dao = new TrainingFieldDao();
		TrainingField _field = dao.find(field);
		return resourceHold(_field.getId(), "FIELD", _field.getFieldName(), userId, trainingTimeSt, duration);
		 
	}
	/**
	 * 预定训练车
	 * @param userId
	 * @param vId
	 * @param trainingTimeSt
	 * @param duration
	 * @return
	 */
	public String vehicleBook(String userId, String vId, java.sql.Timestamp trainingTimeSt, int duration){
		InstructionVehicleDao dao = new InstructionVehicleDao();
		InstructionVehicle vehicle = dao.find(vId);
		
		return resourceHold(vehicle.getId(), "VEHICLE", vehicle.getVehicleType(), userId, trainingTimeSt, duration);
	}
	
	/**
	 * 预定教练
	 * @param userId
	 * @param coachId
	 * @param trainingTimeSt
	 * @param duration
	 * @return
	 */
	public String coachBook(String userId, String coachId, java.sql.Timestamp trainingTimeSt, int duration){
		PersonnelDao dao = new PersonnelDao();
		Personnel coach = dao.find(coachId);
		
		return resourceHold(coach.getId(), "COACH", coach.getName(), userId, trainingTimeSt, duration);
	}
	
	
	/**
	 * 保存订单
	 * @param userId
	 * @param orderId
	 * @return
	 */
	public String orderSave(String userId, String orderId){
		Order order = new Order(orderId).load();
		order.setPreStatus(order.getOrderStatus());
		order.setOrderStatus(SystemConstant.ORDER_STATUS_SAVED);
		order.setStatusDate(new java.sql.Timestamp(System.currentTimeMillis()));
		
		{
			OrderDetail detail = order.loadDetail();
			resourceLock(detail.getInstructionVehicleLock());
			resourceLock(detail.getTrainingFieldLock());
			resourceLock(detail.getCoachLock());
			
		}
		
		if(order.update()){
			return order.getId();
		}else{
			return "";
		}
		
	}
	
	/**
	 * 订单缴费
	 * @param userId
	 * @param orderId
	 * @param paymentId
	 * @return
	 */
	public String orderPay(String userId, String orderId, String paymentId){
		Order order = new Order(orderId).load();
		order.setPreStatus(order.getOrderStatus());
		order.setOrderStatus(SystemConstant.ORDER_STATUS_PAYED);
		order.setStatusDate(new java.sql.Timestamp(System.currentTimeMillis()));
		if(order.update()){
			return order.getId();
		}else{
			return "";
		}
	}
	
	public String payment(String userId, BigDecimal money){
		
		return null;
	}
	
	
	//----------------查询教学资源，锁定内容--------------------
	/**
	 * 场地查询
	 * @return
	 */
	public String findField(){
		TrainingFieldDao fieldDao = new TrainingFieldDao();
		return Utils.parseJson(fieldDao.findAll());
	}
	/**
	 * 按场地查询可用车辆
	 * @param field
	 * @return
	 */
	public String findVehicle(String field){
		InstructionVehicleDao dao = new InstructionVehicleDao();
		String sql = "select * from instruction_vehicle_infomation where belong = '" + field + "'";
		return Utils.parseJson(dao.queryObjSql(sql));
	}
	//未启用
	public String findCoach(){
		//
		return null;
	}
}
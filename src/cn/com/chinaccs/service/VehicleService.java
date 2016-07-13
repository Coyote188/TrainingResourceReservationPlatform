package cn.com.chinaccs.service;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.VehicleBean;
import cn.com.chinaccs.bean.VehicleMaintenanceInfo;
import cn.com.chinaccs.dao.impl.VehicleDao;
import cn.com.chinaccs.dao.impl.VehicleMaintenanceDao;

public class VehicleService extends BaseService {
	
	/**
	 * 数据保存
	 * @param bean
	 * @return
	 */
	public CHResponse vehicleSave(VehicleBean bean){
		CHResponse resp = new CHResponse();
		String serial = bean.save();
		
		if(null != serial){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("车辆信息添加成功");
			resp.setData(bean.save());
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("添加失败，请检查后重新录入");
		}
		return resp;
	}
	
	/**
	 * 数据保存
	 * @param bean
	 * @return
	 */
	public CHResponse maintanence(VehicleMaintenanceInfo bean){
		CHResponse resp = new CHResponse();
		String serial = bean.save();
		
		if(null != serial){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("例保记录成功");
			resp.setData(bean.save());
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("例保记录失败，请检查后重新录入");
		}
		return resp;
	}

	/**
	 * 加载基本信息
	 * @param serial
	 * @return
	 */
	public VehicleBean loadVehicle(String serial){
		VehicleDao vDao = new VehicleDao();
		return vDao.find(serial);
	}
	
	public String vehicleMaintenance(VehicleMaintenanceInfo info){
		return info.save();
	}
	
	public CHResponse remove(String serial){
		VehicleDao vDao = new VehicleDao();
		CHResponse resp = new CHResponse();
		if( vDao.delete(serial)){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("车辆信息删除成功");
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("信息删除失败！");
		}
		return resp;
	}
	
	public CHResponse removeMaintainLog(String serial){
		VehicleMaintenanceDao vDao = new VehicleMaintenanceDao();
		CHResponse resp = new CHResponse();
		if( vDao.delete(serial)){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("例保信息删除成功");
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("例保信息删除失败！");
		}
		return resp;
	}
}

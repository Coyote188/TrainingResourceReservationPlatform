package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TVRepairPerson;
import cn.com.chinaccs.dao.impl.RepairPersonDao;

public class RepairPersonService extends BaseService {
	
	/**
	 * 数据保存
	 * @param bean
	 * @return
	 */
	public CHResponse repairPersonSave(TVRepairPerson bean){
		RepairPersonDao dao = new RepairPersonDao();
		CHResponse resp = new CHResponse();
		Serializable  serial = dao.save(bean);
		
		if(null != serial){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("维修保养人添加成功");
			resp.setData(serial);
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("添加失败，请检查后重新录入");
		}
		return resp;
	}
	
	/**
	 * 更新
	 * */
	public CHResponse upd(TVRepairPerson bean) {
		CHResponse chResponse = new CHResponse();
		RepairPersonDao dao = new RepairPersonDao();
		if(null != bean){
			if(dao.update(bean)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("维修保养人修改成功");
			}
			bean =null;
		}
		return chResponse;
	}
	
	public CHResponse remove(String serial){
		RepairPersonDao vDao = new RepairPersonDao();
		CHResponse resp = new CHResponse();
		if( vDao.delete(serial)){
			resp.setResult(OP_SUCCESS);
			resp.setMsg("维修保养人删除成功");
		}else{
			resp.setResult(OP_FAIL);
			resp.setMsg("信息删除失败！");
		}
		return resp;
	}
	
	/**
	 * 查询维修保养人下拉列表
	 * @param orgId
	 * @return
	 */
	public CHResponse getItem(String orgId) {
		CHResponse chResponse = new CHResponse();
		RepairPersonDao dao = new RepairPersonDao();
		List<Object> lists = dao.getItem(orgId);
		if(null != lists && lists.size()>0) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg(OP_SUCCESS_MSG);
			chResponse.setData(lists);
			chResponse.setTotalNum(lists.size());
			chResponse.setSize(lists.size());
		}
		lists = null;
		dao = null;
		return chResponse;
	}
}

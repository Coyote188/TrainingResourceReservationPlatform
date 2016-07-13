package cn.com.chinaccs.service;

import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.dao.impl.OPDao;
import cn.com.chinaccs.utils.StringUtil;

/**
 * 
 * @author lmq
 *
 */
public class OPService extends BaseService {

	/**
	 * 查询数据
	 * @param resId
	 * @param params
	 * @return
	 */
	public CHResponse getDatas(String resId,Map<String,Object> params) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(resId)) {
			OPDao opDao = new OPDao();
			List<Object> objs = opDao.queryDatas(resId, params);
			if(null != objs && objs.size()>0) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
				chResponse.setData(objs);
				chResponse.setSize(objs.size());
			}
			objs = null;
			opDao = null;
		}
		return chResponse;
	}
	
	
	/**
	 * 执行update,delete等的sql
	 * @param resId sql 名称
	 * @param params sql 参数
	 * @return
	 */
	public CHResponse execute(String resId,Map<String,Object> params) {
		CHResponse chResponse = new CHResponse();
		if(!StringUtil.isEmpty(resId)) {
			OPDao opDao = new OPDao();
			if(opDao.execute(resId, params)) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg(OP_SUCCESS_MSG);
			}
			opDao = null;
		}
		return chResponse;
	}
	
}

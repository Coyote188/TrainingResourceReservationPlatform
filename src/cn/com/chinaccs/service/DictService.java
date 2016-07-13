package cn.com.chinaccs.service;

import java.io.Serializable;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.entity.TNDict;
import cn.com.chinaccs.dao.impl.DictDao;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class DictService extends BaseService {

	/**
	 * 
	 * @param busiValue
	 * @return
	 */
	public CHResponse getItem(String busiValue) {
		CHResponse chResponse = new CHResponse();
		DictDao dictDao = new DictDao();
		List<Object> lists = dictDao.getItem(busiValue);
		if(null != lists && lists.size()>0) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg(OP_SUCCESS_MSG);
			chResponse.setData(lists);
			chResponse.setTotalNum(lists.size());
			chResponse.setSize(lists.size());
		}
		lists = null;
		dictDao = null;
		return chResponse;
	}

	public CHResponse save(TNDict dict) {
		CHResponse chResponse = new CHResponse();
		if(null != dict){
			String pId = dict.getParentId();
			TNDict porg = new TNDict();
			DictDao dao = new DictDao();
			porg = dao.find(pId);
			if (porg != null && porg.getBusiLevel() != null) {
				dict.setBusiLevel(porg.getBusiLevel() + 1); // 添加等级
			} else {
				dict.setBusiLevel(1); // 添加等级
			}
			if(StringUtil.isEmpty(dict.getParentId())) {
				dict.setParentId("0");
			}
			Serializable  bid = dao.save(dict);
			if(null != bid) {
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("数据字典添加成功");
			}
			dao = null;
		}
		return chResponse;
	}

	public CHResponse upd(TNDict dict) {
		CHResponse chResponse = new CHResponse();
		if(null != dict){
			String pId = dict.getParentId();
			TNDict pdict = new TNDict();
			DictDao dao = new DictDao();
			pdict = dao.find(pId);
			if (pdict != null && pdict.getBusiLevel() != null) {
				dict.setBusiLevel(pdict.getBusiLevel() + 1); // 添加等级
			} else {
				dict.setBusiLevel(1); // 添加等级
			}
			if(StringUtil.isEmpty(dict.getParentId())) {
				dict.setParentId("0");
			}
			if(dao.update(dict)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("数据字典修改成功");
			}
			dao = null;
		}
	
		return chResponse;
	}

	public CHResponse del(String id) {
		CHResponse chResponse = new CHResponse();
		if(null != id) {
			DictDao dao = new DictDao();
			if(dao.delete(id)){
				chResponse.setResult(OP_SUCCESS);
				chResponse.setMsg("数据字典删除成功");
			}
			dao = null;
		}
		return chResponse;
	}
	
}

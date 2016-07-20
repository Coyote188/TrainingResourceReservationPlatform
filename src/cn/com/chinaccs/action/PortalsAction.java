package cn.com.chinaccs.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.dao.impl.InfoDao;
import cn.com.chinaccs.utils.SystemConstant;

/**
 * 首页
 * @author Coyote
 *
 */
public class PortalsAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6998614259567779035L;
	
	/**
	 * 轮播图片查询
	 * @return
	 */
	public String slider(){
		InfoDao infoDao = new InfoDao();
		List<Object> infos = infoDao.findInfosByArgs(SystemConstant.INFO_TYPE_SLIDER, 0, 7);
		List<Map<String, Object>> res = new ArrayList<Map<String, Object>>();
		for(Object obj: infos){
			Object[] info = (Object[])obj;
			Map<String, Object> _info = new HashMap<String, Object>();
			_info.put("title", info[0]);
			_info.put("abstract", info[1]);
			_info.put("state", info[2]);
			_info.put("type", info[3]);
			_info.put("post_user", info[4]);
			_info.put("time", info[5]);
			_info.put("imgUri", info[6]);
			res.add(_info);
		}
		chResponse = new CHResponse();
		chResponse.setData(res);
		chResponse.setMsg(OP_SUCCESS_MSG);
		chResponse.setResult(OP_SUCCESS);
		return json();
	}

}

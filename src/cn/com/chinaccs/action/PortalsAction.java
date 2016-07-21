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
		chResponse = commQry(SystemConstant.INFO_TYPE_SLIDER, 0, 7);
		return json();
	}
	/**
	 * 消息查询
	 * @return
	 */
	public String infoQuery(){
		String intoType = getRequest().getParameter("infoType");
		String limit = getRequest().getParameter("limit");
		String len = getRequest().getParameter("len");
		int _limit = (null == limit || limit.isEmpty())? 0: Integer.parseInt(limit);
		int _len = (null == len || len.isEmpty())? 5: Integer.parseInt(len);
		chResponse = commQry(intoType, _limit, _len);
		return json();
	}
	
	/**
	 * 消息查询
	 * @param infoType
	 * @param limit
	 * @param len
	 * @return
	 */
	private CHResponse commQry(String infoType, int limit, int len){
		InfoDao infoDao = new InfoDao();
		List<Object> infos = infoDao.findInfosByArgs(infoType, limit, len);
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
			_info.put("infoId", info[7]);
			_info.put("infor", info[8]);
			res.add(_info);
		}
		chResponse = new CHResponse();
		chResponse.setData(res);
		chResponse.setMsg(OP_SUCCESS_MSG);
		chResponse.setResult(OP_SUCCESS);
		
		return chResponse;
	}

}

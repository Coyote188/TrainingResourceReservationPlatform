package cn.com.chinaccs.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.service.driver.BookingService;
import cn.com.chinaccs.utils.SystemConstant;

import net.sf.json.JSONObject;

/**
 * 预约流程
 * 1、驾考类型选择
 * 2、科目类型选择
 * 3、选择场地
 * 4、选择车辆（未启用）
 * 5、选择教员（未启用）
 * 6、时间确认
 * 7、保存订单
 * 8、缴费
 * @author Tsui
 *
 */
public class BookingAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8868040805548792539L;
	private static BookingService service = new BookingService();

	public String startBookingFlow() throws Exception{
		
		return SUCCESS;
	}
	/**
	 * 查询驾考类型
	 * @return
	 */
	public String licenseTypeList(){
		return json();
	}
	/**
	 * 选择驾考类型
	 * @return
	 */
	public String liceseTypeSelect(){
		return json();
	}
	/**
	 * 科目类型列表
	 * @return
	 */
	public String subjectsList(){
		return json();
	}
	/**
	 * 科目类型选择
	 * @return
	 */
	public String subjectsSelect(){
		return json();
	}
	/**
	 * 场地列表
	 * @return
	 */
	public String fieldList(){
		return json();
	}
	/**
	 * 场地选择
	 * @return
	 */
	public String fieldSelect(){
		return json();
	}
	/**
	 * 车辆列表
	 * @return
	 */
	public String vehiclaList(){
		return json();
	}
	/**
	 * 车辆选择
	 * @return
	 */
	public String vehiclaSelect(){
		return json();
	}
	/**
	 * 教练列表
	 * @return
	 */
	public String coachList(){
		return json();
	}
	/**
	 * 教练选择
	 * @return
	 */
	public String coachSelect(){
		return json();
	}
	/**
	 * 时间列表
	 * @return
	 */
	public String timeList(){
//		StringBuffer reqJson = new StringBuffer();
		
//		try {
//			java.io.InputStream in = getRequest().getInputStream();
//			java.io.BufferedInputStream buf=new java.io.BufferedInputStream(in);
//			byte[] buffer=new byte[1024]; 
//			int iRead;
//			while((iRead=buf.read(buffer))!=-1)   
//			{
//				reqJson.append(new String(buffer,0,iRead,"UTF-8"));
//			}
//			
//		} catch (IOException e) {
//			log.warn(" -- 可用时间列表查询出错 -- ");
//		}
//		JSONObject req = JSONObject.fromObject(reqJson.toString());
		if(getRequest().getParameter("query_time_list").equals(SystemConstant.QUERY_TIME_LIST_MONTH)){
			//后台查询月预定情况，返回每天的情况（分上/下午）
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date start = sdf.parse( getRequest().getParameter("start"));
				java.util.Date end = sdf.parse( getRequest().getParameter("end"));
				List<java.util.Map<String, String>> res = service.vehicleBookingStatusByMonthView(getRequest().getParameter("vehicle"),start,end);
				chResponse = new CHResponse();
				
				chResponse.setResult(OP_SUCCESS);
//				chResponse.setMsg("获取成功！");
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("AM_END", SystemConstant.AM_END);
				jsonObj.put("PM_END", SystemConstant.PM_END);
				jsonObj.put("AM_START", SystemConstant.AM_START);
				jsonObj.put("PM_START", SystemConstant.PM_START);
				chResponse.setMsg(jsonObj.toString());
				chResponse.setData(res);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(getRequest().getParameter("query_time_list").equals(SystemConstant.QUERY_TIME_LIST_DAY)){
			//查询一天内该车的预订情况，返回可用的时间（小时）
		}
		return json();
	}
	/**
	 * 时间确认
	 * @return
	 */
	public String timeSelect(){
		return json();
	}
	/**
	 * 预约资料保存(订单确认)
	 * @return
	 */
	public String orderSave(){
		return json();
	}
}

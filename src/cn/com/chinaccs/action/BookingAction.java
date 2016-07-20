package cn.com.chinaccs.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.UserInfo;
import cn.com.chinaccs.bean.driver.InstructionVehicle;
import cn.com.chinaccs.bean.driver.Order;
import cn.com.chinaccs.bean.entity.TNUser;
import cn.com.chinaccs.dao.InstructionVehicleDao;
import cn.com.chinaccs.dao.OrderDao;
import cn.com.chinaccs.dao.impl.UserDao;
import cn.com.chinaccs.service.UserService;
import cn.com.chinaccs.service.driver.BookingService;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.utils.SystemConstant;

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
		
		chResponse = new CHResponse();
		String area = getRequest().getParameter("area");
		String licenseLevel = getRequest().getParameter("lv");
		List<InstructionVehicle> vList = service.findVehicleByArea(area, licenseLevel);
		List<java.util.Map<String,String>> res = new ArrayList<java.util.Map<String,String>>();
		for(InstructionVehicle v: vList){
			java.util.Map<String,String> vehicle = new java.util.HashMap<String, String>();
			vehicle.put("id", v.getId());
			vehicle.put("name", v.getBands() +" "+ v.getModel());
			vehicle.put("price", String.valueOf(v.getPrice()));
			vehicle.put("desc", v.getDescription());
			vehicle.put("pic", "");
			res.add(vehicle);
		}
		chResponse.setResult(OP_SUCCESS);
		chResponse.setMsg("QR Success");
		chResponse.setData(res);
		
		return json();
	}
	/**
	 * 车辆选择
	 * @return
	 */
	public String vehiclaSelect(){
		chResponse = new CHResponse();
		String vehicle = getRequest().getParameter("vehicle");
		String user = getRequest().getParameter("user");
		InstructionVehicle veh = new InstructionVehicleDao().find(vehicle);

//		service.resourceHold(veh.getId(), veh.getBands(), SystemConstant.RES_TYPE_VEHICLE, user, lockTime, duration)
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
		chResponse = new CHResponse();
		if(getRequest().getParameter("query_time_list").equals(SystemConstant.QUERY_TIME_LIST_MONTH)){
			//后台查询月预定情况，返回每天的情况（分上/下午）
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date start = sdf.parse( getRequest().getParameter("start"));
				java.util.Date end = sdf.parse( getRequest().getParameter("end"));
				List<java.util.Map<String, String>> res = service.vehicleBookingStatusByMonthView(getRequest().getParameter("vehicle"),start,end);
				
				
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
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date start = sdf.parse( getRequest().getParameter("start"));
				List<String> res = service.vehicleHourLeft(getRequest().getParameter("vehicle"), start, getRequest().getParameter("time").toUpperCase());
				
				chResponse.setResult(OP_SUCCESS);
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
		chResponse = new CHResponse();
		JSONObject jsObj = new JSONObject();
		jsObj.put("license", getRequest().getParameter("license"));
		jsObj.put("field", getRequest().getParameter("field"));
		jsObj.put("vehicle", getRequest().getParameter("vehicle"));
		jsObj.put("trainDate", getRequest().getParameter("trainDate"));
		jsObj.put("trainStart", getRequest().getParameter("trainStart"));
		jsObj.put("trainEnd", getRequest().getParameter("trainEnd"));
		jsObj.put("userId", this.getUserId());
		try {
			String orderId = service.orderSave(jsObj);
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg("OP_SUCCESS");
			chResponse.setData(orderId);
		} catch (Exception e) {
			chResponse.setResult(OP_FAIL);
			chResponse.setMsg("OP_FAIL");
			chResponse.setData(null);
		}
		
		return json();
	}
	
	/**
	 * 订单管理（返回订单列表）
	 * 视不同参数，返回
	 * outdatedOrderShow 是否显示已经完成的订单 任意字符显示，空不显示<br>
	 * userId 查询指定用户的订单- 空不指定 用户ID则返回该用户的订单<br>
	 * limitOrderDateStart 订单开始时间--(yyyy/MM/dd)<br>
	 * limitOrderDateEnd 订单结束时间--(yyyy/MM/dd)<br>
	 * orderStatus 订单状态，不传则返回全部订单<br>
	 * @return
	 */
	public String orderListQuery(){
		String outdatedOrderShow = getRequest().getParameter("outdatedOrderShow");
		String userId = getRequest().getParameter("userId");
		String limitOrderDateStart = getRequest().getParameter("limitOrderDateStart");
		String limitOrderDateEnd = getRequest().getParameter("limitOrderDateEnd");
		String orderStatus = getRequest().getParameter("orderStatus");
		
		List<java.util.Map<String,Object>> list = service.findOrdersByArgs(outdatedOrderShow == null, userId, limitOrderDateStart, limitOrderDateEnd, orderStatus);
		
		chResponse.setResult(OP_SUCCESS);
		chResponse.setMsg("OP_SUCCESS");
		chResponse.setData(list);
		return json();
	}
	
	public String cancelOrder(){
		
		String userId = getUserId();
		TNUser user = new UserDao().find(userId);
		String orderId = getRequest().getParameter("orderId");
		String password = getRequest().getParameter("Password");
		
		if(!StringUtil.isEmpty(user.getUserName()) && !StringUtil.isEmpty(password)) {
			msg = "该用户已经注册，登录用户名或密码错误";
			UserService userServ = new UserService();
			chResponse = userServ.login(user.getUserName(), password);
			if(OP_SUCCESS.equals(chResponse.getResult())) {
				userInfo = (UserInfo)chResponse.getData();
				msg = "用户验证成功";
				chResponse = new CHResponse();
				Order order = new OrderDao().find(orderId);
				if(order.cancel()){
					chResponse.setResult(OP_SUCCESS);
					chResponse.setMsg("订单取消完成");
				}else{
					chResponse.setResult(OP_FAIL);
					chResponse.setMsg("订单取消异常，请联系客服");
				}
			}else{
				chResponse = new CHResponse();
				//失败
				chResponse.setResult(OP_FAIL);
				chResponse.setMsg("用户验证失败");
				
			}
		}
		
		return json();
	}
}

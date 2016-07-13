package cn.com.chinaccs.action;

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

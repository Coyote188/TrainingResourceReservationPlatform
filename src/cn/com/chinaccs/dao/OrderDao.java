package cn.com.chinaccs.dao;

import java.util.List;

import cn.com.chinaccs.bean.driver.Order;
import cn.com.chinaccs.dao.impl.BaseDaoImpl;

public class OrderDao extends BaseDaoImpl<Order> {
	/**
	 * 订单查询
	 * @param isOutdatedOrderShow 是否显示已过时效订单
	 * @param userId 针对用户订单查询
	 * @param limitOrderDateStart 查询订单开始时间 (yyyy/MM/dd)
	 * @param limitOrderDateEnd 查询订单结束时间 (yyyy/MM/dd)
	 * @param orderStatus 返回订单状态
	 * @return
	 */
	public List<Object> findOrdersByArgs(boolean isOutdatedOrderShow, String userId, String limitOrderDateStart,String limitOrderDateEnd, String orderStatus){
		
		String sql = "";
		sql += " SELECT";
		sql += " a.id AS order_id,";
		sql += " a.order_date AS order_date,";
		sql += " a.serial_nbr AS serial,";
		sql += " a.order_status AS state,";
		sql += " a.order_amount AS order_money,";
		sql += " a.order_payment AS payment_id,";
		sql += " a.order_detail AS detail_id,";
		sql += " a.status_date AS state_date,";
		sql += " a.pre_status AS pre_state,";
		sql += " a.order_user AS cust_id,";
		sql += " d.pic AS vehiche_pic,";
		sql += " b.license_level AS lv,";
		sql += " b.training_field AS field_id,";
		sql += " b.instruction_vehicle AS vehicle_id,";
		sql += " b.instruction_vehicle_money AS vehicle_money,";
		sql += " DATE_FORMAT(b.training_start_time,'%Y年%m月%d日 %H时') AS training_st,";
		sql += " DATE_FORMAT(b.training_end_time,'%Y年%m月%d日 %H时') AS training_nd,";
		sql += " b.duration AS duration,";
		sql += " c.call_name AS cust_name,";
		sql += " c.mobile_no AS mobile,";
		sql += " c.id_no AS id_no,";
		sql += " c.id_type AS id_type,";
		sql += " c.license AS reg_license,";
		sql += " c.user_name AS sys_username,";
		sql += " d.bands AS vehicle_bands,";
		sql += " d.model AS vehicle_model,";
		sql += " d.price AS vehicle_price,";
		sql += " d.description AS description,";
		sql += " d.belong AS area,";
		sql += " e.pay_serial AS pay_serial,";
		sql += " e.payment_method AS pay_method,";
		sql += " e.status_date AS payment_state_date,";
		sql += " e.time_received AS payment_recv_time";
		sql += " FROM";
		sql += " t_order_payment AS e";
		sql += " RIGHT JOIN t_order AS a ON e.id = a.order_payment,";
		sql += " t_order_detail AS b,";
		sql += " t_n_user AS c,";
		sql += " instruction_vehicle_infomation AS d";
		sql += " WHERE";
		sql += " a.order_detail = b.id";
		sql += " AND a.order_user = c.id";
		sql += " AND b.instruction_vehicle = d.id";
		if(null != userId && !userId.isEmpty()){
			sql += " AND c.id = '" + userId + "'";
		}
		if(null != limitOrderDateStart){
			sql += " and a.order_date > STR_TO_DATE('" + limitOrderDateStart + "','%Y/%m/%d')";
		}
		if(null != limitOrderDateEnd){
			sql += " and a.order_date < STR_TO_DATE('" + limitOrderDateEnd + "','%Y/%m/%d')";
		}
		if(null != orderStatus && !orderStatus.isEmpty()){
			sql += " and a.order_status = '" + orderStatus + "'";
		}
		if(isOutdatedOrderShow){
			sql += " and b.training_end_time > now()";
		}
		
		return queryObjSql(sql);
	}
}

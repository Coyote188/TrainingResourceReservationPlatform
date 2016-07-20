package cn.com.chinaccs.bean.driver;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.dao.OrderDao;
import cn.com.chinaccs.dao.OrderDetailDao;
import cn.com.chinaccs.utils.IDGen;
import cn.com.chinaccs.utils.SystemConstant;
/**
 * 订单
 * @author Tsui
 *
 */
@Entity
@Table(name="t_order")
public class Order extends BaseBeanImpl{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4982535263865837712L;
	
	private String id;
	//订单时间
	private java.sql.Timestamp orderDate;
	//订单编号
	private String serialNbr; 
	//订单状态 未付款、已付款、已退款
	private String orderStatus;
	//订单金额
	private BigDecimal orderAmount;
	//下单人id
	private String orderUser;
	//支付详情
	private String orderPayment;
	//订单详情
	private String orderDetail;
	//订单状态变更时间
	private java.sql.Timestamp statusDate;
	//前状态
	private String preStatus;
	
	//Order Opera
	public Order newOrder(String orderUser){
		Order order = new Order(IDGen.getId());
		order.setOrderUser(orderUser);
		order.setOrderStatus(SystemConstant.ORDER_STATUS_START);
		order.setStatusDate(new java.sql.Timestamp(System.currentTimeMillis()));
		/*
		 * 订单详情
		 */
		OrderDetail detail = new OrderDetail();
		String detailId = detail.save();
		order.setOrderDetail(detailId);
		/*
		 * 支付
		 */
		OrderPayment payment = new OrderPayment();
		String paymentId = payment.save();
		order.setOrderPayment(paymentId);
		
		order.save();
		return order;
	}
	public OrderDetail loadDetail(){
		OrderDetailDao dao = new OrderDetailDao();
		return dao.find(this.getOrderDetail());
	}
	private String save(){
		this.setId(IDGen.getId());
		OrderDao dao = new OrderDao();
		dao.persist(this);
		
		return this.getId();
	};
	public boolean update(){
		OrderDao dao = new OrderDao();
		return dao.update(this);
	}
	public Order load(){
		OrderDao dao = new OrderDao();
		return dao.find(this.getId());
	}
	
	
	public boolean cancel(){
		OrderDetail detail = this.loadDetail();
		TrainingSourceLock lock = null;
		if(null != detail.getInstructionVehicleLock()){
			lock = TrainingSourceLock.load(detail.getInstructionVehicleLock());
			lock.unhold();
		}
		if(null != detail.getTrainingFieldLock()){
			lock = TrainingSourceLock.load(detail.getTrainingFieldLock());
			lock.unhold();
		}
		if(null != detail.getCoachLock()){
			lock = TrainingSourceLock.load(detail.getCoachLock());
			lock.unhold();
		}
		this.setOrderStatus(SystemConstant.ORDER_STATUS_CANCELED);
		return this.update();
	}
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(String orderId) {
		this.id = orderId;
	}
	
	@Override
	@Id
	@Column(name="id")
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	/**
	 * @return the orderDate
	 */
	@Column(name="order_date")
	public java.sql.Timestamp getOrderDate() {
		return orderDate;
	}

	/**
	 * @return the serialNbr
	 */
	@Column(name="serial_nbr")
	public String getSerialNbr() {
		return serialNbr;
	}

	/**
	 * @return the orderStatus
	 */
	@Column(name="order_status")
	public String getOrderStatus() {
		return orderStatus;
	}

	/**
	 * @return the orderAmount
	 */
	@Column(name="order_amount")
	public BigDecimal getOrderAmount() {
		return orderAmount;
	}

	/**
	 * @return the orderUser
	 */
	@Column(name="order_user")
	public String getOrderUser() {
		return orderUser;
	}

	/**
	 * @return the orderPayment
	 */
	@Column(name="order_payment")
	public String getOrderPayment() {
		return orderPayment;
	}

	/**
	 * @return the orderDetail
	 */
	@Column(name="order_detail")
	public String getOrderDetail() {
		return orderDetail;
	}

	/**
	 * @return the statusDate
	 */
	@Column(name="status_date")
	public java.sql.Timestamp getStatusDate() {
		return statusDate;
	}

	/**
	 * @return the preStatus
	 */
	@Column(name="pre_status")
	public String getPreStatus() {
		return preStatus;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(java.sql.Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * @param serialNbr the serialNbr to set
	 */
	public void setSerialNbr(String serialNbr) {
		this.serialNbr = serialNbr;
	}

	/**
	 * @param orderStatus the orderStatus to set
	 */
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	/**
	 * @param orderAmount the orderAmount to set
	 */
	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}

	/**
	 * @param orderUser the orderUser to set
	 */
	public void setOrderUser(String orderUser) {
		this.orderUser = orderUser;
	}

	/**
	 * @param orderPayment the orderPayment to set
	 */
	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}

	/**
	 * @param orderDetail the orderDetail to set
	 */
	public void setOrderDetail(String orderDetail) {
		this.orderDetail = orderDetail;
	}

	/**
	 * @param statusDate the statusDate to set
	 */
	public void setStatusDate(java.sql.Timestamp statusDate) {
		this.statusDate = statusDate;
	}

	/**
	 * @param preStatus the preStatus to set
	 */
	public void setPreStatus(String preStatus) {
		this.preStatus = preStatus;
	}

	
	
}

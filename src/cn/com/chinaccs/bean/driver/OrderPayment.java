package cn.com.chinaccs.bean.driver;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.dao.OrderPaymentDao;
import cn.com.chinaccs.utils.IDGen;

/**
 * 订单缴费
 * @author Coyote
 *
 */
@Entity
@Table(name="t_order_payment")
public class OrderPayment extends BaseBeanImpl {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4843329621486963107L;
	private String id;
	//缴费时间
	private java.sql.Timestamp timeReceived;
	//缴费金额
	private BigDecimal moneyReceived;
	//缴费方式（银联--指定银行）
	private String paymentMethod;
	//缴费状态--成功、失败、未缴费（进行中）
	private String payStatus;
	//状态变更时间
	private java.sql.Timestamp statusDate;
	//银行缴费返回流水
	private String paySerial;
	//银行缴费返回详情
	private String payResult;
	//银行缴费请求详情
	private String payRequest;
	
	public String save(){
		this.setId(IDGen.getId());
		
		OrderPaymentDao dao = new OrderPaymentDao();
		dao.persist(this);
		return this.getId();
	};
	public boolean update(){
		OrderPaymentDao dao = new OrderPaymentDao();
		return dao.update(this);
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
	 * @return the timeReceived
	 */
	@Column(name="time_received")
	public java.sql.Timestamp getTimeReceived() {
		return timeReceived;
	}

	/**
	 * @return the moneyReceived
	 */
	@Column(name="money_received")
	public BigDecimal getMoneyReceived() {
		return moneyReceived;
	}

	/**
	 * @return the paymentMethod
	 */
	@Column(name="payment_method")
	public String getPaymentMethod() {
		return paymentMethod;
	}

	/**
	 * @return the payStatus
	 */
	@Column(name="pay_status")
	public String getPayStatus() {
		return payStatus;
	}

	/**
	 * @return the statusDate
	 */
	@Column(name="status_date")
	public java.sql.Timestamp getStatusDate() {
		return statusDate;
	}

	/**
	 * @return the paySerial
	 */
	@Column(name="pay_serial")
	public String getPaySerial() {
		return paySerial;
	}

	/**
	 * @return the payResult
	 */
	@Column(name="pay_result")
	public String getPayResult() {
		return payResult;
	}

	/**
	 * @return the payRequest
	 */
	@Column(name="pay_request")
	public String getPayRequest() {
		return payRequest;
	}

	/**
	 * @param timeReceived the timeReceived to set
	 */
	public void setTimeReceived(java.sql.Timestamp timeReceived) {
		this.timeReceived = timeReceived;
	}

	/**
	 * @param moneyReceived the moneyReceived to set
	 */
	public void setMoneyReceived(BigDecimal moneyReceived) {
		this.moneyReceived = moneyReceived;
	}

	/**
	 * @param paymentMethod the paymentMethod to set
	 */
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	/**
	 * @param payStatus the payStatus to set
	 */
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	/**
	 * @param statusDate the statusDate to set
	 */
	public void setStatusDate(java.sql.Timestamp statusDate) {
		this.statusDate = statusDate;
	}

	/**
	 * @param paySerial the paySerial to set
	 */
	public void setPaySerial(String paySerial) {
		this.paySerial = paySerial;
	}

	/**
	 * @param payResult the payResult to set
	 */
	public void setPayResult(String payResult) {
		this.payResult = payResult;
	}

	/**
	 * @param payRequest the payRequest to set
	 */
	public void setPayRequest(String payRequest) {
		this.payRequest = payRequest;
	}

}

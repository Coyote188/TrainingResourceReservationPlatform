package cn.com.chinaccs.action;

/**
 * 缴费
 * @author Tsui
 *
 */
public class PaymentAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2963633386815832275L;

	public String payment() throws Exception{
		return SUCCESS;
	}
	
	/**
	 * 缴费
	 * @return
	 */
	public String pay(){
		
		return json();
	}
	
	/**
	 * 退费
	 * @return
	 */
	public String reverse(){
		
		return json();
	}
}

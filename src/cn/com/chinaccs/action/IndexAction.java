package cn.com.chinaccs.action;


public class IndexAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6067861336153143680L;

	@Override
	public String execute() throws Exception {
		getUri();
		getUriParam();
		return SUCCESS;
	}
	
	public String sourceListIndex() throws Exception {
		getUri();
		getUriParam();
		return SUCCESS;
	}

}

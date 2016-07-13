package cn.com.chinaccs.action;

public interface IBaseAction {
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list()  throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String show() throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String edit() throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String del() throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String execute() throws Exception;
	
	
}

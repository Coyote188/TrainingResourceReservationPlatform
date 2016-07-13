package cn.com.chinaccs.action;


public abstract class PageAction extends BaseImplAction {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4176486899353208217L;
	protected int page=1;
	protected int startNum=0;
	protected int totalPage=0;
	protected int perSize = PRE_PAGE_SIZE;
	
	public int getPerSize() {
		if(perSize<1) {
			perSize = PRE_PAGE_SIZE;
		}
		return perSize;
	}
	
	/**
	 * 获取当前页---分页
	 * @return
	 */
	public int getPage() {
		if(page<1) {
			page = 1;
		}
		return page;
	}
	
	/**
	 * 获取开始数据---分页
	 * @return
	 */
	public int getStartNum() {
		startNum = (getPage()-1)*getPerSize();
		return startNum;
	}
	
	/**
	 * 获取开始数据---分页
	 * @return
	 */
	public int getStartNum(int perSize) {
		startNum = (getPage()-1)*perSize;
		return startNum;
	}

	public void setPerSize(int perSize) {
		this.perSize = perSize;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	

}

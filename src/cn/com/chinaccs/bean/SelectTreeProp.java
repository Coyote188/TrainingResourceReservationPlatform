package cn.com.chinaccs.bean;

public class SelectTreeProp{

	private String id;
	
	private String name;
	
	private String parentId;
	
	private String isCheck;  //是否选中 1--选中；-1--未选中

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	
}

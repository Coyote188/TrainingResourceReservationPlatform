package cn.com.chinaccs.bean;


public class TreeProp extends BaseBeanImpl implements BaseTree {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4097284568878637860L;

	private String id;
	
	private String name;
	
	private String parentId;
	
	private String flag;
	
	private Integer seqNum;
	
	private String uri;

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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Integer getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(Integer seqNum) {
		this.seqNum = seqNum;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
	
}

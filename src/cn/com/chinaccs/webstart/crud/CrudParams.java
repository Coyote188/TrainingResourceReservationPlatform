package cn.com.chinaccs.webstart.crud;

/**
 * @author fddi
 * 
 */
public class CrudParams {
	public static String TYPE_LIKE = "termLike";
	public static String TYPE_LEFT_LIKE = "termLeftLike";
	public static String TYPE_RIGHT_LIKE = "termRightLike";
	public static String TYPE_EQUAL = "termEqual";
	public String type;
	public String value;

	public CrudParams(String type, String value) {
		this.type = type;
		this.value = value;
	}
}

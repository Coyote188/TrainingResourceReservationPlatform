package cn.com.chinaccs.valid;

/**
 * 验证器
 * @author lmq
 *
 */
public interface Validator {

	public boolean validate() throws ValidateException;
	
}

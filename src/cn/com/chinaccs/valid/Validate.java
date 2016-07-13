package cn.com.chinaccs.valid;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 验证注释
 * @author lmq
 *
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface Validate {

	/**
	 * 是否为空
	 * @return
	 */
	public boolean nullable() default true;
	
	/**
	 * 数据长度(只能验证字符数据类型的数据)
	 * @return
	 */
	public String length() default "";
	
	/**
	 * 数据格式类型
	 * @return
	 */
	public String dataFormatType() default "";
	
	/**
	 * 正则表达式
	 * @return
	 */
	public String regexExpr() default "";
	
	/**
	 * 自定义验证类
	 * @return
	 */
	public String className() default "";
	
}

package cn.com.chinaccs.valid;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import cn.com.chinaccs.utils.IPUtil;
import cn.com.chinaccs.utils.IdCardValidator;
import cn.com.chinaccs.utils.StringUtil;

/**
 * 执行验证器
 * @author lmq
 *
 */
public class ExecuteValidator implements Validator {
	
	private static final Logger log = Logger.getLogger(ExecuteValidator.class);

	private Object obj;
	
    private Method[] methods;
	
	public ExecuteValidator(Object obj) {
		this.obj = obj;
		init();
	}
	
	public void init() {
		if(null != obj) {
			this.methods = obj.getClass().getDeclaredMethods();
		}
	}
	
	@Override
	public boolean validate() throws ValidateException {
		boolean is = true;
		if(methods.length>0) {
			for (Method m : methods) {
				if(m.getName().startsWith("get")) {
					try { 
						Object value = m.invoke(obj, new Object[]{});
						Validate v = m.getAnnotation(Validate.class);
					    if(null != v) {
					    	//判断字段是否可为空
					    	if(v.nullable()) {
					    		is = is && true;
					    	} else {
								if(null != value && !StringUtil.isEmpty(value.toString())) {
									is = is && true;
								} else {
									is = is && false;
								}
					    	}
					    	//只验证字符数据类型，其他数据类型不验证
					    	if(is && (value instanceof String) && 
					    			null != value && 
					    			!StringUtil.isEmpty(value.toString())) {
					    		
					    		//验证长度
					    		String len = v.length();
					    		if(!StringUtil.isEmpty(len)) {
					    			is =  is && checkLength(value.toString(), len);
					    		}
					    		if(!is) break;
					    		//验证正则表达式
					    		String regexExpr = v.regexExpr();
					    		if(!StringUtil.isEmpty(regexExpr)) {
					    			try {
						    			Pattern p = Pattern.compile(regexExpr);
						    			Matcher mt = p.matcher(value.toString());
						    			is = is && mt.matches();
						    			if(!is) {
						    				log.info("表达式匹配失败");
						    			}
					    			} catch (Exception e) {
										e.printStackTrace();
										is = false;
										throw new ValidateException("Validate.regexExpr属性配置错误[正则表达式错误]");
									}
					    		}
					    		if(!is) break;
					    		//验证数据格式
					    		String formatType = v.dataFormatType();
					    		if(!StringUtil.isEmpty(formatType)) {
					    			is = is && checkDataFormat(value.toString(),formatType);
					    		}
					    		
					    		if(!is) break;
					    		//判断是否配置了自定义验证类
					    		String className = v.className();
					    		if(!StringUtil.isEmpty(className)) {
					    			//执行自定义验证类
									Class<?> cstClass = Class.forName(className);
									CustomValidator cv;
									cv = (CustomValidator)cstClass.newInstance();
									cv.setObj(obj);
									cv.setValue(value);
									is = is && cv.validate();
									if(!is) {
					    				log.info("自定义类验证失败");
					    			}
					    		}
					    	} else {
					    		break;
					    	}
					    }//if
					}catch (IllegalArgumentException e) {
						is = false;
						e.printStackTrace();
						throw new ValidateException(e.getMessage());
					} catch (IllegalAccessException e) {
						is = false;
						e.printStackTrace();
						throw new ValidateException(e.getMessage());
					} catch (InvocationTargetException e) {
						is = false;
						e.printStackTrace();
						throw new ValidateException(e.getMessage());
					} catch (ClassNotFoundException e) {
						is = false;
						e.printStackTrace();
						throw new ValidateException(e.getMessage());
					}  catch (InstantiationException e) {
						is = false;
						e.printStackTrace();
						throw new ValidateException(e.getMessage());
					}
				}//if[get]
			}//for
		}//if
		return is;
	}
	
	
	/**
	 * 
	 * @param value
	 * @param len
	 * @return
	 * @throws ValidateException
	 */
	private boolean checkLength(String value,String len) throws ValidateException{
		boolean is = false;
		long valueLen = value.length();
		if(len.indexOf("|")>-1) {
			String[] lens = len.split("\\|");
			for (String lenStr : lens) {
				if(StringUtil.isNum(lenStr.trim())) {
					long l = Long.parseLong(lenStr.trim());
					is = (valueLen == l);
				} else {
					is = false;
					throw new ValidateException("Validate.length属性配置错误");
				}
				if(is) {
					break;
				}
			}
		} else if(len.indexOf(",")>-1) {
			String[] lens = len.split(",");
			if(lens.length==2) {
				if(StringUtil.isNum(lens[0].trim()) && StringUtil.isNum(lens[1].trim())) {
					long startLen = Long.parseLong(lens[0].trim());
					long endLen = Long.parseLong(lens[1].trim());
					if(startLen<=endLen) {
					    is = (valueLen >= startLen && valueLen<=endLen);
					} else {
						is = false;
						throw new ValidateException("Validate.length属性配置错误");
					}
				} else {
					is = false;
					throw new ValidateException("Validate.length属性配置错误");
				}
			} else {
				is = false;
				throw new ValidateException("Validate.length属性配置错误");
			}
		} else {
			if(StringUtil.isNum(len.trim())) {
				is = is && (valueLen == Long.parseLong(len.trim()));
			} else {
				is = false;
				throw new ValidateException("Validate.length属性配置错误");
			}
		}
		if(!is) {
			log.info("长度验证失败");
		}
		return is;
	}
	
	
	/**
	 * 验证数据类型
	 * @param value
	 * @param dataFormatType
	 * @return
	 */
	private boolean checkDataFormat(String value,String dataFormatType) {
		boolean is = true;
		if(DataFormatType.NUM.equals(dataFormatType)) {
			is = is && StringUtil.isNum(value);
			if(!is) {
				log.error("["+DataFormatType.NUM+"]数据类型验证失败");
			}
		} else if(DataFormatType.CHINESE.equals(dataFormatType)) {
			is = is && StringUtil.isChinese(value);
			if(!is) {
				log.error("["+DataFormatType.CHINESE+"]数据类型验证失败");
			}
		} else if(DataFormatType.CARD_NO.equals(dataFormatType)) {
			IdCardValidator iv = new IdCardValidator();
			is = is && iv.isValidatedAllIdcard(value);
			iv = null;
			if(!is) {
				log.error("["+DataFormatType.CARD_NO+"]数据格式验证失败");
			}
		} else if(DataFormatType.DECIMAL.equals(dataFormatType)) {
			is = is && StringUtil.isDecimal(value);
			if(!is) {
				log.error("["+DataFormatType.DECIMAL+"]数据格式验证失败");
			}
		} else if(DataFormatType.EMAIL.equals(dataFormatType)) {
			is = is && StringUtil.isEmail(value);
			if(!is) {
				log.error("["+DataFormatType.EMAIL+"]数据格式验证失败");
			}
		} else if(DataFormatType.FIXED_TELPHONE.equals(dataFormatType)) {
			is = is && StringUtil.isFixedTelephone(value);
			if(!is) {
				log.error("["+DataFormatType.FIXED_TELPHONE+"]数据格式验证失败");
			}
		} else if(DataFormatType.INTEGER.equals(dataFormatType)) {
			is = is && StringUtil.isInteger(value);
			if(!is) {
				log.error("["+DataFormatType.INTEGER+"]数据格式验证失败");
			}
		} else if(DataFormatType.IP.equals(dataFormatType)) {
			is = is && IPUtil.checkIp(value);
			if(!is) {
				log.error("["+DataFormatType.IP+"]数据格式验证失败");
			}
		} else if(DataFormatType.MOBILE_PHONE.equals(dataFormatType)) {
			is = is && StringUtil.isPhoneNO(value);
			if(!is) {
				log.error("["+DataFormatType.MOBILE_PHONE+"]数据格式验证失败");
			}
		} else if(DataFormatType.QQ.equals(dataFormatType)) {
			is = is && StringUtil.isQQ(value);
			if(!is) {
				log.error("["+DataFormatType.QQ+"]数据格式验证失败");
			}
		}
		return is;
	}

	public void setObj(Object obj) {
		this.obj = obj;
		init();
	}

}

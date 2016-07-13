package cn.com.chinaccs.action;

import java.io.ByteArrayInputStream;

import cn.com.chinaccs.utils.Captcha;

/**
 * 验证码
 * @date 2011-6-24 上午09:45:21
 * 
 * @author lmq
 *
 */
public class CaptchaAction extends BaseImplAction {

	private static final long serialVersionUID = 4613753196300181532L;
	private ByteArrayInputStream inputStream;
	private String capType;
	private String num;

	public String execute() throws Exception {
		try {
			log.info("正在生成验证码-----");
			Captcha cap = Captcha.Instance(85,28,20);
			log.info("正在生成验证码--[完成]---");
			this.setInputStream(cap.getImage());// 取得带有随机字符串的图片
			String str = cap.getString().toString();
			setSession(SESSION_CAPTCHA_LOGIN, str);
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public String getCapType() {
		return capType;
	}

	public void setCapType(String capType) {
		this.capType = capType;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
}

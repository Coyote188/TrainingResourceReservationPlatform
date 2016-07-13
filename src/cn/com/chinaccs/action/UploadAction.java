package cn.com.chinaccs.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import cn.com.chinaccs.conf.InitConfig;
import cn.com.chinaccs.utils.StringUtil;


public class UploadAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4953861694059598341L;
	
	private static final int FILE_SIZE = 100 * 1024;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	private List<File> uploadMFile;
	private List<String> uploadMFileContentType;
	private List<String> uploadMFileFileName;
	
	private String uploadDir = InitConfig.getInstance().getValue("upload.dir");
	
	public String execute() throws Exception {
		log.info("正在上传文件");
		if(null != upload) {
			if (!StringUtil.isEmpty(uploadFileName)) {
				String extTmp = uploadFileName.substring(
						uploadFileName.lastIndexOf(".") + 1,
						uploadFileName.length());
			    
			}
		}
		
		if("json".equals(returnType)) {
			return json();
		}
		return SUCCESS;
	}
	
	
	protected boolean upload(File source, File target) {
		InputStream in = null;
		OutputStream out = null;
		boolean is = false;
		try {
			in = new BufferedInputStream(new FileInputStream(source), FILE_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(target),FILE_SIZE);
			byte[] image = new byte[FILE_SIZE];
			while (in.read(image) > 0) {
				out.write(image);
			}
			in.close();
			out.close();
			is = true;
		} catch (IOException ex) {
			log.info("保存文件异常....");
			ex.printStackTrace();
			try {
				if(null != in)
				   in.close();
			    if(null != out)
				   out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return is;
	}
	
}

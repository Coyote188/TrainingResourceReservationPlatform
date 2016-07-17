package cn.com.chinaccs.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.service.spi.ServiceException;

import cn.com.chinaccs.bean.CHResponse;
import cn.com.chinaccs.bean.UploadFileInfo;
import cn.com.chinaccs.bean.entity.TNAttachment;
import cn.com.chinaccs.conf.InitConfig;
import cn.com.chinaccs.dao.impl.AttachmentDao;
import cn.com.chinaccs.utils.ArrayUtil;
import cn.com.chinaccs.utils.DateUtil;
import cn.com.chinaccs.utils.FileUtil;
import cn.com.chinaccs.utils.StringUtil;
import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicMatch;

public class PictureUploadAction extends BaseImplAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;
	private String attId;

	public String getAttId() {
		return attId;
	}

	public void setAttId(String attId) {
		this.attId = attId;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void getImg() {

		HttpServletResponse response = ServletActionContext.getResponse();

		String filePath = InitConfig.getInstance().getValue("root.dir");
		AttachmentDao dao = new AttachmentDao();
		TNAttachment att = dao.find(attId);

		if (null == att)
			return;
		filePath += att.getFilePath();
		response.setContentType(att.getFileType());
		FileInputStream fis = null;
		OutputStream os = null;
		try {
			fis = new FileInputStream(filePath);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while ((count = fis.read(buffer)) != -1) {
				os.write(buffer, 0, count);
				os.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
				os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String upload() {
		String userId = getUserBySession().getId();
		String contentType = "";
		MagicMatch match;
		try {
			match = Magic.getMagicMatch(upload, false, true);
			contentType = match.getMimeType();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		TNAttachment att = fileUpload(upload, contentType, "123.png", userId);
		if (null != att) {
			chResponse.setResult(OP_SUCCESS);
			chResponse.setMsg(OP_SUCCESS_MSG);
			chResponse.setData(att);
		} else
			chResponse.setMsg("文件上传失败，请重新添加！");

		return json();
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 * @param contentType
	 *            文件类型
	 * @param uploadFileName
	 *            原文件名
	 * @param destFileName
	 *            文件名(不含后缀)
	 * @param destDir
	 *            保存目录
	 * @param userId
	 *            用户ID
	 * @return
	 * @exception ServiceException
	 */
	protected TNAttachment fileUpload(File file, String contentType, String uploadFileName, String userId)
			throws ServiceException {
		TNAttachment attachment = null;
		chResponse = upload(file, contentType, uploadFileName);
		if (OP_SUCCESS.equals(chResponse.getResult())) {
			attachment = new TNAttachment();
			UploadFileInfo uploadFileInfo = (UploadFileInfo) chResponse.getData();
			attachment.setFileName(uploadFileInfo.getFileName());
			attachment.setFileType(uploadFileInfo.getFileType());
			attachment.setFilePath(uploadFileInfo.getFilePath());
			attachment.setFileSize(uploadFileInfo.getFileSize());
			attachment.setUserId(userId);
			AttachmentDao dao = new AttachmentDao();
			Serializable id = dao.save(attachment);

			if (id != null) {
				attachment.setId(id.toString());
			}
			uploadFileInfo = null;

		}
		return attachment;
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 * @param contentType
	 * @param uploadFileName
	 * @param destFileName
	 * @param uploadDir
	 * @return
	 */
	protected CHResponse upload(File file, String contentType, String uploadFileName) {
		chResponse = new CHResponse();
		if (null != file) {
			upload(file, contentType, uploadFileName, null, null);
		}
		return chResponse;
	}

	protected CHResponse upload(File file, String contentType, String uploadFileName, String destFileName,
			String uploadDir) {
		chResponse = new CHResponse();
		if (null != file) {
			long fileSize = file.length();
			uploadObj(file, contentType, uploadFileName, fileSize, destFileName, uploadDir);
		}
		return chResponse;
	}

	/**
	 * 上传文件
	 * 
	 * @param inputStream
	 * @param contentType
	 * @param uploadFileName
	 * @param fileSize
	 * @return
	 */
	protected CHResponse upload(InputStream inputStream, String contentType, String uploadFileName, long fileSize) {
		chResponse = new CHResponse();
		if (null != inputStream) {
			upload(inputStream, contentType, uploadFileName, fileSize, null, null);
		}
		return chResponse;
	}

	/**
	 * 上传文件
	 * 
	 * @param inputStream
	 * @param contentType
	 * @param uploadFileName
	 * @param fileSize
	 * @param destFileName
	 * @param uploadDir
	 * @return
	 */
	protected CHResponse upload(InputStream inputStream, String contentType, String uploadFileName, long fileSize,
			String destFileName, String uploadDir) {
		chResponse = new CHResponse();
		if (null != inputStream) {
			uploadObj(inputStream, contentType, uploadFileName, fileSize, destFileName, uploadDir);
		}
		return chResponse;
	}

	/**
	 * 验证图片类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkImageType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String imageType = InitConfig.getInstance().getValue("upload.image.type");
			if (!StringUtil.isEmpty(imageType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(imageType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.image.type]属性,所以不支持改该类文件的上传");
			}
		}
		return is;
	}

	/**
	 * 验证文档类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkDocType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String docType = InitConfig.getInstance().getValue("upload.doc.type");
			if (!StringUtil.isEmpty(docType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(docType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.doc.type]属性,所以不支持改该类文件的上传");
			}
		}
		return is;
	}

	/**
	 * 验证视频文件类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkVideoType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String videoType = InitConfig.getInstance().getValue("upload.video.type");
			if (!StringUtil.isEmpty(videoType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(videoType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.video.type]属性,所以不支持改该类文件的上传");
			}
		}
		return is;
	}

	/**
	 * 验证视频文件类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkAudioType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String audioType = InitConfig.getInstance().getValue("upload.audio.type");
			if (!StringUtil.isEmpty(audioType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(audioType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.audio.type]属性,所以不支持改该类文件的上传");
			}
		}
		return is;
	}

	/**
	 * 验证视频文件类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkFileType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String fileType = InitConfig.getInstance().getValue("upload.file.type");
			if (!StringUtil.isEmpty(fileType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(fileType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.file.type]属性,无法验证该文件类型");
			}
		}
		return is;
	}

	/**
	 * 验证app文件类型
	 * 
	 * @param fileSuffix
	 * @return
	 */
	protected boolean checkAppType(String fileSuffix) {
		boolean is = false;
		if (!StringUtil.isEmpty(fileSuffix)) {
			String fileType = InitConfig.getInstance().getValue("upload.app.type");
			if (!StringUtil.isEmpty(fileType)) {
				is = ArrayUtil.isArrayContainsIgnoreCase(fileType, fileSuffix, ",");
			} else {
				log.error("配置文件中没定义[upload.app.type]属性,无法验证该文件类型");
			}
		}
		return is;
	}

	/**
	 * 上传文件
	 * 
	 * @param is
	 * @param contentType
	 * @param uploadFileName
	 * @param fileSize
	 * @param destFileName
	 * @param uploadDir
	 * @return
	 */
	private CHResponse uploadObj(Object obj, String contentType, String uploadFileName, long fileSize,
			String destFileName, String uploadDir) {
		chResponse = new CHResponse();
		String msg = null;
		if (!StringUtil.isEmpty(uploadFileName)) {
			String extTmp = StringUtil.getFileSuffix(uploadFileName);
			UploadFileInfo uploadFileInfo = new UploadFileInfo();
			uploadFileInfo.setFileName(uploadFileName);

			uploadFileInfo.setFileType(extTmp);
			if (checkImageType(extTmp)) {
				if (StringUtil.isEmpty(uploadDir)) {
					uploadDir = getImageDir();
				}
			} else if (checkAppType(extTmp)) {
				if (StringUtil.isEmpty(uploadDir)) {
					uploadDir = getAppDir();
				}
			} else {
				uploadDir = null;
			}
			if (StringUtil.isEmpty(uploadDir)) {
				msg = "“" + uploadFileName + "”文件类型不支持上传";
				log.error(msg);
				chResponse.setMsg("文件类型不支持上传");
			} else {
				File dirFile = new File(uploadDir);
				if (!dirFile.exists()) {
					dirFile.mkdirs();
				}
				dirFile = null;
				if (fileSize > getUploadMaxSize()) {
					msg = "“" + uploadFileName + "”文件太大，不支持上传";
					log.error(msg);
					chResponse.setMsg("文件太大，不支持上传");
				} else {
					String targetFileName = StringUtil.createSerialNum() + "." + extTmp;
					if (!StringUtil.isEmpty(destFileName)) {
						targetFileName = destFileName + "." + extTmp;
					}
					String targetFilePath = uploadDir + FileUtil.getFileSeparator() + targetFileName;
					Timestamp up_time = new Timestamp(System.currentTimeMillis());
					DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
					String relativePath = "/" +"Documents" + "/" + uploadDir + "/" + format.format(up_time) + "/";
					String path = ServletActionContext.getServletContext().getRealPath(relativePath);
					targetFilePath = path+ FileUtil.getFileSeparator() + targetFileName;
					log.info("文件上传path："+path);
					File targetFile = new File(targetFilePath);
					boolean is = false;
					if (obj instanceof InputStream) {
						is = saveUploadFile((InputStream) obj, targetFile);
					} else {
						is = saveUploadFile((File) obj, targetFile);
					}
					if (is) {// 保存文件到磁盘
						targetFilePath = targetFilePath.replace(getRootDir(), "");
						uploadFileInfo.setFilePath(relativePath + targetFileName);
						uploadFileInfo.setCreateTime(DateUtil.dateToStr(new Date(), null));
						uploadFileInfo.setFileSize(fileSize);
						uploadFileInfo.setFileType(contentType);
						chResponse.setResult(OP_SUCCESS);
						msg = "“" + uploadFileName + "”文件上传成功";
						log.info(msg);
						chResponse.setMsg(msg);
					}
					targetFile = null;
				}
			} // if/else
			chResponse.setData(uploadFileInfo);
			uploadFileInfo = null;
		}
		return chResponse;
	}

	/**
	 * 根目录
	 * 
	 * @return
	 */
	protected String getRootDir() {
		return InitConfig.getInstance().getValue("root.dir");
	}

	/**
	 * 获取存放图片的路径
	 * 
	 * @return
	 */
	protected String getImageDir() {
		String dirPath = InitConfig.getInstance().getValue("upload.images.dir");
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		dir = null;
		return dirPath;
	}

	/**
	 * 获取存放app的路径
	 * 
	 * @return
	 */
	protected String getAppDir() {
		String dirPath = InitConfig.getInstance().getValue("upload.app.dir");
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		dir = null;
		return dirPath;
	}

	/**
	 * 获取存放其他文件的路径
	 * 
	 * @return
	 */
	protected String getOtherDir() {
		String dirPath = InitConfig.getInstance().getValue("upload.other.dir");
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		dir = null;
		return dirPath;
	}

	/**
	 * 获取支持上传文件的最大文件大小
	 * 
	 * @return
	 */
	protected long getUploadMaxSize() {
		String sizeStr = InitConfig.getInstance().getValue("upload.max.size");
		long size = 0;
		try {
			size = Long.parseLong(sizeStr);
		} catch (Exception e) {
			size = 1024 * 1024 * 1000;
		}
		return size;
	}

	/**
	 * 保存上传的文件服务器
	 * 
	 * @param source
	 * @param target
	 * @return
	 */
	protected boolean saveUploadFile(InputStream source, File target) {
		boolean is = false;
		log.info("正在保存文件...");
		try {
			if (null != source) {
				BufferedInputStream bis = new BufferedInputStream(source);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
				bis.close();
				bos.close();
				is = true;
			}
			log.info("文件保存[成功]....");
		} catch (IOException ex) {
			log.info("保存文件[异常]...");
			ex.printStackTrace();
		}
		return is;
	}

	/**
	 * 保存上传的文件服务器
	 * 
	 * @param source
	 * @param target
	 * @return
	 */
	protected boolean saveUploadFile(File source, File target) {
		boolean is = false;
		log.info("正在保存文件...");
		try {
			FileUtils.copyFile(source, target);
			is = true;
			log.info("文件保存[成功]....");
		} catch (IOException ex) {
			log.info("保存文件[异常]...");
			ex.printStackTrace();
		}
		return is;
	}

}

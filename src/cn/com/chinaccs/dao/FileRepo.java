package cn.com.chinaccs.dao;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.List;

import javax.imageio.ImageIO;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hslf.HSLFSlideShow;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.hssf.converter.ExcelToHtmlConverter;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.jsoup.Jsoup;
import org.w3c.dom.Document;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;
import com.sun.pdfview.PDFRenderer;

public class FileRepo {
	
	/**
	 * 
	 * @param word
	 * @param filePath
	 * @param outPutFile
	 * @throws Exception 
	 */
	public static String convertWord2Html(File word, String filePath, String outPutFile) throws Exception {
		boolean isppt = checkFile(word);
		if (!isppt) {
			return null;
		}
		HWPFDocument wordDocument = null;
		try {
			wordDocument = new HWPFDocument(new FileInputStream(word));
		} catch (Exception e) {
			throw new Exception(" 文件解析异常，文件格式不符 ");
		}
		
		WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
		wordToHtmlConverter.setPicturesManager(new PicturesManager() {
			public String savePicture(byte[] content, PictureType pictureType, String suggestedName, float widthInches, float heightInches) {
				return "images" + "/" + suggestedName;
			}
		});
		wordToHtmlConverter.processDocument(wordDocument);
		
		List<Picture> pics = wordDocument.getPicturesTable().getAllPictures();
		if (pics != null) {
			for (int i = 0; i < pics.size(); i++) {
				Picture pic = (Picture) pics.get(i);
				try {
					File dir = new File(filePath + "/" + "images" + "/");
					if(!dir.exists()){
						dir.mkdirs();
					}
					pic.writeImageContent(new FileOutputStream(dir.getPath() + "/" + pic.suggestFullFileName()));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
			}
		}
		Document htmlDocument = wordToHtmlConverter.getDocument();

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		DOMSource domSource = new DOMSource(htmlDocument);
		StreamResult streamResult = new StreamResult(out);

		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer serializer = tf.newTransformer();
		serializer.setOutputProperty(OutputKeys.ENCODING, "GB2312");
		serializer.setOutputProperty(OutputKeys.INDENT, "yes");
		serializer.setOutputProperty(OutputKeys.METHOD, "HTML");
		serializer.transform(domSource, streamResult);
		out.close();
		if(writeFile(new String(out.toByteArray()), filePath + "/" + outPutFile))
			return outPutFile;
		else
			return null;
	}
	
	/**
	 * 
	 * @param excel
	 * @param filePath
	 * @param outPutFile
	 * @return
	 * @throws Exception
	 */
	public static String convertExcel2Html(File excel, String filePath, String outPutFile) throws Exception {
		HSSFWorkbook excelDocument = null;
		try {
			 excelDocument = new HSSFWorkbook(new FileInputStream(excel));
		} catch (Exception e) {
			throw new Exception(" 文件解析异常，文件格式不符 ");
		}
		ExcelToHtmlConverter excelToHtmlConverter = new ExcelToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
		excelToHtmlConverter.setOutputColumnHeaders(false);
		excelToHtmlConverter.setOutputRowNumbers(false);
		excelToHtmlConverter.processWorkbook(excelDocument);
		List<HSSFPictureData> pics = excelDocument.getAllPictures();
		if (pics != null) {
			for (int i = 0; i < pics.size(); i++) {
				HSSFPictureData picDate = pics.get(i);
				if (null == picDate) {
					continue;
				}
				byte[] bytes = picDate.getData();
				FileOutputStream output = new FileOutputStream(filePath + "/images/hss_pic_" + i + "." + picDate.suggestFileExtension());
				BufferedOutputStream writer = new BufferedOutputStream(output);
				writer.write(bytes);
				writer.flush();
				writer.close();
				output.close();
			}
		}
		Document htmlDocument = excelToHtmlConverter.getDocument();
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		DOMSource domSource = new DOMSource(htmlDocument);
		StreamResult streamResult = new StreamResult(outStream);
		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer serializer = tf.newTransformer();
		serializer.setOutputProperty(OutputKeys.ENCODING, "GB2312");
		serializer.setOutputProperty(OutputKeys.INDENT, "yes");
		serializer.setOutputProperty(OutputKeys.METHOD, "html");
		serializer.transform(domSource, streamResult);
		outStream.close();
		if(writeFile(new String(outStream.toByteArray()), filePath + "/" + outPutFile))
			return outPutFile;
		else
			return null;
	}
	
	/**
	 * 
	 * @param pdf
	 * @param relaPath
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static String convertPDF2Html(File pdf, String relaPath, String fileName) throws IOException {
		boolean isppt = checkFile(pdf);
		if (!isppt) {
			return null;
		}
		
		PDFFile pdffile = null;
		try {
			RandomAccessFile raf = new RandomAccessFile(pdf, "r");
			FileChannel channel = raf.getChannel();
			MappedByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
			pdffile = new PDFFile(buf);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//write to html
		StringBuffer html = new StringBuffer("<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
		html.append("<title>" + (pdf.getName().substring(0, pdf.getName().indexOf("."))) + "</title>\n");
		html.append("<style>\n<!--\n.img_style{width: 90%;margin-top: 10px 5% 0 5%;}\n-->\n</style>\n</head>\n<body>\n");
		
		for(int pagen = 1; pagen <= pdffile.getNumPages(); pagen++){
			// 设置将第pagen也生成png图片
			PDFPage page = pdffile.getPage(pagen);

			// create and configure a graphics object
			int width = (int) page.getBBox().getWidth();
			int height = (int) page.getBBox().getHeight();
			BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
			Graphics2D g2 = img.createGraphics();
			g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

			// do the actual drawing
			Rectangle _renderer = new Rectangle(0, 0, width, height);
			PDFRenderer renderer = new PDFRenderer(page, g2, _renderer, null, Color.WHITE);
			
			try {
				page.waitForFinish();
			} catch (Exception e) {
				e.printStackTrace();
			}
			renderer.run();

			g2.dispose();

			try {
				String imgName = "Image_" + pagen + ".gif";
				File dir = new File(relaPath + "/images/");
				if(!dir.exists())
					dir.mkdirs();
				ImageIO.write(img, "gif", new File(relaPath + "/images/" + imgName));
				html.append("<p><img src=\"images/" + imgName + "\" class=\"img_style\"></p>\n");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		html.append("</body></html>");
		File htmlFile = new File(relaPath + fileName);
		BufferedWriter o = new BufferedWriter(new FileWriter(htmlFile));
		o.write(html.toString());
		o.close();
		//判断成功
		return fileName;
	}
	
	/**
	 * 转PPT
	 * @param pdf
	 * @param relaPath
	 * @param fileName
	 * @return
	 * @throws Exception 
	 */
	public static String convertPPT2Html(File powerPoint, String relaPath, String fileName) throws Exception {
		boolean isppt = checkFile(powerPoint);
		if (!isppt) {
			return null;
		}
		try {
			FileInputStream is = new FileInputStream(powerPoint);
			HSLFSlideShow hslfSlideShow = null;
			try {
				hslfSlideShow = new HSLFSlideShow(is);
			} catch (Exception e) {
				throw new Exception(" 文件解析异常，文件格式不符 ");
			}
			SlideShow ppt = new SlideShow(hslfSlideShow);
			is.close();
			Dimension pgsize = ppt.getPageSize();
			int i = 1;
			
			//write to html
			StringBuffer html = new StringBuffer("<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
			html.append("<title>云南电信短信营业厅建设技术方案</title>\n");
			html.append("<style>\n<!--\n.img_style{width: 90%;margin-top: 10px 5% 0 5%;}\n-->\n</style>\n</head>\n<body>\n");
			
			for (Slide slide : ppt.getSlides()) {
				System.out.print("第" + i + "页。");

				BufferedImage img = new BufferedImage(pgsize.width,
						pgsize.height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				graphics.setPaint(Color.BLUE);
				graphics.setBackground(slide.getBackground().getFill()
						.getBackgroundColor());
				graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,
						pgsize.height));
				slide.draw(graphics);

				File path = new File(relaPath + "/images/");
				if (!path.exists()) {
					path.mkdir();
				}
				FileOutputStream out = new FileOutputStream(path + "/ppt_pict_" + i + ".jpeg");
				javax.imageio.ImageIO.write(img, "jpeg", out);
				out.close();
				i++;
			}
			
			html.append("</body></html>");
			File htmlFile = new File(relaPath + fileName);
			BufferedWriter o = new BufferedWriter(new FileWriter(htmlFile));
			o.write(html.toString());
			o.close();
			
			return fileName;
		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
		}
		return null;
	}

	public static boolean writeFile(String content, String path) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		org.jsoup.nodes.Document doc = Jsoup.parse(content);
		content = doc.html();
		try {
			File file = new File(path);
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, "GB2312"));
			bw.write(content);
			return true;
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (bw != null)
					bw.close();
				if (fos != null)
					fos.close();
			} catch (IOException ie) {
			}
		}
		return false;
	}
	
	public static boolean checkFile(File file) {

		boolean isDocumentFile = false;
		String filename = file.getName();
		String suffixname = null;
		if (filename != null && filename.indexOf(".") != -1) {
			suffixname = filename.substring(filename.lastIndexOf("."));
			if (suffixname.equals(".ppt") || suffixname.equals(".doc") || suffixname.equals(".pdf")) {
				isDocumentFile = true;
			}
			return isDocumentFile;
		} else {
			return isDocumentFile;
		}
	}
}

package cn.com.chinaccs.webstart.crud;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import cn.com.chinaccs.helper.ObjectTreeHelper;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.webstart.WebStartBusi;
import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

public class CrudBusi extends WebStartBusi implements ICrudBusi {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4736032025678451241L;
	private static final String LOG_TAG = "<webstart--crud>";

	@SuppressWarnings("unchecked")
	@Override
	public String save(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		log.info(LOG_TAG + "保存业务开始------");
		JSONObject json = getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> busi = BaseDao.getInstance();
		try {
			if (busi.save(obj)) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info(LOG_TAG + "保存业务返回------:[" + json + "]");
		return json.toString();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String upd(Object obj, Map<String, Object> params) {
		// TODO Auto-generated method stub
		log.info(LOG_TAG + "更新业务开始------");
		JSONObject json = getJson(RESULT_FAIL, MSG_FAIL);
		IDBDao<Object, String> busi = BaseDao.getInstance();
		try {
			if (busi.update(obj)) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info(LOG_TAG + "更新业务返回------:[" + json + "]");
		return json.toString();
	}

	@Override
	public String del(String sql, List<Map<String, Object>> deleteIds,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		log.info(LOG_TAG + "删除业务开始------");
		JSONObject json = getJson(RESULT_FAIL, MSG_FAIL);
		try {
			if (delete(sql, deleteIds)) {
				json = getJson(RESULT_SCCESS, MSG_SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info(LOG_TAG + "删除业务返回------:[" + json + "]");
		return json.toString();
	}

	@Override
	public void query(HttpServletResponse response, String sql,
			Map<String, Object> params, String sidx, String sord) {
		// TODO Auto-generated method stub
		response.setCharacterEncoding(WebStartBusi.ENCODING_UTF8);
		response.setContentType("text/html");
		JSONObject json = new JSONObject();
		try {
			PrintWriter p = response.getWriter();
			List<Object> list = queryList(sql, params);
			JSONArray rows = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Object[] u = (Object[]) list.get(i);
				JSONObject row = new JSONObject();
				row.put("id", i + 1);
				JSONArray cell = new JSONArray();
				for (int j = 0; j < u.length; j++) {
					cell.add(u[j]);
				}
				row.put("cell", cell);
				rows.add(row);
			}
			json.put("rows", rows);
			log.info(json.toString());
			p.print(json.toString());
			p.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
	}

	@Override
	public void queryPage(HttpServletResponse response, String sql,
			Map<String, Object> params, Integer page, Integer rows,
			String sidx, String sord) {
		// TODO Auto-generated method stub
		response.setCharacterEncoding(WebStartBusi.ENCODING_UTF8);
		response.setContentType("text/html");
		JSONObject json = new JSONObject();
		try {
			PrintWriter p = response.getWriter();
			int totalPage = 0;
			Integer total = Integer.parseInt(WebStartBusi.queryTotal(sql,
					params));
			if (total > 0) {
				if (total <= rows) {
					totalPage = 1;
				} else if (total % rows == 0) {
					totalPage = total / rows;
				} else {
					totalPage = total / rows + 1;
				}
			} else {
				totalPage = 0;
			}
			if (page > totalPage)
				page = totalPage;
			int start = rows * page - rows;
			start = start > 0 ? start : 0;
			List<Object> list = queryListPage(sql, params, start, rows);
			json.put("page", page);
			json.put("total", totalPage);
			json.put("records", total);
			JSONArray arrayRows = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Object[] u = (Object[]) list.get(i);
				JSONObject row = new JSONObject();
				row.put("id", i + 1);
				JSONArray cell = new JSONArray();
				for (int j = 0; j < u.length; j++) {
					if(null != u[j] && u[j] instanceof Date) {
						cell.add(StringUtil.handNull(u[j]).substring(0,StringUtil.handNull(u[j]).length()-2));
					} else {
						cell.add(StringUtil.handNull(u[j]));
					}
				}
				row.put("cell", cell);
				arrayRows.add(row);
			}
			json.put("rows", arrayRows);
			log.info(json.toString());
			p.print(json.toString());
			p.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
	}

	@Override
	public void queryTree(HttpServletResponse response, String sql,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		response.setCharacterEncoding(WebStartBusi.ENCODING_UTF8);
		response.setContentType("text/html");
		JSONObject json = new JSONObject();
		try {
			PrintWriter p = response.getWriter();
			List<Object> list = queryList(sql, params);

			Object obj = new String[]{"0","","0"};
			list = new ObjectTreeHelper().outPutTree(list, obj);
			
			JSONArray rows = new JSONArray();
			Object[] pu = null;
			if(null != list && list.size()>0) {
				for (int i = 0; i < list.size(); i++) {
					Object[] u = (Object[]) list.get(i);
					JSONObject row = new JSONObject();
					row.put("id", i + 1);
					JSONArray cell = new JSONArray();
					for (int j = 3; j < u.length; j++) {
						cell.add(u[j]);
					}
					String id = StringUtil.handNull(u[3]);
					if ((list.size() - 1) == i) {
						cell.add(true);
					} else {
						pu = (Object[]) list.get(i + 1);
						String pid = StringUtil.handNull(pu[pu.length - 1]) ;
						if (id.equals(pid)) {
							cell.add(false);
						} else {
							cell.add(true);
						}
					}
					cell.add(false);
					cell.add(true);
					row.put("cell", cell);
					rows.add(row);
				}
			}
			json.put("rows", rows);
			log.info(json.toString());
			p.print(json.toString());
			p.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
	}

	@Override
	public void exportExcel(String name, String[] titles,
			HttpServletResponse response, String sql, Map<String, Object> params) {
		// TODO Auto-generated method stub
		WritableWorkbook wwb = null;
		WritableSheet sheet = null;
		response.setContentType("application/ms-excel");
		// 判断excel名称为空 ，则用时间序列代替
		String sheetName = String.valueOf(new Date().getTime());
		if (name != null && !name.equals("")) {
			sheetName = name;
		}
		try {
			response.addHeader("Content-Disposition", "attachment; filename="
					+ new String(sheetName.getBytes("GBK"), "ISO-8859-1")
					+ ".xls");
			OutputStream os = response.getOutputStream();
			wwb = Workbook.createWorkbook(os);
			wwb.setProtected(true);

			sheet = wwb.createSheet(sheetName, 0);
			Label label = null;
			// 定义标题单元格样式
			if (titles != null && titles.length > 0) {
				WritableFont wf = new WritableFont(
						WritableFont.createFont("宋体"), 10, WritableFont.BOLD,
						false);
				WritableCellFormat fmTitle = new WritableCellFormat(
						NumberFormats.TEXT);
				fmTitle.setFont(wf);
				fmTitle.setBackground(Colour.GRAY_25);
				fmTitle.setBorder(Border.ALL, BorderLineStyle.THIN,
						Colour.BLACK);
				fmTitle.setAlignment(Alignment.CENTRE);
				fmTitle.setVerticalAlignment(VerticalAlignment.CENTRE);
				fmTitle.setWrap(true);
				// 构建标题
				for (int i = 0; i < titles.length; i++) {
					label = new Label(i, 0, titles[i], fmTitle);
					sheet.addCell(label);
				}
			}
			// 定义常规单元格样式
			WritableCellFormat fm_n = new WritableCellFormat();
			fm_n.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

			// 构建内容
			List<Object> datas = queryList(sql, params);
			for (int i = 0; i < datas.size(); i++) {
				Object[] obj = (Object[]) datas.get(i);
				for (int j = 0; j < obj.length; j++) {
					if (obj[j] == null) {
						obj[j] = "";
					}
					label = new Label(j, i + 1,StringUtil.handNull( obj[j]), fm_n);
					sheet.addCell(label);
				}
			}
			wwb.write();
			wwb.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static CrudInfo getCrudInfo(String bean) {
		CrudInfo info = null;
		try {
			CrudContentHandler handler = new CrudContentHandler(bean);
			XMLReader reader = XMLReaderFactory.createXMLReader();
			reader.setContentHandler(handler);
			URL path = CrudInfo.class.getResource("/crud.xml");
			log.info(path);
			reader.parse(path.toString());
			info = handler.getInfo();
			log.info("适配xml信息成功");
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			log.error(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}
		return info;
	}

}

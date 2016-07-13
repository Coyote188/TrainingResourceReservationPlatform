package cn.com.chinaccs.res.sqlmap;

import java.io.IOException;
import java.net.URL;

import org.apache.log4j.Logger;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

/**
 * @author fddi
 * 
 */
public class SqlMapping {
	protected final String LOG_TAG = "<webstart--SQL语句映射：>";
	protected final Logger log = Logger.getLogger(SqlMapping.class);
	private String FILE_PATH = "";

	public SqlMapping(String xmlPath) {
		this.FILE_PATH = xmlPath;
	}

	/**
	 * 取得xml映射文件中相应的sql语句
	 * 
	 * @param sqlName
	 *            sql语句名称，通过名称对应到sql
	 * @param map
	 *            sql语句参数集，无参数时可传null
	 * @return sql语句
	 */
	public String getSQL(String sqlName) {
		log.info(this.LOG_TAG + "sqlMap-name:" + sqlName);
		String sql = "";
		SqlMapInfo info = null;
		try {
			SQLMapContentHandler handler = new SQLMapContentHandler(sqlName);
			XMLReader reader = XMLReaderFactory.createXMLReader();
			reader.setContentHandler(handler);
			URL path = SqlMapping.class.getResource(this.FILE_PATH);
			log.info(this.LOG_TAG + "xml路径:" + path);
			reader.parse(path.toString());
			info = handler.getSqlMap();
			sql = info.getSql();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
		}
		log.info(this.LOG_TAG + "适配xml信息成功");
		return sql;
	}
}

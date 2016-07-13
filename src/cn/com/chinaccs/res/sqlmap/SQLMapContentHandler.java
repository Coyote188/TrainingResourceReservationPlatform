package cn.com.chinaccs.res.sqlmap;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * xml 解析
 * 
 * @author fddi
 * 
 */
public class SQLMapContentHandler extends DefaultHandler {
	private final String elementSqlUnit = "sqlUnit";
	private final String elementSql = "sql";
	private final String attrName = "name";
	private String sqlName = "";
	private String sql = "";
	private Boolean isCheck = false;
	private SqlMapInfo sqlMap;
	private String element = "";

	public SQLMapContentHandler(String sqlName) {
		this.sqlName = sqlName;
	}

	@Override
	public void startDocument() throws SAXException {
		// TODO Auto-generated method stub
		sqlMap = new SqlMapInfo();
	}

	@Override
	public void endDocument() throws SAXException {
		// TODO Auto-generated method stub
	}

	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attr) throws SAXException {
		// TODO Auto-generated method stub
		if (qName.equalsIgnoreCase(elementSqlUnit)) {
			String name = attr.getValue(attrName);
			if (name.equalsIgnoreCase(sqlName)) {
				isCheck = true;
			}
		} else if (isCheck) {
			if (qName.equalsIgnoreCase(elementSql)) {
				element = this.elementSql;
			}
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		// TODO Auto-generated method stub
		if (isCheck) {
			if (qName.equalsIgnoreCase(elementSql)) {
				sql = clearString(sql);
				sqlMap.setSql(sql);
				isCheck = false;
			}
		}
	}

	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		// TODO Auto-generated method stub
		String value = new String(ch, start, length);
		value = value.trim();
		if (element.equalsIgnoreCase(elementSql)) {
			sql = sql + " " + value;
		}
	}

	public SqlMapInfo getSqlMap() {
		return sqlMap;
	}

	public String clearString(String str) {
		if (str == null) {
			return null;
		}
		String c_str = "";
		Pattern pattern = Pattern.compile("\\s+|\t|\r|\n");
		Matcher m = pattern.matcher(str);
		c_str = m.replaceAll(" ");
		return c_str;
	}
}

package cn.com.chinaccs.webstart.crud;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import cn.com.chinaccs.webstart.WebStartBusi;

/**
 * @author fddi 解析curd.xml的saxHandler
 * 
 */
public class CrudContentHandler extends DefaultHandler {
	private final String beanElement = "bean";
	private final String paramElement = "param";
	private final String deleteIdsElement = "deleteIds";
	private final String querySQLElement = "querySQL";
	private final String deleteSQLElement = "deleteSQL";
	private final String attrName = "name";
	private final String attrUrl = "url";
	private final String attrBusi = "busi";
	private final String attrType = "type";
	private CrudInfo info = new CrudInfo();
	private String op_bean;
	private String element = "";
	private Boolean isChecked = false;
	private List<CrudParams> param_name_list = new ArrayList<CrudParams>();
	private String querySql = "";
	private String deleteSql = "";

	public CrudContentHandler(String op_bean) {
		this.op_bean = op_bean;
	}

	@Override
	public void startDocument() throws SAXException {
		// TODO Auto-generated method stub
		super.startDocument();
	}

	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		// TODO Auto-generated method stub
		element = "";
		if (qName.equals(beanElement)) {
			String bean_name = attributes.getValue(attrName);
			if (bean_name.equalsIgnoreCase(op_bean)) {
				isChecked = true;
				String obj_url = attributes.getValue(attrUrl);
				info.setUrl(obj_url);
				String busi_url = attributes.getValue(attrBusi);
				info.setBusi(busi_url);
			}
		}
		if (isChecked) {
			if (qName.equals(paramElement)) {
				String name = attributes.getValue(attrName);
				String type = attributes.getValue(attrType);
				param_name_list.add(new CrudParams(type, name));
			} else if (qName.equals(deleteIdsElement)) {
				String name = attributes.getValue(attrName);
				info.setDeleteIds(name);
			} else if (qName.equals(querySQLElement)) {
				element = querySQLElement;
			} else if (qName.equals(deleteSQLElement)) {
				element = deleteSQLElement;
			}
		}
	}

	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		// TODO Auto-generated method stub
		// super.characters(ch, start, length);
		String value = new String(ch, start, length);
		value = value.trim();
		if (element.equalsIgnoreCase(querySQLElement)) {
			querySql = querySql + " " + value;
		} else if (element.equalsIgnoreCase(deleteSQLElement)) {
			deleteSql = deleteSql + " " + value;
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		// TODO Auto-generated method stub
		if (isChecked) {
			if (qName.equals(querySQLElement)) {
				querySql = WebStartBusi.clearString(querySql);
				info.setQuerySQL(querySql);
			} else if (qName.equals(deleteSQLElement)) {
				deleteSql = WebStartBusi.clearString(deleteSql);
				info.setDeleteSQL(deleteSql);
			}
		}
		if (qName.equals("bean")) {
			if (isChecked) {
				info.setParamNameList(param_name_list);
				isChecked = false;
				return;
			}
		}
	}

	@Override
	public void endDocument() throws SAXException {
		// TODO Auto-generated method stub
		super.endDocument();

	}

	public CrudInfo getInfo() {
		return info;
	}

	public void setInfo(CrudInfo info) {
		this.info = info;
	}
}

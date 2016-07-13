package cn.com.chinaccs.test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class WriteDoc {
	private Configuration configuration = null;

	public WriteDoc() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("UTF-8");
	}

	public static void main(String[] args) {
		WriteDoc test = new WriteDoc();
		test.createWord();
	}

	public void createWord() {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		getData(dataMap);
		configuration.setClassForTemplateLoading(this.getClass(), "/com"); // FTL文件所存在的位置
		Template t = null;
		try {
			t = configuration.getTemplate("wordModel.ftl"); // 文件名
		} catch (IOException e) {
			e.printStackTrace();
		}
		File outFile = new File("D:/outFilessa" + Math.random() * 10000
				+ ".doc");
		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(outFile)));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}

		try {
			t.process(dataMap, out);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void getData(Map<String, Object> dataMap) {
		dataMap.put("title", "标题");
		dataMap.put("year", "2012");
		dataMap.put("month", "2");
		dataMap.put("day", "13");
		dataMap.put("auditor", "唐鑫");
		dataMap.put("phone", "13020265912");
		dataMap.put("weave", "占文涛");
		// dataMap.put("number", 1);
		// dataMap.put("content", "内容"+2);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < 10; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("number", i);
			map.put("content", "内容" + i);
			list.add(map);
		}

		dataMap.put("list", list);
	}
}

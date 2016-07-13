package cn.com.chinaccs.webstart;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import cn.com.chinaccs.webstart.dao.BaseDao;
import cn.com.chinaccs.webstart.dao.IDBDao;

/**
 * @author fddi
 * 
 */
public abstract class WebStartBusi implements Serializable {

	private static final long serialVersionUID = 8737274747356179254L;

	/**
	 * 日志
	 */
	protected static final Logger log = Logger.getLogger(WebStartBusi.class);

	/**
	 * 标识---成功1
	 */
	public static final String RESULT_SCCESS = "1";
	/**
	 * 标识---失败 -1
	 */
	public static final String RESULT_FAIL = "-1";
	/**
	 * 操作失败
	 */
	public static final String MSG_FAIL = "抱歉，操作失败";
	/**
	 * 操作成功
	 */
	public static final String MSG_SUCCESS = "操作成功！";
	/**
	 * 非法访问
	 */
	public static final String MSG_ILLEGAL_ACCESS = "非法访问！";
	/**
	 * 无数据
	 */
	public static final String MSG_NO_DATAS = "无数据";
	/**
	 * 未登录
	 */
	public static final String MSG_NO_LOGIN = "抱歉，你未登录或登录超时，请重新登录";
	/**
	 * 编码
	 */
	public static final String ENCODING_UTF8 = "UTF-8";

	/**
	 * 资源url
	 */
	public static final String PATH_RESOURCE = "/cn/com/chinaccs/res/sql/";

	/**
	 * 返回特定格式json对象
	 * 
	 * @param result
	 * @param msg
	 * @return
	 */
	public static JSONObject getJson(String result, String msg) {
		JSONObject output = new JSONObject();
		output.put("result", result);
		output.put("msg", msg);
		return output;
	}

	/**
	 * 返回特定格式json对象
	 * 
	 * @param result
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JSONObject getJson(String result, String msg, JSONArray data) {
		JSONObject output = new JSONObject();
		output.put("result", result);
		output.put("msg", msg);
		output.put("data", data);
		return output;
	}

	/**
	 * 返回josn 数组对象
	 * 
	 * @param list
	 * @return
	 */
	public static JSONArray getJSONArray(List<Object> list) {
		JSONArray array = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONArray row = new JSONArray();
			Object[] obj = (Object[]) list.get(i);
			for (int j = 0; j < obj.length; j++) {
				String cell = obj[j] == null ? "" : obj[j].toString();
				row.add(cell);
			}
			array.add(row);
		}
		return array;
	}

	/**
	 * 通过类名实例化类
	 * 
	 * @param classes
	 * @return
	 */
	public static Object newInstanceByClass(String classes) {
		try {
			log.info("实例化类[" + classes + "]");
			if (null == classes || "".equals(classes)) {
				return null;
			}
			Object obj = (Object) Class.forName(classes).newInstance();
			log.info("实例化类[成功]");
			return obj;
		} catch (InstantiationException e) {
			log.error(e.toString());

		} catch (IllegalAccessException e) {
			log.error(e.toString());

		} catch (ClassNotFoundException e) {
			log.error(e.toString());

		} catch (Exception ex) {
			log.error(ex);

		}
		log.info("实例化类[失败]");
		return null;
	}

	/**
	 * 清除换行和空格
	 * 
	 * @param str
	 * 
	 * @return
	 */
	public static String clearString(String str) {
		if (str == null) {
			return null;
		}
		String c_str = "";
		Pattern pattern = Pattern.compile("\\s+|\t|\r|\n");
		Matcher m = pattern.matcher(str);
		c_str = m.replaceAll(" ");
		return c_str;
	}

	/**
	 * 判断是否为数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}

	/**
	 * 记录总数查询
	 * 
	 * @param querySql
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static String queryTotal(String querySql, Map<String, Object> params)
			throws Exception {
		String total = "0";
		IDBDao<Object, String> query = BaseDao.getInstance();
		List<Object> datas = null;
		if(querySql.indexOf("order by")>0){//增加统计查询去除order by条件
			querySql = querySql.substring(0, querySql.lastIndexOf("order by"));
			querySql = querySql.replace("order by","");
		}
		String sql = "select count(*) from (" + querySql + " ) ct";
		datas = query.queryList(sql, params);
		if (datas.size() > 0) {
			Object tot = datas.get(0);
			total = tot.toString();
		}
		return total;
	}

	/**
	 * 批量删除数据
	 * 
	 * @param sql
	 * @return
	 * @throws DaoException
	 */
	@SuppressWarnings("unchecked")
	public static boolean delete(String sql, List<Map<String, Object>> params)
			throws Exception {
		IDBDao<Object, String> delete = BaseDao.getInstance(null);
		boolean su = true;
		if (params == null)
			return false;
		for (int i = 0; i < params.size(); i++) {
			su = delete.delete(sql, params.get(i));
		}
		delete.commit();
		return su;
	}

	/**
	 * 数据查询
	 * 
	 * @param sql
	 * @return
	 * @throws DaoException
	 */
	@SuppressWarnings("unchecked")
	public static List<Object> queryList(String sql, Map<String, Object> params)
			throws Exception {
		IDBDao<Object, String> query = BaseDao.getInstance();
		List<Object> datas = null;
		datas = query.queryList(sql, params);
		log.info("数据查询成功");
		return datas;
	}

	/**
	 * 分页查询
	 * 
	 * @param sql
	 * @param start
	 * @param perSize
	 * @return
	 * @throws DaoException
	 */
	@SuppressWarnings("unchecked")
	public static List<Object> queryListPage(String sql,
			Map<String, Object> params, int start, int perSize)
			throws Exception {
		IDBDao<Object, String> dao = BaseDao.getInstance();
		List<Object> datas = null;
		datas = dao.queryPageList(sql, start, perSize, params);
		return datas;
	}

	/**
	 * 获取客户端ip地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip != null && !"unknown".equalsIgnoreCase(ip)) {
			ip = ip.split(",")[0];
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * json有些字符会导致格式出错，调用此方法处理
	 * 
	 * @param str
	 * @param isHtml
	 * @return
	 */
	public static String getValiateToJSON(String str, boolean isHtml) {
		String json = str;
		if (isHtml) {
			json = json.replaceAll("(\r\n|\r|\n|\n\r)", "<br/>");
		} else {
			json = json.replaceAll("(\r\n|\r|\n|\n\r)", "");
		}
		json = json.replaceAll("\\\\", "\\\\\\\\");
		return json;
	}

	/**
	 * 随机字符串生成函数
	 * 
	 * @param length
	 *            生成字符串的长度
	 * @return
	 */
	public static String getRandomString(int length) {
		String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}
	
	public static void  main(String[] args){
		String sql = "123 ordr by sdf";
		sql = sql.substring(0, sql.lastIndexOf("order by"));
		sql = sql.replace("order by","");
		System.out.println(sql);
	}
}
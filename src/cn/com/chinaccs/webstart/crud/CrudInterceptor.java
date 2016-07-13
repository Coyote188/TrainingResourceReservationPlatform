package cn.com.chinaccs.webstart.crud;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.com.chinaccs.webstart.WebStartBusi;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * @author fddi crud 拦截器 根据bean来构建对象并读取相应xml信息
 * 
 */
public class CrudInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6644418293193861695L;
	private static final Logger log = Logger.getLogger(CrudInterceptor.class);

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = ai.getInvocationContext();
		Object obj = ai.getAction();
		if (obj instanceof ICrud) {
			HttpServletRequest request = (HttpServletRequest) context
					.get(ServletActionContext.HTTP_REQUEST);
			String bean = request.getParameter("bean");
			log.info("业务bean----" + bean);
			CrudInfo info = CrudBusi.getCrudInfo(bean);
			List<CrudParams> list = info.getParamNameList();
			String class_url = info.getUrl();
			String busi_url = info.getBusi();
			String querySql = info.getQuerySQL();
			String deleteSql = info.getDeleteSQL();
			String dPn = info.getDeleteIds();
			Map<String, Object> params = new HashMap<String, Object>();
			List<Map<String, Object>> delete = new ArrayList<Map<String, Object>>();
			Object objBean = null;
			Object objBusi = null;
			if (class_url != null && !class_url.equals("")) {
				objBean = WebStartBusi.newInstanceByClass(class_url);
			}
			if (busi_url != null && !busi_url.equals("")) {
				objBusi = WebStartBusi.newInstanceByClass(busi_url);
			}
			for (int i = 0; i < list.size(); i++) {
				CrudParams pn = list.get(i);
				if (pn != null) {
					if (pn.type.equalsIgnoreCase(CrudParams.TYPE_EQUAL)) {
						String value = request.getParameter(pn.value);
						value = value == null ? "" : value;
						params.put(pn.value, value);
					} else if (pn.type.equalsIgnoreCase(CrudParams.TYPE_LIKE)) {
						String value = request.getParameter(pn.value);
						value = value == null ? "" : value;
						params.put(pn.value, "%" + value + "%");
					} else if (pn.type
							.equalsIgnoreCase(CrudParams.TYPE_LEFT_LIKE)) {
						String value = request.getParameter(pn.value);
						value = value == null ? "" : value;
						params.put(pn.value, "%" + value);
					} else if (pn.type
							.equalsIgnoreCase(CrudParams.TYPE_RIGHT_LIKE)) {
						String value = request.getParameter(pn.value);
						value = value == null ? "" : value;
						params.put(pn.value, value + "%");
					}
				}
			}

			if (!dPn.equals("")) {
				String dv = request.getParameter(dPn);
				if (dv != null) {
					String[] values = dv.split(",");
					for (String v : values) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put(dPn, v);
						delete.add(map);
					}
				}
			}

			ICrud action = (ICrud) obj;
			action.setObjBean(objBean);
			action.setObjBusi(objBusi);
			action.setQuerySQL(querySql);
			action.setDeleteSQL(deleteSql);
			action.setParams(params);
			action.setDeleteIds(delete);
		}
		return ai.invoke();
	}
}

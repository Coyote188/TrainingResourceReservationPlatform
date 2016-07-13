package cn.com.chinaccs.dao.impl;

import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.BaseBeanImpl;
import cn.com.chinaccs.res.sqlmap.SqlMapping;
import cn.com.chinaccs.utils.StringUtil;

/**
 * 通用操作
 * @author lmq
 *
 */
public class OPDao extends BaseDaoImpl<BaseBeanImpl> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4017363140844779001L;

	private static SqlMapping sqlMap = new SqlMapping("/cn/com/chinaccs/res/sql/sql_op.xml");
	
	/**
	 * 查询数据
	 * @param resId sql 名称
	 * @param params sql 参数
	 * @return
	 */
	public List<Object> queryDatas(String resId,Map<String,Object> params) {
		List<Object> objs = null;
		if(!StringUtil.isEmpty(resId)) {
			String sql = sqlMap.getSQL(resId);
			if(!StringUtil.isEmpty(sql)) {
				if(null != params) {
					objs = queryObjSql(sql, params);
				} else {
					objs = queryObjSql(sql);
				}
			}
			sql = null;
		}
		params = null;
		return objs;
	}
	
	/**
	 * 执行update,delete等的sql
	 * @param resId sql 名称
	 * @param params sql 参数
	 * @return
	 */
	public boolean execute(String resId,Map<String,Object> params) {
		int result = -1;
		if(!StringUtil.isEmpty(resId)) {
			String sql = sqlMap.getSQL(resId);
			if(!StringUtil.isEmpty(sql)) {
				if(null != params) {
					result = executeSql(sql, params);
				} else {
					result = executeSql(sql);
				}
			}
			sql = null;
		}
		params = null;
		return (result>0?true:false);
	}
	
}

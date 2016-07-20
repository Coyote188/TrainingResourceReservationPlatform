package cn.com.chinaccs.dao.impl;

import java.util.List;

import cn.com.chinaccs.bean.entity.TNInfo;


/**
 * 信息dao
 * @author Administrator
 *
 */
public class InfoDao extends BaseDaoImpl<TNInfo> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public List<Object> findInfosByArgs(String infoType, int limit, int len)
	{
		String sql = "";
		sql+=" SELECT";
		sql+=" a.title,";
		sql+=" LEFT (a.content, 50) abstract,";
		sql+=" a.state,";
		sql+=" a.infoType,";
		sql+=" c.call_name,";
		sql+=" DATE_FORMAT(a.createTime, '%Y年%m月%d日 %H点%i分'),";
		sql+=" a.imgUrl";
		sql+=" FROM";
		sql+=" t_n_info A,";
		sql+=" t_n_attachment B,";
		sql+=" t_n_user c";
		sql+=" WHERE";
		sql+=" A.imgAttId = B.id";
		sql+=" AND c.id = a.creatorId";
		sql+=" and a.infoType = '" + infoType + "'";
		sql+=" LIMIT " + limit + ", " + len;
		return this.queryObjSql(sql);
	}
}

package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.BaseBean;

public class AutoDao<T extends BaseBean> extends BaseDaoImpl<T>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2350247916139666221L;
	
	public AutoDao(Class<T> clazz) {
		this.clazz = clazz;
	}

	@Override
	public T find(Serializable id) {
		return super.find(id);
	}

	@Override
	public List<T> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}

	@Override
	public List<T> querySql(String sql) {
		// TODO Auto-generated method stub
		return super.querySql(sql);
	}

	@Override
	public List<T> querySql(String sql, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return super.querySql(sql, param);
	}

	@Override
	public List<T> querySql(String sql, Map<String, Object> param,
			Integer start, Integer rows) {
		// TODO Auto-generated method stub
		return super.querySql(sql, param, start, rows);
	}

	@Override
	public T find(String hql, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return super.find(hql, param);
	}
	
}

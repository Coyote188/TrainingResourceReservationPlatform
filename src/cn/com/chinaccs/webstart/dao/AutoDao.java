package cn.com.chinaccs.webstart.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author fddi
 * 
 * @param <T>
 * @param <PRI>
 */
public class AutoDao<T, PRI extends Serializable> extends BaseDao<T, PRI> {

	@Override
	public Boolean save(T obj) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.save(obj);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}

	@Override
	public Boolean save(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.save(sql, params);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}

	@Override
	public Boolean update(T obj) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.update(obj);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}

	@Override
	public Boolean update(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.update(sql, params);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}

	@Override
	public T query(T t, PRI id) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		T obj = super.query(t, id);
		this.commit();
		return obj;
	}

	@Override
	public List<Object> queryList(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		this.init();
		List<Object> list = super.queryList(sql, params);
		this.commit();
		return list;
	}

	@Override
	public List<T> queryList(T t, String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		this.init();
		List<T> list = super.queryList(t, sql, params);
		this.commit();
		return list;
	}

	@Override
	public List<Object> queryPageList(String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		List<Object> list = super.queryPageList(sql, start, persize, params);
		this.commit();
		return list;
	}

	@Override
	public List<T> queryPageList(T t, String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		List<T> list = super.queryPageList(t, sql, start, persize, params);
		this.commit();
		return list;
	}

	@Override
	public Boolean delete(T obj) throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.delete(obj);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}

	@Override
	public Boolean delete(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		this.init();
		Boolean isSuccess = super.delete(sql, params);
		isSuccess = isSuccess && this.commit();
		return isSuccess;
	}


}

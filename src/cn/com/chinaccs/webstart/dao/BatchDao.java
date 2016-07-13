package cn.com.chinaccs.webstart.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

public class BatchDao<T, PRI extends Serializable> extends BaseDao<T, PRI> {
	/**
	 * @param session
	 *            批量处理接受上一列队的sesison,为null新建session;处理完成后必须调用commit()关闭连接
	 */
	public BatchDao(Session queueSession) {
		if (queueSession == null) {
			this.init();
		} else {
			this.session = queueSession;
			this.transaction = queueSession.getTransaction();
		}
	}

	@Override
	protected void init() {
		// TODO Auto-generated method stub
		super.init();
	}

	@Override
	public boolean commit() {
		// TODO Auto-generated method stub
		return super.commit();
	}

	@Override
	public Boolean save(T obj) throws Exception {
		// TODO Auto-generated method stub
		return super.save(obj);
	}

	@Override
	public Boolean save(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return super.save(sql, params);
	}

	@Override
	public Boolean update(T obj) throws Exception {
		// TODO Auto-generated method stub
		return super.update(obj);
	}

	@Override
	public Boolean update(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return super.update(sql, params);
	}

	@Override
	public T query(T t, PRI id) throws Exception {
		// TODO Auto-generated method stub
		return super.query(t, id);
	}

	@Override
	public List<Object> queryList(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return super.queryList(sql, params);
	}

	@Override
	public List<T> queryList(T t, String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return super.queryList(t, sql, params);
	}

	@Override
	public List<Object> queryPageList(String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return super.queryPageList(sql, start, persize, params);
	}

	@Override
	public List<T> queryPageList(T t, String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return super.queryPageList(t, sql, start, persize, params);
	}

	@Override
	public Boolean delete(T obj) throws Exception {
		// TODO Auto-generated method stub
		return super.delete(obj);
	}

	@Override
	public Boolean delete(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return super.delete(sql, params);
	}
}

package cn.com.chinaccs.webstart.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.com.chinaccs.bean.BaseBean;
import cn.com.chinaccs.bean.DateBean;
import cn.com.chinaccs.hibernate.HibernateUtil;
import cn.com.chinaccs.utils.StringUtil;

public abstract class BaseDao<T, PRI extends Serializable> implements
		IDBDao<T, PRI> {
	protected final String LOG_TAG = "<webstart--数据库操作：>";
	protected final Logger log = Logger.getLogger(BaseDao.class);
	protected Session session = null;
	protected Transaction transaction = null;


	/**
	 * 新建会话和操作
	 */
	protected void init() {
		session = HibernateUtil.getCurrentSession();
		transaction = session.beginTransaction();
	}

	@SuppressWarnings("rawtypes")
	public static IDBDao getInstance() {
		return new AutoDao();
	}

	@SuppressWarnings("rawtypes")
	public static IDBDao getInstance(Session session) {
		return new BatchDao(session);
	}

	@Override
	public Session openSession() {
		// TODO Auto-generated method stub
		session = HibernateUtil.getCurrentSession();
		return session;
	}

	@Override
	public boolean commit() {
		// TODO Auto-generated method stub
		boolean isCommit = true;
		try {
			if (transaction != null) {
				transaction.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			log.info(this.LOG_TAG + "commit异常");
			isCommit = false;
		} finally {
			transaction = null;
		}
		return isCommit;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return this.session;
	}

	@Override
	public Boolean save(T obj) throws Exception {
		// TODO Auto-generated method stub
		return this.objCud(obj, "save");
	}

	@Override
	public Boolean save(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return this.sqlCud(sql, params);
	}

	@Override
	public Boolean update(T obj) throws Exception {
		// TODO Auto-generated method stub
		return this.objCud(obj, "update");
	}

	@Override
	public Boolean update(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return this.sqlCud(sql, params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T query(T t, PRI id) throws Exception {
		// TODO Auto-generated method stub
		log.info(this.LOG_TAG + "<obj>查询业务开始");
		T obj = null;
		try {
			obj = (T) session.get(t.getClass(), id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			obj = null;
			log.error(this.LOG_TAG + "<obj>查询业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<obj>查询业务执行结果：" + obj != null);
		return obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryList(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		log.info(this.LOG_TAG + "<sql>查询业务开始");
		log.debug(this.LOG_TAG + sql);
		List<Object> list = null;
		SQLQuery query = null;
		try {
			query = session.createSQLQuery(sql);
			if (params != null && params.size() > 0) {
				Iterator<Entry<String, Object>> it = params.entrySet()
						.iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			list = null;
			log.error(this.LOG_TAG + "<sql>查询业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<sql>查询业务执行结果<list结果集>：" + list.size());
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryList(T t, String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		log.info(this.LOG_TAG + "<sql>查询业务开始");
		log.debug(this.LOG_TAG + sql);
		List<T> list = null;
		SQLQuery query = null;
		try {
			query = session.createSQLQuery(sql).addEntity(t.getClass());
			if (params != null && params.size() > 0) {
				Iterator<Entry<String, Object>> it = params.entrySet()
						.iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			list = null;
			log.error(this.LOG_TAG + "<sql>查询业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<sql>查询业务执行结果<list结果集>：" + list.size());
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> queryPageList(String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		log.info(this.LOG_TAG + "<sql>分页查询业务开始");
		log.debug(this.LOG_TAG + sql);
		List<Object> list = null;
		SQLQuery query = null;
		try {
			query = session.createSQLQuery(sql);
			query.setFirstResult(start);
			query.setMaxResults(persize);
			if (params != null && params.size() > 0) {
				Iterator<Entry<String, Object>> it = params.entrySet()
						.iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			list = null;
			log.error(this.LOG_TAG + "<sql>分页查询业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<sql>查询业务执行结果<list结果集>：" + list.size());
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryPageList(T t, String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		log.info(this.LOG_TAG + "<sql>分页查询业务开始");
		log.debug(this.LOG_TAG + sql);
		List<T> list = null;
		SQLQuery query = null;
		try {
			query = session.createSQLQuery(sql).addEntity(t.getClass());
			query.setFirstResult(start);
			query.setMaxResults(persize);
			if (params != null && params.size() > 0) {
				Iterator<Entry<String, Object>> it = params.entrySet()
						.iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			list = null;
			log.error(this.LOG_TAG + "<sql>分页查询业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<sql>查询业务执行结果<list结果集>：" + list.size());
		return list;
	}

	@Override
	public Boolean delete(T obj) throws Exception {
		// TODO Auto-generated method stub
		return this.objCud(obj, "delete");
	}

	@Override
	public Boolean delete(String sql, Map<String, Object> params)
			throws Exception {
		// TODO Auto-generated method stub
		return this.sqlCud(sql, params);
	}

	/**
	 * 列队增、删、改业务[obj]
	 * 
	 * @param obj
	 * @param busi
	 * @return
	 */
	private boolean objCud(T obj, String busi) {
		Boolean isSuccess = true;
		log.info(this.LOG_TAG + "<obj>" + busi + "业务开始");
		try {
			if (busi.equals("save")) {
				if(obj instanceof BaseBean) {
					if(StringUtil.isEmpty(((BaseBean)obj).getId())) {
						String prefix = ((BaseBean)obj).getPrefix();
						String idNum = StringUtil.createSerialNum();
						if(!StringUtil.isEmpty(prefix)) {
							idNum = prefix.toUpperCase()+idNum; 
						}
						((BaseBean)obj).setId(idNum);
					}
					if(obj instanceof DateBean && ((DateBean)obj).getCreateTime() == null) {
						((DateBean)obj).setCreateTime(new Date());
					}
				}
				session.save(obj);
			}
			if (busi.equals("update")) {
				session.update(obj);
			}
			if (busi.equals("delete")) {
				session.delete(obj);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			isSuccess = false;
			log.error(this.LOG_TAG + "<obj>" + busi + "业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<obj>" + busi + "业务结果：" + isSuccess);
		return isSuccess;
	}

	/**
	 * 列队增、删、改业务[sql]
	 * 
	 * @param sql
	 * @return
	 */
	private boolean sqlCud(String sql, Map<String, Object> params) {
		Boolean isSuccess = false;
		log.info(this.LOG_TAG + "<sql>Cud业务开始");
		log.debug(this.LOG_TAG + sql);
		try {
			log.debug(sql);
			SQLQuery query = session.createSQLQuery(sql);
			if (params != null & params.size() > 0) {
				Iterator<Entry<String, Object>> it = params.entrySet()
						.iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			int counts = query.executeUpdate();
			if (counts > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			log.error(this.LOG_TAG + "<sql>Cud业务异常");
			log.error(e);
		}
		log.info(this.LOG_TAG + "<sql>结果：" + isSuccess);
		return isSuccess;
	}

	@Override
	public Boolean save(List<T> list) {
		// TODO Auto-generated method stub
		return this.batchCud(list, "save");
	}

	@Override
	public Boolean update(List<T> list) {
		// TODO Auto-generated method stub
		return this.batchCud(list, "update");
	}

	@Override
	public Boolean delete(List<T> list) {
		// TODO Auto-generated method stub
		return this.batchCud(list, "delete");
	}

	/**
	 * 批量增、删、改业务
	 * 
	 * @param obj
	 * @param busi
	 * @return
	 */
	private boolean batchCud(List<T> list, String busi) {
		Boolean isSuccess = true;
		log.info(this.LOG_TAG + "批量" + busi + "业务开始");
		Session session = this.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			for (int i = 0; i < list.size(); i++) {
				T obj = list.get(i);
				if (busi.equals("save")) {
					if(obj instanceof BaseBean) {
						if(StringUtil.isEmpty(((BaseBean)obj).getId())) {
							String prefix = ((BaseBean)obj).getPrefix();
							String idNum = StringUtil.createSerialNum();
							if(!StringUtil.isEmpty(prefix)) {
								idNum = prefix.toUpperCase()+idNum; 
							}
							((BaseBean)obj).setId(idNum);
						}
						if(obj instanceof DateBean && ((DateBean)obj).getCreateTime() == null) {
							((DateBean)obj).setCreateTime(new Date());
						}
					}
					session.save(obj);
				}
				if (busi.equals("update")) {
					session.update(obj);
				}
				if (busi.equals("delete")) {
					session.delete(obj);
				}
			}
			transaction.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			isSuccess = false;
			log.error(this.LOG_TAG + "批量" + busi + "业务异常");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		log.info(this.LOG_TAG + "批量" + busi + "业务执行结果：" + isSuccess);
		return isSuccess;
	}
}

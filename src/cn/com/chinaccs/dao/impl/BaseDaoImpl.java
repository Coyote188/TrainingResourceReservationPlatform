package cn.com.chinaccs.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import cn.com.chinaccs.bean.BaseBean;
import cn.com.chinaccs.bean.DateBean;
import cn.com.chinaccs.dao.BaseDao;
import cn.com.chinaccs.hibernate.HibernateUtil;
import cn.com.chinaccs.utils.StringUtil;
import cn.com.chinaccs.valid.ExecuteValidator;
import cn.com.chinaccs.valid.ValidateException;
import cn.com.chinaccs.valid.Validator;

public abstract class BaseDaoImpl<T extends BaseBean> implements BaseDao<T>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9218509847657847695L;
	
	protected static final Logger log = Logger.getLogger(BaseDaoImpl.class);
	
	protected Class<T> clazz;
	
	private Session session;
	
	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			this.clazz = (Class<T>) type.getActualTypeArguments()[0];
		} catch (Exception e) {
			
		}
	}
	
	
	public Serializable save(T o) {
		Serializable id = null;
		if(null != o){
			if(StringUtil.isEmpty(o.getId())) {
				String prefix = o.getPrefix();
				String idNum = StringUtil.createSerialNum();
				if(!StringUtil.isEmpty(prefix)) {
					idNum = prefix.toUpperCase()+idNum; 
				}
				o.setId(idNum);
			}
			if(o instanceof DateBean && ((DateBean)o).getCreateTime() == null) {
				((DateBean)o).setCreateTime(new Date());
			}
			//验证数据
			Validator validator = new ExecuteValidator(o);
			try {
				log.info("正在验证数据格式...");
				if(validator.validate()) {
					log.info("保存数据...");
					session = HibernateUtil.getCurrentSession();
					session.beginTransaction();
					try {
						id = session.save(o);
						session.getTransaction().commit();
						log.info("数据保存[成功]...");
					} catch (Exception e) {
						session.getTransaction().rollback();
						log.info("数据保存[失败]...");
						e.printStackTrace();
						id = null;
					} finally {
						session = null;
					}
				} else {
					log.error("验证数据格式[失败]...");
				}
			} catch (ValidateException e1) {
				log.info("验证数据失败---["+e1.getMessage()+"]--");
				id = null;
				e1.printStackTrace();
			} finally {
				o = null;
				validator = null;
			}
		}
		return id;
	}
	
	
	public boolean save(List<T> list) {
		boolean is = false;
		log.info("批量保存数据...");
		if(null != list && list.size()>0) {
			session = HibernateUtil.getCurrentSession();
			session.beginTransaction();
			Validator validator = null;
			try {
				for (T o : list) {
					if(StringUtil.isEmpty(o.getId())) {
						String prefix = o.getPrefix();
						String idNum = StringUtil.createSerialNum();
						if(!StringUtil.isEmpty(prefix)) {
							idNum = prefix.toUpperCase()+idNum; 
						}
						o.setId(idNum);
					}
					if(o instanceof DateBean && ((DateBean)o).getCreateTime() == null) {
						((DateBean)o).setCreateTime(new Date());
					}
					//验证数据
					validator = new ExecuteValidator(o);
					if(validator.validate()) {
						session.save(o);
					}
				}
				session.getTransaction().commit();
				is = true;
				log.info("数据保存[成功]...");
			} catch (ValidateException e) {
				log.info("验证数据失败---["+e.getMessage()+"]--");
				is = false;
				session.getTransaction().rollback();
				log.info("数据保存[失败]...");
				e.printStackTrace();
			}catch (Exception e) {
				is = false;
				session.getTransaction().rollback();
				log.info("数据保存[失败]...");
				e.printStackTrace();
			} finally {
				list = null;
				session = null;
				validator = null;
			}
		}
		return is;
	}
	

	public boolean delete(T o) {
		boolean is = false;
		log.info("删除数据ID["+o.getId()+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(o);
			session.getTransaction().commit();
			is = true;
			log.info("删除数据ID["+o.getId()+"][成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("删除数据ID["+o.getId()+"][失败]");
			e.printStackTrace();
			is = false;
		} finally {
			o = null;
			session = null;
		}
		return is;
	}
	
	
	public boolean delete(Serializable id) {
		boolean is = false;
		if(null != id && !StringUtil.isEmpty(id.toString())) {
			String[] ids = id.toString().split(",");
			String delIds = "";
			for (int i = 0; i < ids.length; i++) {
				if(i != (ids.length-1)) {
					delIds += "'"+ids[i]+"',";
				} else {
					delIds += "'"+ids[i]+"'";
				}
			}
			String delHql = "delete from "+clazz.getName()+" where id in ("+delIds+")";
			if(executeHql(delHql)>0) {
				is = true;
			}
		}
		return is;
	}
	
	
	public boolean delete(List<T> list) {
		boolean is = false;
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			for (T o : list) {
				log.info("删除数据ID["+o.getId()+"]");
				session.delete(o);
				is = true;
				log.info("删除数据ID["+o.getId()+"][成功]");
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("批量删除数据[失败]");
			e.printStackTrace();
			is = false;
		} finally {
			list = null;
			session = null;
		}
		return is;
	}
	

	public boolean update(T o) {
		boolean is = false;
		log.info("更新数据ID["+o.getId()+"]");
		Validator validator = new ExecuteValidator(o);
		try {
			log.info("正在验证数据格式...");
			if(validator.validate()) {
				session = HibernateUtil.getCurrentSession();
				session.beginTransaction();
				try {
					session.update(o);
					session.getTransaction().commit();
					is = true;
					log.info("更新数据ID["+o.getId()+"][成功]");
				} catch (Exception e) {
					session.getTransaction().rollback();
					log.info("更新数据ID["+o.getId()+"][失败]");
					is = false;
					e.printStackTrace();
				}	
			} else {
				log.info("数据格式验证[失败]");
			}
		} catch (ValidateException e) {
			log.info("数据格式验证[失败]----["+e.getMessage()+"]--");
			is = false;
			e.printStackTrace();
		} finally {
			o = null;
			session = null;
			validator = null;
		}
		return is;
	}

	
	public boolean saveOrUpdate(T o) {
		boolean is = false;
		if(null != o) {
			log.info("保存或更新数据ID["+o.getId()+"]");
			if(StringUtil.isEmpty(o.getId())) {
				o.setId(StringUtil.createSerialNum());
			}
			if(o instanceof DateBean && ((DateBean)o).getCreateTime() == null) {
				((DateBean)o).setCreateTime(new Date());
			}
			Validator validator = new ExecuteValidator(o);
			try {
				log.info("正在验证数据格式...");
			    if(validator.validate()) {
					session = HibernateUtil.getCurrentSession();
					session.beginTransaction();
					try {
						session.saveOrUpdate(o);
						session.getTransaction().commit();
						is = true;
						log.info("保存或更新数据ID["+o.getId()+"][成功]");
					} catch (Exception e) {
						session.getTransaction().rollback();
						log.info("保存或更新数据ID["+o.getId()+"][失败]");
						is = false;
						e.printStackTrace();
					}
			    } else {
			    	log.info("数据格式验证[失败]");
			    }
			} catch (ValidateException e) {
				log.info("数据格式验证[失败]----["+e.getMessage()+"]--");
				is = false;
				e.printStackTrace();
			} finally {
				o = null;
				session = null;
				validator = null;
			}
		}
		return is;
	}
	
	public String persist(T o) {
		boolean is = false;
		String serial = null;
		if(null != o) {
			log.info("保存或更新数据ID["+o.getId()+"]");
			if(StringUtil.isEmpty(o.getId())) {
				o.setId(StringUtil.createSerialNum());
			}
			if(o instanceof DateBean && ((DateBean)o).getCreateTime() == null) {
				((DateBean)o).setCreateTime(new Date());
			}
			Validator validator = new ExecuteValidator(o);
			try {
				log.info("正在验证数据格式...");
			    if(validator.validate()) {
					session = HibernateUtil.getCurrentSession();
					session.beginTransaction();
					try {
						session.saveOrUpdate(o);
						session.getTransaction().commit();
						serial = o.getId();
						is = true;
						log.info("保存或更新数据ID["+o.getId()+"][成功]");
					} catch (Exception e) {
						session.getTransaction().rollback();
						log.info("保存或更新数据ID["+o.getId()+"][失败]");
						is = false;
						e.printStackTrace();
					}
			    } else {
			    	log.info("数据格式验证[失败]");
			    }
			} catch (ValidateException e) {
				log.info("数据格式验证[失败]----["+e.getMessage()+"]--");
				e.printStackTrace();
			} finally {
				o = null;
				session = null;
				validator = null;
			}
		}
		return is == true? serial: null;
	}

	
	@SuppressWarnings("unchecked")
	public T find(Serializable id) {
		T t = null;
		log.info("通过主键ID["+id+"]查询数据");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			 t = (T) session.get(clazz, id);
		    session.getTransaction().commit();
		    log.info("通过主键ID["+id+"]查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过主键ID["+id+"]查询数据[失败]");
			e.printStackTrace();
			t = null;
		}
		return t;
	}

	
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		List<T> lists = null;
		log.info("获取表中的所有数据");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			lists = (List<T>) session.createQuery(" from "+clazz.getName()).list();
		    session.getTransaction().commit();
		    log.info("获取表中的所有数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("获取表中的所有数据[失败]");
			e.printStackTrace();
			lists = null;
		} finally {
			session = null;
		}
		return lists;
	}

	
	@SuppressWarnings("unchecked")
	public List<T> queryHql(String hql) {
		List<T> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			list = (List<T>)session.createQuery(hql).list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
		    log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> queryObjHql(String hql) {
		List<Object> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			list = session.createQuery(hql).list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
		    log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}

	
	@SuppressWarnings("unchecked")
	public List<T> queryHql(String hql, Map<String, Object> param) {
		List<T> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> queryObjHql(String hql, Map<String, Object> param) {
		List<Object> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<T> queryHql(String hql,Map<String, Object> param,Integer start,Integer rows) {
		List<T> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			query.setFirstResult(start);
			query.setMaxResults(rows);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}

	
	@SuppressWarnings("unchecked")
	public List<Object> queryObjHql(String hql,Map<String, Object> param,Integer start,Integer rows) {
		List<Object> list = null;
		log.info("通过HQL查询数据["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			query.setFirstResult(start);
			query.setMaxResults(rows);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过HQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过HQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<T> querySql(String sql) {
		List<T> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql).addEntity(clazz);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Object> queryObjSql(String sql) {
		List<Object> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> querySql(String sql,Map<String, Object> param) {
		List<T> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Object> queryObjSql(String sql,Map<String, Object> param) {
		List<Object> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> querySql(String sql, Map<String, Object> param,Integer start, Integer rows) {
		List<T> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql).addEntity(clazz);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			query.setFirstResult(start);
			query.setMaxResults(rows);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object> queryObjSql(String sql,Map<String, Object> param,Integer start, Integer rows) {
		List<Object> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			query.setFirstResult(start);
			query.setMaxResults(rows);
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public T find(String hql, Map<String, Object> param) {
		T t = null;
		log.info("查询数据HQL["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			t = (T) query.uniqueResult();
			session.getTransaction().commit();
			log.info("查询数据HQL["+hql+"]--成功--");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("查询数据HQL["+hql+"]--失败--");
			e.printStackTrace();
			t = null;
		} finally {
			session = null;
		}
		return t;
	}

	
	public Long count(String hql) {
		if(!StringUtil.isEmpty(hql)) {
			hql = "select count(*) "+hql;
		}
		log.info("统计数据HQL["+hql+"]");
		long total = 0;
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Object obj = session.createQuery(hql).iterate().next();
			total = Long.parseLong(obj.toString());
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			total = 0;
		} finally {
			session = null;
		}
		return total;
	}

	
	public Long count(String hql, Map<String, Object> param) {
		long total = 0;
		if(!StringUtil.isEmpty(hql)) {
			hql = "select count(*) "+hql;
		}
		log.info("统计数据HQL["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			Query query = session.createQuery(hql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			Object obj = query.uniqueResult();
			total = Long.parseLong(obj.toString());
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("统计数据HQL["+hql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			param = null;
			session = null;
		}
		return total;
	}

	
	public Long countSql(String sql) {
		long total = 0;
		if(!StringUtil.isEmpty(sql)) {
			sql = "select count(*) from ("+sql+") t";
		}
		log.info("统计数据SQL["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			Object obj = query.uniqueResult();
			total = Long.parseLong(obj.toString());
			session.getTransaction().commit();
			query = null;
			obj = null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("统计数据SQL["+sql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			session = null;
		}
		return total;
	}

	
	public Long countSql(String sql, Map<String, Object> param) {
		long total = 0;
		if(!StringUtil.isEmpty(sql)) {
			sql = "select count(*) from ("+sql+") t";
		}
		log.info("统计数据SQL["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
			Object obj = query.uniqueResult();
			total = Long.parseLong(obj.toString());
			session.getTransaction().commit();
			query = null;
			obj = null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("统计数据SQL["+sql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			param = null;
			session = null;
		}
		return total;
	}

	
	public Integer executeHql(String hql) {
		int result = 0;
		log.info("执行HQL["+hql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			result = session.createQuery(hql).executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行HQL["+hql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			session = null;
		}
		return result;
	}

	
	public Integer executeHql(String hql,Map<String, Object> param) {
	    int result = 0;
	    log.info("执行HQL["+hql+"]");
	    session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
		    Query query = session.createQuery(hql);
		    if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
		    result = query.executeUpdate();
		    session.getTransaction().commit();
		    query = null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行HQL["+hql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			param = null;
			session = null;
		}
		return result;
	}

	
	public Integer executeHql(String hql, List<Map<String, Object>> params) {
		 int result = 0;
		 log.info("执行HQL["+hql+"]");
		 session = HibernateUtil.getCurrentSession();
		 session.beginTransaction();
		 try {
			 Query query = session.createQuery(hql);
			 if (null != params && params.size() > 0) {
					for(Map<String,Object> param : params) {
						if (null != param && param.size() > 0) {
							Iterator<Entry<String, Object>> it = param.entrySet().iterator();
							while (it.hasNext()) {
								Map.Entry<String, Object> entry = it.next();
								query.setParameter(entry.getKey(), entry.getValue());
							}
							result += query.executeUpdate();
						}
					}
				}
			 session.getTransaction().commit();
			 query = null;
		 } catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行HQL["+hql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
		} finally {
			params = null;
			session = null;
		}
		return result;
	}

	
	public Integer executeSql(String sql) {
		int result = 0;
		log.info("执行SQL["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			result = session.createSQLQuery(sql).executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行SQL["+sql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
	     } finally {
			session = null;
		}
		return result;
	}

	
	public Integer executeSql(String sql,Map<String, Object> param) {
		int result = 0;
		log.info("执行SQL["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != param && param.size() > 0) {
				Iterator<Entry<String, Object>> it = param.entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, Object> entry = it.next();
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
		    result = query.executeUpdate();
		    session.getTransaction().commit();
		    query = null;
		}catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行SQL["+sql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
	    } finally {
	    	param = null;
	    	session = null;
	    }
		return result;
	}

	
	public Integer executeSql(String sql,List<Map<String, Object>> params) {
		int result = 0;
		log.info("执行SQL["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			if (null != params && params.size() > 0) {
				for(Map<String,Object> param : params) {
					if (null != param && param.size() > 0) {
						Iterator<Entry<String, Object>> it = param.entrySet().iterator();
						while (it.hasNext()) {
							Map.Entry<String, Object> entry = it.next();
							query.setParameter(entry.getKey(), entry.getValue());
						}
						result += query.executeUpdate();
					}
				}
			}
			session.getTransaction().commit();
			query = null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("执行SQL["+sql+"]--[异常]--["+e.getMessage()+"]");
			e.printStackTrace();
	    } finally {
	    	params = null;
	    	session = null;
	    }
		return result;
	}


	@Override
	public Integer getSeqNum(Serializable id) {
		int seqNum = 1;
		String hql = "select max(seqNum) from "+clazz.getName();
		if(StringUtil.isEmpty(id.toString())) {
			id = "0";
		}
		hql = hql+" where parentId='"+id.toString()+"'";
		List<Object> lists = queryObjHql(hql);
		if(null != lists && lists.size()>0) {
			try {
			  Object obj = lists.get(0);
			  seqNum = Integer.parseInt(obj.toString());
			  seqNum++;
			} catch (Exception e) {
				seqNum = 1;
			}
		}
		return seqNum;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> queryMapSql(String sql) {
		List<Map> list = null;
		log.info("通过SQL查询数据["+sql+"]");
		session = HibernateUtil.getCurrentSession();
		session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP); 
			list = query.list();
			session.getTransaction().commit();
			log.info("通过SQL查询数据[成功]");
		} catch (Exception e) {
			session.getTransaction().rollback();
			log.info("通过SQL查询数据[失败]");
			e.printStackTrace();
			list = null;
		} finally {
			session = null;
		}
		return list;
	}

}

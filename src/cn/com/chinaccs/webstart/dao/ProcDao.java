package cn.com.chinaccs.webstart.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.Work;

import cn.com.chinaccs.hibernate.HibernateUtil;

/**
 * @author fddi 封装存储过程的操作
 * 
 */
public class ProcDao {
	private final String LOG_TAG = "<webstart--数据库存储过程操作：>";
	private final Logger log = Logger.getLogger(ProcDao.class);
	private Object result;

	/**
	 * @param proc
	 * @param pmList
	 * @return
	 */
	public Boolean callProc(final String proc, final List<Object> pmList) {
		Boolean result = true;
		log.info(this.LOG_TAG + "调用存储过程开始：<" + proc + ">");
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.doWork(new Work() {
				@Override
				public void execute(Connection conn) throws SQLException {
					// TODO Auto-generated method stub
					CallableStatement call = conn.prepareCall(proc);
					for (int i = 0; i < pmList.size(); i++) {
						call.setObject(i + 1, pmList.get(i));
					}
					call.execute();
				}
			});
		} catch (Exception e) {
			// TODO: handle exception
			result = false;
			e.printStackTrace();
			transaction.rollback();
			log.info(this.LOG_TAG + "调用存储过程异常<sql>");
			log.error(e);
		} finally {
			
		}
		return result;
	}

	/**
	 * 执行存储过程
	 * 
	 * @param proc
	 *            存储过程名称，proc(?,?)
	 * @param pmList
	 *            存储过程参数集
	 * @param outPosition
	 *            返回值的索引
	 * @return 返回Result结果
	 */
	public Object callProc(final String proc, final List<Object> pmList,
			final Integer outPosition, final Integer sqlType) {
		result = null;
		log.info(this.LOG_TAG + "调用存储过程开始：<" + proc + ">");
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.doWork(new Work() {

				@Override
				public void execute(Connection conn) throws SQLException {
					// TODO Auto-generated method stub
					CallableStatement call = conn.prepareCall(proc);
					for (int i = 0; i < pmList.size(); i++) {
						if (outPosition != null && outPosition == (i + 2)) {
							call.registerOutParameter(outPosition, sqlType);
						}
						call.setObject(i + 1, pmList.get(i));
					}
					call.execute();
					if (outPosition != null)
						result = call.getObject(outPosition);
				}
			});
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			log.info(this.LOG_TAG + "调用存储过程异常<sql>");
			log.error(e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}

	/**
	 * 执行返回查询结果的存储过程
	 * 
	 * @param proc
	 *            存储过程名称，proc(?,?)
	 * @param pmList
	 *            存储过程参数集
	 * @return List 查询结果集
	 */
	@SuppressWarnings("unchecked")
	public List<Object> queryByProc(String proc, List<Object> pmList) {
		log.info(this.LOG_TAG + "调用存储过程开始：<" + proc + ">");
		List<Object> list = null;
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		SQLQuery query = null;
		try {
			query = session.createSQLQuery(proc);
			for (int i = 0; i < pmList.size(); i++) {
				query.setParameter(i, pmList.get(i));
			}
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			transaction.rollback();
			list = null;
			log.info(this.LOG_TAG + "调用存储过程异常<sql>");
			log.error(e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}
}

package cn.com.chinaccs.webstart.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

/**
 * @author fddi
 * 
 */
public interface IDBDao<T, PRI extends Serializable> {


	/**
	 * 打开一个新的会话，返回session
	 * 
	 * @return
	 */
	public Session openSession();


	/**
	 * 提交会话，如果使用列队操作，请在最后使用该方法
	 */
	public boolean commit();

	/**
	 * 获取当前会话
	 */
	public Session getSession();

	/**
	 * 保存业务[obj]
	 * 
	 * @param obj
	 *            数据表的映射类
	 * @return isSuccess 返回一个Boolean操作结果
	 */
	public Boolean save(T obj) throws Exception;

	/**
	 * 保存业务<sql>
	 * 
	 * @param sql
	 *            一般是insert的原生sql
	 * @param params
	 *            参数集
	 * @return
	 * @throws Exception
	 */
	public Boolean save(String sql, Map<String, Object> params)
			throws Exception;

	/**
	 * 修改业务<obj>
	 * 
	 * @param obj
	 *            数据表的映射类
	 * @return isSuccess 返回一个Boolean操作结果
	 */
	public Boolean update(T obj) throws Exception;

	/**
	 * 修改业务<sql>
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public Boolean update(String sql, Map<String, Object> params)
			throws Exception;

	/**
	 * 查询业务<obj>
	 * 
	 * @param t
	 *            数据表的映射类
	 * @param id
	 *            数据表映射类的主键值
	 * @return obj 返回一个映射类实例
	 */
	public T query(T t, PRI id) throws Exception;

	/**
	 * 查询业务<sql>
	 * 
	 * @param sql
	 *            原生sql查询语句
	 * @param params
	 *            查询条件集
	 * @return
	 * @throws Exception
	 */
	public List<Object> queryList(String sql, Map<String, Object> params)
			throws Exception;

	/**
	 * @param t
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<T> queryList(T t, String sql, Map<String, Object> params)
			throws Exception;

	/**
	 * @param sql
	 *            原生sql查询语句
	 * @param start
	 *            定义从哪个记录行开始查询
	 * @param persize
	 *            查询记录行最大值
	 * @param params
	 *            查询条件集
	 * @return
	 * @throws Exception
	 */
	public List<Object> queryPageList(String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception;

	/**
	 * @param t
	 *            数据表的映射类
	 * @param sql
	 *            原生sql查 询语句
	 * @param start
	 *            定义从哪个记录行开始查询
	 * @param persize
	 *            查询记录行最大值
	 * @param params
	 *            查询条件集
	 * @return 返回一个list结果集
	 * @throws Exception
	 */
	public List<T> queryPageList(T t, String sql, Integer start,
			Integer persize, Map<String, Object> params) throws Exception;

	/**
	 * 删除业务<obj>
	 * 
	 * @param obj
	 *            一个映射类实例
	 * @return isSuccess 返回一个Boolean操作结果
	 */
	public Boolean delete(T obj) throws Exception;

	/**
	 * 删除业务<sql>
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public Boolean delete(String sql, Map<String, Object> params)
			throws Exception;

	/**
	 * 批量保存
	 * 
	 * @param list
	 * @return
	 */
	public Boolean save(List<T> list);

	/**
	 * 批量更新
	 * 
	 * @param list
	 * @return
	 */
	public Boolean update(List<T> list);

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 */
	public Boolean delete(List<T> list);
}

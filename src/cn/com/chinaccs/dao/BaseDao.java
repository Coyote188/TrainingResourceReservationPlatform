package cn.com.chinaccs.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.com.chinaccs.bean.BaseBean;

public  interface BaseDao<T extends BaseBean> extends Serializable {

	/**
     * 保存一个对象
     * 
     * @param o
     * @return
     */
    public Serializable save(T o);
    
    /**
     * 保存一个 List对象
     * 
     * @param list
     * @return
     */
    public boolean save(List<T> list);
 
    /**
     * 删除一个对象
     * 
     * @param o
     */
    public boolean delete(T o);
    
    /**
     * 批量删除
     * @param list
     * @return
     */
    public boolean delete(List<T> list);
    
    /**
     * 删除
     * @param list
     * @return
     */
    public boolean delete(Serializable id);
    
 
    /**
     * 更新一个对象
     * 
     * @param o
     */
    public boolean update(T o);
 
    /**
     * 保存或更新对象
     * 
     * @param o
     */
    public boolean saveOrUpdate(T o);
    
    
    /**
     * 
     * @param id 主键ID的值
     * @return
     */
    public T find(Serializable id);
    
    /**
     * 查询所有数据
     * @return
     */
    public List<T> findAll();
 
    /**
     * 查询
     * 
     * @param hql
     * @return
     */
    public List<T> queryHql(String hql);
    
    /**
     * 查询
     * 
     * @param hql
     * @return
     */
    public List<Object> queryObjHql(String hql);
    
 
    /**
     * 查询集合
     * 
     * @param hql
     * @param param
     * @return
     */
    public List<T> queryHql(String hql, Map<String, Object> param);    
    
    /**
     * 查询集合
     * 
     * @param hql
     * @param param
     * @return
     */
    public List<Object> queryObjHql(String hql, Map<String, Object> param); 
    
    
    /**
     * 查询集合(带分页)
     * 
     * @param hql
     * @param param
     * @param start
     *            从第几条开始查询
     * @param rows
     *            每页显示几条记录
     * @return
     */
    public List<T> queryHql(String hql, Map<String, Object> param, Integer start, Integer rows);
    
    /**
     * 查询集合(带分页)
     * 
     * @param hql
     * @param param
     * @param start
     *            从第几条开始查询
     * @param rows
     *            每页显示几条记录
     * @return
     */
    public List<Object> queryObjHql(String hql, Map<String, Object> param, Integer start, Integer rows);
    
    
    /**
	 * SQL查询
	 * @param sql
	 * @return
	 */
	public List<T> querySql(String sql);
	
	/**
	 * SQL查询
	 * @param sql
	 * @return
	 */
	public List<Object> queryObjSql(String sql);
	
	
	/**
	 * SQL查询
	 * @param sql
	 * @return
	 */
	public List<T> querySql(String sql,Map<String, Object> param);
	
	/**
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public List<Object> queryObjSql(String sql,Map<String, Object> param);
	
	/**
	 * SQL查询(带分页)
	 * @param sql
	 * @param param
	 * @param start
	 * @param rows
	 * @return
	 */
	public List<T> querySql(String sql,Map<String, Object> param,Integer start, Integer rows);
	
	/**
	 * SQL查询(带分页)
	 * @param sql
	 * @param param
	 * @param start
	 * @param rows
	 * @return
	 */
	public List<Object> queryObjSql(String sql,Map<String, Object> param,Integer start, Integer rows);
 
 
    /**
     * 获得一个对象
     * 
     * @param hql
     * @param param
     * @return Object
     */
    public T find(String hql, Map<String, Object> param);
 
 
    /**
     * select count(*) from 类
     * 
     * @param hql
     * @return
     */
    public Long count(String hql);
 
    /**
     * select count(*) from 类
     * 
     * @param hql
     * @param param
     * @return
     */
    public Long count(String hql, Map<String, Object> param);
    
    /**
     * select count(*) from 表
     * 
     * @param sql
     * @return
     */
    public Long countSql(String sql);
 
    /**
     * select count(*) from 表
     * 
     * @param sql
     * @param param
     * @return
     */
    public Long countSql(String sql, Map<String, Object> param);
    
 
    /**
     * 执行HQL语句
     * 
     * @param hql
     * @return 响应数目
     */
    public Integer executeHql(String hql);
 
    /**
     * 执行HQL语句
     * 
     * @param hql
     * @param param
     * @return 响应数目
     */
    public Integer executeHql(String hql,Map<String, Object> param);
    
    /**
     * 执行HQL语句
     * @param hql
     * @param params
     * @return
     */
    public Integer executeHql(String hql, List<Map<String, Object>> params);
    
    /**
	 * 执行SQL语句
	 * @param sql
	 * @return
	 */
	public Integer executeSql(String sql);
	
	/**
     * 执行SQL语句
     * 
     * @param hql
     * @param param
     * @return 响应数目
     */
    public Integer executeSql(String sql,Map<String, Object> param);
    
    /**
     * 执行SQL语句
     * @param hql
     * @param params
     * @return
     */
    public Integer executeSql(String sql, List<Map<String, Object>> params);
    
    /**
     * 
     * @param id
     * @return
     */
    public Integer getSeqNum(Serializable id);
	
}

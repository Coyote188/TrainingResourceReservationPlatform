package cn.com.chinaccs.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import cn.com.chinaccs.bean.BaseTree;

public class TreeHelper<T extends BaseTree> {
	
	public List<T> outPutTree(List<T> ts, T t,boolean isSelf) throws Exception {
		List<T> trees = null; 
		if (null != ts && ts.size() > 0 && null != t) {
			trees = new ArrayList<T>();
			
			//获取子树
			Stack<T> childStack = new Stack<T>();
			int count = 0;
			if(isSelf) {
				for (T tt : ts) {
					if (tt.getId().toString().equals(t.getId().toString())) {
						t = tt;
						t.setParentId("0");
						count = 1;
						break;
					}
				}
			}
			childStack.push(t);
			while (!childStack.isEmpty()) {
				T tt = childStack.pop();
				if (count>0) {
					trees.add(tt);
				}
				childStack.addAll(getChild(ts, tt));
				count++;
			}
			
			/*if(isSelf) {
				//获取父节点
				Stack<T> parentStack = new Stack<T>();
				count = 0;
				parentStack.push(t);
				while (!parentStack.isEmpty()) {
					T tt = parentStack.pop();
					if (count>0) {
						trees.add(0,tt);
					}
					T tmp = getParent(ts, tt);
					if(null != tmp) {
						parentStack.add(tmp);
					}
					count++;
				}
			}*/
		}
		return trees;
	}
	
	
	/**
	 * 
	 * @param ts
	 * @param t
	 * @return
	 */
	protected T getParent(List<T> ts, T t) {
		if("0".equals(t.getId()) || "0".equals(t.getParentId().toString())) {
			return null;
		}
		for (T tt : ts) {
			if (tt.getId().toString().equals(t.getParentId().toString())) {
				return tt;
			}
		}
		return null;
	}
	
	/**
	 * 
	 * @param ts
	 * @param t
	 * @return
	 */
	protected List<T> getChild(List<T> ts, T t) {
		List<T> childs = new ArrayList<T>();
		for (T tt : ts) {
			if (tt.getParentId().toString().equals(t.getId().toString())) {
				// 此处保证集合中最后一个元素是需要显示在当前层级中第一个展示的子节点（因为堆栈中是最后一个元素先出）
				if (childs != null
						&& childs.size() != 0
						&& tt.getSeqNum().intValue() > childs.get(0).getSeqNum().intValue()) {
					childs.add(0, tt);
				} else {
					childs.add(tt);
				}
			}
		}
		return childs;
	}
	
}

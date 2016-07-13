package cn.com.chinaccs.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import cn.com.chinaccs.utils.StringUtil;

public class ObjectTreeHelper {

	/**
	 * 输出树
	 * 
	 * @param lists
	 * @param obj
	 *            字段顺序必须为[id,name,parentId,seqNum,.......]
	 * @return
	 * @throws Exception
	 */
	public List<Object> outPutTree(List<Object> lists, Object obj)
			throws Exception {
		List<Object> trees = null;
		if (null != lists && lists.size() > 0 && null != obj) {
			trees = new ArrayList<Object>();
			Stack<Object> s = new Stack<Object>();
			s.push(obj);
			int count = 0;
			while (!s.isEmpty()) {
				Object objTmp = s.pop();
				if (count > 0) {
					trees.add(objTmp);
				}
				s.addAll(getChild(lists, objTmp));
				count++;
			}
		}
		return trees;
	}

	/**
	 * 
	 * @param lists
	 * @param obj
	 * @return
	 */
	protected List<Object> getChild(List<Object> lists, Object obj) {
		List<Object> childs = new ArrayList<Object>();
		for (Object objTmp : lists) {
			if (StringUtil.handNull(((Object[]) objTmp)[1]).equals(
					StringUtil.handNull(((Object[]) obj)[0]))) {
				// 此处保证集合中最后一个元素是需要显示在当前层级中第一个展示的子节点（因为堆栈中是最后一个元素先出）
				if (childs != null
						&& childs.size() != 0
						&& Integer.parseInt(StringUtil
								.handNumNull(((Object[]) objTmp)[2])) > Integer
								.parseInt(StringUtil
										.handNumNull(((Object[]) childs.get(0))[2]))) {
					childs.add(0, objTmp);
				} else {
					childs.add(objTmp);
				}
			}
		}
		return childs;
	}

}

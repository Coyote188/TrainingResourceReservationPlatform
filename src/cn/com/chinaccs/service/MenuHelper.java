package cn.com.chinaccs.service;

import java.util.List;
import java.util.Stack;

import javax.servlet.jsp.JspException;

import cn.com.chinaccs.bean.TreeProp;
import cn.com.chinaccs.utils.StringUtil;

/**
 * 自定义菜单helper
 * @author zzp
 *
 */
public class MenuHelper {

	
	private int isCollapsed = 0;
	private String open = "shrink";
	private List<TreeProp> menus;
	
	public MenuHelper(List<TreeProp> menus) {
		this.menus = menus;
	}
	
	
	public String getMenuHtml() throws JspException {
		StringBuffer sb = new StringBuffer();
		try {
			Stack<String> idStack = new Stack<String>();
			open = (isCollapsed==1)?"expand":"shrink";
			if(null != menus && menus.size()>0) {
				sb.append("<ul class='menu-ul' id='parent_0'>");
				for (TreeProp menu : menus) {
					if(isFirstLevelMenu(menu,menus)) {
						if(isParent(menu,menus)) {
							printEndTag(idStack, menu.getParentId(), sb);
							sb.append(getParentFirstLevelContentHtml(menu));
							idStack.push(menu.getId());
						} else {
							printEndTag(idStack, menu.getParentId(), sb);
							sb.append(getFirstLevelContentHtml(menu));
						}
					} else {
						if(isParent(menu,menus)) {
							printEndTag(idStack, menu.getParentId(), sb);
							sb.append(getParentContentHtml(menu));
							idStack.push(menu.getId());
						} else {
							printEndTag(idStack, menu.getParentId(), sb);
							sb.append(getContentHtml(menu));
						}
					}
				}
				while(!idStack.isEmpty()) {
					idStack.pop();
					sb.append("</ul></li>");
				}
				sb.append("</ul>");
			}
			idStack = null;
			menus = null;
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return sb.toString();
	}
	


	
	/**
	 * 判断是否为父菜单
	 * @param menu
	 * @return
	 */
	private boolean isParent(TreeProp menu,List<TreeProp> menus) {
		boolean is = false;
		for (TreeProp menuTmp : menus) {
			if(menu.getId().equals(menuTmp.getParentId())) {
				is = true;
				break;
			}
		}
		return is;
	}
	
	/**
	 * 判断是否为父菜单
	 * @param menu
	 * @return
	 */
	private boolean isFirstLevelMenu(TreeProp menu,List<TreeProp> menus) {
		boolean is = true;
		for (TreeProp menuTmp : menus) {
			if(menu.getParentId().equals(menuTmp.getId())) {
				is = false;
				break;
			}
		}
		return is;
	}
	
	
	/**
	 * 
	 * @param menu
	 * @return
	 */
	private String getParentFirstLevelContentHtml(TreeProp menu) {
		String contents = "<li class='menu-li li-"+open+" layer-"+countLayer(menu.getParentId())+" "+(StringUtil.isEmpty("")?"no-icon":"")+"' id='"+menu.getId()+"'>"+
	            "<a href='#' class='"+open+"' data-uri='"+(menu.getUri() != null ? StringUtil.handNull(menu.getUri()):"")+"'>"+
	            "<div class='ui-icon ui-icon-triangle-1-e left'></div>"+
	            "<i class='glyphicon "+StringUtil.handNull("")+"'></i> "+menu.getName()+"</a><ul id='parent_"+menu.getId()+"'>";
		return contents;
	}
	
	/**
	 * 
	 * @param menu
	 * @return
	 */
	private String getFirstLevelContentHtml(TreeProp menu) {
		String contents = "<li class='menu-li no-parent layer-"+countLayer(menu.getParentId())+" "+(StringUtil.isEmpty("")?"no-icon":"")+"' id='"+menu.getId()+"'>"+
	           "<a href='#' data-uri='"+(menu.getUri() != null ? StringUtil.handNull(menu.getUri()):"")+"'><i style='margin-right:4px;' class='glyphicon "+StringUtil.handNull("")+"'></i>"+menu.getName()+"</a></li>";
		return contents;
	}
	
	/**
	 * 
	 * @param menu
	 * @return
	 */
	private String getParentContentHtml(TreeProp menu) {
		String contents = "<li class='li-"+open+" layer-"+countLayer(menu.getParentId())+" "+(StringUtil.isEmpty("")?"no-icon":"")+"' id='"+menu.getId()+"'>"+
	            "<a href='#' class='"+open+"' data-uri='"+(menu.getUri() != null ? StringUtil.handNull(menu.getUri()):"")+"'>"+
	            "<div class='ui-icon ui-icon-triangle-1-e left'></div>"+
	            "<i class='glyphicon "+StringUtil.handNull("")+"'></i> "+menu.getName()+"</a><ul id='parent_"+menu.getId()+"'>";
		return contents;
	}
	
	/**
	 * 
	 * @param menu
	 * @return
	 */
	private String getContentHtml(TreeProp menu) {
		String contents = "<li class='no-parent layer-"+countLayer(menu.getParentId())+" "+(StringUtil.isEmpty("")?"no-icon":"")+"' id='"+menu.getId()+"'>"+
		           "<a href='#' data-uri='"+(menu.getUri() != null ? StringUtil.handNull(menu.getUri()):"")+"'><i style='margin-right:4px;' class='glyphicon "+StringUtil.handNull("")+"'></i> "+menu.getName()+"</a></li>";
			return contents;
	}
	
	/**
	 * 
	 * @param stack
	 * @param menuId
	 * @param out
	 */
	private void printEndTag(Stack<String> stack,String menuId,StringBuffer sb) {
		if(null != stack && stack.size()>0) {
			boolean is = true;
			while(!stack.empty() && is) {
				 String parentId = stack.peek();
				if(!parentId.equals(menuId)) {
					stack.pop();
					try {
						sb.append("</ul></li>");
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					is = false;
				}
		   }
		}
	}
	
	
	/**
	 * 计算层次
	 * @param parentId
	 * @return
	 */
	private int countLayer(String parentId) {
		int count = 0;
		for (int i=0;i<menus.size();) {
			if (menus.get(i).getId().equals(parentId)) {
				count++;
				parentId = menus.get(i).getParentId();
				i=0;
			} else {
				i++;
			}
		}
		return count;
	}

	public int getIsCollapsed() {
		return isCollapsed;
	}

	public void setIsCollapsed(int isCollapsed) {
		this.isCollapsed = isCollapsed;
	}

}

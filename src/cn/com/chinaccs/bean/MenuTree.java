package cn.com.chinaccs.bean;

import java.util.List;

import cn.com.chinaccs.bean.entity.TNMenu;

public class MenuTree {

	private TNMenu menu;
	
	private int isLeaf;
	
	private List<MenuTree> subMenuTree;

	public TNMenu getMenu() {
		return menu;
	}

	public void setMenu(TNMenu menu) {
		this.menu = menu;
	}

	public int getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(int isLeaf) {
		this.isLeaf = isLeaf;
	}

	public List<MenuTree> getSubMenuTree() {
		return subMenuTree;
	}

	public void setSubMenuTree(List<MenuTree> subMenuTree) {
		this.subMenuTree = subMenuTree;
	}
	
	
}

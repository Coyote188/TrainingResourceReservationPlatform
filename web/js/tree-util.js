/**
 * 创建树
 * @param id
 * @param datas
 * @param parentId
 * @param isCollapsed
 */
function buildObjTree(id, datas, parentId,isCollapsed) {
	if(typeof(isCollapsed) === 'undefined') {
		isCollapsed = true;
	}
	
	$(id).append('<ul id="parent' + parentId + '" class="filetree"></ul>');
	buildObjNode(id, datas, parentId);
	$("#parent" + parentId).treeview({
		collapsed : isCollapsed
	});
}

/**
 * 创建组织机构节点
 * @param id
 * @param datas
 * @param parentId
 */
function buildObjNode(id, datas, parentId) { // 递归构建多层级菜单
	for ( var i = 0; i < datas.length; i++) {
		if (datas[i].parentId == parentId) {
			if (isParent(datas, datas[i].id)) {
				$(id).find("ul#parent" + parentId).append(
						'<li><a class="folder-nag" href="'+datas[i].uri+'">' + datas[i].name
								+ '</a><ul id="parent' + datas[i].id
								+ '"></ul></li>');
				buildObjNode(id, datas, datas[i].id);
			} else {
				$(id).find("ul#parent" + parentId).append(
						'<li><span class="file"><a href="'+ datas[i].uri + '">' + 
						datas[i].name + '</a></span></li>');
			}
		}
	}
}

/**
 * 创建树
 * @param id
 * @param datas
 * @param parentId
 * @param isCollapsed
 */
function buildObjTreeV2(id, datas, parentId,isCollapsed) {
	if(typeof(isCollapsed) === 'undefined') {
		isCollapsed = true;
	}
	
	$(id).append('<ul id="parent' + parentId + '"></ul>');
//	alert('<ul id="parent' + parentId + '></ul>');
	buildObjNodeV2(id, datas, parentId);
	/*$("#parent" + parentId).treeview({
		collapsed : isCollapsed
	});*/
}

/**
 * 创建组织机构节点
 * @param id
 * @param datas
 * @param parentId
 */
function buildObjNodeV2(id, datas, parentId) { // 递归构建多层级菜单
//	alert(datas.length);
	for ( var i = 0; i < datas.length; i++) {
		if (datas[i].parentId == parentId) {
			if (isParent(datas, datas[i].id)) {
				/*alert('父节点'+$(id).find("ul#parent" + parentId));
				alert('<li id="parent' + datas[i].id+'"><dl><dt><a href="'+datas[i].uri+'">' + datas[i].name
						+ '</a></dt></dl></li>');*/
				$(id).find("ul#parent" + parentId).append(
						'<li id="parent' + datas[i].id+'"><dl><dt>' + datas[i].name
								+ '</dt></dl></li>');
				buildObjNodeV2(id, datas, datas[i].id);
			} else {
//				alert("li#parent" + parentId);
				if($(id).find("li#parent" + parentId).find("dl").length>0){
					$(id).find("li#parent" + parentId).find("dl").append(
							'<dd><a href="'+ datas[i].uri + '">' + 
							datas[i].name + '</a></dd>');
				}else{
					$(id).find("ul#parent" + parentId).append(
							'<li id="parent' + datas[i].id+'"><dl><dt><a href="'+datas[i].uri+'">' + datas[i].name
									+ '</a></dt></dl></li>');
				}
				
			}
		}
	}
}

/**
 * 创建树
 * @param id
 * @param datas
 * @param parentId
 * @param isCollapsed
 */
function buildObjTreeV3(id, datas, parentId,isCollapsed) {
	if(typeof(isCollapsed) === 'undefined') {
		isCollapsed = true;
	}
	
	$(id).append('<ul id="parent_0"  class="menu-ul"></ul>');
	buildObjNodeV3(id, datas, parentId);
	/*$("#parent" + parentId).treeview({
		collapsed : isCollapsed
	});*/
}

/**
 * 创建组织机构节点
 * @param id
 * @param datas
 * @param parentId
 */
function buildObjNodeV3(id, datas, parentId) { // 递归构建多层级菜单
	for ( var i = 0; i < datas.length; i++) {
		if (datas[i].parentId == parentId) {
			//按层来循环，第0层
			if (isParent(datas, datas[i].id)) {
				$(id).find("ul#parent_0").append(
						'<li class="menu-li li-shrink layer-0 no-icon" id='+datas[i].id+'><a  href="#" class="shrink">'
						+'<div class="ui-icon ui-icon-triangle-1-e left"></div>'+'<i class="glyphicon "></i>' + datas[i].name
								+ '</a><ul id="parent' + datas[i].id
								+ '"></ul></li>');
				buildObjNodeV3Sub(id, datas, datas[i].id,1);
			}else{
				$(id).find("ul#parent_0").append(
						'<li class="menu-li li-shrink layer-0 no-icon" id='+datas[i].id+'><a  href="'+datas[i].uri+'" class="shrink">' + datas[i].name
								+ '</a></li>');
			}
			
		//	buildObjNodeV3(id, datas, datas[i].id);
		}
	}
}
function buildObjNodeV3Sub(id, datas, parentId,level) { // 递归构建多层级菜单
	for ( var i = 0; i < datas.length; i++) {
		if (datas[i].parentId == parentId) {
			//按层来循环，第0层
			if (isParent(datas, datas[i].id)) {
				$(id).find("ul#parent"+parentId).append(
						'<li class="layer-'+level+' no-icon li-shrink" id='+datas[i].id+'><a  href="#" class="shrink">'
						+'<div class="ui-icon ui-icon-triangle-1-e left"></div>'+'<i class="glyphicon "></i>' + datas[i].name
								+ '</a><ul id="parent' + datas[i].id
								+ '"></ul></li>');
				buildObjNodeV3Sub(id, datas, datas[i].id,level+1);
			}else{
				$(id).find("ul#parent"+parentId).append(
						'<li class="no-parent layer-'+level+' no-icon" id='+datas[i].id+'><a  href="'+datas[i].uri+'" class="shrink">' + datas[i].name
								+ '</a></li>');
			}
			
		//	buildObjNodeV3(id, datas, datas[i].id);
		}
	}
}


/**
 * 判断菜单是否为父节点
 * @param datas
 * @param id
 * @returns {Boolean}
 */
function isParent(datas, id) {
	var isP = false;
	for ( var i = 0; i < datas.length; i++) {
		if (datas[i].parentId === id) {
			isP = true;
			break;
		}
	}
	return isP;
}
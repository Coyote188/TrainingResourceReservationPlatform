(function($) {
	$.fn.extend({
				treeSelect : function(settings) {
					var p = { // 默认参数设置
						values : [ [] ],
						selectValue : "",
						maxHeight : 150,
						defItem : "无",
						defValue : "0",
						collapsed : true
					};
					var ps = $.extend(p, settings);
					var $hiddenSelect = $(this);
					var id = $hiddenSelect.attr("id") + "selectTree";
					$hiddenSelect.after("<div id='" + id+ "' class='cu-selecttree-all'></div>");
					id = id.replace(".", "\\.");
					$hiddenSelect.next("#" + id).append("<input type='text' readOnly='readOnly'"+ "class='cu-select-tree input30' flag='' pid=''/>");
					$hiddenSelect.next("#" + id).append("<div class='cu-option-tree'></div>");
					$hiddenSelect.next("#" + id).append("<input type='hidden' class='v_selected'/>");
					var $select = $hiddenSelect.next("#" + id).find(".cu-select-tree");
					var $option = $hiddenSelect.next("#" + id).find(".cu-option-tree");
					var $vSelected = $hiddenSelect.next("#" + id).find(".v_selected");
					
					
					var name = $hiddenSelect.attr("name");
					$vSelected.attr("name", name);
					var width = $hiddenSelect.width();
					var height = $hiddenSelect.height();
					/*$select.width(width);
					$select.height(height);*/
					$option.width(width);
					$option.css({
						maxHeight : ps.maxHeight,
						top : height + 5,
						left : 2
					});
					var g = {buildTree : function() {
							parentId = ps.values[0][2];
							$option.append('<ul id="parent' + parentId
									+ '"><li><a href="#" value="' + ps.defValue
									+ '"  pid="' + parentId + '">' + ps.defItem
									+ '</a><li></ul>');
							
							this.buildNode(ps.values, parentId);
							$option.find("#parent" + parentId).treeview({
								collapsed : ps.collapsed
							});
							
						},
						buildNode : function(datas, parentId) {
							for ( var i = 0; i < datas.length; i++) {
								var value = datas[i][0];
								if (datas[i][2] == parentId) {
									if (this.isParent(datas, datas[i][0])) {
										$option.find("ul#parent" + parentId).append(
														'<li><a href="javascript:void(0);" flag="'+((datas[i].length>3)?datas[i][3]:"")+'" value="'
																+ value
																+ '" pid="'
																+ datas[i][2]
																+ '">'
																+ datas[i][1]
																+ '</a><ul id="parent'
																+ datas[i][0]
																+ '"></ul></li>');
										this.buildNode(datas, datas[i][0]);
									} else {
										$option.find("ul#parent" + parentId)
												.append(
														'<li><a href="javascript:void(0);" flag="'+((datas[i].length>3)?datas[i][3]:"")+'" value="'
																+ value
																+ '" pid="'
																+ datas[i][2]
																+ '">'
																+ datas[i][1]
																+ '</a></li>');
									}
								}
							}
						},
						isParent : function(datas, id) {
							var isP = false;
							for ( var i = 0; i < datas.length; i++) {
								if (datas[i][2] === id) {
									isP = true;
									break;
								}
							}
							return isP;
						}
					};
					g.buildTree();
					$select.focus(function() {
						$option.show();
					});
					var mouse_container = false;
					$option.mouseenter(function() {
						mouse_container = true;
					});
					$option.mouseleave(function() {
						mouse_container = false;
					});
					$select.blur(function(e) {
						if (!mouse_container) {
							$option.hide();
						}
					});
					$option.find("a").click(
							function() {
								var pName = "";
								$(this).parents("li").each(
										function() {
											pName = $(this).children("a")
													.text()
													+ ">>" + pName;
										});
								pName = pName.substring(0, pName.length - 2);
								var value = $(this).attr("value");
								var text = $(this).text();
								$select.val(pName);
								$select.attr("pid", $(this).attr("pid"));
								$vSelected.val(value);
								var flag = $(this).attr("flag");
								if(flag == undefined) {
									flag = '';
								}
								$select.attr("flag",flag)
								$option.hide();
								return false;
							});
					$option.hide();
					var hiddenId = $hiddenSelect.attr("id");
					$hiddenSelect.remove();
					$select.attr("id", hiddenId);
					var len = ps.values.length;
					if (ps.selectValue != "") {// 默认选择
						var ic = false;
						for ( var i = 0; i < len; i++) {
							var data = ps.values[i];
							var value = data[0];
							if (value == ps.selectValue) {
								$select.val(data[1]);
								$vSelected.val(value);
								ic = true;
								break;
							}
						}
						if (!ic) {
							$select.val(ps.defItem);
							$vSelected.val(ps.defValue);
						}
					}
				}
			});
})(jQuery);
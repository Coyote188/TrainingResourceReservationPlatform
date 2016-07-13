var include_categoryName = "";
//生成树
	function include_initZnodes(){
		var reqData = "&queryOrgName="+include_categoryName+"&flag=normalQuery";
		$.post("org/orgZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			$.fn.zTree.init(ztreeObj, include_setting, zNodes);	
		});	
	}
	
	//按名字查询树
	function include_zTreeQuery(){
		if($("#categoryQ").val()==''||$("#categoryQ").val()=='   输入机构名称检索'){
			cu.toast("请输入查询的机构名称！");
			return;
		}else{
			include_categoryName = trim($("#categoryQ").val());
			$("#include_ztree").empty();
			include_initZnodes();
		}
	}
	
	//重置树
	function include_zTreeRefresh(){
		$("#include_ztree").empty();
			include_categoryName = "";
			include_initZnodes();
	}
	//清空查询框提示
	function tNameFocus(obj){
		$(obj).val("");
		$(obj).css("color","black");
	}
	
	//获取当前节点的父节点 名称数据组
	function getZtreeParentNames(names,treeNode,count){
			count++;
			names.push(treeNode.name);
			if (treeNode.getParentNode()!=null&&count<2){
				getZtreeParentNames(names,treeNode.getParentNode(),count);
			}
			return names;
	}

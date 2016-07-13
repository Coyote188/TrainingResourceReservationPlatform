/**根据不同符号 拆分 字符串重组 成数组*/
	 function StrToArray(params,sign){
		 var returnValue = new Array();
		 var count=0;
			var paramArray = params.split(sign);
			if(paramArray.length>0) {
				for ( var i = 0; i < paramArray.length; i++) {
					 returnValue[count]=paramArray[i];
					   count++;
				}
				return returnValue;
			} else {
				return params;
			} 
	 }
	
	 
	 function fullLoad() {
			$('.shade').show();
			$("body").append("<div class='full_load'><br><p>加载数据中...</p></div>");
			$(".full_load").css({
				opacity : 1,
				left : ($(window).width() - 100) / 2,
				top : $(window).scrollTop() + ($(window).height() - 10) / 2
			});
		}
	 
	 function onAsyncSuccess(event, treeId, treeNode, msg) {
			if (!msg || msg.length == 0) {
				return;
			}
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			totalCount = treeNode.count;
			if (treeNode.children.length < totalCount) {
				setTimeout(function() {ajaxGetNodes(treeNode);}, perTime);
			} else {
				treeNode.icon = "";
				zTree.updateNode(treeNode);
				zTree.selectNode(treeNode.children[0]);
				
				//endTime = new Date();
				//var usedTime = (endTime.getTime() - startTime.getTime())/1000;
				//className = (className === "dark" ? "":"dark");
				//showLog("[ "+getTime()+" ]&nbsp;&nbsp;treeNode:" + treeNode.name );
				//showLog("加载完毕，共进行 "+ (treeNode.times-1) +" 次异步加载, 耗时："+ usedTime + " 秒");
			}
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			alert("异步获取数据出现异常。");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
		}
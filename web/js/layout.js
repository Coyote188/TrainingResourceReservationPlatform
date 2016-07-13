/**
 * @author fddi
 */
$(document).ready(function(){
	cu.layout.formActive();
	cu.layout.listBtnListener();
	cu.layout.formRequire();
});
cu.layout = {
	formActive : function() {
		$(".input20,.input30").focus(function() {
			$(this).addClass("bg_position_bottom");
		}).blur(function() {
			$(this).removeClass("bg_position_bottom");
		});
		$("input[type=submit],input[type=button]").button();
		$("div.buttonset").buttonset();
	}
};
cu.screenPosition = {
	position1 : function(id) {
		var $prompt = $(id);
		var w_w = $(window).width();
		var p_w = $prompt.width();
		$prompt.css({
			position : "fixed",
			left : (w_w - p_w) / 2,
			top : '10%'
		});
	},
	position2 : function(id) {
		var $prompt = $(id);
		var w_w = $(window).width();
		var w_h = $(window).height();
		var p_w = $prompt.width();
		var p_h = $prompt.height();
		if (w_w < p_w || w_h < p_h) {
			$prompt.css({
				position : "fixed",
				left : 50,
				top : 50
			});
		} else {
			$prompt.css({
				left : (w_w - p_w) / 2,
				top : $(window).scrollTop() + (w_h - p_h) / 2
			});
		}
	}
};
cu.toast = function(content, settings) {
	var p = {
		type : "msg",// msg,alert,error,load
		timeout : 2500
	};
	var ps = $.extend(p, settings);
	var html = "<div id='cu-toast' class='cu-toast ui-widget ui-corner-all'><span></span><h4></h4></div>";
	$("body").append(html);
	$("#cu-toast").width(250);
	cu.screenPosition.position1("#cu-toast");
	$("#cu-toast h4").text(content);
	if (ps.type == 'msg') {
		$("#cu-toast").addClass("ui-state-default");
		$("#cu-toast span").addClass("ui-icon");
		$("#cu-toast span").addClass("ui-icon-info");
		$("#cu-toast").fadeIn();
		setTimeout('cu.toast.close()', ps.timeout);
	} else if (ps.type == 'alert') {
		$("#cu-toast span").addClass("ui-icon");
		$("#cu-toast span").addClass("ui-icon-info");
		$("#cu-toast").addClass("ui-state-highlight");
		$("#cu-toast").fadeIn();
		setTimeout('cu.toast.close()', ps.timeout);
	} else if (ps.type == 'error') {
		$("#cu-toast span").addClass("ui-icon");
		$("#cu-toast span").addClass("ui-icon-info");
		$("#cu-toast").addClass("ui-state-error");
		$("#cu-toast").fadeIn();
		setTimeout('cu.toast.close()', ps.timeout);
	} else if (ps.type == 'load') {
		$("#cu-toast").addClass("ui-state-default");
		$("#cu-toast").show();
		$("#cu-toast span").addClass("cu-icon-load");
		$("body").append(
				"<div id='toast-shade' class='ui-widget-overlay'></div>");
	}
};
cu.toast.close = function() {
	if ($("#toast-shade").size() > 0) {
		$("#toast-shade").remove();
	}
	if ($("#cu-toast").size() > 0) {
		$("#cu-toast").remove();
	}
};

cu.layout.listBtnListener = function() {
	$(".list-btn-add").parent().parent().click(function(){
		var params = $("#list-param .add-param");
		var uri = params.attr("uri");
		var title = params.attr("title");
		var value = params.attr("value");
		var busiName = params.attr("busi");
		var width = params.attr("dialog-width");
		var flag = params.attr("dis");
		width = regexNum(width)?width:600;
		if(trim(uri) != '') {
			if(typeof(busiName) !== 'undefined' && trim(busiName) != '') {
				uri = uri+"?op=add&id="+value+"&busiName="+busiName;
			}
			BootstrapDialogUtil.loadUriDialog(title,uri,width,"#fff");
		}
	});
	
	$(".list-btn-edit").parent().parent().click(function(){
		var params = $("#list-param .edit-param");
		var uri = params.attr("uri");
		var title = params.attr("title");
		var value = params.attr("value");
		var busiName = params.attr("busi");
		var width = params.attr("dialog-width");
		var flag = params.attr("dis");
		if(flag=="true"){
			cu.toast("只允许操作流程菜单！");
			return false;
		}
		
		if((value).indexOf(',')>0){
			BootstrapDialogUtil.warningAlert("编辑只能选择一条数据!");
			return;
		}
		
		width = regexNum(width)?width:600;
		if(trim(value) != '') {
			if(trim(uri) != '') {
				uri = uri+"?op=edit&id="+value+"&busiName="+busiName;
				BootstrapDialogUtil.loadUriDialog(title,uri,width,"#fff");
			}
		} else {
			BootstrapDialogUtil.warningAlert("请选择一条数据!");
		}
	});
	
	$(".list-btn-del").parent().parent().click(function(){
		var params = $("#list-param .del-param");
		var uri = params.attr("uri");
		var msg = params.attr("msg");
		var value = params.attr("value");
		var busiName = params.attr("busi");
		var successFun = params.attr("delAfter");
		var flag = params.attr("dis");
		if(flag=="true"){
			cu.toast("只允许操作流程菜单！");
			return false;
		}
		if(trim(value) != '') {
			if(trim(uri) != '') {
				uri = uri+"?op=del&id="+value+"&busiName="+busiName;
				BootstrapDialogUtil.confirmDialog(msg,function(){
					$.post(uri,function(data){
						var output = $.parseJSON(data.output);
						cu.toast(output.msg+"！", {type : "alert"});
						if(output.result=='1') {
							setTimeout(successFun, 0);
						}
					});
				});
			}
		} else {
			BootstrapDialogUtil.warningAlert("请选择一条数据!");
		}
	});
}

cu.layout.formRequire = function() {
	$("form .require").each(function(){
		var is = $(this).next().hasClass("s-require");
		if(!is) {
			$(this).after("<span class='s-require'>*</span>");
		}
	});
}

cu.layout.gridAuto = function() {
	//jqGrid 宽高自适应
	var jqGridH = 0;
	var jqGridW = 0;
	$(window).resize(function(){
		 jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-75;
		 jqGridW = $("#cu-content").width()-10;
		 $(".jq-grid").setGridHeight(jqGridH);
		 $(".jq-grid").setGridWidth(jqGridW);
		 $("#cu-content").css({"overflow":"hidden"});
		
		var jqGridLo = $(".jq-grid-lo");
		if(typeof(jqGridLo) !== 'undefined') {
			jqGridW = $("#cu-org-content").width()-10;
			jqGridH = $("#cu-org-content").height()-95;
			$("#cu-org-content").css({"overflow":"hidden"});
			jqGridLo.setGridHeight(jqGridH);
			jqGridLo.setGridWidth(jqGridW);
		}
		
	});
}

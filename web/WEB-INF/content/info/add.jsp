<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/js/jquery-fileupload-util.js" type="text/javascript" charset="utf-8" ></script>
<script src="${pageContext.request.contextPath}/thirdpart/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8" ></script>
<script src="${pageContext.request.contextPath}/thirdpart/ueditor/ueditor.all.min.js" type="text/javascript" charset="utf-8" ></script>
<script src="${pageContext.request.contextPath}/thirdpart/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8" ></script>
<!-- 上传文件插件 -->
	<link href="${pageContext.request.contextPath}/thirdpart/jqueryFileUpload/css/jquery.fileupload.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/thirdpart/jqueryFileUpload/js/jquery.iframe-transport.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/thirdpart/jqueryFileUpload/js/jquery.fileupload.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/thirdpart/jqueryFileUpload/js/locale.js" type="text/javascript" ></script>

<div class="wrap-content" style = "overflow:scroll;">
	<div class="panel panel-default">
		<div class="panel-heading ui-widget-header" id="div_header">
			<strong>创建文档信息</strong>
		</div>
		<div class="m-b-10" id="div_inline">
			<div class="form-inline form-group m-t-10 m-l-20">
				<label class="control-label">标题：</label>
				<input type="text" style="width: 80%" class="form-control input-form-control" id="title" name="title" placeholder="标题" />
			</div>
			<div class="form-inline form-group m-t-10 m-l-20">
				<label class="control-label">副标题：</label>
				<input type="text" style="width: 80%" class="form-control input-form-control" id="subTitle" name="subTitle" placeholder="副标题" />
			</div>
			<div class="form-inline">
			
			
			<div class="form-group m-t-10 m-l-20">
				<label class="control-label">信息封面图：</label>
				<div class="form-group">
					<span class="btn btn-success btn-sm fileinput-button upload-add">
						<i class="glyphicon glyphicon-plus"></i> <span>添加封面图</span>
						<input  id="upload-att-file" type="file" name="upload" />
						<!-- 返回的图片Id -->
						<input id="att_picture_value"  type="hidden" name="imageAttId" value="">
						<input id="att_picture_url_value"  type="hidden" name="imgUrl" value="">
					</span> 
					<!-- 必须的  与FileSubmitId对应 -->
					<input type="button" style="display: none;" id="att-file-submit">
				</div>
			</div>
			
			<div class="form-group m-t-10 m-l-20" >
				<button type="button" class="btn btn-info btn-sm" id="btn_save">
			   		<i class="glyphicon glyphicon-ok"></i> 提交</button>
			</div>
			</div>
		</div>
		<div class="form-group m-b-10 m-t-10">
			<script id="ue_editor" type="text/plain" class="m-l-20" style="width:98%; height:250px; z-index: 100; "></script>
		</div>
	</div>
</div>
<script type="text/javascript">
var initEditorHeight = function() {
	var h = $(document).height();
	var h1 = $("#header-ui-div").outerHeight(true);
	var h2 = $("#div_inline").outerHeight(true);
	var h3 = $("#div_header").outerHeight(true);
	h = h - $(".wrap-footer").outerHeight(true) - h1 - h2 - h3;
	$("#ue_editor").height(h-120);
};


//初始化上传组件
var setting ={
		"FileSubmitId":"att-file-submit","uri":"picture/upload",
		"closeAfterFun":"fileBackFun","showImg":false,"imgHeight":50,"imgWidth":50,
		"dataType":"json","progressbar":true,
		"acceptFileTypes":"/jpg|gif|png$/i","maxFileSize":1048576
		};
$("#upload-att-file").jqueryFileUploadForm(setting);


var ue = null;
$(document).ready(function() {
	//初始化编辑器高度
	initEditorHeight();
	
	ue = UE.getEditor("ue_editor");
	
	$("#edui1").css("z-index", "100");
	
	$("#span_attMgr").click(function() {
		jzAttachment();
	});
	
	
	
});

//监控提交按钮
$("#btn_save").click(function(){
	if(!validateData())  return;
	  waitLoading("正在提交数据...");
	  var objEvt = $._data($("#att-file-submit")[0], "events");
	  if (objEvt && objEvt["click"]) {//当控件被初始化 触发控件事件  回调表单提交事件
		$("#att-file-submit").trigger("click");
	  }else//控件没有没监控时直接调用回调函数
		fileBackFun(null);
});

//文件上传后的回调函数  
function fileBackFun(chResponse){
	closeWaitLoading();//关闭加载条
	chResponse = jQuery.parseJSON(chResponse.output);
	if(!isEmpty(chResponse)){
		if(chResponse.result==1){
			var fileId = chResponse.data.id;
			console.info(chResponse);
			console.info(fileId);
	//		alert(fileId);
			$("#att_picture_value").val(fileId);
			$("#att_picture_url_value").val(chResponse.data.filePath);
			
			//setTimeout(submitForm(),500);
			setTimeout(submitData(),500);
		}else{
			//showMsg(chResponse.msg);
			BootstrapDialogUtil.warningAlert(chResponse.msg);
		}
	}else{
		//showMsg("请选择照片！");
		//BootstrapDialogUtil.warningAlert("请选择主图！");
		setTimeout(submitData(),500);
	}
}




var validateData = function() {
	var result=true;
	var msg="";
	if($("#title").val()=='')
		msg += "标题不能为空！ \n";
	
	if(ue.getContent()=='')
		msg+="内容不能为空！ \n";
	
	if(msg!="") {
		BootstrapDialogUtil.warningAlert(msg);
		result=false;
	}
	return result;
};

var submitData = function() {
	if(!validateData()) return;
	var title = $("#title").val();
	
	
	var uc_html = ue.getContent();
	var uc_txt = ue.getContentTxt();
	var attIds = $("#attId").val();
	
	var imageAttId=$("#att_picture_value").val();
	var imgUrl=$("#att_picture_url_value").val();
	
	var url = "info/addInfo";
	var param = {"objBean.title": title, 
			"objBean.html": uc_html, 
			"objBean.content": uc_txt, 
			"objBean.imgAttId":imageAttId,
			"objBean.imgUrl":imgUrl};
	$.ajax({
		type: "POST",
		url: url,
		data: param ,
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
		success: function(msg){
			msg = jQuery.parseJSON(msg.output);
			var result=msg.result;
			if(result=='1')
				showMsg("保存成功");
			else
				showMsg(msg.msg);
			BootstrapDialogUtil.close();
			loadLocation("info/list");
		}
	});
};


</script>
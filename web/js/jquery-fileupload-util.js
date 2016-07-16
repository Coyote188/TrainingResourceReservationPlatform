(function($){
	/**
	 * jqueryfileupload文件上传工具
	 */
	$.fn.jqueryFileUpload = function(options) {
		var setting = {
				uri:null,
				dataType:'json',
				autoUpload:true,
				formData:null,
				popWidth:450,
				popHeight:300,
				progressbar:false,
				//acceptFileTypes:'/(\.|\/)(gif|jpg|png|txt|pdf|ppt|pptx|doc|docx|xls|xlsx|zip|tar|rar|gz|7z)$/i',
				acceptFileTypes:'/gif|jpg|png|txt|pdf|ppt|pptx|doc|docx|xls|xlsx|zip|tar|rar|gz|7z|apk|deb|pxl|ipa|wgt|wgtu|mp4|3gp|mp3|wav|wma|amr|awb$/i',
				maxFileSize:104857600000,
				closeAfterFun:function() {}
		}
		var count = 0;
		setting = $.extend(setting,options);
		var jqXHR = null;
		var isStarting = false;
		var uploadDatas = null;
		var isSuccess = true;
		if(null != setting.uri && setting.uri != '') {
			//$(this).fileupload('destroy');
			jqXHR = $(this).fileupload({
		        url:setting.uri,
		        dataType: setting.dataType,
		        autoUpload:setting.autoUpload,
		        formData:setting.formData,
		        //acceptFileTypes:setting.acceptFileTypes,
		       // maxFileSize:setting.maxFileSize,
		        add:function(e,data) {
		        	count++;
		        	//alert(count);
		        	createShowPanel();
		        	$("#upload-wait-msg .start-upload").click(function(){
		        		if(count==0) {
		        			showMsg("请选择上传文件！");
		        		} else {
		        			isStarting = true;
		            		$("#upload-wait-msg").find("#upload-file"+data.context+"-result").html(" <span class='upload-loading success'>正在上传...</span>");;
				        	$("#upload-wait-msg .start-upload").attr("disabled",true);
				        	//alert(JSON.stringify(data));
				        	data.submit();
		        		}
		        	});
		        	data.context=count;
		        	var isCheck = true;
		        	$.each(data.files, function (index, file) {
		        		var ext = getFileSuffix(file.name);
		        		var is = checkRegexp(eval(setting.acceptFileTypes),ext);
		        		var p = "<p id='uload-file"+count+"'>"+file.name+"<span id='upload-file"+count+"-result'></span></p>";
		        		if(!is) {
		        			p = "<p id='uload-file"+count+"'>"+file.name+"<span id='upload-file"+count+"-result'> <span class='fail'><strong>该文件类型不支持上传</strong></span></span></p>";
		        			isCheck = isCheck && false;
		        		} 
		        		if(isCheck && setting.maxFileSize<file.size) {
		        			p = "<p id='uload-file"+count+"'>"+file.name+"<span id='upload-file"+count+"-result'> <span class='fail'><strong>该文件太大无法上传</strong></span></span></p>";
		        			isCheck = isCheck && false;
		        		}
		        		$("#upload-wait-msg .upload-msg-body").append(p);
		            });
		        	if(!isCheck) {
		        		$("#upload-wait-msg .start-upload").attr("disabled",true);
		        	}
		        	return true;
		        },
		        progressall:function(e, data){
		        	if(setting.progressbar) {
			        	var progress = parseInt(data.loaded/data.total * 100, 10);
			        	var $progressBar = $("#upload-wait-msg .progress-bar");
			        	$progressBar.css({"width":progress+"%"});
			        	$progressBar.attr("aria-valuenow",progress+"%");
			        	$progressBar.html(progress+"%");
		        	}
		        },
		        done:function(e, data) {
		        	data = jQuery.parseJSON(data.output);
			        if(null != data.result && data.result != '') {
			          var output =  data.result;//$.parseJSON(data.result.output);
			          count--;
			          var $uploadFileSpan = $("#upload-wait-msg").find("#upload-file"+data.context+"-result");			          
			          if(output.result == '1') {
			        	  isSuccess = isSuccess && true;
			        	  $uploadFileSpan.html(" <span class='success'>[<strong>成功</strong>]</span>");
			          } else {
			        	  $uploadFileSpan.html(" <span class='fail'>[<strong>失败</strong>]</span> <span class='fail'>原因："+output.msg+"</span>");
			          }
			          if(null == uploadDatas) {
			        	  uploadDatas = new Array();
			          }
			          var i = parseInt(data.context);
			          i = i>0?(i-1):i;
			          uploadDatas[i]=output.data;
			          if(count<1) { //判断文件是否全部上传完
			        	  jqXHR = null;
			        	  isStarting = false;
			        	  if(isSuccess) {
			        		  setTimeout(function(){
			        			  uploadWinClose(uploadDatas);
			        		  },1500);
			        	  }
			          }
			        }
			        data = null;
			    },
			    fail:function(e,data){
			    	var responseText = data.jqXHR.responseText;
			        if(null != responseText && typeof(responseText) != 'undefined' && responseText != '') {
			        	var resultData = $.parseJSON(responseText);
				        var output =  $.parseJSON(resultData.output);
				        showMsg(output.msg);
			        }
			        data = null;
			    }
		    });
		};
		
		/**
		 * 创建上传面板
		 */
		var createShowPanel = function() {
			var isCreate = true;
			if($("#upload-wait-msg").attr("id") == undefined) {
				$("body").append("<div id='upload-wait-msg'><div class='upload-msg-body'></div></div>");
				$("#upload-wait-msg").hide();
			} else {
				isCreate = false;
			}
			if($("#shadow").attr("id") == undefined) {
				$("body").append("<div id='shadow'></div>");
			}
			if(isCreate) {
				$("#upload-wait-msg .upload-msg-body").before("<div id='upload-title' style=''>上传文件</div>");
				$("#upload-wait-msg .upload-msg-body").after("<div id='upload-bottom' class='text-right p-r-5'><div>"+
				    "<span class='btn btn-primary btn-sm fileinput-button start-upload start'><i class='glyphicon glyphicon-circle-arrow-up'></i> <span>开始上传</span></span> &nbsp;&nbsp;"+
					"<span class='btn btn-warning btn-sm fileinput-button upload-close cancel'><i class='glyphicon glyphicon-ban-circle'></i> <span>&nbsp;关闭&nbsp;</span></span>"+
					"</div>");
				if(setting.progressbar) {
					$("#upload-wait-msg .upload-msg-body").after("<div class='progress m-l-5 m-r-5'>"+
					"<div class='progress-bar' role='progressbar' aria-valuenow='0%' aria-valuemin='0' aria-valuemax='100' style='width: 0%;'>0%</div>");
				}
				$("#upload-bottom .upload-close").click(function(){
					if(null != jqXHR && isStarting && typeof(jqXHR.abort) === 'function') {
						jqXHR.abort();
						jqXHR = null;
					}
					uploadWinClose(uploadDatas);
			    });
				var w = setting.popWidth;
				var h = setting.popHeight;
				$("#upload-wait-msg .upload-msg-body").css({"height":(h-90)+"px"});
				
				var top = $(document).scrollTop();
				var index = $("#shadow").css("z-index")/1+1/1;
				var sw = ($(window).width()-w)/2;
				var sh = ($(window).height()-h)/2+top;
				$("#upload-wait-msg").css({"top":sh+"px","left":sw+"px","width":w+"px","height":h+"px","padding":"0px","z-index":index});
			}
			$("#shadow").show();
			$("#upload-wait-msg").show();
		};
		
		/**
		 * 
		 */
		var uploadWinClose = function(datas) {
			$("#upload-wait-msg").remove();
			$("#shadow").hide();
			//alert(typeof(setting.closeAfterFun));
			var fun = eval(setting.closeAfterFun);
			if(typeof(fun)==='function')
			     fun(datas);
		};
	},
	/**
	 * 	 表单文件上传,无进度条
	 *	FileSubmitId:必须的而且唯一，控件提交按钮Id，必须的，每个控件都必须匹配一个隐藏的提交按钮
	 *	uri:必须，文件提交路径
	 *	closeAfterFun：可选，每个文件控件提交后结束后 回调的方法   自定义方法，可获取datas  上传成功后的文件参数
	 * 	progressbar：可选，是否显示上传进度条 tru/false
	 *	acceptFileTypes:可选，上传的文件格式类型
	 *	maxFileSize：可选，文件大小  单位为字节   1 M = 1048576 b  ;1024 b = 1 Kb	
	 *	showImg:可选，是否显示预览图 true显示, false不显示   默认true
	 *  imgHeight:预览图片高度，当showImg为true时生效  默认为100
	 *  imgWidth:预览图片宽度，当showImg为true时生效  默认为100
	 *  showFileName:可选，是否显示名称 true显示, false不显示   默认true
	 *  回调函数返回 chResponse
	 */
	$.fn.jqueryFileUploadForm = function(options) {
		var setting = {
				uri:null,
				dataType:'json',
				autoUpload:true,
				formData:null,
				progressbar:false,
				//acceptFileTypes:'/(\.|\/)(gif|jpg|png|txt|pdf|ppt|pptx|doc|docx|xls|xlsx|zip|tar|rar|gz|7z)$/i',apk,deb,pxl,ipa,wgt,wgtu,mp3,wav,wma,amr,awb
				acceptFileTypes:'/gif|jpg|png|txt|pdf|ppt|pptx|doc|docx|xls|xlsx|zip|tar|rar|gz|7z|apk|deb|pxl|ipa|wgt|wgtu|mp4|3gp|mp3|wav|wma|amr|awb$/i',
				maxFileSize:104857600000,
				FileSubmitId:'',//当个文件控件 提交的按钮Id
				showImg:true,
				imgHeight:100,
				imgWidth:100,
				showFileName:true,
				closeAfterFun:function() {}
		}
		var count = 0;

		setting = $.extend(setting,options);
		var jqXHR = null;
		var isStarting = false;
		var uploadDatas = null;
		var isSuccess = true;
		if(null != setting.uri && setting.uri != '') {
			//$(this).fileupload('destroy');
			jqXHR = $(this).fileupload({
		        url:setting.uri,
		        dataType: setting.dataType,
		        autoUpload:setting.autoUpload,
		        formData:setting.formData,
		        acceptFileTypes:setting.acceptFileTypes,
		       // maxFileSize:setting.maxFileSize,
		        add:function(e,data) {
		        	var file = data.files[0];
		        	var ext = getFileSuffix(file.name);
		        	var name = file.name;
	        		var size = file.size;
	        		var isExt = checkRegexp(eval(setting.acceptFileTypes),ext);
	        		var isSize = setting.maxFileSize<file.size?false:true;
	        		
	        		//判断文件格式和大小
	        		if(isExt){
	        			if(!isSize){
		        			BootstrapDialogUtil.infoAlert("文件大小不能超过"+setting.maxFileSize/1024+"KB!");
		        			return false;
	        			}
	        		}else{
	        			BootstrapDialogUtil.infoAlert("文件格式不正确，只能上传，"+setting.acceptFileTypes+"请重新上传!");
	        			return false;
	        		}
	        		
	        		//显示文件名称
	        		if(setting.showFileName){
	        		  $("#"+setting.FileSubmitId+"_file_name").remove();
	        		  $(this).parent().after('<p id="'+setting.FileSubmitId+'_file_name">'+name+'</p>');
	        		}else{
	        			$("#"+setting.FileSubmitId+"_file_name").remove();
		        		$(this).parent().after('<p id="'+setting.FileSubmitId+'_file_name" class="m-b-10"></p>');
	        		}
	        		
	        		//显示预览图片
	        		if(setting.showImg){
	        		  var show_img_src = window.URL.createObjectURL(file);
	    			  var imgHtml = ' <img onclick=showPictureModle("'+show_img_src+'"); id="'+setting.FileSubmitId+'_show_img" class="picture-view-event"  src="'+show_img_src+'" height="'+setting.imgHeight+'" width="'+setting.imgWidth+'">';
		        	  $("#"+setting.FileSubmitId+"_show_img").remove();
	    			  $("#"+setting.FileSubmitId+"_file_name").after(imgHtml);
	        		}
	        		
	        		//文件计数
		        	count++;
		        	$("#"+setting.FileSubmitId).off().click(function(){
				        data.submit();
		        	});
		        	data.context=count;
		        	return true;
		        },
		        progressall:function(e, data){
		        	//if(setting.progressbar) {
			        //	var progress = parseInt(data.loaded/data.total * 100, 10);
			        //	var $progressBar = $("#upload-wait-msg .progress-bar");
			        //	$progressBar.css({"width":progress+"%"});
			        //	$progressBar.attr("aria-valuenow",progress+"%");
			        //	$progressBar.html(progress+"%");
		        	//}
		        },
		        done:function(e, data) {
		    //    	data = jQuery.parseJSON(msg.output);
			        if(null != data.result && data.result != '') {
			          var output =  data.result;//$.parseJSON(data.result.output);
			          count--;
			          //if(null == uploadDatas) {
			        //	  uploadDatas = new Array();
			          //}
			          var i = parseInt(data.context);
			          i = i>0?(i-1):i;
			         // uploadDatas[i]=output.data;
			          if(count<1) { //判断文件是否全部上传完
			        	  jqXHR = null;
			        	  isStarting = false;
			        	  if(isSuccess) {
			        		  setTimeout(function(){
			        			  var fun = eval(setting.closeAfterFun);
			        				if(typeof(fun)==='function')
			        				     fun(output,setting.FileSubmitId);
			        		  },1500);
			        	  }
			          }
			        }
			        data = null;
			    },
			    fail:function(e,data){
			    	var responseText = data.jqXHR.responseText;
			        if(null != responseText && typeof(responseText) != 'undefined' && responseText != '') {
			        	var resultData = $.parseJSON(responseText);
				        var output =  $.parseJSON(resultData.output);
				        showMsg(output.msg);
			        }
			        data = null;
			    }
		    });
		};
		
	}
})(jQuery)
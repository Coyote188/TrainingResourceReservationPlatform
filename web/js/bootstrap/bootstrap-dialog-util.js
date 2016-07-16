/**
 * 
 * @returns
 */
var BootstrapDialogUtil = function() {
	
}

/**
 * 
 * @param title
 * @param uri
 * @param popWidth
 */
BootstrapDialogUtil.loadUriDialog = function(title,uri,popWidth,bgColor,isFooter) {
	if(isNaN(popWidth) || typeof(popWidth) === 'undefined' || popWidth == null) {
		popWidth = 600;
	}
	if(typeof(isFooter) === 'undefined') {
		isFooter = false;
	}
	$.ajax({
		 url: uri,global: false,type: "POST",dataType: "html",async:false,
	     success: function(msg){
	    	 BootstrapDialog.show({
	 			title:title,draggable: true,width:popWidth,backgroundColor:bgColor,
	 			message: function(dialog) {
	 				var html = dialog.getModalFooter();
	 				if(!isFooter)
	 				    $(html).find(".bootstrap-dialog-footer").parent().addClass("not-modal-footer");
	 				return msg;
	 			}
	 		});
	     }
	 });
}

BootstrapDialogUtil.loadUriDialogCallback = function(title,uri,popWidth,bgColor,isFooter) {
	if(isNaN(popWidth) || typeof(popWidth) === 'undefined' || popWidth == null) {
		popWidth = 600;
	}
	if(typeof(isFooter) === 'undefined') {
		isFooter = false;
	}
	$.ajax({
		 url: uri,global: false,type: "POST",dataType: "html",async:false,
	     success: function(msg){
	    	 BootstrapDialog.show({
	 			title:title,draggable: true,width:popWidth,backgroundColor:bgColor,
	 			message: function(dialog) {
	 				var html = dialog.getModalFooter();
	 				if(!isFooter)
	 				    $(html).find(".bootstrap-dialog-footer").parent().addClass("not-modal-footer");
	 				return msg;
	 			}
	 		});
	     }
	 });
}

/**
 * 
 * @param title
 * @param uri
 * @param popWidth
 */
BootstrapDialogUtil.dialog = function(title,id,popWidth,bgColor,isFooter) {
	if(isNaN(popWidth) || typeof(popWidth) === 'undefined' || popWidth == null) {
		popWidth = 600;
	}
	if(typeof(isFooter) === 'undefined') {
		isFooter = false;
	}
	BootstrapDialog.show({
		title:title,
		draggable: true,
		width:popWidth,
		backgroundColor:bgColor,
		message: function(dialog) {
			var html = dialog.getModalFooter();
			if(!isFooter)
				$(html).find(".bootstrap-dialog-footer").parent().addClass("not-modal-footer");
			return $(id).html();
		}
	});
};

/**
 * 确认对话框
 */
BootstrapDialogUtil.confirmDialog = function(msg,callback) {
	BootstrapDialog.show({
		title:"提示",message:msg,
		buttons: [{
            label: '确定',cssClass: 'btn-primary',
            action: function(dialog) {
            	if(typeof(callback) != 'undefined' && 
            					callback != null && 
            					typeof(callback) == 'function') {
            				callback();
            	}
            	dialog.close();
            }
        }, {
            label: '取消',cssClass: 'btn-primary',
            action: function(dialog) {
                dialog.close();
            }
        }]
   });
}

/**
 * 删除对话框
 */
BootstrapDialogUtil.delDialog = function(name,uri,ids,callback) {
	BootstrapDialog.show({
		title:"提示",message:"确定要删除<strong>“"+name+"”</strong>吗？",
		buttons: [{
            label: '确定',cssClass: 'btn-primary',
            action: function(dialog) {
            	$.post(uri,{id:ids},
            	    function(data){
            		var datas = jQuery.parseJSON(data.output);
            		if(datas.result=='1') {
            			if(typeof(callback) != 'undefined' && 
            					callback != null && 
            					typeof(callback) == 'function') {
            				callback();
            			}
            		} else {
            			BootstrapDialog.show({title:"提示",message:datas.msg,type:BootstrapDialog.TYPE_DANGER});
            		}
            		dialog.close();
            	});
            }
        }, {
            label: '取消',cssClass: 'btn-primary',
            action: function(dialog) {
                dialog.close();
            }
        }]
   });
}

/**
 * 
 * @param msg
 */
BootstrapDialogUtil.infoAlert = function(msg) {
	BootstrapDialog.show({title:"提示",message:msg,type:BootstrapDialog.TYPE_PRIMARY,
		buttons: [{
			label: '确定',
	        action: function(dialogItself){
	            dialogItself.close();
	        }
	    }]
	});
}

/**
 * 
 * @param msg
 */
BootstrapDialogUtil.warningAlert = function(msg) {
	BootstrapDialog.show({title:"提示",message:msg,type:BootstrapDialog.TYPE_DANGER,
		buttons: [{
			label: '确定',
	        action: function(dialogItself){
	            dialogItself.close();
	        }
	    }]	
	});
}
BootstrapDialogUtil.close = function() {
	BootstrapDialog.closeAll();
}
BootstrapDialogUtil.closeCb = function() {
	BootstrapDialog.closeAll();
	parent.location.reload();
}

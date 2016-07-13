<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <div class="wrap-content-dialog">
      <div class="row p-t-15">
          <form class="form-horizontal" role="form" id="form-edit" method="post" action="user/changePwd">
                <div class="form-group">
				    <label for="input1" class="col-sm-3 control-label">当前用户</label>
				    <div class="col-sm-6">
				       <input class="form-control" id="input1" type="text" value="${userInfo.username }" disabled />
				    </div>
			    </div>
                <div class="form-group">
				    <label for="input2" class="col-sm-3 control-label">旧密码</label>
				    <div class="col-sm-6">
				      <input type="text" id="input2" class="form-control require" label-name="旧密码" placeholder="" name="oldPwd" />
				    </div>
			    </div>
			     <div class="form-group">
				    <label for="new-pwd" class="col-sm-3 control-label">新密码</label>
				    <div class="col-sm-6">
				      <input type="password" id="new-pwd" class="form-control require" label-name="新密码" placeholder="" name="newPwd" />
				    </div>
			    </div>
			     <div class="form-group">
				    <label for="confirm-new-pwd" class="col-sm-3 control-label">确认新密码</label>
				    <div class="col-sm-6">
				      <input type="password" id="confirm-new-pwd" class="form-control require" label-name="确认新密码" placeholder="" name="confirmNewPwd" />
				    </div>
			    </div>
			    <div class="form-group">
				    <div class="col-sm-11 text-center">
				      <button type="submit" class="btn btn-default">确定</button>
				    </div>
				 </div>
          </form>
      </div>
</div><!-- wrap-content-dialog -->
<script type="text/javascript">
setTimeout("loadJs()", 200);
var alertTmp = null;
function loadJs() {
	cu.layout.formRequire();
	cu.layout.formActive();
	listenerPwdFocus();
	$("#form-edit").submit(function(){
	   if(checkForm("#form-edit",'top')) {
	      // var params = $("#form-edit").serialize();
	       var newPwd = $("#new-pwd").val();
	       var cnp  = $("#confirm-new-pwd");
	       var confirmNewPwd = cnp.val();
	       if(newPwd != confirmNewPwd) {
	          cnp.popover({placement:'top',
						content:"两次输入的密码不一致!",
						trigger:"manual"});
			  cnp.popover('show');
			  popoverTmp = cnp;
			  if(cnp.hasClass("form-control")) {
                 cnp.parent().addClass("has-error");
			 }
	       } else {
	         var params = $(this).serialize();
	           var uri = $(this).attr("action");
	          if(trim(uri) != '') {
		          cu.toast("正在提交数据...", {type : "load"});
	              $.post(uri+"?"+params,function(data) {
	                    cu.toast.close();
		                var output = $.parseJSON(data.output);
		              
		                if(output.result=='1') {
		                   BootstrapDialogUtil.close();
		                   cu.toast(output.msg);
		                } else if(output.data=='1') {
		                    cnp.popover({placement:'top',
							content:output.msg,
							trigger:"manual"});
						    cnp.popover('show');
						    if(cnp.hasClass("form-control")) {
                    	         cnp.parent().addClass("has-error");
					         }
						    popoverTmp = cnp;
		                } else if(output.data=='2') {
		                    var input = $("#input2");
		                    input.popover({placement:'top',
							content:output.msg,
							trigger:"manual"});
						    input.popover('show');
						    if(input.hasClass("form-control")) {
                    	         input.parent().addClass("has-error");
					         }
						    popoverTmp = input;
		                } else {
		                    cu.toast(output.msg);
		                }
	             });
	          }//uri
	       }//==
	   }//checkForm
	  return false;
	});
}
function listenerPwdFocus() {
      $("#new-pwd,#confirm-new-pwd").focus(function(){
	       if(null != popoverTmp) {
	           popoverTmp.popover('destroy');
	           popoverTmp = null;
	           if($(popoverTmp.hasClass("form-control"))) {
        	      popoverTmp.parent().removeClass("has-error");
		       }
	       }
	   });
}
</script>
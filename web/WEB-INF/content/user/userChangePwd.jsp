<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="wrap-content-dialog">
      <div class="container p-t-15">
          <form class="form-horizontal" role="form" id="form-edit" method="post" action="user/userChangePwd">
                <input type="hidden" name="id" value="${objBean.id }" />
                <div class="form-group">
				    <label for="input1" class="col-sm-3 control-label">当前用户</label>
				    <div class="col-sm-6">
				       <input class="form-control" id="input1" type="text" value="${objBean.userName }" disabled />
				    </div>
			    </div>
			     <div class="form-group">
				    <label for="new-pwd" class="col-sm-3 control-label">新密码</label>
				    <div class="col-sm-6">
				      <input type="password" id="new-pwd" class="form-control require" label-name="新密码"  name="newPwd" />
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
function loadJs() {
cu.layout.formRequire();
cu.layout.formActive();
	$("#form-edit").submit(function() {
	    if(checkForm("#form-edit",'top')) {
			var list = $("#form-edit").serialize();
			var uri = $(this).attr("action");
			cu.toast("提交中...", {type : "load"});
			$.post(uri, list,function(json) {
					cu.toast.close();
					var output = $.parseJSON(json.output);
					cu.toast(output.msg);
					if(output.result == '1') {
						BootstrapDialogUtil.close();
					}
			 });
		 }
		return false;
	});
}
</script>
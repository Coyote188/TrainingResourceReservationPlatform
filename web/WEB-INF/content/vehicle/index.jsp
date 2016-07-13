<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="include/orgZtree" executeResult="true" />
</div>
<script type="text/javascript">
   loadUri("#cu-org-content","user/list");
  // treeOrgLinkListener();
	/**
	 * 监听组织机构点击事件
	 * @returns
	 */
	function treeOrgLinkListener() {
		$("#tree-org a").on('click',function() {
			var id = $(this).attr("href");
			$("#tree-org a").each(function(e) {
				$(this).removeClass("active");
			});
			$(this).addClass("active");
			if(trim(id) != '') {
				loadUri("#cu-org-content","user/list?orgId="+id);
			}
			return false;
		});
	}
</script>
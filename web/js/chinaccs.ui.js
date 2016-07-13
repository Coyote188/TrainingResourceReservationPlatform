/*chinaccs-ui*/
var cu = { // ui 超级类
	version : 1.1,
	url : "",
	include : function(settings) { // 加载css和js的方法
		var p = {
			commPath : "",
			cssFiles : [],
			jsFiles : []
		};

		var ps = $.extend(p, settings);
		var g = {
			getCssDoc : function(url) {
				html = "<link rel='stylesheet' type='text/css' href='" + url
						+ "' />";
				document.write(html);
				document.close();
			},
			getJsDoc : function(url) {
				html = "<script type='text/javascript' src='" + url
						+ "' ></script>";
				$("head").append(html);
			}
		};
		var url = "";
		var jlen = ps.jsFiles.length;
		if (jlen > 0) {
			for ( var i = 0; i < jlen; i++) {
				url = ps.commPath + ps.jsFiles[i];
				g.getJsDoc(url);
			}
		}
		var clen = ps.cssFiles.length;
		if (clen > 0) {
			for ( var i = 0; i < clen; i++) {
				url = ps.commPath + ps.cssFiles[i];
				g.getCssDoc(url);
			}
		}
	},
	buildSelect : function(settings) {
		var p = {
			url : "",
			selectId : "",
			param : "",
			ajaxDo : function() {

			},
			isDef : true,
			defValue : "-1",
			defItem : "无",
			selectValue : ""
		};
		var ps = $.extend(p, settings);
		$.post(ps.url, ps.param, function(json) {
			var output = jQuery.parseJSON(json.output);
			var datas = output.data;
			var result = output.result;
			var html = "";
			if (ps.isDef)
				html += '<option value="' + ps.defValue + '">' + ps.defItem
						+ '</option>';
			if (result == "1") {
				for ( var i = 0; i < datas.length; i++) {
					var org_name = "";
					org_name += datas[i][1];
					if (datas[i][0] == ps.selectValue) {
						html += '<option value="' + datas[i][0]
								+ '" selected="selected">' + org_name
								+ '</option>';
					} else {
						html += '<option value="' + datas[i][0] + '">'
								+ org_name + '</option>';
					}
				}
			}
			$(ps.selectId).empty().append(html);
			ps.ajaxDo();
		});
	},
	formRequest : function(element) {// 表单元素不能为空
		var isChecked = true;
		var $et = $(element);
		if ($et.size() > 0) {
			$et.each(function() {
				if ($(this).val() == "" || $(this).val() == undefined) {
					$(this).addClass("border1-red");
					isChecked = false;
				}
			});
			$et.focus(function() {
				$(this).removeClass("border1-red");
			});
		}
		return isChecked;
	},
	formCheck : function(settings) {
		var isChecked = true;
		var p = {
			element : "input[?]",
			info : "unknown error",
			checkDo : function(value) {
				return true;
			}
		};
		var ps = $.extend(p, settings);
		var $et = $(ps.element);
		if ($et.size() > 0) {
			$et.each(function() {
				var value = $(this).val();
				isChecked = ps.checkDo(value);
				if (!isChecked) {
					$(this).addClass("border1-red");
					$(this).after("<p class='red'>" + ps.info + "</p>");
				}
				$et.focus(function() {
					$(this).removeClass("border1-red");
					$(this).next("p.check_error").remove();
				});
			});
		}
		return isChecked;
	},
	formCheckClear : function(formId) {
		$(formId).find(".border1-red").removeClass("border1-red");
		$(formId).find("p.red").remove();
	}
};
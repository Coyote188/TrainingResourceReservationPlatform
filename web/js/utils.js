/**
 * 获取文件后缀
 */
function getFileSuffix(fileName) {
	var suffix = "";
	if(null != fileName && fileName != '' && fileName != undefined) {
		var suffixP = fileName.lastIndexOf(".");
		suffix = fileName.substring(suffixP,fileName.length).toLowerCase();
	}
	return suffix;
}

/**
 * 获取class中含有containValue指定字符串的class
 * @param value
 * @param containValue
 * @returns {String}
 */
function getClassContain(value,containValue) {
	var className = null;
	if(!isEmpty(value)) {
		var values = value.split(" ");
		if(values.length>0) {
			for ( var i = 0; i < values.length; i++) {
				if(isContain(values[i], containValue)) {
					className = trim(values[i]);
					break;
				}
			}
		}
	}
	return className;
}
/**
 * 判断是否包含字符串
 * @param srcValue
 * @param destValue
 * @returns
 */
function isContain(srcValue,destValue) {
	var i = srcValue.indexOf(destValue);
	return (i==-1)?false:true;
}



/**
 * 判断是否为图片格式(gif,jpg,png)
 */
function isImageFormat(fileName) {
	var is = false;
	var suffix = getFileSuffix(fileName);
	if(suffix == 'gif' || suffix=='jpg' || suffix=='png') {
		is = true;
	}
	return is;
}


/**
 * 去左空格
 */
function ltrim(str) {
	str=str.replace( /^\s*/, "");
	return str;
}

/**
 * 去右空格
 * 
 * @param str
 */
function rtrim(str) {
	str=str.replace(/(\s*$)/g, "");
	return str;
}

/**
 * 
 * @param str
 * @param reg1
 * @param reg2
 * @returns
 */
function replaceAll(str,reg1,reg2) {
	var reg = new RegExp(reg1,"g");
	str = str.replace(reg,reg2);
	return str;
}

/**
 * 去空格
 * @param str
 */
function trim(str) {
	str = str.replace(/\s+/g,"");
	return str;
}

var popoverTmp = null;
function listenerInputFocus(tag) {
	$(tag+" input").focus(function(){
		if(popoverTmp != null) {
			$(popoverTmp).popover('destroy');
			popoverTmp = null;
		}
		if($(jQuery(this).hasClass("form-control"))) {
        	jQuery(this).parent().removeClass("has-error");
		}
	});
}
/**
 * 检测表单
 * @param tag
 * @param place  属性有：top,bottom,left,right,auto
 * @returns {Boolean}
 */
function checkForm(tag,place) {
	var result = true;
	if(trim(tag) != '') {
		jQuery(tag+" input").each(function(){
			var isRequire = jQuery(this).hasClass("require");
			var labelName = jQuery(this).attr("label-name");
			if(typeof(labelName) === 'undefined') {
				labelName = '';
			}
			var value = trim(jQuery(this).val());
			if(isRequire) {
				if(value == '') {
					if(place == undefined || trim(place) == '') {
						place = "auto";
					} 
                    if($(jQuery(this).hasClass("form-control"))) {
                    	jQuery(this).parent().addClass("has-error");
					}
					$(this).popover({placement:place,
						content:labelName+"不能为空!",
						trigger:"manual"});
					$(this).popover('show');
					popoverTmp = this;
					result = false;
					return result;
				}
			}
			//验证长度、格式
			if(value != '') {
				var lenStr = jQuery(this).attr("length");
				var dataFormat = jQuery(this).attr("data-format");
				if(typeof(lenStr) !== 'undefined' || typeof(dataFormat) !== 'undefined') {
					if(typeof(lenStr) === 'undefined')
						lenStr = '';
					if(typeof(dataFormat) === 'undefined')
						dataFormat = '';
					if(trim(lenStr) != '' && trim(dataFormat) != '') {
						result = checkLen(value, lenStr);
						if(result) {
							result = result && checkDataFormat(value, dataFormat);
						}
					} else if(trim(lenStr) != '' && trim(dataFormat) == '') {
					   result = checkLen(value,lenStr);
					} else if(trim(dataFormat) != '' && trim(lenStr) == '') {
						result = checkDataFormat(value,dataFormat);
					}
					if(!result) {
						result = result && false;
						if($(jQuery(this).hasClass("form-control"))) {
	                    	jQuery(this).parent().addClass("has-error");
						}
						$(this).popover({placement:place,
							content:labelName+"输入错误!",
							trigger:"manual"});
						$(this).popover('show');
						popoverTmp = this;
					}
				}
			}//end if
		});
		listenerInputFocus(tag);
		//alert(result);
		return result;
	}
	
}

/**
 * 验证长度
 * @param value
 * @param lenStr
 * @returns {Boolean}
 */
function checkLen(value,lenStr) {
	
	var is = false;
	if(regexNum(lenStr)) {
		if(value.length==parseInt(lenStr)) {
			is = true;
		}
	} else if(lenStr.indexOf(",")>0) {
		var lens= lenStr.split(",");
		if(lens.length==2 && regexNum(lens[0]) && regexNum(lens[1])) {
			if(value.length >= parseInt(lens[0]) && 
					value.length <= parseInt(lens[1])) {
				is = true;
			}
		}
	} else if(lenStr.indexOf("|")>0) {
		var lens = lenStr.split("|");
		for(var i=0;i<lens.length;i++) {
			if(regexNum(lens[i]) && (value.length == parseInt(lens[i]))) {
				is = true;
				break;
			}
		}
	}
	return is;
}

function checkDataFormat(value,dataFormat) {
	var is = false;
	switch (dataFormat) {
	case 'num':
		is = regexNum(value);
		break;
	case 'decimal':
		is = regexDecimal(value);
		break;
	case 'integer':
		is = regexInteger(value);
		break;
	case 'ip':
		is = regexIp(value);
		break;
	case 'chinese':
		is = checkChinese(value);
		break;
	case 'email':
		is = checkEmail(value);
		break;
	case 'phone':
		is = checkPhoneNo(value);
		break;
	case 'telephone':
		is = checkTelephone(value);
		break;
	case 'qq':
		is = checkQQ(value);
		break;
	case 'card-no':
		is = checkCardNo(value);
		break;
	default:
		is = false;
		break;
	}
	return is;
}

/**
 * 匹配IP地址
 * 
 * @param ip
 * @returns {Boolean}
 */
function regexIp(ip) {
	var regex = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;
	if(RegExp(regex).test(ip)){
		if (RegExp.$1 <= 255 && RegExp.$1 > 0 
				&& RegExp.$2 <= 255 && RegExp.$2 >= 0 
				&& RegExp.$3 <= 255 && RegExp.$3 >= 0 
				&& RegExp.$4 <= 255 && RegExp.$4 > 0
				) {
			return true;
		}
	}
	return false;
}

/**
 * 匹配数字（整数和小数）
 * 
 * @param num
 * @returns {Boolean}
 */
function regexNum(num) {
	var regex = /^\d+$|^\d+\.\d+$/;
	if(regex.test(num)) {
		return true;
	}
	return false;
}

/**
 * 匹配小数
 * 
 * @param num
 * @returns {Boolean}
 */
function regexDecimal(num) {
	var regex = /^\d+\.\d+$/;
	if(regex.test(num)) {
		return true;
	}
	return false;
}

/**
 * 匹配整数
 * @param num
 * @returns {Boolean}
 */
function regexInteger(num) {
	var regex = /^\d+$/;
	if(regex.test(num)) {
		return true;
	}
	return false;
}
/**
 * 验证是否匹配表达式
 * @param regexp
 * @param value
 */
function checkRegexp(regexp,value) {
	var is = false;
	var regex = eval(regexp);
	if(regex.test(value)) {
		is = true;
	}
	return is;
} 

/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkChinese(value) {
	var regex = /^[\u4E00-\u9FA5]+$/gi;
	if(regex.test(value)) {
		return true;
	}
	return false;
}

/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkEmail(value){
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(reg.test(value)){
		return true;
	}else{
		return false;
	}
}
/**
 * 关闭等待(加载)窗口
 */
function closeWaitLoading() {
	$("#wait-msg").hide();
	closeShadow();
}
/**
 * 关闭遮盖层
 * @param msg
 */
function closeShadow() {
	$("#shadow").hide();
}
function isEmpty(str) {
	var is = true;
	if(typeof(str) !== 'undefined' && null != str && trim(str.toString()) != '') {
		is = false;
	}
	return is;
}
/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkCode(value) {
	var reg = /^[a-z|A-Z|0-9]{6}$/;
	if(reg.test(value)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkSMSCode(value) {
	var reg = /^[0-9]{6}$/;
	if(reg.test(value)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 验证手机号码
 * @param value
 * @returns {Boolean}
 */
function checkPhoneNo(value) {
    var reg = /(^0{0,1}1[3|5|8][0-9]{9}$)/;
    if (!reg.test(value)) {
        return false;
    }
    return true;
}

/**
 * 验证固定电话号码
 * @param value
 * @returns {Boolean}
 */
function checkTelephone(value) {
	var regex = /^[0][0-9]{2,3}\-[2-9][0-9]{6,7}(\-[0-9]{1,4})?$/;
	if(regex.test(value)) {
		return true;
	}
	return false;
}

/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkQQ(value) {
    var reg = /^[1-9]\d{4,11}$/;
    if (!reg.test(value)) {
        return false;
    }
    return true;
}

/**
 * 身份证号码验证 <br />
 * 需要引入check-card-no.js文件
 * @param value
 * @returns {Boolean}
 */
function checkCardNo(value) {
	return checkCard(value);
}

/**
 * 
 * @param value
 * @returns {Boolean}
 */
function checkAnonymous(value) {
	var reg = /^[\u4e00-\u9fa5|A-Za-z]([\w|\u4e00-\u9fa5]){1,7}$/;
    if (!reg.test(value)) {
        return false;
    }
    return true;
}

/**
 * 
 * @returns {String}
 */
function generateUniqueKey() {
	var len = 10;
	var time = new Date().getTime();
	var random = randomNum(len);
	if(random.length>len) {
		random = random.substring(0, len);
	}
	return time+''+random;
}

/**
 * 
 * @param n
 * @returns {String}
 */
function randomNum(n) {
	if(!regexNum(n)) {
		n = 6;
	}
	var num = '';
	for ( var i = 0; i < n; i++) {
		num += Math.round(Math.random()*10)+'';
	}
	return num;
}

/**
 * 显示信息
 * @param msg
 */
function showMsg(msg) {
	if($("#alert-msg").attr("id") == undefined) {
		$("body").append("<div id='alert-msg'>"+msg+"</div>");
	}
	var w = 250; 
	var h = 60;
	$("#alert-msg").html(msg);
	var top = $(document).scrollTop(); 
	var sw = ($(window).width()-w)/2;
	var sh = ($(window).height()-h)/2+top;
	var index = $("#shadow").css("z-index")/1+1/1;
	if(isNaN(index)) {
		index = 9999;
	}
	$("#alert-msg").css({"top":sh+"px","left":sw+"px","width":w+"px","height":h+"px","display":"block","z-index":index});
	$("#alert-msg").fadeOut(3000);
}

/**
 * 加载数据
 * @param msg
 */
function waitLoading(msg) {
	if($("#wait-msg").attr("id") == undefined) {
		$("body").append("<div id='wait-msg'><div class='msg-body'>"+msg+"</div></div>");
	}
	if($("#shadow").attr("id") == undefined) {
		$("body").append("<div id='shadow'></div>");
	}
	var w = 250; 
	var h = 60;
	$("#shadow").show();
	$("#wait-msg .msg-body").html(msg);
	var top = $(document).scrollTop();
	var index = $("#shadow").css("z-index")/1+1/1;
	var sw = ($(window).width()-w)/2;
	var sh = ($(window).height()-h)/2+top;
	$("#wait-msg").css({"top":sh+"px","left":sw+"px","width":w+"px","height":h+"px","display":"block","z-index":index});
}

/**
 * 
 */
function colseWaitLoading() {
	$("#wait-msg").hide();
	$("#shadow").hide();
}

/**
 * 下拉框
 * @param id
 * @param busiValue
 * @param defaultValue
 */
function selectDictItem(id,busiValue,defaultValue) {
	if(typeof(busiValue) !== 'undefined' && trim(busiValue) != '') {
		if(typeof(defaultValue) === 'undefined') {
			defaultValue = '';
		}
		$.post("dict/item?busiValue="+busiValue,function(data){
			var output = $.parseJSON(data.output);
			if(output.result=='1') {
				var datas = output.data; 
				if(datas.length>0) {
					var options = '';
					for(var i=0;i<datas.length;i++) {
						if(datas[i][0] == defaultValue) {
							options +='<option value="'+datas[i][0]+'" selected>'+datas[i][1]+'</option>';
						} else {
							options +='<option value="'+datas[i][0]+'">'+datas[i][1]+'</option>';
						}
					}
					$(id).append(options);
				}
			} else {
				cu.toast(output.msg);
			}
		});
	}
	
}

/**
 * @param id
 * @param data
 * @param  defValue 默认值
 * @param defName 默认名称
 * 
 * */
function setAllSelectValue(id,reqData,defValue,defName) {
	$.post(reqData,function(data){
		var output = $.parseJSON(data.output);
		if(output.result=='1') {
			var datas = output.data; 
			if(datas.length>0) {
				var select = $("#" + id);
				$(data).each(
						function() {
							if(defValue==$(this)[0]||defName==$(this)[1]){
								$(select).append(
									"<option selected='selected' value='" + $(this)[0] + "'>" + $(this)[1]
											+ "</option>");
							}else{
								$(select).append(
										"<option  value='" + $(this)[0] + "'>" + $(this)[1]
												+ "</option>");
							}
						});
			}
		}
	})
}

$.extend({
	selectInspItem :function (id,orgId,defaultValue) {
		if(typeof(orgId) !== 'undefined' && trim(orgId) != '') {
			if(typeof(defaultValue) === 'undefined') {
				defaultValue = '';
			}
			$.post("repairPerson/itemPerson?org="+orgId,function(data){
				var output = $.parseJSON(data.output);
				if(output.result=='1') {
					var datas = output.data; 
					if(datas.length>0) {
						var options = '';
						for(var i=0;i<datas.length;i++) {
							if(datas[i][0] == defaultValue) {
								options +='<option value="'+datas[i][0]+'" selected>'+datas[i][1]+'</option>';
							} else {
								options +='<option value="'+datas[i][0]+'">'+datas[i][1]+'</option>';
							}
						}
						$(id).append(options);
					}
				} else {
					cu.toast(output.msg);
				}
			});
		}
		
	}
})
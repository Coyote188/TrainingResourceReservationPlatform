<link href="${pageContext.request.contextPath}/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${pageContext.request.contextPath}/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<style type="text/css">
.datetimepicker.dropdown-menu {
    background-clip: padding-box;
    background-color: #fff;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 4px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);
    display: none;
    float: left;
    font-size: 12px;
    left: 0;
    list-style: none outside none;
    margin: 2px 0 0;
    min-width: 160px;
    padding: 5px 0;
    position: absolute;
    top: 100%;
    z-index: 1000;
}
.date .input-group-addon {
    font-size: 12px;
    line-height: 0;
    /*padding: 0 6px;*/
    padding: 4px;
}
.date .form-control{
	padding:0 0 0 2px;
}
.date .input-group-addon{
    display: inline-block;
    width:24px;
    height:24px;
    text-align:center;
}
</style>

<script type="text/javascript"> 	
	$('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
	$('.form_date').each(function(index){
		var datatime = $('.form_date').eq(index).parent().find('input[type="text"]').eq(0).val();
		if(datatime == "")
			$(this).datetimepicker('update',new Date());
		else
			$(this).datetimepicker('update',datatime);
	});
	$('.form_datetime').each(function(index){
		//if($(this).val() == "")
			//$(this).datetimepicker('update','2013-04-05 11:22:33');
		//alert($(this).text());
		//alert($('.form_datetime:input[type="text"]').eq(index).val());
		//alert($('.form_datetime').eq(index).find('input[type="text"]').eq(0).val());
		var datatime = $('.form_datetime').eq(index).parent().find('input[type="text"]').eq(0).val();
		if(datatime == "")
			$(this).datetimepicker('update',new Date());
		else
			$(this).datetimepicker('update',datatime);
	});
	$('.form_time').each(function(index){
		var datatime = $('.form_time').eq(index).parent().find('input[type="text"]').eq(0).val();
		if(datatime == "")
			$(this).datetimepicker('update',new Date());
		else
			$(this).datetimepicker('update',datatime);
	});
	//$('.form_datetime').datetimepicker('remove');
</script>
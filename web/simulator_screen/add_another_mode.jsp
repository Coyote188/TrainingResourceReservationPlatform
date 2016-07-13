<style>
<!--
.screen
{
	width: 100%;
	margin: 5px 0 0 0;
}
.screen div
{
	height: 30px;
    line-height: 30px;
    width: 100%;
}
.screen .title
{
	font-size: 20px;
    font-weight: 200;
    margin-right: 45px;
}
.screen .menu
{
	font-size: 20px;
    font-weight: 800;
    margin-right: 30px;
}
.screen .tune
{
	font-size: 22px;
    font-weight: 800;
    margin-left: 10px;
    height: 50px;
    line-height: 50px;
    width: 100%;
}
.screen .frequency
{
	font-size: 20px;
    font-weight: 800;
    padding-right: 100px;
    text-align: right;
}
.screen .devstat
{
	font-size: 15px;
    font-weight: 300;
    margin-right: 10px;
    width: 100%; height: 25px;
}
-->
</style>
<script type="text/javascript">
<!--
$.extend({
	fnNextProcess: function(type){
		if(type == '1'){
	    	var val = $("#__trans_freq").find("input").val();
			$.fnLoadScreen("modes-menu.jsp");
		}else{
			$.fnCreateDevicesLinks(NetworkSetting);
			//console.log(NetworkSetting);
			deviceNetSettingList.push(NetworkSetting);
			$.fnLoadScreen("screen.jsp");
		}
    }
});
//-->
</script>
<div class="screen">
	<div style="width: 100%; height: 15px;">
		<label class="title">
			Add Another
		</label>
	</div>
	<div style="width: 100%; height: 100px; " id="___menus">
		<label>Mode ?</label>
	</div>
	<div style="width: 100%; height: 50px;">
		<label class="menu">
			Mute
		</label>
		<label class="menu">
			Call
		</label>
		<label class="menu">
			Scan
		</label>
	</div>
</div>

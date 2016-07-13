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
	fnShowTune: function(devName){
		$.each(deviceNetSettingList, function(i, dev){
    		if(devName == dev.dev_name)
    		$("#tune_name").text(dev.name);
    		if(dev.recv_freq == dev.trans_freq){
    			$("#tune_frequency").text(dev.recv_freq);
    		}else{
    			$("#tune_frequency").text("rev:" + dev.recv_freq +" tr:" + dev.trans_freq);
    		}
    	});
	}
});
//-->
</script>
<div class="screen">
	<div style="width: 100%; height: 15px;">
		<label class="title">
			Rx.
		</label>
		<label class="title">
			LoV
		</label>
		<label class="title">
			USB
		</label>
	</div>
	<div class="tune">
		<label id="tune_name">
			Free Tune
		</label>
	</div>
	<div class="frequency">
		<label id="tune_frequency">
			20,000
		</label>
	</div>
	<div class="devstat">
		<img alt="" src="images/simulator/Speaker.png">
		<label>
			
		</label>
		&nbsp&nbsp&nbsp&nbsp
		<img alt="" src="images/simulator/antenna.png">
		<label>
			Auto   
		</label>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<img alt="" src="images/simulator/battery.png">
		<label>
			      22h 
		</label>
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

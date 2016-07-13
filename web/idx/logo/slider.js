var _initX = 0;
var _finishX = 0;
var _startX = 0;
var _startY = 0;
function touchStart(event) {
  _startX = event.touches[0].clientX;
  _startY = event.touches[0].clientY;
  _initX = _startX;
}
function touchMove(event) {
  var touches = event.touches;
  var _endX = event.touches[0].clientX;
  var _endY = event.touches[0].clientY;
  if(Math.abs(_endY-_startY)>Math.abs(_endX-_startX)){
    return;    
  }
  event.preventDefault();
  _finishX = _endX;
  var _absX = Math.abs(_endX-_startX);
  var lastX = $('#carouselPics').css('left').replace('px','');
  if(_startX>_endX){
    st.Stop();
    $('#carouselPics').css('left',(parseInt(lastX)-_absX)+'px');
  }else{
    st.Stop();
    $('#carouselPics').css('left',(parseInt(lastX)+_absX)+'px');
  } 
  _startX = _endX;
}
function touchEnd(event) {
  if(_finishX==0){
    return;
  }
  if(_initX>_finishX){
    bindEvent(_initX,_finishX);
  }else if(_initX<_finishX){
    bindEvent(_initX,_finishX);
  }
  _initX = 0;
  _finishX = 0;
}

var picCount = $("#carouselPics li").length;
  
$("#carouselPics").css('width',picCount+'00%');

var st = createPicMove("carouselBox", "carouselPics", picCount);

var forEach = function(array, callback){
  for (var i = 0, len = array.length; i < len; i++) { callback.call(this, array[i], i); }
}

var nums = [];

for(var i = 0, n = st._count - 1; i <= n;i++){
  var li = document.createElement("li");
  nums[i] = document.getElementById("carouselBtns").appendChild(li);
}

st.onStart = function(){
  forEach(nums, function(o, i){ o.className = st.Index == i ? "current" : ""; })
}  

function bindEvent(start,end){
  if (start >= end) {
    st.Next();
  } else {
    st.Previous();
  }
}

st.Run();

var resetScrollEle = function(){
  var slider2Li = $("#carouselPics li");
  slider2Li.css("width",$(".carouselBox").width()+"px");
  
  var oHeight1 = $(window).height();
  var oHeight2 = $('body').height();
  var oFooterHeight = $('#footer').outerHeight();
  if(oHeight1>oHeight2){
    $('#container').css('min-height',(oHeight1-oFooterHeight));  
  }
};

resetScrollEle();

window.addEventListener("orientationchange",function(){
  st.Change = st._slider.offsetWidth/st._count;
  st.Next();
  resetScrollEle();
});

window.addEventListener("resize",function(){
  st.Change = st._slider.offsetWidth/st._count;
  st.Next();
  resetScrollEle();
});
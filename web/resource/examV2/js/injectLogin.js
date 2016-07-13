if(!window.L.extension.injectLogin)
{
    (function(){
        var callbackFun = {'login' : {'after' : []}};
        var sleep = window.L.cookie('user[multiLogin]=`t') === 'yes' ? 600000 : 5000;                   //请求间隔时间
        var temp = document.getElementsByTagName('script');
        var keepOnlineFun = function(response){
            if( response === undefined )                                                                //发送保持连接请求
            {
                if(window.L.cookie('user[login]=`t') != undefined){
                    window.L.cookie({'user' : {'login' : '2'}});                                            //标记已有请求连接
                    arguments.callee.lock = true;
                    $.ajax({
                        'url'     : window.ROOT_URL + '/user.php?a=continuedLogin&rTime=' + (sleep / 1000),
                        'success' : keepOnlineFun,
                        'error'   : keepOnlineFun
                    });
                }
            } else if( $.trim(response) === '1' ) {                                                     //保持连接成功
                window.setTimeout(keepOnlineFun, sleep);                                                //继续保持连接
            } else if( keepOnlineFun.lock ) {                                                           //认为当前已退出(判断是为了解决chrome关闭页面会关闭连接问题)
                if( $.type(response) === 'object' ) {                                                   //连接出错
                    window.setTimeout(keepOnlineFun, 5000);
                } else {
                    window.L.cookie({'user' : {'login' : ''}});                                         //标记未登入
                    arguments.callee.lock = false;                                                      //解锁
                    ecahOnlineFun();                                                                    //继续检查是否已登入
                }
            }
        }
        var ecahOnlineFun = function(){                                                                 //持续请求,已保持在线状态
            if( !keepOnlineFun.lock && window.L.cookie('user[login]=`t') === '1' )                     //登入且没有请求连接状态
            {
                window.clearTimeout(ecahOnlineFun.handle);                                              //清除句柄
                keepOnlineFun();
            } else {
                ecahOnlineFun.handle = window.setTimeout(arguments.callee, 5000);                       //5秒后重新检查
            }
        }

        //初始化对应变量
        temp = temp[temp.length - 1].getAttribute('login') || '';                                       //获取当前
        window.L.cookie('user[login]=`t') !== '2' && window.L.cookie({'user' : {'login' : temp}});      //已登入标识,未登入不存在

        //注入beforeunload
        window.L.event(window, 'beforeunload', function(){
            if( keepOnlineFun.lock )                                                                    //如果当前脚本正在请求中
            {
                keepOnlineFun.lock = false;                                                             //解决chrome关闭页面会关闭连接问题
                window.L.cookie({'user' : {'login' : '1'}});                                            //从新标识呆请求状态
            }
        });

        //注入定时循环请求
        ecahOnlineFun();

        //注入登入判断函数
        window.L.extension.injectLogin = function(thisObj, param){
            if(param !== undefined)
            {
                if(param === 'loginAfter')
                {
                    if(window.location.reload === thisObj)    //如果回调中有刷新页面,那么只执行刷新方法
                    {
                        callbackFun.login.after = [thisObj];
                    } else if(callbackFun.login.after[0] !== window.location.reload) {
                        temp = callbackFun.login.after;
                        temp[temp.length] = thisObj;
                    }
                }
                return ;
            }

            var href;    //指定登入成功后跳转的路径
            var redirectFun = function(){    //重定向函数,登入成功后根据thisObj处理请求
                if(typeof thisObj === 'function')
                {
                    thisObj({
                        'userName' : window.L.cookie('user[username]=`t')
                    });
                } else if(href) {
                    window.location.href = href;
                } else {    //刷新操作
                    window.location.reload();
                }
            };
            var callbackFunCall = function(param){    //调用回调方法
                if(param === 'loginAfter')
                {
                    var loginAfterCallbackList = callbackFun.login.after;
                }

                for(var i = 0, iL = loginAfterCallbackList.length; i < iL; ++i)
                {
                    if(window.location.reload === loginAfterCallbackList[i])    //IE9 下调用刷新页面会报错
                    {
                        window.location.reload();
                    } else {
                        loginAfterCallbackList[i]();
                    }
                }
            };

            //初始化href
            if(thisObj && typeof thisObj !== 'function')
            {
                if(typeof thisObj === 'string')    //指定跳转路径
                {
                    href = window.ROOT_URL + thisObj;
                } else if(thisObj.tagName === 'A') {    //认为是对象,读取href属性
                    href = thisObj.href || undefined;
                } else {    //认为是对象,读取href属性
                    (href = thisObj.getAttribute('href')) && (href = window.ROOT_URL + href);
                }
            }

            //登入验证
            if((temp = window.L.cookie('user[login]=`t') || '') === '')                    //未登入
            {
                var handle = window.L.open('oDialogDiv')(window.L.getText('登入'), 'url:get?' + window.ROOT_URL + '/index.php?a=openLogin', 'auto', 'auto', [1, {'layoutFun' : function(){
                    dialogLogin_7b42f9999c8e9012ee8c32362a6b9dcb.success = function(){      //绑定登入成功回调
                        window.L.cookie({'user' : {'login' : '1'}});                        //标识已登入
                        ecahOnlineFun();                                                    //保持在线
                        setTimeout(function(){
                            callbackFunCall('loginAfter');
                            redirectFun();
                        }, 0);
                    }
                }}]);
                $('> .title', oDialogDiv.callBackList[handle].oDialogDivObj).css('backgroundColor', '#C8DEF2');
                
                if(temp === undefined)                                                      //如果cookie被用户清理
                {
                    window.L.cookie({'user' : {'login' : ''}});                             //标识未登入
                }
            } else {                                                                        //已登入=2或=1
                redirectFun();
            }
        }
    })();
}
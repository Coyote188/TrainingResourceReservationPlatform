/**
 * 描述 : pageTable分页封装
 * 作者 : Edgar.lee
 */
if(typeof window.L.val('L.extension.pageTable.init') !== 'function')    //添加初始化与翻页后回调函数
{
    window.L.val('L.extension.pageTable.callback[afterLoadList][]', 
        window.L.val('L.extension.pageTable.callback[initLoadList][]', function(pageTableObj, pageTableClass){
                                 
            if(pageTableObj.getElementsByTagName('thead')[0].innerHTML !== '')
            {
                //给允许排序的列增加鼠标手样式
                var fontList = pageTableObj.getElementsByTagName('thead')[0]
                              .getElementsByTagName('font');
                for(var i = 0, iL = fontList.length; i < iL; ++i)
                {
                    if(fontList[i].getAttribute('_pageTableSort') !== null && fontList[i].className.indexOf('sortDefault') === -1)
                    {
                        fontList[i].className = 'sortDefault';
                    }
                }
                //增加tbody的表格交替背景感
                var tbodyChildNodes = pageTableObj.getElementsByTagName('tbody')[0].childNodes;    //tbody的所有子节点
                for(var i = 0, trI = 0, iL = tbodyChildNodes.length; i < iL; ++i)
                {
                    if(tbodyChildNodes[i].tagName === 'TR')    //过滤TR节点
                    {
                        tbodyChildNodes[i].className = ++trI % 2 ? 'odd_bg' : 'even_bg';
                    }
                }
            }
        }).val
    );
}
(function(){
    var pageTableClass = {
        /**
         * 描述 : 给pageTable添加相关信息是整个pageTableClass的初始化方法
         * 作者 : Edgar.lee
         */
        'init' : function()
        {
            var tableList = document.getElementsByTagName('table');    //所有table数组
            var pageTableObj;    //当前pageTable对象
            var temp;    //临时的什么
            for(var i = 0, l = tableList.length; i < l; ++i)
            {
                if(typeof tableList[i].getAttribute('_pageTableDataset') === 'string' && tableList[i]._pageTableSortStatusList == null)    //过滤出pageTable输出的封装,并且
                {
                    pageTableObj = tableList[i];
                    pageTableObj._pageTableConfig = {};    //一些配置文件存储的位置
                    if((temp = pageTableObj.getAttribute('_pageTableSort')) === null)    //排序状态列表,记录每个不同想向的排序状态
                    {
                        pageTableObj._pageTableSortStatusList = {};
                    } else {    //添加全局排序状态列表,并解析font[_pageTableSort]添加到对应的列表中
                        pageTableObj._pageTableSortStatusList = (new Function('return ' + temp))();
                        var thFontList = pageTableObj.getElementsByTagName('thead')[0].getElementsByTagName('font');
                        for(var j = 0, jL = thFontList.length; j < jL; ++j)
                        {
                            //过滤出font[_pageTableSort]
                            if(thFontList[j].getAttribute('name') === 'thTitle' && (temp = thFontList[j].getAttribute('_pageTableSort')) !== null)
                            {
                                //font[_pageTableSort]添加到对应的列表中
                                temp = thFontList[j]._pageTableSortList = (new Function('return ' + temp))();
                                //将最低层的th加入到pageTableObj._pageTableSortStatusList[排序字段]['objList'][]中;
                                if(thFontList[j].parentNode.getAttribute('_bottomTh') === '')    //当th是最低层显示时
                                {
                                    var stortObjArr = pageTableObj._pageTableSortStatusList[temp[0]]['objList'];
                                    stortObjArr[stortObjArr.length] = thFontList[j];
                                }
                                //添加排序点击事件
                                window.L.event(thFontList[j], 'click', pageTableClass.thTitleClickSortFn(pageTableObj, thFontList[j]))
                            }
                        }
                    }
                    //处理分页操作区按钮
                    var tfootDivList = pageTableClass.getChildNodesTag(pageTableObj, 'tfoot').getElementsByTagName('div');
                    for(var j = 0, jL = tfootDivList.length; j < jL; ++j)
                    {
                        if(tfootDivList[j].id === 'page_nav')
                        {
                            var pageNavObjList = tfootDivList[j].getElementsByTagName('*');    //分页的操作按钮列表
                            for(var k = 0, kL = pageNavObjList.length; k < kL; ++k)
                            {
                                if(pageNavObjList[k].nodeType === 1)
                                {
                                    switch(pageNavObjList[k].id)
                                    {
                                        case 'page_first'  :    //第一页
                                            window.L.event(pageNavObjList[k], 'click', pageTableClass.pageClickFn(pageTableObj, true));
                                            break;
                                        case 'page_last'   :    //最后一页
                                            if(pageTableObj.getAttribute('_pageTableTotalItems') < 0)
                                            {
                                                pageNavObjList[k].style.display = 'none';
                                            } else {
                                                pageNavObjList[k].style.display = '';
                                                window.L.event(pageNavObjList[k], 'click', pageTableClass.pageClickFn(pageTableObj, false));
                                            }
                                            break;
                                        case 'page_prev'   :    //上一页
                                            window.L.event(pageNavObjList[k], 'click', pageTableClass.pageClickFn(pageTableObj, -1));
                                            break;
                                        case 'page_next'   :    //下一页
                                            window.L.event(pageNavObjList[k], 'click', pageTableClass.pageClickFn(pageTableObj, 1));
                                            break;
                                        case 'page_submit' :    //刷新
                                            window.L.event(pageNavObjList[k], 'click', pageTableClass.pageClickFn(pageTableObj, null, pageNavObjList[k]));
                                            break;
                                        case 'toPage'      :    //跳转到
                                            //预设跳转页
                                            temp = parseInt(pageTableObj.getAttribute('_pageTableCurPage')) + 1;
                                            pageNavObjList[k].value = temp <= pageTableObj.getAttribute('_pageTableTotalPages') || pageTableObj.getAttribute('_pageTableTotalItems') < 0 ? temp : 1;

                                            window.L.event(pageNavObjList[k], 'keypress', pageTableClass.toPageKeypressFn(pageTableObj, pageNavObjList[k]));
                                            window.L.event(pageNavObjList[k], 'mouseover', function(){ this.focus(); this.select(); });
                                            pageTableObj._pageTableConfig.toPageObj = pageNavObjList[k];
                                            break;
                                        case 'pageSize'    :    //每页多少条
                                            //显示当前每页数据量
                                            pageNavObjList[k].value = pageTableObj.getAttribute('_pageTablePageSize');

                                            window.L.event(pageNavObjList[k], 'keypress', pageTableClass.toPageKeypressFn(pageTableObj, pageNavObjList[k]));
                                            window.L.event(pageNavObjList[k], 'mouseover', function(){ this.focus(); this.select(); });
                                            break;
                                        case 'page_num'    :    //显示当前分页进度
                                            //显示当前位置
                                            pageNavObjList[k].innerHTML = pageTableObj.getAttribute('_pageTableCurPage') + ' / ' + pageTableObj.getAttribute('_pageTableTotalPages');

                                            pageTableObj._pageTableConfig.pageNumObj = pageNavObjList[k];
                                            break;
                                        case 'totaLitems'    :    //显示总数据条数(默认不限制)
                                            pageNavObjList[k].innerHTML = pageTableObj.getAttribute('_pagetabletotalitems');
                                            break;
                                    }
                                }
                            }
                            break;
                        }
                    }

                    //初始化自定义导航
                    pageTableClass.initCustomNav(tableList[i]);

                    //初始化完成回调函数调用
                    if( arguments[0] !== true)
                    {
                        pageTableClass.callbackLoadList(pageTableObj, 'init');
                    }
                }
            }
        },
        /**
         * 描述 : ajax加载分页数据
         * 参数 :
         *      pageTableObj : 封装的表对象
         *      parameter    : 附加参数
         * 作者 : Edgar.lee
         */
        'load' : function(pageTableObj, parameter)
        {
            //加载前回调函数调用
            if(pageTableClass.callbackLoadList(pageTableObj, 'before') === false)    //终止请求操作
            {
                return false;
            }

            var temp;
            var params = pageTableObj.getAttribute('_pageTableParams');    //回调参数
            var starterPrint = pageTableObj.getAttribute('_pageTableStarterPrint');    //精简打印
            if(starterPrint === '' || starterPrint === null)
            {
                starterPrint = 1;
            }
            if(params !== null)
            {
                params = '&_pageTableParams=' + params;
            }
            if(typeof parameter !== 'object' || parameter == null)
            {
                parameter = {};
            }
            
            pageTableClass.loadLock(pageTableObj, true);
            window.L.ajax({
                url           : OF_URL + '/index.php?a=pageTable&c=of_base_com_common'
                ,data         : '_pageTableDataset=' + pageTableObj.getAttribute('_pageTableDataset')    //分页数据集
                              + '&_pageTableTotalItems=' + pageTableObj.getAttribute('_pageTableTotalItems')    //总数据量
                              + '&_pageTablePageSize=' + pageTableObj.getAttribute('_pageTablePageSize')    //每页显示数目
                              + '&_pageTableCurPage=' + pageTableObj.getAttribute('_pageTableCurPage')    //当前页面
                              + '&_pageTableColspan=' + pageTableObj.getAttribute('_pageTableColspan')    //一共多少列
                              + '&_pageTableStarterPrint=' + starterPrint    //精简打印
                              + (params === null ? '' : params)    //回调参数
                              + (pageTableObj._pageTableConfig.sortStr != null && pageTableObj._pageTableConfig.sortStr !== '' ? '&_pageTableSort=' + pageTableObj._pageTableConfig.sortStr : '')    //排序
                ,context      : this
                ,pageTableObj : pageTableObj
                ,starterPrint : starterPrint
                ,success      : function(responseText, varObj)
                {
                    if(!varObj.config.pageTableObj.parentNode)    //防止连续请求,第二次请求快过第一次请求导致的操作错误
                    {
                        return false;
                    }
                    if(varObj.config.starterPrint == 1)    //精简打印
                    {
                        if(varObj.config.pageTableObj._pageTableConfig.pageNumObj)    //如果显示分页进度对象存在
                        {
                            varObj.config.pageTableObj._pageTableConfig.pageNumObj.innerHTML = varObj.config.pageTableObj.getAttribute('_pageTableCurPage') +' / '+ varObj.config.pageTableObj.getAttribute('_pageTableTotalPages');    //更新导航显示
                        }
                        this.html(varObj.config.pageTableObj.getElementsByTagName('tbody')[0], responseText);
                        pageTableClass.loadLock(varObj.config.pageTableObj, false);
                    } else {    //完整打印
                        var oldSortStatusList = varObj.config.pageTableObj._pageTableSortStatusList;
                        var newPageTableObj = this.html(varObj.config.pageTableObj, responseText);
                        this.init(!parameter.callbackInit);    //回调初始化,通过附加参数判断是不是需要初始化,如果true=初始化,否则不初始化
                        //排序继承
                        var sortArr = [];    //排序数组
                        for(var i in newPageTableObj._pageTableSortStatusList)
                        {
                            if(oldSortStatusList[i] != null && oldSortStatusList[i].status != null)
                            {
                                newPageTableObj._pageTableSortStatusList[i].status = oldSortStatusList[i].status;
                                sortArr[sortArr.length] = '`' + i + '` ' + oldSortStatusList[i].status;
                                //修改对应的排序状态样式
                                this.sortStyle(newPageTableObj._pageTableSortStatusList[i]);
                            }
                        }
                        newPageTableObj._pageTableConfig.sortStr = sortArr.join(',');    //记录最新排序字符串
                        varObj.config.pageTableObj = newPageTableObj;
                        try{
                            newPageTableObj._pageTableConfig.toPageObj.focus();
                        } catch(e){
                            //IE 6 下由于隐藏导致焦点不可移动 或 跳转到对象不存在
                        }
                    }
                    //处理一些附加参数
                    if(typeof parameter._pageTableStarterPrint === 'string')
                    {
                        varObj.config.pageTableObj.setAttribute('_pageTableStarterPrint', parameter._pageTableStarterPrint);		    
                        varObj.config.pageTableObj.setAttribute('_pagetablestarterprint', parameter._pageTableStarterPrint);
                    }

                    //加载后回调函数调用
                    if(!parameter.callbackInit)    //如果不调用初始化回调,则调用加载后回调列表
                    {
                        pageTableClass.callbackLoadList(varObj.config.pageTableObj, 'after');
                    }
                }
            });
        },
        /**
         * 描述 : 支持html的插入
         * 作者 : Edgar.lee
         */
        'html' : function(thisObj, nodes)
        {
            var nodeListObj = document.createElement('div');    //存储子节点列表
            if(typeof nodes === 'string')
            {
                if(thisObj.tagName === 'TBODY')    //精简打印
                {
                    nodeListObj.innerHTML = '<table><tbody>' +nodes+ '</tbody></table>';
                    nodes = nodeListObj.getElementsByTagName('tbody')[0].childNodes;
                } else {    //完整打印
                    //替换新节点
                    nodeListObj.innerHTML = nodes;
                    var newPageTableObj = nodeListObj.getElementsByTagName('table')[0];
                    thisObj.parentNode.replaceChild(newPageTableObj, thisObj);
                    thisObj = newPageTableObj;
                    //读取nodes中的子节点
                    nodeListObj.innerHTML = nodes;
                    nodes = nodeListObj.getElementsByTagName('table')[0].childNodes;
                }
                //清除thisObj所有元素
                while(thisObj.firstChild)
                {
                    thisObj.removeChild( thisObj.firstChild );
                }
                for(var i = 0, iL = nodes.length; i < iL; ++i)
                {
                    if(nodes[0].nodeType === 1)
                    {
                        this.html(thisObj, nodes[0]);
                    } else {
                        thisObj.appendChild(nodes[0]);
                    }
                }
                return thisObj;
            } else {
                if(nodes.tagName === 'SCRIPT')
                {
                    (window.execScript || function(data){
                        window.eval.call( window, data );
                    })( nodes.text || nodes.textContent || nodes.innerHTML || "" );
                } else {
                    var childNodes = nodes.childNodes;
                    var iL = childNodes.length;
                    for(var i = 0; i < iL; ++i)
                    {
                        nodeListObj.appendChild(childNodes[0]);
                    }
                    thisObj.appendChild(nodes);
                    
                    childNodes = nodeListObj.childNodes;
                    var iL = childNodes.length;
                    for(var i = 0; i < iL; ++i)
                    {
                        if(childNodes[0].nodeType === 1)
                        {
                            this.html(nodes, childNodes[0]);
                        } else {
                            nodes.appendChild(childNodes[0]);
                        }
                    }
                }
            }
        },
        /**
         * 描述 : 初始化左下角自定义导航(多了隐藏,少了显示)
         * 作者 : Edgar.lee
         */
        'initCustomNav' : function (pageTableObj)
        {
            var pageNavWidth = 0;
            var tfootChildNodes;
            var temp;

            if(pageTableObj == null)
            {
                arguments.callee.resize();
                return;
            }
            tfootChildNodes = pageTableClass.getChildNodesTag(pageTableObj, 'tfoot').getElementsByTagName('td')[0].childNodes;
            for(var i = 0, iL = tfootChildNodes.length; i < iL; ++i)
            {
                if(tfootChildNodes[i].className === 'page_nav')
                {
                    pageNavWidth = tfootChildNodes[i].offsetWidth;
                }
                if(tfootChildNodes[i].className === 'custom_nav')
                {
                    var customNavWidth = tfootChildNodes[i].parentNode.clientWidth - pageNavWidth - 10;    //tfoot->td .custom_nav可用宽度
                    var contentWidth = tfootChildNodes[i].getElementsByTagName('div')[0].scrollWidth;    //tfoot->td .content 全部宽度
                    var labelObj = tfootChildNodes[i].childNodes;    //显示有隐藏去标志
                    for(var j = 0, jL = labelObj.length; j < jL; ++j)
                    {
                        if(labelObj[j].tagName === 'LABEL')
                        {
                            labelObj = labelObj[j];
                            break;
                        }
                    }
                    if(customNavWidth <= 0)
                    {
                        customNavWidth = 1;
                    }
                    if(contentWidth <= customNavWidth)
                    {
                        labelObj.style.display = 'none';
                        tfootChildNodes[i].style.width = contentWidth + 'px';
                        tfootChildNodes[i].onmouseover = null;
                        tfootChildNodes[i].onmouseout = null;
                    } else {
                        labelObj.style.display = 'inline';
                        tfootChildNodes[i].style.width = customNavWidth + 'px';
                        tfootChildNodes[i].onmouseover = function(){
                            this.style.width = contentWidth + 'px';
                            this.style.backgroundColor = '#FFFFFF';
                        };
                        tfootChildNodes[i].onmouseout = function(){
                            this.style.width = customNavWidth + 'px';
                            this.style.backgroundColor = 'transparent';
                        }
                    }

                    //当.page_nav不显示时,设置tfootChildNodes节点高度等于 custom_nav 高度
                    if(!pageNavWidth)
                    {
                        temp = tfootChildNodes[i].currentStyle ? 
                            [tfootChildNodes[i].parentNode.currentStyle, tfootChildNodes[i].currentStyle] : 
                            [document.defaultView.getComputedStyle(tfootChildNodes[i].parentNode, null), document.defaultView.getComputedStyle(tfootChildNodes[i], null)];
                        temp[0] = parseInt((temp[0].marginTop != 'auto' && temp[0].marginTop) || 0) + 
                            parseInt((temp[0].borderTop != 'auto' && temp[0].borderTop) || 0) + 
                            parseInt((temp[0].paddingTop != 'auto' && temp[0].paddingTop) || 0) + 
                            parseInt((temp[0].marginButtom != 'auto' && temp[0].marginButtom) || 0) + 
                            parseInt((temp[0].borderButtom != 'auto' && temp[0].borderButtom) || 0) + 
                            parseInt((temp[0].paddingButtom != 'auto' && temp[0].paddingButtom) || 0);
                        temp[1] = parseInt((temp[1].marginTop != 'auto' && temp[1].marginTop) || 0) + 
                            parseInt((temp[1].borderTop != 'auto' && temp[1].borderTop) || 0) + 
                            parseInt((temp[1].paddingTop != 'auto' && temp[1].paddingTop) || 0) + 
                            parseInt((temp[1].marginButtom != 'auto' && temp[1].marginButtom) || 0) + 
                            parseInt((temp[1].borderButtom != 'auto' && temp[1].borderButtom) || 0) + 
                            parseInt((temp[1].paddingButtom != 'auto' && temp[1].paddingButtom) || 0);
                        tfootChildNodes[i].parentNode.parentNode.style.height = tfootChildNodes[i].offsetHeight + temp[0] + temp[1] + 'px';
                    }
                    break;
                }
            }
        },
        /**
         * 描述 : 调用回调函数,回调发生时L.extension.pageTable.nowCallback为当前回调相关属性:结构{pageTableObj:当前回调的table对象,pageTableClass:分页类,index:当前方法在回调列表中的索引值,type:回调类型} 
         * 参数 :
         *      pageTableObj : 分页table对象
         *      type         : 回调类型,init=初始化回调,before=分页前,after=分页后回调
         * 返回 :
         *      回调函数会接受四个参数[分页table对象, pageTableClass, 当前函数在回调列表中的索引, 回调类型(type参数)]
         * 作者 : Edgar.lee
         */
        'callbackLoadList' : function(pageTableObj, type)
        {
            var callbackList;    //回调列表
            if(callbackList = window.L.val('L.extension.pageTable.callback[' +type+ 'LoadList]'))
            {
                var callbackFunStringList = {};    //防止重复相同方法重复注册
                for(var i = 0, iL = callbackList.length; i < iL; ++i)
                {
                    if(typeof callbackList[i] === 'function')
                    {
                        if(typeof callbackFunStringList[callbackList[i].toString()] === 'undefined')
                        {
                            window.L.extension.pageTable.nowCallback = {
                                'pageTableObj'   : pageTableObj,    //当前回调的table对象
                                'pageTableClass' : this,            //分页类
                                'index'          : i,               //当前方法在回调列表中的索引值
                                'type'           : type             //回调类型
                            };
                            if(callbackList[i](pageTableObj, this, i, type) === false)
                            {
                                delete window.L.extension.pageTable.nowCallback;
                                return;
                            }
                            if(callbackList[i])
                            {
                                callbackFunStringList[callbackList[i].toString()] = '';
                            }
                        } else {
                            delete callbackList[i];
                        }
                    }
                }
                delete window.L.extension.pageTable.nowCallback;
            }
        },
        /**
         * 描述 : 遍历tbody中的td元素
         * 参数 :
         *      pageTableObj : 分页table对象
         *      y            : 行,第一行为0.'*'=所有行
         *      x            : 列,第一列为0,'*'=所有列
         *      callbackFun  : 每个td将回调改方法,接收一个对象{'x' : 当前列, 'y' : 当前行, 'tdObj' : 当前td对象}
         *      context      : this指针,默认this指向事件源对象,如果没有事件源则指向pageTableObj
         * 返回 :
         *      [callbackFun回调接受的对象, callbackFun回调接受的对象 ...]
         * 作者 : Edgar.lee
         */
        'eachTbody' : function(pageTableObj, y, x, callbackFun, context)
        {
            var tdList = [];    //td列表
            var tbodyChildNodes = pageTableObj.getElementsByTagName('tbody')[0].childNodes;    //tbody所有子元素
            var trChildNodes;    //tr所有子元素
            typeof callbackFun !== 'function' ? callbackFun = function(){} : null;
            y == null ? y = '*' : null;
            x == null ? x = '*' : null;
            if(typeof context !== 'object' || context == null)
            {
                context = window.L.event().target || pageTableObj;
            }

            for(var i = 0, tdY = 0, iL = tbodyChildNodes.length; i < iL; ++i)
            {
                if(tbodyChildNodes[i].tagName === 'TR')
                {
                    if((y === '*' || y == tdY))
                    {
                        trChildNodes = tbodyChildNodes[i].childNodes;
                        for(var j = 0, tdX = 0, jL = trChildNodes.length; j < jL; ++j)
                        {
                            if(trChildNodes[j].tagName === 'TD')
                            {
                                if(x === '*' || x == tdX)
                                {
                                    callbackFun.call(context, tdList[tdList.length] = {'y' : tdY, 'x' : tdX, 'tdObj' : trChildNodes[j]});
                                }
                                ++tdX;
                            }
                        }
                    }
                    ++tdY;
                }
            }
            return tdList;
        },
        /**
         * 描述 : 专门配置获取_pageTableParams参数
         * 参数 :
         *      pageTableObj : 分页封装的table对象
         *      params       : 设置的参数,如果传参,则赋值,否则返回_pageTableParams解析的值
         *      refresh      : params赋值才有效,是否刷新分页
         * 作者 : Edgar.lee
         */
        'params' :function(pageTableObj, params, refresh){
            if(typeof params === 'undefined')
            {
                var temp = decodeURIComponent(pageTableObj.getAttribute('_pageTableParams'));
                return temp === '[]' ? {} : window.L.json(temp);
            } else {
                if(params !== null)
                {
                    pageTableObj.setAttribute('_pageTableParams', window.L.json(params, true));
                }
                if(refresh === true)
                {
                    var starterPrint = pageTableObj.getAttribute('_pageTableStarterPrint');
                    pageTableObj.setAttribute('_pageTableStarterPrint', 0);
                    pageTableObj.setAttribute('_pageTableCurPage', 1);
                    pageTableObj.setAttribute('_pagetablestarterprint', 0);
                    pageTableObj.setAttribute('_pagetablecurpage', 1);
                    this.load(pageTableObj, {'_pageTableStarterPrint' : starterPrint, 'callbackInit' : true});
                }
            }
        },
        /**
         * 描述 : 获取指定对象符合标签名的子结点对象列表
         * 作者 : Edgar.lee
         */
        'getChildNodesTag' : function(parentNode, tagName, itemNum){
            var temp = parentNode.childNodes;
            var returnList = [];
            for(var i = 0, iL = temp.length; i < iL; ++i)
            {
                if(temp[i].tagName === tagName.toUpperCase())
                {
                    returnList[returnList.length] = temp[i];
                }
            }
            if(typeof itemNum === 'boolean')
            {
                return returnList;
            } else {
                return returnList[itemNum || 0];
            }
        },
        /**
         * 描述 : 次函数专门配合每个编写排序font的样式
         * 作者 : Edgar.lee
         */
        'sortStyle' : function(sortObj)
        {
            for(var j = 0, jL = sortObj.objList.length; j < jL; ++j)
            {
                if(sortObj.status === 'DESC')
                {
                    sortObj.objList[j].className = 'sortDefault sortDesc';
                } else if(sortObj.status === 'ASC') {
                    sortObj.objList[j].className = 'sortDefault sortAsc';
                } else {
                    sortObj.objList[j].className = 'sortDefault';
                }
            }
        },
        /**
         * 描述 : 锁定分页用户操作
         * 参数 :
         *      pageTableObj : 分页封装的table对象
         *      lock         : 锁状态,字符串(默认)=加锁,并显示该字符串,默认'';true=加锁,保持原来字符串信息,默认'';false=解锁
         * 作者 : Edgar.lee
         */
        'loadLock' : function(pageTableObj, lock)
        {
            if(pageTableObj._pageTableConfig.loadLockObj && lock !== true)
            {
                pageTableObj._pageTableConfig.loadLockObj.parentNode.removeChild(pageTableObj._pageTableConfig.loadLockObj);
                delete pageTableObj._pageTableConfig.loadLockObj;
            }
            if((!pageTableObj._pageTableConfig.loadLockObj && lock === true) || (lock !== false && lock !== true))
            {
                var theadObj = pageTableObj.getElementsByTagName('thead')[0];
                var loadTrObj = document.createElement('tr');
                var loadTdObj = document.createElement('td');
                loadTrObj.className = 'pageTableLoadLock';
                loadTrObj.appendChild(loadTdObj);
                loadTdObj.colSpan = pageTableObj.getAttribute('_pageTableColspan');
                loadTdObj.innerHTML = '<div class="pageTableLoadLock"></div><font style="position:absolute;"><img src="' +OF_URL+ '/att/com/common/pageTable/images/loadLock.gif" align="middle" style="margin-right:5px; vertical-align:middle;" />' +(typeof lock === 'string' ? lock : '')+ '</font>';
                var loadTdObjChildNodes = loadTdObj.childNodes;
                loadTdObjChildNodes[0].style.height = pageTableObj.clientHeight + 'px';
                loadTdObjChildNodes[0].style.width = pageTableObj.clientWidth + 'px';
                loadTdObjChildNodes[1].style.top = ((pageTableObj.clientHeight - loadTdObjChildNodes[1].offsetHeight) >> 1) + 'px';
                loadTdObjChildNodes[1].style.left = ((pageTableObj.clientWidth - loadTdObjChildNodes[1].offsetWidth) >> 1) + 'px';
                theadObj.insertBefore(loadTrObj, theadObj.firstChild);
                pageTableObj._pageTableConfig.loadLockObj = loadTrObj;
            }
        },
        /**
         * 描述 : font[name=thTitle]的排序点击事件
         * 作者 : Edgar.lee
         */
        'thTitleClickSortFn' : function(pageTableObj, thisObj)
        {
            var pageTableClass = this;    //pageTable操作类
            return function()
            {
                var temp;
                var sortArr = [];
                /*for(var i =0, iL = thisObj._pageTableSortList.length; i < iL; ++i)    //多排序时参考此处
                {
                    temp = pageTableObj._pageTableSortStatusList[thisObj._pageTableSortList[i]];
                    //修改全局排序状态,并生成排序sql语句
                    if(temp.status === 'DESC')
                    {
                        temp.status = 'ASC'
                        sortArr[sortArr.length] = '`' + thisObj._pageTableSortList[i] + '`'
                    } else {
                        temp.status = 'DESC'
                        sortArr[sortArr.length] = '`' + thisObj._pageTableSortList[i] + '` DESC'
                    }
                    //修改对应的排序状态样式
                    pageTableClass.sortStyle(temp);
                }*/
                for(var j in pageTableObj._pageTableSortStatusList)
                {
                    var sortStyleReset = true;    //排序样式重置
                    temp = pageTableObj._pageTableSortStatusList[j];
                    for(var i =0, iL = thisObj._pageTableSortList.length; i < iL; ++i)
                    {
                        if(j === thisObj._pageTableSortList[i])
                        {
                            sortStyleReset = false;
                            //修改全局排序状态,并生成排序sql语句
                            if(temp.status === 'DESC')
                            {
                                temp.status = 'ASC'
                                sortArr[sortArr.length] = '`' + thisObj._pageTableSortList[i] + '`'
                            } else {
                                temp.status = 'DESC'
                                sortArr[sortArr.length] = '`' + thisObj._pageTableSortList[i] + '` DESC'
                            }
                        }
                    }
                    if(sortStyleReset)
                    {
                        delete temp.status;
                    }
                    pageTableClass.sortStyle(temp);
                }
                pageTableObj._pageTableConfig.sortStr = sortArr.join(',');
                pageTableClass.load(pageTableObj);
            }
        },
        /**
         * 描述 : 翻页点击事件
         * 作者 : Edgar.lee
         */
        'pageClickFn' : function(pageTableObj, num, thisObj)
        {
            return function()
            {
                if(num === true)    //第一页
                {
                    pageTableObj.setAttribute('_pageTableCurPage', 1);
                    pageTableObj.setAttribute('_pagetablecurpage', 1);
                } else if(num === false) {    //最后一页
                    pageTableObj.setAttribute('_pageTableCurPage', pageTableObj.getAttribute('_pageTableTotalPages'));
                    pageTableObj.setAttribute('_pagetablecurpage', pageTableObj.getAttribute('_pageTableTotalPages'));
                } else if(num === null) {    //同时提交两文本框数据
                    var temp = thisObj.parentNode.getElementsByTagName('input');
                    for(var i = 0, iL = temp.length; i < iL; ++i)
                    {
                        pageTableClass.toPageKeypressFn(pageTableObj, temp[i])();
                    }
                } else {    //上几页或下几页
                    var curPage = parseInt(pageTableObj.getAttribute('_pageTableCurPage')) + num;
                    if(curPage < 1)
                    {
                        curPage = 1;
                    } else if(curPage > pageTableObj.getAttribute('_pageTableTotalPages'))
                    {
                        curPage = pageTableObj.getAttribute('_pageTableTotalPages');
                    }
                    pageTableObj.setAttribute('_pageTableCurPage', curPage);
                    pageTableObj.setAttribute('_pagetablecurpage', curPage);
                }
                pageTableClass.load(pageTableObj);
            }
        },
        /**
         * 描述 : 回车跳转页面
         * 作者 : Edgar.lee
         */
        'toPageKeypressFn' : function(pageTableObj, thisObj)
        {
            return function(event)
            {
                if(event === undefined || event.event.keyCode == '13') {
                    if(thisObj.id === 'toPage')    //跳转页面
                    {
                        var curPage = parseInt(thisObj.value)
                        if(isNaN(curPage))
                        {
                            thisObj.value = '';
                            return;
                        } else if(curPage < 1)
                        {
                            curPage = 1;
                        } else if(curPage > pageTableObj.getAttribute('_pageTableTotalPages'))
                        {
                            curPage = pageTableObj.getAttribute('_pageTableTotalPages');
                        }
                        if(curPage + 1 <= pageTableObj.getAttribute('_pageTableTotalPages') || pageTableObj.getAttribute('_pageTableTotalItems') < 0)    //当_pageTableTotalItems < 0时,为不计算数据总条数模式
                        {
                            thisObj.value = curPage + 1;
                        } else {
                            thisObj.value = 1;
                        }
                        pageTableObj.setAttribute('_pageTableCurPage', curPage);
                        pageTableObj.setAttribute('_pagetablecurpage', curPage);
                    } else if(thisObj.id === 'pageSize') {    //每页多少条
                        var pageSize= parseInt(thisObj.value);
                        if(pageSize > 0)
                        {
                            if(pageTableObj.getAttribute('_pageTableTotalItems') >= 0)    //当_pageTableTotalItems < 0时,为不计算数据总条数模式
                            {
                                var pages = Math.ceil(pageTableObj.getAttribute('_pageTableTotalItems') / pageSize);
                                pageTableObj.setAttribute('_pageTableTotalPages', pages);    //更新页面数量
                                pageTableObj.setAttribute('_pagetabletotalpages', pages);    //更新页面数量
                                if(pageTableObj.getAttribute('_pageTableCurPage') > pages)
                                {
                                    pageTableObj.setAttribute('_pageTableCurPage', pages);
                                    pageTableObj.setAttribute('_pagetablecurpage', pages);
                                }
                            }
                            pageTableObj.setAttribute('_pageTablePageSize', pageSize);    //更新每页条数
                            pageTableObj.setAttribute('_pagetablepagesize', pageSize);    //更新每页条数
                        } else {
                            thisObj.value = '';
                        }
                    }
                    event !== undefined && pageTableClass.load(pageTableObj);
                }
            }
        }
    }
    if(window.L.extension.pageTable == null)
    {
        window.L.extension.pageTable = {};
    }
    if(typeof window.L.extension.pageTable.init !== 'function')
    {
        window.L.extension.pageTable['classObj'] = pageTableClass;
        window.L.extension.pageTable['init'] = pageTableClass.init;
        //初始化话所有分页表
        L.event(pageTableClass.init);
        //当窗口改变时重新计算自定义导航
        pageTableClass.initCustomNav.resize = function(){
            window.clearTimeout(arguments.callee.timeout);    //解决IE 多次触发resize事件的问题
            arguments.callee.timeout = window.setTimeout(function(){
                var tableList = document.getElementsByTagName('table');    //所有table数组
                for(var i = 0, l = tableList.length; i < l; ++i)
                {
                    if(typeof tableList[i].getAttribute('_pageTableDataset') === 'string')    //过滤出pageTable输出的封装
                    {
                        pageTableClass.initCustomNav(tableList[i]);
                    }
                }
            }, 150);
        }
        window.L.event(window, 'resize', pageTableClass.initCustomNav.resize);
    }
})()
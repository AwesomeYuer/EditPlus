#TITLE=See7di.@jQuery v1.41
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=Debug
//-------------------------------
console.profile();
console.time();
//-------------------------------
^!
//-------------------------------
//console.group($("#tab2 .tit"));console.groupEnd();
console.count();
//console.debug($("#tab2 .tit"));
//console.dir($("#tab2 .tit"));//輸出對象所有的屬性或方法
//console.assert(typeof $("#tab2 .tit")=='objec');//測試表達式是否程式,如果成立沒有反應,如果不成立則拋出錯誤
console.timeEnd();
console.profileEnd();
//-------------------------------

#T=console.log
console.log(^!);
#T=.constructor
.constructor
#T=$(window).load
$(window).load(function(){
	^!
});
#T=$(document).ready
//$(document).ready(function(){});
$(function(){
	^!
});
#T=删除变量
^!=null;
#T=是否为IE
$.browser.msie
#T=阻止冒泡
$(document).click(function(e){
e.stopPropagation()
#T=释放内存
//在ajax时即时清理
$.ajaxSetup({cache:false});

$.fn.removeNode = function(){
	var d;
	return function(){
		if(this[0] && this[0].tagName != 'BODY'){
			d = d || document.createElement('div');
			d.appendChild(this[0]);
			d.innerHTML = '';
		}
	}
}();

$(window).unload(function(){
	cn=null;
	delete cn;
	if($.browser.msie){CollectGarbage();}
	document.body.innetHTML='';
	document.innetHTML='';
	$('div').removeNode();
	$('table').removeNode();
	$('p').removeNode();
	$('ul').removeNode();
	$('body').removeNode();
});
#T=判断某元素是否绑定了事件
var tE = $('#foo').data('events');
if(tE){
	if(tE["click"]){
	}
}
#T=自定义插件
(function($){
	var aa = "4";
	//針對可以提前得知ID的對象,即對象事件捆綁
	//用法:$("#r").RL('AA');
	$.fn.RL = function(C){
		$(this).focus(function(){});
		C=C+aa;
		abc();
		function abc(){
			alert(C);
		}
		//取得对象名称
		//alert(jQuery(this).attr('id'));
	}
  
	$.fn.RR = function(C){
		alert("123");
	}
	
	//針對不可以提前得知ID的對象,可理解為function
	//此時對象只能傳值得到,前提是提前捆綁激活事件,否則無法獲得對象本身
	//用法:$("body").click(function(){$.fun(this,'AA');})或onchange='$.fun(this,"id=2");'
	$.fun = function(O,C){
		_i=O.id;
		abc();
		function abc(){
			alert(C+aa);
			alert(_i);
		}
	}

	//同上,可理解為function
	//用法:$("body").click(function(){$.a1(this,'AA');})或onchange='$.a1(this,"id=2");'
	$.extend({
		a1:function(O,C){
			_i=O.id;
			aaa();
			function aaa(){
				alert(C+aa);
				alert(_i);
			}
		},a2:function(sName){}
	});

	//特殊參數傳遞方法
	$.Cimg = function(opt){
		alert(opt.typ);
		opt.ondo();
	}
	$.Cimg({
		'typ':'show',
		'hid':'id1',
		'ondo':function(){alert('我')}
	});
})(jQuery)
#T=替代$符号
var jq=jQuery.noConflict();
jq(document).ready(function(){
	jq("button").click(function(){
		jq("p").hide();
	});
});
#T=动画执行完之后再做其他事
$("p").hide(1000,function(){
	alert("The paragraph is now hidden");
});
#T= 
 
#T=获取id,name或tagname
function _(s){return document.getElementById(s);}
function _n(s){return document.getElementsByName(s);}
function _t(s){return document.getElementsByTagName(s)[0];}
alert(_t('input').value)
#T=attributes属性
var d = document.getElementById("sss").attributes["value"];
document.write(d.name);
document.write(d.value);

var d = document.getElementById("sss").getAttribute("value");
document.write(d);

var d = document.getElementById("sss").setAttribute("good","hello");

var d = document.createAttribute("good");
document.getElementById("sss").setAttributeNode(d);

var d = document.getElementById("sss").removeAttribute("value");

var d = document.getElementById("sss").getAttributeNode("value"); 

var d = document.createAttribute("good");
document.getElementById("sss").setAttributeNode(d);

var d = document.getElementById("sss").getAttributeNode("value");
document.getElementById("sss").removeAttributeNode(d);
#T=针对IE浏览器的注意事项
在使用Json结构传值的时候最后一行千万别加逗号,要不然IE出错.
#T=抑制内存暴涨
先将JQUERY对象转换为DOM对象 调用DOM原生函数使用即可

JQUERY Object -> DOM Object
如:$('')[0]

html()
$('')[0].innerHTML='';

文档处理
append()
var child= document.createElement("...");
$('')[0].appendChild(child);

remove();
$('')[0].innerHTML="";
#T= 
 
#T=重写jquery的$为只针对id
function $(id){
	return document.getElementById(id);
}
#T=绑定多個事件
$('#id').bind("click mouseover",func)
//两个事件中间有空格 ，func为方法的名字
$('#id').one("click mouseover",function(){})
#T=按回車觸發事件
$('#test-address').keypress(function(e){
	if (e.keyCode == 13){$('#test-ok').click();}
});
#T=取得項目索引值
$('div',$('#t')).each(function(i){
	var $this=$(this);
	$this.click(function(){
		alert(i);//索引值
		return false;
	});
});

$(".a").each(function(i){
	this.index=i;
	$(this).click(function(){alert(this.index)})
});

$('#b3 td').change(function(){
	_i=$('#b3 td').index($(this));
	alert(_i);
});
#T=从框架内部操作框架左侧宽度
window.parent.document.getElementById('fram1').setAttribute('cols','240,*');
#T= 
 
#T=調用自定義函數
$('#c1').click(drop);
function drop(){
	alert('桃園縣');
}
#T=選擇器自身 $(this).selector
$(this).selector
#T=parent() - children() - find()
<div><img src="6.jpg"><span id="g"><b>b</b></span></div>

//儘量用find替代children,因為children只能找直屬第一層,不考慮多層下的後代,而find可考慮多層
//b=$('#g').parent().find('b').text();
//img=$('#g').parent().children('img').attr('src');
#T= 
 
#T=禁止选择内容
$(document).bind('selectstart',function(){return false;});
#T=按回車觸發事件
$('#test-address').keypress(function(e){
	if(e.keyCode == 13){$('#test-ok').click();}
});
$(document).keypress(function(e){
	if(e.which == 97){
		alert("hello world!");
	}
})
#T=当窗口尺寸改变觸發事件
$(window).resize(function(){});
#T=点击空白区域触发事件
$(document,window).click(function(){$.pop();});
#T=在js里插入js
(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
#T=jquery再次載入
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript"> 
!window.jQuery && document.write('<script src="http://code.jquery.com/jquery-1.4.2.min.js"><\/script>');
</script>
#T=可以編輯的div
<div contentEditable="true">abc</div>
#T= 
 
#T=判斷IE版本
if($.browser.msie && $.browser.version.split('.')[0]<'8'){}
#T=判断变量是否存在
if(!address || !address.length){}
#T=判斷對象是否存在
if(!document.getElementById(''+_o.hid+'')){alert('對象不存在,可能是參數設置有誤,請檢查hid的參數值!');return;}
if($(selector)[0]){...}
// 或者这样
if($(selector).length){...}
if($('#shopping_cart_items input.in_stock')[0]){<statement>}
#T=判断输入框的初始值
 onfocus="if(this.value==this.defaultValue) this.value='';"
#T=判斷是否为本地浏览
if (document.location.protocol == 'file:') {
	alert("The examples might not work properly on the local file system due to security settings in your browser. Please use a real webserver.");
}
#T=判断变量是否为对象
if (typeof(complete) != 'object'){complete = $(complete);}
#T=轉譯 .:[]這四個符號需要用\\轉譯
取得对象 .:[]這四個符號需要用\\轉譯
#T=----------------------
----------------------
#T=从Google Code加载jQuery
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
#T=把大数据绑定给DOM,DOM删了,内存就删了
<div class="ex" />
ajax({sucess:function(data){
  $('.ex')[0]=data
}})
#T=jQuery对象与dom对象的转换
$(document.getElementById("msg"))
普通的dom对象一般可以通过$()转换成jquery对象
由于jquery对象本身是一个集合。所以如果jquery对象要转换为dom对象则必须取出其中的某一项，一般可通过索引取出。
如：
    $("#msg")[0]，$("div").eq(1)[0]，$("div").get()[1]  
    $("td")[5]
这些都是dom对象，可以使用dom中的方法，但不能再使用Jquery的方法。
以下几种写法都是正确的：
    $("#msg").html();  
    $("#msg")[0].innerHTML;  
    $("#msg").eq(0)[0].innerHTML;  
    $("#msg").get(0).innerHTML;
#T=通过缓存最小化选择操作
var $id=$('#id');
#T=最小化DOM操作
DOM的插入操作（像.append(),.prepend(),.after(),.wrap()）是相当耗时的,使用字符串拼接来构造一个list项并用一个函数往列表里添加这些项
#T=尽可能使用ID而不是class且总是从ID选择器开始找寻
var $id=$('.button',$('#id'));//var $id=$("#id .button");
#T=给选择器提供上下文
var $id=$('#id',$('body'));
#T=在class前使用tag(标签名)
var $id=$('input.button',$('#id'));//var $id=$("#id input.button");
#T=将jQuery选择器对象缓存起来
var $id=$('.button',$('#id'));//var $id=$("#id .button");
#T=替代$(this)的写法
var $this = $(e.target);
#T=把$(document).ready推迟到$(window).load
把$(document).ready推迟到$(window).load
#T=压缩JavaScript
压缩JavaScript
#T=慎用 .live()方法
慎用 .live()方法
#T=子选择器和后代选择器
后代选择器经常用到比如：$("#list p");后代选择器获取的是元素内部所有元素。而有时候实际只要获取子元素，那么就不应该使用后代选择器应该使用子选择器，代码如：$("#list > p"); 
#T=使用data()方法存储临时变量
$("p").data("val",'abc');
alert($("p").data("val"));
#T=尽量多用方法链,或缓存选择器
$('#a1')
	.css('display','')
	.find('input',$('#a2')).val('b123')
	.end()
	.find('#a2',$('#a1'))
	.css('display','none');
#T=预加载图片
//定义预加载图片列表的函数(有参数)
jQuery.preloadImages = function(){
	//遍历图片
	for(var i = 0; i<arguments.length; i++){
		jQuery("<img>").attr("src", arguments[i]);
	}
}
#T=将你的代码测试完好
//将测试分成若干模块.
module("Module B");
test("some other test", function() {
	//指定多少个判断语句需要加入测试中.
	expect(2);
 
	equals( true, false, "failing test" );
	equals( true, true, "passing test" );
});
// 你可以这样使用预加载函数
$.preloadImages("images/logo.png", "images/logo-face.png", "images/mission.png");
#T=写你自己的选择器
$.expr[':'].mycustomselector= function(element, index, meta, stack){
	// element- DOM元素
	// index - 堆栈中当前遍历的索引值
	// meta - 关于你的选择器的数据元
	// stack - 用于遍历所有元素的堆栈
 
	// 包含当前元素则返回true
	// 不包含当前元素则返回false
};
//自定义选择器的应用:
$('.someClasses:test').doSomething();

$.expr[':'].withRel = function(element){
	var $this = $(element);
	//仅返回rel属性不为空的元素
	return ($this.attr('rel') != '');
};
$(document).ready(function(){
	//自定义选择器的使用很简单，它和其他选择器一样，返回一个元素包装集
	//你可以为他使用格式方法，比如下面这样修改它的css样式
	$('a:withRel').css('background-color', 'green');
});

$.extend($.expr[':'],{
	over100pixels:function(a){
		return $(a).height() > 100;
	}
});

$('.box:over100pixels').click(function(){
	alert('The element you clicked is over 100 pixels high');
});
//代码的前一部分创建一个自定义的选择器，它可以找出所有长度超过100px的元素。接下来的代码仅仅是将click事件绑定到使用该选择器查找出来的那些元素上。
//这里我不做更具体的讲解，但是你能设想一下它有多么的强大！如果你在google上搜索”custom jquery selector”，你会看到有很多这方面的例子
#T=----------------------
----------------------
#T=$('input[name*="man"]')找name属性里包含man的不管位置
$('input[name*="man"]').val('has man in it!');
#T=$('input[name~="man"]')找name多重属性里包含man的
$('input[name~="man"]').val('mr. man is in it!');
#T=$('input[name$="letter"]')找name属性里结尾是letter的
$('input[name$="letter"]').val('a letter');
$('input[name^="news"]')找name属性里开头是news的
$('input[name^="news"]').val('news here!');
#T=----------------------
----------------------
#T=$("*")所有元素
$("*").addClass("red");
#T=$("p")
$("p")
#T=$("#id")
$("#id")
#T=$("p#id")
$("p#id")
#T=$("p.class")
$("p.class")
#T=$("[href]") 选取所有带有 href 属性的元素。
$("[href]") 选取所有带有 href 属性的元素。
#T=$("[href='#']") 选取所有带有 href 值等于 "#" 的元素
$("[href='#']") 选取所有带有 href 值等于 "#" 的元素
#T=$("[href!='#']") 选取所有带有 href 值不等于 "#" 的元素
$("[href!='#']") 选取所有带有 href 值不等于 "#" 的元素
#T=$("[href$='.jpg']") 选取所有 href 值以 ".jpg" 结尾的元素
$("[href$='.jpg']") 选取所有 href 值以 ".jpg" 结尾的元素
#T=$("ul li:gt(3)")列出 index 大于 3 的元素
$("ul li:gt(3)")列出 index 大于 3 的元素
#T=$("ul li:lt(3)")列出 index 小于 3 的元素
$("ul li:lt(3)")列出 index 小于 3 的元素
#T=$("input:not(:empty)")所有不为空的 input 元素
$("input:not(:empty)")所有不为空的 input 元素
#T=$(":header")所有标题元素 <h1> - <h6>
$(":header")所有标题元素 <h1> - <h6>
#T=$(":contains('W3School')")包含指定字符串的所有元素
$(":contains('W3School')")包含指定字符串的所有元素
#T=$(":empty")无子（元素）节点的所有元素
$(":empty")无子（元素）节点的所有元素
#T=$("p:hidden")所有隐藏的 <p> 元素
$("p:hidden")所有隐藏的 <p> 元素
#T=$("table:visible")所有可见的表格
$("table:visible")所有可见的表格
#T=	$(":input")所有 <input> 元素
	$(":input")所有 <input> 元素
#T=$(":text")所有 type="text" 的 <input> 元素
$(":text")所有 type="text" 的 <input> 元素
#T=$(":password")所有 type="password" 的 <input> 元素
$(":password")所有 type="password" 的 <input> 元素
#T=$(":radio")所有 type="radio" 的 <input> 元素
$(":radio")所有 type="radio" 的 <input> 元素
#T=$(":checkbox")所有 type="checkbox" 的 <input> 元素
$(":checkbox")所有 type="checkbox" 的 <input> 元素
#T=$(":submit")所有 type="submit" 的 <input> 元素
$(":submit")所有 type="submit" 的 <input> 元素
#T=$(":reset")所有 type="reset" 的 <input> 元素
$(":reset")所有 type="reset" 的 <input> 元素
#T=$(":button")所有 type="button" 的 <input> 元素
$(":button")所有 type="button" 的 <input> 元素
#T=$(":image")所有 type="image" 的 <input> 元素
$(":image")所有 type="image" 的 <input> 元素
#T=$(":file")所有 type="file" 的 <input> 元素
$(":file")所有 type="file" 的 <input> 元素
#T=$(":enabled")所有激活的 input 元素
$(":enabled")所有激活的 input 元素
#T=$(":disabled")所有禁用的 input 元素
$(":disabled")所有禁用的 input 元素
#T=$(":selected")所有被选取的 input 元素
$(":selected")所有被选取的 input 元素
#T=$(":checked")所有被选中的 input 元素
$(":checked")所有被选中的 input 元素
#T=$("ul li")搜尋ul下所有層內的li
$("#id").find("li").each(function(i){$(this).html($(this).html()+"BAM!"+i);});//找寻内部所有的li
#T=$("ul > li")搜尋ul下第一層內所有的li
$("ul > li")
#T=$("div,span,p.myClass")
$("div,span,p.myClass")
#T=$("[@title]") 找尋所有屬性中包含title的項目
$("[@title]") 找尋所有屬性中包含title的項目
#T=$("label + input")找所有紧跟在label后的input(同級及下級)
$("label+input").css("background-color","red");
#T=$("form ~ input")找所有紧跟在form后的input(同級關係)
$("form ~ input").background("#eee");
#T=$("#subifrm").contents().find("#test").css('color','red');訪問子框架subifrm內test的css屬性
$("#subifrm").contents().find("#test").css('color','red');訪問子框架subifrm內test的css屬性
#T=$(window.frames["iframe1"].document).find("input[@type='radio']").attr("checked","true");
//在父窗口中操作 选中IFRAME中的所有单选钮
$(window.frames["iframe1"].document).find("input[@type='radio']").attr("checked","true");
#T=$(window.parent.document).find("input[@type='radio']").attr("checked","true");
//在IFRAME中操作 选中父窗口中的所有单选钮
$(window.parent.document).find("input[@type='radio']").attr("checked","true");
#T=$("#f2",parent.document.body).attr("src","http://www.baidu.com")
//f1中jQuery改变f2的src代码<iframe id="f1"></iframe><iframe id="f2></iframe>
$("#f2",parent.document.body).attr("src","http://www.baidu.com")
#T=$("#f1").contents().find("div").html();
//從f1這個框架中取得div的內容
$("#f1").contents().find("div").html();
#T=$("#f1",parent.document.body).contents().find("div").html();
$("#f1",parent.document.body).contents().find("div").html();
#T=$("input:radio");當前頁所有的radio
$("input:radio");當前頁所有的radio
#T=$("input:radio",document.forms[0]);第一個表单中所有的radio
$("input:radio",document.forms[0]);第一個表单中所有的radio
#T=$("div",xml.responseXML);AJAX 返回的 XML 文档中，查找所有的 div 元素
$("div",xml.responseXML);AJAX 返回的 XML 文档中，查找所有的 div 元素
#T= 
 
#T=$('ul li').next()
$('form').next().click(function(){alert('aa'));
#T=$("ul li").parents("p")
//找a的父標籤p
$("a").hover(function(){
	$(this).parents("p").addClass("highlight");
},function(){
	$(this).parents("p").removeClass("highlight");
});
#T=$("ul li:first")或$('form').first()或$("form")[0]
$("#id").click(function(){$("form")[0].reset();});//從多個form中選擇一個

//操作多個form
$("#id").click(function(){
	$("form").each(function(){
		this.reset();
	});
});
#T=$("ul li:last")或$('#id li').last()
$("ul li:last")或$('#id li').last()
#T=$("ul li:nth-child(2)")匹配ul下的第2个li
$("ul li:nth-child(2)")匹配ul下的第2个li
#T=$("ul li:first-child")匹配ul下的第1个li
$("ul li:first-child")匹配ul下的第1个li
#T=$("ul li:last-child")匹配ul下的最後一个li
$("ul li:last-child")匹配ul下的最後一个li
#T=$("ul li:only-child")如果父元素中包含唯一的子元素則将会被匹配(不可包含其他元素)
$("ul li:only-child")如果父元素中包含唯一的子元素則将会被匹配(不可包含其他元素)
#T=$("li:even")从0开始所有索引值为偶数的元素
$("li:even")从0开始所有索引值为偶数的元素
#T=$("li:odd")从0开始所有索引值为奇数的元素
$("li:odd")从0开始所有索引值为奇数的元素
#T=$("li:eq(2)")匹配一个给定索引值的元素(从0开始計數)
$("li:eq(2)")匹配一个给定索引值的元素(从0开始計數)
#T=$("li:gt(2)")匹配所有大于给定索引值的元素
$("li:gt(2)")匹配所有大于给定索引值的元素
#T=$("li:lt(2)")匹配所有小于给定索引值的元素
$("li:lt(2)")匹配所有小于给定索引值的元素
#T= 
 
#T=$("div:contains('china')")innerText中包含china的元素
$("div:contains('china')")innerText中包含china的元素
#T=$("td:parent")匹配所有包含子元素或者文本的元素
$("td:parent")匹配所有包含子元素或者文本的元素
#T=$("td:empty")匹配所有不包含子元素或者文本的空元素
$("td:empty")匹配所有不包含子元素或者文本的空元素
#T=$("div:has(p)")匹配含有选择器所匹配的元素的元素
$("div:has(p)")匹配含有选择器所匹配的元素的元素
#T=$("tr:visible")匹配所有的可见元素
$("tr:visible")匹配所有的可见元素
#T=$("tr:hidden")匹配所有不可见元素或type为hidden的元素
$("tr:hidden")匹配所有不可见元素或type为hidden的元素
#T=$("[@title]")匹配所有包含title屬性的項目
$("[@title]")匹配所有包含title屬性的項目
#T=$("[@title=ttt]")匹配title屬性等於ttt的項目
$("[@title=ttt]")匹配title屬性等於ttt的項目
#T=$("[@title=ttt][@class=aaaa]")多重匹配
$("[@title=ttt][@class=aaaa]")多重匹配
#T=$("input[@type]")匹配包含给定属性的元素 要兼容最新版本只要去掉@即可
$("input[@type]")匹配包含给定属性的元素 要兼容最新版本只要去掉@即可
#T=$("input[name='wd']")匹配给定的属性是某个特定值的元素
$("input[name='wd']").attr("checked",true);
#T=$("input[@name*=123.htm]")匹配给定的属性包含某个值的元素
$("input[@name*=123.htm]")匹配给定的属性包含某个值的元素
#T=$("input[@name!='newsletter']")匹配所有不含有指定的属性或属性不等于特定值的元素
$("input[@name!='newsletter']")匹配所有不含有指定的属性或属性不等于特定值的元素
#T=$("input[@name^='news']")匹配给定的属性是以某些值开始的元素
$("input[@name^='news']")匹配给定的属性是以某些值开始的元素
#T=$("input[@name$='letter']")匹配给定的属性是以某些值结尾的元素
$("input[@name$='letter']")匹配给定的属性是以某些值结尾的元素
#T=$("input[@id][@name$='man']")复合属性选择器可同时满足多个条件
$("input[@id][@name$='man']")复合属性选择器可同时满足多个条件
#T=$('input[id][name$="man"]')包含id属性,且name属性的末尾是man
$('input[id][name$="man"]').val('only this one');
#T=$('input[name*="man"]')找name属性里包含man的,不管位置
$('input[name*="man"]').val('has man in it!');
#T= 
 
#T=$(":header")匹配如 h1, h2, h3之类的标题元素
$(":header")匹配如 h1, h2, h3之类的标题元素
#T=$(":text")匹配所有的单行文本框
$(":text")匹配所有的单行文本框
#T=$(":password")匹配所有密码框
$(":password")匹配所有密码框
#T=$(":radio")匹配所有单选按钮
$(":radio")匹配所有单选按钮
#T=$(":checkbox")匹配所有复选框
$(":checkbox")匹配所有复选框
#T=$(":submit")匹配所有提交按钮
$(":submit")匹配所有提交按钮
#T=$(":input")匹配所有input,textarea,select和button元素
$(":input")匹配所有input,textarea,select和button元素
#T=$(":image")匹配所有图像域
$(":image")匹配所有图像域
#T=$(":reset")匹配所有重置按钮
$(":reset")匹配所有重置按钮
#T=$(":button")匹配所有按钮
$(":button")匹配所有按钮
#T=$(":file")匹配所有文件域
$(":file")匹配所有文件域
#T= 
 
#T=$("input:hidden")匹配所有不可见元素，或者type为hidden的元素
$("input:hidden")匹配所有不可见元素，或者type为hidden的元素
#T=$("input:enabled")匹配所有可用元素
$("input:enabled")匹配所有可用元素
#T=$("input:disabled")匹配所有不可用元素
$("input:disabled")匹配所有不可用元素
#T=$("input:checked")匹配所有选中的被选中元素(复选框、单选框等，不包括select中的option)
$("input:checked")匹配所有选中的被选中元素(复选框、单选框等，不包括select中的option)
#T=$("select option:selected")匹配所有选中的option元素
$("select option:selected")匹配所有选中的option元素
#T= 
 
#T=$("li").not(":has(ul)")或$("input:not(:checked)")
$("li").not(":has(ul)").css("border","1px solid black");//这个代码选择了所有的li元素，然后去除了有ul子元素的li元素
#T=$('#faq').find('dd').hide().end().find('dt')
//從faq這個id容器里找dd標籤，然後隱藏，結束這一段落,再找dt標籤，賦予事件
$('#faq').find('dd').hide().end().find('dt').click(function(){
	var answer=$(this).next();//找到dt下面紧接的一个dd元素
	if(answer.is(':visible')){
		answer.slideUp();
	}else{
		answer.slideDown();
	}
});
#T=匹配所有正在执行动画效果的元素
描述:
只有对不在执行动画效果的元素执行一个动画特效

HTML代码:
<button id="run">Run</button><div></div>

jQuery代码:
$("#run").click(function(){
	$("div:not(:animated)").animate({left:"+=20"},1000);
});
#T=控制网站后台頭部的框架
$(window.top.frames["frameTop"].document).find("#a2").click(function(){
	alert('a');
});
#T=同级框架互相操作
<iframe id="l"...</iframe>
<iframe id="r"...</iframe>

l中改变r的src代码：
$("#l",parent.document.body).attr("src","http://www.radys.cn")

$('#imgDialog img',window.Wname1).click(function(){
$.Cimg({'typ':'select','obj':this,'css':'#efefef'})
})
#T=取得框架內某元件的值
<iframe id="m"...>
ifame包含一个someID
<div id="i1">Get this content</div>
</ifame>
得到i1的内容
$("#m").contains().find("#i1").text()
#T= 
 
#T=给元素绑定事件
给元素绑定事件
#T=----------------------
----------------------
#T=CSS樣式
CSS樣式
#T=$('').width()取得寬度
$('^!').width()
#T=$('').width("200px");設置寬度
$('^!').width("200px");
#T=$('').height()取得高度
$('^!').height()
#T=$('').height("200px");設置高度
$('^!').height("200px");



#T=$('').innerWidth();元素内部区域寬度 含补白不含边框
$('^!').innerWidth();
#T=$('').innerHeight();元素内部区域高度 含补白不含边框
$('^!').innerHeight();
#T=$('').outerHeight(true);元素外部高度 含补白和边框
//设置为true时，计算边距在内
$('^!').outerHeight(true);
#T=$('').outerWidth(true);元素外部寬度 含补白和边框
//设置为true时，计算边距在内
$('^!').outerWidth(true);
#T=$('').addClass("redborder");設置樣式
$('^!').addClass("redborder");
#T=$('').removeClass("redborder");移除樣式
$('^!').removeClass("redborder");
#T=$('').css("border");取border的樣式
$('^!').css("border");
#T=$('').css("border","2px dashed #6600FF");設置樣式
$('^!').css("border","2px dashed #6600FF");
#T=toggleClass("btn")如果 存在/不存在 就 删除/添加 一个css樣式
HTML代码:
<p>Hello</p><p class="btn">Hello Again</p>
jQuery代码:
$("p").toggleClass("btn");
结果:
[<p class="btn">Hello</p>,<p>Hello Again</p>]
#T= 
 
#T=屬性操作
屬性操作
#T=attr("src")取得第一个匹配元素的属性值
HTML代码:
<img src="test.jpg"/>
jQuery代码:
$("img").attr("src");
结果:
test.jpg
#T=attr({src:"test.jpg",alt:"Test Image"})給匹配的對象添加多個屬性值
jQuery代码:
$("img").attr({src:"test.jpg",alt:"Test Image"});
结果:
[<img src="test.jpg" alt:="Test Image" />]
#T=attr("src","test.jpg")給匹配的對象添加一个屬性值
HTML代码:
<img/>
<img/>
jQuery代码:
$("img").attr("src","test.jpg");
结果:
[<img src="test.jpg" />,<img src="test.jpg" />]
#T=attr("alt",function(){return this.src})为所有匹配的元素设置一个函數
HTML代码:
<img src="test.jpg"/>
jQuery代码:
$("img").attr("alt",function(){return this.src});
结果:
<img src="test.jpg" alt="test" />
#T=removeAttr("src")从每一个匹配的元素中删除一个属性
HTML代码:
<img src="test.jpg"/>
jQuery代码:
$("img").removeAttr("src");
结果:
[<img />]
#T=$('').append('');類似于innerHTML
$('body').append('<div class="clickme">Another target</div>');
#T=$('').html("新的內容!")取得或設置匹配元素的html内容
//这个函数不能用于XML文档。但可以用于XHTML文档
$("ul").find("li").each(function(i){
	$(this).html($(this).html()+"新的內容!"+i);
});
#T=$('').text()取得所有匹配元素的内容
$('').text();
#T=$('').val()获得第一个匹配元素的当前值
$('').val()
#T= 
 
#T=位置操作
位置操作
#T=$("p").offset().left;元素在当前视口的相对偏移left值,此方法只对可见元素有效
$("p").offset().left;元素在当前视口的相对偏移left值,此方法只对可见元素有效
#T=$("p").offset().top;元素在当前视口的相对偏移top值,此方法只对可见元素有效
$("p").offset().top;元素在当前视口的相对偏移top值,此方法只对可见元素有效
#T=$("p").position().left;元素相对父元素的偏移left值
//为精确计算结果，请在补白、边框和填充属性上使用像素单位。此方法只对可见元素有效。
#T=$("p").position().top;元素相对父元素的偏移top值
//为精确计算结果，请在补白、边框和填充属性上使用像素单位。此方法只对可见元素有效。
#T=$("p").scrollTop();元素相对滚动条顶部的偏移,对可见和隐藏元素均有效
$("p").scrollTop();元素相对滚动条顶部的偏移,对可见和隐藏元素均有效
#T=$("p").scrollLeft();匹配元素相对滚动条左侧的偏移,对可见和隐藏元素均有效
$("p").scrollLeft();匹配元素相对滚动条左侧的偏移,对可见和隐藏元素均有效
#T= 
 
#T=核心函數
核心函數
#T=$("img").each(function(i){this.src="test"+i+".jpg";});
$("img").each(function(i){this.src="test"+i+".jpg";});
#T=$("img").size();计算文档中所有图片数量
$("img").size();计算文档中所有图片数量
#T=$("img").length;计算文档中所有图片数量
$("img").length;计算文档中所有图片数量
#T=$("ul li").selector;返回ul li
$("ul li").selector;返回ul li
#T=$("ul",document.body).context.nodeName返回body
$("ul",document.body).context.nodeName返回body
#T=$("img").get(0);取得第一個img
$("img").get(0);取得第一個img
#T=$('li').index($('#bar'));搜索匹配的元素并返回該元素的索引值从0开始
$('li').index($('#bar'));搜索匹配的元素并返回該元素的索引值从0开始
#T= 
 
#T=渐变效果
渐变效果
#T=$('').fadeOut("slow",function(){alert("慢慢消失了")});淡出
//slow可替換為normal,fast,或填寫毫秒數
$('^!').fadeOut("slow",function(){alert("慢慢消失了")});
#T=$('').fadeIn("slow",function(){alert("慢慢出現了")});淡入
//slow可替換為normal,fast,或填寫毫秒數
$('^!').fadeIn("slow",function(){alert("慢慢出現了")});
#T=$('').fadeTo把所有元素的不透明度以渐进方式调整到指定值
//slow可替換為normal,fast,或填寫毫秒數
$('^!').fadeTo("slow",0.5,function(){alert("层透明度变成50%了")});
#T= 
 
#T=-------------------------
-------------------------
#T=基本
基本
#T=.show("normal");显示隐藏的匹配元素
$('^!').show("normal",function(){alert("!")});
#T=.hide("normal");隐藏显示的元素
$('^!').hide("normal",function(){alert("!")});
#T=.toggle(function(){},function(){});点击后切换元素的可见状态
$("td").toggle(function(){
	$(this).addClass("selected");
},function(){
	$(this).removeClass("selected");
});

var f=0;
$("button").click(function(){
	$("p").toggle(f++ % 2==0);
});
#T=滑动
滑动
#T=.slideDown("normal");滑动向下增大
$('^!').slideDown("normal",function(){alert("^!")});
#T=.slideUp("normal");滑动向上减小
$('^!').slideUp("normal",function(){alert("^!")});
#T=.slideToggle("normal");滑动切换效果
$('^!').slideToggle("normal",function(){alert("^!")});
#T=淡入淡出
淡入淡出
#T=.fadeIn("normal");淡入效果
$('^!').fadeIn("normal",function(){alert("^!")});
#T=.fadeOut("normal");淡出效果
$('^!').fadeOut("normal",function(){alert("^!")});
#T=.fadeTo("normal");以渐进方式调整透明度
$('^!').fadeTo("normal",0.5,function(){alert("^!")});
#T=自定义
自定义
#T=.animate({},1000);用于创建自定义动画
$('^!').animate({
	width:"90%",
	height:"100%",
	fontSize:"10em",
	borderWidth:10
},1000);

//切换段落的高度和透明度
$('^!').animate({height:'toggle',opacity:'toggle'},"slow");

//等前一个动画完成后，后一个动画才会开始.
$('^!').animate({width:"90%"},{queue:false,duration:5000})
	.animate({fontSize:'10em'},1000)
	.animate({borderWidth:5},1000);
#T=.stop();停止所有在指定元素上正在运行的动画
$('^!').stop();
#T=.delay(800)设置一个延时来推迟执行队列中之后的项目
$('^!').slideUp(300).delay(800).fadeIn(400);
#T=事件切换
事件切换
#T=.hover(function(){},function(){});切換hover和移除後
$('^!').hover(function(){
	$(this).addClass("green");
},function(){
	$(this).removeClass("green");
});
#T=.toggle(function(){},function(){}...);每次点击后依次调用函数
$('^!').toggle(
	function(){
		$(this).css({"list-style-type":"disc","color":"blue"});
	},
	function(){
		$(this).css({"list-style-type":"disc","color":"red"});
	},
	function(){
		$(this).css({"list-style-type":","color":"});
	}
);
#T=-------------------------
-------------------------
#T= 
 
#T=其他
其他
#T=$.trim("  hello, how are you?  ");去掉字符串起始和结尾的空格
$.trim("  hello, how are you?  ");去掉字符串起始和结尾的空格
#T=alert($('li').toArray());得到所有li的元素数组
alert($('li').toArray());得到所有li的元素数组
#T=$('').bind('click',function(){});
$('.clickme').bind('click',function(){alert($(this).text());});
#T=$('').live('click',function(){});
$('.clickme').live('click',function(){alert($(this).text());});
#T=$('').load("loadhtml.html");將html文件內容載入至對象內
//將html文件內容載入至div內
$("div").load("loadhtml.html");
//把html文件里的id=div2的内容 加载到div里面
$("div").load("loadhtml.html #div2");
//載入時post方式傳遞參數limit
$("div").load("feeds.php",{limit:25},function(){
	alert("載入成功了!");
});
#T=$('').hover(function(){},function(){});
//切換hover和移除後的class
$(".clickme").hover(function(){
		$(this).addClass("green");
	},function(){
		$(this).removeClass("green");
});
#T=$('').find('').hide().end().find('').click(function(){});
//切換visible屬性
$('#faq').find('dd').hide().end().find('dt').click(function(){
	var answer=$(this).next();
	if(answer.is(':visible')){
		answer.slideUp();
	}else{
		answer.slideDown();
	}
});
#T=$('').toggle()切换可见状态
//切换元素的可见状态
$("p").toggle()
#T=$('').click(function(event){function("test");});
//回調函數
var foobar="test";
var handler=function(data){alert(data)};
$('a').click(function(event){handler("test");});
#T=$('').bind('click',{msg:'內容!'},function(event){alert(event.data.msg);});
//傳值,防止原值被修改
$('#bar').bind('click',{msg:'內容!'},function(event){
	alert(event.data.msg);
});
#T=$('').bind('mouseenter mouseleave',function(){});
//让一个元素（初始情况下class没有设置成entered,当鼠标移进去的时候，在class中加上entered，反之则去除
$('#foo').bind('mouseenter mouseleave',function(){
	$(this).toggleClass('entered');
});
#T=$('').bind({click:function(){},mouseenter:function(){}});
//一次給同一個元素綁定多個事件
$('#foo').bind({
	click:function(){alert('a');},
	mouseenter:function(){alert('b');}
});
#T=$('').bind('click',function(event){alert(event.pageX+','+event.pageY);});
//點擊body的時候取得當前坐標
$('body').bind('click',function(event){
	alert('The mouse cursor is at('+event.pageX+','+event.pageY+')');
});
#T=$('').one("click",function(){});
//当所有段落被第一次点击的时候，显示所有其文本。
$("p").one("click",function(){
	alert($(this).text());
});
#T=$('').click(function(event,a,b){}).trigger("click",["aa","bb"]);
//给一个事件传递参数
$("p").click(function(event,a,b){
//一个普通的点击事件时，a和b是undefined类型
//如果用下面的语句触发，那么a指向"foo",而b指向"bar"
}).trigger("click",["foo","bar"]);

//把第一個form提交
$("form:first").trigger("submit");
//給元素捆綁事件
$('body').bind('click',function(event){
	alert('The mouse cursor is at('+event.pageX+','+event.pageY+')');
});
#T=one(type,[data],fn)
//当所有段落被第一次点击的时候，显示所有其文本。
$("p").one("click",function(){
	alert($(this).text());
});
#T=trigger(type,[data])
//在每一个匹配的元素上触发某类事件
//把第一個form提交
$("form:first").trigger("submit");
#T=triggerHandler(type,[data])
//将会触发指定的事件类型上所有绑定的处理函数
#T=事件委派
事件委派
#T=live(type,[data],fn)
$('.clickme').live('click',function(){alert($(this).text());});
#T= 
 
#T=將元素上绑定的事件移除
將元素上绑定的事件移除
#T=----------------------
----------------------
#T=$('').unbind()
//把所有段落的所有事件取消绑定
$("p").unbind()
#T=$('').unbind("click")
//将段落的click事件取消绑定
$("p").unbind("click")
#T=$('').die("click",aClick)
//将span的click事件取消绑定
function aClick(){
	$("div").show().fadeOut("slow");
}
$("div").click(function(){
	$("span").die("click",aClick)
});
#T=$('').click(function(){$('').die("click",function)});
function aClick(){
	$("div").show().fadeOut("slow");
}
$("#unbind").click(function(){
	$("#theone").die("click",aClick)
});
#T= 
 
#T=aJax方法
aJax方法
#T=----------------------
----------------------
#T=$.get
//用get方法發送數據到test.php,同時傳遞兩個參數,回調函數顯示服務器的輸出內容,php端用$_GET["name"]取得參數
$.get("test.php",{name:"John1",time:"2pm"},function(msg){
	alert(msg);
});
#T=$.post
//用post方法發送數據到test.php,同時傳遞兩個參數,回調函數顯示服務器的輸出內容,php端用$_POST["name"]取得參數
$.post("test.php",{name:"John2",time:"2pm"},function(msg){
	alert(msg);
});
#T=$.ajax
//用post方法發送數據到test.php,同時傳遞兩個參數,回調函數顯示服務器的輸出內容,php端用$_POST["name"]取得參數
$.ajax({
	type:"POST",url:"test.php",data:"name=風景&location=Boston",
	success:function(msg){
		if(msg.indexOf('Error:')!=-1){alert(msg);return false;}
		alert(msg);
	},error:function(msg){alert(msg);}
});$.ajaxSetup({cache:false});
#T=$.getJSON
//通过HTTP GET请求载入JSON数据
$.getJSON("test.php?name=風景1&location=Boston",function(data){
	alert(data);
//	$.each(data.items,function(i,item){
//		$("<img/>").attr("src",item.media.m).appendTo("#images");
//		if(i==3){return false;}
//	});
});
#T=$.getScript
//通过HTTP GET请求载入并执行一个JavaScript文件
$.getScript("custom.js",function(data){
	alert(data);
//	$("#go").click(function(){
//		$(".block").animate({backgroundColor:'pink'},1000)
//		.animate({backgroundColor:'blue'},1000);
//	});
});
#T=$('').load
//載入時使用post方式傳遞參數limit
$("div").load("feeds.php",{limit:25},function(){
	alert("載入成功了!");
});
#T= 
 
#T=文档处理
文档处理
#T=----------------------
----------------------
#T=$("p").append("He<b>llo</b>");向p标签插入内容
$("p").append("He<b>llo</b>");向p标签插入内容
#T=$("p").appendTo("div");将p标签的内容插入至div
$("p").appendTo("div");将p标签的内容插入至div
#T=$("p").prepend($("div")[0]);将第一个div及其内容放入p标签
$("p").prepend($("div")[0]);将第一个div及其内容放入p标签
#T=$("p").prependTo("div");将p标签及其内容插入至div
$("p").prependTo("div");将p标签及其内容插入至div
#T=$("p").after("<b>Hello</b>");在p标签后加入内容
$("p").after("<b>Hello</b>");在p标签后加入内容
#T=$("p").before("<b>Hello</b>");在p标签前加入内容
$("p").before("<b>Hello</b>");在p标签前加入内容
#T=$("p").insertAfter("div");将p标签及其内容移到div标签后边
$("p").insertAfter("div");将p标签及其内容移到div标签后边
#T=$("p").insertBefore("div");将p标签及其内容移到div标签前边
$("p").insertBefore("div");将p标签及其内容移到div标签前边
#T=$("p").wrap("<div id='a'></div>");在当前p标签外围包括div
$("p").wrap("<div id='a'></div>");在当前p标签外围包括div
#T=$("p").unwrap()将p标签外层的父标签去掉
$("p").unwrap()将p标签外层的父标签去掉
#T=$("p").wrapAll("<div></div>");在所有匹配的p标签外层添加一个包括
$("p").wrapAll("<div></div>");在所有匹配的p标签外层添加一个包括
#T=$("p").wrapInner("<b></b>");在p标签和内容之间放入b標籤
$("p").wrapInner("<b></b>");在p标签和内容之间放入b標籤
#T=$("p").replaceWith("新內容");把所有的p標籤及其內容替換成新內容
$("p").replaceWith("新內容");把所有的p標籤及其內容替換成新內容
#T=$("新內容").replaceAll("p");把所有的p標籤及其內容替換成新內容
$("新內容").replaceAll("p");把所有的p標籤及其內容替換成新內容
#T=$("p").empty();把p標籤內部的內容刪掉
$("p").empty();把p標籤內部的內容刪掉
#T=$("p").remove();把p標籤以及其內部的內容刪掉
$("p").remove();把p標籤以及其內部的內容刪掉
#T=$("p").detach("[align]");從p標籤列表中刪除包含align的標籤及其內容
$("p").detach("[align]");從p標籤列表中刪除包含align的標籤及其內容
#T=$("b").clone().prependTo("p");把b標籤及其內容複製到p標籤內
$("b").clone().prependTo("p");把b標籤及其內容複製到p標籤內
#T= 
 
#T=----------------------
----------------------
#T=常規事件
常規事件
#T=blur([fn])
blur([fn])
#T=change([fn])
change([fn])
#T=click([fn])
click([fn])
#T=dblclick([fn])
dblclick([fn])
#T=focus([fn])
focus([fn])
#T=focusin([fn])
focusin([fn])
#T=focusout([fn])
focusout([fn])
#T=keydown([fn])
keydown([fn])
#T=keypress([fn])
keypress([fn])
#T=keyup([fn])
keyup([fn])
#T=resize(fn)
resize(fn)
#T=hover(fn)
hover(fn)
#T=mousemove(fn)
mousemove(fn)
#T=mouseout(fn)
mouseout(fn)
#T=mouseover(fn)
mouseover(fn)
#T=mouseup(fn)
$("p").mouseup(function(){
 $(this).append('Mouse 按下了.');
}).mousedown(function(){
 $(this).append('Mouse 弹起了.');
});
#T=mousedown(fn)
$("p").mouseup(function(){
 $(this).append('Mouse 按下了.');
}).mousedown(function(){
 $(this).append('Mouse 弹起了.');
});
#T=mouseenter(fn)
$("div.enterleave").mouseenter(function(){
 $("p:first",this).text("鼠标进入了");
}).mouseleave(function(){
 $("p:first",this).text("鼠标离开了");
});
#T=mouseleave(fn)
$("div.enterleave").mouseenter(function(){
 $("p:first",this).text("鼠标进入了");
}).mouseleave(function(){
 $("p:first",this).text("鼠标离开了");
});
#T=toggle(fn)
$('#target').toggle(function(){
 alert('First handler for .toggle() called.');
},function(){
 alert('Second handler for .toggle() called.');
});
#T=select(fn)
$('input').select(function(){
 alert('Handler for .select() called.');
});
$('input').click(function(){
 $('#target').select();
});
#T=submit(fn)
$("form").submit(function(){
 return this.some_flag_variable;
});
$("form:first").submit();	
#T=error(fn)
$('#book').error(function(){
alert('Handler for .error() called.')
});

$("img").error(function(){
 $(this).hide();
});

#T=scroll
$(window).scroll(function(){ 
$("span").css("display","").fadeOut("slow"); 
});

$('#other').click(function() {
  $('#target').scroll();
});
#T=toggle
$('#target').toggle(function() {
  alert('First handler for .toggle() called.');
}, function() {
  alert('Second handler for .toggle() called.');
});
#T=select([fn])
select([fn])
#T=event.pageX;event.pageY
$(document).bind('mousemove',function(e){ 
    $("#log").text("e.pageX:" + e.pageX + ", e.pageY: " + e.pageY); 
});
#T=submit
var submitEl = $("td :submit").parent('td')
      .css({background:"yellow", border:"3px red solid"}).end();

#T=resize
$(window).resize(function(){
  alert($(window).width());
});
#T=load
$(window).load(function(){
  // run code
});

$('#result').load('ajax/test.html',function(){
alert('Load was performed.');
});

$("#new-nav").load("/ #jq-footerNavigation li");
#T=unload(fn)
unload(fn)
#T=取得触发事件的相关信息
$("a").mouseout(function(event) {
alert(event.relatedTarget.nodeName); //"DIV"
});

$("body").click(function(event) {
alert("clicked:" + event.target.nodeName);
});

$("a").click(function(event) {
alert(event.type); //"click"
});

$('#whichkey').bind('keydown',function(e){ 
alert(e.type + ': ' +  e.which);//keydown: 32
});
#T= 
 
#T=經典實例
經典實例
#T=----------------------
----------------------
#T=隔行換色
$("tr").each(function(i){this.style.backgroundColor=['#ccc','#fff'][i%2]})
#T=自定義擴展事件
//擴展出min和max兩個方法
$.extend({min:function(a,b){return a<b?a:b;},max:function(a,b){return a>b?a:b;}})
//調用
alert("a=10,b=20,max="+$.max(10,20)+",min="+(10,20));
#T=將$更改為jQuery
jQuery.noConflict();之後就可以jQuery("div")了
#T=將jQuery的Cache關閉
$.ajaxSetup({cache:false});
#T=取得元素總個數
$("ul li").length;
#T=觸發事件的元素索引值
$("ul li").click(function(){
	alert($(this).index());
})
#T=用parents()和children()追溯
$('td.1').click(function(){
	alert($(this).parents().parents().children().children().children('td.2 span').html());
});
#T=用find()追溯
$('td.1').click(function(){
	alert($(this).parents().parents().find('td.2 span').html());
});
//find()还可以这样用：
$('td.1').click(function(){
	alert($('').find('td.2 span').html());
});
#T=获取浏览器显示区域的高度|寬度
$(window).height();$(window).width();
#T=获取页面的文档高度|寬度
$(document).height();$(document).width();
#T=获取滚动条到顶部的垂直高度
$(document).scrollTop();
#T=获取滚动条到左边的垂直宽度
$(document).scrollLeft();
#T=计算元素位置和偏移量offset
var o=$(this).offset();
offset方法是一个很有用的方法，它返回包装集中第一个元素的偏移信息。默认情况下是相对body的偏移信息。结果包含top和left两个属性。
offset(options,results)
options.relativeTo	指定相对计算偏移位置的祖先元素。这个元素应该是relative或absolute定位。省略则相对body。
options.scroll		是否把滚动条计算在内，默认TRUE
options.padding		是否把padding计算在内，默认false
options.margin		是否把margin计算在内，默认true
options.border		是否把边框计算在内，默认true
#
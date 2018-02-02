#TITLE=See7di.@Mootools v1.4
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=try
Function.attempt(function(){
	^!=true;
	CollectGarbage()
});
#T=load
document.addEvent('domready',function(){
	^!;
});
#T=dump
Echo "<script type='text/javascript' src='lib/dump.js'></script>";
dump(^!,true);
#T=Debug
	/********************************/
	console.profile();
	console.time();
	/*-----------*/
	^!
	/*-----------*/
	//console.group($("#tab2 .tit"));console.groupEnd();
	console.count();
	//console.debug($("#tab2 .tit"));
	//console.dir($("#tab2 .tit"));//輸出對象所有的屬性或方法
	//console.assert(typeof $("#tab2 .tit")=='objec');//測試表達式是否程式,如果成立沒有反應,如果不成立則拋出錯誤
	console.timeEnd();
	console.profileEnd();
	/********************************/
#T=prompt
function pmp(o){
	var input=prompt(o.m,o.v);
	alert(input);
	return input;
}
#T=confirm
if(confirm('是否確定要刪除該項目？')){window.location=('?work=del&Id=1');}
#T=setTimeout
	window.setTimeout(function(){...},1000);//只延迟1秒,不循环
	window.setInterval(function(){...},1000);//延迟1秒,再循环

	var Fun=function(){clearTimeout(timer);alert('moo! Element id is:'+this.id);};
	var timer=Fun.delay(1000);

	优化内存
	var counter=0;
	function fun (){
		if(counter >= 150) return;
		counter++;
		setTimeout(fun,3000);
	}
	<meta HTTP-EQUIV=REFRESH CONTENT='60;URL=?work='>
#T=console.log
console.log(^!);
#T=禁止F5刷新頁面
$(document).onkeydown=function(event){//禁止用F5键
	if(event.keyCode==116){
		event.keyCode = 0;
		event.cancelBubble = true;
		return false;
	}
}
#T=类tab选项卡
var chgImages=function(){
	var $_imgbox=$$('#_imgbox li');//切換大圖
	$_imgbox.each(function(item,index){
		$(item).addEvent('mouseenter',function(){
			item.set('class','on');

			var src=item.getElement('img').getProperty('src');
			$('bsfdimg').set('src',src);
			$('_bsfdimg').set('href',src.replace("/@x/","/"));
			//alert(item.getProperty('class'))
		})
	}).setProperty('class','');
};
#T=获取浏览器宽和高
	网页可见区域宽： document.body.clientWidth
	网页可见区域高： document.body.clientHeight
	网页可见区域宽： document.body.offsetWidth (包括边线的宽)
	网页可见区域高： document.body.offsetHeight (包括边线的高)
	网页正文全文宽： document.body.scrollWidth
	网页正文全文高： document.body.scrollHeight
	网页被卷去的高： document.body.scrollTop
	网页被卷去的左： document.body.scrollLeft
	网页正文部分上： window.screenTop
	网页正文部分左： window.screenLeft
	屏幕分辨率的高： window.screen.height
	屏幕分辨率的宽： window.screen.width
	屏幕可用工作区高度： window.screen.availHeight
	屏幕可用工作区宽度： window.screen.availWidth
	注意在XHTML标准下一个请将body改成documentElement

	这里说说四种浏览器对 document.body 的 clientHeight、offsetHeight 和 scrollHeight 的解释。

	这四种浏览器分别为IE、Netscape、Opera、FireFox

	clientHeight
	四种浏览器对 clientHeight 的解释都没有什么异议，都认为是内容可视区域的高度，也就是说页面浏览器中可以看到内容的这个区域的高度，一般是最后一个工具条以下到状态栏以上的这个区域，与页面内容无关。

	offsetHeight
	IE、Opera 认为 offsetHeight = clientHeight + 滚动条 + 边框。
	NS、FF 认为 offsetHeight 是网页内容实际高度，可以小于 clientHeight。

	scrollHeight
	IE、Opera 认为 scrollHeight 是网页内容实际高度，可以小于 clientHeight。
	NS、FF 认为 scrollHeight 是网页内容高度，不过最小值是 clientHeight。

	简单地说
	clientHeight 就是透过浏览器看内容的这个区域高度。
	NS、FF 认为 offsetHeight 和 scrollHeight 都是网页内容高度，只不过当网页内容高度小于等于 clientHeight 时，scrollHeight 的值是 clientHeight，而 offsetHeight 可以小于 clientHeight。
	IE、Opera 认为 offsetHeight 是可视区域 clientHeight 滚动条加边框。scrollHeight 则是网页内容实际高度。

	总结一下，在标准模式下，我们获取文档可见区域的方法如下：
	function getViewSizeWithoutScrollbar(){//不包含滚动条
		return{
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight
		}
	}
	function getViewSizeWithScrollbar(){//包含滚动条
		if(window.innerWidth){
			return{
				width:window.innerWidth,
				height:window.innerHeight
			}
		}else if(document.documentElement.offsetWidth == document.documentElement.clientWidth){
			return{
				width:document.documentElement.offsetWidth,
				height:document.documentElement.offsetHeight
			}
		}else{
			return{
				width:document.documentElement.clientWidth+getScrollWith(),
				height:document.documentElement.clientHeight+getScrollWith()
			}
		}
	}
#T=判断变量是否存在
	if(!a || !a.length || a=='undefined'){}
#T=判斷對象是否存在
	if(!$(id)){
		return false;//alert('對象不存在');
	}
#T=动态加载Js到head区
	var _hd=$(document).getElement('head');
	var _js=new Element('script',{charset:'UTF-8',src:'/img/popup.js',type:'text/javascript'});
	_js.inject(_hd);
#T=被點擊對象的索引值
	ul=$$('ul');
	ul.addEvent('click',function(){
		alert(ul.indexOf(this));
	});
	或
	ul=$$('ul');
	ul.each(function($I,i){
		$I.onclick=function(){
			alert(i);
		};
	})
#T=click='fun(i)' i要$(i)才兼容IE
click='fun(i)' i要$(i)才兼容IE
#T= 
#T=$(document).getElement('head');
#T=document.getElement('body').set('html','a')
document.getElement('body').set('html','a')
#T=document.getElement('title').set('text','a')
document.getElement('title').set('text','a')
#T=document.getElementsByTagName('title')[0].set('text','a')
document.getElementsByTagName('title')[0].set('text','a')
#T=document.getElementsByTagName('head')[0].appendChild(Sty)
AddCss=function(c){
	var Sty=document.createElement('style');
	Sty.type='text/css';
	if(Browser.ie){
		Sty.styleSheet.cssText=c;
	}else{
		var Frag=document.createDocumentFragment();
		Frag.appendChild(document.createTextNode(c));
		Sty.appendChild(Frag);
	}
	document.getElementsByTagName('head')[0].appendChild(Sty);
};
AddCss('a{background-color:red;color:black;padding:20px;}');
#T=Events
	window.addEvent('domready',function(){
	   ^!;
	});
	document.addEvent('click',function(){
		^!
	});
	
	//按鍵盤觸發事件
	window.addEvent('keypress',function(){
		alert(event.keyCode);Dilog();
	})

	var fun=function(event){
		event.stop();
		alert('you clicked or moused over a link!');
	};
	$('simple').addEvent('click:relay(a)',fun);//$('simple').removeEvent('click:relay(a)',fun);
	$$('li.lay_itm').addEvents({
		'mouseenter:relay(input)':function(event){
		},
		'mouseleave:relay(input)':fun,
		'click:relay(input)':function(event){
			event.stop();
			alert(event.target+'|'+this.getProperty('value'))
		}
	});
	//$('simple').removeEvents();
	/*
	$('simple').removeEvents({
		'mouseenter:relay(a)':fun,
		'mouseleave:relay(a)':fun
	});

	$('simple').addEvents({
		'mouseover:relay(a)':monitor,
		'click:relay(a)':monitor,
		'scroll:relay(a)':function(){alert('scroll...')}
	}).fireEvent('scroll:relay(a)',$('myCheckbox'),2000);
	*/
#T= 


#T= ┉ Browse ┉
	浏览器特性相关:
		Browser.Features.xpath-(boolean)当前浏览器是否支持XPath进行DOM查询
		Browser.Features.xhr-(boolean)当前浏览器是否支持原生的XMLHTTP对象
		Browser.Features.air - (boolean)如果浏览器支持AIR.
		Browser.Features.query - (boolean)如果浏览器支持querySelectorAll.
		Browser.Features.json - (boolean)如果浏览器有一个原生的JSON对象.

	浏览器渲染引擎相关:
		Browser.ie - (boolean)如果浏览器是Internet Explorer.
		Browser.firefox - (boolean)如果浏览器是Firefox.
		Browser.safari - (boolean)如果浏览器是Safari.
		Browser.chrome - (boolean)如果浏览器是Chrome.
		Browser.opera - (boolean)如果浏览器是Opera.
	示例:
	alert(Browser.name);//Alerts "ie" in Internet Explorer,"firefox" in Mozilla Firefox,"chrome" in Google Chrome,"safari" or "opera".
		alert(Browser.version);
		if(Browser.ie){
			//This code will only run in IE
		}
		if(Browser.firefox2){
			//This code will only run in Firefox 2
		}
		if(Browser.ie6 || Browser.ie7){
			//Please upgrade your browser
		}
	操作系统平台:
	    Browser.Platform.mac - (boolean)如果平台是Mac.
		Browser.Platform.win - (boolean)如果平台是Windows.
		Browser.Platform.linux - (boolean)如果平台是Linux.
		Browser.Platform.ios - (boolean)如果平台是iOS.
		Browser.Platform.android - (boolean)如果平台是Android
		Browser.Platform.webos - (boolean)如果平台是WebOS
		Browser.Platform.other - (boolean)如果平台是neither Mac,Windows,Linux,Android,WebOS nor iOS.
		Browser.Platform.name - (string)平台名称
		Browser.Plugins.Flash - (object) -是否安装了相应版本的flash插件,如果没有则返回0
		Browser.Plugins.Flash.version - (number)已安装的flash插件版本.
		Browser.Plugins.Flash.build - (number)flash插件的构建版本

		Browser.Request - (object)XMLHTTP对象
		Browser.exec('alert("Moo!");');
#T= ┉ Element ┉
	Creates a new Element of the type passed in.
	语法:
	var myEl=new Element(element[,properties]);

	参数:
	element - (mixed) The tag name for the Element to be created or an actual DOM element or a CSS selector.
	properties - (object,optional) Calls the Single Argument version of Element:set with the properties object passed in.

	返回:
	(element) A new MooTools extended HTML Element.

	示例:
	var my=new Element('a',{
		href:'http://mootools.net',
		'class':'myClass',
		html:'Click me!',
		styles:{
			display:'block',
			border:'1px solid black'
		},
		events:{
			click:a,
			mouseover:function(){
				alert('mouseovered');
			}
		}
	});
	my.inject($('a'))
	//Using Selectors
	var myNewElement=new Element('a.myClass');

	注意:
	Because the element name is parsed as a CSS selector,colons in namespaced tags have to be escaped. So new Element('fb\:name) becomes <fb:name>.

	参见:
	$,Element:set

	语法:
	var myElements=new Elements(elements[,options]);

	参数:
	elements - (mixed) An array of elements or an HTMLCollection Object.

	返回:
	(array) An array-like Elements collection with the Element,Elements and Array methods.

	示例:
	Set Every Paragraph's Color to Red:
		$$('p').each(function(el){
		el.setStyle('color','red');
	});
	//Because $$('myselector') also accepts Element methods,the below
	//example has the same effect as the one above.
	$$('p').setStyle('color','red');

	Create Elements From an Array:
	var myElements=new Elements(['myElementID',$('myElement'),'myElementID2',document.getElementById('myElementID3')]);

	注意:
	In MooTools,every DOM function which returns a collection of nodes (such as $$) returns the nodes as instances of Elements.
	Because Elements is an array-like-object,it accepts all the Array methods,while giving precedence to Element and Elements methods.
	Every node of the Elements instance has all the Element methods.
#T= ┉ IFrame ┉
	Creates an IFrame HTML Element and extends its window and document with MooTools.
	语法:
	var myIFrame=new IFrame([el][,props]);

	参数:
	el - (mixed,optional) The id of the IFrame to be converted,or the actual IFrame element. If its not passed,a new IFrame will be created (default).
	props - (object,optional) The properties to be applied to the new IFrame. Same as Element:constructor props argument.

	返回:
	(element) A new IFrame HTML Element.

	示例:
	var myIFrame=new IFrame({
		src:'http://mootools.net/',
		styles:{
			width:800,
			height:600,
			border:'1px solid #ccc'
		},
		events:{
			mouseenter:function(){
				alert('Welcome aboard.');
			},
			mouseleave:function(){
				alert('Goodbye!');
			},
			load:function(){
				alert('The iframe has finished loading.');
			}
		}
	});

	注意:
	If the IFrame already exists and has a different name than id,the name will be made the same as the id.
	An IFrame's window and document will not be extended with MooTools methods.
#T= 
 
#T= Element
 Element
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=html
	Sets the innerHTML of the Element.
	语法:
	myElement.set('html',html);

	参数:
	html - (string) The new content as HTML string.

	返回:
	(element) This Element.

	示例:
	<div id="myElement"></div>

	Js:
	$('myElement').set('html','<div></div><p></p>');

	结果:
	<div id="myElement">
		<div></div>
		<p></p>
	</div>

	另外的用法:
	Returns the inner HTML of the Element.

	语法:
	myElement.get('html');

	返回:
	(text) This Element's innerHTML.
#T=text
	Sets the inner text of the Element.
	语法:
	myElement.set('text',text);

	参数:
	text - (string) The new text content for the Element.

	返回:
	(element) This Element.

	示例:
	<div id="myElement"></div>

	Js:
	$('myElement').set('text','some text');
	//the text of myElement is now 'some text'.

	结果:
	<div id="myElement">some text</div>

	另外的用法:
	Gets the inner text of the Element.

	语法:
	var myText=myElement.get('text');

	返回:
	(string) The text of the Element.

	示例:
	<div id="myElement">my text</div>

	Js:
	var myText=$('myElement').get('text');//myText='my text'.
#T=tag
	Returns the tag name of the Element in lower case.
	语法:
	var myTag=myElement.get('tag');

	返回:
	(string) The tag name in lower case.

	示例:
	<img id="myImage" />

	Js:
	var myTag=$('myImage').get('tag');//myTag='img'
#T= 
 
#T= Selector
 Selector
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=$
	The dollar function is an alias for document:id if the $ variable is not set already. However it is not recommended to use more frameworks,the $ variable can be set by another framework or script. MooTools will detect this and determine if it will set the $ function so it will not be overwritten.
	示例:
	var myElement=$('myElement');
	var myElement2=document.id('myElement');
	myElement == myElement2;//returns true
	(function($){
		//Now you can use $ safely in this closure
	})(document.id)
#T=$$
	Selects and extends DOM elements. Return an Elements instance. The Element instance returned is an array-like object,supporting every Array method and every Element method.
	语法:
	var myElements=$$(argument);

	参数:
	selector - (string) A CSS selector
	elements - (elements),(collection) or (array) An enumerable list of elements
	element,element - (element) any number of elements as arguments

	返回:
	(elements) - An array-like Elements collection of all the DOM elements matched,extended with document:id.

	示例:
	根据Tag Names得到多个Element:
	$$('a');//returns all anchor elements in the page.

	Get an Elements instance by passing multiple elements:
	$$(element1,element2,element3);//returns an Elements instance containing these 3 elements.

	Convert any array or collection of elements to an Elements instance:
	$$([element1,element2,element3]);//returns an Elements instance containing these 3 elements.
	$$(document.getElementsByTagName('a'));//returns an Elements instance containing the result of the getElementsByTagName call.

	使用CSS Selectors:
	$$('#myElement');//returns an Elements instance containing only the element with the id 'myElement'.
	$$('#myElement a.myClass');//returns an Elements instance of all anchor tags with the class 'myClass' within the DOM element with id 'myElement'.
	$$('a,b');//returns an array of all anchor and bold elements in the page.

	注意:
	Since MooTools 1.3 this function does not accept multiple collections or multiple strings as arguments.
	If an expression doesn't find any elements,an empty Elements instance will be returned.
	The return type of element methods run through $$ is always an Elements instance,regardless of the amount of results.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=document.id
	The document.id function has a dual purpose:Getting the element by its id,and making an element in Internet Explorer "grab" all the Element methods.
	语法:
	var myElement=document.id(el);

	参数:
	el - The Element to be extended. Can be one of the following types:
		(element) The element will be extended if it is not already.
		(string) A string containing the id of the DOM element desired.
		(object) If the object has a toElement method,toElement will be called to get the Element.

	返回:
	(element) A DOM element.
	(null) Null if no matching id was found or if toElement did not return an element.

	示例:
	根据一个ID得到一个DOM Element:
	var myElement=document.id('myElement');

	根据引用得到一个DOM Element:
	var div=document.getElementById('myElement');
	div=document.id(div);//the element with all the Element methods applied.

	注意:
	This method is useful when it's unclear if working with an actual element or an id. It also serves as a shorthand for document.getElementById().
	In Internet Explorer,the Element is extended the first time document.id is called on it,and all the Element Methods become available.
	Browsers with native HTMLElement support,such as Safari,Firefox,and Opera,apply all the Element Methods to every DOM element automatically.
	Because MooTools detects if an element needs to be extended or not,this function may be called on the same Element many times with no ill effects.
#T=--Select从属--
--Select从属--
#T=Selector.getElement('div')
	Gets the first descendant element whose tag name matches the tag provided. CSS selectors may also be passed.
	语法:
	var myElement=myElement.getElement(tag);

	参数:
	tag - (string) Tag name of the element to find or a CSS Selector.

	返回:
	(mixed) If a match is found,the Element will be returned. Otherwise,returns null.

	示例:
	var firstDiv=$(document.body).getElement('div');

	注意:
	This method is also available for Document instances.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=Selector.getElements('a') 返回array
	Collects all decedent elements whose tag name matches the tag provided. CSS selectors may also be passed.
	语法:
	var myElements=myElement.getElements(tag);

	参数:
	tag - (string) String of the tag to match or a CSS Selector.

	返回:
	(array) An Elements array of all matched Elements.

	示例:
	var allAnchors=$(document.body).getElements('a');
	$(Id).getElements('option').destroy();

	注意:
	This method is also available for Document instances.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=Selector.getElementById('myChild')
	Gets the element with the specified id found inside the current Element.
	语法:
	var myElement=anElement.getElementById(id);

	参数:
	id - (string) The ID of the Element to find.

	返回:
	(mixed) If a match is found,returns that Element. Otherwise,returns null.

	示例:
	var myChild=$('myParent').getElementById('myChild');

	注意:
	This method is not provided for Document instances as document.getElementById is provided natively.
#T=Selector.getElementsByTagName('tag')
	destroy:function(){
		var children = clean(this).getElementsByTagName('*');
		Array.each(children, clean);
		Element.dispose(this);
		return null;
	}
#T=Selector.contains 匹配该节点的所有后代子节点
	Checks all descendants of this Element for a match.
	语法:
	var result=myElement.contains(el);

	参数:
	el - (mixed) Can be an Element reference or string id.

	返回:
	(boolean) Returns true if the element contains passed in Element is a child,otherwise false.

	示例:
	<div id="Darth_Vader">
		<div id="Luke"></div>
	</div>

	Js:
	if($('Darth_Vader').contains('Luke')) alert('Luke,I am your father.');//tan tan tannn...
#T=getPrevious 返回本元素的前一个兄弟元素(不包括文本节点)
	Returns the previousSibling of the Element (excluding text nodes).
	语法:
	var previousSibling=myElement.getPrevious([match]);

	参数:
	match - (string,optional):A tag name to match the the found element(s) with. A full CSS selector can be passed.

	返回:
	(mixed) The previous sibling Element or null if none found.
#T=getAllPrevious 返回本元素之前的所有兄弟元素
	Like Element:getPrevious,but returns a collection of all the matched previousSiblings.
#T=getSiblings 返回被元素之前和之后的所有兄弟节点
	Like Element:getAllPrevious but returns all Element's previous and next siblings (excluding text nodes). Returns as Elements.
	语法:
	var siblings=myElement.getSiblings([match]);

	参数:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	返回:
	(array) A Elements array with all of the Element's siblings,except the text nodes.
#T=getNext 返回本元素后的一个兄弟元素(不包括文本节点)
	As Element:getPrevious,but tries to find the nextSibling (excluding text nodes).
	语法:
	var nextSibling=myElement.getNext([match]);

	参数:
	match - (string,optional):A comma seperated list of tag names to match the found element(s) with. A full CSS selector can be passed.

	返回:
	(mixed) The next sibling Element or null if none found.
#T=getAllNext 返回本元素之后的所有兄弟元素
	Like Element.getNext,but returns a collection of all the matched nextSiblings.
#T=getFirst 获取第一个子元素(不包括文本节点)
	Gets the first element that matches the passed in expression.
	语法:
	var firstElement=myElement.getFirst([match]);

	参数:
	match - (string,optional):A full CSS selector to match the found element(s) with.

	返回:
	(mixed) The first found element or null if none found.
#T=getLast 获取最后一个子元素(不包括文本节点)
	Gets the last element that matches the passed in expression.
	语法:
	var lastElement=myElement.getLast([match]);

	参数:
	match - (string,optional):A full CSS selector to match the found element(s) with.

	返回:
	(mixed) The last found element,or returns null if none found.
#T=getParent | getParents 获取直接父元素
	Works as Element:getPrevious,but tries to find the parentNode.
	语法:
	var parent=myElement.getParent([match]);

	参数:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	返回:
	(mixed) The target Element's parent or null if no matching parent is found.

	示例:
	$('id').getParent().setStyle('display','none');
	或
	brothers:function(match){//得到所有兄弟节点,但不包含自身
		return this.getParent().getChildren(match).erase(this);//$('f').brothers();
	}
#T=getChildren 返回所有子元素(不包括文本节点)
	Returns all the Element's children (excluding text nodes). Returns as Elements.
	语法:
	var children=myElement.getChildren([match]);

	参数:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	返回:
	(array) A Elements array with all of the Element's children,except the text nodes.

	示例:
	$('id').getChildren().setStyle('display','none');
	或
	brothers:function(match){//得到所有兄弟节点,但不包含自身
		return this.getParent().getChildren(match).erase(this);//$('f').brothers();
	}

	注意:
	The difference between the methods getChildren and getElements is that getChildren will only return its direct children while getElements searches for all the Elements in any depth.
#T= 
 
#T=$$('*') 选取所有的元素,IE有问题
$$('*') 选取所有的元素,IE有问题
#T=$$('','') 同时选择多个
	$$('^!','textarea')
#T=$$( = ) 属性为某个特定的值
	$$('input[name=email]')
#T=$$( != ) 属性不包含某个特定的值
	$$('input[name!=email]')
#T=$$( ^= ) 属性以某个值开始
	$$('input[name^=email]')
#T=$$( $= ) 属性以某个值结尾
	$$('input[name$=email]')
#T=$$( *= ) 属性内包含某个值
	$$('input[name*=email]')
#T=$$( ~= ) 	
	该属性的值必须是一系列用空格隔开的多个值,(比如,class="title featured home"),而且这些值中的一个必须是指定的值"value"
	$$('input[class~=featured]')
#T=$$( |= )
	属性的值就是"value"或者以"value"开始并立即跟上一个"-"字符,也就是"value-"(比如lang="zh-cn") 
	$$('input[lang|=zh]')
#T=$$('ul p') 选择子子孙孙
	选取body元素里的所有层次下的div
#T=$$('ul > li') 选择儿子
	选取parent元素下的child(子)元素,只有一层
#T=$$('.two + h2') 选取紧跟在.two元素后的一个兄弟元素
	选取h1的下一个h2元素,二者是兄弟关系,
#T=$$('.two ~') 选取紧跟在.two元素后的所有兄弟元素
$$('.two ~') 选取紧跟在.two元素后的所有兄弟元素
#T=$$('.two ~ li') 选取紧跟在.two元素后的所有兄弟元素
$$('.two ~ li') 选取紧跟在.two元素后的所有兄弟元素
#T=$$(' !~ ') 得到上一个兄弟元素
	Gets the previous siblings.
	示例:
	$$('p.foo !~')            //Gets all previous siblings of <p class="foo">
	$$('p.foo !~ blockquote') //Gets every <blockquote> with a <p class="foo"> sibling somewhere *after* it
#T=$$(' ~~ ') 得到所有的兄弟元素
	Gets all siblings.
	示例:
	$$('p.foo ~~')            //Gets all previous and next siblings of <p class="foo">
	$$('p.foo ~~ blockquote') //Gets every <blockquote> with a <p class="foo"> sibling before OR after it
#T=$$(' ^ ') 得到第一个子元素
	Gets the first child of an element.
	示例:
	$$('p.foo ^')       //Gets the first child of <p class="foo">
	$$('p.foo ^ strong')    //Gets every <strong> that is the first element child of a <p class="foo">
#T=$$(' !^ ') 得到最后一个子元素
	Gets the last child of an element.
	示例:
	$$('p.foo !^')      //Gets the last child of <p class="foo">
	$$('p.foo !^ strong')   //Gets every <strong> that is the last element child of a <p class="foo">
#T=$$(':not(?)) 匹配除?以外的
	除 .foobar 以外的所有 <div> 的背景为黑色
	$$('div:not(.foobar)').setStyle('background','#000');
#T= 
 
#T=[attr] 匹配包含给定属性的元素
	查找所有含有id属性的div元素:
	$$('div[id]')
#T=[attr=value] 匹配给定的属性是某个特定值的元素
	查找所有name属性是newsletter的input元素:
	$$("input[name='newsletter']").attr('checked',true);
#T=[attr!=value] 匹配给定的属性是不包含某个特定值的元素
	查找所有name属性不是newsletter的input元素:
	$$("input[name!='newsletter']").attr('checked',true);
#T=[attr^=value] 匹配给定的属性是以某些值开始的元素
	$$("input[name^='news']")
#T=[attr$=value] 匹配给定的属性是以某些值结尾的元素
	查找所有name以'letter'结尾的input元素:
	$$("input[name$='letter']")
#T=[attr*=value] 匹配给定的属性是以包含某些值的元素
	查找所有name包含'man'的input元素:
	$$("input[name*='man']")
#T=[attr~=value] 该属性的值必须是一系列用空格隔开的多个值
	该属性的值必须是一系列用空格隔开的多个值,(比如,class="title featured home"),而且这些值中的一个必须是指定的值"value"	
	查找所有的a元素,并且class属性中含有tit的元素
	$$('a[class~=tit]')
#T=[attr|=value] 匹配包含"-"字符的元素
	属性的值就是"value"或者以"value"开始并立即跟上一个"-"字符,也就是"value-"(比如lang="zh-cn")	
	该语句将匹配所有class属性包含"post"并带"-"字符的div元素
	$$("[class|='post']")
#T=$$("input[id][name$='man']") 复合属性选择器
	需要同时满足多个条件时使用找到所有含有id属性,并且它的name属性是以man结尾的:
	$$("input[id][name$='man']")
#T= 
 
#T=$$('p:index(2)') 根据索引值取得元素
	Matches the node at the specified index
	示例:
	$$('p:index(2)');//Gets the third <p> tag.

	注意:
	This is zero-indexed.
#T=$$('li:even') 匹配所有索引值为偶数的元素
	从 0 开始计数（自定义伪类选择器）
	强烈推荐使用本选择器来替代nth-child(even), 因为它返回的是实际的偶数序子元素
#T=$$('li:odd') 匹配所有索引值为奇数的元素
	从 0 开始计数（自定义伪类选择器）
	强烈推荐使用本选择器来替代nth-child(odd), 因为它返回的是实际的奇数序子元素
	
	注意:
	This selector is not part of the w3c specification,therefore its index starts at 0. This selector is highly recommended over nth-child(odd),as this will return the real odd children.
#T=$$('td:even') 所有事件元素
	Matches every even child.
	示例:
	$$('td:even');

	注意:
	This selector is not part of the w3c specification,therefore its index starts at 0. This selector is highly recommended over nth-child(even),as this will return the real even children.
#T=$$(':checked') 所有checked的元素
	Matches all Elements that are checked.
	示例:
	$$(':checked')
	$('myForm').getElements('input:checked');
#T=$$(':enabled') 所有enabled的元素
	Matches all Elements that are enabled.
	示例:
	$$(':enabled')
	$$('*:enabled')
	$('myElement').getElements(':enabled');
#T=$$(':empty') 所有empty的元素
	Matches all elements which are empty.
	示例:
	$$(':empty');
	$('myElement').getElements(':empty');
#T=$$(':focus') 所有已取得焦点的元素
	Gets the element in focus.
	示例:
	$$(':focus');//Gets the element in focus
#T=$$('select option:selected')匹配所有选中的option元素
	查找所有选中的选项元素:
	$$('select option:selected')
	
	自定义伪类选择器
#T=$$('input:not([type="submit"])') 除了not规定之外的元素
	Matches all elements that do not match the selector.

	注意:
	The Slick implementation of the:not pseudoClass is a superset of the standard. i.e. it is more advanced than the specification.

	示例:
	$$(':not(div.foo)');//all elements except divs with class 'foo'
	$$('input:not([type="submit"])');//all inputs except submit buttons
	myElement.getElements(':not(a)');
	$$(':not(ul li)');
	$$('.post p:not(.date)');
#T=$$('li:nth-child(2n+1)') 根据索引取得元素(奇数,偶数)
	Matches every nth child.
	nth-child从1开始
	用法:
	':nth-child(nExpression)'

	变量:
	nExpression - (string) A nth expression for the "every" nth-child.

	示例:
	$$('#myDiv:nth-child(2n)');//Returns every 偶数 child.
	$$('#myDiv:nth-child(n)');//Returns all children.
	$$('#myDiv:nth-child(2n+1)') //Returns every 奇数 child.
	$$('#myDiv:nth-child(4n+3)') //Returns Elements 3,7,11,15,等等.

	所有奇数子元素:
	':nth-child(odd)'

	所有偶数子元素:
	':nth-child(even)'

	无兄弟节点的子元素:
	':nth-child(only)'

	第一个子元素:
	'nth-child(first)'

	最后一个子元素:
	'nth-child(last)'

	注意:
	This selector respects the w3c specifications,so it has 1 as its first child,not 0. Therefore nth-child(odd) will actually select the even children,if you think in zero-based indexes.
#T=$$('td:first-child') 选取每个父元素的第一个子元素
	Matches the first child.
	用法:
	':first-child'

	示例:
	$$('td:first-child');

	在每个ul中查找第一个li:
	$$('ul li:first-child')
#T=$$('td:last-child') 匹配最后一个子元素
	Matches the last child.
	':last'只匹配一个元素,而此选择符将为每个父元素匹配一个子元素

	用法:
	':last-child'

	示例:
	$$('td:last-child');

	在每个ul中查找最后一个li:
	$$('ul li:last-child')
#T=$$('td:only-child') 唯一一个子元素
	Matches an only child of its parent Element.
	如果某个元素是父元素中唯一的子元素,那将会被匹配如果父元素中含有其他元素,那将不会被匹配

	用法:
	':only-child'

	示例:
	$$('td:only-child');
#T=$$('p:contains("find me")') 所有包含指定文字的元素
	Matches all the Elements which contains the text.
	变量:
	text - (string) The text that the Element should contain.

	示例:
	$$('p:contains("find me")');
#T=filter(selector)过滤
	Filters a collection of elements by a given tag name. This method will be able to filter by any selector. It also works like Array:filter,by filtering collection of elements with a function.
	语法:
	var filteredElements=elements.filter(selector);

	参数:
	selector - (mixed) A single CSS selector.

	返回:
	(array) A subset of this Elements instance.
#T=--逆向组合--
	Reverse Combinators redirect the flow of selectors and combinators. Slick implements these by prepending ! to a selector or combinator.

	示例:
	<div class="foo"><li id="drop_here" class="draggable">f
	<p>1</p>
	<p>2</p>
	<p class="foo">3</p>
	<p>4</p>
	</li>
	</div>

	document.getElement('p ! div')    //一个<div>是<p>的祖先
	document.getElement('p !> li')   //一个<li>是<p>的父亲

	//<p>2</p>将会被选中
	document.getElement('.foo !+ p')  //获取上一个相邻的兄弟元素

	注意:
	Reverse Combinators are used internally by MooTools for many of our traversal methods.
	They offer an extremely concise and powerful alternative to traversal methods like getParent().
#T= ┉ Function ┉
 ┉ Function ┉
#T=伪元素
	::first-line伪元素将匹配block、inline-block、table-caption、table-cell等等级别元素的第一行
	将一篇文章的第一行文字改成小写字母：
	h1 + p::first-line {
		font-variant: small-caps;  	
	}

	::first-letter伪元素将会匹配一个文本块的第一个字母，除非在同一行里面包含一些其它元素，比如图片。
	和::first-line伪类一样，::first-letter通常用于给文本元素添加排版细节，比如下沉字母或首字母。
	这里是如何使用::first-letter伪元素创建首字下沉的例子:
	p{font-size: 12px;}
	p::first-letter{
		font-size: 24px;
		float: left;
	}

	::before和::after 伪元素用于在一个元素的前面或后面插入内容，纯CSS方法。
	这些元素将继承它们将附加的元素的大部分属性。
	假设你想在你的页面中的图标的描述前面添加文字“Graphic number x:”。你将无需写文字“Graphic number”，或者自己手动添加数字：
	.post{counter-reset: image;}
	p.description::before{content:"Figure number " counter(image) ": ";counter-increment:image;}
	首先，我们告诉HTML来创建“image”计数器。比如我们可以添加该属性到页面的body。同样我们也可以给该计数器起任何一个名字，只要你想，只要我们常常使用同样的名字引用它：自己试试吧！
	那么我们想在class为”description”的每一个段落之前添加这一块内容: “Figure number ” — 注意只有我们在引号里面写的内容才会被创建到页面中，所以我们也要添加一个空格！
	然后，我们就有了counter(image):这将用到我们之前在.post选择器中定义的属性。它默认会从数字1开始。
	下一个属性在那里表示计数器知道对于每一个p.description，它需要将image计数器增加1 (counter-increment: image)。
	它并不像看起来的那么复杂，而且还会灰常的有用。
	::before和::after伪元素常常只使用content属性，来添加一些短语或排版元素，但是这里我们展示了我们如果以一种更加强大的结合counter-reset和counter-increment属性的方式来使用它们。
	有趣的是: ::first-line 和::first-letter 伪元素可以匹配使用::before伪元素生成的内容，如果存在的话
#T=自定义选择器
	This Object contains the functions that respond to the first argument passed in Element:get,Element:set and Element:erase.
	Adding a Custom Element Property

	Element.Properties.disabled ={
		get:function(){
			return this.disabled;
		},
		set:function(value){
			this.disabled=!!value;
			this.setAttribute('disabled',!!value);
		}
	};
	Using a Custom Element Property
	//gets the "disabled" property
	$(element).get('disabled');
	//sets the "disabled" property to true,along with the attribute
	$(element).set('disabled',true);

	使用对象:
	Additionally,you can access these custom getters and setters using an object as the parameter for the set method.

	示例:
	//using set:
	$(divElement).set({html:'<p>Hello <em>People</em>!</p>',style:'background:red'});
	//for new Elements (works the same as set):
	new Element('input',{type:'checkbox',checked:true,disabled:true});

	注意:
	Automatically returns the element for setters.
	Since MooTools 1.3 this is a native JavaScript Object and not an instance of the deprecated Hash
#T=Slick.definePseudo 定义自己的伪选择字串
	definePseudo allows you to create your own custom pseudo selectors.
	示例:
	Slick.definePseudo('display',function(value){
		return Element.getStyle(this,'display') == value;
	});
	<div style="display:none">foo</div>
	<div style="display:block">bar</div>
	$$(':display(block)');//Will return the block element
	Slick.definePseudo('my-custom-pseudo',function(){
		//'this' is the node to check
		return Element.retrieve(this,'something-custom').isAwesome;
	});
	$$(':my-custom-pseudo')//Will return the first <p> tag that is awesome
#T= 


#T= Dom
 Dom
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T= ┉ Css ┉
 ┉ Css ┉
#T=hasClass 检测元素上是否包含指定的样式名
	Tests the Element to see if it has the passed in className.
	语法:
	var result=myElement.hasClass(className);

	参数:
	className - (string) The class name to test.

	返回:
	(boolean) Returns true if the Element has the class,otherwise false.

	示例:
	<div id="myElement" class="testClass"></div>

	Js:
	$('myElement').hasClass('testClass');//returns true
#T=addClass 如果指定样式名在元素上不存在,则添加该样式名
	Adds the passed in class to the Element,if the Element doesnt already have it.
	语法:
	myElement.addClass(className);

	参数:
	className - (string) The class name to add.

	返回:
	(element) This Element.

	示例:
	<div id="myElement" class="testClass"></div>

	Js:
	$('myElement').addClass('newClass');

	结果:
	<div id="myElement" class="testClass newClass"></div>
#T=removeClass 将指定样式名从元素上删除
	Works like Element:addClass,but removes the class from the Element.
	语法:
	myElement.removeClass(className);

	参数:
	className - (string) The class name to remove.

	返回:
	(element) This Element.

	示例:
	<div id="myElement" class="testClass newClass"></div>

	Js:
	$('myElement').removeClass('newClass');

	结果:
	<div id="myElement" class="testClass"></div>
#T=toggleClass 删除元素上指定的样式名
	Adds or removes the passed in class name to the Element,depending on whether or not it's already present.
	语法:
	myElement.toggleClass(className,force);

	参数:
	className - (string) The class to add or remove.
	force - (boolean,optional) Force the class to be either added or removed

	返回:
	(element) This Element.

	示例:
	<div id="myElement" class="myClass"></div>

	Js:
	$('myElement').toggleClass('myClass');

	结果:
	<div id="myElement" class=""></div>

	Js:
	$('myElement').toggleClass('myClass');

	结果:
	<div id="myElement" class="myClass"></div>
#T=setStyle 给一个style赋值
	Sets a CSS property to the Element.
	语法:
	myElement.setStyle(property,value);

	参数:
	property - (string) The property to set.
	value - (mixed) The value to which to set it. Numeric values of properties requiring a unit will automatically be appended with 'px'.

	返回:
	(element) This element.

	示例:
	//Both lines have the same effect.
	$('myElement').setStyle('width','300px');//the width is now 300px.
	$('myElement').setStyle('width',300);//the width is now 300px.

	注意:
	All number values will automatically be rounded to the nearest whole number.
#T=getStyle 获取一个style值
	Returns the style of the Element given the property passed in.
	语法:
	var style=myElement.getStyle(property);

	参数:
	property - (string) The css style property you want to retrieve.

	返回:
	(string) The style value.

	示例:
	$('myElement').getStyle('width');//returns "300px".
	$('myElement').getStyle('width').toInt();//returns 300.
#T=setStyles 给多个style赋值
	Applies a collection of styles to the Element.
	语法:
	myElement.setStyles(styles);

	参数:
	styles - (object) An object of property/value pairs for all the styles to apply.

	返回:
	(element) This element.

	示例:
	$('myElement').setStyles({
		border:'1px solid #000',
		width:300,
		height:400
	});

	参见:
	Element:getStyle
#T=getStyles 获取多个style值
	Returns an object of styles of the Element for each argument passed in.
	语法:
	var styles=myElement.getStyles(property[,property2[,property3[,...]]]);

	参数:
	properties - (strings) Any number of style properties.

	返回:
	(object) An key/value object with the CSS styles as computed by the browser.

	示例:
	$('myElement').getStyles('width','height','padding');
	//returns{width:'10px',height:'10px',padding:/10px 0px 10px 0px'}
#T=getSize 得到宽度和高度
	Returns the height and width of the Element,taking into account borders and padding. The following method is also available on the Window object.
	语法:
	myElement.getSize();

	返回:
	(object) An object containing the width (as x) and the height (as y) of the target Element.

	示例:
	var size=myElement.getSize();
	alert('The element is '+size.x+' pixels wide and '+size.y+'pixels high.');

	注意:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getCoordinates 得到坐标
	Returns an object with width,height,left,right,top,and bottom coordinate values of the Element.
	语法:
	myElement.getCoordinates(relative);

	参数:
	relative - (element,optional) if set,the position will be relative to this element,otherwise relative to the document.

	返回:
	(object) An object containing the Element's current:top,left,width,height,right,and bottom.

	示例:
	var myValues=$('myElement').getCoordinates();

	返回:{
		top:50,
		left:100,
		width:200,
		height:300,
		right:300,
		bottom:350
	}

	参见:
	Element:getPosition

	注意:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getOffsetParent
	Returns the parent of the element that is positioned,if there is one.
	语法:
	myElement.getOffsetParent();

	返回:
	(mixed) If the element has a parent that is positioned,it returns that element,otherwise it returns null.
#T=getPosition
	Returns the real offsets of the element.
	语法:
	myElement.getPosition(relative);

	参数:
	relative - (Element,defaults to the document) If set,the position will be relative to this Element.

	返回:
	(object) An object with the x and y coordinates of the Element's position.

	示例:
	$('element').getPosition();//returns{x:100,y:500};

	参见:
	QuirksMode:Find position

	注意:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=setPosition
	Sets the position of the element's left and top values to the x/y positions you specify.
	语法:
	myElement.setPosition(positions);

	参数:
	positions - (object) an object with x/y values (integers or strings,i.e. 10 or "10px")

	返回:
	(element) the element that is positioned.

	示例:
	myElement.setPosition({x:10,y:100});
#T= ┉ Method ┉
 ┉ Method ┉
#T=send 提交一个form
	Element Method:send
	Sends a form or a container of inputs with an HTML request.

	语法:
	myElement.send(url);

	参数:
	url - (string,optional) The url you want to send the form or the "container of inputs" to. If url is omitted,the action of the form will be used. url cannot be omitted for "container of inputs".

	返回:
	(element) This Element.

	示例:
	<form id="myForm" action="submit.php">
		<p>
			<input name="email" value="bob@bob.com" />
			<input name="zipCode" value="90210" />
		</p>
	</form>

	Js:
	$('myForm').send();

	注意:
	The URL is taken from the action attribute of the form.
#T=set('text','text goes here')
	This is a "dynamic arguments" method. Properties passed in can be any of the 'set' properties in the Element.Properties Object.
	语法:
	myElement.set(arguments);

	参数:
	两个参数 (property,value)
	property - (string) The string key from the Element.Properties Object representing the property to set.
	value - (mixed) The value to set for the specified property.
	一个参数 (properties)
	properties - (object) Object with its keys/value pairs representing the properties and values to set for the Element (as described below).

	返回:
	(element) This Element.

	示例:
	$('gototop').set('opacity','0').setStyle('display','block');
	//OR
	With Property and Value:
	$('myElement').set('text','text goes here');
	$('myElement').set('class','active');
	//the 'styles' property passes the object to Element:setStyles.
	var body=$(document.body).set('styles',{
		font:'12px Arial',
		color:'blue'
	});

	针对Object:
	var myElement=$('myElement').set({
		//the 'styles' property passes the object to Element:setStyles.
		styles:{
			font:'12px Arial',
			color:'blue',
			border:'1px solid #f00'
		},
		//the 'events' property passes the object to Element:addEvents.
		events:{
			click:function(){alert('click');},
			mouseover:function(){this.addClass('over')}
		},
		//Any other property uses Element:setProperty.
		id:'documentBody'
	});

	注意:
	All the property arguments are passed to the corresponding method of the Element.Properties Object.
	If no matching property is found in Element.Properties,it falls back to Element:setProperty.
	Whenever using Element:setProperty to set an attribute,pass in the lowercase,simplified form of the property. For example:
		use 'for',not 'htmlFor',
		use 'class',not 'className'
		use 'frameborder',not 'frameBorder'
		etc.

	参见:
	Element,Element.Properties,Element:setProperty,Element:addEvents,Element:setStyles
#T=get('tag')
	This is a "dynamic arguments" method. Properties passed in can be any of the 'get' properties in the Element.Properties Object.
	语法:
	myElement.get(property);

	参数:
	property - (string) The string key from the Element.Properties Object representing the property to get.

	返回:
	(mixed) The result of calling the corresponding 'get' function in the Element.Properties Object.

	示例:
	Using Custom Getters:
	var tag=$('myDiv').get('tag');//returns "div".

	Fallback to Element Attributes:
	var id=$('myDiv').get('id');//returns "myDiv".
	var value=$('myInput').get('value');//returns the myInput element's value.

	注意:
	If the corresponding accessor doesn't exist in the Element.Properties Object,the result of Element:getProperty on the property passed in is returned.

	参见:
	Element,Element.Properties,Element:getProperty
#T=erase('id') 删除属性
	This is a "dynamic arguments" method. Properties passed in can be any of the 'erase' properties in the Element.Properties Object.
	语法:
	myElement.erase(property);

	参数:
	property - (string) The string key from the Element.Properties Object representing the property to erase.

	返回:
	(mixed) The result of calling the corresponding 'erase' function in the Element.Properties Object.

	示例:
	$('myDiv').erase('id');//Removes the id from myDiv.
	$('myDiv').erase('class');//myDiv element no longer has any class names set.

	注意:
	If the corresponding eraser doesn't exist in the Element.Properties Object,Element:removeProperty is called with the property passed in.

	参见:
	Element,Element.Properties,Element:removeProperty
#T=match('div') 测试该元素是否匹配传入的参数
	Tests this Element to see if it matches the argument passed in.
	语法:
	myElement.match(match);

	参数:
	match - can be a string or element
		(string) The tag name to test against this element. Any single CSS selectors may also be passed.
		(element) An element to match;returns true if this is the actual element passed in.

	返回:
	(boolean) If the element matched,returns true. Otherwise,returns false.

	示例:
	Using a Tag Name:
	//returns true if #myDiv is a div.
	$('myDiv').match('div');

	Using a CSS Selector:
	//returns true if #myDiv has the class foo and is named "bar"
	$('myDiv').match('.foo[name=bar]');

	Using an Element:
	var el=$('myDiv');
	$('myDiv').match(el);//returns true
	$('otherElement').match(el);//returns false
#T=inject 向指定元素的指定位置中插入本元素
	Injects,or inserts,the Element at a particular place relative to the Element's children (specified by the second the argument).
	语法:
	myElement.inject(el[,where]);

	参数:
	el - (mixed) el can be the id of an element or an element.
	where - (string,optional:defaults to 'bottom') The place to inject this Element. Can be 'top','bottom','after',or 'before'.

	返回:
	(element) This Element.

	示例:
	var myFirstElement =new Element('div',{id:'myFirstElement'});
	var mySecondElement=new Element('div',{id:'mySecondElement'});
	var myThirdElement =new Element('div',{id:'myThirdElement'});

	结果:
	<div id="myFirstElement"></div>
	<div id="mySecondElement"></div>
	<div id="myThirdElement"></div>

	插入到底部:
	myFirstElement.inject(mySecondElement);

	结果:
	<div id="mySecondElement">
		<div id="myFirstElement"></div>
	</div>

	插入到头部:
	myThirdElement.inject(mySecondElement,'top');

	结果:
	<div id="mySecondElement">
		<div id="myThirdElement"></div>
		<div id="myFirstElement"></div>
	</div>

	Inject before:
	myFirstElement.inject(mySecondElement,'before');

	结果:
	<div id="myFirstElement"></div>
	<div id="mySecondElement"></div>

	Inject After:
	myFirstElement.inject(mySecondElement,'after');

	结果:
	<div id="mySecondElement"></div>
	<div id="myFirstElement"></div>

	在select指定位置插入新的option:
	var Val=new Element("option",{value:_v,text:_t});
	Val.inject($('sel').options[$('sel').selectedIndex],'before');

	参见:
	Element:adopt,Element:grab,Element:wraps
#T=grab 向本元素内部的指定位置添加子元素
	Works as Element:inject,but in reverse.

	Appends the Element at a particular place relative to the Element's children (specified by the where parameter).
	语法:
	myElement.grab(el[,where]);

	参数:
	el - (mixed) el can be the id of an element or an Element.
	where - (string,optional:default 'bottom') The place to append this Element. Can be 'top','bottom','before' or 'after'.

	返回:
	(element) This Element.

	示例:
	<div id="first">
		<div id="child"></div>
	</div>

	Js:
	var mySecondElement=new Element('div#second');
	$('first').grab(mySecondElement);

	结果:
	<div id="first">
		<div id="child"></div>
		<div id="second"></div>
	</div>

	Js:
	var mySecondElement=new Element('div#second');
	myFirstElement.grab(mySecondElement,'top');

	结果:
	<div id="first">
		<div id="second"></div>
		<div id="child"></div>
	</div>

	参见:
	Element:adopt,Element:inject,Element:wraps
#T=adopt 向本元素内部添加子元素
	Works like Element:grab,but allows multiple elements to be adopted and only appended at the bottom.

	Inserts the passed element(s) inside the Element (which will then become the parent element).
	语法:
	myParent.adopt(el[,others]);

	参数:
	el - (mixed) The id of an element,an Element,or an array of elements.
	others - (mixed,optional) One or more additional Elements separated by a comma or as an array.

	返回:
	(element) This Element.

	示例:
	var myFirstElement =new Element('div#first');
	var mySecondElement=new Element('p#second');
	var myThirdElement =new Element('ul#third');
	var myFourthElement=new Element('a#fourth');
	var myParentElement=new Element('div#parent');
	myFirstElement.adopt(mySecondElement);
	mySecondElement.adopt('third',myFourthElement);
	myParent3.adopt([myFirstElement,new Element('span#another')]);

	结果:
	<div id="parent">
		<p id="second">
			<ul id="third"></ul>
			<a id="fourth"></a>
		</p>
		<span id="another"></span>
	</div>

	参见:
	Element:grab,Element:inject,Element:wraps
#T=wraps 将本元素包裹在指定的元素的外层(成为该元素的父元素)
	Works like Element:grab,but replaces the element in its place,and then appends the replaced element in the location specified inside the this element.
	语法:
	myParent.wraps(el[,where]);

	参数:
	el - (mixed) The id of an element or an Element.
	where - (string,optional:default 'bottom') The place to insert the passed in element. Can be 'top' or 'bottom'.

	返回:
	(element) This Element.

	示例:
	<div id="first"></div>

	Js:
	var mySecondElement=new Element('div#second').wraps('first');

	结果:
	<div id="second">
		<div id="first"></div>
	</div>

	HTML:
	<div id="first"></div>
	<div id="second">
		<div id="child"></div>
	</div>

	Js:
	$('second').wraps('first');

	结果:
	<div id="second">
		<div id="child"></div>
		<div id="first"></div>
	</div>

	Js:
	$('second').wraps('first','top');

	结果:
	<div id="second">
		<div id="first"></div>
		<div id="child"></div>
	</div>
#T=appendText 向元素中添加一个文本节点
	Works like Element:grab,but instead of accepting an id or an element,it only accepts text. A text node will be created inside this Element,in either the top or bottom position.
	语法:
	myElement.appendText(text[,where]);

	参数:
	text - (string) The text to append.
	where - (string,optional:default 'bottom') The position to inject the text to. Values accepted are 'top','bottom','before' and 'after'.

	返回:
	(element) The current Element instance.

	示例:
	<div id="myElement">Hey.</div>

	Js:
	$('myElement').appendText(' Howdy.');

	结果:
	<div id="myElement">Hey. Howdy.</div>
#T=dispose 将元素从DOM中删除
	Removes the Element from the DOM.
	语法:
	var removedElement=myElement.dispose();

	返回:
	(element) This Element. Useful to always grab the return from this function,as the element could be injected back.

	示例:
	<div id="myElement"></div>
	<div id="mySecondElement"></div>

	Js:
	$('myElement').dispose();

	结果:
	<div id="mySecondElement"></div>

	参见:
	MDC Element:removeChild
#T=destroy 删除元素自身及其所有子元素(并进行内存垃圾收集)
	Removes the Element and its children from the DOM and prepares them for garbage collection.
	语法:
	myElement.destroy();

	返回:
	(null)
#T=empty 删除所有子元素
	Empties an Element of all its children.
	语法:
	myElement.empty();

	返回:
	(element) This Element.

	示例:
	<div id="myElement">
		<p></p>
		<span></span>
	</div>

	Js:
	$('myElement').empty();

	结果:
	<div id="myElement"></div>
#T=clone 复制并返回元素的副本
	Clones the Element and returns the cloned one.
	语法:
	var copy=myElement.clone([contents,keepid]);

	参数:
	contents - (boolean,optional:defaults to true) When set to false the Element's contents are not cloned.
	keepid - (boolean,optional:defaults to false) When true the cloned Element keeps the id attribute,if present. Same goes for any of the cloned childNodes.

	返回:
	(element) The cloned Element.

	示例:
	<div id="myElement">ciao</div>

	Js:
	//clones the Element and appends the clone after the Element.
	var clone=$('myElement').clone().inject('myElement','after');

	结果:
	<div id="myElement">ciao</div>
	<div>ciao</div>

	注意:
	The returned Element does not have attached events. To clone the events use Element:cloneEvents.
	Values stored in Element.Storage are not cloned.
	The clone element and its children are stripped of ids,unless otherwise specified by the keepid parameter.

	参见:
	Element:cloneEvents.
#T=replaces 替换元素
	Replaces the passed Element with Element.
	语法:
	var element=myElement.replaces(el);

	参数:
	el - (mixed) A string id representing the Element to be replaced,or an Element reference.

	返回:
	(element) This Element.

	示例:
	$('myNewElement').replaces($('myOldElement'));
	//$('myOldElement') is gone,and $('myNewElement') is in its place.

	参见:
	MDC Element:replaceChild
#T=toQueryString 读取子元素中的数据输入元素(如input,select等)的值,并生成查询字符串
	Reads the child inputs of the Element and generates a query string based on their values.
	语法:
	var query=myElement.toQueryString();

	返回:
	(string) A string representation of a all the input Elements' names and values.

	示例:
	<form id="myForm" action="submit.php">
		<input name="email" value="bob@bob.com" />
		<input name="zipCode" value="90210" />
	</form>

	Js:
	$('myForm').toQueryString();//returns "email=bob@bob.com&zipCode=90210".
#T=getSelected 返回下拉列表框元素中的选中项
	Returns the selected options of a select element.
	语法:
	var selected=mySelect.getSelected();

	返回:
	(array) An array of the selected elements.

	示例:
	<select id="country-select" name="country">
		<option value="US">United States</option
		<option value ="IT">Italy</option>
	</select>

	Js:
	$('country-select').getSelected();//returns whatever the user selected.

	注意:
	This method returns an array,regardless of the multiple attribute of the select element. If the select is single,it will return an array with only one item.
#T=getProperty 获取元素的一个属性值
	Returns a single element attribute.
	语法:
	var myProp=myElement.getProperty(property);

	参数:
	property - (string) The property to be retrieved.

	返回:
	(string) A string containing the Element's requested property.

	示例:
	<img id="myImage" src="mootools.png" title="MooTools,the compact JavaScript framework" alt="" />

	Js:
	var imgProps=$('myImage').getProperty('src');//returns:'mootools.png'.
#T=getProperties 获取元素的多个属性值
	Gets multiple element attributes.
	语法:
	var myProps=myElement.getProperties(properties);

	参数:
	properties - (strings) Any number of properties to be retrieved.

	返回:
	(object) An object containing all of the Element's requested properties.

	示例:
	<img id="myImage" src="mootools.png" title="MooTools,the compact JavaScript framework" alt="" />

	Js:
	var imgProps=$('myImage').getProperties('id','src','title','alt');
	//returns:{id:'myImage',src:'mootools.png',title:'MooTools,the compact JavaScript framework',alt:''}
#T=setProperty 设置元素的一个属性
	Sets an attribute or special property for this Element.
	参数:
	property - (string) The property to assign the value passed in.
	value - (mixed) The value to assign to the property passed in.

	返回:
	(element) - This Element.

	示例:
	<img id="myImage" />

	Js:
	$('myImage').setProperty('src','mootools.png');

	结果:
	<img id="myImage" src="mootools.png" />

	注意:
	Whenever using Element:setProperty to set an attribute,pass in the lowercase,simplified form of the property. For example:
	use 'for',not 'htmlFor',
	use 'class',not 'className'
	use 'frameborder',not 'frameBorder'
	etc.
#T=setProperties 设置元素的多个属性
	Sets numerous attributes for the Element.
	参数:
	properties - (object) An object with key/value pairs.

	返回:
	(element) This Element.

	示例:
	<img id="myImage" />

	Js:
	$('myImage').setProperties({
		src:'whatever.gif',
		alt:'whatever dude'
	});

	结果:
	<img id="myImage" src="whatever.gif" alt="whatever dude" />
#T=removeProperty 删除元素的一个属性
	Removes an attribute from the Element.
	语法:
	myElement.removeProperty(property);

	参数:
	property - (string) The attribute to remove.

	返回:
	(element) This Element.

	示例:
	<a id="myAnchor" href="#" onmousedown="alert('click');"></a>

	Js:
	//Eww... inline JavaScript is bad! Let's get rid of it.
	$('myAnchor').removeProperty('onmousedown');

	结果:
	<a id="myAnchor" href="#"></a>
#T=removeProperties 删除元素的多个属性
	Removes numerous attributes from the Element.
	语法:
	myElement.removeProperties(properties);

	参数:
	properties - (strings) The attributes to remove,separated by comma.

	返回:
	(element) This Element.

	示例:
	<a id="myAnchor" href="#" title="hello world"></a>

	Js:
	$('myAnchor').removeProperties('id','href','title');

	结果:
	<a></a>
#T=store 向元素的存储区中存放一个项
	Stores an item in the Elements Storage,linked to this Element.
	语法:
	myElement.store(key,value);

	参数:
	key - (string) The key you want to assign to the stored value.
	value - (mixed) Any value you want to store.

	返回:
	(element) This Element.

	示例:
	$('element').store('someProperty',someValue);
#T=retrieve 从元素的存储区中获取一个值
	Retrieves a value from the Elements storage.
	语法:
	myElement.retrieve(key[,default]);

	参数:
	key - (string) The key you want to retrieve from the storage.
	default - (mixed,optional) Default value to store and return if no value is stored.

	返回:
	(mixed) The value linked to the key.

	示例:
	$('element').retrieve('someProperty');//returns someValue (see example above)
#T=eliminate 从元素的存储区移除一个key
	Eliminates a key from the Elements storage.
	语法:
	myElement.eliminate(key);

	参数:
	key - (string) The key you want to eliminate from the storage.

	返回:
	(mixed) The element/window/document.

	示例:
	$('element').eliminate('someProperty');
#T=checked 复选框是否被选中了
	if(i.checked){
		alert('yes')
	}
#T= 


#T= Function
 Function
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T= ┉ Type ┉
 ┉ Type ┉
#T=typeOf 返回对象类型
	Returns the type of an object.
	语法:
	typeOf(obj);

	参数:
	obj - (object) The object to inspect.

	返回:
	'element' - (string) If object is a DOM element node.
	'elements' - (string) If object is an instance of Elements.
	'textnode' - (string) If object is a DOM text node.
	'whitespace' - (string) If object is a DOM whitespace node.
	'arguments' - (string) If object is an arguments object.
	'array' - (string) If object is an array.
	'object' - (string) If object is an object.
	'string' - (string) If object is a string.
	'number' - (string) If object is a number.
	'date' - (string) If object is a date.
	'boolean' - (string) If object is a boolean.
	'function' - (string) If object is a function.
	'regexp' - (string) If object is a regular expression.
	'class' - (string) If object is a Class (created with new Class or the extend of another class).
	'collection' - (string) If object is a native HTML elements collection,such as childNodes or getElementsByTagName.
	'window' - (string) If object is the window object.
	'document' - (string) If object is the document object.
	'domevent' - (string) If object is an event.
	'null' - (string) If object is undefined,null,NaN or none of the above.

	示例:
	var myString='hello';
	typeOf(myString);//returns "string"
#T=instanceOf //待检查的对象是否为特定类型的实例
	Checks if an object is an instance of a particular type.
	语法:
	instanceOf(item,object)

	参数:
	item - (mixed) The item to check.
	object - (mixed) The type to compare it with.

	返回:
	(boolean) Whether or not the item is an instance of the object.

	示例:
	var foo=[];
	instanceOf(foo,Array) //returns true
	instanceOf(foo,String) //returns false
	var myClass=new Class();
	var bar=new myClass();
	instanceOf(bar,myClass) //returns true

	类型:
	MooTools extends native types,like string,array or number to make them even more useful.

	The types MooTools uses are:
		String
		Array
		Number
		Function
		RegExp
		Date
		Boolean

	Custom MooTools types are:
		Element
		Elements
		Event
#T=Generics *泛型
	Most methods of types can be used as generic functions. These are the already existing JavaScript methods,methods MooTools adds,or methods you implemented yourself.
	示例:
	var everyArgBiggerThanTwo=function(){
		//Instead of this
		return Array.prototype.every.call(arguments,someFunction);
		//you can use
		return Array.every(arguments,someFunction);
	};

	This is useful if methods of a certain type should be used as function of another type. As the example above,it is used for the Arguments type,which is not a real array,so arguments.every(fn) would not work. However,Array.every(arguments,fn) does work in MooTools.
	语法:
	Type.methodName(thisArg[,arg1,arg2,...]);

	参数:
	thisArg - (mixed) This is the subject,which is usually thisArg.method([arg1,arg2,...]);.
	arg1,arg2,... - (mixed) Additional arguments which will be passed as method arguments.

	返回:
	(mixed) Anything the method usually returns.
#T= ┉ Function ┉
 ┉ Function ┉
#T=Function.from 如果参数是Fun则返回自身,否则返回这个函数传递的参数
	If the passed argument is a function,it will return itself. Otherwise,it will return a function that returns the passed argument.
	语法:
	var foo=Function.from(obj);

	参数:
	obj - (mixed) If this argument is a function,it will simply return itself. Otherwise,an object you wish to convert into a function that returns the argument.

	返回:
	(function) Either the passed function or an anonymous function that returns the passed argument.

	示例:
	var fn=Function.from(42);
	alert(fn());//alerts '42'
	var fn2=Function.from(fn);
	alert(fn2());//alerts '42'

	注意:
	This function is equivalent to the following deprecated MooTools 1.2 methods:
	var fn1=Function.from();//equivalent to var fn1=function(){};
	var fn2=Function.from(foo);//equivalent to var fn2=function(){return foo};
#T=Function.attempt 尝试执行,类似try
	Tries to execute a number of functions. Returns immediately the return value of the first non-failed function without executing successive functions,or null.
	语法:
	Function.attempt(fn[,fn,fn,fn,...]);

	参数:
	fn - (function) Any number of functions to execute.

	返回:
	(mixed) Standard return of the called function.
	(null) null if all the passed functions fail.

	示例:
	var result=Function.attempt(function(){
		return some.made.up.object;
	},function(){
		return jibberish.that.doesnt.exists;
	},function(){
		return false;
	});

	//result is false
	var failure,success;
	Function.attempt(function(){
		some.made.up.object='something';
		success=true;
	},function(){
		failure=true;
	});
	if(success) alert('yey!');

	注意:
	This method is an equivalent of $try from MooTools 1.2.
#T= ┉ Method ┉
 ┉ Method ┉
#T=extend 为Fun扩展新的方法或属性
	Extends a function with a new method or property.
	语法:
	myFunction.extend(key,value);
	//Or
	myFunction.extend(object);

	参数:
	key - (string) The key of the method or property
	value - (mixed) The function or property value
	//OR
	object - (object) An object with the key value pairs to add multiple methods or properties

	返回:
	(function) The function

	示例:
	var myFunction=function(){};
	myFunction.extend('alert',function(text){
		alert(text);
	});
	myFunction.alert('Hello!');//alerts Hello!
	//Using objects
	myFunction.extend({
		alert:function(text){
			alert(text);
		}
	});
#T=implement 将传入的属性创建成Fun的方法
	Implements a method to the prototype of the function.
	语法:
	myFunction.implement(key,value);
	//OR
	myFunction.implement(object);

	参数:
	key - (string) The method of property name in the prototype
	value - (mixed) The function or another value in the prototype
	//OR
	object - (object) An object with key-value pairs to add multiple methods or properties to the function it's prototype.

	返回:
	(function) The function

	示例:
	var myFunction=function(){};
	myFunction.implement('alert',function(text){
		alert(text);
	});
	var myInstance=new myFunction();
	myInstance.alert('Hello!');//alerts Hello!
	//Using objects
	myInstance.implement({
		alert:function(text){
			alert(text);
		}
	});

	注意:
	The difference between implement and extend,is that implement adds the value to the prototype. So with implement each instance of the function will have this method or property while with extend the method or property is added to a single instance.
#T=attempt 尝试执行,类似try
	Tries to execute a single function. Returns immediately the return value of the function if it does not fail,or null.
	语法:
	var myFunctionResult=myFunction.attempt(args[,bind]);

	参数:
	args - (mixed) An argument,or array of arguments to run the function with.
	bind - (object,optional) The object that the "this" of the function will refer to.

	返回:
	(mixed) This Function's return value.
	(null) null if the function fails.

	示例:
	var myFunction=function(){
		return some.made.up.object;
	};
	myFunction.attempt();//returns 'null'
	var myFunction=function(val){
		return val;
	};
	myFunction.attempt(false);//returns 'false'

	参见:
	See Function.attempt for using more than one functions.
#T=pass 返回指定了携带参数和绑定this对象的闭包函数
	Returns a closure with arguments and bind.
	语法:
	var newFunction=myFunction.pass([args[,bind]]);

	参数:
	args - (mixed,optional) The arguments to pass to the function (must be an array if passing more than one argument).
	bind - (object,optional) The object that the "this" of the function will refer to.

	返回:
	(function) The function whose arguments are passed when called.

	示例:
	var myFunction=function(){
		var result='Passed:';
		for (var i=0,l=arguments.length;i < l;i++){
			result += (arguments[i]+' ');
		}
		return result;
	}
	var myHello=myFunction.pass('hello');
	var myItems=myFunction.pass(['peach','apple','orange']);

	//执行生成的闭包函数:
	alert(myHello());//passes 'hello' to myFunction.
	alert(myItems());//passes the array of items to myFunction.
#T=bind 重新绑定函数中this所引用的对象
	Changes the scope of this within the target function to refer to the bind parameter.
	语法:
	myFunction.bind([bind[,arg1,arg2,...]]);

	参数:
	bind - (object,optional) The object that the "this" of the function will refer to.
	arg1,arg2,... - (mixed,optional) The arguments to pass to the function. If the bound function is called with other arguments the arguments are concatenated.

	返回:
	(function) The bound function.

	示例:
	function Fun(){
		this.setStyle('color', 'red');
	};
	var bFun = Fun.bind($('id'));把$('id')绑定给Fun的this
	bFun();
	或
	function myFunction(){
		//Note that 'this' here refers to window,not an element.
		//the function must be bound to the element we want to manipulate.
		this.setStyle('color','red');
	};
	var myBoundFunction=myFunction.bind(myElement);
	myBoundFunction();//makes myElement's text red
	//To show how bind works the following example:
	var myBoundFunction=myFunction.bind(anyVar);
	//is roughly equivalent with
	var myBoundFunction=function(){
		return myFunction.call(this);
	};

	参见:
	Function:pass
#T=delay 延迟执行函数
	Delays the execution of a function by a specified duration.
	语法:
	var timeoutID=myFunction.delay(delay[,bind[,args]]);

	参数:
	delay - (number) The duration to wait (in milliseconds).
	bind - (object,optional) The object that the "this" of the function will refer to.
	args - (mixed,optional) The arguments passed (must be an array if the arguments are greater than one).

	返回:
	(number) The JavaScript timeout id (for clearing delays).

	示例:
	var Fun=function(msg){
		alert(typeOf(this))//查看被绑定对象的类型
		alert(this.get('tag')+'|'+msg);//显示对象名称和传递的参数
	};
	//2秒后执行Fun,同时把id='tab1'这个对象传递给Fun这个函数让其this为$('tab1'),然后传递一个参数
	Fun.delay(2000,$('tab1'),'啊');
	或
	var myFunction=function(){alert('moo! Element id is:'+this.id)};
	//wait 50 milliseconds,then call myFunction and bind myElement to it
	myFunction.delay(50,myElement);//alerts:'moo! Element id is:... '
	//an anonymous function which waits a second and then alerts
	(function(){alert('one second later...')}).delay(1000);
	//to stop the delay,clearTimeout can be used like so:
	var timer=myFunction.delay(50);
	clearTimeout(timer);
#T=periodical 以指定的间隔反复执行函数,可用clearInterval终止
	Executes a function in the specified intervals of time. Periodic execution can be stopped using the clearInterval function.
	语法:
	var intervalID=myFunction.periodical(period[,bind[,args]]);

	参数:
	period - (number) The duration of the intervals between executions.
	bind - (object,optional) The object that the "this" of the function will refer to.
	args - (mixed,optional) The arguments passed (must be an array if the arguments are greater than one).

	返回:
	(number) The Interval id (for clearing a periodical).

	示例:
	var Site ={counter:0};
	var addCount=function(){this.counter++};
	addCount.periodical(1000,Site);//adds the number of seconds at the Site.
	//the interval can be stopped using the clearInterval function
	var timer=myFunction.periodical(1000);
	clearInterval(timer);
#T=scrollTo(x,y)
	Scrolls the element to the specified coordinated (if the element has an overflow). The following method is also available on the Window object.
	语法:
	myElement.scrollTo(x,y);

	参数:
	x - (number) The x coordinate.
	y - (number) The y coordinate.

	示例:
	$('myElement').scrollTo(0,100);

	参见:
	MDC Element:scrollLeft,MDC Element:scrollTop
#T=getScrollSize()
	Returns an Object representing the size of the target Element,including scrollable area. The following method is also available on the Window object.
	语法:
	myElement.getScrollSize();

	返回:
	(object) An object containing the x and y dimensions of the target Element.

	示例:
	var scroll=$('myElement').getScrollSize();
	alert('My element can scroll to '+scroll.y+'px');//alerts 'My element can scroll down to 820px'

	参见:
	MDC Element:scrollLeft,MDC Element:scrollTop,MDC Element:offsetWidth,MDC Element:offsetHeight,MDC Element:scrollWidth,MDC Element:scrollHeight

	注意:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getScroll()
	Returns an Object representing how far the target Element is scrolled in either direction. The following method is also available on the Window object.
	语法:
	myElement.getScroll();

	返回:
	(object) An object containing the x and y dimensions of the target Element's scroll.

	示例:
	var scroll=$('myElement').getScroll();
	alert('My element is scrolled down '+scroll.y+'px');//alerts 'My element is scrolled down to 620px'

	注意:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T= 


#T= String
 String
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T= ┉ Function ┉
 ┉ Function ┉
#T=from 把传入的参数转为字符串
	Returns the passed parameter as a String.
	语法:
	String.from(arg);

	参数:
	arg - (mixed) The argument to return as a string.

	返回:
	(string) The argument as a string.

	示例:
	String.from(2);//returns '2'
	String.from(true);//returns 'true'
#T=uniqueID 产生一个独一无二的ID
	Generates a unique ID
	语法:
	String.uniqueID();

	返回:
	(string) A unique ID.

	示例:
	String.uniqueID();
#T= ┉ Method ┉
 ┉ Method ┉
#T=trim 清除字符串两端的空白字符串
	Trims the leading and trailing spaces off a string.
	语法:
	myString.trim();

	返回:
	(string) The trimmed string.

	示例:
	'    i like cookies     '.trim();//returns 'i like cookies'
#T=clean 清除整个字符串中多余的空白字符串
	Removes all extraneous whitespace from a string and trims it (String:trim).
	语法:
	myString.clean();

	返回:
	(string) The cleaned string.

	示例:
	' i      like     cookies      \n\n'.clean();//returns 'i like cookies'
#T=toInt 将字符串转为数字,并以给出的基准进制进行转换
	Parses this string and returns a number of the specified radix or base.
	语法:
	myString.toInt([base]);

	参数:
	base - (number,optional) The base to use (默认是10进制).

	返回:
	(number) The number.
	(NaN) If the string is not numeric,returns NaN.

	示例:
	'4em'.toInt();//returns 4
	'10px'.toInt();//returns 10
#T=toFloat 将字符串转为浮点数
	Parses this string and returns a floating point number.
	语法:
	myString.toFloat();

	返回:
	(number) The float.
	(NaN) If the string is not numeric,returns NaN.

	示例:
	'95.25%'.toFloat();//returns 95.25
	'10.848'.toFloat();//returns 10.848
#T=toLowerCase
^!.toLowerCase();
#T=toUpperCase
^!.toUpperCase();
#T=test 使用正则表达式对字符串进行匹配测试
	Searches for a match between the string and a regular expression. For more information see MDC Regexp:test.
	语法:
	myString.test(regex[,params]);

	参数:
	regex - (mixed) The string or regular expression you want to match the string with.
	params - (string,optional) If first parameter is a string,any parameters you want to pass to the regular expression ('g' has no effect).

	返回:
	(boolean) true,if a match for the regular expression is found in this string.
	(boolean) false if is not found

	示例:
	'I like cookies'.test('cookie');//returns true
	'I like cookies'.test('COOKIE','i');//returns true (ignore case)
	'I like cookies'.test('cake');//returns false
#T=contains 检测字符串内是否包含参数所给出的字符串
	Checks to see if the string passed in is contained in this string. If the separator parameter is passed,will check to see if the string is contained in the list of values separated by that parameter.
	语法:
	myString.contains(string[,separator]);

	参数:
	string - (string) The string to search for.
	separator - (string,optional) The string that separates the values in this string (e.g. Element classNames are separated by a ' ').

	返回:
	(boolean) true if the string is contained in this string
	(boolean) false if not.

	示例:
	'a bc'.contains('bc');//returns true
	'a b c'.contains('c',' ');//returns true
	'a bc'.contains('b',' ');//returns false
#T=camelCase 将以连字符分隔的字符串转换成以大小写形式进行分隔的字符串
	Converts a hyphenated string to a camelcased string.
	语法:
	myString.camelCase();

	返回:
	(string) The camelcased string.

	示例:
	'I-like-cookies'.camelCase();//returns 'ILikeCookies'
#T=hyphenate 将以大小写形式进行分隔的字符串转换成以字符分隔的字符串
	Converts a camelcased string to a hyphenated string.
	语法:
	myString.hyphenate();

	返回:
	(string) The hyphenated string.

	示例:
	'ILikeCookies'.hyphenate();//returns '-i-like-cookies'
#T=capitalize 将字符串中每个单词的首字母大写
	Converts the first letter of each word in a string to uppercase.
	语法:
	myString.capitalize();

	返回:
	(string) The capitalized string.

	示例:
	'i like cookies'.capitalize();//returns 'I Like Cookies'
#T=escapeRegExp 将字符串中对正则表达式敏感的字符进行转义
	Escapes all regular expression characters from the string.
	语法:
	myString.escapeRegExp();

	返回:
	(string) The escaped string.

	示例:
	'animals.sheep[1]'.escapeRegExp();//returns 'animals\.sheep\[1\]'
#T=hexToRgb 将16进制颜色代码的字符串转换成RGB
	Converts a hexadecimal color value to RGB. Input string must be in one of the following hexadecimal color formats (with or without the hash). '#ffffff',#fff','ffffff',or 'fff'
	语法:
	myString.hexToRgb([array]);

	参数:
	array - (boolean,optional) If true is passed,will output an array (e.g. [255,51,0]) instead of a string (e.g. 'rgb(255,51,0)').

	返回:
	(string) A string representing the color in RGB.
	(array) If the array flag is set,an array will be returned instead.

	示例:
	'#123'.hexToRgb();//returns 'rgb(17,34,51)'
	'112233'.hexToRgb();//returns 'rgb(17,34,51)'
	'#112233'.hexToRgb(true);//returns [17,34,51]
#T=rgbToHex 将RGB字符串转换成16进制颜色代码
	Converts an RGB color value to hexadecimal. Input string must be in one of the following RGB color formats. 'rgb(255,255,255)',or 'rgba(255,255,255,1)'
	语法:
	myString.rgbToHex([array]);

	参数:
	array - (boolean,optional) If true is passed,will output an array (e.g. ['ff','33','00']) instead of a string (e.g. '#ff3300').

	返回:
	(string) A string representing the color in hexadecimal,or transparent if the fourth value of rgba in the input string is 0.
	(array) If the array flag is set,an array will be returned instead.

	示例:
	'rgb(17,34,51)'.rgbToHex();//returns '#112233'
	'rgb(17,34,51)'.rgbToHex(true);//returns ['11','22','33']
	'rgba(17,34,51,0)'.rgbToHex();//returns 'transparent'
#T=substitute 类似模板中的标签替换
	Substitutes keywords in a string using an object/array. Removes undefined keywords and ignores escaped keywords.
	语法:
	myString.substitute(object[,regexp]);

	参数:
	object - (mixed) The key/value pairs used to substitute a string.
	regexp - (regexp,optional) The regexp pattern to be used in the string keywords,with global flag. Defaults to /\?{([^}]+)}/g .

	返回:
	(string) - The substituted string.

	示例:
	var myString='{subject} is{property_1} and{property_2}.';
	var myObject ={subject:'Jack Bauer',property_1:'our lord',property_2:'saviour'};
	myString.substitute(myObject);//returns Jack Bauer is our lord and saviour
#T=stripScripts 剥离或执行字符串中的JS
	Strips the String of its tags and anything in between them.
	语法:
	myString.stripScripts([evaluate]);

	参数:
	evaluate - (boolean,optional) If true is passed,the scripts within the String will be evaluated.

	返回:
	(string) - The String without the stripped scripts.

	示例:
	var myString="<script>alert('Hello')</script>Hello,World.";
	myString.stripScripts();//returns 'Hello,World.'
	myString.stripScripts(true);//alerts 'Hello',then returns 'Hello,World.'
#T= 


#T= Number
 Number
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T= ┉ Function ┉
 ┉ Function ┉
#T=from 把传入的参数转为Number
	Returns the passed parameter as a Number,or null if not a number.
	语法:
	Number.from(arg);

	参数:
	arg - (mixed) The argument to return as a number.

	返回:
	(number) The argument as a number.
	(null) Returns null if the number cannot be converted.

	示例:
	Number.from('12')       //returns 12
	Number.from('hello')    //returns null
#T=random 返回一个随机数
	Returns a random integer between the two passed in values.
	语法:
	var random=Number.random(min,max);

	参数:
	min - (number) The minimum value (inclusive).
	max - (number) The maximum value (inclusive).

	返回:
	(number) A random number between min and max.

	示例:
	Number.random(5,20);//returns a random number between 5 and 20.
#T= ┉ Method ┉
 ┉ Method ┉
#T=round 四舍五入
	Returns this number rounded to the specified precision.
	语法:
	myNumber.round([precision]);

	参数:
	precision - (number,optional:defaults to 0) The number of digits after the decimal place.

	返回:
	(number) The number,rounded.

	注意:
	Argument may also be negative.

	示例:
	(12.45).round()   //returns 12
	(12.45).round(1)  //returns 12.5
	(12.45).round(-1) //returns 10
#T=toInt 将数字转为数字,并以给出的基准进制进行转换
	Returns this number as another number with the passed in base. Useful because toInt must work on both Strings and Numbers.
	语法:
	myNumber.toInt([base]);

	参数:
	base - (number,optional:默认是10进制) The base to use.

	返回:
	(number) A number with the base provided.

	示例:
	(111).toInt();//returns 111
	(111.1).toInt();//returns 111
	(111).toInt(2);//returns 7
#T=toFloat 将数字转为浮点数
	Returns this number as a float. Useful because toFloat must work on both Strings and Numbers.
	语法:
	myNumber.toFloat();

	返回:
	(number) The number as a float.

	示例:
	(111).toFloat();//returns 111
	(111.1).toFloat();//returns 111.1
#T=limit 将取值范围在限制在指定区间(在区间内,取原值;超出区间,则取邻近的区间边界值)
	Limits this number between two bounds.
	语法:
	myNumber.limit(min,max);

	参数:
	min - (number) The minimum possible value.
	max - (number) The maximum possible value.

	返回:
	(number) The number bounded between the given limits.

	示例:
	(12).limit(2,6.5);//returns 6.5
	(-4).limit(2,6.5);//returns 2
	(4.3).limit(2,6.5);//returns 4.3
#T=times 以Number值进行迭代
	Executes the function passed in the specified number of times.
	语法:
	myNumber.times(fn[,bind]);

	参数:
	fn - (function) The function which should be executed on each iteration of the loop. This function is passed the current iteration's index.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	示例:
	(4).times(alert);//alerts "0",then "1",then "2",then "3".
#T=常用数学方法
	abs
	acos
	asin
	atan2
	ceil
	cos
	exp
	floor
	log
	max
	min
	pow
	sin
	sqrt
	tan

	示例:
	(-1).abs();//returns 1
	(3).pow(4);//returns 81
#T= 


#T= Array
 Array
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=var arr=[1,2,3,4];
var arr=[1,2,3,4];
var arr=new Array(1,2,3,4);
#T= ┉ Function ┉
 ┉ Function ┉
#T=Array.each 循环遍历数组
	Used to iterate through arrays,or iterables that are not regular arrays,such as built in getElementsByTagName calls or arguments of a function.
	语法:
	Array.each(iterable,fn[,bind]);

	参数:
	iterable - (array) The array to iterate through.
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' within the function. For more information see Function:bind.

	Argument:fn
	语法:
	fn(item,index,object)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array. In the case of an object,it is passed the key of that item rather than the index.
	object - (mixed) The actual array/object.

	示例:
	//輸出:"0=apple","1=banana","2=lemon"
	['apple','banana','lemon'].each(function(v,k){
		alert(k+"="+v);
	});//The optional second argument for binding isn't used here.
	或
	var arr=['Sun','Mon','Tue'];
	Array.each(arr,function(v,k){
		alert('name:'+v+',index:'+k);
	});
	或
	Array.each(['Sun','Mon','Tue'],function(v,k){
		alert('name:'+v+',index:'+k);
	});//alerts 'name:Sun,index:0','name:Mon,index:1',etc.

	注意:
	This is an array-specific equivalent of $each from MooTools 1.2
#T=Array.clone 克隆数组
	Returns a copy of the passed array.
	语法:
	var clone=Array.clone(myArray);

	参数:
	myArray - (array) The array you wish to copy.

	返回:
	(array) a copy of the passed array.

	示例:
	var myArray=['red','blue','green'];
	var otherArray=Array.clone(myArray);
	var myArray[0]='yellow';
	alert(myArray[0]);//alerts 'yellow'
	alert(otherArray[0])    //alerts 'red'

	注意:
	This is an array-specific equivalent of $unlink from MooTools 1.2.
#T=Array.from 把传入的参数转换成一个数组
	Converts the argument passed in to an array if it is defined and not already an array.
	语法:
	var splatted=Array.from(obj);

	参数:
	obj - (mixed) Any type of variable.

	返回:
	(array) If the variable passed in is an array,returns the array. Otherwise,returns an array with the only element being the variable passed in.

	示例:
	Array.from('hello');//returns ['hello'].
	Array.from(['a','b','c']);//returns ['a','b','c'].

	注意:
	This is equivalent to $splat from MooTools 1.2,with the exception of Array-like Objects such as NodeList or FileList which Array.from does transform in Arrays and $splat not.
#T= ┉ Method ┉
 ┉ Method ┉
#T=Array.each 调用函数遍历数组
	Calls a function for each element in the array.
	语法:
	myArray.each(fn[,bind]);

	参数:
	fn - (function) The function which should be executed on each item in the array. This function is passed the item and its index in the array.
	bind - (object,optional) The object to be used as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(item,index,array)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	示例:
	//Alerts "0=apple","1=banana",and so on:
	['apple','banana','lemon'].each(function(v,k){
		alert(k"="+v);
	});//The optional second argument for binding isn't used here.

	注意:
	This method is only available for browsers without native MDC Array:forEach support.
#T=Array.invoke 为数组中的每个元素调用外部方法
	Returns an array with the named method applied to the array's contents.
	语法:
	var arr=myArray.invoke(method[,arg,arg,arg ...])

	参数:
	method - (string) The method to apply to each item in the array.
	arg - (mixed) Any number of arguments to pass to the named method.

	返回:
	(array) A new array containing the results of the applied method.

	示例:
	var foo=[4,8,15,16,23,42];
	var bar=foo.invoke('limit',10,30);//bar is now [10,10,15,16,23,30]

	注意:
	The method that is invoked is a method of each of the items. If the method does not exist,then an error will be thrown. For example:
	[0,false,'string'].invoke('limit',0,10);//throws an error!
#T=Array.every 如果数组中的每一项都通过了给定函数的测试,则返回true
	Returns true if every element in the array satisfies the provided testing function. This method is provided only for browsers without native Array:every support.
	语法:
	var allPassed=myArray.every(fn[,bind]);

	参数:
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn
	语法:
	fn(item,index,array)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	返回:
	(boolean) If every element in the array satisfies the provided testing function,returns true. Otherwise,returns false.

	示例:
	var areAllBigEnough=[10,4,25,100].every(function(item,index){
		return item > 20;
	});//areAllBigEnough=false
#T=Array.filter 将所有在给定过滤函数中过滤通过的数组项创建一个新数组
	Creates a new array with all of the elements of the array for which the provided filtering function returns true. This method is provided only for browsers without native Array:filter support.
	语法:
	var filteredArray=myArray.filter(fn[,bind]);

	参数:
	fn - (function) The function to test each element of the array. This function is passed the item and its index in the array.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn
	语法:
	fn(item,index,array)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	返回:
	(array) The new filtered array.

	示例:
	var biggerThanTwenty=[10,3,25,100].filter(function(item,index){
		return item > 20;
	});//biggerThanTwenty=[25,100]
#T=Array.clean 在现有数组的基础上建立一个新数组,每一个成员必须是已经定义过的,IE浏览器则必须是非null和非undefined的
	Creates a new array with all of the elements of the array which are defined (i.e. not null or undefined).
	语法:
	var cleanedArray=myArray.clean();

	返回:
	(array) The new filtered array.

	示例:
	var myArray=[null,1,0,true,false,'foo',undefined,''];
	myArray.clean() //returns [1,0,true,false,'foo','']
#T=Array.indexOf 返回数组中和给出参数值相等的项的索引号;如果未找到相等的项,则返回-1
	Returns the index of the first element within the array equal to the specified value,or -1 if the value is not found. This method is provided only for browsers without native Array:indexOf support.
	语法:
	var index=myArray.indexOf(item[,from]);

	返回:
	(number) The index of the first element within the array equal to the specified value. If not found,returns -1.

	参数:
	item - (object) The item to search for in the array.
	from - (number,optional:defaults to 0) The index of the array at which to begin the search.

	示例:
	['apple','lemon','banana'].indexOf('lemon');//returns 1
	['apple','lemon'].indexOf('banana');//returns -1
#T=Array.map 调用外部函数循环处理现有数组内的每个项目,并产生新数组
	Creates a new array with the results of calling a provided function on every element in the array. This method is provided only for browsers without native Array:map support.
	语法:
	var mappedArray=myArray.map(fn[,bind]);

	参数:
	fn - (function) The function to produce an element of the new Array from an element of the current one.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(item,index,array)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	返回:
	(array) The new mapped array.

	示例:
	var timesTwo=[1,2,3].map(function(item,index){
		return item * 2;
	});//timesTwo=[2,4,6];
#T=Array.some 如果数组中至少有一个项通过了给出的函数的测试,则返回true
	Returns true if at least one element in the array satisfies the provided testing function. This method is provided only for browsers without native Array:some support.
	语法:
	var somePassed=myArray.some(fn[,bind]);

	返回:
	(boolean) If at least one element in the array satisfies the provided testing function returns true. Otherwise,returns false.

	参数:
	fn - (function) The function to test for each element. This function is passed the item and its index in the array.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(item,index,array)

	参数:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	示例:
	var isAnyBigEnough=[10,4,25,100].some(function(item,index){
		return item > 20;
	});//isAnyBigEnough=true
#T=Array.associate 创建一个键值对对象,该对象中的键由作为参数传入的一个数组决定,值由主调数组决定
	Creates an object with key-value pairs based on the array of keywords passed in and the current content of the array.
	语法:
	var associated=myArray.associate(obj);

	参数:
	obj - (array) Its items will be used as the keys of the object that will be created.

	返回:
	(object) The new associated object.

	示例:
	var animals=['Cow','Pig','Dog','Cat'];
	var sounds=['Moo','Oink','Woof','Miao'];
	sounds.associate(animals);
	//returns{'Cow':'Moo','Pig':'Oink','Dog':'Woof','Cat':'Miao'}
#T=Array.link 根据给出的'键/测试函数'对来创建一个新的键值对对象
	Accepts an object of key / function pairs to assign values.
	语法:
	var result=myArray.link(object);

	参数:
	object - (object) An object containing key / function pairs must be passed to be used as a template for associating values with the different keys.

	返回:
	(object) The new associated object.

	示例:
	var el=document.createElement('div');
	var arr2=[100,'Hello',{foo:'bar'},el,false];
	arr2.link({
		myNumber:Type.isNumber,
		myElement:Type.isElement,
		myObject:Type.isObject,
		myString:Type.isString,
		myBoolean:function(obj){return obj != null}
	});
	//returns{myNumber:100,myElement:el,myObject:{foo:'bar'},myString:'Hello',myBoolean:false}
#T=Array.contains 测试指定项是否在数组中存在
	Tests an array for the presence of an item.
	语法:
	var inArray=myArray.contains(item[,from]);

	参数:
	item - (object) The item to search for in the array.
	from - (number,optional:defaults to 0) The index of the array at which to begin the search.

	返回:
	(boolean) If the array contains the item specified,returns true. Otherwise,returns false.

	示例:
	['a','b','c'].contains('a');//returns true
	['a','b','c'].contains('d');//returns false
#T=Array.append 合并数组,新数组追加到末尾
	Appends the passed array to the end of the current array.
	语法:
	var myArray=myArray.append(otherArray);

	参数:
	otherArray - (array) The array containing values you wish to append.

	返回:
	(array) The original array including the new values.

	示例:
	var myOtherArray=['green','yellow'];
	['red','blue'].append(myOtherArray);//returns ['red','blue','green','yellow'];
	myOtheArray;//is now ['red','blue','green','yellow'];
	[0,1,2].append([3,[4]]);//[0,1,2,3,[4]]

	注意:
	This is an array-specific equivalent of $extend from MooTools 1.2
#T=Array.include 合并数组
	Pushes the passed element into the array if it's not already present (case and type sensitive).
	语法:
	myArray.include(item);

	参数:
	item - (object) The item that should be added to this array.

	返回:
	(array) This array with the new item included.

	示例:
	['Cow','Pig','Dog'].include('Cat');//returns ['Cow','Pig','Dog','Cat']
	['Cow','Pig','Dog'].include('Dog');//returns ['Cow','Pig','Dog']

	注意:
	If you want to push the passed element even if it's already present,use the vanilla javascript:
	myArray.push(item);
#T=Array.combine 合并数组(重复的项将不会加入)
	Combines an array with all the items of another. Does not allow duplicates and is case and type sensitive.
	语法:
	myArray.combine(array);

	参数:
	array - (array) The array whose items should be combined into this array.

	返回:
	(array) This array combined with the new items.

	示例:
	var animals=['Cow','Pig','Dog'];
	animals.combine(['Cat','Dog']);//animals=['Cow','Pig','Dog','Cat'];
#T=Array.getLast 从数组返回最后一个键值
	Returns the last item from the array.
	语法:
	myArray.getLast();

	返回:
	(mixed) The last item in this array.
	(null) If this array is empty,returns null.

	示例:
	['Cow','Pig','Dog','Cat'].getLast();//returns 'Cat'
#T=Array.getRandom 从数组内随机提取键值
	Returns a random item from the array.
	语法:
	myArray.getRandom();

	返回:
	(mixed) A random item from this array. If this array is empty,returns null.

	示例:
	['Cow','Pig','Dog','Cat'].getRandom();//returns one of the items
#T=Array.erase 从数组内移除一个项目
	Removes all occurrences of an item from the array.
	语法:
	myArray.erase(item);

	参数:
	item - (object) The item to search for in the array.

	返回:
	(array) This array with all occurrences of the item removed.

	示例:
	['Cow','Pig','Dog','Cat','Dog'].erase('Dog') //returns ['Cow','Pig','Cat']
	['Cow','Pig','Dog'].erase('Cat') //returns ['Cow','Pig','Dog']
#T=Array.empty 清空数组
	Empties an array.
	语法:
	myArray.empty();

	返回:
	(array) This array,emptied.

	示例:
	var myArray=['old','data'];
	myArray.empty();//myArray is now []
#T=Array.flatten 把多维数组转换为一维数组
	Flattens a multidimensional array into a single array.
	语法:
	myArray.flatten();

	返回:
	(array) A new flat array.

	示例:
	var myArray=[1,2,3,[4,5,[6,7]],[[[8]]]];
	var newArray=myArray.flatten();//newArray is [1,2,3,4,5,6,7,8]
#T=Array.pick 返回参数列表中第一个非未定义的项;如果全部未定义,则返回null
	Returns the first defined value of the array passed in,or null.
	语法:
	var picked=[var1,var2,var3].pick();

	返回:
	(mixed) The first variable that is defined.
	(null) If all variables passed in are null or undefined,returns null.

	示例:
	function say(infoMessage,errorMessage){
		alert([errorMessage,infoMessage,'There was no message supplied.'].pick());
		//or more MooTools 1.2 style using Generics
		Array.pick([errorMessage,infoMessage,'There was no message supplied.']);
	}
	say();//alerts 'There was no message supplied.'
	say('This is an info message.');//alerts 'This is an info message.'
	say('This message will be ignored.','This is the error message.');//alerts 'This is the error message.'

	注意:
	This is equivalent to $pick from MooTools 1.2.
#T=Array.hexToRgb 把颜色值转为RGB
	Converts an hexadecimal color value to RGB. Input array must be the following hexadecimal color format. ['FF','FF','FF']
	语法:
	myArray.hexToRgb([array]);

	参数:
	array - (boolean,optional) If true is passed,will output an array (e.g. [255,51,0]) instead of a string (e.g. "rgb(255,51,0)").

	返回:
	(string) A string representing the color in RGB.
	(array) If the array flag is set,an array will be returned instead.

	示例:
	['11','22','33'].hexToRgb();//returns 'rgb(17,34,51)'
	['11','22','33'].hexToRgb(true);//returns [17,34,51]
#T=Array.rgbToHex 把RGB转为颜色值
	Converts an RGB color value to hexadecimal. Input array must be in one of the following RGB color formats. [255,255,255],or [255,255,255,1]
	语法:
	myArray.rgbToHex([array]);

	参数:
	array - (boolean,optional) If true is passed,will output an array (e.g. ['ff','33','00']) instead of a string (e.g. '#ff3300').

	返回:
	(string) A string representing the color in hexadecimal,or 'transparent' string if the fourth value of rgba in the input array is 0 (rgba).
	(array) If the array flag is set,an array will be returned instead.

	示例:
	[17,34,51].rgbToHex();//returns '#112233'
	[17,34,51].rgbToHex(true);//returns ['11','22','33']
	[17,34,51,0].rgbToHex();//returns 'transparent'
#T= 


#T= Object
 Object
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=var O={a:0,b:1};
var O={a:0,b:1};
#T= ┉ Function ┉
 ┉ Function ┉
#T=Object.each 遍历一个Obj
	Used to iterate through an object.
	语法:
	Object.each(obj,fn[,bind]);

	参数:
	obj - (object) The object to iterate through.
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' within the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(item,key,object)

	参数:
	item - (mixed) The current item in the array.
	key - (mixed) The current item's key.
	object - (mixed) The actual array/object.

	示例:
	//alerts 'The first day of the week is Sunday','The second day of the week is Monday',etc.:
	Object.each({first:'Sunday',second:'Monday',third:'Tuesday'},function(value,key){
		alert('The '+key+' day of the week is '+value);
	});

	注意:
	This method is an object-specific equivalent of $each from MooTools 1.2
#T=Object.merge 合并一组Obj生成新Obj
	Merges any number of objects recursively without referencing them or their sub-objects.
	语法:
	var merged=Object.merge(obj1,obj2[,obj3[,...]]);

	参数:
	(objects) Any number of objects.

	返回:
	(object) The object that is created as a result of merging all the objects passed in.

	示例:
	var obj1 ={a:0,b:1};
	var obj2 ={c:2,d:3};
	var obj3 ={a:4,d:5};
	var merged=Object.merge(obj1,obj2,obj3);//returns{a:4,b:1,c:2,d:5},(obj2,and obj3 are unaltered)
	merged === obj1;//true,obj1 gets altered and returned as merged object
	var nestedObj1 ={a:{b:1,c:1}};
	var nestedObj2 ={a:{b:2}};
	var nested=Object.merge(nestedObj1,nestedObj2);//returns:{a:{b:2,c:1}}
#T=Object.clone 克隆Obj
	Returns a copy of an object.
	语法:
	var clone=Object.clone(obj);

	参数:
	(obj) The object to clone

	返回:
	(object) A copy of the passed object

	示例:
	var obj1 ={a:0,b:1};
	var obj2=Object.clone(obj1);
	obj1.a=42;
	alert(obj1.a);//alerts '42'
	alert(obj2.a);//alerts '0'

	注意:
	This is an object-specific equivalent of $unlink from MooTools 1.2.
#T=Object.append 合并Obj,追加到尾部
	Copies all the properties from the second object passed in to the first object passed in.
	语法:
	Object.append(original,extension);

	参数:
	original - (object) The object to be extended.
	extension - (object) The object whose properties will be copied to original.

	返回:
	(object) The first object passed in,extended.

	示例:
	var firstObj ={
		name:'John',
		lastName:'Doe'
	};
	var secondObj ={
		age:'20',
		sex:'male',
		lastName:'Dorian'
	};
	Object.append(firstObj,secondObj);
	//firstObj is now:{name:'John',lastName:'Dorian',age:'20',sex:'male'};

	注意:
	This method is an object-specific equivalent of $extend from MooTools 1.2
#T=Object.subset 从Obj内获取子集
	Get a subset of an object.
	语法:
	Object.subset(object,keys);

	参数:
	object - (object) The object.
	keys - (array) An array with the keys.

	返回:
	(object) The subset of the Object.

	示例:
	var object ={
		a:'one',
		b:'two',
		c:'three'
	};
	Object.subset(object,['a','c']);//returns{a:'one',c:'three'}
#T=Object.map 调用外部函数循环处理现有Obj内的每个项目,并产生新Obj
	Creates a new map with the results of calling a provided function on every value in the map.
	语法:
	var mappedObject=Object.map(object,fn[,bind]);

	参数:
	object - (object) The object.
	fn - (function) The function to produce an element of the Object from an element of the current one.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(value,key,object)

	参数:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	返回:
	(object) The new mapped object.

	示例:
	var myObject ={a:1,b:2,c:3};
	var timesTwo=Object.map(myObject,function(value,key){
		return value * 2;
	});//timesTwo now holds an object containing:{a:2,b:4,c:6};
#T=Object.filter 将所有在给定过滤函数中过滤通过的Obj项创建一个新Obj
	Creates a new object with all of the elements of the object for which the provided filtering function returns true.
	语法:
	var filteredObject=Object.filter(object,fn[,bind]);

	参数:
	object - (object) The object.
	fn - (function) The function to test each element of the Object. This function is passed the value and its key in the Object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(value,key,object)

	参数:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	返回:
	(object) The new filtered object.

	示例:
	var myObject ={a:10,b:20,c:30};
	var biggerThanTwenty=Object.filter(myObject,function(value,key){
		return value > 20;
	});//biggerThanTwenty now holds an object containing:{c:30}
#T=Object.every 如果Obj中的每一项都通过了给定函数的测试,则返回true
	Returns true if every value in the object satisfies the provided testing function.
	语法:
	var allPassed=Object.every(object,fn[,bind]);

	参数:
	object - (object) The object.
	fn - (function) The function to test each element of the Object. This function is passed the value and its key in the Object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(value,key,object)

	参数:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	返回:
	(boolean) If every value in the Object satisfies the provided testing function,returns true. Otherwise,returns false.

	示例:
	var myObject ={a:10,b:4,c:25,d:100};
	var areAllBigEnough=Object.every(myObject,function(value,key){
		return value > 20;
	});//areAllBigEnough=false
#T=Object.some 如果Obj中至少有一个项通过了给出的函数的测试,则返回true
	Returns true if at least one value in the object satisfies the provided testing function.
	语法:
	var anyPassed=Object.some(object,fn[,bind]);

	参数:
	object - (object) The object.
	fn - (function) The function to test each element of the object. This function is passed the value and its key in the object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	语法:
	fn(value,key,object)

	参数:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	返回:
	(boolean) If any value in the object satisfies the provided testing function,returns true. Otherwise,returns false.

	示例:
	var myObject ={a:10,b:4,c:25,d:100};
	var areAnyBigEnough=Object.some(myObject,function(value,key){
		return value > 20;
	});//isAnyBigEnough=true
#T=Object.keys 返回Obj内所有的key成为一个数组
	Returns an array containing all the keys,in the same order as the values returned by Object:values.
	语法:
	var keys=Object.keys(object);

	参数:
	object - (object) The object.

	返回:
    (array) An array containing all the keys of the object.

	示例:
	var myObject ={e:10,b:4,c:25,d:100};
	var keys=Object.keys(myObject);
	alert(keys)
#T=Object.values 返回Obj内所有的value成为一个数组
	Returns an array containing all the values,in the same order as the keys returned by Object:keys.
	语法:
	var values=Object.values(object);

	参数:
	object - (object) The object.

	返回:
	(array) An array containing all the values of the object.

	示例:
	var myObject ={e:10,b:4,c:25,d:100};
	var keys=Object.values(myObject);
	alert(keys)
#T=Object.getLength 返回Obj的元素个数
	Returns the number of keys in the object.
	语法:
	var length=Object.getLength(object);

	参数:
	object - (object) The object.

	返回:
	(number) The length of the object.

	示例:
	var myObject ={
		name:'John',
		lastName:'Doe'
	});
	Object.getLength(myObject);//returns 2
#T=Object.keyOf 根据value查询Obj内的key的名称;如果未找到相等的项,则返回false
	Returns the key of the specified value. Synonymous with Array:indexOf.
	语法:
	var key=Object.keyOf(object,item);

	参数:
	object - (object) The object.
	item - (mixed) The item to search for in the object.

	返回:
	(string) If the object has a the specified item in it,returns the key of that item.
	(boolean) Otherwise,returns false.

	示例:
	var myObject ={a:'one',b:'two',c:3};
	Object.keyOf(myObject,'two');//returns 'b'
	Object.keyOf(myObject,3);//returns 'c'
	Object.keyOf(myObject,'four');//returns false
#T=Object.contains 测试Obj内是否存在某个值
	Tests for the presence of a specified value in the object.
	语法:
	var inObject=Object.contains(object,value);

	参数:
	object - (object) The object.
	value - (mixed) The value to search for in the Object.

	返回:
	(boolean) If the object has the passed in value in any of the keys,returns true. Otherwise,returns false.

	示例:
	var myObject ={a:'one',b:'two',c:'three'};
	Object.contains(myObject,'one');//returns true
	Object.contains(myObject,'four');//returns false
#T=Object.toQueryString 把Obj内的项目转换为Url地址,然后URIencode
	Generates a query string from key/value pairs in an object and URI encodes the values.
	语法:
	var queryString=Object.toQueryString(object[,base]);

	参数:
	object - (object) The object to generate the query string from.
	base - (string,optional) Will be used as base variable in the query string.

	返回:
	(string) The query string.

	示例:
	Object.toQueryString({apple:'red',lemon:'yellow'});//returns 'apple=red&lemon=yellow'
	Object.toQueryString({apple:'红色',lemon:'yellow'});//apple=%E7%BA%A2%E8%89%B2&lemon=yellow
	Object.toQueryString({apple:'red',lemon:'yellow'},'fruits');//returns 'fruits[apple]=red&fruits[lemon]=yellow'
#T= 


#T= JSON
 JSON
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=var J={"_5":"停","_4":"W\\i","_3":"麥\/克"};
var J={"_5":"停","_4":"W\\i","_3":"麥\/克"};
#T=JSON.encode 把Obj或数组转为Json
	Converts an object or array to a JSON string.
	语法:
	var myJSON=JSON.encode(obj);

	参数:
	obj - (object) The object to convert to string.

	返回:
	(string) A JSON string.

	示例:
	var fruitsJSON=JSON.encode({apple:'red',lemon:'yellow'});//returns:'{"apple":"red","lemon":"yellow"}'
#T=JSON.decode 把一个Json转为Obj
	Converts a JSON string into a JavaScript object.
	语法:
	var object=JSON.decode(string[,secure]);

	参数:
	string - (string) The string to evaluate.
	secure - (boolean,optional:defaults to false) If set to true,checks for any hazardous syntax and returns null if any found.

	返回:
	(object) The object represented by the JSON string.

	示例:
	var myObject=JSON.decode('{"apple":"red","lemon":"yellow"}');//returns:{apple:'red',lemon:'yellow'}

	参见:
	JSON (JavaScript Object Notation)
#T=解析XML
	Request.XML = new Class({
		Extends: Request,
		success: function(text, xml){
			if(Browser.Features.xpath) {
				xml.selectNodes = function(xpath){
					var nodes = [], node;	
					var result = xml.evaluate(xpath, this, this.createNSResolver(xml.documentElement), XPathResult.ORDERED_NODE_ITERATOR_TYPE, null) ;
					if (result) while(node = result.iterateNext()) nodes.push(node);
					return nodes;
				};	
				xml.selectSingleNode = function(xpath){
					var result = xml.evaluate(xpath, this, this.createNSResolver(xml.documentElement), 9, null);
					return (result && result.singleNodeValue) ? result.singleNodeValue : [];
				};
			}
			this.onSuccess(xml, text);
		}
	});
#T= 


#T= Cookie
 Cookie
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=构造
	Reads and writes a cookie.
	选项:
	domain - (string:defaults to false) The domain the cookie belongs to.
	path - (string:defaults to '/') The path the cookie belongs to.
	duration - (number:defaults to false) The duration of the cookie (in days) before it expires. If set to false or 0,the cookie will be a session cookie that expires when the browser is closed.
	secure - (boolean:defaults to false) Stored cookie information can be accessed only from a secure environment.
#T=Cookie.write
	Writes a cookie in the browser.
	语法:
	var myCookie=Cookie.write(key,value[,options]);

	参数:
	key - (string) The key (or name) of the cookie.
	value - (string) The value to set.不可包含分号.
	options - (混合,可选) See Cookie.

	返回:
	(object) An object with the options,the key and the value. You can give it as first parameter to Cookie.dispose.

	示例:
	Saves the cookie for the duration of the session:
	var myCookie=Cookie.write('username','JackBauer');

	有效期为1天,有效域:
	var myCookie=Cookie.write('username','JackBauer',{duration:1,domain:'mootools.net'});

	注意:
	In order to share the cookie with pages located in a different path,the Cookie.options.domain value must be set.
#T=Cookie.read
	Reads the value of a cookie.
	语法:
	var myCookie=Cookie.read(name);

	参数:
	name - (string) The name of the cookie to read.

	返回:
	(mixed) The cookie string value,or null if not found.

	示例:
	Cookie.read('username');
#T=Cookie.dispose
	Removes a cookie from the browser.
	语法:
	var oldCookie=Cookie.dispose(name[,options]);

	参数:
	name - (string) The name of the cookie to remove or a previously saved Cookie instance.
	options - (object,optional) See Cookie.

	示例:
	Cookie.dispose('username');//Bye-bye JackBauer!

	//最好的写法
    var myCookie=Cookie.write('username','JackBauer',{duration:1,domain:'mootools.net'});
    if(Cookie.read('username') == 'JackBauer'){myCookie.dispose();}
#T= 


#T= Swiff
 Swiff
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=构造
	Creates and returns a Flash object using supplied parameters.
	语法:
	var mySwiff=new Swiff(path[,options]);

	参数:
	path - (string) The path to the SWF file.
	options - (object,optional) See Options below.

	选项:
	id - (string:defaults to 'Swiff_'+unique id) The id of the SWF object.
	width - (number:defaults to 1) The width of the SWF object.
	height - (number:defaults to 1) The height of the SWF object.
	container - (element) The container the SWF object gets injected in.
	params - (object) Parameters to be passed to the SWF object (wmode,bgcolor,allowScriptAccess,loop,etc.).
		allowScriptAccess - (string:defaults to always) The domain that the SWF object allows access to.
		quality - (string:defaults to 'high') The render quality of the movie.
		swLiveConnect - (boolean:defaults to true) the swLiveConnect parameter to allow remote scripting.
		wMode - (string:defaults to 'window') Changes the way the SWF is displayed in the browser.
	properties - (object) Additional attributes for the object element.
	vars - (object) Vars will be passed to the SWF as query string in flashVars.
	callBacks - (object) Functions to call from the SWF. These will be available globally in the movie,and bound to the object.

	返回:
	(element) A new HTML object element.

	示例:
	var obj=new Swiff('#yiju/img/logo.swf',{
		id:'myBeautifulMovie',
		width:500,
		height:400,
		container:$('drop_here'),
		params:{
			wMode:'opaque',
			bgcolor:'#ff3300'
		},
		vars:{
			//myVariable:myJsVar,
			myVariableString:'hello'
		},
		callBacks:{
			load:function(){alert('done')}
		}
	});

	注意:
	Although Swiff returns the object,this element will NOT have any Element methods applied to it.
	The $ function on an object/embed tag will only return its reference without further processing.
#T=Swiff
	var obj=new Swiff('#yiju/img/logo.swf',{
		id:'myBeautifulMovie',
		width:500,
		height:400,
		container:$('drop_here'),
		params:{
			wMode:'transparent',
			bgcolor:'#ff3300'
		},
		vars:{
			//myVariable:myJsVar,
			myVariableString:'hello'
		},
		callBacks:{
			load:function(){alert('done')}
		}
	});
#T=Swiff Function:remote
	Calls an ActionScript function from JavaScript.
	语法:
	var result=Swiff.remote(obj,fn[,arg,arg,arg ...]);

	参数:
	obj - (element) A Swiff instance (a HTML object element).
	fn - (string) The function name to execute in the SWF.
	arg - (mixed) Any number of arguments to pass to the named function.

	返回:
	(mixed) The ActionScript function's result.

	示例:
	var obj=new Swiff('myMovie.swf');
	alert(Swiff.remote(obj,'myFlashFn'));//alerts "This is from the .swf file!".

	注意:
	The SWF file must be compiled with the ExternalInterface component. See the Adobe documentation on External Interface for more information.
#T= 


#T= Request
 Request
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=用法
	$.extend({//给$增加事件
		ajax:function(options){
			var request;
			options.method=options.type || options.method || 'get';
			if(options.complete){options.onComplete=options.complete;}
			if(options.error){options.onFailure=options.error;}
			if(options.success){options.onSuccess=options.success;}
			if(options.dataType && options.dataType.toLowerCase()=='html' && Request.HTML){
				request=new Request.HTML(options);
			}else if(options.dataType && options.dataType.toLowerCase()=='json' && Request.JSON){
				request=new Request.JSON(options);
			}else{
				request=new Request(options);
			}
			if(options.timeout){request.cancel.delay(options.timeout);}
			return request.send();
		}
	});
	$.ajax({//調用
		type:"post",url:"sys.php",timeout:1000,
		data:'work=buygetprice&tim='+encodeURI(tim)+'&day='+encodeURI(day)+'',
		error:function(msg){alert(msg);return false;},
		success:function(msg){
			if(msg.indexOf('Error:')==-1){alert(msg);return false;}
		}
	});
#T=构造
	An XMLHttpRequest Wrapper.
	工具:
	Chain,Events,Options

	语法:
	var myRequest=new Request([options]);

	参数:
	options - (object,optional) See below.

	选项:
	url - (string:默认是null) 要请求的URL. 
    data - (string:默认是空) 默认要发送的数据.
    link - (string:默认是'ignore') 可为'ignore','cancel','chain'.
        'ignore' - 当请求正在执行之中时,新的请求将被忽略
        'cancel' - 当请求正在执行之中时,将立即取消当前执行中的请求,开始执行新的请求
        'chain' - 当请求正在执行之中时,将会把新的请求链接在当前请求之后,依次执行所有请求
    method - (string:默认是'post') HTTP请求类型,可为'post' 或 'get'.
    emulation - (boolean:默认是true) 仿真,通常不用理会
    async - (boolean:默认是true) 异步,如果设为false,那么在请求数据的时候将会同步冻结浏览器请求,通常不用理会.
    timeout - (integer:默认是0) 超时时间
    headers - (object) 设置content-type头.
    urlEncoded - (boolean:默认是true) url编码,如果设为true,则content-type头将被设为www-form-urlencoded+encoding
    encoding - (string:默认是'utf-8') 数据的编码.
    noCache - (boolean;默认是false) 如果设为true,则不缓存
    isSuccess - (function) 请求结束之后的事件.
    evalScripts - (boolean:默认是false) 如果设为true,结果内的script会被执行
    evalResponse - (boolean:默认是false) 如果设为true,请求内容将会被执行.
    user - (string:默认是null) 如果设置了此项,那么请求的时候将会尝试认证.
    password - (string:默认是null) 和user搭配使用,设置此项的时候要填写密码而不是星号
#T=onRequest
	当Request is sent的时候触发.
#T=onLoadstart
	当Request loaded的时候触发,在其他所有进程之前. (This is limited to Browsers that support the event. At this time:Gecko and WebKit).
	特征:
	onLoadstart(event,xhr)

	参数:
	event - (Event) The loadstart event.
	xhr - (XMLHttpRequest) The transport instance.
#T=onProgress
	当Request正在建立上传或下载的进程时触发. (This is limited to Browsers that support the event. At this time:Gecko and WebKit).
	特征:
	onProgress(event,xhr)

	参数:
	event - (Event) The progress event,containing currently downloaded bytes and total bytes.
	xhr - (XMLHttpRequest) The transport instance.

	示例:
	var myRequest=new Request({
		url:'image.jpg',
		onProgress:function(event,xhr){
			var loaded=event.loaded,total=event.total;
			console.log(parseInt(loaded / total * 100,10));
		}
	});
	myRequest.send();

	参见:
	MDC:nsIDOMProgressEvent
#T=onComplete
	当请求结束时触发.
	特征:
	onComplete()
#T=onCancel
	当请求被取消时触发.
	特征:
	onCancel()
#T=onSuccess
	当请求成功完成后触发.
	特征:
	onSuccess(responseText,responseXML)

	参数:
	responseText - (string) The returned text from the request.
	responseXML - (mixed) The response XML from the request.
#T=onFailure
	当请求失败时触发.
	特征:
	onFailure(xhr)

	参数:
	xhr - (XMLHttpRequest) The transport instance.
#T=onException
	当设置一个请求头失败时触发.
	特征:
	onException(headerName,value)

	参数:
	headerName - (string) The name of the failing header.
	value - (string) The value of the failing header.

	属性:
	response - (object) Object with text and XML as keys. You can access this property in the 'success' event.

	返回:
	(object) A new Request instance.

	示例:
	var myRequest=new Request({method:'get',url:'requestHandler.php'});
	myRequest.send('name=john&lastname=dorian');

	参见:
	Wikipedia:XMLHttpRequest
#T=onTimeout
	当超出了options.timeout所设置的毫秒数,却没有发生状态值的改变时触发.
	特征:
	onTimeout()

	示例:
	This example fetches some text with Request. When the user clicks the link,the returned text by the server is used to update the element's text. It uses the onRequest,onSuccess and onFailure events to inform the user about the current state of the request. The method option is set to get because we get some text instead of posting it to the server. It gets the data-userid attribute of the clicked link,which will be used for the querystring.

	var myElement=document.id('myElement');
	var myRequest=new Request({
		url:'getMyText.php',
		method:'get',
		onRequest:function(){
			myElement.set('text','loading...');
		},
		onSuccess:function(responseText){
			myElement.set('text',responseText);
		},
		onFailure:function(){
			myElement.set('text','Sorry,your request failed:(');
		}
	});
	document.id('myLink').addEvent('click',function(event){
		event.stop();
		myRequest.send('userid='+this.get('data-userid'));
	});
#T= ┉ Request ┉
	var myRequest=new Request({//建立Request对象
        url:'image.php',//要请求的地址
        onProgress:function(event,xhr){//建立进度显示在控制台内
            var loaded=event.loaded,total=event.total;
            console.log(parseInt(loaded / total * 100,10));
        }
    }).send();//用他的send方法发送

    //再来一个例子
    var myElement=$('myElement');//选节点
    var myRequest=new Request({//建立Request对象
        url:'getMyText.php',//要请求的地址
        method:'get',//get请求
        onProgress:function(event,xhr){//建立进度显示在控制台内
            var loaded=event.loaded,total=event.total;
            console.log(parseInt(loaded / total * 100,10));
        },
        onRequest:function(){//当请求被发送时设置内容
            myElement.set('text','loading...');
        },
        onSuccess:function(responseText){//结束后重设内容
            myElement.set('text',responseText);
        },
        onFailure:function(){//失败时提示
            myElement.set('text','Sorry,your request failed:(');
        }
    });

    //$('myLink')点击时,触发ajax的send方法
    $('myLink').addEvent('click',function(event){
        event.stop();//终止掉$('myLink')的默认事件(假如是<a ..>防止超链接跑到别的页面上)
        myRequest.send('userid='+this.get('data-userid'));
    });
#T= ┉ Method ┉
 ┉ Method ┉
#T=Request:setHeader
	添加或修改一个请求的头信息. 并不会重写options.
	语法:
	myRequest.setHeader(name,value);

	参数:
	name - (string) The name for the header.
	value - (string) The value to be assigned.

	返回:
	(object) This Request instance.

	示例:
	var myRequest=new Request({url:'getData.php',method:'get',headers:{'X-Request':'JSON'}});
	myRequest.setHeader('Last-Modified','Sat,1 Jan 2005 05:00:00 GMT');
#T=Request:getHeader
	返回响应头,如果没有发现则为null.
	语法:
	myRequest.getHeader(name);

	参数:
	name - (string) The name of the header to retrieve the value of.

	返回:
	(string) The value of the retrieved header.
	(null) null if the header is not found.

	示例:
	var myRequest=new Request({url:'getData.php',method:'get',onSuccess:function(responseText,responseXML){
		alert(this.getHeader('Date'));//alerts the server date (for example,'Thu,26 Feb 2009 20:26:06 GMT')
	}});
#T=Request:send
	打开请求链接并发送在options里预设的数据
	语法:
	myRequest.send([options]);

	参数:
	options - (object,optional) The options for the sent Request. Will also accept data as a query string for compatibility reasons.

	返回:
	(object) This Request instance.

	示例:
	var myRequest=new Request({
		url:'http://localhost/some_url'
	}).send('save=username&name=John');

	Request Methods:send aliases

	MooTools provides several aliases for Request:send to make it easier to use different methods.

	These 别名 are:
		post() and POST()
		get() and GET()
		put() and PUT()
		delete() and DELETE()

	语法:
	myRequest.post([data]);

	参数:
	data - (string,optional) Equivalent with the data option of Request.

	返回:
	(object) This Request instance.

	示例:
	var myRequest=new Request({url:'http://localhost/some_url'});
	myRequest.post('save=username&name=John');
	//...is equivalent to:
	myRequest.send({
		method:'post',
		data:'save=username&name=John'
	});
	myRequest.get('save=username&name=John');
	//...is equivalent to:
	myRequest.send({
		method:'get',
		data:'save=username&name=John'
	});

	注意:
	By default the emulation option is set to true,so the put and delete send methods are emulated and will actually send as post while the method name is sent as e.g. _method=delete.
#T=Request:cancel
	取消当前正运行的请求.
	语法:
	myRequest.cancel();

	返回:
	(object) This Request instance.

	示例:
	var myRequest=new Request({url:'mypage.html',method:'get'}).send('some=data');
	myRequest.cancel();
#T=Request:isRunning
	如果当前请求正在运行则返回true
	语法:
	myRequest.isRunning()

	返回:
	(boolean) True if the request is running

	示例:
	var myRequest=new Request({url:'mypage.html',method:'get'}).send('some=data');
	if(myRequest.isRunning()) //It runs!
#T=Property:send
	Sets a default Request instance for an Element. This is useful when handling forms.
	语法:
	el.set('send'[,options]);

	参数:
	options - (object) The Request options.

	返回:
	(element) The original element.

	示例:
	myForm.set('send',{url:'contact.php',method:'get'});
	myForm.send();//Sends the form.

	Getter

	Returns the previously set Request instance (or a new one with default options).
	语法:
	el.get('send');

	参数:
	property - (string) the Request property argument.

	返回:
	(object) The Request instance.

	示例:
	el.set('send',{method:'get'});
	el.send();
	el.get('send');//returns the Request instance.
#T= ┉ Request.HTML ┉
 ┉ Request.HTML ┉
#T=构造
	Request Specifically made for receiving HTML.
	扩展:
	Request

	语法:
	var myHTMLRequest=new Request.HTML([options]);

	参数:
	options - (object,optional) See options below. Also inherited are all the options from Request.

	选项:
	evalScripts - (boolean:defaults to true) If set to true,script tags inside the response will be evaluated. This overrides the false default from Request.
	update - (element:defaults to null) The Element to insert the response text of the Request into upon completion of the request.
	append - (element:defaults to null) The Element to append the response text of the Request into upon completion of the request.
	filter - (mixed:defaults to null) To filter the response tree by a selector or function. See Elements:filter

	事件:
	success
	(function) Function to execute when the HTML request completes. This overrides the signature of the Request success event.

	特征:
	onSuccess(responseTree,responseElements,responseHTML,responseJavaScript)

	参数:
	responseTree - (element) The node list of the remote response.
	responseElements - (array) An array containing all elements of the remote response.
	responseHTML - (string) The content of the remote response.
	responseJavaScript - (string) The portion of JavaScript from the remote response.

	返回:
	(object) A new Request.HTML instance.

	Simple GET Request:
	var myHTMLRequest=new Request.HTML().get('myPage.html');

	POST Request with data as String:
	var myHTMLRequest=new Request.HTML({url:'myPage.html'}).post('user_id=25&save=true');

	Data from Object Passed via GET:
	//Loads "load/?user_id=25".
	var myHTMLRequest=new Request.HTML({url:'load/'}).get({'user_id':25});

	Data from Element via POST:
	<form action="save/" method="post" id="user-form">
		<p>
			Search:<input type="text" name="search" />
			Search in description:<input type="checkbox" name="search_description" value="yes" />
			<input type="submit" />
		</p>
	</form>

	Js:
	//Needs to be in a submit event or the form handler.
	var myHTMLRequest=new Request.HTML({url:'save/'}).post($('user-form'));
#T=Request.HTML
	var myHTMLRequest=new Request.HTML().get('myPage.html');

	var myHTMLRequest=new Request.HTML({url:'myPage.html'}).post('user_id=25&save=true');

	<div id="content">Loading content...</div>
	$('content').load('page_1.html');

	Data from Object Passed via GET:
	//Loads "load/?user_id=25".
	var myHTMLRequest=new Request.HTML({url:'load/'}).get({'user_id':25});

	Data from Element via POST:
	<form action="save/" method="post" id="user-form">
		<p>
			Search:<input type="text" name="search" />
			Search in description:<input type="checkbox" name="search_description" value="yes" />
			<input type="submit" />
		</p>
	</form>

	Js:
	//Needs to be in a submit event or the form handler.
	var myHTMLRequest=new Request.HTML({url:'save/'}).post($('user-form'));
#T= ┉ Request.JSON ┉
 ┉ Request.JSON ┉
#T=构造
	Wrapped Request with automated receiving of JavaScript Objects in JSON Format.
	扩展:
	Request

	语法:
	var myJSONRemote=new Request.JSON([options]);

	参数:
	options - (object,optional) See below.

	选项:
	secure - (boolean:defaults to true) If set to true,a syntax check will be done on the result JSON (see JSON.decode).

	事件:
	success
	Fired when the request completes. This overrides the signature of the Request success event.

	特征:
	onSuccess(responseJSON,responseText)

	参数:
	responseJSON - (object) The JSON response object from the remote request.
	responseText - (string) The JSON response as string.

	error
	Fired when the parsed JSON is not valid and the secure option is set.

	特征:
	onError(text,error)

	参数:
	text - (string) The response text.
	error - (string) The error message.

	返回:
	(object) A new Request.JSON instance.

	示例:
	//this code will send a data object via a GET request and alert the retrieved data.
	var jsonRequest=new Request.JSON({url:'http://site.com/tellMeAge.php',onSuccess:function(person){
		alert(person.age);//alerts "25 years".
		alert(person.height);//alerts "170 cm".
		alert(person.weight);//alerts "120 kg".
	}}).get({'firstName':'John','lastName':'Doe'});
#T=Request.JSON
	//this code will send a data object via a GET request and alert the retrieved data.
	var jsonRequest=new Request.JSON({url:'http://site.com/tellMeAge.php',onSuccess:function(person){
		alert(person.age);//alerts "25 years".
		alert(person.height);//alerts "170 cm".
		alert(person.weight);//alerts "120 kg".
	}}).get({'firstName':'John','lastName':'Doe'});
	或
	new Request.JSON({
        url: "./communitystore.php?a=getRegionOptions",
        async: false,
        onSuccess: function(data) {
            if($type(data.result) == "object") {
                var el = obj.getNext("select");
                el.getChildren("option").dispose();
                new Element("option", {
                    "value": 0,
                    "text": "请选择..."
                    }).inject(el, "top");
                for (key in data.result) {
                    new Element("option", {"value":key, "text":data.result[key]}).inject(el, 'bottom');
                }
            }
        }
    }).get({"region":obj.value});
#T= 


#T= Class
 Class
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=Example
	var Person=new Class({
		initialize:function(name,age){
			this.name=name;
			this.age=age;
		},

		log:function(){
			console.log(this.name+','+this.age);
		}
	});
	var mark=new Person('mark',24);
	mark.log();//returns'mark,24'
	或
	var Person=new Class(function(name,age){
		this.name=name;
		this.age=age;
	});
	Person.implement('log',function(){
		console.log(this.name+','+this.age);
	});
	var mark=new Person('mark',24);
	mark.log();//returns'mark,24'
#T=构造
	语法:
	var MyClass=new Class(properties);

	参数:
	properties - Can be one of the following types:
		(object) The collection of properties that apply to the Class. Also accepts some special properties such as Extends,Implements,and initialize (see below).
		(function) The initialize function (see below).

	属性:Extends
	(class) The Class that this class will extend.

	The methods of this Class that have the same name as the Extends Class,will have a parent property,that allows you to call the other overridden method. The Extends property should be the first property in a class definition.

	属性:Implements
	(class) The properties of a passed Class will be copied into the target Class.
	(array) An array of Classes,the properties of which will be copied into this Class.

	Implements is similar to Extends,except that it adopts properties from one or more other classes without inheritance. Useful when implementing a default set of properties in multiple Classes. The Implements property should come after Extends but before all other properties.

	属性:initialize
	(function) The initialize function will be the constructor for this class when new instances are created.

	属性:toElement
	(function) A method which returns an element. This method will be automatically called when passing an instance of a class in the document.id function.

	返回:
	(class) The created Class.

	示例:
	var Cat=new Class({
		initialize:function(name){
			this.name=name;
		}
	});
	var myCat=new Cat('Micia');
	alert(myCat.name);//alerts 'Micia'
	var Cow=new Class({
		initialize:function(){
			alert('moooo');
		}
	});

	扩展示例:
	var Animal=new Class({
		initialize:function(age){
			this.age=age;
		}
	});
	var Cat=new Class({
		Extends:Animal,
		initialize:function(name,age){
			this.parent(age);//calls initalize method of Animal class
			this.name=name;
		}
	});
	var myCat=new Cat('Micia',20);
	alert(myCat.name);//alerts 'Micia'.
	alert(myCat.age);//alerts 20.

	工具示例:
	var Animal=new Class({
		initialize:function(age){
			this.age=age;
		}
	});
	var Cat=new Class({
		Implements:Animal,
		setName:function(name){
			this.name=name
		}
	});
	var myAnimal=new Cat(20);
	myAnimal.setName('Micia');
	alert(myAnimal.name);//alerts 'Micia'.
#T=Class Method:implement
	Implements the passed in properties into the base Class prototypes,altering the base Class. The same as creating a new Class with the Implements property,but handy when you need to modify existing classes.
	语法:
	MyClass.implement(properties);

	参数:
	properties - (object) The properties to add to the base Class.

	示例:
	var Animal=new Class({
		initialize:function(age){
			this.age=age;
		}
	});
	Animal.implement({
		setName:function(name){
			this.name=name;
		}
	});
	var myAnimal=new Animal(20);
	myAnimal.setName('Micia');
	alert(myAnimal.name);//alerts 'Micia'
#T= ┉ 链条 ┉
	语法:
	For new classes:
	var MyClass=new Class({Implements:Chain});

	For existing classes:
	MyClass.implement(Chain);

	Stand alone
	var myChain=new Chain;

	示例:
	var Todo=new Class({
		Implements:Chain,
		initialize:function(){
			this.chain.apply(this,arguments);
		}
	});
	var myTodoList=new Todo(
		function(){alert('get groceries');},
		function(){alert('go workout');},
		function(){alert('code mootools documentation until eyes close involuntarily');},
		function(){alert('sleep');}
	);
#T= ┉ Methods ┉
 ┉ Methods ┉
#T=chain
	Adds functions to the end of the call stack of the Chain instance.
	语法:
	myClass.chain(fn[,fn2[,fn3[,...]]]);

	参数:
	fn - (function or array) The function (or array of functions) to add to the chain call stack. Will accept and number of functions or arrays of functions.

	返回:
	(object) The current Class instance. Calls to chain can also be chained.

	示例:
	//Fx.Tween has already implemented the Chain class because of inheritance of the Fx class.
	var myFx=new Fx.Tween('myElement',{property:'opacity'});
	myFx.start(1,0).chain(
		//Notice that "this" refers to the calling object (in this case,the myFx object).
		function(){this.start(0,1);},
		function(){this.start(1,0);},
		function(){this.start(0,1);}
	);//Will fade the Element out and in twice.

	参见:
	Fx,Fx.Tween
#T=callChain
	Removes the first function of the Chain instance stack and executes it. The next function will then become first in the array.
	语法:
	myClass.callChain([any arguments]);

	参数:
	Any arguments passed in will be passed to the "next" function.

	返回:
	(mixed) The return value of the "next" function or false when the chain was empty.

	示例:
	var myChain=new Chain();
	myChain.chain(
		function(){alert('do dishes');},
		function(){alert('put away clean dishes');}
	);
	myChain.callChain();//alerts 'do dishes'.
	myChain.callChain();//alerts 'put away clean dishes'.
#T=clearChain
	Clears the stack of a Chain instance.
	语法:
	myClass.clearChain();

	返回:
	(object) The current Class instance.

	示例:
	var myFx=Fx.Tween('myElement','color');//Fx.Tween inherited Fx's implementation of Chain.
	myFx.chain(function(){while(true) alert("D'oh!");});//chains an infinite loop of alerts.
	myFx.clearChain();//cancels the infinite loop of alerts before allowing it to begin
#T= ┉ Events ┉
	A Utility Class. Its methods can be implemented with Class:implement into any Class. In Fx,for example,this Class is used to allow any number of functions to be added to the Fx events,like 'complete','start',and 'cancel'. Events in a Class that implements Events must be either added as an option or with addEvent,not directly through .options.onEventName.
	语法:
	For new classes:
	var MyClass=new Class({Implements:Events});

	For existing classes:
	MyClass.implement(Events);

	执行:
	This class can be implemented into other classes to add its functionality to them.
	Events has been designed to work well with the Options class. When the option property begins with 'on' and is followed by a capital letter it will be added as an event (e.g. 'onComplete' will add as 'complete' event).

	示例:
	var Widget=new Class({
		Implements:Events,
		initialize:function(element){
			//...
		},
		complete:function(){
			this.fireEvent('complete');
		}
	});
	var myWidget=new Widget();
	myWidget.addEvent('complete',myFunction);

	注意:
	Events starting with 'on' are still supported in all methods and are converted to their representation without 'on' (e.g. 'onComplete' becomes 'complete').

	参见:
	Class,Options
#T= ┉ Methods ┉
 ┉ Methods ┉
#T=Events Method:addEvent
	Adds an event to the Class instance's event stack.
	语法:
	myClass.addEvent(type,fn[,internal]);

	参数:
	type - (string) The type of event (e.g. 'complete').
	fn - (function) The function to execute.
	internal - (boolean,optional) Sets the function property:internal to true. Internal property is used to prevent removal.

	返回:
	(object) This Class instance.

	示例:
	var myFx=new Fx.Tween('element','opacity');
	myFx.addEvent('start',myStartFunction);
#T=Events Method:addEvents
	The same as addEvent,but accepts an object to add multiple events at once.
	语法:
	myClass.addEvents(events);

	参数:
	events - (object) An object with key/value representing:key the event name (e.g. 'start'),and value the function that is called when the Event occurs.

	返回:
	(object) This Class instance.

	示例:
	var myFx=new Fx.Tween('element','opacity');
	myFx.addEvents({
		start:myStartFunction,
		complete:function(){
			alert('Done.');
		}
	});
#T=Events Method:fireEvent
	Fires all events of the specified type in the Class instance.
	语法:
	myClass.fireEvent(type[,args[,delay]]);

	参数:
	type - (string) The type of event (e.g. 'complete').
	args - (mixed,optional) The argument(s) to pass to the function. To pass more than one argument,the arguments must be in an array.
	delay - (number,optional) Delay in milliseconds to wait before executing the event (defaults to 0).

	返回:
	(object) This Class instance.

	示例:
	var Widget=new Class({
		Implements:Events,
		initialize:function(arg1,arg2){
			//...
			this.fireEvent('initialize',[arg1,arg2],50);
		}
	});
#T=Events Method:removeEvent
	Removes an event from the stack of events of the Class instance.
	语法:
	myClass.removeEvent(type,fn);

	参数:
	type - (string) The type of event (e.g. 'complete').
	fn - (function) The function to remove.

	返回:
	(object) This Class instance.

	注意:
	If the function has the property internal and is set to true,then the event will not be removed.
#T=Options Method:setOptions
	Merges the default options of the Class with the options passed in. Every value passed in to this method will be deep copied. Therefore other class instances or objects that are not intended for copying must be passed to a class in other ways.
	语法:
	myClass.setOptions([options]);

	参数:
	options - (object,optional) The user defined options to merge with the defaults.

	返回:
	(object) The current Class instance.

	示例:
	var Widget=new Class({
		Implements:Options,
		options:{
			color:'#fff',
			size:{
				width:100,
				height:100
			}
		},
		initialize:function(options){
			this.setOptions(options);
		}
	});
	var myWidget=new Widget({
		color:'#f00',
		size:{
			width:200
		}
	});
	//myWidget.options is now:{color:#f00,size:{width:200,height:100}}
	//Deep copy example
	var mySize ={
		width:50,
		height:50
	};
	var myWidget=new Widget({
		size:mySize
	});
	(mySize == myWidget.options.size) //false! mySize was copied in the setOptions call.

	注意:
	Relies on the default options of a Class defined in its options property.
#T=Events Method:removeEvents
	Removes all events of the given type from the stack of events of a Class instance. If no type is specified,removes all events of all types.
	语法:
	myClass.removeEvents([events]);

	参数:
	events - (optional) If not passed removes all events of all types.
		(string) The event name (e.g. 'success'). Removes all events of that type.
		(object) An object of type function pairs. Like the one passed to addEvents.

	返回:
	(object) The current Class instance.

	示例:
	var myFx=new Fx.Tween('myElement','opacity');
	myFx.removeEvents('complete');

	注意:
	removeEvents will not remove internal events. See Events:removeEvent.
#T= ┉ Options ┉
	A Utility Class. Its methods can be implemented with Class:implement into any Class. Used to automate the setting of a Class instance's options. Will also add Class Events when the option property begins with 'on' and is followed by a capital letter (e.g. 'onComplete' adds a 'complete' event). You will need to call this.setOptions() for this to have an effect,however.
	语法:
	For new classes:
	var MyClass=new Class({Implements:Options});

	For existing classes:
	MyClass.implement(Options);
#T=Options in combination with Events
	If a Class has Events as well as Options implemented,every option beginning with 'on' and followed by a capital letter (e.g. 'onComplete') becomes a Class instance event,assuming the value of the option is a function.
	示例:
	var Widget=new Class({
		Implements:[Options,Events],
		options:{
			color:'#fff',
			size:{
				width:100,
				height:100
			}
		},
		initialize:function(options){
			this.setOptions(options);
		},
		show:function(){
			//Do some cool stuff
			this.fireEvent('show');
		}
	});
	var myWidget=new Widget({
		color:'#f00',
		size:{
			width:200
		},
		onShow:function(){
			alert('Lets show it!');
		}
	});
	myWidget.show();//fires the event and alerts 'Lets show it!'
#T= 


#T= 动画
 动画
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=Option
	var opt={
		fps:60,
		link:'chain',//ignore,cancel,chain
		duration:'long',//'short':250ms;'normal':500ms;'long':1000ms
		transition:'bounce:out',//[:in][:out] - 'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'
		onStart:function(){console.log('开始!');},
		onComplete:function(){console.log('结束后!');}
	}
	$('b').set('morph',opt).morph({'width':500,'height':300});
#T=fade 渐隐渐显
	$('^!').fade('out');//in,out,show,hide,toggle(number)

	$('b').addEvents({
	        mouseenter:function(){
			  this.setStyle('color','white').fade('0.3');
			},
			mouseleave:function(){
			  this.setStyle('color','black').fade('1'); 
			}
 
     });
#T=highlight 颜色改变
	$('^!').highlight('#ff0000');
	$('^!').highlight('#ff0000','#00ff00');
#T=Morph 形状过渡
	$('b').addEvents({
		mouseenter:function(){
			this.morph({height:100,width:200});
		},
		mouseleave:function(){
			this.morph({'opacity':0.8}); 
		}
	});
	//or
	$('b').morph({height:100,width:200});
	//OR
	$Sel=$('b');
	var fn=function(){console.log('dddddd');}
	$Sel.setStyles({'width':'1px','height':'1px','border':'6px solid #DDD'}).set('morph',{
		duration:'long',
		onComplete:function(){
			$Sel.setStyles({
				'border':'6px solid #777'
			});
			Function.attempt(function(){
				if(fn){fn.attempt($Sel,$Sel);}
			});
		}
	}).morph({
		'width':500,
		'height':300
	});
	//OR
	var myFx=new Fx.Morph('b',{
		'height':200,
		'width':200,
		'background-color':'#f00',
		'opacity':0.8
	}).start({
		'height':[10,100],
		'width':[900,300]
	});
#T=Tween 在两个css值之间过渡
	$('b').tween('height',[10,200]);
	//OR
	$('b').set('tween',{transition:Fx.Transitions.Elastic.easeOut});
	$('b').tween('margin-top',100);
	//OR
	var myTransition=new Fx.Transition(function(pos,x){
		return 1 - Math.pow(Math.abs(Math.log(pos) / Math.log(x && x[0] || Math.E)),pos);
	},1.3);
	var myFx=new Fx.Tween('b',{
		property:'height',
		transition:myTransition.easeOut
	}).start(30,100);
	//OR
	$Sel=$('b');
	var fn=function(){console.log('dddddd');}
	$Sel.setStyles({'width':'1px','height':'1px','border':'6px solid #DDD'}).set('tween',{
		duration:'long',
		onComplete:function(){
			$Sel.setStyles({
				'border':'6px solid #777'
			});
			Function.attempt(function(){
				if(fn){fn.attempt($Sel,$Sel);}
			});
		}
	}).tween('height',[10,200]);
	//OR
	var myFx=new Fx.Tween('b',{
		'height':200,
		'width':200,
		'background-color':'#f00',
		'opacity':0.8
	}).start('background-color','#000','#0f0');
#T=连续动画
	var log=$('log');
	var fx=new Fx.Morph('box',{
		duration:1000,
		transition:Fx.Transitions.Quart.easeOut
	});
	$('start').addEvent('click',function(event){
		event.stop();
		log.set('html','starting...');
		fx.start({
			'width':300,
			'height':210
		}).chain(function(){
			log.set('html','First effect completed (1/5)');
			this.start({'opacity':.3});
		}).chain(function(){
			log.set('html','Second effect completed (2/5).<br>Waiting 5 seconds before starting third.');
			this.start.delay(5000,this,{'opacity':1});
		}).chain(function(){
			log.set('html','Third effect completed (3/5).<br>Waiting 2 seconds before starting fourth.');
			this.start.delay(2000,this,{'background-color':'#78BA91'});
		}).chain(function(){
			log.set('html','Fourth effect completed (4/5).<br>Waiting 1 second before starting fifth.');
			this.start.delay(1000,this,{'background-color':'#A87AAD','width':100,'height':70});
		}).chain(function(){
			log.set('html','Fifth effect completed (5/5).');
		});
	});
#T= 


#T= Fx
 Fx
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=构造
	语法:
	var myFx=new Fx([options]);

	参数:
	options - (object,optional) An object with options for the effect. See below.

	选项:
	fps - (number:默认是50) 每秒的帧数.
    unit - (string:默认是 false) 单位,可为 'px','em',或 '%'.
    link - (string:默认是 ignore) 可以是 'ignore','cancel' 和 'chain'.
        'ignore'-当请求正在执行之中时,新的请求将被忽略
        'cancel'-当请求正在执行之中时,将立即取消当前执行中的请求,开始执行新的请求
        'chain'-当请求正在执行之中时,将会把新的请求链接在当前请求之后,依次执行所有请求
    duration - (number:默认是 500) 相应的持续时间,除了数字外还可以为以下值:
        'short' - 250ms
        'normal' - 500ms
        'long' - 1000ms
	transition - (function:defaults to 'sine:in:out' The equation to use for the effect see Fx.Transitions. Also accepts a string in the following form:
	transition[:in][:out] - for example,'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'

	事件:
    onstart - (function) 当动画开始时触发.
    oncancel - (function) 当动画被取消时触发.
    oncomplete - (function) 当动画结束时触发.
    onchainComplete - (function) 如果使用了'chain'选项,则当所有的动画链结束时触发

	示例:
	var opt={
		fps:60,
		link:'chain',//ignore,cancel,chain
		duration:'long',//'short':250ms;'normal':500ms;'long':1000ms
		transition:'bounce:out',//'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out' - [:in][:out]
		onStart:function(){console.log('开始!');},
		onComplete:function(){console.log('结束后!');}
	}
	$('b').set('morph',opt).morph({'width':500,'height':300});

	注意:
	You cannot change the transition if you haven't included Fx.Transitions.js,(unless you plan on developing your own curve). ;)
	The Fx Class is just a skeleton for other Classes to extend the basic functionality.

	参见:
	Fx.Tween,Fx.Morph.
#T= ┉ Fx ┉
 ┉ Fx ┉
#T=start
	The start method is used to begin a transition. Fires the 'start' event.
	语法:
	myFx.start(from[,to]);

	参数:
	from - (mixed) The starting value for the effect. If only one argument is provided,this value will be used as the target value.
	to - (mixed,optional) The target value for the effect.

	返回:
	(object) - This Fx instance.

	示例:
	See examples in the documentation for each Fx subclass.

	注意:
	If only one parameter is provided,the first argument to start will be used as the target value,and the initial value will be calculated from the current state of the element.
	The format and type of this value will be dependent upon implementation,and may vary greatly on a case by case basis. Check each implementation for more details.
#T=set
	The set method is fired on every step of a transition. It can also be called manually to set a specific value to be immediately applied to the effect.
	语法:
	myFx.set(value);

	参数:
	value - (mixed) The value to immediately apply to the transition.

	返回:
	(object) - This Fx instance.

	示例:
	See examples in the documentation for each Fx subclass.
#T=cancel
	The cancel method is used to cancel a running transition. Fires the 'cancel' event.
	语法:
	myFx.cancel();

	返回:
	(object) - This Fx instance.

	Fx Method:pause

	Temporarily pause a currently running effect.
	语法:
	myFx.pause();

	返回:
	(object) - This Fx instance.

	注意:
	The timer will be stopped to allow the effect to continue where it left off by calling Fx:resume.
	If you call start on a paused effect,the timer will simply be cleared allowing the new transition to start.
#T=resume
	Resume a previously paused effect.
	语法:
	myFx.resume();

	返回:
	(object) - This Fx instance.

	注意:
	The effect will only be resumed if it has been previously paused. Otherwise,the call to resume will be ignored.
#T= ┉ Tween ┉ 补间动画
	var myFx=new Fx.Tween('Content',{//参数看Fx的构造
		fps:60,
		duration:'long'
	});
	myFx.set('tween',{unit:'%'});
	$('Content').addEvents({
		'mouseenter':f1,
		'mouseleave':f2,
		'click':f3
	});
	function f1(){
		myFx.set('background-color','#f00');
	}
	function f2(){
		myFx.start('background-color','#000','#0f0');
		//myFx.start('height',[20,200]);
	}
	function f3(){
		//$('Content').tween('height',[20,200]);
		myFx.start('height',[20,200]);
	}
#T=Tween Method:fade
	Element shortcut method for tween with opacity. Useful for fading an Element in and out or to a certain opacity level.
	语法:
	myElement.fade([how]);

	参数:
	how - (mixed,optional:defaults to 'toggle') The opacity level as a number or string representation. Possible values include:
		'in' - Fade the element to 100% opacity.
		'out' - Fade the element to 0% opacity.
		'show' - Immediately set the element's opacity to 100%.
		'hide' - Immediately set the element's opacity to 0%.
		'toggle' - If visible,fade the element out,otherwise,fade it in.
		(number) - A float value between 0 and 1. Will fade the element to this opacity.

	返回:
	This Element.

	示例:
	$('myElement').fade('out');//fades 'myElement' out.
	$('myElement').fade(0.7);//fades 'myElement' to 70% opacity.
#T=Tween Method:highlight
	Element shortcut method for tweening the background color. Immediately transitions an Element's background color to a specified highlight color then back to its set background color.
	语法:
	myElement.highlight([start,end]);

	参数:
	start - (string,optional:defaults to '#ff8') The color from which to start the transition.
	end - (string,optional:defaults to Element's set background-color) The background color to return to after the highlight effect.

	注意:
	If no background color is set on the Element,or its background color is set to 'transparent',the default end value will be white.

	返回:
	(element) This Element.

	示例:
	//immediately changes the background to light blue,then back to its original color (or white):
	$('myElement').highlight('#ddf');
	//immediately changes the background to light blue,then fades to grey:
	$('myElement').highlight('#ddf','#ccc');
#T= ┉ Morph ┉ 变形
	var myFx=new Fx.Morph('Content',{//参数看Fx的构造
		fps:60,
		duration:'long'
	});
	myFx.set('Content',{duration:'long',transition:'bounce:out'});
	$('Content').addEvents({
		'mouseenter':f1,
		'mouseleave':f2,
		'click':f3
	});
	function f1(){
		myFx.set({
			'height':200,
			'width':200,
			'background-color':'#f00',
			'opacity':0.8
		});
		myFx.morph({height:100,width:100});
	}
	function f2(){
		myFx.start({
			'height':[10,100],
			'width':[900,300]
		});
	}
	function f3(){
		myFx.start({
			'height':[200,900],
			'width':[200,600],
			'background-color':'#00f',
			'opacity':0.2
		});
	}
	//OR
	var el=$('myElement'),
	color=el.getStyle('backgroundColor');
	$('myElement').set('opacity',0.5).addEvents({
		mouseenter:function(){
			this.morph({
				'opacity':0.6,
				'background-color':'#E79D35'
			});
		},
		mouseleave:function(){
			this.morph({
				opacity:0.5,
				backgroundColor:color
			}).tween('height','20px');
		}
	});
	//OR
	$('b').set('morph',{
		duration:'long',
		onComplete:function(){alert('f');}
	}).morph({
		opacity:1,
		width:122,
		height:33
	});
#T=Morph Method:morph
	Animates an Element given the properties passed in.
	语法:
	myElement.morph(properties);

	参数:
	properties - (mixed) The CSS properties to animate. Can be either an object of CSS properties or a string representing a CSS selector. If only one value is given for any CSS property,the transition will be from the current value of that property to the value given.

	返回:
	(element) This Element.

	示例:
	$('myElement').morph({height:100,width:200});//针对Object

	针对选择器:
	$('myElement').morph('.class1');
#T= ┉ Transitions ┉ 快门
	var myTransition=new Fx.Transition(function(pos,x){
		return 1 - Math.pow(Math.abs(Math.log(pos) / Math.log(x && x[0] || Math.E)),pos);
	},1.3);
	var myFx=new Fx.Tween('Content',{
		property:'height',
		transition:myTransition.easeOut
	}).start(30,100);

	$('Content').set('tween',{transition:Fx.Transitions.Elastic.easeOut});
	$('Content').tween('margin-top',100);
#T= ┉ Method ┉
	Fx.Transitions Method:linear

	Displays a linear transition.
	Fx.Transitions Method:quad

	Displays a quadratic transition. Must be used as Quad.easeIn or Quad.easeOut or Quad.easeInOut.
	Fx.Transitions Method:cubic

	Displays a cubicular transition. Must be used as Cubic.easeIn or Cubic.easeOut or Cubic.easeInOut.
	Fx.Transitions Method:quart

	Displays a quartetic transition. Must be used as Quart.easeIn or Quart.easeOut or Quart.easeInOut.
	Fx.Transitions Method:quint

	Displays a quintic transition. Must be used as Quint.easeIn or Quint.easeOut or Quint.easeInOut
	Fx.Transitions Method:pow

	Used to generate Quad,Cubic,Quart and Quint.
	注意:
	The default is p^6.

	Fx.Transitions Method:expo

	Displays a exponential transition. Must be used as Expo.easeIn or Expo.easeOut or Expo.easeInOut.
	Fx.Transitions Method:circ

	Displays a circular transition. Must be used as Circ.easeIn or Circ.easeOut or Circ.easeInOut.
	Fx.Transitions Method:sine

	Displays a sineousidal transition. Must be used as Sine.easeIn or Sine.easeOut or Sine.easeInOut.
	Fx.Transitions Method:back

	Makes the transition go back,then all forth. Must be used as Back.easeIn or Back.easeOut or Back.easeInOut.
	Fx.Transitions Method:bounce

	Makes the transition bouncy. Must be used as Bounce.easeIn or Bounce.easeOut or Bounce.easeInOut.
	Fx.Transitions Method:elastic

	Elastic curve. Must be used as Elastic.easeIn or Elastic.easeOut or Elastic.easeInOut
	Class:Fx.Transition

	This class is only useful for math geniuses who want to write their own easing equations. Returns an Fx transition function with 'easeIn','easeOut',and 'easeInOut' methods.
	语法:
	var myTransition=new Fx.Transition(transition[,params]);

	参数:
	transition - (function) Can be a Fx.Transitions function or a user-provided function which will be extended with easing functions.
	params - (mixed,optional) Single value or an array for multiple values to pass as the second parameter for the transition function. A single value will be transformed to an array.

	返回:
	(function) A function with easing functions.

	示例:
	//Your own function. Here overshoot is bigger (now 1.3) when base -> 1 and base != 1.
	var myTransition=new Fx.Transition(function(pos,x){
		return 1 - Math.pow(Math.abs(Math.log(pos) / Math.log(x && x[0] || Math.E)),pos);
	},1.3);
	var myFx=new Fx.Tween('myElement',{
		property:'height',
		transition:myTransition.easeOut
	}).start(30,100);

	参见:
	Fx.Transitions
#T= 


#T= Event
 Event
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=例子
$('pcid').addEvent('change',function(i){
	i=i.target;
	alert(i.get('value')+'clicked!');
});
#T=构造
	语法:
	new DOMEvent([event[,win]]);

	参数:
	event - (event,required) An HTMLEvent Object.
	win - (window,optional:defaults to window) The context of the event.

	属性:
	page.x - (number) The x position of the mouse,relative to the full window.
	page.y - (number) The y position of the mouse,relative to the full window.
	client.x - (number) The x position of the mouse,relative to the viewport.
	client.y - (number) The y position of the mouse,relative to the viewport.
	rightClick - (boolean) True if the user clicked the right mousebutton
	wheel - (number) The amount of third button scrolling.
	relatedTarget - (element) The event related target.
	target - (element) The event target.
	code - (number) The keycode of the key pressed.
	key - (string) The key pressed as a lowercase string. key can be 'enter','up','down','left','right','space','backspace','delete',and 'esc'.
	shift - (boolean) True if the user pressed the shift key.
	control - (boolean) True if the user pressed the control key.
	alt - (boolean) True if the user pressed the alt key.
	meta - (boolean) True if the user pressed the meta key.

	示例:
	$('myLink').addEvent('keydown',function(event){
		//the passed event parameter is already an instance of the Event type.
		alert(event.target);
		alert(event.relatedTarget);
		alert(event.key);//returns the lowercase letter pressed.
		alert(event.shift);//returns true if the key pressed is shift.
		if(event.key == 's' && event.control) alert('Document saved.');//executes if the user presses Ctr+S.
	});

	注意:
	Accessing event.page / event.client requires the page to be in Standards Mode.
	Every event added with addEvent gets the MooTools method automatically,without the need to manually instance it.
#T= ┉ Method ┉
 ┉ Method ┉
#T=event.stop 中止执行事件的默认行为
	Stop an event from propagating and also executes preventDefault.
	语法:
	myEvent.stop();

	返回:
	(object) This DOMEvent instance.

	示例:
	<a id="myAnchor" href="http://google.com/">Visit Google.com</a>

	Js:
	$('myAnchor').addEvent('click',function(event){
		event.stop();//Prevents the browser from following the link.
		this.set('text','Where do you think you\'re going?');//'this' is Element that fires the Event.
		(function(){
			this.set('text','Instead visit the Blog.').set('href','http://blog.mootools.net');
		}).delay(500,this);
	});

	注意:
	Returning false within the function can also stop the propagation of the Event.

	参见:
	Element.addEvent,DOMEvent.stopPropagation,DOMEvent.preventDefault,Function:delay
#T=event.stopPropagation 停止事件的执行(停止事件在DOM结构中进行冒泡传递)
	意思是点击了内层的div后默认会冒泡执行外层div的事件,但是用了这个函数后会彻底终止冒泡
	Cross browser method to stop the propagation of an event (this stops the event from bubbling up through the DOM).
	语法:
	myEvent.stopPropagation();

	返回:
	(object) This DOMEvent object.

	示例:
	"#myChild" does not cover the same area as myElement. Therefore,the 'click' differs from parent and child depending on the click location:

	HTML:
	<div id="myElement">
		<div id="myChild"></div>
	</div>

	Js:
	$('myElement').addEvent('click',function(){
		alert('click');
		return false;//equivalent to stopPropagation.
	});
	$('myChild').addEvent('click',function(event){
		event.stopPropagation();//prevents the event from bubbling up,and fires the parent's click event.
	});

	参见:
	Element:addEvent
	MDC event.stopPropagation
#T=event.preventDefault 中止执行事件的默认行为
	Cross browser method to prevent the default action of the event.
	语法:
	myEvent.preventDefault();

	返回:
	(object) This DOMEvent object.

	示例:
	<form>
		<input id="myCheckbox" type="checkbox" />
	</form>

	Js:
	$('myCheckbox').addEvent('click',function(event){
		event.preventDefault();//checkbox永远无法被设定为"checked".
	});

	参见:
	Element:addEvent
	MDC event.preventDefault
#T=$('?').Events.shiftclick ={} 自定义事件
	You can add additional custom events by adding properties (objects) to the Element.Events Object
	参数:
	The Element.Events.yourProperty (object) can have:
		base - (string,optional) the base event the custom event will listen to. Its not optional if condition is set.
		condition - (function,optional) the condition from which we determine if the custom event can be fired. Is bound to the element you add the event to. The Event is passed in.
		onAdd - (function,optional) the function that will get fired when the custom event is added. Is bound to the element you add the event to.
		onRemove - (function,optional) the function that will get fired when the custom event is removed. Is bound to the element you add the event to.

	示例:
	Element.Events.shiftclick ={
		base:'click',//the base event type
		condition:function(event){//a function to perform additional checks
			return (event.shift == true);//this means the event is free to fire
		}
	};
	document.getElement('body').addEvent('shiftclick',function(event){
		alert('按住Shift然后点击左键');
	});
	Element.Events.ctrlpress ={
		base:'keydown',//the base event type
		condition:function(event){//a function to perform additional checks
			if(event.control){return (event.control == true);}
		}
	};
	window.addEvent('ctrlpress',function(event){
		alert('按了Ctrl键');
	});
	Element.Events.altpress ={
		base:'keydown',//the base event type
		condition:function(event){//a function to perform additional checks
			if(event.alt){return (event.alt == true);}
		}
	};
	window.addEvent('altpress',function(event){
		alert('按了alt键');
	});
	或
	Element.Events.shiftclick ={
		base:'click',//the base event type
		condition:function(event){//a function to perform additional checks
			return (event.shift == true);//this means the event is free to fire
		}
	};
	$('myInput').addEvent('shiftclick',function(event){
		log('the user clicked the left mouse button while holding the shift key');
	});

	注意:
	There are different types of custom Events you can create:
		Custom Events with only base:they will just be a redirect to the base event.
		Custom Events with base and condition:they will be redirect to the base event,but only fired if the condition is met.
		Custom Events with onAdd and/or onRemove and any other of the above:they will also perform additional functions when the event is added/removed.
	Since MooTools 1.3 this is a native JavaScript Object and not an instance of the deprecated Hash

	警告:
	If you use the condition option you NEED to specify a base type,unless you plan to overwrite a native event. (highly unrecommended:use only when you know exactly what you're doing).
#T=$('?').addEvent
	Attaches an event listener to a DOM element.
	语法:
	myElement.addEvent(type,fn);

	参数:
	type - (string) The event name to monitor ('click','load',etc) without the prefix 'on'.
	fn - (function) The function to execute.

	返回:
	(element) This Element.

	示例:
	<div id="myElement">Click me.</div>

	Js:
	$('myElement').addEvent('click',function(){
		alert('clicked!');
	});

	注意:
	You can stop the Event by returning false in the listener or calling Event:stop.
	This method is also attached to Document and Window.

	参见:
	w3schools Event Attributes
#T=$('?').removeEvent('?',function(){})
	Works as Element.addEvent,but instead removes the specified event listener.
	语法:
	myElement.removeEvent(type,fn);

	参数:
	type - (string) The event name.
	fn - (function) The function to remove.

	返回:
	(element) This Element.

	示例:
	var destroy=function(){alert('Boom:'+this.id);} //this refers to the Element.
	$('myElement').addEvent('click',destroy);
	//later...
	$('myElement').removeEvent('click',destroy);

	捆绑示例:
	var destroy=function(){alert('Boom:'+this.id);}
	var boundDestroy=destroy.bind($('anotherElement'));
	$('myElement').addEvent('click',boundDestroy);
	//later...
	$('myElement').removeEvent('click',destroy);//this won't remove the event.
	$('myElement').removeEvent('click',destroy.bind($('anotherElement'));//this won't remove the event either.
	$('myElement').removeEvent('click',boundDestroy);//the correct way to remove the event.

	注意:
	When the function is added using Function:bind or Function:pass,etc,a new reference is created. For removeEvent to work,you must pass a reference to the exact function to be removed.
	This method is also attached to Document and Window.
#T=$('?').addEvents('?',function(){})
	The same as Element:addEvent,but accepts an object to add multiple events at once.
	语法:
	myElement.addEvents(events);

	参数:
	events - (object) An object with key/value representing:key the event name,and value the function that is called when the Event occurs.

	返回:
	(element) This Element.

	示例:
	$('myElement').addEvents({
		mouseover:function(){
			alert('mouseover');
		},
		click:function(){
			alert('click');
		}
	});

	注意:
	This method is also attached to Document and Window.

	参见:
	Element:addEvent
#T=$('?').removeEvents('?')
	Removes all events of a certain type from an Element. If no argument is passed,removes all events of all types.
	语法:
	myElements.removeEvents([events]);

	参数:
	events - (optional) if not passed removes all events from the element.
		(string) The event name (e.g. 'click'). Removes all events of that type.
		(object) An object of type function pairs. Like the one passed to Element:addEvent.

	返回:
	(element) This Element.

	示例:
	var myElement=$('myElement');
	myElement.addEvents({
		mouseover:function(){
			alert('mouseover');
		},
		click:function(){
			alert('click');
		}
	});
	myElement.addEvent('click',function(){alert('clicked again');});
	myElement.addEvent('click',function(){alert('clicked and again:(');});
	//addEvent will keep appending each function.
	//Unfortunately for the visitor,there will be three alerts they'll have to click on.
	myElement.removeEvents('click');//saves the visitor's finger by removing every click event.

	注意:
	This method is also attached to Document and Window.

	参见:
	Element:removeEvent
#T=$('?').fireEvent('?',$('?'),1000)
	Executes all events of the specified type present in the Element.
	语法:
	myElement.fireEvent(type[,args[,delay]]);

	参数:
	type - (string) The event name (e.g. 'click')
	args - (mixed,optional) Array or single object,arguments to pass to the function. If more than one argument,must be an array.
	delay - (number,optional) Delay (in ms) to wait to execute the event.

	返回:
	(element) This Element.

	示例:
	//fires all the added 'click' events and passes the Element 'anElement' after one second
	$('myElement').fireEvent('click',$('anElement'),1000);

	注意:
	This will not fire the DOM Event (this concerns all inline events ie. onmousedown="..").
	This method is also attached to Document and Window.
#T=$('?').cloneEvents(?)
	Clones all events from an Element to this Element.
	语法:
	myElement.cloneEvents(from[,type]);

	参数:
	from - (element) Copy all events from this Element.
	type - (string,optional) Copies only events of this type. If null,copies all events.

	返回:
	(element) This Element.

	示例:
	var myElement=$('myElement');
	var myClone=myElement.clone().cloneEvents(myElement);//clones the element and its events

	注意:
	This method is also attached to Document and Window.
#T= ┉ 委托 ┉
 ┉ 委托 ┉
#T=myElement.addEvent('click:relay(a)',function(event,target){})
	Extends the Element type to include event-delegation in its event system.
	Event delegation is a common practice where an event listener is attached to a parent element to monitor its children rather than attach events to every single child element. It's more efficient for dynamic content or highly interactive pages with a lot of DOM elements.

	演示:
	Element.Delegation

	示例:
	An example of how delegation is usually applied. Delegation is extra useful when working with dynamic content like AJAX.

	var myElement=$('myElement');
	var request=new Request({
		//other options
		onSuccess:function(text){
			myElement.set('html',text);//No need to attach more click events.
		}
	});
	//Adding the event,notice the:relay syntax with the selector that matches the target element inside of myElement.
	//Every click on an anchor-tag inside of myElement executes this function.
	myElement.addEvent('click:relay(a)',function(event,target){
		event.preventDefault();
		request.send({
			url:target.get('href')
		});
	});

	注意:
	Delegation is especially useful if you are using AJAX to load content into your pages dynamically,as the contents of an element can change with new elements added or others removed and your delegated events need not change.
	By delegating events to parent objects you can dramatically increase the efficiency of your pages. Consider the example above. You could attach events to every link on a page - which may be hundreds of DOM elements - or you can delegate the event to the document body,evaluating your code only when the user actually clicks a link (instead of on page load/domready).
	You can use any selector in combination with any event
	Be wary of the cost of delegation;for example,mouseover/mouseout delegation on an entire document can cause your page to run the selector constantly as the user moves his or her mouse around the page. Delegation is not always the best solution.
	In general it is always better to delegate to the closest parent to your elements as possible;delegate to an element in the page rather than the document body for example.
#T=myElement.addEvent('click:relay(a.myStyle)',function(event,target){})
	Delegates the methods of an element's children to the parent element for greater efficiency when a selector is provided. Otherwise it will work like addEvent.
	语法:
	myElement.addEvent(typeSelector,fn);

	参数:
	typeSelector - (string) An event name (click,mouseover,etc) that should be monitored paired with a selector (see example) to limit functionality to child elements.
	fn - (function) The callback to execute when the event occurs (passed the event just like any other addEvent usage and a second argument,the element that matches your selector that was clicked).

	示例:
	//Alerts when an anchor element with class 'myStyle' is clicked inside of myElement
	document.id(myElement).addEvent('click:relay(a.myStyle)',function(){
		alert('hello');
	});
	document.id('myElement').addEvent('click:relay(a)',function(event,clicked){
		event.preventDefault();//don't follow the link
		alert('you clicked a link!');
		//You can reference the element clicked with the second
		//Argument passed to your callback
		clicked.setStyle('color','#777');
	});

	返回:
	element - This element.
#T=myElement.addEvents('?')
	Delegates the events to the parent just as with addEvent above. Works like addEvents.
	示例:
	$('myElement').addEvents({
		//monitor an element for mouseover
		mouseover:fn,
		//but only monitor child links for clicks
		'click:relay(a)':fn2
	});
#T=myElement.removeEvent('click:relay(a.myStyle)',function(event,target){})
	Removes a method from an element like removeEvent.
	示例:
	var monitor=function(event,element){
		alert('you clicked a link!');
	};
	$('myElement').addEvent('click:relay(a)',monitor);
	//link clicks are delegated to element
	//remove 委托:
	$('myElement').removeEvent('click:relay(a)',monitor);
#T=myElement.removeEvents('?')
	Removes a series of methods from delegation if the functions were used for delegation or else works like removeEvents.
	示例:
	var monitor=function(){
		alert('you clicked or moused over a link!');
	};
	$('myElement').addEvents({
		'mouseover:relay(a)':monitor,
		'click:relay(a)':monitor
	});
	//link clicks are delegated to element
	//remove委托:
	$('myElement').removeEvents({
		'mouseover:relay(a)':monitor,
		'click:relay(a)':monitor
	});
	//remove all click:relay(a) events
	$('myElement').removeEvents('click:relay(a)');
#T= ┉ Function ┉
 ┉ Function ┉
#T=DOMEvent.defineKey 预设一个事件key
	This function allows to add an additional event key code.
	示例:
	DOMEvent.defineKey(16,'shift');
	$('myInput').addEvent('keydown',function(event){
		if(event.key == 'shift') alert('You pressed shift.');
	});

	预设的keys:
	enter
	up
	down
	left
	right
	esc
	space
	backspace
	tab
	delete

	参见:
	MooTools More Keyboard
#T=DOMEvent.defineKeys 预设多个事件key
	This function allows to add additional event key codes.
	示例:
	DOMEvent.defineKeys({
		'16':'shift',
		'17':'control'
	});
	$('myInput').addEvent('keydown',function(event){
		if(event.key == 'control') alert('You pressed control.');
	});
#T= ┉ Event ┉
 ┉ Event ┉
#T=scrollTo
	Scrolls the element to the specified coordinated (if the element has an overflow). The following method is also available on the Window object.
	语法:
	myElement.scrollTo(x,y);

	参数:
	x - (number) The x coordinate.
	y - (number) The y coordinate.

	示例:
	$('myElement').scrollTo(0,100);

	参见:
	MDC Element:scrollLeft,MDC Element:scrollTop
#T=scroll
scroll
#T=resize
resize
#T=move
move
#T=reset
reset
#T=submit
submit
#T=error
error
#T=abort
abort
#T= 
 
#T=mousemove
mousemove
#T=mouseout
mouseout
#T=mouseover
mouseover
#T=mouseup
mouseup
#T=mousedown
mousedown
#T=mouseenter
mouseenter
#T=mouseleave
mouseleave
#T=mousewheel
mousewheel
#T=contextmenu
contextmenu
#T=DOMMouseScroll
DOMMouseScroll
#T=DOMContentLoaded
DOMContentLoaded
#T=readystatechange
readystatechange
#T= 
 
#T=domready
window.addEvent('domready',function(event){
	^!	
});
#T=load
	window.addEvent('load',function(event){
		^!
	});
#T=unload
unload
#T=beforeunload
beforeunload
#T= 
 
#T=selectstart
selectstart
#T=selectend
selectend
#T=keypress
	$('i7').addEvent('keypress',function(event){
		alert(event.key);
		alert('code:'+event.code);//按键的键盘代码
		alert('shift:'+event.shift);
		alert('control:'+event.control);
		alert('alt:'+event.alt);
		alert('meta:'+event.meta);

		//Ctr+S 组合键
		if(event.key == 's' && event.control){
			alert('Document saved.');
		}
	});
#T=blur
blur
#T=change
change
#T=click
click
#T=dblclick
dblclick
#T=focus
focus
#T=focusin
focusin
#T=focusout
focusout
#T=keydown
keydown
#T=keypress
keypress
#T=keyup
keyup
#T=keyup
keyup
#T= 


#T= 类似Jquery
 类似Jquery
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=Core扩展:类Jq
Element.implement({
	debug:function(msg){
		console.log(msg);
	},
	del:function(match){//destroy
		return this.match(match)?this.destroy():this;//console.log($$('a').remove());//console.log($$('span').del('.foo[href=#]'));
	},//SELECTOR
	brothers:function(match){//得到所有兄弟节点,但不包含自身
		return this.getParent().getChildren(match).erase(this);//$('f').brothers();
	},//ATTR
	text:function(text){
		return (typeOf(text)=='string') ? this.set('text',text):this.get('text');
	},
	html:function(value){
		return (typeOf(value)=='string')?this.set('html',value):this.get('html');
	},
	val:function(value){
		return (typeOf(value)=='string')?this.set('value',value):this.get('value');
	},
	attr:function(opt,value){
		switch(typeOf(opt)){
		case 'object':
			this.set(opt);break;
		case 'string':
			if(value){
				if(typeOf(value)=='function'){value=value.attempt(this,this);}//$('a').attr("js",function(){return 'eee';});
				this.set(opt,value);//$('a').attr("js","efe");
			}else{
				return this.get(opt);//console.log($('a').attr("js"));
			}
		}
		return this;
	},
	css:function(opt,value){
		switch(typeOf(opt)){
		case 'object':
			this.setStyles(opt);break;
		case 'string':
			if(typeOf(value)=='string'){//$('a').css('color','red');
				this.setStyle(opt,value);
			}else{//console.log($('a').css('color'));
				return this.getStyle(opt);
			}
		}
		return this;
	},
	data:function(opt,val){//读写临时值
		return val ? this.store(opt,val):this.retrieve(opt);//$('a').data('rel','da');alert($('a').data('rel'));
	},
	_into:function(content){//在Element内部所有内容之前插入元素节点或内容,父子
		switch(typeOf(content)){
			case 'element':content.inject(this,'top');break;//var my=new Element('a.myClass');$('a')._into(my);
			case 'string':this.set('html',content+this.get('html'));break;//$('a')._into('<b>html</b>');
		}
		return this;
	},
	into_:function(content){//在Element内部所有内容之后插入元素节点或内容,父子
		switch(typeOf(content)){
			case 'element':content.inject(this);break;//var my=new Element('a.myClass');$('a').into_(my);
			case 'string':this.set('html',this.get('html')+content);break;//$('a').into_('<b>html</b>');
		}
		return this;
	},
	_cut:function(el){//把Element剪切并粘贴到el内部所有内容之前,父子
		return this.inject($(el),'top');//$('t1')._cut($('t3'));
	},
	cut_:function(el){//把Element剪切并粘贴到el内部所有内容之后,父子
		return this.inject($(el));//$('t1').cut_($('t3'));
	},
	_move:function(el){//把el平移到Element之前,兄弟
		return el.inject(this,'before');//$('t1')._move($('t3'));
	},
	move_:function(el){//把el平移到Element之后,兄弟
		return el.inject(this,'after');//$('t1')._move($('t3'));
	},
	_xmove:function(el){//把Element平移到el之前,兄弟
		return this.inject($(el),'before');//$('t1')._xmove($('t3'));
	},
	xmove_:function(el){//把Element平移到el之后,兄弟
		return this.inject($(el),'after');//$('t1').xmove_($('t3'));
	},
	_replace:function(el){//Element被替换成了el
		el.replaces(this);//console.log($('a')._replace($('b')));
		return this;
	},
	replace_:function(el){//el被替换成了Element
		switch(typeOf(el)){
			case 'element':this.replaces(el);break;//console.log($('g').replace_($('t3')));
			//case 'string':$$(el).each(function(elem){this.clone(true).replaces(elem);},this);break;
		}
		return this;
	},
	wrap:function(el){//把Element剪切并粘贴到el内部所有内容之后,父子
		el.wraps(this);//$('t1').wrap($('t3'));
		return this;
	},
	xwrap:function(el){//把el剪切并粘贴到Element内部并把el的内容替换为Element的内容,父子
		var html=this.get('html');
		el.set('html',html).inject(this.empty());//$('t1').xwrap($('t3'));
		return this;
	},//Property
	height:function(val){
		if(val){return this.setStyle('height',val);}//$('b').height('100px');
		var props ={position:'absolute',visibility:'hidden',display:'block'};//console.log($('b').height());
		var value,el=this;
		var getHeight=function(){
			value=el.getStyle('height');//.toInt();
		}
		var $swap=function(el,options,fn){
			var old ={};
			for(var name in options){old[name]=el.style[name];el.style[name]=options[name];}//记忆旧的style,并插入新style
			fn.call(el);
			for(var name in options){el.style[name]=old[name];}//复原旧的style
		};
		if(this.getStyle('display') == 'none'){
			$swap(el,props,getHeight);
		}else{
			getHeight();
		}
		return value;
	},
	width:function(val){
		if(val){return this.setStyle('width',val);}//$('b').width('100px');
		var props ={position:'absolute',visibility:'hidden',display:'block'};//console.log($('b').width());
		var value,el=this;
		var getWidth=function(){
			value=el.getStyle('width');//.toInt();
		}
		var $swap=function(el,options,fn){
			var old ={};
			for(var name in options){old[name]=el.style[name];el.style[name]=options[name];}//记忆旧的style,并插入新style
			fn.call(el);
			for(var name in options){el.style[name]=old[name];}//复原旧的style
		};
		if(this.getStyle('display') == 'none'){
			$swap(el,props,getWidth);
		}else{
			getWidth();
		}
		return value;
	},
	offset:function(){
		var pos=this.getPosition();
		pos.left=pos.x;
		pos.top=pos.y;
		return pos;
	},
	position:function(){
		var pos=this.getPosition(this.getOffsetParent());
		pos.left=pos.x;
		pos.top=pos.y;
		return pos;
	},
	innerHeight:function(){
		return this.height().toInt()+this.getStyle('padding-top').toInt()+this.getStyle('padding-bottom').toInt();//console.log($('b').innerHeight());
	},
	innerWidth:function(){
		return this.width().toInt()+this.getStyle('padding-left').toInt()+this.getStyle('padding-top').toInt();//console.log($('b').innerWidth());
	},
	outerHeight:function(margin){
		return (!margin)?this.innerHeight()+this.getStyle('border-top').toInt()+this.getStyle('border-bottom').toInt():
			this.outerHeight()+this.getStyle('margin-top').toInt()+this.getStyle('margin-bottom').toInt()
	},
	outerWidth:function(margin){
		return (!margin)?this.innerWidth()+this.getStyle('border-left').toInt()+this.getStyle('border-right').toInt():
			this.outerWidth()+this.getStyle('margin-left').toInt()+this.getStyle('margin-right').toInt();
	},//EVENTS
	toggle:function(event,fn,fn2){
		var flag=true;
		return this.addEvent(event,function(){
			(flag ? fn:fn2).apply(this,arguments);
			flag=!flag;
		});
	},
	bind:function(type,fn){//$('a').bind('click mousewheel contextmenu',function(){alert('sh')}).alert('link');
		type.split(' ').each(function(event){
			this.addEvent(event,fn);
		},this);
		return this;
	},
	fire:function(type,args,tim){//$('b').fire('click',$('a'),4000);触发$('b')的事件
		return this.fireEvent(type,args,tim);
	},
	one:function(type,fn){//$('a').one('click',function(){alert('sh')}).alert('link');
		var removeOne=function(){this.removeEvent(type,fn).removeEvent(type,removeOne);}
		return this.addEvent(type,fn).addEvent(type,removeOne);
	},
	hover:function(fn1,fn2){//$('a').hover(function(){console.log('1')},function(){console.log('2')});
		return this.addEvents({
			'mouseenter':fn1,
			'mouseleave':fn2
		});
	},
	_Scroll:function(y){//执行滚动或获得滚动条的Top值
		return y?this.scrollTo(this.getScroll().x,y):this.getScroll().y;//console.log($('a')._Scroll(3));
	},
	Scroll_:function(x){//执行滚动或获得滚动条的Left值
		return x?this.scrollTo(x,this.getScroll().y):this.getScroll().x;//console.log($('a').Scroll_(3));
	},//METHOD
	show:function(speed,fn){
		if(this.getStyle('display') == 'none'){//$('b').show();
			if(speed){//$('b').show('long',function(){alert('ff')});
				var self=this;
				this.setStyles({opacity:0,display:''}).set('tween',{
					duration:speed,//'short':250ms;'normal':500ms;'long':1000ms
					onComplete:function(){
						if(fn){fn.attempt(self,self);}
					}
				}).tween('opacity',1);
			}else{
				this.setStyle('display','');
			}
		}
		return this;
	},
	hide:function(speed,fn){
		if(this.getStyle('display') != 'none'){//$('b').hide();
			if(speed){//$('b').hide('normal',function(){alert('ff')});
				var self=this;
				this.setStyle('opacity',1).set('tween',{
					duration:speed,//'short':250ms;'normal':500ms;'long':1000ms
					onComplete:function(){
						self.setStyle('display','none');
						if(fn){fn.attempt(self,self);}
					}
				}).tween('opacity',0);
			}else{
				this.setStyle('display','none');
			}
		}
		return this;
	},
	sh:function(){
		return (this.getStyle('display')!='none')?this.hide():this.show();
	},//动画
	_slide:function(speed,fn){//显示并展开Element
		if(this.getStyle('display')!='none'){return this;}
		var currentStyle=this.getStyles('height','overflow');
		var computedStyle={'height':this.height()};
		var self=this;
		this.setStyles({
			'height':1,
			'overflow':'hidden',
			'display':'block',
		}).set('tween',{
			duration:speed || 'normal',
			onComplete:function(){
				self.setStyles({
					'height':(currentStyle.height == 'auto')?'':computedStyle.height,
					'overflow':currentStyle.overflow
				});
				if(fn){fn.attempt(self,self);}
			}
		}).tween('height',computedStyle.height);
		return this;
	},
	slide_:function(speed,fn){//收缩并隐藏Element
		if(this.getStyle('display')=='none'){return this;}
		var currentStyle=this.getStyles('height','overflow');
		var self=this;
		this.setStyles({
			'overflow':'hidden',
			'display':'block',
		}).set('tween',{
			duration:speed || 'normal',
			onComplete:function(){
				self.setStyles({
					'display':'none',
					'height':(currentStyle.height == 'auto')?'':currentStyle.height,
					'overflow':currentStyle.overflow
				});
				if(fn){fn.attempt(self,self);}
			}
		}).tween('height',0);
		return this;
	},
	_slide_:function(speed,fn){//还有问题
		return (this.getStyle('display')=='none')?this._slide():this.slide_();
	},
	xshow:function(speed,fn){//淡入并显示Element
		if(this.getStyle('display')!='none'){return this;}
		var options ={};
		if(speed){options.duration=speed;}
		if(fn){options.onComplete=fn;}
		this.set('tween',options).fade('hide').setStyle('display','').fade('in');
		return this;
	},
	xhide:function(speed,fn){//淡出并隐藏Element
		if(this.getStyle('display')=='none'){return this;}
		var options ={};
		if(speed){options.duration=speed;}
		options.onComplete=function(){
			this.hide();
			if(fn){fn.attempt(this,this);}
		}.bind(this);
		this.set('tween',options).fade('out');
		return this;
	},
	xfade:function(speed,opacity,fn){//自定义
		var options ={};//$('b').xfade('long',0.4);//$('b').xfade('long','out');
		if(speed){options.duration=speed;}
		if(fn){options.onComplete=fn;}
		return this.set('tween',options).fade(opacity);
	},
	/*/
		var opt={
			fps:60,
			link:'chain',//ignore,cancel,chain
			duration:'long',//'short':250ms;'normal':500ms;'long':1000ms
			transition:'back:in',//[:in][:out] - 'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'
			onStart:function(){console.log('开始!');},
			onComplete:function(){console.log('结束后!');}
		}
		$('b').xmorph(opt,{'width':500,'height':300});
	/*/
	xmorph:function(opt,ani){//所有参数自定义
		var opts={
			'fps':60,
			'link':'chain',//ignore,cancel,chain
			'duration':'normal',//'short':250ms;'normal':500ms;'long':1000ms
			'transition':'linear'//,//[:in][:out] - 'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'
		}
		if(opt.fps){opts.fps=opt.fps;}
		if(opt.link){opts.link=opt.link;}
		if(opt.duration){opts.duration=opt.duration;}
		if(opt.transition){opts.transition=opt.transition;}
		if(opt.onStart){opts.onStart=opt.onStart;}
		if(opt.onComplete){opts.onComplete=opt.onComplete;}
		return this.set('morph',opts).morph(ani);
	},
	xlight:function(linkClass,opacity){
		opacity=(opacity)?opacity:.3;//$('a').xlight('t')
		linkClass=(linkClass.charAt(0)=='.')?linkClass:'.'+linkClass;
		this.addEvent('mouseover:relay('+linkClass+')',function(e,elem){
			$$(linkClass).each(function(link){
				if(elem!=link){link.tween('opacity',opacity);}
			});
		});
		this.addEvent('mouseout:relay('+linkClass+')',function(e,elem){
			$$(linkClass).each(function(link){
				link.tween('opacity',1);
			});
		});
	}
});//AJAX
$.extend({
	/*/
		$.ajax({
			type:"post",timeout:100,url:"@.php",data:"lat="+encodeURI('風景')+"&lng=Boston",
			error:function(msg){alert(msg);return false;},
			success:function(msg){
				if(msg.indexOf('Error:')!=-1){alert(msg);return false;}
				alert(msg+'|'+msg.length);
			}
		});
	/*/
	ajax:function(options){
		var request;
		options.method=options.type || options.method || 'get';
		if(options.complete){options.onComplete=options.complete;}
		if(options.error){options.onFailure=options.error;}
		if(options.success){options.onSuccess=options.success;}
		if(options.dataType && options.dataType.toLowerCase()=='html' && Request.HTML){
			request=new Request.HTML(options);
		}else if(options.dataType && options.dataType.toLowerCase()=='json' && Request.JSON){
			request=new Request.JSON(options);
		}else{
			request=new Request(options);
		}
		if(options.timeout){request.cancel.delay(options.timeout);}
		return request.send();
	}
});
#T=结构:类似Jq的事件模式
	//hash the element.natives so we can do stuff with it
	var hash=new Hash(Element.NativeEvents);
	//remove items that need to be replaced,add their replacements
	hash.erase('mouseover').erase('mouseout').erase('DOMMouseScroll');
	hash.include('mouseenter',1).include('mouseleave',1);
	//initialize this
	var eventHash=new Hash({});
	//for every event type,add to our hash
	hash.getKeys().each(function(event){
		eventHash[event]=function(fn){
			this.addEvent(event,fn);
			return this;
		}
	});
	//make it happen
	Element.implement(eventHash);

	/* examples */
	window.addEvent('domready',function(){
		$$('a').click(function(e){
			e.stop();
			alert('mouse click');	
		});
		$$('a').contextmenu(function(e){
			e.stop();
			alert('right click');	
		});
		$('myInput').keypress(function(e){
			alert('key pressed:'+e.key);
		});
	});
#T=结构:实现Jq的语法结构
	//a copy of jQuery.swap()
	//A method for quickly swapping in/out CSS properties to get correct calculations
	function $swap(el,options,fn){
		var old ={};
		//Remember the old values,and insert the new ones
		for (var name in options){
			old[name]=el.style[name];
			el.style[name]=options[name];
		}
		fn.call(el);
		//Revert the old values
		for(var name in options) el.style[name]=old[name];
	};
	Native.implement([Window,Document],{
		/*****   EVENTS   *****/
		ready:function(fn){
			window.addEvent('domready',fn);
			return this;
		},
		scroll:function(fn){
			return this.addEvent('scroll',fn);
		}
	});
	Window.implement({
		/*****   EVENTS   *****/
		load:function(fn){
			return this.addEvent('load',fn);
		},
		resize:function(fn){
			return this.addEvent('resize',fn);
		}
	});
	Native.implement([Element,Document,Window],{
		/*****   EVENTS   *****/
		bind:function(type,fn){
			type.split(' ').each(function(event){//accepts multiple event types!
				this.addEvent(event,fn);
			},this);
			return this;
		},
		one:function(type,fn){
			//TODO:Make this cleaner. Looks like a hack now.
			var removeOne=function(){
				this.removeEvent(type,fn).removeEvent(type,removeOne);
			}
			return this.addEvent(type,fn).addEvent(type,removeOne);
		},
		trigger:function(type,args){
			return this.fireEvent(type,args);
		},
		unbind:function(type,fn){
			return this.removeEvent(type,fn);
		},
		hover:function(fnOver,fnOut){
			return this.addEvents({
				'mouseenter':fnOver,
				'mouseleave':fnOut
			});
		}
	});
	//EVENTS - Event Helpers
	(function(type){
		var methods ={};
		type.each(function(name){
			if(!Native[name]) methods[name]=function(fn){
				var un_name=name.replace('_','');
				return fn ? this.addEvent(un_name,fn):this.fireEvent(un_name);
			};
		});
		Native.implement([Element,Document,Window],methods);
	})(['_blur','change','click','_click','dblclick','error','_focus','keydown','keypress','keyup','mousedown','mousemove','mouseout','mouseover','mouseup','_select','_submit','unload']);
	Element.implement({
		/*****   CORE   *****/
		data:function(property,value){
			return value ? this.store(property,value):this.retrieve(property);
		},
		/*****   ATTRIBUTES   *****/
		attr:function(prop,value){
			switch ($type(prop)){
				case 'object':
					this.set(prop);
					break;
				case 'string':
					if(value){
						//Note:first attempt() arg is supposed to be index of elements array,but can't be done in Mootools
						if($type(value)=='function') value=value.attempt(this,this);
						this.set(prop,value)
					}
					else return this.get(prop);
			}
			return this;
		},
		html:function(value){
			return value ? this.set('html',value):this.get('html');
		},
		text:function(text){
			return text ? this.set('text',text):this.get('text');
		},
		val:function(value){
			//Note:Array type value not implemented
			return value ? this.set('value',value):this.get('value');
		},
		/*****   TRAVERSING   *****/
		//Finding
		siblings:function(match){
			//solution from http://mootools.lighthouseapp.com/projects/2706/tickets/465-elementgetallsiblings#ticket-465-4
			return this.getParent().getChildren(match).erase(this);
		},
		/*****   MANIPULATION   *****/
		//Inserting Inside
		append:function(content){
			switch (typeOf(content)){
				case 'element':content.inject(this);break;
				case 'string':this.set('html',this.get('html')+content);break;
			}
			return this;
		},
		appendTo:function(el){
			return this.inject($(el));
		},
		prepend:function(content){
			switch ($type(content)){
				case 'element':content.inject(this,'top');break;
				case 'string':this.set('html',content+this.get('html'));break;
			}
			return this;
		},
		prependTo:function(el){
			return this.inject($(el),'top');
		},
		//Inserting Outside
		after:function(content){
			switch ($type(content)){
				case 'element':content.inject(this,'after');break;
				/* TODO:TextNode.inject is missing
				case 'string':
					var parent=this.getParent();
					var wrapper=new Element('div').wraps(this);
					wrapper.set('html',wrapper.get('html')+content);
					console.log(wrapper.childNodes);
					for (var i=0,k=wrapper.childNodes.length;i < k;i++){
						var node=wrapper.childNodes[i];
					}
					break;
				*/
			}
			return this;
		},
		insertAfter:function(el){
			return this.inject($(el),'after');
		},
		before:function(content){
			switch ($type(content)){
				case 'element':content.inject(this,'before');break;
				/* TODO:same as 'after'
				case 'string':this.set('html',content+this.get('html'));break;
				*/
			}
			return this;
		},
		_insertBefore:function(el){
			return this.inject($(el),'before');
		},
		//Inserting Around
		wrap:function(el){
			el.wraps(this);
			return this;
		},
		wrapInner:function(el){
			var html=this.get('html');
			el.set('html',html).inject(this.empty());
			return this;
		},
		//Replacing
		replaceWith:function(el){
			el.replaces(this);
			return this;
		},
		replaceAll:function(el){
			switch ($type(el)){
				case 'element':this.replaces(el);break;
				case 'string':
					$$(el).each(function(elem){
						this.clone(true).replaces(elem);
					},this);
					break;
			}
			return this;
		},
		//Removing
		remove:function(match){
			return this.match(match) ? this.dispose():this;
		},
		/*****   CSS   *****/
		//CSS
		css:function(property,value){
			switch ($type(property)){
				case 'object':
					this.setStyles(property);
					break;
				case 'string':
					if(value) this.setStyle(property,value)
					else return this.getStyle(property);
			}
			return this;
		},
		//Positioning
		offset:function(){
			var pos=this.getPosition();
			pos.left=pos.x;
			pos.top=pos.y;
			return pos;
		},
		position:function(){
			var pos=this.getPosition(this.getOffsetParent());
			pos.left=pos.x;
			pos.top=pos.y;
			return pos;
		},
		_scrollTop:function(y){
			return y ? this.scrollTo(this.getScroll().x,y):this.getScroll().y;
		},
		_scrollLeft:function(x){
			return x ? this.scrollTo(x,this.getScroll().y):this.getScroll().x;
		},
		height:function(val){
			if(val) return this.setStyle('height',val);
			var props ={position:'absolute',visibility:'hidden',display:'block'};
			var value,el=this;
			var getHeight=function(){
				value=el.getStyle('height').toInt();
			}
			if(this.getStyle('display') == 'none'){
				$swap(el,props,getHeight);
			}else{
				getHeight();
			}
			return value;
		},
		width:function(val){
			if(val) return this.setStyle('width',val);
			var props ={position:'absolute',visibility:'hidden',display:'block'};
			var value,el=this;
			var getWidth=function(){
				value=el.getStyle('width').toInt();
			}
			if(this.getStyle('display') == 'none'){
				$swap(el,props,getWidth);
			}else{
				getWidth();
			}
			return value;
		},
		innerHeight:function(){
			return this.height()+this.getStyle('padding-top').toInt()+this.getStyle('padding-bottom').toInt();
		},
		innerWidth:function(){
			return this.width()+this.getStyle('padding-left').toInt()+this.getStyle('padding-top').toInt();
		},
		outerHeight:function(margin){
			return (!margin) ? this.innerHeight()+this.getStyle('border-top').toInt()+this.getStyle('border-bottom').toInt():
				this.outerHeight()+this.getStyle('margin-top').toInt()+this.getStyle('margin-bottom').toInt()
		},
		outerWidth:function(margin){
			return (!margin) ? this.innerWidth()+this.getStyle('border-left').toInt()+this.getStyle('border-right').toInt():
				this.outerWidth()+this.getStyle('margin-left').toInt()+this.getStyle('margin-right').toInt();
		},
		/*****   EFFECTS   *****/
		//Basics
		show:function(speed,fn){
			if(this.getStyle('display') == 'none')
				if(speed){
					var currentStyle=this.getStyles('width','height','overflow');
					var computedStyle={'height':this.height()};
					var self=this;
					this.setStyles({
						'height':1,
						'overflow':'hidden',
						'display':'',
						'opacity':0
					});
					//calculate width here in case of width:auto,a little more special than height:auto
					computedStyle.width=this.width();
					this.setStyle('width',1).set('morph',{
						duration:speed,
						onComplete:function(){
							self.setStyles({
								'width':(currentStyle.width == 'auto') ? '':computedStyle.width,
								'height':(currentStyle.height == 'auto') ? '':computedStyle.height,
								'overflow':currentStyle.overflow
							});
							if(fn) fn.attempt(self,self);
						}
					}).morph({
						opacity:1,
						width:computedStyle.width,
						height:computedStyle.height
					});
				}
				else
					this.setStyle('display','');
			return this;
		},
		hide:function(speed,fn){
			if(this.getStyle('display') != 'none')
				if(speed){
					var currentStyle=this.getStyles('width','height','overflow');
					var self=this;
					this.setStyles({
						'overflow':'hidden'
					}).set('morph',{
						duration:speed,
						onComplete:function(){
							self.setStyles($extend(currentStyle,{'display':'none'}));
							if(fn) fn.attempt(self,self);
						}
					}).morph({
						opacity:0,
						width:0,
						height:0
					});
				}
				else
					this.setStyle('display','none');
			return this;
		},
		toggle:function(){
			return (this.getStyle('display') == 'none') ? this.show():this.hide();
		},
		//Sliding
		slideDown:function(speed,fn){
			if(this.getStyle('display') == 'none'){
				var currentStyle=this.getStyles('height','overflow');
				var computedStyle={'height':this.height()};
				var self=this;
				this.setStyles({
					'height':1,
					'overflow':'hidden',
					'display':'block',
				}).set('tween',{
					duration:speed || 'normal',
					onComplete:function(){
						self.setStyles({
							'height':(currentStyle.height == 'auto') ? '':computedStyle.height,
							'overflow':currentStyle.overflow
						});
						if(fn) fn.attempt(self,self);
					}
				}).tween('height',computedStyle.height);
			}
			return this;
		},
		slideUp:function(speed,fn){
			if(this.getStyle('display') != 'none'){
				var currentStyle=this.getStyles('height','overflow');
				var self=this;
				this.setStyles({
					'overflow':'hidden',
					'display':'block',
				}).set('tween',{
					duration:speed || 'normal',
					onComplete:function(){
						self.setStyles($extend(currentStyle,{'display':'none'}));
						if(fn) fn.attempt(self,self);
					}
				}).tween('height',0);
			}
			return this;
		},
		slideToggle:function(speed,fn){
			return (this.getStyle('display') == 'none') ? this.slideDown():this.slideUp();
		},
		//Fading
		fadeIn:function(speed,fn){
			if(this.getStyle('display') == 'none'){
				var options ={};
				if(speed) options.duration=speed;
				if(fn) options.onComplete=fn;
				this.set('tween',options).fade('hide').setStyle('display','').fade('in');
			}
			return this;
		},
		fadeOut:function(speed,fn){
			if(this.getStyle('display') != 'none'){
				var options ={};
				if(speed) options.duration=speed;
				options.onComplete=function(){
					this.hide();
					if(fn) fn.attempt(this,this);
				}.bind(this);
				this.set('tween',options).fade('out');
			}
			return this;
		},
		fadeTo:function(speed,opacity,fn){
			var options ={};
			if(speed) options.duration=speed;
			if(fn) options.onComplete=fn;
			return this.set('tween',options).fade(opacity);
		},
		//Fading
		animate:function(params,duration,easing,fn){//no easing.
			var opts=($type(duration) == 'object') ? duration:{
				'duration':duration || 'normal',
				'transition':easing || 'linear' //defaults to linear instead of sine
			}
			if(fn) opts.onComplete=fn;
			return this.set('morph',opts).morph(params);
		}
	}).alias({
		//CORE - Data Cache
		eliminate:'removeData',
		//ATTRIBUTES - Attr
		removeProperty:'removeAttr',
		//TRAVERSING - Filtering
		match:'is',
		//TRAVERSING - Finding
		getChildren:'children',
		getElements:'find',
		getNext:'next',
		getAllNext:'nextAll',
		getParent:'parent',
		getParents:'parents',
		getPrevious:'prev',
		getAllPrevious:'prevAll',
		//AJAX - Misc
		toQueryString:'serialize'
	});
	Elements.implement({
		/*****   MANIPULATION   *****/
		//Inserting Around
		wrapAll:function(el){
			this.each(function(elem){
				el.wraps(elem);
			});
			return this;
		},
		//Removing
		remove:function(match){
			if(match) this.filter(match).dispose();
			else return this.dispose();
			return this;
		}
	});
	//Durations
	//'normal' are overriden from 500 to 400
	//added 'default' for the old 500
	//'long' and 'short' are still around
	$extend(Fx.Durations,{'fast':200,'normal':400,'slow':600,'default':500});
	/*****   SELECTORS   *****/
	Selectors.Pseudo.extend({
		//Form Filters
		enabled:function(){
			return !this.disabled;
		},
		disabled:function(){
			return this.disabled;
		},
		//http://davidwalsh.name/create-custom-pseudo-selector-mootools-selected
		selected:function(){
			return this.selected;
		}
	});
	/*****   AJAX   *****/
	//Ajax Request
	$.extend({
		ajax:function(options){
			var request;
			options.method=options.type || options.method || 'get';//default is 'get' for jQuery
			if(options.complete) options.onComplete=options.complete;
			if(options.error) options.onFailure=options.error;
			if(options.success) options.onSuccess=options.success;
			if(options.dataType && options.dataType == 'html' && Request.HTML) request=new Request.HTML(options);
			else if(options.dataType && options.dataType == 'json' && Request.JSON) request=new Request.JSON(options);
			else request=new Request(options);
			if(options.timeout) request.cancel.delay(options.timeout);
			return request.send();
		},
		get:function(url,data,fn,type){
			if($type(data) == 'function'){
				fn=data;
				data=null;
			}
			var request;
			var options ={
				url:url,
				data:data,
				onSuccess:fn,
				dataType:type
			};
			return this.ajax(options);
		},
		getJSON:function(url,data,fn){
			return this.get(url,data,fn,'json');
		},
		post:function(url,data,fn,type){
			if($type(data) == 'function'){
				fn=data;
				data=null;
			}
			var request;
			var options ={
				method:'post',
				url:url,
				data:data,
				onSuccess:fn,
				dataType:type
			};
			return this.ajax(options);
		}
	});
#T= 


#T= 我的插件
 我的插件
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=小星星評分插件
var xStar=new Class({
	//实现Events类，因为之后在点击的时候可以触发一个事件
	Implements:Events,
	//构造函数
	//where 要加入的位置，where可传递dom、Element对象或者元素的id字符串
	//store 可选,默认分数，如果不输入默认为5分
	//name  可选，创建xStar对象的时候会创建一个input hidden对象，name为对象的
	//	    name属性，不不输入默认为rating。
	//starnum 可选,星星的数量,不输入默认为10
	initialize:function(where,store,name,starnum){
		store=store||5;
		me=this;
		me.enable=true;
		me.starnum=starnum||10;
		where=$(where);
		//创建div对象，用来放置星星
		var rat=new Element("div",{styles:{height:20,cursor:"pointer"}});
		//创建input hidden对象。
		var ivalue=new Element("input",{
			type:"hidden",
			name:name||"rating",
			value:store
		});
		me.ivalue=ivalue;
		//把input hidden对象插入到上面创建的div里面
		ivalue.inject(rat);
		rat.inject(where);
		//创建星星图片
		me.stars=[];
		for(var i=0;i<me.starnum;i++){
			var img=new Element("img",{styles:{width:16,height:16}});
			(function(n){
				//为星星图片添加事件
				img.addEvents({
					'mouseover':function(){if(me.enable) me.setStar(n+1,1);},//鼠标移上
					'mouseout':function(){if(me.enable) me.setStar(me.ivalue.get("value"),2);},//鼠标移开
					'click':function(){if(me.enable) me.setStar(n+1);}//点击
				});
			})(i);
			me.stars.push(img);
			//把图片插入到div
			img.inject(rat);
		}
		//设置初始的分数，同时也是为图片加上src属性
		me.setStar(store,2);
	},
	//设置分数
	//n 分数
	//t 有三种选择，其中两种为内部调用，外部调用的时候，请不要轻易设置
	//  当t为1时，只改变图片，不改变input hidden的值,用于鼠标移上的事件
	//  当t为2时，改变图片，并且改变input hidden的值,用于鼠标移出恢复值
	//  不设置t的时候，改变图片，改变input hidden的值，并触发事件,用于点击鼠标选中的时候
	setStar:function(n,t){
		if(!this.enable) return;
		n=n.toInt();
		//改变图片
		if(n>0&&n<=me.starnum){
			for(var i=1;i<=me.starnum;i++){
				if(i<=n){
					this.stars[i-1].set("src","@img/star_done.png");
				}else{
					this.stars[i-1].set("src","@img/star_un.png");
				}
			}
			//是否改变input hidden的值
			if(t!==1){
				this.ivalue.set("value",n);
				//是否触发事件
				if(t!==2){
					//触发事件，因为上面实现了Events，所以这里可以触发事件
					this.fireEvent("rate");
				}
			}
		}
	},
	//得到分数
	getStar:function(){
		return this.ivalue.get("value");
	},
	//设置是否可用
	setEnable:function(b){
		this.enable=!!b;
	}
});

document.addEvent("domready",function(){
	//创建一个对象，放在ratingtest下，默认为5分，input hidden对象name为store
	var rating=new xStar("ratingtest",5,"store");
	//添加rate事件，当选择5分的时候，设置为不可用状态
	rating.addEvent("rate",function(){
		alert(this.getStar());
		if(this.getStar()==5){
			this.setEnable(false);
			alert('評分被禁用了,請點擊Enable按鈕!');
		}
	});
	
	//添加按钮点击事件，设置为可用
	$("enable").addEvent("click",function(){
		rating.setEnable(true);
	});
});

</script> 
<div id="ratingtest">评分:</div><div><input type="button" id="enable" value="enable"></div>
</body>
#T=我開發的閃爍的標題
/**
插件:閃爍的標題
描述:該插件可以輕鬆讓您的<title>標題實現閃爍效果
參數:
	tit:(必填)需要在<title>上閃爍的內容
	tim:[可選]閃動頻率,多少毫秒閃動一次
	delay:[可選]延遲多少毫秒停止閃動
注意:
	不管是變量還是方法,只要前邊有下劃綫的均為私有
用法:
	a=new xTitle();
	a.Start({tit:'【短消息】',tim:200,delay:6000});
/**/
var xTitle=new Class({
	Implements:[Options,Events],
	Opt:{
		tim:280,	//閃動頻率,多少毫秒閃動一次
		tit:'',		//要閃動的內容
		delay:null,	//延遲多少毫秒停止閃動
		_mess:'',	//全局標示符,標記現在需要閃動的內容
		_title:'',	//原始標題,即<title>標籤內的原始值
		_timer1:'',	//計時器句柄1
		_timer2:''	//計時器句柄2
	},
	initialize:function(Opt){//初始化构造函数
		this.setOptions(Opt);//設置Options
		if(!this.Opt.tit){return false;}
	},
	_run:function(){
		this.Opt._mess=(this.Opt._mess=='') ? this.Opt.tit : '';
		$(document).getElement('title').set('text',this.Opt._mess+' '+this.Opt._title);
		this.Opt._timer1=this._run.delay(this.Opt.tim,this);
	},
	_stop:function(){
		clearTimeout(this.Opt._timer1);
		clearTimeout(this.Opt._timer2);
		$(document).getElement('title').set('text',this.Opt._title);
		return false;
	},
	Start:function(o){
		if(!o){return false;}

		this.Opt._title=$(document).getElement('title').get('text');

		this.Opt.tim=(o.tim && !isNaN(o.tim)) ? o.tim.toInt() : this.Opt.tim;
		this.Opt.delay=(o.delay && !isNaN(o.delay)) ? o.delay.toInt() : this.Opt.delay;
		this.Opt.tit=(o.tit) ? o.tit : this.Opt.tit;
		if(this.Opt.delay){
			this.Opt._timer2=(this._stop.delay(this.Opt.delay,this));
		}
		this._run();
	}
});
a=new xTitle();
a.Start({tit:'【短消息】'});
#T=我開發的手風琴插件(Class)
	<style type="text/css">
		ul,li{font-size:12px;font-family:arial;padding:0;margin:0;}
		ul{width:300px;line-height:24px;font-weight:bold;background-color:#C1C2C1;border-bottom:1px solid #fff;text-indent:10px;}
		li{list-style:none;font-weight:normal;background-color:#e1e1e1;}
	</style>
	</head>

	<body>
	<ul>Title1
		<li>11111</li>
	</ul>
	<ul>Title2
		<li>22222</li>
	</ul>
	<ul>Title3
		<li>33333</li>
	</ul>
	<ul>Title4
		<li>44444</li>
	</ul>
	<script type='text/javascript'>
	var Acc=new Class({
		Implements:[Options,Events],
		options:{
			$Boxtit:false
		},
		initialize:function(options){//初始化构造函数
			this.setOptions(options);//設置options
			if(!this.options.$Boxtit){return false;}
			this.Core();
		},
		Core:function(){
			$Boxtit=this.options.$Boxtit;
			$Boxmsg=$Boxtit.getElement('li');
			$Boxmsg.setStyle("display","none");
			$Boxtit.each(function($I,i1){
				$I.onclick=function(){
					//i2=$Boxtit.indexOf(this);console.log(i1+'|'+i2);//這裡的i1和i2實際上都是索引值
					$Boxmsg.setStyle("display","none");
					this.getElement('li').setStyle("display","");
				};
			})
		}
	});
	new Acc({$Boxtit:$$('ul')});
#T=通用Ajax保存(Function)
	/*/
		ActiveEdt(this,"arg=4‖items‖id=123‖|‖0‖7","welcome.php","jedit","POST",_Val);//表,需要寫入的欄位,where條件,一个fieldset包含多个值的分割,需要操作的索引,拆分後的最大字段個數
		onchange='ActiveEdt(this,"id=2","","tst.php");'
		$("id").blur(function(){ActiveEdt(this,"id=3");})
	/*/
	//通用ajax靜態編輯內容(只能針對不可確定ID的input;select;textarea對象),可理解為function
	//_this被操作對象(或id),ajax參數,ajax处理文件,work參數值,ajax提交方式,值(如果有傳值則以此為准,否則程序讀取)
	var ActiveEdt=function(_this,_action,_file,_work,_method,_V){
		if(!_this){return;}
		i=$(_this);
		if(!_work){_work='jedit';}
		if(!_file){_file='sys.php';}
		if(!_method){_method='POST';}_method=_method.toUpperCase();
		var _value = i.getProperty('value');

		//數字輸入欄位判斷
		try{
			_Isnum=i.getProperty('isnum');
			_Isnum=(!_Isnum)?"":_Isnum.toLowerCase();
		}catch(e){}
		if(_Isnum=='true'){
			if(_value==''){Pop(i,{htm:'Warring:該欄位必須要填寫數字!',pos:3,tim:1500});return false;}
			if(isNaN(_value)){
				i.setProperty("value","");
				Pop(i,{htm:'Warring:該欄位必須要填寫數字!',pos:3,tim:1500});
				return false;
			}
		}
		if(!_V){_V=encodeURI(_value);}else{_V=encodeURI(_val);}
		$.ajax({
			type:_method,url:_file,timeout:1000,
			data:"work="+_work+"&value="+_V+"&"+_action,
			error:function(msg){alert(msg);return false;},
			success:function(msg){
				if(msg.indexOf('Error:')!=-1){alert(msg);return false;}
				Pop(i,{htm:'OK:操作成功!',pos:3,tim:600});
			}
		});
	};
#T=Tab选项卡
	<script type='text/javascript' src='img/mootools-core-1.4.1-full-nocompat.js'></script>
	<script type='text/javascript' src='img/mootools-more.js'></script>
	<style type='text/css'>
		*{margin:0;padding:0;}
		body{font:12px verdana;}
		a{text-decoration:none;}
		a:focus{outline:0;}
		
		#Tabbox ul{list-style:none;}
		#Tabbox ul li a{color:white;overflow:hidden;display:block;padding:4px;}
		#Tabbox #Tabtit{overflow:hidden;}
		#Tabbox #Tablst{background:#E10200;padding:10px;margin:0 0 15px 0;-moz-box-shadow:0 0 5px #666;-webkit-box-shadow:0 0 5px #666;}
		#Tabbox #Tabtit li{width:75px;float:left;margin:0 10px 0 0;}
		#Tabbox #Tabtit li a{-moz-box-shadow:0 0 5px #666;-webkit-box-shadow:0 0 5px #666;display:block;padding:5px;background:#666;color:white;font-size:11px;text-align:center;}
		#Tabbox #Tabtit li a.current{background-color:#E10200 !important;font-weight:bold;}
	</style>
	</head>
	<body>
	<div style="width:415px;margin:20px auto;">

		<div id="Tabbox">
			<ul id="Tabtit">
				<li><a boxid="box1" href="#" class="current">Current</a></li>
				<li><a boxid="box2" href="#">MooTools</a></li>
				<li><a boxid="box3" href="#">Lastbox</a></li>
			</ul>
			<div id="Tablst">
				<!---->
				<ul id="box1">
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				</ul>

				<!---->
				<ul id="box2" class="hide">
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				</ul>

				<!---->
				<ul id="box3" class="hide">
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				<li><a href="#">HTML5入门之新标签的解析</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script>

	var mooTab=new Class({
		Implements:[Options,Events],
		options:{
			$Boxtit:false,
			$Boxlst:false
		},
		initialize:function(options){//初始化构造函数
			this.setOptions(options);//set options
			if(!this.options.$Boxtit || !this.options.$Boxlst){return false;}
			this.Core();
		},
		Core:function(){
			$Boxtit=this.options.$Boxtit;
			$Boxlst=this.options.$Boxlst;
			var $Handle=$Boxtit.getElements('li > a');
			$Boxlst.getElements('.hide').setStyles({
				"position":"relative","top":0,"left":0,"display":"none"
			});
			$Handle.each(function($unit){
				$unit.addEvent('click',function(event){
					event.stop();
					var $i=this;
					var $lid=this.getProperty("boxid");
					var $Cur=$Boxtit.getElement("a.current");
					var $CurrHi=$Boxlst.height();
					var $CurrId=$Cur.getProperty("boxid");
					$Cur.removeClass("current");
					$i.addClass("current");
					$Boxlst.setStyle('height',$CurrHi);
					if(($lid!=$CurrId)){
						var newHeight=$($lid).height();
						$Boxlst.tween('height',newHeight);
						$($CurrId).setStyles({display:'none'}).fade('out');
						$($lid).setStyles({display:'block'}).fade('in');
					}
					return false;
				});
			})
		}
	});

	new mooTab({
		$Boxtit:$('Tabbox').getElementById('Tabtit'),
		$Boxlst:$('Tabbox').getElementById('Tablst')
	});
	</script>
#T=插件:替代alt
	<style type="text/css">
	#tooltip-container{position:absolute;width:200px;display:inline-block;z-index:20;visibility:hidden;}
	#tooltip-arrow-up{height:0;width:0;overflow:hidden;font-size:0;line-height:0;border-color:transparent transparent #2f2f2f transparent;border-style:dashed dashed solid dashed;border-width:5px;margin:0 auto;}
	#tooltip-content{color:#fff;background:#2f2f2f;padding:5px 10px;font-size:1em;text-align:center;-webkit-border-radius:5px;-moz-border-radius:5px;}
	</style>
	</head>

	<body>
	<a class="tooltip" href="http://cssrainbow.cn/category/tutorials" title=" MooTools,jQuery,HTML,CSS">Tutorials</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/articles" title="General ,Web Roundups"> Articles </a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/demos" title="演示 & 下载">Downloads</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/code-snippets" title="代码片段 & 小技巧"> Code Snippets</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/toy-bricks" title="[积木] 标准化项目"> Toy Bricks</a>
	<script>
		var makeTooltips=function(){
			var container,top,content,originalWidth;
			if(!$('tooltip-container')){
				container=new Element('div',{'id':'tooltip-container'}).inject(document.body,'top');
				top=new Element('div',{'id':'tooltip-arrow-up'}).inject(container);
				content=new Element('div',{'id':'tooltip-content'}).inject(container);
			}else{
				container=$('tooltip-container');
				top=$('tooltip-arrow-up');
				content=$('tooltip-content');
			}
			originalWidth=container.getStyle('width').toInt();
			$$('.tooltip').each(function(el){
				var text=el.retrieve('tooltipText') || el.get('title');
				el.set('title','').removeClass('tooltip').store('tooltipText',text).addEvents({
					mouseenter:function(){
						container.setStyle('width',(el.get('tooltipWidth') || originalWidth)+'px');
						var coords=el.getCoordinates();
						container.setStyles({
							left:coords.left - (container.getSize().x / 2)+(coords.width / 2),
							top:coords.top+coords.height+5
						});
						content.set('text',text);
						container.fade(0.9);
					},
					mouseleave:function(){container.fade(0);}
				});
			});
		};
		document.addEvent('domready',function(){
			makeTooltips();
		});
	</script>
#T=跟随鼠标背景图移动
	<script style="text/javascript" src="https://ajax.googleapis.com/ajax/libs/mootools/1.4.1/mootools-yui-compressed.js"></script>
	</head>

	<body id='a'>
	<h2 class='a'>Single images</h2>
	<div id='bsfdimg' style='background:url("http://www.eg-live.com.tw/@upload/2182/07_7e4cb.jpg") no-repeat scroll -50px -50px transparent;width:260px;height:200px;' w='392' h='600'></div>
	<script type='text/javascript'>
	var MoveBKimg=new Class({
		initialize:function(){
			this.$L=0;
			this.$T=0;
		},
		Todo:function(i,opt){
			this.opt={
				bw:opt.bw || 0,	//容器宽度
				bh:opt.bh || 0,
				iw:opt.iw || 0,	//图像宽度
				ih:opt.ih || 0,
				X:opt.X || 0,	//鼠标的clientX坐标
				Y:opt.Y || 0
			};o=this.opt;
			if(!i || !o.iw || !o.ih || !o.bw || !o.bh){return false;}

			o.iw=o.iw-o.bw;		//图像实际可被移动的x轴范围
			o.ih=o.ih-o.bh;

			var P=i.getStyle('background-position');P=P.split(" ");//取得目前背景图的position值,并拆分转为Int型
			P[0]=P[0].toInt();P[0]=(P[0].abs()>o.iw)?((P[0]<0)?-o.iw:o.iw):P[0];//背景图目前的X偏移,并对值进行2次修正
			P[1]=P[1].toInt();P[1]=(P[1].abs()>o.ih)?((P[1]<0)?-o.ih:o.ih):P[1];

			console.log(o.X+'|'+o.Y);
			if(o.X>this.$L){//往右移鼠标图片往左跑
				this.$L=o.X;
				P[0]=(o.iw<(P[0]-10))?o.iw:(P[0]-10);
			}
			if(o.X<this.$L){//往左移鼠标图片往右跑
				this.$L=o.X;
				P[0]=((P[0]+10)>0)?0:(P[0]+10);
			}
			if(o.Y>this.$T){//往下移鼠标图片往上跑
				this.$T=o.Y;
				P[1]=(o.ih<(P[1]-10))?o.ih:(P[1]-10);
			}
			if(o.Y<this.$T){//往上移鼠标图片往下跑
				this.$T=o.Y;
				P[1]=((P[1]+10)>0)?0:(P[1]+10);
			}
			i.setStyle('background-position',''+P[0]+'px '+P[1]+'px');//重新给背景图的position赋值
		}
	});

	El=$('bsfdimg');
	var MoveBKimg=new MoveBKimg();
	El.addEvent('mousemove',function(event){
		MoveBKimg.Todo(El,{bw:260,bh:200,iw:392,ih:600,X:event.client.x,Y:event.client.y});
	})
#T= 
 
#T=扩展方法
扩展方法
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=扩展给$
	$.extend({
		aa:function(){
			alert('ff');
		}
	});$.aa();
#T=扩展给Element
	Element.implement({
		aa:function(){
			alert('ff');
		},
		getFirst:function(expression){
			return document.id(Slick.search(this, injectCombinator(expression, '>'))[0]);
		}
	});
#T=扩展给Array
	Array.implement({
		aa:function(){
			alert('ff');
		}
	});[1].aa();
#T=扩展给String
	String.implement({
		aa:function(){
			alert('ff');
		}
	});'a'.aa();
#T=扩展给Number
	Number.implement({
		aa:function(){
			alert('ff');
		}
	});(12).aa();
#T=给指定Function扩展新方法或属性
	var arr=[];
	var Fun=function(){
		arr=[1,2];
	};
	Fun.extend({
		len:function(){//给Fun扩展属性
			return arr.length;
		},
		add:function(val){//给Fun扩展方法
			arr.push(val);
		}
	});

	var a=Fun.len(arr);
	alert(a+'|'+arr);//此时输出:0|

	Fun();//调用此函数给arr赋值

	var a=Fun.len();
	alert(a+'|'+arr);//此时输出:2|1,2

	Fun.add('新的');

	var a=Fun.len();
	alert(a+'|'+arr);//此时输出:3|1,2,新的

	Fun.add(['a','b','c']);

	var a=Fun.len();
	alert(a+'|'+arr);//此时输出:4|1,2,新的,a,b,c
#T=扩展新Function
	//扩展新的Function
	var a=function(){};
	var b=function(){};
	Function.implement({
		alert:function(msg){
			alert(msg);
		},
		output:function(msg){
			console.log(msg);
		}
	});
	a.alert('1');
	a.output('2');
	b.output('3');
#T=扩展给Object
	var O={a:0,b:1};
	Object.extend({
		aa:function(O){
			alert(O.b+'a');
		}
	});Object.aa(O);
#T=扩展给Window
	Window.implement({
		aa: function(){
			alert('f');
		}
	});window.aa();
#T=扩展给Document
	Document.implement({
		aa: function(){
			alert('f');
		}
	});document.aa();
#T=扩展给DOMEvent
	DOMEvent.implement({
		aa:function(){
			alert('f');
		}
	});
	window.addEvent('click',function(e){
	e.aa();
	});
#T=扩展给Class
	var Animal=new Class({
		initialize:function(age){
			this.age=age;
		}
	});
	Animal.implement({
		setName:function(name){
			this.name=name;
		}
	});
	var myAnimal=new Animal(20);
	myAnimal.setName('Micia');
	alert(myAnimal.name);//alerts 'Micia'
#T=扩展给
	.implement({
		aa:function(){
			alert('ff');
		}
	});
#T=批量扩展方法
	[Element,Window,Document].invoke('implement',{
		typ:function(o){
			alert(typeOf(o));
		}
	});
	document.getElement('body').typ('str');
	var J={"_5":"停","_4":"W\\i","_3":"麥\/克"};
	window.typ(J);
#T= 
 
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=自定事件
	MooTools 的灵活性之一就是可以自由的扩展,我们也可以创建自己的自定义事件我们只需要给 Element.Events 对象扩展相应的属性就可以自定义事件了

	Element.Events.eventname={
		'base':'click',//A base event such as click, keypress,keydown, onload, etc.
		'condition':function(){
		//conditions that need to be met to trigger event
		},
		'onAdd':function(){
		//Functions to trigger when you bind/add the event to elements
		},
		'onRemove':function(){
		//Functions to execute when you unbind/remove elements
		}
	};

	eventname: 这是自定义事件的名称
	自定义一个事件时, Element.Events.eventname中可包含如下内容:
		base – (string, 可选) 自定义事件所监听的基类事件. 如果指定了下面condition参数,则本参数必须填写
		condition – (function, 可选) 自定义事件触发的条件函数 (函数的参数为一个Event实例)
		onAdd – (function, 可选) 当元素添加自定义事件时触发的函数 (函数的参数为一个Event实例)
		onRemove – (function, 可选) 当元素删除自定义事件时触发的函数 (函数的参数为一个Event实例)

	创建一个自定义的事件
	MooTools custom event "outerClick".
	Element.Events.outerClick={
		base:'click',
		/*event.stopPropagation()该方法将停止事件的传播,阻止它被分派到其他Document节点
		在事件传播的任何阶段都可以调用它
		注意,虽然该方法不能阻止同一个Document节点上的其他事件句柄被调用,
		但是它可以阻止把事件分派到其他节点
		*/
		condition:function(event){
			event.stopPropagation();//stop event bubbling to the body
			return false;//never run handler when clicking on element
		},
		/*getDocument() return this.ownerDocument;*/
		onAdd:function(fn){
			this.getDocument().addEvent('click',fn);
		},
		onRemove:function(fn){
			this.getDocument().removeEvent('click',fn);
		}
	};
	window.addEvent('domready',function(){
		$$('a').addEvent('outerClick',function(){alert("ok");});									
	});
#T=内存建议
	//尽量使用下边的写法避免闭包
	function fun(element){
		element.attachEvent("onmouseover",mouse);
	}
	function mouse(){}

	//避免循环引用泄露内存
	window.onload=function outerFunction(){
		var obj=document.getElementById("i7");
		obj.onclick=function(){
			alert("Hi! I have avoided the leak");
		};
		obj.bigString=new Array(1000).join(new Array(2000).join("XXXXX"));
		obj=null;//打破循环引用,防止溢出
	};

	//通过另一个闭包防止溢出
	window.onload=function outerFunction(){
		var anotherObj=function innerFunction(){
			alert("Hi! I have avoided the leak");
		};
		(function ddf(){
			var obj=document.getElementById("i7");
			obj.onclick=anotherObj;
		})();
	};

	//添加另一个函数来避免闭包阻止泄漏
	window.onload=function(){
		var obj=document.getElementById("element");
		obj.onclick=doesNotLeak;
	}
	function doesNotLeak(){
		alert("Hi! I have avoided the leak");
	}

	作为一名网站开发WEB前端工程师,对自己开发的网站项目应该尽可能地对其性能进行优化,现在互联网上搜索到的网站性能优化多是翻译转载自 Yahoo14条或34条Yahoo的优化建议关注在大的方面,下面,W3C Group为大家呈现WEB前端开发高性能优化部分之JavaScript的优化细节！
	一、避免出现脚本失控

	不论什么脚本,在任何时间、任何浏览器上执行,都不应该超过100毫秒如果实际执行的时间长于这个底限,一定要将进程分解成若干更小的代码段

	脚本失控基本上有以下四个方面的原因：

	1. 在循环中执行了太多的操作

	  解决这个问题的诀窍就是用下面这两个问题来评估每个循环：
	  1. 这个循环必须要同步执行么？
	  2. 循环里面的数据,必须要按顺序执行么？

	  如果1和2都可以否定,那么建议使用setTimeout方式将循环体切分成小块进行异步处理

	  将循环中的定义变量及初始化操作放到循环外参见：http://www.w3cgroup.com/article.asp?id=111

	2. 臃肿的函数体

	  在JavaScript中,我们应该尽可能的用局部变量来代替全局变量!

	  理解JavaScript作用域链参见：http://www.jslab.org.cn/?tag=ScopeChainAndClosure

	  理解原型链参见：http://www.jslab.org.cn/?tag=prototypeChain

	3. 过多的递归

	  使用迭代方式替代递归,采用memoization技术优化递归

	  斐波那契数列的递归算法优化,参见：http://www.jslab.org.cn/?tag=Memoization

	4. 过多的DOM调用

	  在Web开发中,JavaScript的一个很重要的作用就是对DOM进行操作可你知道么？对DOM的操作是非常昂贵的,因为这会导致浏览器执行回流（reflow）操作而执行了过多的回流操作,你就会发现自己的网站变得越来越慢了我们应该尽可能的减少DOM操作

	  回流操作主要会发生在几种情况下：

	  * 改变窗体大小
	  * 更改字体
	  * 添加移除stylesheet块
	  * 内容改变哪怕是输入框输入文字
	  * CSS虚类被触发如:hover
	  * 更改元素的className
	  * 当对DOM节点执行新增或者删除操作或内容更改时
	  * 动态设置一个style样式时（比如element.style.width="10px"）
	  * 当获取一个必须经过计算的尺寸值时,比如访问offsetWidth、clientHeight或者其他需要经过计算的CSS值（在兼容DOM的浏览器中,可以通过getComputedStyle函数获取；在IE中,可以通过currentStyle属性获取）


	  解决问题的关键,就是限制通过DOM操作所引发回流的次数:
		  1.在对当前DOM进行操作之前,尽可能多的做一些准备工作,保证N次创建,1次写入

	  2.在对DOM操作之前,把要操作的元素,先从当前DOM结构中删除：
	  1. 通过removeChild()或者replaceChild()实现真正意义上的删除
	  2. 设置该元素的display样式为"none"
	  修改操作完成后,将上面这个过程反转过来,建议使用第2种方式

	  3.CSS部分
	  另外一个经常引起回流操作的情况是通过style属性对元素的外观进行修改,如element.style.backgroundColor="blue";
	  每次修改元素的style属性,都肯定会触发回流操作,要解决这个问题可以：
	  1.使用更改className的方式替换style.xxx=xxx的方式
	  2.使用style.cssText='';一次写入样式
	  3. 避免设置过多的行内样式
	  4. 添加的结构外元素尽量设置它们的位置为fixed或absolute
	  5. 避免使用表格来布局
	  6. 避免在CSS中使用JavaScript expressions(IE only)

	  4.将获取的DOM数据缓存起来这种方法,对获取那些会触发回流操作的属性（比如offsetWidth等）尤为重要

	  5.当对HTMLCollection对象进行操作时,应该将访问的次数尽可能的降至最低,最简单的,你可以将length属性缓存在一个本地变量中,这样就能大幅度的提高循环的效率

	二、避免大字符串字面量对象操作,如 字符串.length,尽量转换为new String(字符串)后再进行操作

	三、在做字符查找替换等操作时善用正则表达式

	快速掌握ECMAScript正则表达式参见：http://www.w3cgroup.com/article.asp?id=202

	四、减少语句,利用运算符优先级实现if else表达式,使用三元表达式,使用连续表达式（看情况,将损失程序可读性）


	利用运算符优先级实现if else表达式参见：http://www.w3cgroup.com/article.asp?id=131

	五、将CSS,JS文件合并到一个文件（非BT爱好者还是不要玩了^_^）

	参见：http://www.w3cgroup.com/article.asp?id=29

	六、避免Javascript事件绑定出现内存泄漏

	"These memory leaks often occur as a result of circular references between JavaScript objects and objects within IE's DOM (document object model)." Microsoft GPDE Team Blog

	参见：http://www.w3cgroup.com/article.asp?id=207

	七、使用WEB Workers技术（支持html5的浏览器）

	Web Workers为JavaScript提供了一种能在后台进程中运行的方法,Web Workers进程能够在不影响用户界面的情况下处理任务

	参见：http://www.w3cgroup.com/article.asp?id=242

	八、Y!14条（14 Rules for Faster-Loading Web Sites）

	  * Rule 1 - Make Fewer HTTP Requests
	  * Rule 2 - Use a Content Delivery Network (Server端)
	  * Rule 3 - Add an Expires Header (Server端)
	  * Rule 4 - Gzip Components (Server端)
	  * Rule 5 - Put Stylesheets at the Top
	  * Rule 6 - Put Scripts at the Bottom
	  * Rule 7 - Avoid CSS Expressions
	  * Rule 8 - Make JavaScript and CSS External
	  * Rule 9 - Reduce DNS Lookups (Server端)
	  * Rule 10 - Minify JavaScript
	  * Rule 11 - Avoid Redirects (Server端)
	  * Rule 12 - Remove Duplicate Scripts
	  * Rule 13 - Configure ETags (Server端)
	  * Rule 14 - Make AJAX Cacheable
	  * Rule 15 - Use Iframes Wisely

	参见：http://www.w3cgroup.com/article.asp?id=97

	九、微软早期的DHTML优化建议
	使用数组push替代字符串累加
#T=插件开发
	//創建一個函數
	var tweenHighlight=function(event){
		event.target.highlight('#eaea16');//event.target:觸發事件的目標
	}

	//由於這個函數是在一個事件（event）裡面被調用的
	//這個函數將會自動傳入event對象
	//然後你就可以通過.target來引用這個元素（event的目標元素）
	var tweenHighlightChange=function(item){
		item.target.highlight('#eaea16','#ff0000');
	}

	window.addEvent('domready',function(){
		$('Content').addEvent('mouseover',tweenHighlight);
		$('Content').addEvent('click',tweenHighlightChange);
	});
	//OR
	var textDefaults=new Class({
		Implements:[Options,Events],//实现
		options:{//选择参数
			$Sel:false,
			class:""
		},
		initialize:function(options){//初始化构造函数
			this.setOptions(options);//设置选项
			this.init(this.options.$Sel);//调用fun
		},
		init:function($el){
			$cls=this.options.class;$clr=this.options.color;
			$el.each(function(tag){
				tag.addEvents({
					focus:function(){
						if($cls){this.toggleClass($cls);}
					},
					blur:function(){
						if($cls){this.toggleClass($cls);}
					}
				});
			});
		}
	});
	new textDefaults({
		$Sel:$$('input[type="text"],textarea'),
		class:"border"
	})
#T=扩展方法show()
window.addEvent('load',function(){
	Element.implement({
		show:function(){
			this.setStyle('display','');
		},
		hide:function(){
			this.setStyle('display','none');
		},
		xshow:function(){
			this.fade('in');
		},
		xhide:function(){
			this.fade('out');
		},
		toggle:function(event,fn,fn2){
			var flag=true;
			return this.addEvent(event,function(){
				(flag ? fn:fn2).apply(this,arguments);
				flag=!flag;
			});
		},
		xlight:function(linkClass,opacity){
			opacity=(opacity)?opacity:.3;
			linkClass=(linkClass.charAt(0)=='.')?linkClass:'.'+linkClass;
			this.addEvent('mouseover:relay('+linkClass+')',function(e,elem){
				$$(linkClass).each(function(link){
					if(elem!=link){link.tween('opacity',opacity);}
				});
			});
			this.addEvent('mouseout:relay('+linkClass+')',function(e,elem){
				$$(linkClass).each(function(link){
					link.tween('opacity',1);
				});
			});
		}
	});

	$('drop_here').xlight('.foo',.2);
});
#T=将ipod等排除在外
	if(!/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)){
		window.addEvent("domready",Slimbox.scanPage);
	}
#T=选择display:none的节点
Element.implement({
    block:function(tag){
      var i=0;
      var elements = [];
		while(i<this.getElements(tag).length){
			if(this.getElements(tag)[i].getStyle('display') === 'block')elements.push(this.getElements(tag)[i]);
			//elements.push(this.getElements(tag)[i]);
			i++;
		}
		return new Elements(elements, {ddup: false});
   }
})
#T=动画串联
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
	<style type='text/css'>
	#box {background: #6B7B95;height:70px;margin:0 auto;width:100px;}
	#log {margin:0;height:50px;}
	#box1 {background:#6B7B95;height:70px;margin:0 auto;width:100px;}
	#log1 {margin:0;height:50px;}
	</style>
	<script style="text/javascript" src="https://ajax.googleapis.com/ajax/libs/mootools/1.4.1/mootools-yui-compressed.js"></script>
	</head>

	<body id="index">
	<h3>MooTools官方Demo - Chaining</h3>
	<p>Click <a id="start" href="#" name="start">start</a> to see a sequence of effects controlled by chain</p>
	<strong>Log:</strong><br />
	<p id="log">waiting for start click</p>
	<div id="box"></div>
	<h3>MooTols官方插件Chain.Wait示例</h3>
	<p>Click <a id="start1" href="#" name="start">start</a> to see a sequence of effects controlled by chain</p>
	<p id="log1">waiting for start click</p>
	<div id="box1"></div>
	</body>
	<script type='text/javascript'>
	window.addEvent('domready', function(){
		$('start').addEvent('click', function(event){
			event.stop();
			var log = $('log');
			var fx = new Fx.Morph('box', {
				duration: 1000,
				transition: Fx.Transitions.Quart.easeOut
			});
			log.set('html', 'starting...');
			fx.start({
				'width': 300,
				'height': 210
			}).chain(function(){
				log.set('html', '第一个动画 (1/5)');
				this.start({
					'opacity': .3
				});
			}).chain(function(){
				log.set('html', '第二个动画(2/5).<br />Waiting 5 seconds before starting third.');
				this.start.delay(5000, this, {
					'opacity': 1
				});
			})
			.chain(function(){
				log.set('html', '第三个动画(3/5).<br />Waiting 2 seconds before starting fourth.');
				this.start.delay(2000, this, {
					'background-color': '#78BA91'
				});
			}).chain(function(){
				log.set('html', 'Fourth effect completed (4/5).<br />Waiting 1 second before starting fifth.');
				this.start.delay(1000, this, {
					'background-color': '#A87AAD',
					'width': 100,
					'height': 70
				});
			}).chain(function(){
				log.set('html', 'Fifth effect completed (5/5).');
			});
		});

		$('start1').addEvent('click', function(event){
			event.stop();
			var fx = new Fx.Morph('box1', {
				duration: 1000,
				transition: Fx.Transitions.Quart.easeOut,
				link: 'chain'
			});
			fx.start({
				'width': 300,
				'height': 210
			}).start({
				'opacity': 0.3
			}).wait(5000).start({
				'opacity': 1
			}).wait(2000).start({
				'background-color': '#78BA91'
			}).wait(1000).start({
				'background-color': '#A87AAD',
				'width': 100,
				'height': 70
			})
		});
	});
	</script>
	</html>
#T=Web版Firebug
<script type="text/javascript" src="https://getfirebug.com/firebug-lite-debug.js"></script>
#T=一个很好的实现JS命名空间的管理
    /** 
     * SPORE core v1.1 
     * @fileoverview 实现JS命名空间的管理，模块的定义，与自动加载依赖模块的脚本文件。 
     * @author Esoul | pillar0514@gmail.com 
     */ 
    (function(){ 
         
        var undefined,          //防止全局污染 
            that = {},          //当前命名空间 
            jsParent = null,    //用于插入script节点的父节点。 
            doc = document,     //变量引用速度更快 
            JSManager = {},     //要暴露出的JS管理器 
            RequireCache = [],  //模块需求列表缓存 
            ExecuteQueue = [],  //模块执行队列 
            RequireList = [],   //总模块需求列表 
            ModuleCache = {},   //模块缓存 
            JSRequested = {},   //已请求过的JS模块 
            RequireTree = {},   //模块需求多叉树 
            Traversed = {},     //遍历缓存 
            ModuleLoaded = [],  //已经加载的模块的名字列表（用于调试） 
            RequireHash = {};   //模块需求列表的位置索引 
     
        /** 
         * @method each 遍历一个对象 
         * @param {Object} obj 可遍历的对象 
         * @param {Function} fn 要操作的函数 
         * @param {Object} bind 遍历函数要绑定的对象 
         */ 
        function $each(obj, fn, bind){ 
            for(var key in obj){ 
                if(obj.hasOwnProperty(key)){ 
                    fn.call(bind, obj[key], key, obj); 
                } 
            } 
        } 
     
        /** 
         * @method loadjs 加载一个JS文件 
         * @param {String} strsrc JS文件的地址 
         */ 
        function loadjs(strsrc){ 
            var js = doc.createElement('script'); 
            js.type = 'text/javascript'; 
            js.charset = JSManager.$charset; 
            js.src = strsrc; 
            if(!jsParent){ jsParent = doc.getElementsByTagName('head')[0]; } 
            jsParent.appendChild(js); 
        } 
     
        /** 
         * @method loadModule 加载一个模块 
         * @param {String} mName 模块的名称 
         */ 
        function loadModule(mName){ 
            loadjs( (JSManager.$basepath || '') + mName.split('.').join('/') + '.js?version=' + JSManager.$version ); 
        } 
     
        /** 
         * @method setModuleCache 设置模块加载成功 
         * @param {String} mName 模块的名称 
         */ 
        function setModuleReady(mName){ 
            if(ModuleCache[mName] === 'ready'){return;} 
            var nsParent, ns = that, 
                arrName = (mName || '').split('.'); 
            $each(arrName, function(name){ 
                nsParent = ns; 
                ns = ns[name] = ns[name] || {}; 
            }); 
            nsParent[arrName.pop()] = ModuleCache[mName].call(null,that) || {}; 
            ModuleCache[mName] = 'ready'; 
            ModuleLoaded.push(mName); 
        } 
     
        /** 
         * @method traverse 深度遍历模块引用多叉树，设置模块加载成功 
         * @param {String} name 节点名称 
         */ 
        function traverse(name){ 
            if(!name || Traversed[name]){return;}   //确保每个节点只能访问一次（避免循环引用造成的死锁） 
            Traversed[name] = true;                 //事实上一个初始化模块，必定只允许运行一次 
            $each(RequireTree[name],traverse); 
            setModuleReady(name); 
        } 
     
        /** 
         * @method checkReady 检查依赖列表中的模块文件是否都已就绪。 
         * @desc 如果都就绪了，就开始进行遍历（假定队列中的每个模块都是顶节点，进行多叉树深度遍历）。 
         */ 
        function checkReady(){ 
            if(!RequireList.join('')){ 
                $each(ExecuteQueue.reverse(),traverse); 
                ExecuteQueue.length = 0; 
                RequireList.length = 0; 
                RequireHash = {}; 
            } 
        } 
     
        /** 
         * @method checkDepend 检查模块依赖文件是否已请求 
         * @param {String} mName 模块名称 
         */ 
        function checkDepend(mName){ 
            var requires = [].concat(RequireCache); 
            RequireCache.length = 0; 
            RequireTree[mName] = requires; 
            $each(requires,function(name){ 
                if(!JSRequested[name]){ 
                    ExecuteQueue.unshift(name); 
                    RequireHash[name] = RequireList.length; 
                    RequireList.push(name); 
                    loadModule( name ); 
                    JSRequested[name] = true; 
                } 
            }); 
            checkReady(); 
        } 
     
        /** 
         * @method register 注册一个模块 
         * @param {String} mName 模块的名称 
         * @param {Function} maker 模块构造函数 
         */ 
        function register(mName, maker){ 
            if(ModuleCache[mName]){ 
                throw('The "' + mName + '" has been registered!!!'); 
            } 
            ModuleCache[mName] = maker; 
            if(!JSRequested[mName]){ 
                ExecuteQueue.push(mName); 
                JSRequested[mName] = true; 
            } 
            if(RequireHash[mName] !== undefined){ 
                RequireList[ RequireHash[mName] ] = ''; 
            } 
            checkDepend(mName); 
        } 
     
        /** 
         * @method $Import 加载（引入）一个模块 
         * @param {String} name 模块的名称 
         */ 
        function $Import(name){ 
            RequireCache.push(name); 
        } 
     
    //--------------------------- 
        //参数配置区： 
        var spaceName = 'SPORE';                //定义顶层命名空间的名称 
        var managerName = '$JSManager';         //要暴露出去的JS管理器的名称 
        var regName = 'register';               //要暴露出去的注册组件函数的名称 
        var impName = '$Import';                //要暴露出去的引用组件函数的名称 
        JSManager.$basepath = 'js/';            //JS库所在的线上路径 
        JSManager.$charset = 'utf-8';           //JS文件的编码    
        JSManager.$version = new Date() - 0;    //JS版本号 
    //--------------------------- 
     
        //适配器： 
        that[impName] = $Import; 
        that[regName] = register; 
        that[managerName] = JSManager; 
        ModuleCache[impName] = ModuleCache[regName] = ModuleCache[managerName] = 'ready'; 
        JSManager.$ModuleCache = ModuleCache; 
        JSManager.$RequireList = RequireList; 
        JSManager.$ModuleLoaded = ModuleLoaded; 
        if(!this[spaceName]){ 
            this[spaceName] = that; 
        }else{ 
            $each(that, function(prop, name){ 
                if(!this[spaceName][name]){ 
                    this[spaceName][name] = prop; 
                }else{ 
                    throw('Lib "' + spaceName + '" exists the same prop: ' + name); 
                } 
            }); 
            that = this[spaceName]; 
        } 
     
    })(); 
     
    /* 
    上面的代码实现了命名空间管理和文件自动依赖。 
    使用方法： 
    1，修改代码配置信息，确认 
        - JS库的命名，或者为哪个JS库扩展此功能（比如为jQuery扩展该功能）。 
        - JS文件的编码（charset） 
        - JS库所在的服务端路径 
        - JS库的版本号（默认为当前客户端时间转为的数字，避免加载的JS被缓存）。 
    2，在页面上引用这个JS。 
    3，在JS库所在的文件夹添加扩展JS文件，文件结构类似这样： 
    //库的顶层位置spore.js 
        - arr 
            each.js 
            erase.js 
            ... 
        - obj 
            merge.js 
            append.js 
            ... 
        - conf 
            index.js 
        - jobs 
            loadpage.js 
        -arr为一个文件夹，以''arr''命名，其他类似 
    4，JS文件代码格式如下 
    */ 
     
    //--------------------------------------------------------- 
    //obj/merge.js: 
    //命名空间构造函数 
    SPORE.register('obj.merge',function($){ 
        return function(obj1,obj2){ //返回的函数将被创建到SPORE.obj.merge这个DOM位置。 
        //功能代码 
        } 
    }); 
    //--------------------------------------------------------- 
    //jobs/loadpage.js: 
    //引用列表 
    SPORE.$Import('obj.merge'); //参数为命名空间的名称 
    SPORE.$Import('arr.each'); 
     
    //命名空间构造函数 
    SPORE.register('jobs.loadpage',function($){ //美元符号为对SPORE的引用 
        var that = {}; 
        var obj = $.obj.merge({a:1},{b:2}); //要使用这个函数，必须确保引用列表中存在引用代码（SPORE.$Import('obj.merge');） 
        //... 业务逻辑 
        return that;    //这个函数将在依赖的文件就绪后执行，返回值将被创建到SPORE.jobs.loadpage这个DOM位置。 
    }); 
    //--------------------------------------------------------- 
#T=你须知道的30个CSS选择器
	你也许已经掌握了id、class、后台选择器这些基本的css选择器。但这远远不是css的全部。下面向大家系统的解析css中30个最常用的选择器，包括我们最头痛的浏览器兼容性问题。掌握了它们，才能真正领略css的巨大灵活性。
	1. *
	* {margin: 0; padding: 0;}
	星状选择符会在页面上的每一个元素上起作用。web设计者经常用它将页面中所有元素的margin和padding设置为0。
	*选择符也可以在子选择器中使用。
		#container * { border: 1px solid black;}
	上面的代码中会应用于id为container元素的所有子元素中。
	除非必要，我不建议在页面中过的的使用星状选择符，因为他的作用域太大，相当耗浏览器资源。
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	2. #X
	#container {width: 960px;margin: auto; }
	井号作用域有相应id的元素。id是我们最常用的css选择器之一。id选择器的优势是精准，高优先级（优先级基数为100，远高于class的10），作为javascript脚本钩子的不二选择，同样缺点也很明显优先级过高，重用性差，所以在使用id选择器前，我们最好问下自己，真的到了非用id选择器的地步？
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	3. .X
	.error {color: red;}
	这是一个class(类)选择器。class选择器与id选择器的不同是class选择器能作用于期望样式化的一组元素。
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	4. X Y
	li a { text-decoration: none;}
	这也是我们最常用的一种选择器——后代选择器。用于选取X元素下子元素Y，要留意的点是，这种方式的选择器将选取其下所有匹配的子元素，无视层级，所以有的情况是不宜使用的，比如上述的代码去掉li下的所有a的下划线，但li里面还有个ul，我不希望ul下的li的a去掉下划线。使用此后代选择器的时候要考虑是否希望某样式对所有子孙元素都起作用。这种后代选择器还有个作用，就是创建类似命名空间的作用。比如上述代码样式的作用域明显为li。
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	5. X
	a { color: red; }  
	ul { margin-left: 0; }
	标签选择器。使用标签选择器作用于作用域范围内的所有对应标签。优先级仅仅比*高。
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	6. X:visited和X:link
	a:link { color: red; }   
	a:visted { color: purple; }
	使用:link伪类作用于未点击过的链接标签。:hover伪类作用于点击过的链接。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	7. X+Y
	ul + p {color: red;}
	相邻选择器，上述代码中就会匹配在ul后面的第一个p，将段落内的文字颜色设置为红色。(只匹配第一个元素)
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	8. X>Y
	div#container > ul { border: 1px solid black;}
	<div id=”container”>
		<ul>
			<li> List Item
				<ul>
					<li> Child </li>
				</ul>
			</li>
			<li> List Item </li>
			<li> List Item </li>
			<li> List Item </li>
		</ul> 
	  </div>
	子选择器。与后代选择器X Y不同的是，子选择器只对X下的直接子级Y起作用。在上面的css和html例子中，div#container>ul仅对container中最近一级的ul起作用。从理论上来讲X > Y是值得提倡选择器，可惜IE6不支持。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	9. X ~ Y
	ul ~ p { color: red;}
	相邻选择器，与前面提到的X+Y不同的是，X~Y匹配与X相同级别的所有Y元素，而X+Y只匹配第一个。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	10. X[title]
	a[title] { color: green;}
	属性选择器。比如上述代码匹配的是带有title属性的链接元素。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	11. X[title="foo"]
	a[href="http://blog.moocss.com"] { color: #1f6053; }
	属性选择器。 上面的代码匹配所有拥有href属性，且href为http://blog.moocss.com的所有链接。
	这个功能很好，但是多少又有些局限。如果我们希望匹配href包含css9.net的所有链接该怎么做呢？看下一个选择器。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	12. X[href*="moocss"]
	a[href*="moocss"] {color: #1f6053;}
	属性选择器。正如我们想要的，上面代码匹配的是href中包含”http://blog.moocss.com“的所有链接。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	13. X[href^="http"]
	a[href^="http"] {background: url(path/to/external/icon.png) no-repeat; padding-left: 10px;}
	属性选择器。上面代码匹配的是href中所有以http开头的链接。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	14. X[href$=".jpg"]
	a[href^="http"] { background: url(path/to/external/icon.png) no-repeat;padding-left: 10px;}
	属性选择器。在属性选择器中使用$，用于匹配结尾为特定字符串的元素。在上面代码中匹配的是所有链接到扩展名为.jpg图片的链接。（注意，这里仅仅是.jpg图片，如果要作用于所有图片链接该怎么做呢，看下一个选择器。）
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	15. X[data-*="foo"]
	在上一个选择器中提到如何匹配所有图片链接。如果使用X[href$=".jpg"]实现，需要这样做：
	a[href$=".jpg"],
	a[href$=".jpeg"],
	a[href$=".png"],
	a[href$=".gif"] {
		color: red;
	}
	看上去比较麻烦。另一个解决办法是为所有的图片链接加一个特定的属性，例如‘data-file’
	html代码
	图片链接
	css代码如下：
	a[data-filetype="image"] {
		color: red;
	}
	这样所有链接到图片的链接字体颜色为红色。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	16. X[foo~="bar"]
	属性选择器。属性选择器中的波浪线符号可以让我们匹配属性值中用空格分隔的多个值中的一个。看下面例子：
	html代码
	<a href=”path/to/image.jpg” data-info=”external image”> Click Me, Fool </a>
	css代码
	a[data-info~="external"] {
		color: red;
	}
	a[data-info~="image"] {
		border: 1px solid black;
	}
	在上面例子中，匹配data-info属性中包含“external”链接的字体颜色为红色。匹配data-info属性中包含“image”的链接设置黑色边框。
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	17. X:checked
	checked伪类用来匹配处于选定状态的界面元素，如radio、checkbox。
	input[type=radio]:checked {
		border: 1px solid black;
	}
	上面代码中匹配的是所有处于选定状态的单选radio，设置1px的黑色边框。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	18. X:after和X:before
	这两个伪类与content结合用于在元素的前面或者后面追加内容，看一个简单的例子：
	h1:after {content:url(/i/logo.gif)}
	上面的代码实现了在h1标题的后面显示一张图片。
	我们也经常用它来实现清除浮动，写法如下：
	.clearfix:after {
		content: “”;
		display: block;
		clear: both;
		visibility: hidden;
		font-size: 0;
		height: 0;
	}      
	.clearfix {
		*zoom:1
	}
	19. X:hover
	div:hover {
		background: #e3e3e3;
	}
	:hover伪类设定当鼠标划过时元素的样式。上面代码中设定了div划过时的背景色。
	需要注意的是，在ie 6中，:hover只能用于链接元素。
	这里分享一个经验，在设定链接划过时出现下滑线时，使用border-bottom会比text-decoration显得更漂亮些。代码如下：
	a:hover {
		border-bottom: 1px solid black;
	}
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	20. X:not(selector)
	div:not(#container) {
		color: blue;
	}
	否定伪类选择器用来在匹配元素时排除某些元素。在上面的例子中，设定除了id为container的div元素字体颜色为blue。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	21. X::pseudoElement
	::伪对象用于给元素片段添加样式。比如一个段落的第一个字母或者第一行。需要注意的是，这个::伪对象只能用于块状元素。
	下面的代码设定了段落中第一个字母的样式：
	p::first-letter {
		float: left;
		font-size: 2em;
		font-weight: bold;
		font-family: cursive;
		padding-right: 2px;
	}
	下面的代码中设定了段落中第一行的样式：
	p::first-line {
		font-weight: bold;
		font-size: 1.2em;
	}
	兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera
	（IE6竟然支持，有些意外啊。）
	22. X:nth-child(n)
	li:nth-child(3) {
		color: red;
	}
	这个伪类用于设定一个序列元素（比如li、tr）中的第n个元素（从1开始算起）的样式。在上面例子中，设定第三个列表元素li的字体颜色为红色。
	看一个更灵活的用法，在下面例子中设定第偶数个元素的样式，可以用它来实现隔行换色：
	tr:nth-child(2n) {
		background-color: gray;
	}
	兼容浏览器：IE9+、Firefox、Chrome、Safari
	23. X:nth-last-child(n)
	li:nth-last-child(2) {
		color: red;
	}
	与X:nth-child(n)功能类似，不同的是它从一个序列的最后一个元素开始算起。上面例子中设定倒数第二个列表元素的字体颜色。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	24. X:nth-of-type(n)
	ul:nth-of-type(3) {
		border: 1px solid black;
	}
	与X:nth-child(n)功能类似，不同的是它匹配的不是某个序列元素，而是元素类型。例如上面的代码设置页面中出现的第三个无序列表ul的边框。
	兼容浏览器：IE9+、Firefox、Chrome、Safari
	25. X:nth-last-of-type(n)
	ul:nth-last-of-type(3) {
		border: 1px solid black;
	}
	与X:nth-of-type(n)功能类似，不同的是它从元素最后一次出现开始算起。上面例子中设定倒数第三个无序列表的边框。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	26. X:first-child
	:first-child伪类用于匹配一个序列的第一个元素。我们经常用它来实现一个序列的第一个元素或最后一个元素的上（下）边框，如：
	ul:nth-last-of-type(3) {
		border: 1px solid black;
	}
	兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera
	27. X:last-child
	ul > li:last-child {
		border-bottom:none;
	}
	与:first-child类似，它匹配的是序列中的最后一个元素。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	28. X:only-child
	div p:only-child {
		color: red;
	}
	这个伪类用的比较少。在上面例子中匹配的是div下有且仅有一个的p，也就是说，如果div内有多个p，将不匹配。
	<div><p> My paragraph here. </p></div>
	<div>
		<p> Two paragraphs total. </p>
		<p> Two paragraphs total. </p>
	</div>
	在上面代码中第一个div中的段落p将会被匹配，而第二个div中的p则不会。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	29. X:only-of-type
	li:only-of-type {
		font-weight: bold;
	}
	这个伪类匹配的是，在它上级容器下只有它一个子元素，它没有邻居元素。例如上面代码匹配仅有一个列表项的列表元素。
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera
	30. X:first-of-type
	:first-of-type伪类与:nth-of-type(1)效果相同，匹配出现的第一个元素。我们来看个例子：
	<div>
		<p> My paragraph here. </p>
		<ul>
			<li> List Item 1 </li>
			<li> List Item 2 </li>
		</ul>
		<ul>
			<li> List Item 3 </li>
			<li> List Item 4 </li>
		</ul>
	</div>
	在上面的html代码中，如果我们希望仅匹配List Item 2列表项该如何做呢：
	方案一：
	ul:first-of-type > li:nth-child(2) {
		font-weight: bold;
	}
	p + ul li:last-child {
		font-weight: bold;
	}
	方案三：
	ul:first-of-type li:nth-last-child(1) {
		font-weight: bold;
	}
	兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera。
	总结：
	如果你正在使用老版本的浏览器，如IE 6，在使用上面css选择器时一定要注意它是否兼容。不过，这不应成为阻止我们学习使用它的理由。在设计时，你可以参考浏览器兼容性列表，也可以通过脚本手段让老版本的浏览器也支持它们。
#T=Event:constructor
	语法:new Event([event[,win]]);

	参数:event-(event)HTMLEvent对象
	win-(window,可选:默认为window)事件的上下文

	属性:
	code-(number)按键的键盘代码
	shift-(boolean)用户是否按下shift键
	control-(boolean)用户是否按下control键
	alt-(boolean)用户是否按下alt键
	meta-(boolean)用户是否按下meta键
	wheel-(number)鼠标滚轮的滚动量
	page.x-(number)鼠标相对整个window的x坐标
	page.y-(number)鼠标相对整个window的y坐标
	client.x-(number)鼠标相对整个页面可视区域的x坐标
	client.y-(number)鼠标相对整个页面可视区域的y坐标
	key-(string)按键的名称. 可为如下:'enter','up','down','left','right','space','backspace','delete',以及 'esc'
	target-(element)事件目标对象
	relatedTarget-(element)事件目标的参照对象

	示例:
	$('myLink').addEvent('keydown',function(event){
		//传入的event已经是一个Event类的示例
		alert(event.key);
		alert(event.shift);

		//Ctr+S 组合键
		if(event.key == 's' && event.control){
			alert('Document saved.');
		}
	});

	备注:
	要正确获取event.page / event.client,则需要页面使用标准模式的DOCTYPE
	每个使用addEvent方法添加的事件event对象将自动获取到mootools提供的方法扩展,不需要再去手工创建实例
#T=Event.Keys 可以向Event.Keys中添加其他的键盘代码/名映射
	示例:
	Event.Keys.shift=16;

	$('myInput').addEvent('keydown',function(event){
		if(event.key == "shift"){
			alert("You pressed shift.");
		}
	});
#T=addEvent 向DOM元素添加一个事件监听器
	语法:myElement.addEvent(type,fn);

	参数:type-(string)监听的事件类型('click','load',等等),注意没有前缀'on'
	fn-(funtion)监听函数

	返回值:(element)主调元素

	示例:
	<div id="myElement">Click me.</div>

	$('myElement').addEvent('click',function(){
		alert('Dom:'+this.id);//触发事件的对象
	});

	备注:可以在监听函数中使用返回false的手段或者调用Event:stop来停止事件
	在Document和Window上也具有本方法
#T=removeEvent 删除指定的事件监听函数
	语法:myElement.removeEvent(type,fn);

	参数:type-(string)事件名
	fn-(funtion)要删除的函数

	返回值:(element)主调元素

	示例:独立使用:
	//先添加一个监听器
	var de=function(event){
		alert(event.key);
		alert('code:'+event.code);//按键的键盘代码
		alert('Dom:'+this.id);//触发事件的对象
		
		$('i7').removeEvent('click',de);//删除事件
	};
	$('i7').addEvent('click',de);
	//$('i7').removeEvent('click',de);//删除事件

	和bind配合使用:
	var destroy=function(){
		alert('Dom:'+this.id);	//i6

		//删除事件
		//1.这里将不会删除任何监听器(因为元素上并不存在这个监听器)
		$('i7').removeEvent('click',destroy);

		//2.这里也不会删除任何监听器(因为这里其实创建了一个新的函数,和元素上的监听器不是相同的引用)
		$('i7').removeEvent('click',destroy.bind($('anotherElement'));

		//3.可以正确删除监听器
		$('i7').removeEvent('click',boundDestroy);
	}
	var boundDestroy=destroy.bind($('i6'));
	$('i7').addEvent('click',boundDestroy);

	备注:当使用Function:bind 或 Function:pass 等创建函数时,将创建一个新的引用. 如果要正确使用removeEvent来删除监听器,你必须传入原先监听器的引用
	在Document和Window上也具有本方法
#T=addEvents 向DOM元素一次添加多个事件监听器
	语法:myElement.addEvents(events);

	参数:events-(object)键值对对象:键为事件名,值为监听函数

	返回值:(element)主调元素

	示例:
	$('i7').addEvents({
		'mouseover':function(event){
			alert('mouseover page.x:'+event.page.x+' page.y:'+event.page.y+' client.x:'+event.client.x+' client.y:'+event.client.y);
			alert('Dom:'+this.id);//触发事件的对象
		},
		'click':function(event){
			alert('mouseover page.x:'+event.page.x+' page.y:'+event.page.y+' client.x:'+event.client.x+' client.y:'+event.client.y);
			alert('Dom:'+this.id);//触发事件的对象
		}
	});

	备注:在Document和Window上也具有本方法
#T=removeEvents 删除指定事件类型上的所有监听函数.如果未传入任何参数,则删除所有类型上的所有监听函数
	语法:myElements.removeEvents([type]);

	参数:type-(string,可选)事件名(如:'click'). 如果未指定,则删除所有事件

	返回值:(element)主调元素

	示例:
	var _Sel=$('i7');
	_Sel.addEvents({
		'mouseover':function(){
			alert('mouseover');
		},
		'click':function(){
			alert('click');
			_Sel.removeEvents('mouseover');//删除mouseover事件
			//_Sel.removeEvents();//删除所有事件
		}
	});

	备注:在Document和Window上也具有本方法
#T=fireEvent 触发元素上指定的事件类型
	语法:myElement.fireEvent(type[,args[,delay]]);

	参数:
	type-(string)事件名(如:'click')
	args-(mixed,可选)传递给监听函数的参数. 如果参数个数大于一,则必须使用数组
	delay-(number,可选)延迟执行监听函数的毫秒数

	返回值:(element)主调元素

	示例:
	//触发myElement的click事件,并在一秒钟后执行事件的监听函数(向每个函数传入anElement元素作为参数)
	$('myElement').fireEvent('click',$('anElement'),1000);

	var txt=$('i7');
	txt.addEvents({
		'focus':function(){
			if(txt.value.contains('Type here')) txt.value='';
		},
		'keyup':function(){
			if(txt.value.contains('hello')){txt.fireEvent('burn','hello world!');}
			else if(txt.value.contains('moo')){txt.fireEvent('burn','mootools!');}
			else if(txt.value.contains('22')){txt.fireEvent('burn','Italy!');}
			else if(txt.value.contains('33')){txt.fireEvent('burn','fireEvent');}
			else if(txt.value.contains('q')){txt.fireEvent('burn',"I'm a bit late!",1000);}
		},
		'burn':function(text){
			alert(text+'|'+txt.value);
			txt.value='';
		}
	});

	备注:本方法不会触发DOM级别的事件(如元素标签上内联方式的事件声明:onmousedown="...")
	在Document和Window上也具有本方法
#T=cloneEvents 复制目标元素上的所有事件到本元素
	语法:myElement.cloneEvents(from[,type]);

	参数:from-(element)目标元素
	type-(string,可选)复制的事件类型. 如果为null或未指定,则复制所有的事件

	返回值:(element)主调元素

	示例:
	var myElement=$('myElement');
	var myClone=myElement.clone().cloneEvents(myElement);//复制元素并复制下所有的事件

	备注:在Document和Window上也具有本方法
#T=Element.Events 用于创建自定义的事件类型
	参数:
	自定义一个事件时,Element.Events.yourproperty中可包含如下内容:
	base-(string,可选)自定义事件所监听的基类事件. 如果指定了下面condition参数,则本参数必须填写
	condition-(function,可选)自定义事件触发的条件函数(函数的参数为一个Event实例)
	onAdd-(function,可选)当元素添加自定义事件时触发的函数(函数的参数为一个Event实例)
	onRemove-(function,可选)当元素删除自定义事件时触发的函数(函数的参数为一个Event实例)

	示例:
	//自定义事件shiftclick:按住shift后鼠标进行点击

	Element.Events.shiftclick={
		base:'click',//设置基类事件为click
		condition:function(event){//用来检测其他事件触发条件
			return(event.shift == true);//检查是否按了shift键
		}
	};

	$('myInput').addEvent('shiftclick',function(event){
		log('the user clicked the left mouse button while holding the shift key');
	});

	备注:
	有以下几种不同类型的自定义事件组合:只定义了base:仅仅是重定向到基类事件上去
		定义了base和condition:重定向到基类事件上去,但由condition来决定是否触发
		定义了onAdd和/或onRemove,并且定义了base和condition:事件添加/删除时会触发关联的函数

	警告:
	请慎用自定义事件和原生事件同名,并使用condition选项(除非你打算覆盖原生事件).(严重不推荐:只有当你确切的明白你在做的事情时使用)
#T=mouseenter 本事件在鼠标进入指定元素区域时触发,并且不会在鼠标穿越子元素的时候再次触发(区别于mouseover)
	示例:
	$('myElement').addEvent('mouseenter',myFunction);
#T=mouseleave 事件在鼠标离开指定元素区域时触发,并且不会再离开本元素的子元素的时候触发(区别于mouseout)
	示例:
	$('myElement').addEvent('mouseleave',myFunction);
#T=mousewheel 本事件在鼠标滚轮滚动时触发
	示例:
	$('myElement').addEvent('mousewheel',myFunction);
#T=stop 停止事件传播和中止执行事件的默认行为
	语法:myEvent.stop();

	返回值:(object)Event实例

	示例:
	<a id="myAnchor" href="http://google.com/">Visit Google.com</a>

	$('myAnchor').addEvent('click',function(event){
		event.stop();//阻止链接的默认行为:打开链接到google.com
		this.setText("Where do you think you're going?");

		function(){
			this.setText("Instead visit the Blog.").set('href','http://blog.mootools.net');
		}.delay(500,this);
	});

	备注:在事件监听函数中返回false的话,同样也可起到停止事件传播的效果
#T=stopPropagation 停止事件的传播(停止事件在DOM结构中进行冒泡传递)
	语法:myEvent.stopPropagation();

	返回值:(object)Event对象

	示例:
	此示例中,请设置myChild的覆盖区域大小比myElement的小,这样便于测试和看清区别.

	<div id="myElement">
		<div id="myChild"></div>
	</div>

	$('myElement').addEvent('click',function(){
		alert('click');
		return false;//和stopPropagation方法效果等同
	});

	$('myChild').addEvent('click',function(event){
		event.stopPropagation();//阻止事件的传播,这样myChild的click事件触发后,myElement的click事件就不会被触发
	});
#T=preventDefault 中止执行事件的默认行为
	语法:myEvent.preventDefault();

	返回值:(object)Event实例

	示例:
	<form>
		<input id="myCheckbox" type="checkbox" />
	</form>

	$('myCheckbox').addEvent('click',function(event){
		event.preventDefault();//点击后,myCheckbox将不会变成"checked"的选中状态
	});
#T= 




#
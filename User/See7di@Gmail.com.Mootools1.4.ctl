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
	//console.dir($("#tab2 .tit"));//ݔ���������еČ��Ի򷽷�
	//console.assert(typeof $("#tab2 .tit")=='objec');//�yԇ���_ʽ�Ƿ��ʽ,��������]�з���,����������t�����e�`
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
if(confirm('�Ƿ�_��Ҫ�h��ԓ�Ŀ��')){window.location=('?work=del&Id=1');}
#T=setTimeout
	window.setTimeout(function(){...},1000);//ֻ�ӳ�1��,��ѭ��
	window.setInterval(function(){...},1000);//�ӳ�1��,��ѭ��

	var Fun=function(){clearTimeout(timer);alert('moo! Element id is:'+this.id);};
	var timer=Fun.delay(1000);

	�Ż��ڴ�
	var counter=0;
	function fun (){
		if(counter >= 150) return;
		counter++;
		setTimeout(fun,3000);
	}
	<meta HTTP-EQUIV=REFRESH CONTENT='60;URL=?work='>
#T=console.log
console.log(^!);
#T=��ֹF5ˢ�����
$(document).onkeydown=function(event){//��ֹ��F5��
	if(event.keyCode==116){
		event.keyCode = 0;
		event.cancelBubble = true;
		return false;
	}
}
#T=��tabѡ�
var chgImages=function(){
	var $_imgbox=$$('#_imgbox li');//�ГQ��D
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
#T=��ȡ�������͸�
	��ҳ�ɼ������ document.body.clientWidth
	��ҳ�ɼ�����ߣ� document.body.clientHeight
	��ҳ�ɼ������ document.body.offsetWidth (�������ߵĿ�)
	��ҳ�ɼ�����ߣ� document.body.offsetHeight (�������ߵĸ�)
	��ҳ����ȫ�Ŀ� document.body.scrollWidth
	��ҳ����ȫ�ĸߣ� document.body.scrollHeight
	��ҳ����ȥ�ĸߣ� document.body.scrollTop
	��ҳ����ȥ���� document.body.scrollLeft
	��ҳ���Ĳ����ϣ� window.screenTop
	��ҳ���Ĳ����� window.screenLeft
	��Ļ�ֱ��ʵĸߣ� window.screen.height
	��Ļ�ֱ��ʵĿ� window.screen.width
	��Ļ���ù������߶ȣ� window.screen.availHeight
	��Ļ���ù�������ȣ� window.screen.availWidth
	ע����XHTML��׼��һ���뽫body�ĳ�documentElement

	����˵˵����������� document.body �� clientHeight��offsetHeight �� scrollHeight �Ľ��͡�

	������������ֱ�ΪIE��Netscape��Opera��FireFox

	clientHeight
	����������� clientHeight �Ľ��Ͷ�û��ʲô���飬����Ϊ�����ݿ�������ĸ߶ȣ�Ҳ����˵ҳ��������п��Կ������ݵ��������ĸ߶ȣ�һ�������һ�����������µ�״̬�����ϵ����������ҳ�������޹ء�

	offsetHeight
	IE��Opera ��Ϊ offsetHeight = clientHeight + ������ + �߿�
	NS��FF ��Ϊ offsetHeight ����ҳ����ʵ�ʸ߶ȣ�����С�� clientHeight��

	scrollHeight
	IE��Opera ��Ϊ scrollHeight ����ҳ����ʵ�ʸ߶ȣ�����С�� clientHeight��
	NS��FF ��Ϊ scrollHeight ����ҳ���ݸ߶ȣ�������Сֵ�� clientHeight��

	�򵥵�˵
	clientHeight ����͸������������ݵ��������߶ȡ�
	NS��FF ��Ϊ offsetHeight �� scrollHeight ������ҳ���ݸ߶ȣ�ֻ��������ҳ���ݸ߶�С�ڵ��� clientHeight ʱ��scrollHeight ��ֵ�� clientHeight���� offsetHeight ����С�� clientHeight��
	IE��Opera ��Ϊ offsetHeight �ǿ������� clientHeight �������ӱ߿�scrollHeight ������ҳ����ʵ�ʸ߶ȡ�

	�ܽ�һ�£��ڱ�׼ģʽ�£����ǻ�ȡ�ĵ��ɼ�����ķ������£�
	function getViewSizeWithoutScrollbar(){//������������
		return{
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight
		}
	}
	function getViewSizeWithScrollbar(){//����������
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
#T=�жϱ����Ƿ����
	if(!a || !a.length || a=='undefined'){}
#T=�Д������Ƿ����
	if(!$(id)){
		return false;//alert('���󲻴���');
	}
#T=��̬����Js��head��
	var _hd=$(document).getElement('head');
	var _js=new Element('script',{charset:'UTF-8',src:'/img/popup.js',type:'text/javascript'});
	_js.inject(_hd);
#T=���c���������ֵ
	ul=$$('ul');
	ul.addEvent('click',function(){
		alert(ul.indexOf(this));
	});
	��
	ul=$$('ul');
	ul.each(function($I,i){
		$I.onclick=function(){
			alert(i);
		};
	})
#T=click='fun(i)' iҪ$(i)�ż���IE
click='fun(i)' iҪ$(i)�ż���IE
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
	
	//���I�P�|�l�¼�
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


#T= �� Browse ��
	������������:
		Browser.Features.xpath-(boolean)��ǰ������Ƿ�֧��XPath����DOM��ѯ
		Browser.Features.xhr-(boolean)��ǰ������Ƿ�֧��ԭ����XMLHTTP����
		Browser.Features.air - (boolean)��������֧��AIR.
		Browser.Features.query - (boolean)��������֧��querySelectorAll.
		Browser.Features.json - (boolean)����������һ��ԭ����JSON����.

	�������Ⱦ�������:
		Browser.ie - (boolean)����������Internet Explorer.
		Browser.firefox - (boolean)����������Firefox.
		Browser.safari - (boolean)����������Safari.
		Browser.chrome - (boolean)����������Chrome.
		Browser.opera - (boolean)����������Opera.
	ʾ��:
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
	����ϵͳƽ̨:
	    Browser.Platform.mac - (boolean)���ƽ̨��Mac.
		Browser.Platform.win - (boolean)���ƽ̨��Windows.
		Browser.Platform.linux - (boolean)���ƽ̨��Linux.
		Browser.Platform.ios - (boolean)���ƽ̨��iOS.
		Browser.Platform.android - (boolean)���ƽ̨��Android
		Browser.Platform.webos - (boolean)���ƽ̨��WebOS
		Browser.Platform.other - (boolean)���ƽ̨��neither Mac,Windows,Linux,Android,WebOS nor iOS.
		Browser.Platform.name - (string)ƽ̨����
		Browser.Plugins.Flash - (object) -�Ƿ�װ����Ӧ�汾��flash���,���û���򷵻�0
		Browser.Plugins.Flash.version - (number)�Ѱ�װ��flash����汾.
		Browser.Plugins.Flash.build - (number)flash����Ĺ����汾

		Browser.Request - (object)XMLHTTP����
		Browser.exec('alert("Moo!");');
#T= �� Element ��
	Creates a new Element of the type passed in.
	�﷨:
	var myEl=new Element(element[,properties]);

	����:
	element - (mixed) The tag name for the Element to be created or an actual DOM element or a CSS selector.
	properties - (object,optional) Calls the Single Argument version of Element:set with the properties object passed in.

	����:
	(element) A new MooTools extended HTML Element.

	ʾ��:
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

	ע��:
	Because the element name is parsed as a CSS selector,colons in namespaced tags have to be escaped. So new Element('fb\:name) becomes <fb:name>.

	�μ�:
	$,Element:set

	�﷨:
	var myElements=new Elements(elements[,options]);

	����:
	elements - (mixed) An array of elements or an HTMLCollection Object.

	����:
	(array) An array-like Elements collection with the Element,Elements and Array methods.

	ʾ��:
	Set Every Paragraph's Color to Red:
		$$('p').each(function(el){
		el.setStyle('color','red');
	});
	//Because $$('myselector') also accepts Element methods,the below
	//example has the same effect as the one above.
	$$('p').setStyle('color','red');

	Create Elements From an Array:
	var myElements=new Elements(['myElementID',$('myElement'),'myElementID2',document.getElementById('myElementID3')]);

	ע��:
	In MooTools,every DOM function which returns a collection of nodes (such as $$) returns the nodes as instances of Elements.
	Because Elements is an array-like-object,it accepts all the Array methods,while giving precedence to Element and Elements methods.
	Every node of the Elements instance has all the Element methods.
#T= �� IFrame ��
	Creates an IFrame HTML Element and extends its window and document with MooTools.
	�﷨:
	var myIFrame=new IFrame([el][,props]);

	����:
	el - (mixed,optional) The id of the IFrame to be converted,or the actual IFrame element. If its not passed,a new IFrame will be created (default).
	props - (object,optional) The properties to be applied to the new IFrame. Same as Element:constructor props argument.

	����:
	(element) A new IFrame HTML Element.

	ʾ��:
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

	ע��:
	If the IFrame already exists and has a different name than id,the name will be made the same as the id.
	An IFrame's window and document will not be extended with MooTools methods.
#T= 
 
#T= Element
 Element
#T=����������������������
����������������������
#T=html
	Sets the innerHTML of the Element.
	�﷨:
	myElement.set('html',html);

	����:
	html - (string) The new content as HTML string.

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement"></div>

	Js:
	$('myElement').set('html','<div></div><p></p>');

	���:
	<div id="myElement">
		<div></div>
		<p></p>
	</div>

	������÷�:
	Returns the inner HTML of the Element.

	�﷨:
	myElement.get('html');

	����:
	(text) This Element's innerHTML.
#T=text
	Sets the inner text of the Element.
	�﷨:
	myElement.set('text',text);

	����:
	text - (string) The new text content for the Element.

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement"></div>

	Js:
	$('myElement').set('text','some text');
	//the text of myElement is now 'some text'.

	���:
	<div id="myElement">some text</div>

	������÷�:
	Gets the inner text of the Element.

	�﷨:
	var myText=myElement.get('text');

	����:
	(string) The text of the Element.

	ʾ��:
	<div id="myElement">my text</div>

	Js:
	var myText=$('myElement').get('text');//myText='my text'.
#T=tag
	Returns the tag name of the Element in lower case.
	�﷨:
	var myTag=myElement.get('tag');

	����:
	(string) The tag name in lower case.

	ʾ��:
	<img id="myImage" />

	Js:
	var myTag=$('myImage').get('tag');//myTag='img'
#T= 
 
#T= Selector
 Selector
#T=����������������������
����������������������
#T=$
	The dollar function is an alias for document:id if the $ variable is not set already. However it is not recommended to use more frameworks,the $ variable can be set by another framework or script. MooTools will detect this and determine if it will set the $ function so it will not be overwritten.
	ʾ��:
	var myElement=$('myElement');
	var myElement2=document.id('myElement');
	myElement == myElement2;//returns true
	(function($){
		//Now you can use $ safely in this closure
	})(document.id)
#T=$$
	Selects and extends DOM elements. Return an Elements instance. The Element instance returned is an array-like object,supporting every Array method and every Element method.
	�﷨:
	var myElements=$$(argument);

	����:
	selector - (string) A CSS selector
	elements - (elements),(collection) or (array) An enumerable list of elements
	element,element - (element) any number of elements as arguments

	����:
	(elements) - An array-like Elements collection of all the DOM elements matched,extended with document:id.

	ʾ��:
	����Tag Names�õ����Element:
	$$('a');//returns all anchor elements in the page.

	Get an Elements instance by passing multiple elements:
	$$(element1,element2,element3);//returns an Elements instance containing these 3 elements.

	Convert any array or collection of elements to an Elements instance:
	$$([element1,element2,element3]);//returns an Elements instance containing these 3 elements.
	$$(document.getElementsByTagName('a'));//returns an Elements instance containing the result of the getElementsByTagName call.

	ʹ��CSS Selectors:
	$$('#myElement');//returns an Elements instance containing only the element with the id 'myElement'.
	$$('#myElement a.myClass');//returns an Elements instance of all anchor tags with the class 'myClass' within the DOM element with id 'myElement'.
	$$('a,b');//returns an array of all anchor and bold elements in the page.

	ע��:
	Since MooTools 1.3 this function does not accept multiple collections or multiple strings as arguments.
	If an expression doesn't find any elements,an empty Elements instance will be returned.
	The return type of element methods run through $$ is always an Elements instance,regardless of the amount of results.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=document.id
	The document.id function has a dual purpose:Getting the element by its id,and making an element in Internet Explorer "grab" all the Element methods.
	�﷨:
	var myElement=document.id(el);

	����:
	el - The Element to be extended. Can be one of the following types:
		(element) The element will be extended if it is not already.
		(string) A string containing the id of the DOM element desired.
		(object) If the object has a toElement method,toElement will be called to get the Element.

	����:
	(element) A DOM element.
	(null) Null if no matching id was found or if toElement did not return an element.

	ʾ��:
	����һ��ID�õ�һ��DOM Element:
	var myElement=document.id('myElement');

	�������õõ�һ��DOM Element:
	var div=document.getElementById('myElement');
	div=document.id(div);//the element with all the Element methods applied.

	ע��:
	This method is useful when it's unclear if working with an actual element or an id. It also serves as a shorthand for document.getElementById().
	In Internet Explorer,the Element is extended the first time document.id is called on it,and all the Element Methods become available.
	Browsers with native HTMLElement support,such as Safari,Firefox,and Opera,apply all the Element Methods to every DOM element automatically.
	Because MooTools detects if an element needs to be extended or not,this function may be called on the same Element many times with no ill effects.
#T=--Select����--
--Select����--
#T=Selector.getElement('div')
	Gets the first descendant element whose tag name matches the tag provided. CSS selectors may also be passed.
	�﷨:
	var myElement=myElement.getElement(tag);

	����:
	tag - (string) Tag name of the element to find or a CSS Selector.

	����:
	(mixed) If a match is found,the Element will be returned. Otherwise,returns null.

	ʾ��:
	var firstDiv=$(document.body).getElement('div');

	ע��:
	This method is also available for Document instances.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=Selector.getElements('a') ����array
	Collects all decedent elements whose tag name matches the tag provided. CSS selectors may also be passed.
	�﷨:
	var myElements=myElement.getElements(tag);

	����:
	tag - (string) String of the tag to match or a CSS Selector.

	����:
	(array) An Elements array of all matched Elements.

	ʾ��:
	var allAnchors=$(document.body).getElements('a');
	$(Id).getElements('option').destroy();

	ע��:
	This method is also available for Document instances.
	Default Selectors supported are the same as you can find on W3C CSS3 selectors.
#T=Selector.getElementById('myChild')
	Gets the element with the specified id found inside the current Element.
	�﷨:
	var myElement=anElement.getElementById(id);

	����:
	id - (string) The ID of the Element to find.

	����:
	(mixed) If a match is found,returns that Element. Otherwise,returns null.

	ʾ��:
	var myChild=$('myParent').getElementById('myChild');

	ע��:
	This method is not provided for Document instances as document.getElementById is provided natively.
#T=Selector.getElementsByTagName('tag')
	destroy:function(){
		var children = clean(this).getElementsByTagName('*');
		Array.each(children, clean);
		Element.dispose(this);
		return null;
	}
#T=Selector.contains ƥ��ýڵ�����к���ӽڵ�
	Checks all descendants of this Element for a match.
	�﷨:
	var result=myElement.contains(el);

	����:
	el - (mixed) Can be an Element reference or string id.

	����:
	(boolean) Returns true if the element contains passed in Element is a child,otherwise false.

	ʾ��:
	<div id="Darth_Vader">
		<div id="Luke"></div>
	</div>

	Js:
	if($('Darth_Vader').contains('Luke')) alert('Luke,I am your father.');//tan tan tannn...
#T=getPrevious ���ر�Ԫ�ص�ǰһ���ֵ�Ԫ��(�������ı��ڵ�)
	Returns the previousSibling of the Element (excluding text nodes).
	�﷨:
	var previousSibling=myElement.getPrevious([match]);

	����:
	match - (string,optional):A tag name to match the the found element(s) with. A full CSS selector can be passed.

	����:
	(mixed) The previous sibling Element or null if none found.
#T=getAllPrevious ���ر�Ԫ��֮ǰ�������ֵ�Ԫ��
	Like Element:getPrevious,but returns a collection of all the matched previousSiblings.
#T=getSiblings ���ر�Ԫ��֮ǰ��֮��������ֵܽڵ�
	Like Element:getAllPrevious but returns all Element's previous and next siblings (excluding text nodes). Returns as Elements.
	�﷨:
	var siblings=myElement.getSiblings([match]);

	����:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	����:
	(array) A Elements array with all of the Element's siblings,except the text nodes.
#T=getNext ���ر�Ԫ�غ��һ���ֵ�Ԫ��(�������ı��ڵ�)
	As Element:getPrevious,but tries to find the nextSibling (excluding text nodes).
	�﷨:
	var nextSibling=myElement.getNext([match]);

	����:
	match - (string,optional):A comma seperated list of tag names to match the found element(s) with. A full CSS selector can be passed.

	����:
	(mixed) The next sibling Element or null if none found.
#T=getAllNext ���ر�Ԫ��֮��������ֵ�Ԫ��
	Like Element.getNext,but returns a collection of all the matched nextSiblings.
#T=getFirst ��ȡ��һ����Ԫ��(�������ı��ڵ�)
	Gets the first element that matches the passed in expression.
	�﷨:
	var firstElement=myElement.getFirst([match]);

	����:
	match - (string,optional):A full CSS selector to match the found element(s) with.

	����:
	(mixed) The first found element or null if none found.
#T=getLast ��ȡ���һ����Ԫ��(�������ı��ڵ�)
	Gets the last element that matches the passed in expression.
	�﷨:
	var lastElement=myElement.getLast([match]);

	����:
	match - (string,optional):A full CSS selector to match the found element(s) with.

	����:
	(mixed) The last found element,or returns null if none found.
#T=getParent | getParents ��ȡֱ�Ӹ�Ԫ��
	Works as Element:getPrevious,but tries to find the parentNode.
	�﷨:
	var parent=myElement.getParent([match]);

	����:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	����:
	(mixed) The target Element's parent or null if no matching parent is found.

	ʾ��:
	$('id').getParent().setStyle('display','none');
	��
	brothers:function(match){//�õ������ֵܽڵ�,������������
		return this.getParent().getChildren(match).erase(this);//$('f').brothers();
	}
#T=getChildren ����������Ԫ��(�������ı��ڵ�)
	Returns all the Element's children (excluding text nodes). Returns as Elements.
	�﷨:
	var children=myElement.getChildren([match]);

	����:
	match - (string,optional):A tag name to match the found element(s) with. A full CSS selector can be passed.

	����:
	(array) A Elements array with all of the Element's children,except the text nodes.

	ʾ��:
	$('id').getChildren().setStyle('display','none');
	��
	brothers:function(match){//�õ������ֵܽڵ�,������������
		return this.getParent().getChildren(match).erase(this);//$('f').brothers();
	}

	ע��:
	The difference between the methods getChildren and getElements is that getChildren will only return its direct children while getElements searches for all the Elements in any depth.
#T= 
 
#T=$$('*') ѡȡ���е�Ԫ��,IE������
$$('*') ѡȡ���е�Ԫ��,IE������
#T=$$('','') ͬʱѡ����
	$$('^!','textarea')
#T=$$( = ) ����Ϊĳ���ض���ֵ
	$$('input[name=email]')
#T=$$( != ) ���Բ�����ĳ���ض���ֵ
	$$('input[name!=email]')
#T=$$( ^= ) ������ĳ��ֵ��ʼ
	$$('input[name^=email]')
#T=$$( $= ) ������ĳ��ֵ��β
	$$('input[name$=email]')
#T=$$( *= ) �����ڰ���ĳ��ֵ
	$$('input[name*=email]')
#T=$$( ~= ) 	
	�����Ե�ֵ������һϵ���ÿո�����Ķ��ֵ,(����,class="title featured home"),������Щֵ�е�һ��������ָ����ֵ"value"
	$$('input[class~=featured]')
#T=$$( |= )
	���Ե�ֵ����"value"������"value"��ʼ����������һ��"-"�ַ�,Ҳ����"value-"(����lang="zh-cn") 
	$$('input[lang|=zh]')
#T=$$('ul p') ѡ����������
	ѡȡbodyԪ��������в���µ�div
#T=$$('ul > li') ѡ�����
	ѡȡparentԪ���µ�child(��)Ԫ��,ֻ��һ��
#T=$$('.two + h2') ѡȡ������.twoԪ�غ��һ���ֵ�Ԫ��
	ѡȡh1����һ��h2Ԫ��,�������ֵܹ�ϵ,
#T=$$('.two ~') ѡȡ������.twoԪ�غ�������ֵ�Ԫ��
$$('.two ~') ѡȡ������.twoԪ�غ�������ֵ�Ԫ��
#T=$$('.two ~ li') ѡȡ������.twoԪ�غ�������ֵ�Ԫ��
$$('.two ~ li') ѡȡ������.twoԪ�غ�������ֵ�Ԫ��
#T=$$(' !~ ') �õ���һ���ֵ�Ԫ��
	Gets the previous siblings.
	ʾ��:
	$$('p.foo !~')            //Gets all previous siblings of <p class="foo">
	$$('p.foo !~ blockquote') //Gets every <blockquote> with a <p class="foo"> sibling somewhere *after* it
#T=$$(' ~~ ') �õ����е��ֵ�Ԫ��
	Gets all siblings.
	ʾ��:
	$$('p.foo ~~')            //Gets all previous and next siblings of <p class="foo">
	$$('p.foo ~~ blockquote') //Gets every <blockquote> with a <p class="foo"> sibling before OR after it
#T=$$(' ^ ') �õ���һ����Ԫ��
	Gets the first child of an element.
	ʾ��:
	$$('p.foo ^')       //Gets the first child of <p class="foo">
	$$('p.foo ^ strong')    //Gets every <strong> that is the first element child of a <p class="foo">
#T=$$(' !^ ') �õ����һ����Ԫ��
	Gets the last child of an element.
	ʾ��:
	$$('p.foo !^')      //Gets the last child of <p class="foo">
	$$('p.foo !^ strong')   //Gets every <strong> that is the last element child of a <p class="foo">
#T=$$(':not(?)) ƥ���?�����
	�� .foobar ��������� <div> �ı���Ϊ��ɫ
	$$('div:not(.foobar)').setStyle('background','#000');
#T= 
 
#T=[attr] ƥ������������Ե�Ԫ��
	�������к���id���Ե�divԪ��:
	$$('div[id]')
#T=[attr=value] ƥ�������������ĳ���ض�ֵ��Ԫ��
	��������name������newsletter��inputԪ��:
	$$("input[name='newsletter']").attr('checked',true);
#T=[attr!=value] ƥ������������ǲ�����ĳ���ض�ֵ��Ԫ��
	��������name���Բ���newsletter��inputԪ��:
	$$("input[name!='newsletter']").attr('checked',true);
#T=[attr^=value] ƥ���������������ĳЩֵ��ʼ��Ԫ��
	$$("input[name^='news']")
#T=[attr$=value] ƥ���������������ĳЩֵ��β��Ԫ��
	��������name��'letter'��β��inputԪ��:
	$$("input[name$='letter']")
#T=[attr*=value] ƥ��������������԰���ĳЩֵ��Ԫ��
	��������name����'man'��inputԪ��:
	$$("input[name*='man']")
#T=[attr~=value] �����Ե�ֵ������һϵ���ÿո�����Ķ��ֵ
	�����Ե�ֵ������һϵ���ÿո�����Ķ��ֵ,(����,class="title featured home"),������Щֵ�е�һ��������ָ����ֵ"value"	
	�������е�aԪ��,����class�����к���tit��Ԫ��
	$$('a[class~=tit]')
#T=[attr|=value] ƥ�����"-"�ַ���Ԫ��
	���Ե�ֵ����"value"������"value"��ʼ����������һ��"-"�ַ�,Ҳ����"value-"(����lang="zh-cn")	
	����佫ƥ������class���԰���"post"����"-"�ַ���divԪ��
	$$("[class|='post']")
#T=$$("input[id][name$='man']") ��������ѡ����
	��Ҫͬʱ����������ʱʹ���ҵ����к���id����,��������name��������man��β��:
	$$("input[id][name$='man']")
#T= 
 
#T=$$('p:index(2)') ��������ֵȡ��Ԫ��
	Matches the node at the specified index
	ʾ��:
	$$('p:index(2)');//Gets the third <p> tag.

	ע��:
	This is zero-indexed.
#T=$$('li:even') ƥ����������ֵΪż����Ԫ��
	�� 0 ��ʼ�������Զ���α��ѡ������
	ǿ���Ƽ�ʹ�ñ�ѡ���������nth-child(even), ��Ϊ�����ص���ʵ�ʵ�ż������Ԫ��
#T=$$('li:odd') ƥ����������ֵΪ������Ԫ��
	�� 0 ��ʼ�������Զ���α��ѡ������
	ǿ���Ƽ�ʹ�ñ�ѡ���������nth-child(odd), ��Ϊ�����ص���ʵ�ʵ���������Ԫ��
	
	ע��:
	This selector is not part of the w3c specification,therefore its index starts at 0. This selector is highly recommended over nth-child(odd),as this will return the real odd children.
#T=$$('td:even') �����¼�Ԫ��
	Matches every even child.
	ʾ��:
	$$('td:even');

	ע��:
	This selector is not part of the w3c specification,therefore its index starts at 0. This selector is highly recommended over nth-child(even),as this will return the real even children.
#T=$$(':checked') ����checked��Ԫ��
	Matches all Elements that are checked.
	ʾ��:
	$$(':checked')
	$('myForm').getElements('input:checked');
#T=$$(':enabled') ����enabled��Ԫ��
	Matches all Elements that are enabled.
	ʾ��:
	$$(':enabled')
	$$('*:enabled')
	$('myElement').getElements(':enabled');
#T=$$(':empty') ����empty��Ԫ��
	Matches all elements which are empty.
	ʾ��:
	$$(':empty');
	$('myElement').getElements(':empty');
#T=$$(':focus') ������ȡ�ý����Ԫ��
	Gets the element in focus.
	ʾ��:
	$$(':focus');//Gets the element in focus
#T=$$('select option:selected')ƥ������ѡ�е�optionԪ��
	��������ѡ�е�ѡ��Ԫ��:
	$$('select option:selected')
	
	�Զ���α��ѡ����
#T=$$('input:not([type="submit"])') ����not�涨֮���Ԫ��
	Matches all elements that do not match the selector.

	ע��:
	The Slick implementation of the:not pseudoClass is a superset of the standard. i.e. it is more advanced than the specification.

	ʾ��:
	$$(':not(div.foo)');//all elements except divs with class 'foo'
	$$('input:not([type="submit"])');//all inputs except submit buttons
	myElement.getElements(':not(a)');
	$$(':not(ul li)');
	$$('.post p:not(.date)');
#T=$$('li:nth-child(2n+1)') ��������ȡ��Ԫ��(����,ż��)
	Matches every nth child.
	nth-child��1��ʼ
	�÷�:
	':nth-child(nExpression)'

	����:
	nExpression - (string) A nth expression for the "every" nth-child.

	ʾ��:
	$$('#myDiv:nth-child(2n)');//Returns every ż�� child.
	$$('#myDiv:nth-child(n)');//Returns all children.
	$$('#myDiv:nth-child(2n+1)') //Returns every ���� child.
	$$('#myDiv:nth-child(4n+3)') //Returns Elements 3,7,11,15,�ȵ�.

	����������Ԫ��:
	':nth-child(odd)'

	����ż����Ԫ��:
	':nth-child(even)'

	���ֵܽڵ����Ԫ��:
	':nth-child(only)'

	��һ����Ԫ��:
	'nth-child(first)'

	���һ����Ԫ��:
	'nth-child(last)'

	ע��:
	This selector respects the w3c specifications,so it has 1 as its first child,not 0. Therefore nth-child(odd) will actually select the even children,if you think in zero-based indexes.
#T=$$('td:first-child') ѡȡÿ����Ԫ�صĵ�һ����Ԫ��
	Matches the first child.
	�÷�:
	':first-child'

	ʾ��:
	$$('td:first-child');

	��ÿ��ul�в��ҵ�һ��li:
	$$('ul li:first-child')
#T=$$('td:last-child') ƥ�����һ����Ԫ��
	Matches the last child.
	':last'ֻƥ��һ��Ԫ��,����ѡ�����Ϊÿ����Ԫ��ƥ��һ����Ԫ��

	�÷�:
	':last-child'

	ʾ��:
	$$('td:last-child');

	��ÿ��ul�в������һ��li:
	$$('ul li:last-child')
#T=$$('td:only-child') Ψһһ����Ԫ��
	Matches an only child of its parent Element.
	���ĳ��Ԫ���Ǹ�Ԫ����Ψһ����Ԫ��,�ǽ��ᱻƥ�������Ԫ���к�������Ԫ��,�ǽ����ᱻƥ��

	�÷�:
	':only-child'

	ʾ��:
	$$('td:only-child');
#T=$$('p:contains("find me")') ���а���ָ�����ֵ�Ԫ��
	Matches all the Elements which contains the text.
	����:
	text - (string) The text that the Element should contain.

	ʾ��:
	$$('p:contains("find me")');
#T=filter(selector)����
	Filters a collection of elements by a given tag name. This method will be able to filter by any selector. It also works like Array:filter,by filtering collection of elements with a function.
	�﷨:
	var filteredElements=elements.filter(selector);

	����:
	selector - (mixed) A single CSS selector.

	����:
	(array) A subset of this Elements instance.
#T=--�������--
	Reverse Combinators redirect the flow of selectors and combinators. Slick implements these by prepending ! to a selector or combinator.

	ʾ��:
	<div class="foo"><li id="drop_here" class="draggable">f
	<p>1</p>
	<p>2</p>
	<p class="foo">3</p>
	<p>4</p>
	</li>
	</div>

	document.getElement('p ! div')    //һ��<div>��<p>������
	document.getElement('p !> li')   //һ��<li>��<p>�ĸ���

	//<p>2</p>���ᱻѡ��
	document.getElement('.foo !+ p')  //��ȡ��һ�����ڵ��ֵ�Ԫ��

	ע��:
	Reverse Combinators are used internally by MooTools for many of our traversal methods.
	They offer an extremely concise and powerful alternative to traversal methods like getParent().
#T= �� Function ��
 �� Function ��
#T=αԪ��
	::first-lineαԪ�ؽ�ƥ��block��inline-block��table-caption��table-cell�ȵȼ���Ԫ�صĵ�һ��
	��һƪ���µĵ�һ�����ָĳ�Сд��ĸ��
	h1 + p::first-line {
		font-variant: small-caps;  	
	}

	::first-letterαԪ�ؽ���ƥ��һ���ı���ĵ�һ����ĸ��������ͬһ���������һЩ����Ԫ�أ�����ͼƬ��
	��::first-lineα��һ����::first-letterͨ�����ڸ��ı�Ԫ������Ű�ϸ�ڣ������³���ĸ������ĸ��
	���������ʹ��::first-letterαԪ�ش��������³�������:
	p{font-size: 12px;}
	p::first-letter{
		font-size: 24px;
		float: left;
	}

	::before��::after αԪ��������һ��Ԫ�ص�ǰ������������ݣ���CSS������
	��ЩԪ�ؽ��̳����ǽ����ӵ�Ԫ�صĴ󲿷����ԡ�
	�������������ҳ���е�ͼ�������ǰ��������֡�Graphic number x:�����㽫����д���֡�Graphic number���������Լ��ֶ�������֣�
	.post{counter-reset: image;}
	p.description::before{content:"Figure number " counter(image) ": ";counter-increment:image;}
	���ȣ����Ǹ���HTML��������image�����������������ǿ�����Ӹ����Ե�ҳ���body��ͬ������Ҳ���Ը��ü��������κ�һ�����֣�ֻҪ���룬ֻҪ���ǳ���ʹ��ͬ�����������������Լ����԰ɣ�
	��ô��������classΪ��description����ÿһ������֮ǰ�����һ������: ��Figure number �� �� ע��ֻ����������������д�����ݲŻᱻ������ҳ���У���������ҲҪ���һ���ո�
	Ȼ�����Ǿ�����counter(image):�⽫�õ�����֮ǰ��.postѡ�����ж�������ԡ���Ĭ�ϻ������1��ʼ��
	��һ�������������ʾ������֪������ÿһ��p.description������Ҫ��image����������1 (counter-increment: image)��
	����������������ô���ӣ����һ���ҳ������á�
	::before��::afterαԪ�س���ֻʹ��content���ԣ������һЩ������Ű�Ԫ�أ�������������չʾ�����������һ�ָ���ǿ��Ľ��counter-reset��counter-increment���Եķ�ʽ��ʹ�����ǡ�
	��Ȥ����: ::first-line ��::first-letter αԪ�ؿ���ƥ��ʹ��::beforeαԪ�����ɵ����ݣ�������ڵĻ�
#T=�Զ���ѡ����
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

	ʹ�ö���:
	Additionally,you can access these custom getters and setters using an object as the parameter for the set method.

	ʾ��:
	//using set:
	$(divElement).set({html:'<p>Hello <em>People</em>!</p>',style:'background:red'});
	//for new Elements (works the same as set):
	new Element('input',{type:'checkbox',checked:true,disabled:true});

	ע��:
	Automatically returns the element for setters.
	Since MooTools 1.3 this is a native JavaScript Object and not an instance of the deprecated Hash
#T=Slick.definePseudo �����Լ���αѡ���ִ�
	definePseudo allows you to create your own custom pseudo selectors.
	ʾ��:
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
#T=����������������������
����������������������
#T= �� Css ��
 �� Css ��
#T=hasClass ���Ԫ�����Ƿ����ָ������ʽ��
	Tests the Element to see if it has the passed in className.
	�﷨:
	var result=myElement.hasClass(className);

	����:
	className - (string) The class name to test.

	����:
	(boolean) Returns true if the Element has the class,otherwise false.

	ʾ��:
	<div id="myElement" class="testClass"></div>

	Js:
	$('myElement').hasClass('testClass');//returns true
#T=addClass ���ָ����ʽ����Ԫ���ϲ�����,����Ӹ���ʽ��
	Adds the passed in class to the Element,if the Element doesnt already have it.
	�﷨:
	myElement.addClass(className);

	����:
	className - (string) The class name to add.

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement" class="testClass"></div>

	Js:
	$('myElement').addClass('newClass');

	���:
	<div id="myElement" class="testClass newClass"></div>
#T=removeClass ��ָ����ʽ����Ԫ����ɾ��
	Works like Element:addClass,but removes the class from the Element.
	�﷨:
	myElement.removeClass(className);

	����:
	className - (string) The class name to remove.

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement" class="testClass newClass"></div>

	Js:
	$('myElement').removeClass('newClass');

	���:
	<div id="myElement" class="testClass"></div>
#T=toggleClass ɾ��Ԫ����ָ������ʽ��
	Adds or removes the passed in class name to the Element,depending on whether or not it's already present.
	�﷨:
	myElement.toggleClass(className,force);

	����:
	className - (string) The class to add or remove.
	force - (boolean,optional) Force the class to be either added or removed

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement" class="myClass"></div>

	Js:
	$('myElement').toggleClass('myClass');

	���:
	<div id="myElement" class=""></div>

	Js:
	$('myElement').toggleClass('myClass');

	���:
	<div id="myElement" class="myClass"></div>
#T=setStyle ��һ��style��ֵ
	Sets a CSS property to the Element.
	�﷨:
	myElement.setStyle(property,value);

	����:
	property - (string) The property to set.
	value - (mixed) The value to which to set it. Numeric values of properties requiring a unit will automatically be appended with 'px'.

	����:
	(element) This element.

	ʾ��:
	//Both lines have the same effect.
	$('myElement').setStyle('width','300px');//the width is now 300px.
	$('myElement').setStyle('width',300);//the width is now 300px.

	ע��:
	All number values will automatically be rounded to the nearest whole number.
#T=getStyle ��ȡһ��styleֵ
	Returns the style of the Element given the property passed in.
	�﷨:
	var style=myElement.getStyle(property);

	����:
	property - (string) The css style property you want to retrieve.

	����:
	(string) The style value.

	ʾ��:
	$('myElement').getStyle('width');//returns "300px".
	$('myElement').getStyle('width').toInt();//returns 300.
#T=setStyles �����style��ֵ
	Applies a collection of styles to the Element.
	�﷨:
	myElement.setStyles(styles);

	����:
	styles - (object) An object of property/value pairs for all the styles to apply.

	����:
	(element) This element.

	ʾ��:
	$('myElement').setStyles({
		border:'1px solid #000',
		width:300,
		height:400
	});

	�μ�:
	Element:getStyle
#T=getStyles ��ȡ���styleֵ
	Returns an object of styles of the Element for each argument passed in.
	�﷨:
	var styles=myElement.getStyles(property[,property2[,property3[,...]]]);

	����:
	properties - (strings) Any number of style properties.

	����:
	(object) An key/value object with the CSS styles as computed by the browser.

	ʾ��:
	$('myElement').getStyles('width','height','padding');
	//returns{width:'10px',height:'10px',padding:/10px 0px 10px 0px'}
#T=getSize �õ���Ⱥ͸߶�
	Returns the height and width of the Element,taking into account borders and padding. The following method is also available on the Window object.
	�﷨:
	myElement.getSize();

	����:
	(object) An object containing the width (as x) and the height (as y) of the target Element.

	ʾ��:
	var size=myElement.getSize();
	alert('The element is '+size.x+' pixels wide and '+size.y+'pixels high.');

	ע��:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getCoordinates �õ�����
	Returns an object with width,height,left,right,top,and bottom coordinate values of the Element.
	�﷨:
	myElement.getCoordinates(relative);

	����:
	relative - (element,optional) if set,the position will be relative to this element,otherwise relative to the document.

	����:
	(object) An object containing the Element's current:top,left,width,height,right,and bottom.

	ʾ��:
	var myValues=$('myElement').getCoordinates();

	����:{
		top:50,
		left:100,
		width:200,
		height:300,
		right:300,
		bottom:350
	}

	�μ�:
	Element:getPosition

	ע��:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getOffsetParent
	Returns the parent of the element that is positioned,if there is one.
	�﷨:
	myElement.getOffsetParent();

	����:
	(mixed) If the element has a parent that is positioned,it returns that element,otherwise it returns null.
#T=getPosition
	Returns the real offsets of the element.
	�﷨:
	myElement.getPosition(relative);

	����:
	relative - (Element,defaults to the document) If set,the position will be relative to this Element.

	����:
	(object) An object with the x and y coordinates of the Element's position.

	ʾ��:
	$('element').getPosition();//returns{x:100,y:500};

	�μ�:
	QuirksMode:Find position

	ע��:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=setPosition
	Sets the position of the element's left and top values to the x/y positions you specify.
	�﷨:
	myElement.setPosition(positions);

	����:
	positions - (object) an object with x/y values (integers or strings,i.e. 10 or "10px")

	����:
	(element) the element that is positioned.

	ʾ��:
	myElement.setPosition({x:10,y:100});
#T= �� Method ��
 �� Method ��
#T=send �ύһ��form
	Element Method:send
	Sends a form or a container of inputs with an HTML request.

	�﷨:
	myElement.send(url);

	����:
	url - (string,optional) The url you want to send the form or the "container of inputs" to. If url is omitted,the action of the form will be used. url cannot be omitted for "container of inputs".

	����:
	(element) This Element.

	ʾ��:
	<form id="myForm" action="submit.php">
		<p>
			<input name="email" value="bob@bob.com" />
			<input name="zipCode" value="90210" />
		</p>
	</form>

	Js:
	$('myForm').send();

	ע��:
	The URL is taken from the action attribute of the form.
#T=set('text','text goes here')
	This is a "dynamic arguments" method. Properties passed in can be any of the 'set' properties in the Element.Properties Object.
	�﷨:
	myElement.set(arguments);

	����:
	�������� (property,value)
	property - (string) The string key from the Element.Properties Object representing the property to set.
	value - (mixed) The value to set for the specified property.
	һ������ (properties)
	properties - (object) Object with its keys/value pairs representing the properties and values to set for the Element (as described below).

	����:
	(element) This Element.

	ʾ��:
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

	���Object:
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

	ע��:
	All the property arguments are passed to the corresponding method of the Element.Properties Object.
	If no matching property is found in Element.Properties,it falls back to Element:setProperty.
	Whenever using Element:setProperty to set an attribute,pass in the lowercase,simplified form of the property. For example:
		use 'for',not 'htmlFor',
		use 'class',not 'className'
		use 'frameborder',not 'frameBorder'
		etc.

	�μ�:
	Element,Element.Properties,Element:setProperty,Element:addEvents,Element:setStyles
#T=get('tag')
	This is a "dynamic arguments" method. Properties passed in can be any of the 'get' properties in the Element.Properties Object.
	�﷨:
	myElement.get(property);

	����:
	property - (string) The string key from the Element.Properties Object representing the property to get.

	����:
	(mixed) The result of calling the corresponding 'get' function in the Element.Properties Object.

	ʾ��:
	Using Custom Getters:
	var tag=$('myDiv').get('tag');//returns "div".

	Fallback to Element Attributes:
	var id=$('myDiv').get('id');//returns "myDiv".
	var value=$('myInput').get('value');//returns the myInput element's value.

	ע��:
	If the corresponding accessor doesn't exist in the Element.Properties Object,the result of Element:getProperty on the property passed in is returned.

	�μ�:
	Element,Element.Properties,Element:getProperty
#T=erase('id') ɾ������
	This is a "dynamic arguments" method. Properties passed in can be any of the 'erase' properties in the Element.Properties Object.
	�﷨:
	myElement.erase(property);

	����:
	property - (string) The string key from the Element.Properties Object representing the property to erase.

	����:
	(mixed) The result of calling the corresponding 'erase' function in the Element.Properties Object.

	ʾ��:
	$('myDiv').erase('id');//Removes the id from myDiv.
	$('myDiv').erase('class');//myDiv element no longer has any class names set.

	ע��:
	If the corresponding eraser doesn't exist in the Element.Properties Object,Element:removeProperty is called with the property passed in.

	�μ�:
	Element,Element.Properties,Element:removeProperty
#T=match('div') ���Ը�Ԫ���Ƿ�ƥ�䴫��Ĳ���
	Tests this Element to see if it matches the argument passed in.
	�﷨:
	myElement.match(match);

	����:
	match - can be a string or element
		(string) The tag name to test against this element. Any single CSS selectors may also be passed.
		(element) An element to match;returns true if this is the actual element passed in.

	����:
	(boolean) If the element matched,returns true. Otherwise,returns false.

	ʾ��:
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
#T=inject ��ָ��Ԫ�ص�ָ��λ���в��뱾Ԫ��
	Injects,or inserts,the Element at a particular place relative to the Element's children (specified by the second the argument).
	�﷨:
	myElement.inject(el[,where]);

	����:
	el - (mixed) el can be the id of an element or an element.
	where - (string,optional:defaults to 'bottom') The place to inject this Element. Can be 'top','bottom','after',or 'before'.

	����:
	(element) This Element.

	ʾ��:
	var myFirstElement =new Element('div',{id:'myFirstElement'});
	var mySecondElement=new Element('div',{id:'mySecondElement'});
	var myThirdElement =new Element('div',{id:'myThirdElement'});

	���:
	<div id="myFirstElement"></div>
	<div id="mySecondElement"></div>
	<div id="myThirdElement"></div>

	���뵽�ײ�:
	myFirstElement.inject(mySecondElement);

	���:
	<div id="mySecondElement">
		<div id="myFirstElement"></div>
	</div>

	���뵽ͷ��:
	myThirdElement.inject(mySecondElement,'top');

	���:
	<div id="mySecondElement">
		<div id="myThirdElement"></div>
		<div id="myFirstElement"></div>
	</div>

	Inject before:
	myFirstElement.inject(mySecondElement,'before');

	���:
	<div id="myFirstElement"></div>
	<div id="mySecondElement"></div>

	Inject After:
	myFirstElement.inject(mySecondElement,'after');

	���:
	<div id="mySecondElement"></div>
	<div id="myFirstElement"></div>

	��selectָ��λ�ò����µ�option:
	var Val=new Element("option",{value:_v,text:_t});
	Val.inject($('sel').options[$('sel').selectedIndex],'before');

	�μ�:
	Element:adopt,Element:grab,Element:wraps
#T=grab ��Ԫ���ڲ���ָ��λ�������Ԫ��
	Works as Element:inject,but in reverse.

	Appends the Element at a particular place relative to the Element's children (specified by the where parameter).
	�﷨:
	myElement.grab(el[,where]);

	����:
	el - (mixed) el can be the id of an element or an Element.
	where - (string,optional:default 'bottom') The place to append this Element. Can be 'top','bottom','before' or 'after'.

	����:
	(element) This Element.

	ʾ��:
	<div id="first">
		<div id="child"></div>
	</div>

	Js:
	var mySecondElement=new Element('div#second');
	$('first').grab(mySecondElement);

	���:
	<div id="first">
		<div id="child"></div>
		<div id="second"></div>
	</div>

	Js:
	var mySecondElement=new Element('div#second');
	myFirstElement.grab(mySecondElement,'top');

	���:
	<div id="first">
		<div id="second"></div>
		<div id="child"></div>
	</div>

	�μ�:
	Element:adopt,Element:inject,Element:wraps
#T=adopt ��Ԫ���ڲ������Ԫ��
	Works like Element:grab,but allows multiple elements to be adopted and only appended at the bottom.

	Inserts the passed element(s) inside the Element (which will then become the parent element).
	�﷨:
	myParent.adopt(el[,others]);

	����:
	el - (mixed) The id of an element,an Element,or an array of elements.
	others - (mixed,optional) One or more additional Elements separated by a comma or as an array.

	����:
	(element) This Element.

	ʾ��:
	var myFirstElement =new Element('div#first');
	var mySecondElement=new Element('p#second');
	var myThirdElement =new Element('ul#third');
	var myFourthElement=new Element('a#fourth');
	var myParentElement=new Element('div#parent');
	myFirstElement.adopt(mySecondElement);
	mySecondElement.adopt('third',myFourthElement);
	myParent3.adopt([myFirstElement,new Element('span#another')]);

	���:
	<div id="parent">
		<p id="second">
			<ul id="third"></ul>
			<a id="fourth"></a>
		</p>
		<span id="another"></span>
	</div>

	�μ�:
	Element:grab,Element:inject,Element:wraps
#T=wraps ����Ԫ�ذ�����ָ����Ԫ�ص����(��Ϊ��Ԫ�صĸ�Ԫ��)
	Works like Element:grab,but replaces the element in its place,and then appends the replaced element in the location specified inside the this element.
	�﷨:
	myParent.wraps(el[,where]);

	����:
	el - (mixed) The id of an element or an Element.
	where - (string,optional:default 'bottom') The place to insert the passed in element. Can be 'top' or 'bottom'.

	����:
	(element) This Element.

	ʾ��:
	<div id="first"></div>

	Js:
	var mySecondElement=new Element('div#second').wraps('first');

	���:
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

	���:
	<div id="second">
		<div id="child"></div>
		<div id="first"></div>
	</div>

	Js:
	$('second').wraps('first','top');

	���:
	<div id="second">
		<div id="first"></div>
		<div id="child"></div>
	</div>
#T=appendText ��Ԫ�������һ���ı��ڵ�
	Works like Element:grab,but instead of accepting an id or an element,it only accepts text. A text node will be created inside this Element,in either the top or bottom position.
	�﷨:
	myElement.appendText(text[,where]);

	����:
	text - (string) The text to append.
	where - (string,optional:default 'bottom') The position to inject the text to. Values accepted are 'top','bottom','before' and 'after'.

	����:
	(element) The current Element instance.

	ʾ��:
	<div id="myElement">Hey.</div>

	Js:
	$('myElement').appendText(' Howdy.');

	���:
	<div id="myElement">Hey. Howdy.</div>
#T=dispose ��Ԫ�ش�DOM��ɾ��
	Removes the Element from the DOM.
	�﷨:
	var removedElement=myElement.dispose();

	����:
	(element) This Element. Useful to always grab the return from this function,as the element could be injected back.

	ʾ��:
	<div id="myElement"></div>
	<div id="mySecondElement"></div>

	Js:
	$('myElement').dispose();

	���:
	<div id="mySecondElement"></div>

	�μ�:
	MDC Element:removeChild
#T=destroy ɾ��Ԫ��������������Ԫ��(�������ڴ������ռ�)
	Removes the Element and its children from the DOM and prepares them for garbage collection.
	�﷨:
	myElement.destroy();

	����:
	(null)
#T=empty ɾ��������Ԫ��
	Empties an Element of all its children.
	�﷨:
	myElement.empty();

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement">
		<p></p>
		<span></span>
	</div>

	Js:
	$('myElement').empty();

	���:
	<div id="myElement"></div>
#T=clone ���Ʋ�����Ԫ�صĸ���
	Clones the Element and returns the cloned one.
	�﷨:
	var copy=myElement.clone([contents,keepid]);

	����:
	contents - (boolean,optional:defaults to true) When set to false the Element's contents are not cloned.
	keepid - (boolean,optional:defaults to false) When true the cloned Element keeps the id attribute,if present. Same goes for any of the cloned childNodes.

	����:
	(element) The cloned Element.

	ʾ��:
	<div id="myElement">ciao</div>

	Js:
	//clones the Element and appends the clone after the Element.
	var clone=$('myElement').clone().inject('myElement','after');

	���:
	<div id="myElement">ciao</div>
	<div>ciao</div>

	ע��:
	The returned Element does not have attached events. To clone the events use Element:cloneEvents.
	Values stored in Element.Storage are not cloned.
	The clone element and its children are stripped of ids,unless otherwise specified by the keepid parameter.

	�μ�:
	Element:cloneEvents.
#T=replaces �滻Ԫ��
	Replaces the passed Element with Element.
	�﷨:
	var element=myElement.replaces(el);

	����:
	el - (mixed) A string id representing the Element to be replaced,or an Element reference.

	����:
	(element) This Element.

	ʾ��:
	$('myNewElement').replaces($('myOldElement'));
	//$('myOldElement') is gone,and $('myNewElement') is in its place.

	�μ�:
	MDC Element:replaceChild
#T=toQueryString ��ȡ��Ԫ���е���������Ԫ��(��input,select��)��ֵ,�����ɲ�ѯ�ַ���
	Reads the child inputs of the Element and generates a query string based on their values.
	�﷨:
	var query=myElement.toQueryString();

	����:
	(string) A string representation of a all the input Elements' names and values.

	ʾ��:
	<form id="myForm" action="submit.php">
		<input name="email" value="bob@bob.com" />
		<input name="zipCode" value="90210" />
	</form>

	Js:
	$('myForm').toQueryString();//returns "email=bob@bob.com&zipCode=90210".
#T=getSelected ���������б��Ԫ���е�ѡ����
	Returns the selected options of a select element.
	�﷨:
	var selected=mySelect.getSelected();

	����:
	(array) An array of the selected elements.

	ʾ��:
	<select id="country-select" name="country">
		<option value="US">United States</option
		<option value ="IT">Italy</option>
	</select>

	Js:
	$('country-select').getSelected();//returns whatever the user selected.

	ע��:
	This method returns an array,regardless of the multiple attribute of the select element. If the select is single,it will return an array with only one item.
#T=getProperty ��ȡԪ�ص�һ������ֵ
	Returns a single element attribute.
	�﷨:
	var myProp=myElement.getProperty(property);

	����:
	property - (string) The property to be retrieved.

	����:
	(string) A string containing the Element's requested property.

	ʾ��:
	<img id="myImage" src="mootools.png" title="MooTools,the compact JavaScript framework" alt="" />

	Js:
	var imgProps=$('myImage').getProperty('src');//returns:'mootools.png'.
#T=getProperties ��ȡԪ�صĶ������ֵ
	Gets multiple element attributes.
	�﷨:
	var myProps=myElement.getProperties(properties);

	����:
	properties - (strings) Any number of properties to be retrieved.

	����:
	(object) An object containing all of the Element's requested properties.

	ʾ��:
	<img id="myImage" src="mootools.png" title="MooTools,the compact JavaScript framework" alt="" />

	Js:
	var imgProps=$('myImage').getProperties('id','src','title','alt');
	//returns:{id:'myImage',src:'mootools.png',title:'MooTools,the compact JavaScript framework',alt:''}
#T=setProperty ����Ԫ�ص�һ������
	Sets an attribute or special property for this Element.
	����:
	property - (string) The property to assign the value passed in.
	value - (mixed) The value to assign to the property passed in.

	����:
	(element) - This Element.

	ʾ��:
	<img id="myImage" />

	Js:
	$('myImage').setProperty('src','mootools.png');

	���:
	<img id="myImage" src="mootools.png" />

	ע��:
	Whenever using Element:setProperty to set an attribute,pass in the lowercase,simplified form of the property. For example:
	use 'for',not 'htmlFor',
	use 'class',not 'className'
	use 'frameborder',not 'frameBorder'
	etc.
#T=setProperties ����Ԫ�صĶ������
	Sets numerous attributes for the Element.
	����:
	properties - (object) An object with key/value pairs.

	����:
	(element) This Element.

	ʾ��:
	<img id="myImage" />

	Js:
	$('myImage').setProperties({
		src:'whatever.gif',
		alt:'whatever dude'
	});

	���:
	<img id="myImage" src="whatever.gif" alt="whatever dude" />
#T=removeProperty ɾ��Ԫ�ص�һ������
	Removes an attribute from the Element.
	�﷨:
	myElement.removeProperty(property);

	����:
	property - (string) The attribute to remove.

	����:
	(element) This Element.

	ʾ��:
	<a id="myAnchor" href="#" onmousedown="alert('click');"></a>

	Js:
	//Eww... inline JavaScript is bad! Let's get rid of it.
	$('myAnchor').removeProperty('onmousedown');

	���:
	<a id="myAnchor" href="#"></a>
#T=removeProperties ɾ��Ԫ�صĶ������
	Removes numerous attributes from the Element.
	�﷨:
	myElement.removeProperties(properties);

	����:
	properties - (strings) The attributes to remove,separated by comma.

	����:
	(element) This Element.

	ʾ��:
	<a id="myAnchor" href="#" title="hello world"></a>

	Js:
	$('myAnchor').removeProperties('id','href','title');

	���:
	<a></a>
#T=store ��Ԫ�صĴ洢���д��һ����
	Stores an item in the Elements Storage,linked to this Element.
	�﷨:
	myElement.store(key,value);

	����:
	key - (string) The key you want to assign to the stored value.
	value - (mixed) Any value you want to store.

	����:
	(element) This Element.

	ʾ��:
	$('element').store('someProperty',someValue);
#T=retrieve ��Ԫ�صĴ洢���л�ȡһ��ֵ
	Retrieves a value from the Elements storage.
	�﷨:
	myElement.retrieve(key[,default]);

	����:
	key - (string) The key you want to retrieve from the storage.
	default - (mixed,optional) Default value to store and return if no value is stored.

	����:
	(mixed) The value linked to the key.

	ʾ��:
	$('element').retrieve('someProperty');//returns someValue (see example above)
#T=eliminate ��Ԫ�صĴ洢���Ƴ�һ��key
	Eliminates a key from the Elements storage.
	�﷨:
	myElement.eliminate(key);

	����:
	key - (string) The key you want to eliminate from the storage.

	����:
	(mixed) The element/window/document.

	ʾ��:
	$('element').eliminate('someProperty');
#T=checked ��ѡ���Ƿ�ѡ����
	if(i.checked){
		alert('yes')
	}
#T= 


#T= Function
 Function
#T=����������������������
����������������������
#T= �� Type ��
 �� Type ��
#T=typeOf ���ض�������
	Returns the type of an object.
	�﷨:
	typeOf(obj);

	����:
	obj - (object) The object to inspect.

	����:
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

	ʾ��:
	var myString='hello';
	typeOf(myString);//returns "string"
#T=instanceOf //�����Ķ����Ƿ�Ϊ�ض����͵�ʵ��
	Checks if an object is an instance of a particular type.
	�﷨:
	instanceOf(item,object)

	����:
	item - (mixed) The item to check.
	object - (mixed) The type to compare it with.

	����:
	(boolean) Whether or not the item is an instance of the object.

	ʾ��:
	var foo=[];
	instanceOf(foo,Array) //returns true
	instanceOf(foo,String) //returns false
	var myClass=new Class();
	var bar=new myClass();
	instanceOf(bar,myClass) //returns true

	����:
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
#T=Generics *����
	Most methods of types can be used as generic functions. These are the already existing JavaScript methods,methods MooTools adds,or methods you implemented yourself.
	ʾ��:
	var everyArgBiggerThanTwo=function(){
		//Instead of this
		return Array.prototype.every.call(arguments,someFunction);
		//you can use
		return Array.every(arguments,someFunction);
	};

	This is useful if methods of a certain type should be used as function of another type. As the example above,it is used for the Arguments type,which is not a real array,so arguments.every(fn) would not work. However,Array.every(arguments,fn) does work in MooTools.
	�﷨:
	Type.methodName(thisArg[,arg1,arg2,...]);

	����:
	thisArg - (mixed) This is the subject,which is usually thisArg.method([arg1,arg2,...]);.
	arg1,arg2,... - (mixed) Additional arguments which will be passed as method arguments.

	����:
	(mixed) Anything the method usually returns.
#T= �� Function ��
 �� Function ��
#T=Function.from ���������Fun�򷵻�����,���򷵻�����������ݵĲ���
	If the passed argument is a function,it will return itself. Otherwise,it will return a function that returns the passed argument.
	�﷨:
	var foo=Function.from(obj);

	����:
	obj - (mixed) If this argument is a function,it will simply return itself. Otherwise,an object you wish to convert into a function that returns the argument.

	����:
	(function) Either the passed function or an anonymous function that returns the passed argument.

	ʾ��:
	var fn=Function.from(42);
	alert(fn());//alerts '42'
	var fn2=Function.from(fn);
	alert(fn2());//alerts '42'

	ע��:
	This function is equivalent to the following deprecated MooTools 1.2 methods:
	var fn1=Function.from();//equivalent to var fn1=function(){};
	var fn2=Function.from(foo);//equivalent to var fn2=function(){return foo};
#T=Function.attempt ����ִ��,����try
	Tries to execute a number of functions. Returns immediately the return value of the first non-failed function without executing successive functions,or null.
	�﷨:
	Function.attempt(fn[,fn,fn,fn,...]);

	����:
	fn - (function) Any number of functions to execute.

	����:
	(mixed) Standard return of the called function.
	(null) null if all the passed functions fail.

	ʾ��:
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

	ע��:
	This method is an equivalent of $try from MooTools 1.2.
#T= �� Method ��
 �� Method ��
#T=extend ΪFun��չ�µķ���������
	Extends a function with a new method or property.
	�﷨:
	myFunction.extend(key,value);
	//Or
	myFunction.extend(object);

	����:
	key - (string) The key of the method or property
	value - (mixed) The function or property value
	//OR
	object - (object) An object with the key value pairs to add multiple methods or properties

	����:
	(function) The function

	ʾ��:
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
#T=implement ����������Դ�����Fun�ķ���
	Implements a method to the prototype of the function.
	�﷨:
	myFunction.implement(key,value);
	//OR
	myFunction.implement(object);

	����:
	key - (string) The method of property name in the prototype
	value - (mixed) The function or another value in the prototype
	//OR
	object - (object) An object with key-value pairs to add multiple methods or properties to the function it's prototype.

	����:
	(function) The function

	ʾ��:
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

	ע��:
	The difference between implement and extend,is that implement adds the value to the prototype. So with implement each instance of the function will have this method or property while with extend the method or property is added to a single instance.
#T=attempt ����ִ��,����try
	Tries to execute a single function. Returns immediately the return value of the function if it does not fail,or null.
	�﷨:
	var myFunctionResult=myFunction.attempt(args[,bind]);

	����:
	args - (mixed) An argument,or array of arguments to run the function with.
	bind - (object,optional) The object that the "this" of the function will refer to.

	����:
	(mixed) This Function's return value.
	(null) null if the function fails.

	ʾ��:
	var myFunction=function(){
		return some.made.up.object;
	};
	myFunction.attempt();//returns 'null'
	var myFunction=function(val){
		return val;
	};
	myFunction.attempt(false);//returns 'false'

	�μ�:
	See Function.attempt for using more than one functions.
#T=pass ����ָ����Я�������Ͱ�this����ıհ�����
	Returns a closure with arguments and bind.
	�﷨:
	var newFunction=myFunction.pass([args[,bind]]);

	����:
	args - (mixed,optional) The arguments to pass to the function (must be an array if passing more than one argument).
	bind - (object,optional) The object that the "this" of the function will refer to.

	����:
	(function) The function whose arguments are passed when called.

	ʾ��:
	var myFunction=function(){
		var result='Passed:';
		for (var i=0,l=arguments.length;i < l;i++){
			result += (arguments[i]+' ');
		}
		return result;
	}
	var myHello=myFunction.pass('hello');
	var myItems=myFunction.pass(['peach','apple','orange']);

	//ִ�����ɵıհ�����:
	alert(myHello());//passes 'hello' to myFunction.
	alert(myItems());//passes the array of items to myFunction.
#T=bind ���°󶨺�����this�����õĶ���
	Changes the scope of this within the target function to refer to the bind parameter.
	�﷨:
	myFunction.bind([bind[,arg1,arg2,...]]);

	����:
	bind - (object,optional) The object that the "this" of the function will refer to.
	arg1,arg2,... - (mixed,optional) The arguments to pass to the function. If the bound function is called with other arguments the arguments are concatenated.

	����:
	(function) The bound function.

	ʾ��:
	function Fun(){
		this.setStyle('color', 'red');
	};
	var bFun = Fun.bind($('id'));��$('id')�󶨸�Fun��this
	bFun();
	��
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

	�μ�:
	Function:pass
#T=delay �ӳ�ִ�к���
	Delays the execution of a function by a specified duration.
	�﷨:
	var timeoutID=myFunction.delay(delay[,bind[,args]]);

	����:
	delay - (number) The duration to wait (in milliseconds).
	bind - (object,optional) The object that the "this" of the function will refer to.
	args - (mixed,optional) The arguments passed (must be an array if the arguments are greater than one).

	����:
	(number) The JavaScript timeout id (for clearing delays).

	ʾ��:
	var Fun=function(msg){
		alert(typeOf(this))//�鿴���󶨶��������
		alert(this.get('tag')+'|'+msg);//��ʾ�������ƺʹ��ݵĲ���
	};
	//2���ִ��Fun,ͬʱ��id='tab1'������󴫵ݸ�Fun�����������thisΪ$('tab1'),Ȼ�󴫵�һ������
	Fun.delay(2000,$('tab1'),'��');
	��
	var myFunction=function(){alert('moo! Element id is:'+this.id)};
	//wait 50 milliseconds,then call myFunction and bind myElement to it
	myFunction.delay(50,myElement);//alerts:'moo! Element id is:... '
	//an anonymous function which waits a second and then alerts
	(function(){alert('one second later...')}).delay(1000);
	//to stop the delay,clearTimeout can be used like so:
	var timer=myFunction.delay(50);
	clearTimeout(timer);
#T=periodical ��ָ���ļ������ִ�к���,����clearInterval��ֹ
	Executes a function in the specified intervals of time. Periodic execution can be stopped using the clearInterval function.
	�﷨:
	var intervalID=myFunction.periodical(period[,bind[,args]]);

	����:
	period - (number) The duration of the intervals between executions.
	bind - (object,optional) The object that the "this" of the function will refer to.
	args - (mixed,optional) The arguments passed (must be an array if the arguments are greater than one).

	����:
	(number) The Interval id (for clearing a periodical).

	ʾ��:
	var Site ={counter:0};
	var addCount=function(){this.counter++};
	addCount.periodical(1000,Site);//adds the number of seconds at the Site.
	//the interval can be stopped using the clearInterval function
	var timer=myFunction.periodical(1000);
	clearInterval(timer);
#T=scrollTo(x,y)
	Scrolls the element to the specified coordinated (if the element has an overflow). The following method is also available on the Window object.
	�﷨:
	myElement.scrollTo(x,y);

	����:
	x - (number) The x coordinate.
	y - (number) The y coordinate.

	ʾ��:
	$('myElement').scrollTo(0,100);

	�μ�:
	MDC Element:scrollLeft,MDC Element:scrollTop
#T=getScrollSize()
	Returns an Object representing the size of the target Element,including scrollable area. The following method is also available on the Window object.
	�﷨:
	myElement.getScrollSize();

	����:
	(object) An object containing the x and y dimensions of the target Element.

	ʾ��:
	var scroll=$('myElement').getScrollSize();
	alert('My element can scroll to '+scroll.y+'px');//alerts 'My element can scroll down to 820px'

	�μ�:
	MDC Element:scrollLeft,MDC Element:scrollTop,MDC Element:offsetWidth,MDC Element:offsetHeight,MDC Element:scrollWidth,MDC Element:scrollHeight

	ע��:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T=getScroll()
	Returns an Object representing how far the target Element is scrolled in either direction. The following method is also available on the Window object.
	�﷨:
	myElement.getScroll();

	����:
	(object) An object containing the x and y dimensions of the target Element's scroll.

	ʾ��:
	var scroll=$('myElement').getScroll();
	alert('My element is scrolled down '+scroll.y+'px');//alerts 'My element is scrolled down to 620px'

	ע��:
	If you need to measure the properties of elements that are not displayed (either their display style is none or one of their parents display style is none),you will need to use Element.measure to expose it.
#T= 


#T= String
 String
#T=����������������������
����������������������
#T= �� Function ��
 �� Function ��
#T=from �Ѵ���Ĳ���תΪ�ַ���
	Returns the passed parameter as a String.
	�﷨:
	String.from(arg);

	����:
	arg - (mixed) The argument to return as a string.

	����:
	(string) The argument as a string.

	ʾ��:
	String.from(2);//returns '2'
	String.from(true);//returns 'true'
#T=uniqueID ����һ����һ�޶���ID
	Generates a unique ID
	�﷨:
	String.uniqueID();

	����:
	(string) A unique ID.

	ʾ��:
	String.uniqueID();
#T= �� Method ��
 �� Method ��
#T=trim ����ַ������˵Ŀհ��ַ���
	Trims the leading and trailing spaces off a string.
	�﷨:
	myString.trim();

	����:
	(string) The trimmed string.

	ʾ��:
	'    i like cookies     '.trim();//returns 'i like cookies'
#T=clean ��������ַ����ж���Ŀհ��ַ���
	Removes all extraneous whitespace from a string and trims it (String:trim).
	�﷨:
	myString.clean();

	����:
	(string) The cleaned string.

	ʾ��:
	' i      like     cookies      \n\n'.clean();//returns 'i like cookies'
#T=toInt ���ַ���תΪ����,���Ը����Ļ�׼���ƽ���ת��
	Parses this string and returns a number of the specified radix or base.
	�﷨:
	myString.toInt([base]);

	����:
	base - (number,optional) The base to use (Ĭ����10����).

	����:
	(number) The number.
	(NaN) If the string is not numeric,returns NaN.

	ʾ��:
	'4em'.toInt();//returns 4
	'10px'.toInt();//returns 10
#T=toFloat ���ַ���תΪ������
	Parses this string and returns a floating point number.
	�﷨:
	myString.toFloat();

	����:
	(number) The float.
	(NaN) If the string is not numeric,returns NaN.

	ʾ��:
	'95.25%'.toFloat();//returns 95.25
	'10.848'.toFloat();//returns 10.848
#T=toLowerCase
^!.toLowerCase();
#T=toUpperCase
^!.toUpperCase();
#T=test ʹ��������ʽ���ַ�������ƥ�����
	Searches for a match between the string and a regular expression. For more information see MDC Regexp:test.
	�﷨:
	myString.test(regex[,params]);

	����:
	regex - (mixed) The string or regular expression you want to match the string with.
	params - (string,optional) If first parameter is a string,any parameters you want to pass to the regular expression ('g' has no effect).

	����:
	(boolean) true,if a match for the regular expression is found in this string.
	(boolean) false if is not found

	ʾ��:
	'I like cookies'.test('cookie');//returns true
	'I like cookies'.test('COOKIE','i');//returns true (ignore case)
	'I like cookies'.test('cake');//returns false
#T=contains ����ַ������Ƿ�����������������ַ���
	Checks to see if the string passed in is contained in this string. If the separator parameter is passed,will check to see if the string is contained in the list of values separated by that parameter.
	�﷨:
	myString.contains(string[,separator]);

	����:
	string - (string) The string to search for.
	separator - (string,optional) The string that separates the values in this string (e.g. Element classNames are separated by a ' ').

	����:
	(boolean) true if the string is contained in this string
	(boolean) false if not.

	ʾ��:
	'a bc'.contains('bc');//returns true
	'a b c'.contains('c',' ');//returns true
	'a bc'.contains('b',' ');//returns false
#T=camelCase �������ַ��ָ����ַ���ת�����Դ�Сд��ʽ���зָ����ַ���
	Converts a hyphenated string to a camelcased string.
	�﷨:
	myString.camelCase();

	����:
	(string) The camelcased string.

	ʾ��:
	'I-like-cookies'.camelCase();//returns 'ILikeCookies'
#T=hyphenate ���Դ�Сд��ʽ���зָ����ַ���ת�������ַ��ָ����ַ���
	Converts a camelcased string to a hyphenated string.
	�﷨:
	myString.hyphenate();

	����:
	(string) The hyphenated string.

	ʾ��:
	'ILikeCookies'.hyphenate();//returns '-i-like-cookies'
#T=capitalize ���ַ�����ÿ�����ʵ�����ĸ��д
	Converts the first letter of each word in a string to uppercase.
	�﷨:
	myString.capitalize();

	����:
	(string) The capitalized string.

	ʾ��:
	'i like cookies'.capitalize();//returns 'I Like Cookies'
#T=escapeRegExp ���ַ����ж�������ʽ���е��ַ�����ת��
	Escapes all regular expression characters from the string.
	�﷨:
	myString.escapeRegExp();

	����:
	(string) The escaped string.

	ʾ��:
	'animals.sheep[1]'.escapeRegExp();//returns 'animals\.sheep\[1\]'
#T=hexToRgb ��16������ɫ������ַ���ת����RGB
	Converts a hexadecimal color value to RGB. Input string must be in one of the following hexadecimal color formats (with or without the hash). '#ffffff',#fff','ffffff',or 'fff'
	�﷨:
	myString.hexToRgb([array]);

	����:
	array - (boolean,optional) If true is passed,will output an array (e.g. [255,51,0]) instead of a string (e.g. 'rgb(255,51,0)').

	����:
	(string) A string representing the color in RGB.
	(array) If the array flag is set,an array will be returned instead.

	ʾ��:
	'#123'.hexToRgb();//returns 'rgb(17,34,51)'
	'112233'.hexToRgb();//returns 'rgb(17,34,51)'
	'#112233'.hexToRgb(true);//returns [17,34,51]
#T=rgbToHex ��RGB�ַ���ת����16������ɫ����
	Converts an RGB color value to hexadecimal. Input string must be in one of the following RGB color formats. 'rgb(255,255,255)',or 'rgba(255,255,255,1)'
	�﷨:
	myString.rgbToHex([array]);

	����:
	array - (boolean,optional) If true is passed,will output an array (e.g. ['ff','33','00']) instead of a string (e.g. '#ff3300').

	����:
	(string) A string representing the color in hexadecimal,or transparent if the fourth value of rgba in the input string is 0.
	(array) If the array flag is set,an array will be returned instead.

	ʾ��:
	'rgb(17,34,51)'.rgbToHex();//returns '#112233'
	'rgb(17,34,51)'.rgbToHex(true);//returns ['11','22','33']
	'rgba(17,34,51,0)'.rgbToHex();//returns 'transparent'
#T=substitute ����ģ���еı�ǩ�滻
	Substitutes keywords in a string using an object/array. Removes undefined keywords and ignores escaped keywords.
	�﷨:
	myString.substitute(object[,regexp]);

	����:
	object - (mixed) The key/value pairs used to substitute a string.
	regexp - (regexp,optional) The regexp pattern to be used in the string keywords,with global flag. Defaults to /\?{([^}]+)}/g .

	����:
	(string) - The substituted string.

	ʾ��:
	var myString='{subject} is{property_1} and{property_2}.';
	var myObject ={subject:'Jack Bauer',property_1:'our lord',property_2:'saviour'};
	myString.substitute(myObject);//returns Jack Bauer is our lord and saviour
#T=stripScripts �����ִ���ַ����е�JS
	Strips the String of its tags and anything in between them.
	�﷨:
	myString.stripScripts([evaluate]);

	����:
	evaluate - (boolean,optional) If true is passed,the scripts within the String will be evaluated.

	����:
	(string) - The String without the stripped scripts.

	ʾ��:
	var myString="<script>alert('Hello')</script>Hello,World.";
	myString.stripScripts();//returns 'Hello,World.'
	myString.stripScripts(true);//alerts 'Hello',then returns 'Hello,World.'
#T= 


#T= Number
 Number
#T=����������������������
����������������������
#T= �� Function ��
 �� Function ��
#T=from �Ѵ���Ĳ���תΪNumber
	Returns the passed parameter as a Number,or null if not a number.
	�﷨:
	Number.from(arg);

	����:
	arg - (mixed) The argument to return as a number.

	����:
	(number) The argument as a number.
	(null) Returns null if the number cannot be converted.

	ʾ��:
	Number.from('12')       //returns 12
	Number.from('hello')    //returns null
#T=random ����һ�������
	Returns a random integer between the two passed in values.
	�﷨:
	var random=Number.random(min,max);

	����:
	min - (number) The minimum value (inclusive).
	max - (number) The maximum value (inclusive).

	����:
	(number) A random number between min and max.

	ʾ��:
	Number.random(5,20);//returns a random number between 5 and 20.
#T= �� Method ��
 �� Method ��
#T=round ��������
	Returns this number rounded to the specified precision.
	�﷨:
	myNumber.round([precision]);

	����:
	precision - (number,optional:defaults to 0) The number of digits after the decimal place.

	����:
	(number) The number,rounded.

	ע��:
	Argument may also be negative.

	ʾ��:
	(12.45).round()   //returns 12
	(12.45).round(1)  //returns 12.5
	(12.45).round(-1) //returns 10
#T=toInt ������תΪ����,���Ը����Ļ�׼���ƽ���ת��
	Returns this number as another number with the passed in base. Useful because toInt must work on both Strings and Numbers.
	�﷨:
	myNumber.toInt([base]);

	����:
	base - (number,optional:Ĭ����10����) The base to use.

	����:
	(number) A number with the base provided.

	ʾ��:
	(111).toInt();//returns 111
	(111.1).toInt();//returns 111
	(111).toInt(2);//returns 7
#T=toFloat ������תΪ������
	Returns this number as a float. Useful because toFloat must work on both Strings and Numbers.
	�﷨:
	myNumber.toFloat();

	����:
	(number) The number as a float.

	ʾ��:
	(111).toFloat();//returns 111
	(111.1).toFloat();//returns 111.1
#T=limit ��ȡֵ��Χ��������ָ������(��������,ȡԭֵ;��������,��ȡ�ڽ�������߽�ֵ)
	Limits this number between two bounds.
	�﷨:
	myNumber.limit(min,max);

	����:
	min - (number) The minimum possible value.
	max - (number) The maximum possible value.

	����:
	(number) The number bounded between the given limits.

	ʾ��:
	(12).limit(2,6.5);//returns 6.5
	(-4).limit(2,6.5);//returns 2
	(4.3).limit(2,6.5);//returns 4.3
#T=times ��Numberֵ���е���
	Executes the function passed in the specified number of times.
	�﷨:
	myNumber.times(fn[,bind]);

	����:
	fn - (function) The function which should be executed on each iteration of the loop. This function is passed the current iteration's index.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	ʾ��:
	(4).times(alert);//alerts "0",then "1",then "2",then "3".
#T=������ѧ����
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

	ʾ��:
	(-1).abs();//returns 1
	(3).pow(4);//returns 81
#T= 


#T= Array
 Array
#T=����������������������
����������������������
#T=var arr=[1,2,3,4];
var arr=[1,2,3,4];
var arr=new Array(1,2,3,4);
#T= �� Function ��
 �� Function ��
#T=Array.each ѭ����������
	Used to iterate through arrays,or iterables that are not regular arrays,such as built in getElementsByTagName calls or arguments of a function.
	�﷨:
	Array.each(iterable,fn[,bind]);

	����:
	iterable - (array) The array to iterate through.
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' within the function. For more information see Function:bind.

	Argument:fn
	�﷨:
	fn(item,index,object)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array. In the case of an object,it is passed the key of that item rather than the index.
	object - (mixed) The actual array/object.

	ʾ��:
	//ݔ��:"0=apple","1=banana","2=lemon"
	['apple','banana','lemon'].each(function(v,k){
		alert(k+"="+v);
	});//The optional second argument for binding isn't used here.
	��
	var arr=['Sun','Mon','Tue'];
	Array.each(arr,function(v,k){
		alert('name:'+v+',index:'+k);
	});
	��
	Array.each(['Sun','Mon','Tue'],function(v,k){
		alert('name:'+v+',index:'+k);
	});//alerts 'name:Sun,index:0','name:Mon,index:1',etc.

	ע��:
	This is an array-specific equivalent of $each from MooTools 1.2
#T=Array.clone ��¡����
	Returns a copy of the passed array.
	�﷨:
	var clone=Array.clone(myArray);

	����:
	myArray - (array) The array you wish to copy.

	����:
	(array) a copy of the passed array.

	ʾ��:
	var myArray=['red','blue','green'];
	var otherArray=Array.clone(myArray);
	var myArray[0]='yellow';
	alert(myArray[0]);//alerts 'yellow'
	alert(otherArray[0])    //alerts 'red'

	ע��:
	This is an array-specific equivalent of $unlink from MooTools 1.2.
#T=Array.from �Ѵ���Ĳ���ת����һ������
	Converts the argument passed in to an array if it is defined and not already an array.
	�﷨:
	var splatted=Array.from(obj);

	����:
	obj - (mixed) Any type of variable.

	����:
	(array) If the variable passed in is an array,returns the array. Otherwise,returns an array with the only element being the variable passed in.

	ʾ��:
	Array.from('hello');//returns ['hello'].
	Array.from(['a','b','c']);//returns ['a','b','c'].

	ע��:
	This is equivalent to $splat from MooTools 1.2,with the exception of Array-like Objects such as NodeList or FileList which Array.from does transform in Arrays and $splat not.
#T= �� Method ��
 �� Method ��
#T=Array.each ���ú�����������
	Calls a function for each element in the array.
	�﷨:
	myArray.each(fn[,bind]);

	����:
	fn - (function) The function which should be executed on each item in the array. This function is passed the item and its index in the array.
	bind - (object,optional) The object to be used as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(item,index,array)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	ʾ��:
	//Alerts "0=apple","1=banana",and so on:
	['apple','banana','lemon'].each(function(v,k){
		alert(k"="+v);
	});//The optional second argument for binding isn't used here.

	ע��:
	This method is only available for browsers without native MDC Array:forEach support.
#T=Array.invoke Ϊ�����е�ÿ��Ԫ�ص����ⲿ����
	Returns an array with the named method applied to the array's contents.
	�﷨:
	var arr=myArray.invoke(method[,arg,arg,arg ...])

	����:
	method - (string) The method to apply to each item in the array.
	arg - (mixed) Any number of arguments to pass to the named method.

	����:
	(array) A new array containing the results of the applied method.

	ʾ��:
	var foo=[4,8,15,16,23,42];
	var bar=foo.invoke('limit',10,30);//bar is now [10,10,15,16,23,30]

	ע��:
	The method that is invoked is a method of each of the items. If the method does not exist,then an error will be thrown. For example:
	[0,false,'string'].invoke('limit',0,10);//throws an error!
#T=Array.every ��������е�ÿһ�ͨ���˸��������Ĳ���,�򷵻�true
	Returns true if every element in the array satisfies the provided testing function. This method is provided only for browsers without native Array:every support.
	�﷨:
	var allPassed=myArray.every(fn[,bind]);

	����:
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn
	�﷨:
	fn(item,index,array)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	����:
	(boolean) If every element in the array satisfies the provided testing function,returns true. Otherwise,returns false.

	ʾ��:
	var areAllBigEnough=[10,4,25,100].every(function(item,index){
		return item > 20;
	});//areAllBigEnough=false
#T=Array.filter �������ڸ������˺����й���ͨ�����������һ��������
	Creates a new array with all of the elements of the array for which the provided filtering function returns true. This method is provided only for browsers without native Array:filter support.
	�﷨:
	var filteredArray=myArray.filter(fn[,bind]);

	����:
	fn - (function) The function to test each element of the array. This function is passed the item and its index in the array.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn
	�﷨:
	fn(item,index,array)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	����:
	(array) The new filtered array.

	ʾ��:
	var biggerThanTwenty=[10,3,25,100].filter(function(item,index){
		return item > 20;
	});//biggerThanTwenty=[25,100]
#T=Array.clean ����������Ļ����Ͻ���һ��������,ÿһ����Ա�������Ѿ��������,IE�����������Ƿ�null�ͷ�undefined��
	Creates a new array with all of the elements of the array which are defined (i.e. not null or undefined).
	�﷨:
	var cleanedArray=myArray.clean();

	����:
	(array) The new filtered array.

	ʾ��:
	var myArray=[null,1,0,true,false,'foo',undefined,''];
	myArray.clean() //returns [1,0,true,false,'foo','']
#T=Array.indexOf ���������к͸�������ֵ��ȵ����������;���δ�ҵ���ȵ���,�򷵻�-1
	Returns the index of the first element within the array equal to the specified value,or -1 if the value is not found. This method is provided only for browsers without native Array:indexOf support.
	�﷨:
	var index=myArray.indexOf(item[,from]);

	����:
	(number) The index of the first element within the array equal to the specified value. If not found,returns -1.

	����:
	item - (object) The item to search for in the array.
	from - (number,optional:defaults to 0) The index of the array at which to begin the search.

	ʾ��:
	['apple','lemon','banana'].indexOf('lemon');//returns 1
	['apple','lemon'].indexOf('banana');//returns -1
#T=Array.map �����ⲿ����ѭ���������������ڵ�ÿ����Ŀ,������������
	Creates a new array with the results of calling a provided function on every element in the array. This method is provided only for browsers without native Array:map support.
	�﷨:
	var mappedArray=myArray.map(fn[,bind]);

	����:
	fn - (function) The function to produce an element of the new Array from an element of the current one.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(item,index,array)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	����:
	(array) The new mapped array.

	ʾ��:
	var timesTwo=[1,2,3].map(function(item,index){
		return item * 2;
	});//timesTwo=[2,4,6];
#T=Array.some ���������������һ����ͨ���˸����ĺ����Ĳ���,�򷵻�true
	Returns true if at least one element in the array satisfies the provided testing function. This method is provided only for browsers without native Array:some support.
	�﷨:
	var somePassed=myArray.some(fn[,bind]);

	����:
	(boolean) If at least one element in the array satisfies the provided testing function returns true. Otherwise,returns false.

	����:
	fn - (function) The function to test for each element. This function is passed the item and its index in the array.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(item,index,array)

	����:
	item - (mixed) The current item in the array.
	index - (number) The current item's index in the array.
	array - (array) The actual array.

	ʾ��:
	var isAnyBigEnough=[10,4,25,100].some(function(item,index){
		return item > 20;
	});//isAnyBigEnough=true
#T=Array.associate ����һ����ֵ�Զ���,�ö����еļ�����Ϊ���������һ���������,ֵ�������������
	Creates an object with key-value pairs based on the array of keywords passed in and the current content of the array.
	�﷨:
	var associated=myArray.associate(obj);

	����:
	obj - (array) Its items will be used as the keys of the object that will be created.

	����:
	(object) The new associated object.

	ʾ��:
	var animals=['Cow','Pig','Dog','Cat'];
	var sounds=['Moo','Oink','Woof','Miao'];
	sounds.associate(animals);
	//returns{'Cow':'Moo','Pig':'Oink','Dog':'Woof','Cat':'Miao'}
#T=Array.link ���ݸ�����'��/���Ժ���'��������һ���µļ�ֵ�Զ���
	Accepts an object of key / function pairs to assign values.
	�﷨:
	var result=myArray.link(object);

	����:
	object - (object) An object containing key / function pairs must be passed to be used as a template for associating values with the different keys.

	����:
	(object) The new associated object.

	ʾ��:
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
#T=Array.contains ����ָ�����Ƿ��������д���
	Tests an array for the presence of an item.
	�﷨:
	var inArray=myArray.contains(item[,from]);

	����:
	item - (object) The item to search for in the array.
	from - (number,optional:defaults to 0) The index of the array at which to begin the search.

	����:
	(boolean) If the array contains the item specified,returns true. Otherwise,returns false.

	ʾ��:
	['a','b','c'].contains('a');//returns true
	['a','b','c'].contains('d');//returns false
#T=Array.append �ϲ�����,������׷�ӵ�ĩβ
	Appends the passed array to the end of the current array.
	�﷨:
	var myArray=myArray.append(otherArray);

	����:
	otherArray - (array) The array containing values you wish to append.

	����:
	(array) The original array including the new values.

	ʾ��:
	var myOtherArray=['green','yellow'];
	['red','blue'].append(myOtherArray);//returns ['red','blue','green','yellow'];
	myOtheArray;//is now ['red','blue','green','yellow'];
	[0,1,2].append([3,[4]]);//[0,1,2,3,[4]]

	ע��:
	This is an array-specific equivalent of $extend from MooTools 1.2
#T=Array.include �ϲ�����
	Pushes the passed element into the array if it's not already present (case and type sensitive).
	�﷨:
	myArray.include(item);

	����:
	item - (object) The item that should be added to this array.

	����:
	(array) This array with the new item included.

	ʾ��:
	['Cow','Pig','Dog'].include('Cat');//returns ['Cow','Pig','Dog','Cat']
	['Cow','Pig','Dog'].include('Dog');//returns ['Cow','Pig','Dog']

	ע��:
	If you want to push the passed element even if it's already present,use the vanilla javascript:
	myArray.push(item);
#T=Array.combine �ϲ�����(�ظ�����������)
	Combines an array with all the items of another. Does not allow duplicates and is case and type sensitive.
	�﷨:
	myArray.combine(array);

	����:
	array - (array) The array whose items should be combined into this array.

	����:
	(array) This array combined with the new items.

	ʾ��:
	var animals=['Cow','Pig','Dog'];
	animals.combine(['Cat','Dog']);//animals=['Cow','Pig','Dog','Cat'];
#T=Array.getLast �����鷵�����һ����ֵ
	Returns the last item from the array.
	�﷨:
	myArray.getLast();

	����:
	(mixed) The last item in this array.
	(null) If this array is empty,returns null.

	ʾ��:
	['Cow','Pig','Dog','Cat'].getLast();//returns 'Cat'
#T=Array.getRandom �������������ȡ��ֵ
	Returns a random item from the array.
	�﷨:
	myArray.getRandom();

	����:
	(mixed) A random item from this array. If this array is empty,returns null.

	ʾ��:
	['Cow','Pig','Dog','Cat'].getRandom();//returns one of the items
#T=Array.erase ���������Ƴ�һ����Ŀ
	Removes all occurrences of an item from the array.
	�﷨:
	myArray.erase(item);

	����:
	item - (object) The item to search for in the array.

	����:
	(array) This array with all occurrences of the item removed.

	ʾ��:
	['Cow','Pig','Dog','Cat','Dog'].erase('Dog') //returns ['Cow','Pig','Cat']
	['Cow','Pig','Dog'].erase('Cat') //returns ['Cow','Pig','Dog']
#T=Array.empty �������
	Empties an array.
	�﷨:
	myArray.empty();

	����:
	(array) This array,emptied.

	ʾ��:
	var myArray=['old','data'];
	myArray.empty();//myArray is now []
#T=Array.flatten �Ѷ�ά����ת��Ϊһά����
	Flattens a multidimensional array into a single array.
	�﷨:
	myArray.flatten();

	����:
	(array) A new flat array.

	ʾ��:
	var myArray=[1,2,3,[4,5,[6,7]],[[[8]]]];
	var newArray=myArray.flatten();//newArray is [1,2,3,4,5,6,7,8]
#T=Array.pick ���ز����б��е�һ����δ�������;���ȫ��δ����,�򷵻�null
	Returns the first defined value of the array passed in,or null.
	�﷨:
	var picked=[var1,var2,var3].pick();

	����:
	(mixed) The first variable that is defined.
	(null) If all variables passed in are null or undefined,returns null.

	ʾ��:
	function say(infoMessage,errorMessage){
		alert([errorMessage,infoMessage,'There was no message supplied.'].pick());
		//or more MooTools 1.2 style using Generics
		Array.pick([errorMessage,infoMessage,'There was no message supplied.']);
	}
	say();//alerts 'There was no message supplied.'
	say('This is an info message.');//alerts 'This is an info message.'
	say('This message will be ignored.','This is the error message.');//alerts 'This is the error message.'

	ע��:
	This is equivalent to $pick from MooTools 1.2.
#T=Array.hexToRgb ����ɫֵתΪRGB
	Converts an hexadecimal color value to RGB. Input array must be the following hexadecimal color format. ['FF','FF','FF']
	�﷨:
	myArray.hexToRgb([array]);

	����:
	array - (boolean,optional) If true is passed,will output an array (e.g. [255,51,0]) instead of a string (e.g. "rgb(255,51,0)").

	����:
	(string) A string representing the color in RGB.
	(array) If the array flag is set,an array will be returned instead.

	ʾ��:
	['11','22','33'].hexToRgb();//returns 'rgb(17,34,51)'
	['11','22','33'].hexToRgb(true);//returns [17,34,51]
#T=Array.rgbToHex ��RGBתΪ��ɫֵ
	Converts an RGB color value to hexadecimal. Input array must be in one of the following RGB color formats. [255,255,255],or [255,255,255,1]
	�﷨:
	myArray.rgbToHex([array]);

	����:
	array - (boolean,optional) If true is passed,will output an array (e.g. ['ff','33','00']) instead of a string (e.g. '#ff3300').

	����:
	(string) A string representing the color in hexadecimal,or 'transparent' string if the fourth value of rgba in the input array is 0 (rgba).
	(array) If the array flag is set,an array will be returned instead.

	ʾ��:
	[17,34,51].rgbToHex();//returns '#112233'
	[17,34,51].rgbToHex(true);//returns ['11','22','33']
	[17,34,51,0].rgbToHex();//returns 'transparent'
#T= 


#T= Object
 Object
#T=����������������������
����������������������
#T=var O={a:0,b:1};
var O={a:0,b:1};
#T= �� Function ��
 �� Function ��
#T=Object.each ����һ��Obj
	Used to iterate through an object.
	�﷨:
	Object.each(obj,fn[,bind]);

	����:
	obj - (object) The object to iterate through.
	fn - (function) The function to test for each element.
	bind - (object,optional) The object to use as 'this' within the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(item,key,object)

	����:
	item - (mixed) The current item in the array.
	key - (mixed) The current item's key.
	object - (mixed) The actual array/object.

	ʾ��:
	//alerts 'The first day of the week is Sunday','The second day of the week is Monday',etc.:
	Object.each({first:'Sunday',second:'Monday',third:'Tuesday'},function(value,key){
		alert('The '+key+' day of the week is '+value);
	});

	ע��:
	This method is an object-specific equivalent of $each from MooTools 1.2
#T=Object.merge �ϲ�һ��Obj������Obj
	Merges any number of objects recursively without referencing them or their sub-objects.
	�﷨:
	var merged=Object.merge(obj1,obj2[,obj3[,...]]);

	����:
	(objects) Any number of objects.

	����:
	(object) The object that is created as a result of merging all the objects passed in.

	ʾ��:
	var obj1 ={a:0,b:1};
	var obj2 ={c:2,d:3};
	var obj3 ={a:4,d:5};
	var merged=Object.merge(obj1,obj2,obj3);//returns{a:4,b:1,c:2,d:5},(obj2,and obj3 are unaltered)
	merged === obj1;//true,obj1 gets altered and returned as merged object
	var nestedObj1 ={a:{b:1,c:1}};
	var nestedObj2 ={a:{b:2}};
	var nested=Object.merge(nestedObj1,nestedObj2);//returns:{a:{b:2,c:1}}
#T=Object.clone ��¡Obj
	Returns a copy of an object.
	�﷨:
	var clone=Object.clone(obj);

	����:
	(obj) The object to clone

	����:
	(object) A copy of the passed object

	ʾ��:
	var obj1 ={a:0,b:1};
	var obj2=Object.clone(obj1);
	obj1.a=42;
	alert(obj1.a);//alerts '42'
	alert(obj2.a);//alerts '0'

	ע��:
	This is an object-specific equivalent of $unlink from MooTools 1.2.
#T=Object.append �ϲ�Obj,׷�ӵ�β��
	Copies all the properties from the second object passed in to the first object passed in.
	�﷨:
	Object.append(original,extension);

	����:
	original - (object) The object to be extended.
	extension - (object) The object whose properties will be copied to original.

	����:
	(object) The first object passed in,extended.

	ʾ��:
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

	ע��:
	This method is an object-specific equivalent of $extend from MooTools 1.2
#T=Object.subset ��Obj�ڻ�ȡ�Ӽ�
	Get a subset of an object.
	�﷨:
	Object.subset(object,keys);

	����:
	object - (object) The object.
	keys - (array) An array with the keys.

	����:
	(object) The subset of the Object.

	ʾ��:
	var object ={
		a:'one',
		b:'two',
		c:'three'
	};
	Object.subset(object,['a','c']);//returns{a:'one',c:'three'}
#T=Object.map �����ⲿ����ѭ����������Obj�ڵ�ÿ����Ŀ,��������Obj
	Creates a new map with the results of calling a provided function on every value in the map.
	�﷨:
	var mappedObject=Object.map(object,fn[,bind]);

	����:
	object - (object) The object.
	fn - (function) The function to produce an element of the Object from an element of the current one.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(value,key,object)

	����:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	����:
	(object) The new mapped object.

	ʾ��:
	var myObject ={a:1,b:2,c:3};
	var timesTwo=Object.map(myObject,function(value,key){
		return value * 2;
	});//timesTwo now holds an object containing:{a:2,b:4,c:6};
#T=Object.filter �������ڸ������˺����й���ͨ����Obj���һ����Obj
	Creates a new object with all of the elements of the object for which the provided filtering function returns true.
	�﷨:
	var filteredObject=Object.filter(object,fn[,bind]);

	����:
	object - (object) The object.
	fn - (function) The function to test each element of the Object. This function is passed the value and its key in the Object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(value,key,object)

	����:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	����:
	(object) The new filtered object.

	ʾ��:
	var myObject ={a:10,b:20,c:30};
	var biggerThanTwenty=Object.filter(myObject,function(value,key){
		return value > 20;
	});//biggerThanTwenty now holds an object containing:{c:30}
#T=Object.every ���Obj�е�ÿһ�ͨ���˸��������Ĳ���,�򷵻�true
	Returns true if every value in the object satisfies the provided testing function.
	�﷨:
	var allPassed=Object.every(object,fn[,bind]);

	����:
	object - (object) The object.
	fn - (function) The function to test each element of the Object. This function is passed the value and its key in the Object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(value,key,object)

	����:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	����:
	(boolean) If every value in the Object satisfies the provided testing function,returns true. Otherwise,returns false.

	ʾ��:
	var myObject ={a:10,b:4,c:25,d:100};
	var areAllBigEnough=Object.every(myObject,function(value,key){
		return value > 20;
	});//areAllBigEnough=false
#T=Object.some ���Obj��������һ����ͨ���˸����ĺ����Ĳ���,�򷵻�true
	Returns true if at least one value in the object satisfies the provided testing function.
	�﷨:
	var anyPassed=Object.some(object,fn[,bind]);

	����:
	object - (object) The object.
	fn - (function) The function to test each element of the object. This function is passed the value and its key in the object.
	bind - (object,optional) The object to use as 'this' in the function. For more information see Function:bind.

	Argument:fn

	�﷨:
	fn(value,key,object)

	����:
	value - (mixed) The current value in the object.
	key - (string) The current value's key in the object.
	object - (object) The actual object.

	����:
	(boolean) If any value in the object satisfies the provided testing function,returns true. Otherwise,returns false.

	ʾ��:
	var myObject ={a:10,b:4,c:25,d:100};
	var areAnyBigEnough=Object.some(myObject,function(value,key){
		return value > 20;
	});//isAnyBigEnough=true
#T=Object.keys ����Obj�����е�key��Ϊһ������
	Returns an array containing all the keys,in the same order as the values returned by Object:values.
	�﷨:
	var keys=Object.keys(object);

	����:
	object - (object) The object.

	����:
    (array) An array containing all the keys of the object.

	ʾ��:
	var myObject ={e:10,b:4,c:25,d:100};
	var keys=Object.keys(myObject);
	alert(keys)
#T=Object.values ����Obj�����е�value��Ϊһ������
	Returns an array containing all the values,in the same order as the keys returned by Object:keys.
	�﷨:
	var values=Object.values(object);

	����:
	object - (object) The object.

	����:
	(array) An array containing all the values of the object.

	ʾ��:
	var myObject ={e:10,b:4,c:25,d:100};
	var keys=Object.values(myObject);
	alert(keys)
#T=Object.getLength ����Obj��Ԫ�ظ���
	Returns the number of keys in the object.
	�﷨:
	var length=Object.getLength(object);

	����:
	object - (object) The object.

	����:
	(number) The length of the object.

	ʾ��:
	var myObject ={
		name:'John',
		lastName:'Doe'
	});
	Object.getLength(myObject);//returns 2
#T=Object.keyOf ����value��ѯObj�ڵ�key������;���δ�ҵ���ȵ���,�򷵻�false
	Returns the key of the specified value. Synonymous with Array:indexOf.
	�﷨:
	var key=Object.keyOf(object,item);

	����:
	object - (object) The object.
	item - (mixed) The item to search for in the object.

	����:
	(string) If the object has a the specified item in it,returns the key of that item.
	(boolean) Otherwise,returns false.

	ʾ��:
	var myObject ={a:'one',b:'two',c:3};
	Object.keyOf(myObject,'two');//returns 'b'
	Object.keyOf(myObject,3);//returns 'c'
	Object.keyOf(myObject,'four');//returns false
#T=Object.contains ����Obj���Ƿ����ĳ��ֵ
	Tests for the presence of a specified value in the object.
	�﷨:
	var inObject=Object.contains(object,value);

	����:
	object - (object) The object.
	value - (mixed) The value to search for in the Object.

	����:
	(boolean) If the object has the passed in value in any of the keys,returns true. Otherwise,returns false.

	ʾ��:
	var myObject ={a:'one',b:'two',c:'three'};
	Object.contains(myObject,'one');//returns true
	Object.contains(myObject,'four');//returns false
#T=Object.toQueryString ��Obj�ڵ���Ŀת��ΪUrl��ַ,Ȼ��URIencode
	Generates a query string from key/value pairs in an object and URI encodes the values.
	�﷨:
	var queryString=Object.toQueryString(object[,base]);

	����:
	object - (object) The object to generate the query string from.
	base - (string,optional) Will be used as base variable in the query string.

	����:
	(string) The query string.

	ʾ��:
	Object.toQueryString({apple:'red',lemon:'yellow'});//returns 'apple=red&lemon=yellow'
	Object.toQueryString({apple:'��ɫ',lemon:'yellow'});//apple=%E7%BA%A2%E8%89%B2&lemon=yellow
	Object.toQueryString({apple:'red',lemon:'yellow'},'fruits');//returns 'fruits[apple]=red&fruits[lemon]=yellow'
#T= 


#T= JSON
 JSON
#T=����������������������
����������������������
#T=var J={"_5":"ͣ","_4":"W\\i","_3":"��\/��"};
var J={"_5":"ͣ","_4":"W\\i","_3":"��\/��"};
#T=JSON.encode ��Obj������תΪJson
	Converts an object or array to a JSON string.
	�﷨:
	var myJSON=JSON.encode(obj);

	����:
	obj - (object) The object to convert to string.

	����:
	(string) A JSON string.

	ʾ��:
	var fruitsJSON=JSON.encode({apple:'red',lemon:'yellow'});//returns:'{"apple":"red","lemon":"yellow"}'
#T=JSON.decode ��һ��JsonתΪObj
	Converts a JSON string into a JavaScript object.
	�﷨:
	var object=JSON.decode(string[,secure]);

	����:
	string - (string) The string to evaluate.
	secure - (boolean,optional:defaults to false) If set to true,checks for any hazardous syntax and returns null if any found.

	����:
	(object) The object represented by the JSON string.

	ʾ��:
	var myObject=JSON.decode('{"apple":"red","lemon":"yellow"}');//returns:{apple:'red',lemon:'yellow'}

	�μ�:
	JSON (JavaScript Object Notation)
#T=����XML
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
#T=����������������������
����������������������
#T=����
	Reads and writes a cookie.
	ѡ��:
	domain - (string:defaults to false) The domain the cookie belongs to.
	path - (string:defaults to '/') The path the cookie belongs to.
	duration - (number:defaults to false) The duration of the cookie (in days) before it expires. If set to false or 0,the cookie will be a session cookie that expires when the browser is closed.
	secure - (boolean:defaults to false) Stored cookie information can be accessed only from a secure environment.
#T=Cookie.write
	Writes a cookie in the browser.
	�﷨:
	var myCookie=Cookie.write(key,value[,options]);

	����:
	key - (string) The key (or name) of the cookie.
	value - (string) The value to set.���ɰ����ֺ�.
	options - (���,��ѡ) See Cookie.

	����:
	(object) An object with the options,the key and the value. You can give it as first parameter to Cookie.dispose.

	ʾ��:
	Saves the cookie for the duration of the session:
	var myCookie=Cookie.write('username','JackBauer');

	��Ч��Ϊ1��,��Ч��:
	var myCookie=Cookie.write('username','JackBauer',{duration:1,domain:'mootools.net'});

	ע��:
	In order to share the cookie with pages located in a different path,the Cookie.options.domain value must be set.
#T=Cookie.read
	Reads the value of a cookie.
	�﷨:
	var myCookie=Cookie.read(name);

	����:
	name - (string) The name of the cookie to read.

	����:
	(mixed) The cookie string value,or null if not found.

	ʾ��:
	Cookie.read('username');
#T=Cookie.dispose
	Removes a cookie from the browser.
	�﷨:
	var oldCookie=Cookie.dispose(name[,options]);

	����:
	name - (string) The name of the cookie to remove or a previously saved Cookie instance.
	options - (object,optional) See Cookie.

	ʾ��:
	Cookie.dispose('username');//Bye-bye JackBauer!

	//��õ�д��
    var myCookie=Cookie.write('username','JackBauer',{duration:1,domain:'mootools.net'});
    if(Cookie.read('username') == 'JackBauer'){myCookie.dispose();}
#T= 


#T= Swiff
 Swiff
#T=����������������������
����������������������
#T=����
	Creates and returns a Flash object using supplied parameters.
	�﷨:
	var mySwiff=new Swiff(path[,options]);

	����:
	path - (string) The path to the SWF file.
	options - (object,optional) See Options below.

	ѡ��:
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

	����:
	(element) A new HTML object element.

	ʾ��:
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

	ע��:
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
	�﷨:
	var result=Swiff.remote(obj,fn[,arg,arg,arg ...]);

	����:
	obj - (element) A Swiff instance (a HTML object element).
	fn - (string) The function name to execute in the SWF.
	arg - (mixed) Any number of arguments to pass to the named function.

	����:
	(mixed) The ActionScript function's result.

	ʾ��:
	var obj=new Swiff('myMovie.swf');
	alert(Swiff.remote(obj,'myFlashFn'));//alerts "This is from the .swf file!".

	ע��:
	The SWF file must be compiled with the ExternalInterface component. See the Adobe documentation on External Interface for more information.
#T= 


#T= Request
 Request
#T=����������������������
����������������������
#T=�÷�
	$.extend({//��$�����¼�
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
	$.ajax({//�{��
		type:"post",url:"sys.php",timeout:1000,
		data:'work=buygetprice&tim='+encodeURI(tim)+'&day='+encodeURI(day)+'',
		error:function(msg){alert(msg);return false;},
		success:function(msg){
			if(msg.indexOf('Error:')==-1){alert(msg);return false;}
		}
	});
#T=����
	An XMLHttpRequest Wrapper.
	����:
	Chain,Events,Options

	�﷨:
	var myRequest=new Request([options]);

	����:
	options - (object,optional) See below.

	ѡ��:
	url - (string:Ĭ����null) Ҫ�����URL. 
    data - (string:Ĭ���ǿ�) Ĭ��Ҫ���͵�����.
    link - (string:Ĭ����'ignore') ��Ϊ'ignore','cancel','chain'.
        'ignore' - ����������ִ��֮��ʱ,�µ����󽫱�����
        'cancel' - ����������ִ��֮��ʱ,������ȡ����ǰִ���е�����,��ʼִ���µ�����
        'chain' - ����������ִ��֮��ʱ,������µ����������ڵ�ǰ����֮��,����ִ����������
    method - (string:Ĭ����'post') HTTP��������,��Ϊ'post' �� 'get'.
    emulation - (boolean:Ĭ����true) ����,ͨ���������
    async - (boolean:Ĭ����true) �첽,�����Ϊfalse,��ô���������ݵ�ʱ�򽫻�ͬ���������������,ͨ���������.
    timeout - (integer:Ĭ����0) ��ʱʱ��
    headers - (object) ����content-typeͷ.
    urlEncoded - (boolean:Ĭ����true) url����,�����Ϊtrue,��content-typeͷ������Ϊwww-form-urlencoded+encoding
    encoding - (string:Ĭ����'utf-8') ���ݵı���.
    noCache - (boolean;Ĭ����false) �����Ϊtrue,�򲻻���
    isSuccess - (function) �������֮����¼�.
    evalScripts - (boolean:Ĭ����false) �����Ϊtrue,����ڵ�script�ᱻִ��
    evalResponse - (boolean:Ĭ����false) �����Ϊtrue,�������ݽ��ᱻִ��.
    user - (string:Ĭ����null) ��������˴���,��ô�����ʱ�򽫻᳢����֤.
    password - (string:Ĭ����null) ��user����ʹ��,���ô����ʱ��Ҫ��д����������Ǻ�
#T=onRequest
	��Request is sent��ʱ�򴥷�.
#T=onLoadstart
	��Request loaded��ʱ�򴥷�,���������н���֮ǰ. (This is limited to Browsers that support the event. At this time:Gecko and WebKit).
	����:
	onLoadstart(event,xhr)

	����:
	event - (Event) The loadstart event.
	xhr - (XMLHttpRequest) The transport instance.
#T=onProgress
	��Request���ڽ����ϴ������صĽ���ʱ����. (This is limited to Browsers that support the event. At this time:Gecko and WebKit).
	����:
	onProgress(event,xhr)

	����:
	event - (Event) The progress event,containing currently downloaded bytes and total bytes.
	xhr - (XMLHttpRequest) The transport instance.

	ʾ��:
	var myRequest=new Request({
		url:'image.jpg',
		onProgress:function(event,xhr){
			var loaded=event.loaded,total=event.total;
			console.log(parseInt(loaded / total * 100,10));
		}
	});
	myRequest.send();

	�μ�:
	MDC:nsIDOMProgressEvent
#T=onComplete
	���������ʱ����.
	����:
	onComplete()
#T=onCancel
	������ȡ��ʱ����.
	����:
	onCancel()
#T=onSuccess
	������ɹ���ɺ󴥷�.
	����:
	onSuccess(responseText,responseXML)

	����:
	responseText - (string) The returned text from the request.
	responseXML - (mixed) The response XML from the request.
#T=onFailure
	������ʧ��ʱ����.
	����:
	onFailure(xhr)

	����:
	xhr - (XMLHttpRequest) The transport instance.
#T=onException
	������һ������ͷʧ��ʱ����.
	����:
	onException(headerName,value)

	����:
	headerName - (string) The name of the failing header.
	value - (string) The value of the failing header.

	����:
	response - (object) Object with text and XML as keys. You can access this property in the 'success' event.

	����:
	(object) A new Request instance.

	ʾ��:
	var myRequest=new Request({method:'get',url:'requestHandler.php'});
	myRequest.send('name=john&lastname=dorian');

	�μ�:
	Wikipedia:XMLHttpRequest
#T=onTimeout
	��������options.timeout�����õĺ�����,ȴû�з���״ֵ̬�ĸı�ʱ����.
	����:
	onTimeout()

	ʾ��:
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
#T= �� Request ��
	var myRequest=new Request({//����Request����
        url:'image.php',//Ҫ����ĵ�ַ
        onProgress:function(event,xhr){//����������ʾ�ڿ���̨��
            var loaded=event.loaded,total=event.total;
            console.log(parseInt(loaded / total * 100,10));
        }
    }).send();//������send��������

    //����һ������
    var myElement=$('myElement');//ѡ�ڵ�
    var myRequest=new Request({//����Request����
        url:'getMyText.php',//Ҫ����ĵ�ַ
        method:'get',//get����
        onProgress:function(event,xhr){//����������ʾ�ڿ���̨��
            var loaded=event.loaded,total=event.total;
            console.log(parseInt(loaded / total * 100,10));
        },
        onRequest:function(){//�����󱻷���ʱ��������
            myElement.set('text','loading...');
        },
        onSuccess:function(responseText){//��������������
            myElement.set('text',responseText);
        },
        onFailure:function(){//ʧ��ʱ��ʾ
            myElement.set('text','Sorry,your request failed:(');
        }
    });

    //$('myLink')���ʱ,����ajax��send����
    $('myLink').addEvent('click',function(event){
        event.stop();//��ֹ��$('myLink')��Ĭ���¼�(������<a ..>��ֹ�������ܵ����ҳ����)
        myRequest.send('userid='+this.get('data-userid'));
    });
#T= �� Method ��
 �� Method ��
#T=Request:setHeader
	��ӻ��޸�һ�������ͷ��Ϣ. ��������дoptions.
	�﷨:
	myRequest.setHeader(name,value);

	����:
	name - (string) The name for the header.
	value - (string) The value to be assigned.

	����:
	(object) This Request instance.

	ʾ��:
	var myRequest=new Request({url:'getData.php',method:'get',headers:{'X-Request':'JSON'}});
	myRequest.setHeader('Last-Modified','Sat,1 Jan 2005 05:00:00 GMT');
#T=Request:getHeader
	������Ӧͷ,���û�з�����Ϊnull.
	�﷨:
	myRequest.getHeader(name);

	����:
	name - (string) The name of the header to retrieve the value of.

	����:
	(string) The value of the retrieved header.
	(null) null if the header is not found.

	ʾ��:
	var myRequest=new Request({url:'getData.php',method:'get',onSuccess:function(responseText,responseXML){
		alert(this.getHeader('Date'));//alerts the server date (for example,'Thu,26 Feb 2009 20:26:06 GMT')
	}});
#T=Request:send
	���������Ӳ�������options��Ԥ�������
	�﷨:
	myRequest.send([options]);

	����:
	options - (object,optional) The options for the sent Request. Will also accept data as a query string for compatibility reasons.

	����:
	(object) This Request instance.

	ʾ��:
	var myRequest=new Request({
		url:'http://localhost/some_url'
	}).send('save=username&name=John');

	Request Methods:send aliases

	MooTools provides several aliases for Request:send to make it easier to use different methods.

	These ���� are:
		post() and POST()
		get() and GET()
		put() and PUT()
		delete() and DELETE()

	�﷨:
	myRequest.post([data]);

	����:
	data - (string,optional) Equivalent with the data option of Request.

	����:
	(object) This Request instance.

	ʾ��:
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

	ע��:
	By default the emulation option is set to true,so the put and delete send methods are emulated and will actually send as post while the method name is sent as e.g. _method=delete.
#T=Request:cancel
	ȡ����ǰ�����е�����.
	�﷨:
	myRequest.cancel();

	����:
	(object) This Request instance.

	ʾ��:
	var myRequest=new Request({url:'mypage.html',method:'get'}).send('some=data');
	myRequest.cancel();
#T=Request:isRunning
	�����ǰ�������������򷵻�true
	�﷨:
	myRequest.isRunning()

	����:
	(boolean) True if the request is running

	ʾ��:
	var myRequest=new Request({url:'mypage.html',method:'get'}).send('some=data');
	if(myRequest.isRunning()) //It runs!
#T=Property:send
	Sets a default Request instance for an Element. This is useful when handling forms.
	�﷨:
	el.set('send'[,options]);

	����:
	options - (object) The Request options.

	����:
	(element) The original element.

	ʾ��:
	myForm.set('send',{url:'contact.php',method:'get'});
	myForm.send();//Sends the form.

	Getter

	Returns the previously set Request instance (or a new one with default options).
	�﷨:
	el.get('send');

	����:
	property - (string) the Request property argument.

	����:
	(object) The Request instance.

	ʾ��:
	el.set('send',{method:'get'});
	el.send();
	el.get('send');//returns the Request instance.
#T= �� Request.HTML ��
 �� Request.HTML ��
#T=����
	Request Specifically made for receiving HTML.
	��չ:
	Request

	�﷨:
	var myHTMLRequest=new Request.HTML([options]);

	����:
	options - (object,optional) See options below. Also inherited are all the options from Request.

	ѡ��:
	evalScripts - (boolean:defaults to true) If set to true,script tags inside the response will be evaluated. This overrides the false default from Request.
	update - (element:defaults to null) The Element to insert the response text of the Request into upon completion of the request.
	append - (element:defaults to null) The Element to append the response text of the Request into upon completion of the request.
	filter - (mixed:defaults to null) To filter the response tree by a selector or function. See Elements:filter

	�¼�:
	success
	(function) Function to execute when the HTML request completes. This overrides the signature of the Request success event.

	����:
	onSuccess(responseTree,responseElements,responseHTML,responseJavaScript)

	����:
	responseTree - (element) The node list of the remote response.
	responseElements - (array) An array containing all elements of the remote response.
	responseHTML - (string) The content of the remote response.
	responseJavaScript - (string) The portion of JavaScript from the remote response.

	����:
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
#T= �� Request.JSON ��
 �� Request.JSON ��
#T=����
	Wrapped Request with automated receiving of JavaScript Objects in JSON Format.
	��չ:
	Request

	�﷨:
	var myJSONRemote=new Request.JSON([options]);

	����:
	options - (object,optional) See below.

	ѡ��:
	secure - (boolean:defaults to true) If set to true,a syntax check will be done on the result JSON (see JSON.decode).

	�¼�:
	success
	Fired when the request completes. This overrides the signature of the Request success event.

	����:
	onSuccess(responseJSON,responseText)

	����:
	responseJSON - (object) The JSON response object from the remote request.
	responseText - (string) The JSON response as string.

	error
	Fired when the parsed JSON is not valid and the secure option is set.

	����:
	onError(text,error)

	����:
	text - (string) The response text.
	error - (string) The error message.

	����:
	(object) A new Request.JSON instance.

	ʾ��:
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
	��
	new Request.JSON({
        url: "./communitystore.php?a=getRegionOptions",
        async: false,
        onSuccess: function(data) {
            if($type(data.result) == "object") {
                var el = obj.getNext("select");
                el.getChildren("option").dispose();
                new Element("option", {
                    "value": 0,
                    "text": "��ѡ��..."
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
#T=����������������������
����������������������
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
	��
	var Person=new Class(function(name,age){
		this.name=name;
		this.age=age;
	});
	Person.implement('log',function(){
		console.log(this.name+','+this.age);
	});
	var mark=new Person('mark',24);
	mark.log();//returns'mark,24'
#T=����
	�﷨:
	var MyClass=new Class(properties);

	����:
	properties - Can be one of the following types:
		(object) The collection of properties that apply to the Class. Also accepts some special properties such as Extends,Implements,and initialize (see below).
		(function) The initialize function (see below).

	����:Extends
	(class) The Class that this class will extend.

	The methods of this Class that have the same name as the Extends Class,will have a parent property,that allows you to call the other overridden method. The Extends property should be the first property in a class definition.

	����:Implements
	(class) The properties of a passed Class will be copied into the target Class.
	(array) An array of Classes,the properties of which will be copied into this Class.

	Implements is similar to Extends,except that it adopts properties from one or more other classes without inheritance. Useful when implementing a default set of properties in multiple Classes. The Implements property should come after Extends but before all other properties.

	����:initialize
	(function) The initialize function will be the constructor for this class when new instances are created.

	����:toElement
	(function) A method which returns an element. This method will be automatically called when passing an instance of a class in the document.id function.

	����:
	(class) The created Class.

	ʾ��:
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

	��չʾ��:
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

	����ʾ��:
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
	�﷨:
	MyClass.implement(properties);

	����:
	properties - (object) The properties to add to the base Class.

	ʾ��:
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
#T= �� ���� ��
	�﷨:
	For new classes:
	var MyClass=new Class({Implements:Chain});

	For existing classes:
	MyClass.implement(Chain);

	Stand alone
	var myChain=new Chain;

	ʾ��:
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
#T= �� Methods ��
 �� Methods ��
#T=chain
	Adds functions to the end of the call stack of the Chain instance.
	�﷨:
	myClass.chain(fn[,fn2[,fn3[,...]]]);

	����:
	fn - (function or array) The function (or array of functions) to add to the chain call stack. Will accept and number of functions or arrays of functions.

	����:
	(object) The current Class instance. Calls to chain can also be chained.

	ʾ��:
	//Fx.Tween has already implemented the Chain class because of inheritance of the Fx class.
	var myFx=new Fx.Tween('myElement',{property:'opacity'});
	myFx.start(1,0).chain(
		//Notice that "this" refers to the calling object (in this case,the myFx object).
		function(){this.start(0,1);},
		function(){this.start(1,0);},
		function(){this.start(0,1);}
	);//Will fade the Element out and in twice.

	�μ�:
	Fx,Fx.Tween
#T=callChain
	Removes the first function of the Chain instance stack and executes it. The next function will then become first in the array.
	�﷨:
	myClass.callChain([any arguments]);

	����:
	Any arguments passed in will be passed to the "next" function.

	����:
	(mixed) The return value of the "next" function or false when the chain was empty.

	ʾ��:
	var myChain=new Chain();
	myChain.chain(
		function(){alert('do dishes');},
		function(){alert('put away clean dishes');}
	);
	myChain.callChain();//alerts 'do dishes'.
	myChain.callChain();//alerts 'put away clean dishes'.
#T=clearChain
	Clears the stack of a Chain instance.
	�﷨:
	myClass.clearChain();

	����:
	(object) The current Class instance.

	ʾ��:
	var myFx=Fx.Tween('myElement','color');//Fx.Tween inherited Fx's implementation of Chain.
	myFx.chain(function(){while(true) alert("D'oh!");});//chains an infinite loop of alerts.
	myFx.clearChain();//cancels the infinite loop of alerts before allowing it to begin
#T= �� Events ��
	A Utility Class. Its methods can be implemented with Class:implement into any Class. In Fx,for example,this Class is used to allow any number of functions to be added to the Fx events,like 'complete','start',and 'cancel'. Events in a Class that implements Events must be either added as an option or with addEvent,not directly through .options.onEventName.
	�﷨:
	For new classes:
	var MyClass=new Class({Implements:Events});

	For existing classes:
	MyClass.implement(Events);

	ִ��:
	This class can be implemented into other classes to add its functionality to them.
	Events has been designed to work well with the Options class. When the option property begins with 'on' and is followed by a capital letter it will be added as an event (e.g. 'onComplete' will add as 'complete' event).

	ʾ��:
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

	ע��:
	Events starting with 'on' are still supported in all methods and are converted to their representation without 'on' (e.g. 'onComplete' becomes 'complete').

	�μ�:
	Class,Options
#T= �� Methods ��
 �� Methods ��
#T=Events Method:addEvent
	Adds an event to the Class instance's event stack.
	�﷨:
	myClass.addEvent(type,fn[,internal]);

	����:
	type - (string) The type of event (e.g. 'complete').
	fn - (function) The function to execute.
	internal - (boolean,optional) Sets the function property:internal to true. Internal property is used to prevent removal.

	����:
	(object) This Class instance.

	ʾ��:
	var myFx=new Fx.Tween('element','opacity');
	myFx.addEvent('start',myStartFunction);
#T=Events Method:addEvents
	The same as addEvent,but accepts an object to add multiple events at once.
	�﷨:
	myClass.addEvents(events);

	����:
	events - (object) An object with key/value representing:key the event name (e.g. 'start'),and value the function that is called when the Event occurs.

	����:
	(object) This Class instance.

	ʾ��:
	var myFx=new Fx.Tween('element','opacity');
	myFx.addEvents({
		start:myStartFunction,
		complete:function(){
			alert('Done.');
		}
	});
#T=Events Method:fireEvent
	Fires all events of the specified type in the Class instance.
	�﷨:
	myClass.fireEvent(type[,args[,delay]]);

	����:
	type - (string) The type of event (e.g. 'complete').
	args - (mixed,optional) The argument(s) to pass to the function. To pass more than one argument,the arguments must be in an array.
	delay - (number,optional) Delay in milliseconds to wait before executing the event (defaults to 0).

	����:
	(object) This Class instance.

	ʾ��:
	var Widget=new Class({
		Implements:Events,
		initialize:function(arg1,arg2){
			//...
			this.fireEvent('initialize',[arg1,arg2],50);
		}
	});
#T=Events Method:removeEvent
	Removes an event from the stack of events of the Class instance.
	�﷨:
	myClass.removeEvent(type,fn);

	����:
	type - (string) The type of event (e.g. 'complete').
	fn - (function) The function to remove.

	����:
	(object) This Class instance.

	ע��:
	If the function has the property internal and is set to true,then the event will not be removed.
#T=Options Method:setOptions
	Merges the default options of the Class with the options passed in. Every value passed in to this method will be deep copied. Therefore other class instances or objects that are not intended for copying must be passed to a class in other ways.
	�﷨:
	myClass.setOptions([options]);

	����:
	options - (object,optional) The user defined options to merge with the defaults.

	����:
	(object) The current Class instance.

	ʾ��:
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

	ע��:
	Relies on the default options of a Class defined in its options property.
#T=Events Method:removeEvents
	Removes all events of the given type from the stack of events of a Class instance. If no type is specified,removes all events of all types.
	�﷨:
	myClass.removeEvents([events]);

	����:
	events - (optional) If not passed removes all events of all types.
		(string) The event name (e.g. 'success'). Removes all events of that type.
		(object) An object of type function pairs. Like the one passed to addEvents.

	����:
	(object) The current Class instance.

	ʾ��:
	var myFx=new Fx.Tween('myElement','opacity');
	myFx.removeEvents('complete');

	ע��:
	removeEvents will not remove internal events. See Events:removeEvent.
#T= �� Options ��
	A Utility Class. Its methods can be implemented with Class:implement into any Class. Used to automate the setting of a Class instance's options. Will also add Class Events when the option property begins with 'on' and is followed by a capital letter (e.g. 'onComplete' adds a 'complete' event). You will need to call this.setOptions() for this to have an effect,however.
	�﷨:
	For new classes:
	var MyClass=new Class({Implements:Options});

	For existing classes:
	MyClass.implement(Options);
#T=Options in combination with Events
	If a Class has Events as well as Options implemented,every option beginning with 'on' and followed by a capital letter (e.g. 'onComplete') becomes a Class instance event,assuming the value of the option is a function.
	ʾ��:
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


#T= ����
 ����
#T=����������������������
����������������������
#T=Option
	var opt={
		fps:60,
		link:'chain',//ignore,cancel,chain
		duration:'long',//'short':250ms;'normal':500ms;'long':1000ms
		transition:'bounce:out',//[:in][:out] - 'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'
		onStart:function(){console.log('��ʼ!');},
		onComplete:function(){console.log('������!');}
	}
	$('b').set('morph',opt).morph({'width':500,'height':300});
#T=fade ��������
	$('^!').fade('out');//in,out,show,hide,toggle(number)

	$('b').addEvents({
	        mouseenter:function(){
			  this.setStyle('color','white').fade('0.3');
			},
			mouseleave:function(){
			  this.setStyle('color','black').fade('1'); 
			}
 
     });
#T=highlight ��ɫ�ı�
	$('^!').highlight('#ff0000');
	$('^!').highlight('#ff0000','#00ff00');
#T=Morph ��״����
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
#T=Tween ������cssֵ֮�����
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
#T=��������
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
#T=����������������������
����������������������
#T=����
	�﷨:
	var myFx=new Fx([options]);

	����:
	options - (object,optional) An object with options for the effect. See below.

	ѡ��:
	fps - (number:Ĭ����50) ÿ���֡��.
    unit - (string:Ĭ���� false) ��λ,��Ϊ 'px','em',�� '%'.
    link - (string:Ĭ���� ignore) ������ 'ignore','cancel' �� 'chain'.
        'ignore'-����������ִ��֮��ʱ,�µ����󽫱�����
        'cancel'-����������ִ��֮��ʱ,������ȡ����ǰִ���е�����,��ʼִ���µ�����
        'chain'-����������ִ��֮��ʱ,������µ����������ڵ�ǰ����֮��,����ִ����������
    duration - (number:Ĭ���� 500) ��Ӧ�ĳ���ʱ��,���������⻹����Ϊ����ֵ:
        'short' - 250ms
        'normal' - 500ms
        'long' - 1000ms
	transition - (function:defaults to 'sine:in:out' The equation to use for the effect see Fx.Transitions. Also accepts a string in the following form:
	transition[:in][:out] - for example,'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out'

	�¼�:
    onstart - (function) ��������ʼʱ����.
    oncancel - (function) ��������ȡ��ʱ����.
    oncomplete - (function) ����������ʱ����.
    onchainComplete - (function) ���ʹ����'chain'ѡ��,�����еĶ���������ʱ����

	ʾ��:
	var opt={
		fps:60,
		link:'chain',//ignore,cancel,chain
		duration:'long',//'short':250ms;'normal':500ms;'long':1000ms
		transition:'bounce:out',//'linear','quad:in','back:in','bounce:out','elastic:out','sine:in:out' - [:in][:out]
		onStart:function(){console.log('��ʼ!');},
		onComplete:function(){console.log('������!');}
	}
	$('b').set('morph',opt).morph({'width':500,'height':300});

	ע��:
	You cannot change the transition if you haven't included Fx.Transitions.js,(unless you plan on developing your own curve). ;)
	The Fx Class is just a skeleton for other Classes to extend the basic functionality.

	�μ�:
	Fx.Tween,Fx.Morph.
#T= �� Fx ��
 �� Fx ��
#T=start
	The start method is used to begin a transition. Fires the 'start' event.
	�﷨:
	myFx.start(from[,to]);

	����:
	from - (mixed) The starting value for the effect. If only one argument is provided,this value will be used as the target value.
	to - (mixed,optional) The target value for the effect.

	����:
	(object) - This Fx instance.

	ʾ��:
	See examples in the documentation for each Fx subclass.

	ע��:
	If only one parameter is provided,the first argument to start will be used as the target value,and the initial value will be calculated from the current state of the element.
	The format and type of this value will be dependent upon implementation,and may vary greatly on a case by case basis. Check each implementation for more details.
#T=set
	The set method is fired on every step of a transition. It can also be called manually to set a specific value to be immediately applied to the effect.
	�﷨:
	myFx.set(value);

	����:
	value - (mixed) The value to immediately apply to the transition.

	����:
	(object) - This Fx instance.

	ʾ��:
	See examples in the documentation for each Fx subclass.
#T=cancel
	The cancel method is used to cancel a running transition. Fires the 'cancel' event.
	�﷨:
	myFx.cancel();

	����:
	(object) - This Fx instance.

	Fx Method:pause

	Temporarily pause a currently running effect.
	�﷨:
	myFx.pause();

	����:
	(object) - This Fx instance.

	ע��:
	The timer will be stopped to allow the effect to continue where it left off by calling Fx:resume.
	If you call start on a paused effect,the timer will simply be cleared allowing the new transition to start.
#T=resume
	Resume a previously paused effect.
	�﷨:
	myFx.resume();

	����:
	(object) - This Fx instance.

	ע��:
	The effect will only be resumed if it has been previously paused. Otherwise,the call to resume will be ignored.
#T= �� Tween �� ���䶯��
	var myFx=new Fx.Tween('Content',{//������Fx�Ĺ���
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
	�﷨:
	myElement.fade([how]);

	����:
	how - (mixed,optional:defaults to 'toggle') The opacity level as a number or string representation. Possible values include:
		'in' - Fade the element to 100% opacity.
		'out' - Fade the element to 0% opacity.
		'show' - Immediately set the element's opacity to 100%.
		'hide' - Immediately set the element's opacity to 0%.
		'toggle' - If visible,fade the element out,otherwise,fade it in.
		(number) - A float value between 0 and 1. Will fade the element to this opacity.

	����:
	This Element.

	ʾ��:
	$('myElement').fade('out');//fades 'myElement' out.
	$('myElement').fade(0.7);//fades 'myElement' to 70% opacity.
#T=Tween Method:highlight
	Element shortcut method for tweening the background color. Immediately transitions an Element's background color to a specified highlight color then back to its set background color.
	�﷨:
	myElement.highlight([start,end]);

	����:
	start - (string,optional:defaults to '#ff8') The color from which to start the transition.
	end - (string,optional:defaults to Element's set background-color) The background color to return to after the highlight effect.

	ע��:
	If no background color is set on the Element,or its background color is set to 'transparent',the default end value will be white.

	����:
	(element) This Element.

	ʾ��:
	//immediately changes the background to light blue,then back to its original color (or white):
	$('myElement').highlight('#ddf');
	//immediately changes the background to light blue,then fades to grey:
	$('myElement').highlight('#ddf','#ccc');
#T= �� Morph �� ����
	var myFx=new Fx.Morph('Content',{//������Fx�Ĺ���
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
	�﷨:
	myElement.morph(properties);

	����:
	properties - (mixed) The CSS properties to animate. Can be either an object of CSS properties or a string representing a CSS selector. If only one value is given for any CSS property,the transition will be from the current value of that property to the value given.

	����:
	(element) This Element.

	ʾ��:
	$('myElement').morph({height:100,width:200});//���Object

	���ѡ����:
	$('myElement').morph('.class1');
#T= �� Transitions �� ����
	var myTransition=new Fx.Transition(function(pos,x){
		return 1 - Math.pow(Math.abs(Math.log(pos) / Math.log(x && x[0] || Math.E)),pos);
	},1.3);
	var myFx=new Fx.Tween('Content',{
		property:'height',
		transition:myTransition.easeOut
	}).start(30,100);

	$('Content').set('tween',{transition:Fx.Transitions.Elastic.easeOut});
	$('Content').tween('margin-top',100);
#T= �� Method ��
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
	ע��:
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
	�﷨:
	var myTransition=new Fx.Transition(transition[,params]);

	����:
	transition - (function) Can be a Fx.Transitions function or a user-provided function which will be extended with easing functions.
	params - (mixed,optional) Single value or an array for multiple values to pass as the second parameter for the transition function. A single value will be transformed to an array.

	����:
	(function) A function with easing functions.

	ʾ��:
	//Your own function. Here overshoot is bigger (now 1.3) when base -> 1 and base != 1.
	var myTransition=new Fx.Transition(function(pos,x){
		return 1 - Math.pow(Math.abs(Math.log(pos) / Math.log(x && x[0] || Math.E)),pos);
	},1.3);
	var myFx=new Fx.Tween('myElement',{
		property:'height',
		transition:myTransition.easeOut
	}).start(30,100);

	�μ�:
	Fx.Transitions
#T= 


#T= Event
 Event
#T=����������������������
����������������������
#T=����
$('pcid').addEvent('change',function(i){
	i=i.target;
	alert(i.get('value')+'clicked!');
});
#T=����
	�﷨:
	new DOMEvent([event[,win]]);

	����:
	event - (event,required) An HTMLEvent Object.
	win - (window,optional:defaults to window) The context of the event.

	����:
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

	ʾ��:
	$('myLink').addEvent('keydown',function(event){
		//the passed event parameter is already an instance of the Event type.
		alert(event.target);
		alert(event.relatedTarget);
		alert(event.key);//returns the lowercase letter pressed.
		alert(event.shift);//returns true if the key pressed is shift.
		if(event.key == 's' && event.control) alert('Document saved.');//executes if the user presses Ctr+S.
	});

	ע��:
	Accessing event.page / event.client requires the page to be in Standards Mode.
	Every event added with addEvent gets the MooTools method automatically,without the need to manually instance it.
#T= �� Method ��
 �� Method ��
#T=event.stop ��ִֹ���¼���Ĭ����Ϊ
	Stop an event from propagating and also executes preventDefault.
	�﷨:
	myEvent.stop();

	����:
	(object) This DOMEvent instance.

	ʾ��:
	<a id="myAnchor" href="http://google.com/">Visit Google.com</a>

	Js:
	$('myAnchor').addEvent('click',function(event){
		event.stop();//Prevents the browser from following the link.
		this.set('text','Where do you think you\'re going?');//'this' is Element that fires the Event.
		(function(){
			this.set('text','Instead visit the Blog.').set('href','http://blog.mootools.net');
		}).delay(500,this);
	});

	ע��:
	Returning false within the function can also stop the propagation of the Event.

	�μ�:
	Element.addEvent,DOMEvent.stopPropagation,DOMEvent.preventDefault,Function:delay
#T=event.stopPropagation ֹͣ�¼���ִ��(ֹͣ�¼���DOM�ṹ�н���ð�ݴ���)
	��˼�ǵ�����ڲ��div��Ĭ�ϻ�ð��ִ�����div���¼�,�����������������᳹����ֹð��
	Cross browser method to stop the propagation of an event (this stops the event from bubbling up through the DOM).
	�﷨:
	myEvent.stopPropagation();

	����:
	(object) This DOMEvent object.

	ʾ��:
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

	�μ�:
	Element:addEvent
	MDC event.stopPropagation
#T=event.preventDefault ��ִֹ���¼���Ĭ����Ϊ
	Cross browser method to prevent the default action of the event.
	�﷨:
	myEvent.preventDefault();

	����:
	(object) This DOMEvent object.

	ʾ��:
	<form>
		<input id="myCheckbox" type="checkbox" />
	</form>

	Js:
	$('myCheckbox').addEvent('click',function(event){
		event.preventDefault();//checkbox��Զ�޷����趨Ϊ"checked".
	});

	�μ�:
	Element:addEvent
	MDC event.preventDefault
#T=$('?').Events.shiftclick ={} �Զ����¼�
	You can add additional custom events by adding properties (objects) to the Element.Events Object
	����:
	The Element.Events.yourProperty (object) can have:
		base - (string,optional) the base event the custom event will listen to. Its not optional if condition is set.
		condition - (function,optional) the condition from which we determine if the custom event can be fired. Is bound to the element you add the event to. The Event is passed in.
		onAdd - (function,optional) the function that will get fired when the custom event is added. Is bound to the element you add the event to.
		onRemove - (function,optional) the function that will get fired when the custom event is removed. Is bound to the element you add the event to.

	ʾ��:
	Element.Events.shiftclick ={
		base:'click',//the base event type
		condition:function(event){//a function to perform additional checks
			return (event.shift == true);//this means the event is free to fire
		}
	};
	document.getElement('body').addEvent('shiftclick',function(event){
		alert('��סShiftȻ�������');
	});
	Element.Events.ctrlpress ={
		base:'keydown',//the base event type
		condition:function(event){//a function to perform additional checks
			if(event.control){return (event.control == true);}
		}
	};
	window.addEvent('ctrlpress',function(event){
		alert('����Ctrl��');
	});
	Element.Events.altpress ={
		base:'keydown',//the base event type
		condition:function(event){//a function to perform additional checks
			if(event.alt){return (event.alt == true);}
		}
	};
	window.addEvent('altpress',function(event){
		alert('����alt��');
	});
	��
	Element.Events.shiftclick ={
		base:'click',//the base event type
		condition:function(event){//a function to perform additional checks
			return (event.shift == true);//this means the event is free to fire
		}
	};
	$('myInput').addEvent('shiftclick',function(event){
		log('the user clicked the left mouse button while holding the shift key');
	});

	ע��:
	There are different types of custom Events you can create:
		Custom Events with only base:they will just be a redirect to the base event.
		Custom Events with base and condition:they will be redirect to the base event,but only fired if the condition is met.
		Custom Events with onAdd and/or onRemove and any other of the above:they will also perform additional functions when the event is added/removed.
	Since MooTools 1.3 this is a native JavaScript Object and not an instance of the deprecated Hash

	����:
	If you use the condition option you NEED to specify a base type,unless you plan to overwrite a native event. (highly unrecommended:use only when you know exactly what you're doing).
#T=$('?').addEvent
	Attaches an event listener to a DOM element.
	�﷨:
	myElement.addEvent(type,fn);

	����:
	type - (string) The event name to monitor ('click','load',etc) without the prefix 'on'.
	fn - (function) The function to execute.

	����:
	(element) This Element.

	ʾ��:
	<div id="myElement">Click me.</div>

	Js:
	$('myElement').addEvent('click',function(){
		alert('clicked!');
	});

	ע��:
	You can stop the Event by returning false in the listener or calling Event:stop.
	This method is also attached to Document and Window.

	�μ�:
	w3schools Event Attributes
#T=$('?').removeEvent('?',function(){})
	Works as Element.addEvent,but instead removes the specified event listener.
	�﷨:
	myElement.removeEvent(type,fn);

	����:
	type - (string) The event name.
	fn - (function) The function to remove.

	����:
	(element) This Element.

	ʾ��:
	var destroy=function(){alert('Boom:'+this.id);} //this refers to the Element.
	$('myElement').addEvent('click',destroy);
	//later...
	$('myElement').removeEvent('click',destroy);

	����ʾ��:
	var destroy=function(){alert('Boom:'+this.id);}
	var boundDestroy=destroy.bind($('anotherElement'));
	$('myElement').addEvent('click',boundDestroy);
	//later...
	$('myElement').removeEvent('click',destroy);//this won't remove the event.
	$('myElement').removeEvent('click',destroy.bind($('anotherElement'));//this won't remove the event either.
	$('myElement').removeEvent('click',boundDestroy);//the correct way to remove the event.

	ע��:
	When the function is added using Function:bind or Function:pass,etc,a new reference is created. For removeEvent to work,you must pass a reference to the exact function to be removed.
	This method is also attached to Document and Window.
#T=$('?').addEvents('?',function(){})
	The same as Element:addEvent,but accepts an object to add multiple events at once.
	�﷨:
	myElement.addEvents(events);

	����:
	events - (object) An object with key/value representing:key the event name,and value the function that is called when the Event occurs.

	����:
	(element) This Element.

	ʾ��:
	$('myElement').addEvents({
		mouseover:function(){
			alert('mouseover');
		},
		click:function(){
			alert('click');
		}
	});

	ע��:
	This method is also attached to Document and Window.

	�μ�:
	Element:addEvent
#T=$('?').removeEvents('?')
	Removes all events of a certain type from an Element. If no argument is passed,removes all events of all types.
	�﷨:
	myElements.removeEvents([events]);

	����:
	events - (optional) if not passed removes all events from the element.
		(string) The event name (e.g. 'click'). Removes all events of that type.
		(object) An object of type function pairs. Like the one passed to Element:addEvent.

	����:
	(element) This Element.

	ʾ��:
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

	ע��:
	This method is also attached to Document and Window.

	�μ�:
	Element:removeEvent
#T=$('?').fireEvent('?',$('?'),1000)
	Executes all events of the specified type present in the Element.
	�﷨:
	myElement.fireEvent(type[,args[,delay]]);

	����:
	type - (string) The event name (e.g. 'click')
	args - (mixed,optional) Array or single object,arguments to pass to the function. If more than one argument,must be an array.
	delay - (number,optional) Delay (in ms) to wait to execute the event.

	����:
	(element) This Element.

	ʾ��:
	//fires all the added 'click' events and passes the Element 'anElement' after one second
	$('myElement').fireEvent('click',$('anElement'),1000);

	ע��:
	This will not fire the DOM Event (this concerns all inline events ie. onmousedown="..").
	This method is also attached to Document and Window.
#T=$('?').cloneEvents(?)
	Clones all events from an Element to this Element.
	�﷨:
	myElement.cloneEvents(from[,type]);

	����:
	from - (element) Copy all events from this Element.
	type - (string,optional) Copies only events of this type. If null,copies all events.

	����:
	(element) This Element.

	ʾ��:
	var myElement=$('myElement');
	var myClone=myElement.clone().cloneEvents(myElement);//clones the element and its events

	ע��:
	This method is also attached to Document and Window.
#T= �� ί�� ��
 �� ί�� ��
#T=myElement.addEvent('click:relay(a)',function(event,target){})
	Extends the Element type to include event-delegation in its event system.
	Event delegation is a common practice where an event listener is attached to a parent element to monitor its children rather than attach events to every single child element. It's more efficient for dynamic content or highly interactive pages with a lot of DOM elements.

	��ʾ:
	Element.Delegation

	ʾ��:
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

	ע��:
	Delegation is especially useful if you are using AJAX to load content into your pages dynamically,as the contents of an element can change with new elements added or others removed and your delegated events need not change.
	By delegating events to parent objects you can dramatically increase the efficiency of your pages. Consider the example above. You could attach events to every link on a page - which may be hundreds of DOM elements - or you can delegate the event to the document body,evaluating your code only when the user actually clicks a link (instead of on page load/domready).
	You can use any selector in combination with any event
	Be wary of the cost of delegation;for example,mouseover/mouseout delegation on an entire document can cause your page to run the selector constantly as the user moves his or her mouse around the page. Delegation is not always the best solution.
	In general it is always better to delegate to the closest parent to your elements as possible;delegate to an element in the page rather than the document body for example.
#T=myElement.addEvent('click:relay(a.myStyle)',function(event,target){})
	Delegates the methods of an element's children to the parent element for greater efficiency when a selector is provided. Otherwise it will work like addEvent.
	�﷨:
	myElement.addEvent(typeSelector,fn);

	����:
	typeSelector - (string) An event name (click,mouseover,etc) that should be monitored paired with a selector (see example) to limit functionality to child elements.
	fn - (function) The callback to execute when the event occurs (passed the event just like any other addEvent usage and a second argument,the element that matches your selector that was clicked).

	ʾ��:
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

	����:
	element - This element.
#T=myElement.addEvents('?')
	Delegates the events to the parent just as with addEvent above. Works like addEvents.
	ʾ��:
	$('myElement').addEvents({
		//monitor an element for mouseover
		mouseover:fn,
		//but only monitor child links for clicks
		'click:relay(a)':fn2
	});
#T=myElement.removeEvent('click:relay(a.myStyle)',function(event,target){})
	Removes a method from an element like removeEvent.
	ʾ��:
	var monitor=function(event,element){
		alert('you clicked a link!');
	};
	$('myElement').addEvent('click:relay(a)',monitor);
	//link clicks are delegated to element
	//remove ί��:
	$('myElement').removeEvent('click:relay(a)',monitor);
#T=myElement.removeEvents('?')
	Removes a series of methods from delegation if the functions were used for delegation or else works like removeEvents.
	ʾ��:
	var monitor=function(){
		alert('you clicked or moused over a link!');
	};
	$('myElement').addEvents({
		'mouseover:relay(a)':monitor,
		'click:relay(a)':monitor
	});
	//link clicks are delegated to element
	//removeί��:
	$('myElement').removeEvents({
		'mouseover:relay(a)':monitor,
		'click:relay(a)':monitor
	});
	//remove all click:relay(a) events
	$('myElement').removeEvents('click:relay(a)');
#T= �� Function ��
 �� Function ��
#T=DOMEvent.defineKey Ԥ��һ���¼�key
	This function allows to add an additional event key code.
	ʾ��:
	DOMEvent.defineKey(16,'shift');
	$('myInput').addEvent('keydown',function(event){
		if(event.key == 'shift') alert('You pressed shift.');
	});

	Ԥ���keys:
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

	�μ�:
	MooTools More Keyboard
#T=DOMEvent.defineKeys Ԥ�����¼�key
	This function allows to add additional event key codes.
	ʾ��:
	DOMEvent.defineKeys({
		'16':'shift',
		'17':'control'
	});
	$('myInput').addEvent('keydown',function(event){
		if(event.key == 'control') alert('You pressed control.');
	});
#T= �� Event ��
 �� Event ��
#T=scrollTo
	Scrolls the element to the specified coordinated (if the element has an overflow). The following method is also available on the Window object.
	�﷨:
	myElement.scrollTo(x,y);

	����:
	x - (number) The x coordinate.
	y - (number) The y coordinate.

	ʾ��:
	$('myElement').scrollTo(0,100);

	�μ�:
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
		alert('code:'+event.code);//�����ļ��̴���
		alert('shift:'+event.shift);
		alert('control:'+event.control);
		alert('alt:'+event.alt);
		alert('meta:'+event.meta);

		//Ctr+S ��ϼ�
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


#T= ����Jquery
 ����Jquery
#T=����������������������
����������������������
#T=Core��չ:��Jq
Element.implement({
	debug:function(msg){
		console.log(msg);
	},
	del:function(match){//destroy
		return this.match(match)?this.destroy():this;//console.log($$('a').remove());//console.log($$('span').del('.foo[href=#]'));
	},//SELECTOR
	brothers:function(match){//�õ������ֵܽڵ�,������������
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
	data:function(opt,val){//��д��ʱֵ
		return val ? this.store(opt,val):this.retrieve(opt);//$('a').data('rel','da');alert($('a').data('rel'));
	},
	_into:function(content){//��Element�ڲ���������֮ǰ����Ԫ�ؽڵ������,����
		switch(typeOf(content)){
			case 'element':content.inject(this,'top');break;//var my=new Element('a.myClass');$('a')._into(my);
			case 'string':this.set('html',content+this.get('html'));break;//$('a')._into('<b>html</b>');
		}
		return this;
	},
	into_:function(content){//��Element�ڲ���������֮�����Ԫ�ؽڵ������,����
		switch(typeOf(content)){
			case 'element':content.inject(this);break;//var my=new Element('a.myClass');$('a').into_(my);
			case 'string':this.set('html',this.get('html')+content);break;//$('a').into_('<b>html</b>');
		}
		return this;
	},
	_cut:function(el){//��Element���в�ճ����el�ڲ���������֮ǰ,����
		return this.inject($(el),'top');//$('t1')._cut($('t3'));
	},
	cut_:function(el){//��Element���в�ճ����el�ڲ���������֮��,����
		return this.inject($(el));//$('t1').cut_($('t3'));
	},
	_move:function(el){//��elƽ�Ƶ�Element֮ǰ,�ֵ�
		return el.inject(this,'before');//$('t1')._move($('t3'));
	},
	move_:function(el){//��elƽ�Ƶ�Element֮��,�ֵ�
		return el.inject(this,'after');//$('t1')._move($('t3'));
	},
	_xmove:function(el){//��Elementƽ�Ƶ�el֮ǰ,�ֵ�
		return this.inject($(el),'before');//$('t1')._xmove($('t3'));
	},
	xmove_:function(el){//��Elementƽ�Ƶ�el֮��,�ֵ�
		return this.inject($(el),'after');//$('t1').xmove_($('t3'));
	},
	_replace:function(el){//Element���滻����el
		el.replaces(this);//console.log($('a')._replace($('b')));
		return this;
	},
	replace_:function(el){//el���滻����Element
		switch(typeOf(el)){
			case 'element':this.replaces(el);break;//console.log($('g').replace_($('t3')));
			//case 'string':$$(el).each(function(elem){this.clone(true).replaces(elem);},this);break;
		}
		return this;
	},
	wrap:function(el){//��Element���в�ճ����el�ڲ���������֮��,����
		el.wraps(this);//$('t1').wrap($('t3'));
		return this;
	},
	xwrap:function(el){//��el���в�ճ����Element�ڲ�����el�������滻ΪElement������,����
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
			for(var name in options){old[name]=el.style[name];el.style[name]=options[name];}//����ɵ�style,��������style
			fn.call(el);
			for(var name in options){el.style[name]=old[name];}//��ԭ�ɵ�style
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
			for(var name in options){old[name]=el.style[name];el.style[name]=options[name];}//����ɵ�style,��������style
			fn.call(el);
			for(var name in options){el.style[name]=old[name];}//��ԭ�ɵ�style
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
	fire:function(type,args,tim){//$('b').fire('click',$('a'),4000);����$('b')���¼�
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
	_Scroll:function(y){//ִ�й������ù�������Topֵ
		return y?this.scrollTo(this.getScroll().x,y):this.getScroll().y;//console.log($('a')._Scroll(3));
	},
	Scroll_:function(x){//ִ�й������ù�������Leftֵ
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
	},//����
	_slide:function(speed,fn){//��ʾ��չ��Element
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
	slide_:function(speed,fn){//����������Element
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
	_slide_:function(speed,fn){//��������
		return (this.getStyle('display')=='none')?this._slide():this.slide_();
	},
	xshow:function(speed,fn){//���벢��ʾElement
		if(this.getStyle('display')!='none'){return this;}
		var options ={};
		if(speed){options.duration=speed;}
		if(fn){options.onComplete=fn;}
		this.set('tween',options).fade('hide').setStyle('display','').fade('in');
		return this;
	},
	xhide:function(speed,fn){//����������Element
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
	xfade:function(speed,opacity,fn){//�Զ���
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
			onStart:function(){console.log('��ʼ!');},
			onComplete:function(){console.log('������!');}
		}
		$('b').xmorph(opt,{'width':500,'height':300});
	/*/
	xmorph:function(opt,ani){//���в����Զ���
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
			type:"post",timeout:100,url:"@.php",data:"lat="+encodeURI('�L��')+"&lng=Boston",
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
#T=�ṹ:����Jq���¼�ģʽ
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
#T=�ṹ:ʵ��Jq���﷨�ṹ
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


#T= �ҵĲ��
 �ҵĲ��
#T=����������������������
����������������������
#T=С�����u�ֲ��
var xStar=new Class({
	//ʵ��Events�࣬��Ϊ֮���ڵ����ʱ����Դ���һ���¼�
	Implements:Events,
	//���캯��
	//where Ҫ�����λ�ã�where�ɴ���dom��Element�������Ԫ�ص�id�ַ���
	//store ��ѡ,Ĭ�Ϸ��������������Ĭ��Ϊ5��
	//name  ��ѡ������xStar�����ʱ��ᴴ��һ��input hidden����nameΪ�����
	//	    name���ԣ���������Ĭ��Ϊrating��
	//starnum ��ѡ,���ǵ�����,������Ĭ��Ϊ10
	initialize:function(where,store,name,starnum){
		store=store||5;
		me=this;
		me.enable=true;
		me.starnum=starnum||10;
		where=$(where);
		//����div����������������
		var rat=new Element("div",{styles:{height:20,cursor:"pointer"}});
		//����input hidden����
		var ivalue=new Element("input",{
			type:"hidden",
			name:name||"rating",
			value:store
		});
		me.ivalue=ivalue;
		//��input hidden������뵽���洴����div����
		ivalue.inject(rat);
		rat.inject(where);
		//��������ͼƬ
		me.stars=[];
		for(var i=0;i<me.starnum;i++){
			var img=new Element("img",{styles:{width:16,height:16}});
			(function(n){
				//Ϊ����ͼƬ����¼�
				img.addEvents({
					'mouseover':function(){if(me.enable) me.setStar(n+1,1);},//�������
					'mouseout':function(){if(me.enable) me.setStar(me.ivalue.get("value"),2);},//����ƿ�
					'click':function(){if(me.enable) me.setStar(n+1);}//���
				});
			})(i);
			me.stars.push(img);
			//��ͼƬ���뵽div
			img.inject(rat);
		}
		//���ó�ʼ�ķ�����ͬʱҲ��ΪͼƬ����src����
		me.setStar(store,2);
	},
	//���÷���
	//n ����
	//t ������ѡ����������Ϊ�ڲ����ã��ⲿ���õ�ʱ���벻Ҫ��������
	//  ��tΪ1ʱ��ֻ�ı�ͼƬ�����ı�input hidden��ֵ,����������ϵ��¼�
	//  ��tΪ2ʱ���ı�ͼƬ�����Ҹı�input hidden��ֵ,��������Ƴ��ָ�ֵ
	//  ������t��ʱ�򣬸ı�ͼƬ���ı�input hidden��ֵ���������¼�,���ڵ�����ѡ�е�ʱ��
	setStar:function(n,t){
		if(!this.enable) return;
		n=n.toInt();
		//�ı�ͼƬ
		if(n>0&&n<=me.starnum){
			for(var i=1;i<=me.starnum;i++){
				if(i<=n){
					this.stars[i-1].set("src","@img/star_done.png");
				}else{
					this.stars[i-1].set("src","@img/star_un.png");
				}
			}
			//�Ƿ�ı�input hidden��ֵ
			if(t!==1){
				this.ivalue.set("value",n);
				//�Ƿ񴥷��¼�
				if(t!==2){
					//�����¼�����Ϊ����ʵ����Events������������Դ����¼�
					this.fireEvent("rate");
				}
			}
		}
	},
	//�õ�����
	getStar:function(){
		return this.ivalue.get("value");
	},
	//�����Ƿ����
	setEnable:function(b){
		this.enable=!!b;
	}
});

document.addEvent("domready",function(){
	//����һ�����󣬷���ratingtest�£�Ĭ��Ϊ5�֣�input hidden����nameΪstore
	var rating=new xStar("ratingtest",5,"store");
	//���rate�¼�����ѡ��5�ֵ�ʱ������Ϊ������״̬
	rating.addEvent("rate",function(){
		alert(this.getStar());
		if(this.getStar()==5){
			this.setEnable(false);
			alert('�u�ֱ�������,Ո�c��Enable���o!');
		}
	});
	
	//��Ӱ�ť����¼�������Ϊ����
	$("enable").addEvent("click",function(){
		rating.setEnable(true);
	});
});

</script> 
<div id="ratingtest">����:</div><div><input type="button" id="enable" value="enable"></div>
</body>
#T=���_�l���W�q�Ę��}
/**
���:�W�q�Ę��}
����:ԓ��������p�׌����<title>���}���F�W�qЧ��
����:
	tit:(����)��Ҫ��<title>���W�q�ă���
	tim:[���x]�W���l��,���ٺ����W��һ��
	delay:[���x]���t���ٺ���ֹͣ�W��
ע��:
	������׃��߀�Ƿ���,ֻҪǰ߅�����Q�ľ���˽��
�÷�:
	a=new xTitle();
	a.Start({tit:'������Ϣ��',tim:200,delay:6000});
/**/
var xTitle=new Class({
	Implements:[Options,Events],
	Opt:{
		tim:280,	//�W���l��,���ٺ����W��һ��
		tit:'',		//Ҫ�W�ӵă���
		delay:null,	//���t���ٺ���ֹͣ�W��
		_mess:'',	//ȫ�֘�ʾ��,��ӛ�F����Ҫ�W�ӵă���
		_title:'',	//ԭʼ���},��<title>�˻`�ȵ�ԭʼֵ
		_timer1:'',	//Ӌ�r�����1
		_timer2:''	//Ӌ�r�����2
	},
	initialize:function(Opt){//��ʼ�����캯��
		this.setOptions(Opt);//�O��Options
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
a.Start({tit:'������Ϣ��'});
#T=���_�l�����L�ٲ��(Class)
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
		initialize:function(options){//��ʼ�����캯��
			this.setOptions(options);//�O��options
			if(!this.options.$Boxtit){return false;}
			this.Core();
		},
		Core:function(){
			$Boxtit=this.options.$Boxtit;
			$Boxmsg=$Boxtit.getElement('li');
			$Boxmsg.setStyle("display","none");
			$Boxtit.each(function($I,i1){
				$I.onclick=function(){
					//i2=$Boxtit.indexOf(this);console.log(i1+'|'+i2);//�@�e��i1��i2���H�϶�������ֵ
					$Boxmsg.setStyle("display","none");
					this.getElement('li').setStyle("display","");
				};
			})
		}
	});
	new Acc({$Boxtit:$$('ul')});
#T=ͨ��Ajax����(Function)
	/*/
		ActiveEdt(this,"arg=4��items��id=123��|��0��7","welcome.php","jedit","POST",_Val);//��,��Ҫ����ę�λ,where�l��,һ��fieldset�������ֵ�ķָ�,��Ҫ����������,����������ֶ΂���
		onchange='ActiveEdt(this,"id=2","","tst.php");'
		$("id").blur(function(){ActiveEdt(this,"id=3");})
	/*/
	//ͨ��ajax�o�B��݋����(ֻ��ᘌ����ɴ_��ID��input;select;textarea����),������function
	//_this����������(��id),ajax����,ajax�����ļ�,work����ֵ,ajax�ύ��ʽ,ֵ(����Ђ�ֵ�t�Դ˞�׼,��t�����xȡ)
	var ActiveEdt=function(_this,_action,_file,_work,_method,_V){
		if(!_this){return;}
		i=$(_this);
		if(!_work){_work='jedit';}
		if(!_file){_file='sys.php';}
		if(!_method){_method='POST';}_method=_method.toUpperCase();
		var _value = i.getProperty('value');

		//����ݔ���λ�Д�
		try{
			_Isnum=i.getProperty('isnum');
			_Isnum=(!_Isnum)?"":_Isnum.toLowerCase();
		}catch(e){}
		if(_Isnum=='true'){
			if(_value==''){Pop(i,{htm:'Warring:ԓ��λ���Ҫ�����!',pos:3,tim:1500});return false;}
			if(isNaN(_value)){
				i.setProperty("value","");
				Pop(i,{htm:'Warring:ԓ��λ���Ҫ�����!',pos:3,tim:1500});
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
				Pop(i,{htm:'OK:�����ɹ�!',pos:3,tim:600});
			}
		});
	};
#T=Tabѡ�
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
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				</ul>

				<!---->
				<ul id="box2" class="hide">
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				</ul>

				<!---->
				<ul id="box3" class="hide">
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
				<li><a href="#">HTML5����֮�±�ǩ�Ľ���</a></li>
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
		initialize:function(options){//��ʼ�����캯��
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
#T=���:���alt
	<style type="text/css">
	#tooltip-container{position:absolute;width:200px;display:inline-block;z-index:20;visibility:hidden;}
	#tooltip-arrow-up{height:0;width:0;overflow:hidden;font-size:0;line-height:0;border-color:transparent transparent #2f2f2f transparent;border-style:dashed dashed solid dashed;border-width:5px;margin:0 auto;}
	#tooltip-content{color:#fff;background:#2f2f2f;padding:5px 10px;font-size:1em;text-align:center;-webkit-border-radius:5px;-moz-border-radius:5px;}
	</style>
	</head>

	<body>
	<a class="tooltip" href="http://cssrainbow.cn/category/tutorials" title=" MooTools,jQuery,HTML,CSS">Tutorials</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/articles" title="General ,Web Roundups"> Articles </a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/demos" title="��ʾ & ����">Downloads</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/category/code-snippets" title="����Ƭ�� & С����"> Code Snippets</a> ,
	<a class="tooltip" href="http://cssrainbow.cn/toy-bricks" title="[��ľ] ��׼����Ŀ"> Toy Bricks</a>
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
#T=������걳��ͼ�ƶ�
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
				bw:opt.bw || 0,	//�������
				bh:opt.bh || 0,
				iw:opt.iw || 0,	//ͼ����
				ih:opt.ih || 0,
				X:opt.X || 0,	//����clientX����
				Y:opt.Y || 0
			};o=this.opt;
			if(!i || !o.iw || !o.ih || !o.bw || !o.bh){return false;}

			o.iw=o.iw-o.bw;		//ͼ��ʵ�ʿɱ��ƶ���x�᷶Χ
			o.ih=o.ih-o.bh;

			var P=i.getStyle('background-position');P=P.split(" ");//ȡ��Ŀǰ����ͼ��positionֵ,�����תΪInt��
			P[0]=P[0].toInt();P[0]=(P[0].abs()>o.iw)?((P[0]<0)?-o.iw:o.iw):P[0];//����ͼĿǰ��Xƫ��,����ֵ����2������
			P[1]=P[1].toInt();P[1]=(P[1].abs()>o.ih)?((P[1]<0)?-o.ih:o.ih):P[1];

			console.log(o.X+'|'+o.Y);
			if(o.X>this.$L){//���������ͼƬ������
				this.$L=o.X;
				P[0]=(o.iw<(P[0]-10))?o.iw:(P[0]-10);
			}
			if(o.X<this.$L){//���������ͼƬ������
				this.$L=o.X;
				P[0]=((P[0]+10)>0)?0:(P[0]+10);
			}
			if(o.Y>this.$T){//���������ͼƬ������
				this.$T=o.Y;
				P[1]=(o.ih<(P[1]-10))?o.ih:(P[1]-10);
			}
			if(o.Y<this.$T){//���������ͼƬ������
				this.$T=o.Y;
				P[1]=((P[1]+10)>0)?0:(P[1]+10);
			}
			i.setStyle('background-position',''+P[0]+'px '+P[1]+'px');//���¸�����ͼ��position��ֵ
		}
	});

	El=$('bsfdimg');
	var MoveBKimg=new MoveBKimg();
	El.addEvent('mousemove',function(event){
		MoveBKimg.Todo(El,{bw:260,bh:200,iw:392,ih:600,X:event.client.x,Y:event.client.y});
	})
#T= 
 
#T=��չ����
��չ����
#T=����������������������
����������������������
#T=��չ��$
	$.extend({
		aa:function(){
			alert('ff');
		}
	});$.aa();
#T=��չ��Element
	Element.implement({
		aa:function(){
			alert('ff');
		},
		getFirst:function(expression){
			return document.id(Slick.search(this, injectCombinator(expression, '>'))[0]);
		}
	});
#T=��չ��Array
	Array.implement({
		aa:function(){
			alert('ff');
		}
	});[1].aa();
#T=��չ��String
	String.implement({
		aa:function(){
			alert('ff');
		}
	});'a'.aa();
#T=��չ��Number
	Number.implement({
		aa:function(){
			alert('ff');
		}
	});(12).aa();
#T=��ָ��Function��չ�·���������
	var arr=[];
	var Fun=function(){
		arr=[1,2];
	};
	Fun.extend({
		len:function(){//��Fun��չ����
			return arr.length;
		},
		add:function(val){//��Fun��չ����
			arr.push(val);
		}
	});

	var a=Fun.len(arr);
	alert(a+'|'+arr);//��ʱ���:0|

	Fun();//���ô˺�����arr��ֵ

	var a=Fun.len();
	alert(a+'|'+arr);//��ʱ���:2|1,2

	Fun.add('�µ�');

	var a=Fun.len();
	alert(a+'|'+arr);//��ʱ���:3|1,2,�µ�

	Fun.add(['a','b','c']);

	var a=Fun.len();
	alert(a+'|'+arr);//��ʱ���:4|1,2,�µ�,a,b,c
#T=��չ��Function
	//��չ�µ�Function
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
#T=��չ��Object
	var O={a:0,b:1};
	Object.extend({
		aa:function(O){
			alert(O.b+'a');
		}
	});Object.aa(O);
#T=��չ��Window
	Window.implement({
		aa: function(){
			alert('f');
		}
	});window.aa();
#T=��չ��Document
	Document.implement({
		aa: function(){
			alert('f');
		}
	});document.aa();
#T=��չ��DOMEvent
	DOMEvent.implement({
		aa:function(){
			alert('f');
		}
	});
	window.addEvent('click',function(e){
	e.aa();
	});
#T=��չ��Class
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
#T=��չ��
	.implement({
		aa:function(){
			alert('ff');
		}
	});
#T=������չ����
	[Element,Window,Document].invoke('implement',{
		typ:function(o){
			alert(typeOf(o));
		}
	});
	document.getElement('body').typ('str');
	var J={"_5":"ͣ","_4":"W\\i","_3":"��\/��"};
	window.typ(J);
#T= 
 
#T=����������������������
����������������������
#T=�Զ��¼�
	MooTools �������֮һ���ǿ������ɵ���չ,����Ҳ���Դ����Լ����Զ����¼�����ֻ��Ҫ�� Element.Events ������չ��Ӧ�����ԾͿ����Զ����¼���

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

	eventname: �����Զ����¼�������
	�Զ���һ���¼�ʱ, Element.Events.eventname�пɰ�����������:
		base �C (string, ��ѡ) �Զ����¼��������Ļ����¼�. ���ָ��������condition����,�򱾲���������д
		condition �C (function, ��ѡ) �Զ����¼��������������� (�����Ĳ���Ϊһ��Eventʵ��)
		onAdd �C (function, ��ѡ) ��Ԫ������Զ����¼�ʱ�����ĺ��� (�����Ĳ���Ϊһ��Eventʵ��)
		onRemove �C (function, ��ѡ) ��Ԫ��ɾ���Զ����¼�ʱ�����ĺ��� (�����Ĳ���Ϊһ��Eventʵ��)

	����һ���Զ�����¼�
	MooTools custom event "outerClick".
	Element.Events.outerClick={
		base:'click',
		/*event.stopPropagation()�÷�����ֹͣ�¼��Ĵ���,��ֹ�������ɵ�����Document�ڵ�
		���¼��������κν׶ζ����Ե�����
		ע��,��Ȼ�÷���������ֹͬһ��Document�ڵ��ϵ������¼����������,
		������������ֹ���¼����ɵ������ڵ�
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
#T=�ڴ潨��
	//����ʹ���±ߵ�д������հ�
	function fun(element){
		element.attachEvent("onmouseover",mouse);
	}
	function mouse(){}

	//����ѭ������й¶�ڴ�
	window.onload=function outerFunction(){
		var obj=document.getElementById("i7");
		obj.onclick=function(){
			alert("Hi! I have avoided the leak");
		};
		obj.bigString=new Array(1000).join(new Array(2000).join("XXXXX"));
		obj=null;//����ѭ������,��ֹ���
	};

	//ͨ����һ���հ���ֹ���
	window.onload=function outerFunction(){
		var anotherObj=function innerFunction(){
			alert("Hi! I have avoided the leak");
		};
		(function ddf(){
			var obj=document.getElementById("i7");
			obj.onclick=anotherObj;
		})();
	};

	//�����һ������������հ���ֹй©
	window.onload=function(){
		var obj=document.getElementById("element");
		obj.onclick=doesNotLeak;
	}
	function doesNotLeak(){
		alert("Hi! I have avoided the leak");
	}

	��Ϊһ����վ����WEBǰ�˹���ʦ,���Լ���������վ��ĿӦ�þ����ܵض������ܽ����Ż�,���ڻ�����������������վ�����Ż����Ƿ���ת���� Yahoo14����34��Yahoo���Ż������ע�ڴ�ķ���,����,W3C GroupΪ��ҳ���WEBǰ�˿����������Ż�����֮JavaScript���Ż�ϸ�ڣ�
	һ��������ֽű�ʧ��

	����ʲô�ű�,���κ�ʱ�䡢�κ��������ִ��,����Ӧ�ó���100�������ʵ��ִ�е�ʱ�䳤���������,һ��Ҫ�����̷ֽ�����ɸ�С�Ĵ����

	�ű�ʧ�ػ������������ĸ������ԭ��

	1. ��ѭ����ִ����̫��Ĳ���

	  ����������ľ��Ͼ�������������������������ÿ��ѭ����
	  1. ���ѭ������Ҫͬ��ִ��ô��
	  2. ѭ�����������,����Ҫ��˳��ִ��ô��

	  ���1��2�����Է�,��ô����ʹ��setTimeout��ʽ��ѭ�����зֳ�С������첽����

	  ��ѭ���еĶ����������ʼ�������ŵ�ѭ����μ���http://www.w3cgroup.com/article.asp?id=111

	2. ӷ�׵ĺ�����

	  ��JavaScript��,����Ӧ�þ����ܵ��þֲ�����������ȫ�ֱ���!

	  ���JavaScript���������μ���http://www.jslab.org.cn/?tag=ScopeChainAndClosure

	  ���ԭ�����μ���http://www.jslab.org.cn/?tag=prototypeChain

	3. ����ĵݹ�

	  ʹ�õ�����ʽ����ݹ�,����memoization�����Ż��ݹ�

	  쳲��������еĵݹ��㷨�Ż�,�μ���http://www.jslab.org.cn/?tag=Memoization

	4. �����DOM����

	  ��Web������,JavaScript��һ������Ҫ�����þ��Ƕ�DOM���в�������֪��ô����DOM�Ĳ����Ƿǳ������,��Ϊ��ᵼ�������ִ�л�����reflow��������ִ���˹���Ļ�������,��ͻᷢ���Լ�����վ���Խ��Խ��������Ӧ�þ����ܵļ���DOM����

	  ����������Ҫ�ᷢ���ڼ�������£�

	  * �ı䴰���С
	  * ��������
	  * ����Ƴ�stylesheet��
	  * ���ݸı��������������������
	  * CSS���౻������:hover
	  * ����Ԫ�ص�className
	  * ����DOM�ڵ�ִ����������ɾ�����������ݸ���ʱ
	  * ��̬����һ��style��ʽʱ������element.style.width="10px"��
	  * ����ȡһ�����뾭������ĳߴ�ֵʱ,�������offsetWidth��clientHeight����������Ҫ���������CSSֵ���ڼ���DOM���������,����ͨ��getComputedStyle������ȡ����IE��,����ͨ��currentStyle���Ի�ȡ��


	  �������Ĺؼ�,��������ͨ��DOM���������������Ĵ���:
		  1.�ڶԵ�ǰDOM���в���֮ǰ,�����ܶ����һЩ׼������,��֤N�δ���,1��д��

	  2.�ڶ�DOM����֮ǰ,��Ҫ������Ԫ��,�ȴӵ�ǰDOM�ṹ��ɾ����
	  1. ͨ��removeChild()����replaceChild()ʵ�����������ϵ�ɾ��
	  2. ���ø�Ԫ�ص�display��ʽΪ"none"
	  �޸Ĳ�����ɺ�,������������̷�ת����,����ʹ�õ�2�ַ�ʽ

	  3.CSS����
	  ����һ������������������������ͨ��style���Զ�Ԫ�ص���۽����޸�,��element.style.backgroundColor="blue";
	  ÿ���޸�Ԫ�ص�style����,���϶��ᴥ����������,Ҫ������������ԣ�
	  1.ʹ�ø���className�ķ�ʽ�滻style.xxx=xxx�ķ�ʽ
	  2.ʹ��style.cssText='';һ��д����ʽ
	  3. �������ù����������ʽ
	  4. ��ӵĽṹ��Ԫ�ؾ����������ǵ�λ��Ϊfixed��absolute
	  5. ����ʹ�ñ��������
	  6. ������CSS��ʹ��JavaScript expressions(IE only)

	  4.����ȡ��DOM���ݻ����������ַ���,�Ի�ȡ��Щ�ᴥ���������������ԣ�����offsetWidth�ȣ���Ϊ��Ҫ

	  5.����HTMLCollection������в���ʱ,Ӧ�ý����ʵĴ��������ܵĽ������,��򵥵�,����Խ�length���Ի�����һ�����ر�����,�������ܴ���ȵ����ѭ����Ч��

	����������ַ����������������,�� �ַ���.length,����ת��Ϊnew String(�ַ���)���ٽ��в���

	���������ַ������滻�Ȳ���ʱ����������ʽ

	��������ECMAScript������ʽ�μ���http://www.w3cgroup.com/article.asp?id=202

	�ġ��������,������������ȼ�ʵ��if else���ʽ,ʹ����Ԫ���ʽ,ʹ���������ʽ�������,����ʧ����ɶ��ԣ�


	������������ȼ�ʵ��if else���ʽ�μ���http://www.w3cgroup.com/article.asp?id=131

	�塢��CSS,JS�ļ��ϲ���һ���ļ�����BT�����߻��ǲ�Ҫ����^_^��

	�μ���http://www.w3cgroup.com/article.asp?id=29

	��������Javascript�¼��󶨳����ڴ�й©

	"These memory leaks often occur as a result of circular references between JavaScript objects and objects within IE's DOM (document object model)." Microsoft GPDE Team Blog

	�μ���http://www.w3cgroup.com/article.asp?id=207

	�ߡ�ʹ��WEB Workers������֧��html5���������

	Web WorkersΪJavaScript�ṩ��һ�����ں�̨���������еķ���,Web Workers�����ܹ��ڲ�Ӱ���û����������´�������

	�μ���http://www.w3cgroup.com/article.asp?id=242

	�ˡ�Y!14����14 Rules for Faster-Loading Web Sites��

	  * Rule 1 - Make Fewer HTTP Requests
	  * Rule 2 - Use a Content Delivery Network (Server��)
	  * Rule 3 - Add an Expires Header (Server��)
	  * Rule 4 - Gzip Components (Server��)
	  * Rule 5 - Put Stylesheets at the Top
	  * Rule 6 - Put Scripts at the Bottom
	  * Rule 7 - Avoid CSS Expressions
	  * Rule 8 - Make JavaScript and CSS External
	  * Rule 9 - Reduce DNS Lookups (Server��)
	  * Rule 10 - Minify JavaScript
	  * Rule 11 - Avoid Redirects (Server��)
	  * Rule 12 - Remove Duplicate Scripts
	  * Rule 13 - Configure ETags (Server��)
	  * Rule 14 - Make AJAX Cacheable
	  * Rule 15 - Use Iframes Wisely

	�μ���http://www.w3cgroup.com/article.asp?id=97

	�š�΢�����ڵ�DHTML�Ż�����
	ʹ������push����ַ����ۼ�
#T=�������
	//����һ������
	var tweenHighlight=function(event){
		event.target.highlight('#eaea16');//event.target:�|�l�¼���Ŀ��
	}

	//����@����������һ���¼���event���e�汻�{�õ�
	//�@�����������Ԅӂ���event����
	//Ȼ����Ϳ���ͨ�^.target�������@��Ԫ�أ�event��Ŀ��Ԫ�أ�
	var tweenHighlightChange=function(item){
		item.target.highlight('#eaea16','#ff0000');
	}

	window.addEvent('domready',function(){
		$('Content').addEvent('mouseover',tweenHighlight);
		$('Content').addEvent('click',tweenHighlightChange);
	});
	//OR
	var textDefaults=new Class({
		Implements:[Options,Events],//ʵ��
		options:{//ѡ�����
			$Sel:false,
			class:""
		},
		initialize:function(options){//��ʼ�����캯��
			this.setOptions(options);//����ѡ��
			this.init(this.options.$Sel);//����fun
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
#T=��չ����show()
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
#T=��ipod���ų�����
	if(!/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)){
		window.addEvent("domready",Slimbox.scanPage);
	}
#T=ѡ��display:none�Ľڵ�
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
#T=��������
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
	<h3>MooTools�ٷ�Demo - Chaining</h3>
	<p>Click <a id="start" href="#" name="start">start</a> to see a sequence of effects controlled by chain</p>
	<strong>Log:</strong><br />
	<p id="log">waiting for start click</p>
	<div id="box"></div>
	<h3>MooTols�ٷ����Chain.Waitʾ��</h3>
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
				log.set('html', '��һ������ (1/5)');
				this.start({
					'opacity': .3
				});
			}).chain(function(){
				log.set('html', '�ڶ�������(2/5).<br />Waiting 5 seconds before starting third.');
				this.start.delay(5000, this, {
					'opacity': 1
				});
			})
			.chain(function(){
				log.set('html', '����������(3/5).<br />Waiting 2 seconds before starting fourth.');
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
#T=Web��Firebug
<script type="text/javascript" src="https://getfirebug.com/firebug-lite-debug.js"></script>
#T=һ���ܺõ�ʵ��JS�����ռ�Ĺ���
    /** 
     * SPORE core v1.1 
     * @fileoverview ʵ��JS�����ռ�Ĺ���ģ��Ķ��壬���Զ���������ģ��Ľű��ļ��� 
     * @author Esoul | pillar0514@gmail.com 
     */ 
    (function(){ 
         
        var undefined,          //��ֹȫ����Ⱦ 
            that = {},          //��ǰ�����ռ� 
            jsParent = null,    //���ڲ���script�ڵ�ĸ��ڵ㡣 
            doc = document,     //���������ٶȸ��� 
            JSManager = {},     //Ҫ��¶����JS������ 
            RequireCache = [],  //ģ�������б��� 
            ExecuteQueue = [],  //ģ��ִ�ж��� 
            RequireList = [],   //��ģ�������б� 
            ModuleCache = {},   //ģ�黺�� 
            JSRequested = {},   //���������JSģ�� 
            RequireTree = {},   //ģ���������� 
            Traversed = {},     //�������� 
            ModuleLoaded = [],  //�Ѿ����ص�ģ��������б����ڵ��ԣ� 
            RequireHash = {};   //ģ�������б��λ������ 
     
        /** 
         * @method each ����һ������ 
         * @param {Object} obj �ɱ����Ķ��� 
         * @param {Function} fn Ҫ�����ĺ��� 
         * @param {Object} bind ��������Ҫ�󶨵Ķ��� 
         */ 
        function $each(obj, fn, bind){ 
            for(var key in obj){ 
                if(obj.hasOwnProperty(key)){ 
                    fn.call(bind, obj[key], key, obj); 
                } 
            } 
        } 
     
        /** 
         * @method loadjs ����һ��JS�ļ� 
         * @param {String} strsrc JS�ļ��ĵ�ַ 
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
         * @method loadModule ����һ��ģ�� 
         * @param {String} mName ģ������� 
         */ 
        function loadModule(mName){ 
            loadjs( (JSManager.$basepath || '') + mName.split('.').join('/') + '.js?version=' + JSManager.$version ); 
        } 
     
        /** 
         * @method setModuleCache ����ģ����سɹ� 
         * @param {String} mName ģ������� 
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
         * @method traverse ��ȱ���ģ�����ö����������ģ����سɹ� 
         * @param {String} name �ڵ����� 
         */ 
        function traverse(name){ 
            if(!name || Traversed[name]){return;}   //ȷ��ÿ���ڵ�ֻ�ܷ���һ�Σ�����ѭ��������ɵ������� 
            Traversed[name] = true;                 //��ʵ��һ����ʼ��ģ�飬�ض�ֻ��������һ�� 
            $each(RequireTree[name],traverse); 
            setModuleReady(name); 
        } 
     
        /** 
         * @method checkReady ��������б��е�ģ���ļ��Ƿ��Ѿ����� 
         * @desc ����������ˣ��Ϳ�ʼ���б������ٶ������е�ÿ��ģ�鶼�Ƕ��ڵ㣬���ж������ȱ������� 
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
         * @method checkDepend ���ģ�������ļ��Ƿ������� 
         * @param {String} mName ģ������ 
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
         * @method register ע��һ��ģ�� 
         * @param {String} mName ģ������� 
         * @param {Function} maker ģ�鹹�캯�� 
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
         * @method $Import ���أ����룩һ��ģ�� 
         * @param {String} name ģ������� 
         */ 
        function $Import(name){ 
            RequireCache.push(name); 
        } 
     
    //--------------------------- 
        //������������ 
        var spaceName = 'SPORE';                //���嶥�������ռ������ 
        var managerName = '$JSManager';         //Ҫ��¶��ȥ��JS������������ 
        var regName = 'register';               //Ҫ��¶��ȥ��ע��������������� 
        var impName = '$Import';                //Ҫ��¶��ȥ������������������� 
        JSManager.$basepath = 'js/';            //JS�����ڵ�����·�� 
        JSManager.$charset = 'utf-8';           //JS�ļ��ı���    
        JSManager.$version = new Date() - 0;    //JS�汾�� 
    //--------------------------- 
     
        //�������� 
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
    ����Ĵ���ʵ���������ռ������ļ��Զ������� 
    ʹ�÷����� 
    1���޸Ĵ���������Ϣ��ȷ�� 
        - JS�������������Ϊ�ĸ�JS����չ�˹��ܣ�����ΪjQuery��չ�ù��ܣ��� 
        - JS�ļ��ı��루charset�� 
        - JS�����ڵķ����·�� 
        - JS��İ汾�ţ�Ĭ��Ϊ��ǰ�ͻ���ʱ��תΪ�����֣�������ص�JS�����棩�� 
    2����ҳ�����������JS�� 
    3����JS�����ڵ��ļ��������չJS�ļ����ļ��ṹ���������� 
    //��Ķ���λ��spore.js 
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
        -arrΪһ���ļ��У���''arr''�������������� 
    4��JS�ļ������ʽ���� 
    */ 
     
    //--------------------------------------------------------- 
    //obj/merge.js: 
    //�����ռ乹�캯�� 
    SPORE.register('obj.merge',function($){ 
        return function(obj1,obj2){ //���صĺ�������������SPORE.obj.merge���DOMλ�á� 
        //���ܴ��� 
        } 
    }); 
    //--------------------------------------------------------- 
    //jobs/loadpage.js: 
    //�����б� 
    SPORE.$Import('obj.merge'); //����Ϊ�����ռ������ 
    SPORE.$Import('arr.each'); 
     
    //�����ռ乹�캯�� 
    SPORE.register('jobs.loadpage',function($){ //��Ԫ����Ϊ��SPORE������ 
        var that = {}; 
        var obj = $.obj.merge({a:1},{b:2}); //Ҫʹ���������������ȷ�������б��д������ô��루SPORE.$Import('obj.merge');�� 
        //... ҵ���߼� 
        return that;    //������������������ļ�������ִ�У�����ֵ����������SPORE.jobs.loadpage���DOMλ�á� 
    }); 
    //--------------------------------------------------------- 
#T=����֪����30��CSSѡ����
	��Ҳ���Ѿ�������id��class����̨ѡ������Щ������cssѡ����������ԶԶ����css��ȫ������������ϵͳ�Ľ���css��30����õ�ѡ����������������ͷʹ����������������⡣���������ǣ�������������css�ľ޴�����ԡ�
	1. *
	* {margin: 0; padding: 0;}
	��״ѡ�������ҳ���ϵ�ÿһ��Ԫ���������á�web����߾���������ҳ��������Ԫ�ص�margin��padding����Ϊ0��
	*ѡ���Ҳ��������ѡ������ʹ�á�
		#container * { border: 1px solid black;}
	����Ĵ����л�Ӧ����idΪcontainerԪ�ص�������Ԫ���С�
	���Ǳ�Ҫ���Ҳ�������ҳ���й��ĵ�ʹ����״ѡ�������Ϊ����������̫���൱���������Դ��
	�����������IE6+��Firefox��Chrome��Safari��Opera
	2. #X
	#container {width: 960px;margin: auto; }
	��������������Ӧid��Ԫ�ء�id��������õ�cssѡ����֮һ��idѡ�����������Ǿ�׼�������ȼ������ȼ�����Ϊ100��Զ����class��10������Ϊjavascript�ű����ӵĲ���ѡ��ͬ��ȱ��Ҳ���������ȼ����ߣ������Բ������ʹ��idѡ����ǰ��������������Լ�����ĵ��˷���idѡ�����ĵز���
	�����������IE6+��Firefox��Chrome��Safari��Opera
	3. .X
	.error {color: red;}
	����һ��class(��)ѡ������classѡ������idѡ�����Ĳ�ͬ��classѡ������������������ʽ����һ��Ԫ�ء�
	�����������IE6+��Firefox��Chrome��Safari��Opera
	4. X Y
	li a { text-decoration: none;}
	��Ҳ��������õ�һ��ѡ�����������ѡ����������ѡȡXԪ������Ԫ��Y��Ҫ����ĵ��ǣ����ַ�ʽ��ѡ������ѡȡ��������ƥ�����Ԫ�أ����Ӳ㼶�������е�����ǲ���ʹ�õģ����������Ĵ���ȥ��li�µ�����a���»��ߣ���li���滹�и�ul���Ҳ�ϣ��ul�µ�li��aȥ���»��ߡ�ʹ�ô˺��ѡ������ʱ��Ҫ�����Ƿ�ϣ��ĳ��ʽ����������Ԫ�ض������á����ֺ��ѡ�������и����ã����Ǵ������������ռ�����á���������������ʽ������������Ϊli��
	�����������IE6+��Firefox��Chrome��Safari��Opera
	5. X
	a { color: red; }  
	ul { margin-left: 0; }
	��ǩѡ������ʹ�ñ�ǩѡ����������������Χ�ڵ����ж�Ӧ��ǩ�����ȼ�������*�ߡ�
	�����������IE6+��Firefox��Chrome��Safari��Opera
	6. X:visited��X:link
	a:link { color: red; }   
	a:visted { color: purple; }
	ʹ��:linkα��������δ����������ӱ�ǩ��:hoverα�������ڵ���������ӡ�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	7. X+Y
	ul + p {color: red;}
	����ѡ���������������оͻ�ƥ����ul����ĵ�һ��p���������ڵ�������ɫ����Ϊ��ɫ��(ֻƥ���һ��Ԫ��)
	�����������IE7+��Firefox��Chrome��Safari��Opera
	8. X>Y
	div#container > ul { border: 1px solid black;}
	<div id=��container��>
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
	��ѡ����������ѡ����X Y��ͬ���ǣ���ѡ����ֻ��X�µ�ֱ���Ӽ�Y�����á��������css��html�����У�div#container>ul����container�����һ����ul�����á�������������X > Y��ֵ���ᳫѡ��������ϧIE6��֧�֡�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	9. X ~ Y
	ul ~ p { color: red;}
	����ѡ��������ǰ���ᵽ��X+Y��ͬ���ǣ�X~Yƥ����X��ͬ���������YԪ�أ���X+Yֻƥ���һ����
	�����������IE7+��Firefox��Chrome��Safari��Opera
	10. X[title]
	a[title] { color: green;}
	����ѡ������������������ƥ����Ǵ���title���Ե�����Ԫ�ء�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	11. X[title="foo"]
	a[href="http://blog.moocss.com"] { color: #1f6053; }
	����ѡ������ ����Ĵ���ƥ������ӵ��href���ԣ���hrefΪhttp://blog.moocss.com���������ӡ�
	������ܺܺã����Ƕ�������Щ���ޡ��������ϣ��ƥ��href����css9.net���������Ӹ���ô���أ�����һ��ѡ������
	�����������IE7+��Firefox��Chrome��Safari��Opera
	12. X[href*="moocss"]
	a[href*="moocss"] {color: #1f6053;}
	����ѡ����������������Ҫ�ģ��������ƥ�����href�а�����http://blog.moocss.com�����������ӡ�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	13. X[href^="http"]
	a[href^="http"] {background: url(path/to/external/icon.png) no-repeat; padding-left: 10px;}
	����ѡ�������������ƥ�����href��������http��ͷ�����ӡ�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	14. X[href$=".jpg"]
	a[href^="http"] { background: url(path/to/external/icon.png) no-repeat;padding-left: 10px;}
	����ѡ������������ѡ������ʹ��$������ƥ���βΪ�ض��ַ�����Ԫ�ء������������ƥ������������ӵ���չ��Ϊ.jpgͼƬ�����ӡ���ע�⣬���������.jpgͼƬ�����Ҫ����������ͼƬ���Ӹ���ô���أ�����һ��ѡ��������
	�����������IE7+��Firefox��Chrome��Safari��Opera
	15. X[data-*="foo"]
	����һ��ѡ�������ᵽ���ƥ������ͼƬ���ӡ����ʹ��X[href$=".jpg"]ʵ�֣���Ҫ��������
	a[href$=".jpg"],
	a[href$=".jpeg"],
	a[href$=".png"],
	a[href$=".gif"] {
		color: red;
	}
	����ȥ�Ƚ��鷳����һ������취��Ϊ���е�ͼƬ���Ӽ�һ���ض������ԣ����确data-file��
	html����
	ͼƬ����
	css�������£�
	a[data-filetype="image"] {
		color: red;
	}
	�����������ӵ�ͼƬ������������ɫΪ��ɫ��
	�����������IE7+��Firefox��Chrome��Safari��Opera
	16. X[foo~="bar"]
	����ѡ����������ѡ�����еĲ����߷��ſ���������ƥ������ֵ���ÿո�ָ��Ķ��ֵ�е�һ�������������ӣ�
	html����
	<a href=��path/to/image.jpg�� data-info=��external image��> Click Me, Fool </a>
	css����
	a[data-info~="external"] {
		color: red;
	}
	a[data-info~="image"] {
		border: 1px solid black;
	}
	�����������У�ƥ��data-info�����а�����external�����ӵ�������ɫΪ��ɫ��ƥ��data-info�����а�����image�����������ú�ɫ�߿�
	�����������IE7+��Firefox��Chrome��Safari��Opera
	17. X:checked
	checkedα������ƥ�䴦��ѡ��״̬�Ľ���Ԫ�أ���radio��checkbox��
	input[type=radio]:checked {
		border: 1px solid black;
	}
	���������ƥ��������д���ѡ��״̬�ĵ�ѡradio������1px�ĺ�ɫ�߿�
	�����������IE9+��Firefox��Chrome��Safari��Opera
	18. X:after��X:before
	������α����content���������Ԫ�ص�ǰ����ߺ���׷�����ݣ���һ���򵥵����ӣ�
	h1:after {content:url(/i/logo.gif)}
	����Ĵ���ʵ������h1����ĺ�����ʾһ��ͼƬ��
	����Ҳ����������ʵ�����������д�����£�
	.clearfix:after {
		content: ����;
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
	:hoverα���趨����껮��ʱԪ�ص���ʽ������������趨��div����ʱ�ı���ɫ��
	��Ҫע����ǣ���ie 6�У�:hoverֻ����������Ԫ�ء�
	�������һ�����飬���趨���ӻ���ʱ�����»���ʱ��ʹ��border-bottom���text-decoration�Եø�Ư��Щ���������£�
	a:hover {
		border-bottom: 1px solid black;
	}
	�����������IE6+��Firefox��Chrome��Safari��Opera
	20. X:not(selector)
	div:not(#container) {
		color: blue;
	}
	��α��ѡ����������ƥ��Ԫ��ʱ�ų�ĳЩԪ�ء�������������У��趨����idΪcontainer��divԪ��������ɫΪblue��
	�����������IE9+��Firefox��Chrome��Safari��Opera
	21. X::pseudoElement
	::α�������ڸ�Ԫ��Ƭ�������ʽ������һ������ĵ�һ����ĸ���ߵ�һ�С���Ҫע����ǣ����::α����ֻ�����ڿ�״Ԫ�ء�
	����Ĵ����趨�˶����е�һ����ĸ����ʽ��
	p::first-letter {
		float: left;
		font-size: 2em;
		font-weight: bold;
		font-family: cursive;
		padding-right: 2px;
	}
	����Ĵ������趨�˶����е�һ�е���ʽ��
	p::first-line {
		font-weight: bold;
		font-size: 1.2em;
	}
	�����������IE6+��Firefox��Chrome��Safari��Opera
	��IE6��Ȼ֧�֣���Щ���Ⱑ����
	22. X:nth-child(n)
	li:nth-child(3) {
		color: red;
	}
	���α�������趨һ������Ԫ�أ�����li��tr���еĵ�n��Ԫ�أ���1��ʼ���𣩵���ʽ�������������У��趨�������б�Ԫ��li��������ɫΪ��ɫ��
	��һ���������÷����������������趨��ż����Ԫ�ص���ʽ������������ʵ�ָ��л�ɫ��
	tr:nth-child(2n) {
		background-color: gray;
	}
	�����������IE9+��Firefox��Chrome��Safari
	23. X:nth-last-child(n)
	li:nth-last-child(2) {
		color: red;
	}
	��X:nth-child(n)�������ƣ���ͬ��������һ�����е����һ��Ԫ�ؿ�ʼ���������������趨�����ڶ����б�Ԫ�ص�������ɫ��
	�����������IE9+��Firefox��Chrome��Safari��Opera
	24. X:nth-of-type(n)
	ul:nth-of-type(3) {
		border: 1px solid black;
	}
	��X:nth-child(n)�������ƣ���ͬ������ƥ��Ĳ���ĳ������Ԫ�أ�����Ԫ�����͡���������Ĵ�������ҳ���г��ֵĵ����������б�ul�ı߿�
	�����������IE9+��Firefox��Chrome��Safari
	25. X:nth-last-of-type(n)
	ul:nth-last-of-type(3) {
		border: 1px solid black;
	}
	��X:nth-of-type(n)�������ƣ���ͬ��������Ԫ�����һ�γ��ֿ�ʼ���������������趨���������������б�ı߿�
	�����������IE9+��Firefox��Chrome��Safari��Opera
	26. X:first-child
	:first-childα������ƥ��һ�����еĵ�һ��Ԫ�ء����Ǿ���������ʵ��һ�����еĵ�һ��Ԫ�ػ����һ��Ԫ�ص��ϣ��£��߿��磺
	ul:nth-last-of-type(3) {
		border: 1px solid black;
	}
	�����������IE7+��Firefox��Chrome��Safari��Opera
	27. X:last-child
	ul > li:last-child {
		border-bottom:none;
	}
	��:first-child���ƣ���ƥ����������е����һ��Ԫ�ء�
	�����������IE9+��Firefox��Chrome��Safari��Opera
	28. X:only-child
	div p:only-child {
		color: red;
	}
	���α���õıȽ��١�������������ƥ�����div�����ҽ���һ����p��Ҳ����˵�����div���ж��p������ƥ�䡣
	<div><p> My paragraph here. </p></div>
	<div>
		<p> Two paragraphs total. </p>
		<p> Two paragraphs total. </p>
	</div>
	����������е�һ��div�еĶ���p���ᱻƥ�䣬���ڶ���div�е�p�򲻻ᡣ
	�����������IE9+��Firefox��Chrome��Safari��Opera
	29. X:only-of-type
	li:only-of-type {
		font-weight: bold;
	}
	���α��ƥ����ǣ������ϼ�������ֻ����һ����Ԫ�أ���û���ھ�Ԫ�ء������������ƥ�����һ���б�����б�Ԫ�ء�
	�����������IE9+��Firefox��Chrome��Safari��Opera
	30. X:first-of-type
	:first-of-typeα����:nth-of-type(1)Ч����ͬ��ƥ����ֵĵ�һ��Ԫ�ء��������������ӣ�
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
	�������html�����У��������ϣ����ƥ��List Item 2�б����������أ�
	����һ��
	ul:first-of-type > li:nth-child(2) {
		font-weight: bold;
	}
	p + ul li:last-child {
		font-weight: bold;
	}
	��������
	ul:first-of-type li:nth-last-child(1) {
		font-weight: bold;
	}
	�����������IE9+��Firefox��Chrome��Safari��Opera��
	�ܽ᣺
	���������ʹ���ϰ汾�����������IE 6����ʹ������cssѡ����ʱһ��Ҫע�����Ƿ���ݡ��������ⲻӦ��Ϊ��ֹ����ѧϰʹ���������ɡ������ʱ������Բο�������������б�Ҳ����ͨ���ű��ֶ����ϰ汾�������Ҳ֧�����ǡ�
#T=Event:constructor
	�﷨:new Event([event[,win]]);

	����:event-(event)HTMLEvent����
	win-(window,��ѡ:Ĭ��Ϊwindow)�¼���������

	����:
	code-(number)�����ļ��̴���
	shift-(boolean)�û��Ƿ���shift��
	control-(boolean)�û��Ƿ���control��
	alt-(boolean)�û��Ƿ���alt��
	meta-(boolean)�û��Ƿ���meta��
	wheel-(number)�����ֵĹ�����
	page.x-(number)����������window��x����
	page.y-(number)����������window��y����
	client.x-(number)����������ҳ����������x����
	client.y-(number)����������ҳ����������y����
	key-(string)����������. ��Ϊ����:'enter','up','down','left','right','space','backspace','delete',�Լ� 'esc'
	target-(element)�¼�Ŀ�����
	relatedTarget-(element)�¼�Ŀ��Ĳ��ն���

	ʾ��:
	$('myLink').addEvent('keydown',function(event){
		//�����event�Ѿ���һ��Event���ʾ��
		alert(event.key);
		alert(event.shift);

		//Ctr+S ��ϼ�
		if(event.key == 's' && event.control){
			alert('Document saved.');
		}
	});

	��ע:
	Ҫ��ȷ��ȡevent.page / event.client,����Ҫҳ��ʹ�ñ�׼ģʽ��DOCTYPE
	ÿ��ʹ��addEvent������ӵ��¼�event�����Զ���ȡ��mootools�ṩ�ķ�����չ,����Ҫ��ȥ�ֹ�����ʵ��
#T=Event.Keys ������Event.Keys����������ļ��̴���/��ӳ��
	ʾ��:
	Event.Keys.shift=16;

	$('myInput').addEvent('keydown',function(event){
		if(event.key == "shift"){
			alert("You pressed shift.");
		}
	});
#T=addEvent ��DOMԪ�����һ���¼�������
	�﷨:myElement.addEvent(type,fn);

	����:type-(string)�������¼�����('click','load',�ȵ�),ע��û��ǰ׺'on'
	fn-(funtion)��������

	����ֵ:(element)����Ԫ��

	ʾ��:
	<div id="myElement">Click me.</div>

	$('myElement').addEvent('click',function(){
		alert('Dom:'+this.id);//�����¼��Ķ���
	});

	��ע:�����ڼ���������ʹ�÷���false���ֶλ��ߵ���Event:stop��ֹͣ�¼�
	��Document��Window��Ҳ���б�����
#T=removeEvent ɾ��ָ�����¼���������
	�﷨:myElement.removeEvent(type,fn);

	����:type-(string)�¼���
	fn-(funtion)Ҫɾ���ĺ���

	����ֵ:(element)����Ԫ��

	ʾ��:����ʹ��:
	//�����һ��������
	var de=function(event){
		alert(event.key);
		alert('code:'+event.code);//�����ļ��̴���
		alert('Dom:'+this.id);//�����¼��Ķ���
		
		$('i7').removeEvent('click',de);//ɾ���¼�
	};
	$('i7').addEvent('click',de);
	//$('i7').removeEvent('click',de);//ɾ���¼�

	��bind���ʹ��:
	var destroy=function(){
		alert('Dom:'+this.id);	//i6

		//ɾ���¼�
		//1.���ｫ����ɾ���κμ�����(��ΪԪ���ϲ����������������)
		$('i7').removeEvent('click',destroy);

		//2.����Ҳ����ɾ���κμ�����(��Ϊ������ʵ������һ���µĺ���,��Ԫ���ϵļ�����������ͬ������)
		$('i7').removeEvent('click',destroy.bind($('anotherElement'));

		//3.������ȷɾ��������
		$('i7').removeEvent('click',boundDestroy);
	}
	var boundDestroy=destroy.bind($('i6'));
	$('i7').addEvent('click',boundDestroy);

	��ע:��ʹ��Function:bind �� Function:pass �ȴ�������ʱ,������һ���µ�����. ���Ҫ��ȷʹ��removeEvent��ɾ��������,����봫��ԭ�ȼ�����������
	��Document��Window��Ҳ���б�����
#T=addEvents ��DOMԪ��һ����Ӷ���¼�������
	�﷨:myElement.addEvents(events);

	����:events-(object)��ֵ�Զ���:��Ϊ�¼���,ֵΪ��������

	����ֵ:(element)����Ԫ��

	ʾ��:
	$('i7').addEvents({
		'mouseover':function(event){
			alert('mouseover page.x:'+event.page.x+' page.y:'+event.page.y+' client.x:'+event.client.x+' client.y:'+event.client.y);
			alert('Dom:'+this.id);//�����¼��Ķ���
		},
		'click':function(event){
			alert('mouseover page.x:'+event.page.x+' page.y:'+event.page.y+' client.x:'+event.client.x+' client.y:'+event.client.y);
			alert('Dom:'+this.id);//�����¼��Ķ���
		}
	});

	��ע:��Document��Window��Ҳ���б�����
#T=removeEvents ɾ��ָ���¼������ϵ����м�������.���δ�����κβ���,��ɾ�����������ϵ����м�������
	�﷨:myElements.removeEvents([type]);

	����:type-(string,��ѡ)�¼���(��:'click'). ���δָ��,��ɾ�������¼�

	����ֵ:(element)����Ԫ��

	ʾ��:
	var _Sel=$('i7');
	_Sel.addEvents({
		'mouseover':function(){
			alert('mouseover');
		},
		'click':function(){
			alert('click');
			_Sel.removeEvents('mouseover');//ɾ��mouseover�¼�
			//_Sel.removeEvents();//ɾ�������¼�
		}
	});

	��ע:��Document��Window��Ҳ���б�����
#T=fireEvent ����Ԫ����ָ�����¼�����
	�﷨:myElement.fireEvent(type[,args[,delay]]);

	����:
	type-(string)�¼���(��:'click')
	args-(mixed,��ѡ)���ݸ����������Ĳ���. ���������������һ,�����ʹ������
	delay-(number,��ѡ)�ӳ�ִ�м��������ĺ�����

	����ֵ:(element)����Ԫ��

	ʾ��:
	//����myElement��click�¼�,����һ���Ӻ�ִ���¼��ļ�������(��ÿ����������anElementԪ����Ϊ����)
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

	��ע:���������ᴥ��DOM������¼�(��Ԫ�ر�ǩ��������ʽ���¼�����:onmousedown="...")
	��Document��Window��Ҳ���б�����
#T=cloneEvents ����Ŀ��Ԫ���ϵ������¼�����Ԫ��
	�﷨:myElement.cloneEvents(from[,type]);

	����:from-(element)Ŀ��Ԫ��
	type-(string,��ѡ)���Ƶ��¼�����. ���Ϊnull��δָ��,�������е��¼�

	����ֵ:(element)����Ԫ��

	ʾ��:
	var myElement=$('myElement');
	var myClone=myElement.clone().cloneEvents(myElement);//����Ԫ�ز����������е��¼�

	��ע:��Document��Window��Ҳ���б�����
#T=Element.Events ���ڴ����Զ�����¼�����
	����:
	�Զ���һ���¼�ʱ,Element.Events.yourproperty�пɰ�����������:
	base-(string,��ѡ)�Զ����¼��������Ļ����¼�. ���ָ��������condition����,�򱾲���������д
	condition-(function,��ѡ)�Զ����¼���������������(�����Ĳ���Ϊһ��Eventʵ��)
	onAdd-(function,��ѡ)��Ԫ������Զ����¼�ʱ�����ĺ���(�����Ĳ���Ϊһ��Eventʵ��)
	onRemove-(function,��ѡ)��Ԫ��ɾ���Զ����¼�ʱ�����ĺ���(�����Ĳ���Ϊһ��Eventʵ��)

	ʾ��:
	//�Զ����¼�shiftclick:��סshift�������е��

	Element.Events.shiftclick={
		base:'click',//���û����¼�Ϊclick
		condition:function(event){//������������¼���������
			return(event.shift == true);//����Ƿ���shift��
		}
	};

	$('myInput').addEvent('shiftclick',function(event){
		log('the user clicked the left mouse button while holding the shift key');
	});

	��ע:
	�����¼��ֲ�ͬ���͵��Զ����¼����:ֻ������base:�������ض��򵽻����¼���ȥ
		������base��condition:�ض��򵽻����¼���ȥ,����condition�������Ƿ񴥷�
		������onAdd��/��onRemove,���Ҷ�����base��condition:�¼����/ɾ��ʱ�ᴥ�������ĺ���

	����:
	�������Զ����¼���ԭ���¼�ͬ��,��ʹ��conditionѡ��(��������㸲��ԭ���¼�).(���ز��Ƽ�:ֻ�е���ȷ�е�����������������ʱʹ��)
#T=mouseenter ���¼���������ָ��Ԫ������ʱ����,���Ҳ�������괩Խ��Ԫ�ص�ʱ���ٴδ���(������mouseover)
	ʾ��:
	$('myElement').addEvent('mouseenter',myFunction);
#T=mouseleave �¼�������뿪ָ��Ԫ������ʱ����,���Ҳ������뿪��Ԫ�ص���Ԫ�ص�ʱ�򴥷�(������mouseout)
	ʾ��:
	$('myElement').addEvent('mouseleave',myFunction);
#T=mousewheel ���¼��������ֹ���ʱ����
	ʾ��:
	$('myElement').addEvent('mousewheel',myFunction);
#T=stop ֹͣ�¼���������ִֹ���¼���Ĭ����Ϊ
	�﷨:myEvent.stop();

	����ֵ:(object)Eventʵ��

	ʾ��:
	<a id="myAnchor" href="http://google.com/">Visit Google.com</a>

	$('myAnchor').addEvent('click',function(event){
		event.stop();//��ֹ���ӵ�Ĭ����Ϊ:�����ӵ�google.com
		this.setText("Where do you think you're going?");

		function(){
			this.setText("Instead visit the Blog.").set('href','http://blog.mootools.net');
		}.delay(500,this);
	});

	��ע:���¼����������з���false�Ļ�,ͬ��Ҳ����ֹͣ�¼�������Ч��
#T=stopPropagation ֹͣ�¼��Ĵ���(ֹͣ�¼���DOM�ṹ�н���ð�ݴ���)
	�﷨:myEvent.stopPropagation();

	����ֵ:(object)Event����

	ʾ��:
	��ʾ����,������myChild�ĸ��������С��myElement��С,�������ڲ��ԺͿ�������.

	<div id="myElement">
		<div id="myChild"></div>
	</div>

	$('myElement').addEvent('click',function(){
		alert('click');
		return false;//��stopPropagation����Ч����ͬ
	});

	$('myChild').addEvent('click',function(event){
		event.stopPropagation();//��ֹ�¼��Ĵ���,����myChild��click�¼�������,myElement��click�¼��Ͳ��ᱻ����
	});
#T=preventDefault ��ִֹ���¼���Ĭ����Ϊ
	�﷨:myEvent.preventDefault();

	����ֵ:(object)Eventʵ��

	ʾ��:
	<form>
		<input id="myCheckbox" type="checkbox" />
	</form>

	$('myCheckbox').addEvent('click',function(event){
		event.preventDefault();//�����,myCheckbox��������"checked"��ѡ��״̬
	});
#T= 




#
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
//console.dir($("#tab2 .tit"));//ݔ���������еČ��Ի򷽷�
//console.assert(typeof $("#tab2 .tit")=='objec');//�yԇ���_ʽ�Ƿ��ʽ,��������]�з���,����������t�����e�`
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
#T=ɾ������
^!=null;
#T=�Ƿ�ΪIE
$.browser.msie
#T=��ֹð��
$(document).click(function(e){
e.stopPropagation()
#T=�ͷ��ڴ�
//��ajaxʱ��ʱ����
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
#T=�ж�ĳԪ���Ƿ�����¼�
var tE = $('#foo').data('events');
if(tE){
	if(tE["click"]){
	}
}
#T=�Զ�����
(function($){
	var aa = "4";
	//ᘌ�������ǰ��֪ID�Č���,�������¼�����
	//�÷�:$("#r").RL('AA');
	$.fn.RL = function(C){
		$(this).focus(function(){});
		C=C+aa;
		abc();
		function abc(){
			alert(C);
		}
		//ȡ�ö�������
		//alert(jQuery(this).attr('id'));
	}
  
	$.fn.RR = function(C){
		alert("123");
	}
	
	//ᘌ���������ǰ��֪ID�Č���,������function
	//�˕r����ֻ�܂�ֵ�õ�,ǰ������ǰ���������¼�,��t�o���@�Ì�����
	//�÷�:$("body").click(function(){$.fun(this,'AA');})��onchange='$.fun(this,"id=2");'
	$.fun = function(O,C){
		_i=O.id;
		abc();
		function abc(){
			alert(C+aa);
			alert(_i);
		}
	}

	//ͬ��,������function
	//�÷�:$("body").click(function(){$.a1(this,'AA');})��onchange='$.a1(this,"id=2");'
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

	//���Ⅲ�����f����
	$.Cimg = function(opt){
		alert(opt.typ);
		opt.ondo();
	}
	$.Cimg({
		'typ':'show',
		'hid':'id1',
		'ondo':function(){alert('��')}
	});
})(jQuery)
#T=���$����
var jq=jQuery.noConflict();
jq(document).ready(function(){
	jq("button").click(function(){
		jq("p").hide();
	});
});
#T=����ִ����֮������������
$("p").hide(1000,function(){
	alert("The paragraph is now hidden");
});
#T= 
 
#T=��ȡid,name��tagname
function _(s){return document.getElementById(s);}
function _n(s){return document.getElementsByName(s);}
function _t(s){return document.getElementsByTagName(s)[0];}
alert(_t('input').value)
#T=attributes����
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
#T=���IE�������ע������
��ʹ��Json�ṹ��ֵ��ʱ�����һ��ǧ���Ӷ���,Ҫ��ȻIE����.
#T=�����ڴ汩��
�Ƚ�JQUERY����ת��ΪDOM���� ����DOMԭ������ʹ�ü���

JQUERY Object -> DOM Object
��:$('')[0]

html()
$('')[0].innerHTML='';

�ĵ�����
append()
var child= document.createElement("...");
$('')[0].appendChild(child);

remove();
$('')[0].innerHTML="";
#T= 
 
#T=��дjquery��$Ϊֻ���id
function $(id){
	return document.getElementById(id);
}
#T=�󶨶����¼�
$('#id').bind("click mouseover",func)
//�����¼��м��пո� ��funcΪ����������
$('#id').one("click mouseover",function(){})
#T=����܇�|�l�¼�
$('#test-address').keypress(function(e){
	if (e.keyCode == 13){$('#test-ok').click();}
});
#T=ȡ���Ŀ����ֵ
$('div',$('#t')).each(function(i){
	var $this=$(this);
	$this.click(function(){
		alert(i);//����ֵ
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
#T=�ӿ���ڲ�������������
window.parent.document.getElementById('fram1').setAttribute('cols','240,*');
#T= 
 
#T=�{���Զ��x����
$('#c1').click(drop);
function drop(){
	alert('�҈@�h');
}
#T=�x�������� $(this).selector
$(this).selector
#T=parent() - children() - find()
<div><img src="6.jpg"><span id="g"><b>b</b></span></div>

//������find���children,���childrenֻ����ֱ�ٵ�һ��,�����]�����µ����,��find�ɿ��]����
//b=$('#g').parent().find('b').text();
//img=$('#g').parent().children('img').attr('src');
#T= 
 
#T=��ֹѡ������
$(document).bind('selectstart',function(){return false;});
#T=����܇�|�l�¼�
$('#test-address').keypress(function(e){
	if(e.keyCode == 13){$('#test-ok').click();}
});
$(document).keypress(function(e){
	if(e.which == 97){
		alert("hello world!");
	}
})
#T=�����ڳߴ�ı��|�l�¼�
$(window).resize(function(){});
#T=����հ����򴥷��¼�
$(document,window).click(function(){$.pop();});
#T=��js�����js
(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
#T=jquery�ٴ��d��
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript"> 
!window.jQuery && document.write('<script src="http://code.jquery.com/jquery-1.4.2.min.js"><\/script>');
</script>
#T=���Ծ�݋��div
<div contentEditable="true">abc</div>
#T= 
 
#T=�Д�IE�汾
if($.browser.msie && $.browser.version.split('.')[0]<'8'){}
#T=�жϱ����Ƿ����
if(!address || !address.length){}
#T=�Д������Ƿ����
if(!document.getElementById(''+_o.hid+'')){alert('���󲻴���,�����ǅ����O�����`,Ո�z��hid�ą���ֵ!');return;}
if($(selector)[0]){...}
// ��������
if($(selector).length){...}
if($('#shopping_cart_items input.in_stock')[0]){<statement>}
#T=�ж������ĳ�ʼֵ
 onfocus="if(this.value==this.defaultValue) this.value='';"
#T=�Д��Ƿ�Ϊ�������
if (document.location.protocol == 'file:') {
	alert("The examples might not work properly on the local file system due to security settings in your browser. Please use a real webserver.");
}
#T=�жϱ����Ƿ�Ϊ����
if (typeof(complete) != 'object'){complete = $(complete);}
#T=�D�g .:[]�@�Ă���̖��Ҫ��\\�D�g
ȡ�ö��� .:[]�@�Ă���̖��Ҫ��\\�D�g
#T=----------------------
----------------------
#T=��Google Code����jQuery
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
#T=�Ѵ����ݰ󶨸�DOM,DOMɾ��,�ڴ��ɾ��
<div class="ex" />
ajax({sucess:function(data){
  $('.ex')[0]=data
}})
#T=jQuery������dom�����ת��
$(document.getElementById("msg"))
��ͨ��dom����һ�����ͨ��$()ת����jquery����
����jquery��������һ�����ϡ��������jquery����Ҫת��Ϊdom���������ȡ�����е�ĳһ�һ���ͨ������ȡ����
�磺
    $("#msg")[0]��$("div").eq(1)[0]��$("div").get()[1]  
    $("td")[5]
��Щ����dom���󣬿���ʹ��dom�еķ�������������ʹ��Jquery�ķ�����
���¼���д��������ȷ�ģ�
    $("#msg").html();  
    $("#msg")[0].innerHTML;  
    $("#msg").eq(0)[0].innerHTML;  
    $("#msg").get(0).innerHTML;
#T=ͨ��������С��ѡ�����
var $id=$('#id');
#T=��С��DOM����
DOM�Ĳ����������.append(),.prepend(),.after(),.wrap()�����൱��ʱ��,ʹ���ַ���ƴ��������һ��list���һ���������б��������Щ��
#T=������ʹ��ID������class�����Ǵ�IDѡ������ʼ��Ѱ
var $id=$('.button',$('#id'));//var $id=$("#id .button");
#T=��ѡ�����ṩ������
var $id=$('#id',$('body'));
#T=��classǰʹ��tag(��ǩ��)
var $id=$('input.button',$('#id'));//var $id=$("#id input.button");
#T=��jQueryѡ�������󻺴�����
var $id=$('.button',$('#id'));//var $id=$("#id .button");
#T=���$(this)��д��
var $this = $(e.target);
#T=��$(document).ready�Ƴٵ�$(window).load
��$(document).ready�Ƴٵ�$(window).load
#T=ѹ��JavaScript
ѹ��JavaScript
#T=���� .live()����
���� .live()����
#T=��ѡ�����ͺ��ѡ����
���ѡ���������õ����磺$("#list p");���ѡ������ȡ����Ԫ���ڲ�����Ԫ�ء�����ʱ��ʵ��ֻҪ��ȡ��Ԫ�أ���ô�Ͳ�Ӧ��ʹ�ú��ѡ����Ӧ��ʹ����ѡ�����������磺$("#list > p"); 
#T=ʹ��data()�����洢��ʱ����
$("p").data("val",'abc');
alert($("p").data("val"));
#T=�������÷�����,�򻺴�ѡ����
$('#a1')
	.css('display','')
	.find('input',$('#a2')).val('b123')
	.end()
	.find('#a2',$('#a1'))
	.css('display','none');
#T=Ԥ����ͼƬ
//����Ԥ����ͼƬ�б�ĺ���(�в���)
jQuery.preloadImages = function(){
	//����ͼƬ
	for(var i = 0; i<arguments.length; i++){
		jQuery("<img>").attr("src", arguments[i]);
	}
}
#T=����Ĵ���������
//�����Էֳ�����ģ��.
module("Module B");
test("some other test", function() {
	//ָ�����ٸ��ж������Ҫ���������.
	expect(2);
 
	equals( true, false, "failing test" );
	equals( true, true, "passing test" );
});
// ���������ʹ��Ԥ���غ���
$.preloadImages("images/logo.png", "images/logo-face.png", "images/mission.png");
#T=д���Լ���ѡ����
$.expr[':'].mycustomselector= function(element, index, meta, stack){
	// element- DOMԪ��
	// index - ��ջ�е�ǰ����������ֵ
	// meta - �������ѡ����������Ԫ
	// stack - ���ڱ�������Ԫ�صĶ�ջ
 
	// ������ǰԪ���򷵻�true
	// ��������ǰԪ���򷵻�false
};
//�Զ���ѡ������Ӧ��:
$('.someClasses:test').doSomething();

$.expr[':'].withRel = function(element){
	var $this = $(element);
	//������rel���Բ�Ϊ�յ�Ԫ��
	return ($this.attr('rel') != '');
};
$(document).ready(function(){
	//�Զ���ѡ������ʹ�úܼ򵥣���������ѡ����һ��������һ��Ԫ�ذ�װ��
	//�����Ϊ��ʹ�ø�ʽ�������������������޸�����css��ʽ
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
//�����ǰһ���ִ���һ���Զ����ѡ�������������ҳ����г��ȳ���100px��Ԫ�ء��������Ĵ�������ǽ�click�¼��󶨵�ʹ�ø�ѡ�������ҳ�������ЩԪ���ϡ�
//�����Ҳ���������Ľ��⣬������������һ�����ж�ô��ǿ���������google��������custom jquery selector������ῴ���кܶ��ⷽ�������
#T=----------------------
----------------------
#T=$('input[name*="man"]')��name���������man�Ĳ���λ��
$('input[name*="man"]').val('has man in it!');
#T=$('input[name~="man"]')��name�������������man��
$('input[name~="man"]').val('mr. man is in it!');
#T=$('input[name$="letter"]')��name�������β��letter��
$('input[name$="letter"]').val('a letter');
$('input[name^="news"]')��name�����￪ͷ��news��
$('input[name^="news"]').val('news here!');
#T=----------------------
----------------------
#T=$("*")����Ԫ��
$("*").addClass("red");
#T=$("p")
$("p")
#T=$("#id")
$("#id")
#T=$("p#id")
$("p#id")
#T=$("p.class")
$("p.class")
#T=$("[href]") ѡȡ���д��� href ���Ե�Ԫ�ء�
$("[href]") ѡȡ���д��� href ���Ե�Ԫ�ء�
#T=$("[href='#']") ѡȡ���д��� href ֵ���� "#" ��Ԫ��
$("[href='#']") ѡȡ���д��� href ֵ���� "#" ��Ԫ��
#T=$("[href!='#']") ѡȡ���д��� href ֵ������ "#" ��Ԫ��
$("[href!='#']") ѡȡ���д��� href ֵ������ "#" ��Ԫ��
#T=$("[href$='.jpg']") ѡȡ���� href ֵ�� ".jpg" ��β��Ԫ��
$("[href$='.jpg']") ѡȡ���� href ֵ�� ".jpg" ��β��Ԫ��
#T=$("ul li:gt(3)")�г� index ���� 3 ��Ԫ��
$("ul li:gt(3)")�г� index ���� 3 ��Ԫ��
#T=$("ul li:lt(3)")�г� index С�� 3 ��Ԫ��
$("ul li:lt(3)")�г� index С�� 3 ��Ԫ��
#T=$("input:not(:empty)")���в�Ϊ�յ� input Ԫ��
$("input:not(:empty)")���в�Ϊ�յ� input Ԫ��
#T=$(":header")���б���Ԫ�� <h1> - <h6>
$(":header")���б���Ԫ�� <h1> - <h6>
#T=$(":contains('W3School')")����ָ���ַ���������Ԫ��
$(":contains('W3School')")����ָ���ַ���������Ԫ��
#T=$(":empty")���ӣ�Ԫ�أ��ڵ������Ԫ��
$(":empty")���ӣ�Ԫ�أ��ڵ������Ԫ��
#T=$("p:hidden")�������ص� <p> Ԫ��
$("p:hidden")�������ص� <p> Ԫ��
#T=$("table:visible")���пɼ��ı��
$("table:visible")���пɼ��ı��
#T=	$(":input")���� <input> Ԫ��
	$(":input")���� <input> Ԫ��
#T=$(":text")���� type="text" �� <input> Ԫ��
$(":text")���� type="text" �� <input> Ԫ��
#T=$(":password")���� type="password" �� <input> Ԫ��
$(":password")���� type="password" �� <input> Ԫ��
#T=$(":radio")���� type="radio" �� <input> Ԫ��
$(":radio")���� type="radio" �� <input> Ԫ��
#T=$(":checkbox")���� type="checkbox" �� <input> Ԫ��
$(":checkbox")���� type="checkbox" �� <input> Ԫ��
#T=$(":submit")���� type="submit" �� <input> Ԫ��
$(":submit")���� type="submit" �� <input> Ԫ��
#T=$(":reset")���� type="reset" �� <input> Ԫ��
$(":reset")���� type="reset" �� <input> Ԫ��
#T=$(":button")���� type="button" �� <input> Ԫ��
$(":button")���� type="button" �� <input> Ԫ��
#T=$(":image")���� type="image" �� <input> Ԫ��
$(":image")���� type="image" �� <input> Ԫ��
#T=$(":file")���� type="file" �� <input> Ԫ��
$(":file")���� type="file" �� <input> Ԫ��
#T=$(":enabled")���м���� input Ԫ��
$(":enabled")���м���� input Ԫ��
#T=$(":disabled")���н��õ� input Ԫ��
$(":disabled")���н��õ� input Ԫ��
#T=$(":selected")���б�ѡȡ�� input Ԫ��
$(":selected")���б�ѡȡ�� input Ԫ��
#T=$(":checked")���б�ѡ�е� input Ԫ��
$(":checked")���б�ѡ�е� input Ԫ��
#T=$("ul li")�ь�ul�����ЌӃȵ�li
$("#id").find("li").each(function(i){$(this).html($(this).html()+"BAM!"+i);});//��Ѱ�ڲ����е�li
#T=$("ul > li")�ь�ul�µ�һ�Ӄ����е�li
$("ul > li")
#T=$("div,span,p.myClass")
$("div,span,p.myClass")
#T=$("[@title]") �Ҍ����Ќ����а���title���Ŀ
$("[@title]") �Ҍ����Ќ����а���title���Ŀ
#T=$("label + input")�����н�����label���input(ͬ�����¼�)
$("label+input").css("background-color","red");
#T=$("form ~ input")�����н�����form���input(ͬ���P�S)
$("form ~ input").background("#eee");
#T=$("#subifrm").contents().find("#test").css('color','red');�L���ӿ��subifrm��test��css����
$("#subifrm").contents().find("#test").css('color','red');�L���ӿ��subifrm��test��css����
#T=$(window.frames["iframe1"].document).find("input[@type='radio']").attr("checked","true");
//�ڸ������в��� ѡ��IFRAME�е����е�ѡť
$(window.frames["iframe1"].document).find("input[@type='radio']").attr("checked","true");
#T=$(window.parent.document).find("input[@type='radio']").attr("checked","true");
//��IFRAME�в��� ѡ�и������е����е�ѡť
$(window.parent.document).find("input[@type='radio']").attr("checked","true");
#T=$("#f2",parent.document.body).attr("src","http://www.baidu.com")
//f1��jQuery�ı�f2��src����<iframe id="f1"></iframe><iframe id="f2></iframe>
$("#f2",parent.document.body).attr("src","http://www.baidu.com")
#T=$("#f1").contents().find("div").html();
//��f1�@�������ȡ��div�ă���
$("#f1").contents().find("div").html();
#T=$("#f1",parent.document.body).contents().find("div").html();
$("#f1",parent.document.body).contents().find("div").html();
#T=$("input:radio");��ǰ����е�radio
$("input:radio");��ǰ����е�radio
#T=$("input:radio",document.forms[0]);��һ���������е�radio
$("input:radio",document.forms[0]);��һ���������е�radio
#T=$("div",xml.responseXML);AJAX ���ص� XML �ĵ��У��������е� div Ԫ��
$("div",xml.responseXML);AJAX ���ص� XML �ĵ��У��������е� div Ԫ��
#T= 
 
#T=$('ul li').next()
$('form').next().click(function(){alert('aa'));
#T=$("ul li").parents("p")
//��a�ĸ��˻`p
$("a").hover(function(){
	$(this).parents("p").addClass("highlight");
},function(){
	$(this).parents("p").removeClass("highlight");
});
#T=$("ul li:first")��$('form').first()��$("form")[0]
$("#id").click(function(){$("form")[0].reset();});//�Ķ���form���x��һ��

//��������form
$("#id").click(function(){
	$("form").each(function(){
		this.reset();
	});
});
#T=$("ul li:last")��$('#id li').last()
$("ul li:last")��$('#id li').last()
#T=$("ul li:nth-child(2)")ƥ��ul�µĵ�2��li
$("ul li:nth-child(2)")ƥ��ul�µĵ�2��li
#T=$("ul li:first-child")ƥ��ul�µĵ�1��li
$("ul li:first-child")ƥ��ul�µĵ�1��li
#T=$("ul li:last-child")ƥ��ul�µ�����һ��li
$("ul li:last-child")ƥ��ul�µ�����һ��li
#T=$("ul li:only-child")�����Ԫ���а���Ψһ����Ԫ�؄t���ᱻƥ��(���ɰ�������Ԫ��)
$("ul li:only-child")�����Ԫ���а���Ψһ����Ԫ�؄t���ᱻƥ��(���ɰ�������Ԫ��)
#T=$("li:even")��0��ʼ��������ֵΪż����Ԫ��
$("li:even")��0��ʼ��������ֵΪż����Ԫ��
#T=$("li:odd")��0��ʼ��������ֵΪ������Ԫ��
$("li:odd")��0��ʼ��������ֵΪ������Ԫ��
#T=$("li:eq(2)")ƥ��һ����������ֵ��Ԫ��(��0��ʼӋ��)
$("li:eq(2)")ƥ��һ����������ֵ��Ԫ��(��0��ʼӋ��)
#T=$("li:gt(2)")ƥ�����д��ڸ�������ֵ��Ԫ��
$("li:gt(2)")ƥ�����д��ڸ�������ֵ��Ԫ��
#T=$("li:lt(2)")ƥ������С�ڸ�������ֵ��Ԫ��
$("li:lt(2)")ƥ������С�ڸ�������ֵ��Ԫ��
#T= 
 
#T=$("div:contains('china')")innerText�а���china��Ԫ��
$("div:contains('china')")innerText�а���china��Ԫ��
#T=$("td:parent")ƥ�����а�����Ԫ�ػ����ı���Ԫ��
$("td:parent")ƥ�����а�����Ԫ�ػ����ı���Ԫ��
#T=$("td:empty")ƥ�����в�������Ԫ�ػ����ı��Ŀ�Ԫ��
$("td:empty")ƥ�����в�������Ԫ�ػ����ı��Ŀ�Ԫ��
#T=$("div:has(p)")ƥ�京��ѡ������ƥ���Ԫ�ص�Ԫ��
$("div:has(p)")ƥ�京��ѡ������ƥ���Ԫ�ص�Ԫ��
#T=$("tr:visible")ƥ�����еĿɼ�Ԫ��
$("tr:visible")ƥ�����еĿɼ�Ԫ��
#T=$("tr:hidden")ƥ�����в��ɼ�Ԫ�ػ�typeΪhidden��Ԫ��
$("tr:hidden")ƥ�����в��ɼ�Ԫ�ػ�typeΪhidden��Ԫ��
#T=$("[@title]")ƥ�����а���title���Ե��Ŀ
$("[@title]")ƥ�����а���title���Ե��Ŀ
#T=$("[@title=ttt]")ƥ��title���Ե��ttt���Ŀ
$("[@title=ttt]")ƥ��title���Ե��ttt���Ŀ
#T=$("[@title=ttt][@class=aaaa]")����ƥ��
$("[@title=ttt][@class=aaaa]")����ƥ��
#T=$("input[@type]")ƥ������������Ե�Ԫ�� Ҫ�������°汾ֻҪȥ��@����
$("input[@type]")ƥ������������Ե�Ԫ�� Ҫ�������°汾ֻҪȥ��@����
#T=$("input[name='wd']")ƥ�������������ĳ���ض�ֵ��Ԫ��
$("input[name='wd']").attr("checked",true);
#T=$("input[@name*=123.htm]")ƥ����������԰���ĳ��ֵ��Ԫ��
$("input[@name*=123.htm]")ƥ����������԰���ĳ��ֵ��Ԫ��
#T=$("input[@name!='newsletter']")ƥ�����в�����ָ�������Ի����Բ������ض�ֵ��Ԫ��
$("input[@name!='newsletter']")ƥ�����в�����ָ�������Ի����Բ������ض�ֵ��Ԫ��
#T=$("input[@name^='news']")ƥ���������������ĳЩֵ��ʼ��Ԫ��
$("input[@name^='news']")ƥ���������������ĳЩֵ��ʼ��Ԫ��
#T=$("input[@name$='letter']")ƥ���������������ĳЩֵ��β��Ԫ��
$("input[@name$='letter']")ƥ���������������ĳЩֵ��β��Ԫ��
#T=$("input[@id][@name$='man']")��������ѡ������ͬʱ����������
$("input[@id][@name$='man']")��������ѡ������ͬʱ����������
#T=$('input[id][name$="man"]')����id����,��name���Ե�ĩβ��man
$('input[id][name$="man"]').val('only this one');
#T=$('input[name*="man"]')��name���������man��,����λ��
$('input[name*="man"]').val('has man in it!');
#T= 
 
#T=$(":header")ƥ���� h1, h2, h3֮��ı���Ԫ��
$(":header")ƥ���� h1, h2, h3֮��ı���Ԫ��
#T=$(":text")ƥ�����еĵ����ı���
$(":text")ƥ�����еĵ����ı���
#T=$(":password")ƥ�����������
$(":password")ƥ�����������
#T=$(":radio")ƥ�����е�ѡ��ť
$(":radio")ƥ�����е�ѡ��ť
#T=$(":checkbox")ƥ�����и�ѡ��
$(":checkbox")ƥ�����и�ѡ��
#T=$(":submit")ƥ�������ύ��ť
$(":submit")ƥ�������ύ��ť
#T=$(":input")ƥ������input,textarea,select��buttonԪ��
$(":input")ƥ������input,textarea,select��buttonԪ��
#T=$(":image")ƥ������ͼ����
$(":image")ƥ������ͼ����
#T=$(":reset")ƥ���������ð�ť
$(":reset")ƥ���������ð�ť
#T=$(":button")ƥ�����а�ť
$(":button")ƥ�����а�ť
#T=$(":file")ƥ�������ļ���
$(":file")ƥ�������ļ���
#T= 
 
#T=$("input:hidden")ƥ�����в��ɼ�Ԫ�أ�����typeΪhidden��Ԫ��
$("input:hidden")ƥ�����в��ɼ�Ԫ�أ�����typeΪhidden��Ԫ��
#T=$("input:enabled")ƥ�����п���Ԫ��
$("input:enabled")ƥ�����п���Ԫ��
#T=$("input:disabled")ƥ�����в�����Ԫ��
$("input:disabled")ƥ�����в�����Ԫ��
#T=$("input:checked")ƥ������ѡ�еı�ѡ��Ԫ��(��ѡ�򡢵�ѡ��ȣ�������select�е�option)
$("input:checked")ƥ������ѡ�еı�ѡ��Ԫ��(��ѡ�򡢵�ѡ��ȣ�������select�е�option)
#T=$("select option:selected")ƥ������ѡ�е�optionԪ��
$("select option:selected")ƥ������ѡ�е�optionԪ��
#T= 
 
#T=$("li").not(":has(ul)")��$("input:not(:checked)")
$("li").not(":has(ul)").css("border","1px solid black");//�������ѡ�������е�liԪ�أ�Ȼ��ȥ������ul��Ԫ�ص�liԪ��
#T=$('#faq').find('dd').hide().end().find('dt')
//��faq�@��id��������dd�˻`��Ȼ���[�أ��Y���@һ����,����dt�˻`���x���¼�
$('#faq').find('dd').hide().end().find('dt').click(function(){
	var answer=$(this).next();//�ҵ�dt������ӵ�һ��ddԪ��
	if(answer.is(':visible')){
		answer.slideUp();
	}else{
		answer.slideDown();
	}
});
#T=ƥ����������ִ�ж���Ч����Ԫ��
����:
ֻ�жԲ���ִ�ж���Ч����Ԫ��ִ��һ��������Ч

HTML����:
<button id="run">Run</button><div></div>

jQuery����:
$("#run").click(function(){
	$("div:not(:animated)").animate({left:"+=20"},1000);
});
#T=������վ��̨�^���Ŀ��
$(window.top.frames["frameTop"].document).find("#a2").click(function(){
	alert('a');
});
#T=ͬ����ܻ������
<iframe id="l"...</iframe>
<iframe id="r"...</iframe>

l�иı�r��src���룺
$("#l",parent.document.body).attr("src","http://www.radys.cn")

$('#imgDialog img',window.Wname1).click(function(){
$.Cimg({'typ':'select','obj':this,'css':'#efefef'})
})
#T=ȡ�ÿ�܃�ĳԪ����ֵ
<iframe id="m"...>
ifame����һ��someID
<div id="i1">Get this content</div>
</ifame>
�õ�i1������
$("#m").contains().find("#i1").text()
#T= 
 
#T=��Ԫ�ذ��¼�
��Ԫ�ذ��¼�
#T=----------------------
----------------------
#T=CSS��ʽ
CSS��ʽ
#T=$('').width()ȡ�Ì���
$('^!').width()
#T=$('').width("200px");�O�Ì���
$('^!').width("200px");
#T=$('').height()ȡ�ø߶�
$('^!').height()
#T=$('').height("200px");�O�ø߶�
$('^!').height("200px");



#T=$('').innerWidth();Ԫ���ڲ����򌒶� �����ײ����߿�
$('^!').innerWidth();
#T=$('').innerHeight();Ԫ���ڲ�����߶� �����ײ����߿�
$('^!').innerHeight();
#T=$('').outerHeight(true);Ԫ���ⲿ�߶� �����׺ͱ߿�
//����Ϊtrueʱ������߾�����
$('^!').outerHeight(true);
#T=$('').outerWidth(true);Ԫ���ⲿ���� �����׺ͱ߿�
//����Ϊtrueʱ������߾�����
$('^!').outerWidth(true);
#T=$('').addClass("redborder");�O�Ø�ʽ
$('^!').addClass("redborder");
#T=$('').removeClass("redborder");�Ƴ���ʽ
$('^!').removeClass("redborder");
#T=$('').css("border");ȡborder�Ę�ʽ
$('^!').css("border");
#T=$('').css("border","2px dashed #6600FF");�O�Ø�ʽ
$('^!').css("border","2px dashed #6600FF");
#T=toggleClass("btn")��� ����/������ �� ɾ��/��� һ��css��ʽ
HTML����:
<p>Hello</p><p class="btn">Hello Again</p>
jQuery����:
$("p").toggleClass("btn");
���:
[<p class="btn">Hello</p>,<p>Hello Again</p>]
#T= 
 
#T=���Բ���
���Բ���
#T=attr("src")ȡ�õ�һ��ƥ��Ԫ�ص�����ֵ
HTML����:
<img src="test.jpg"/>
jQuery����:
$("img").attr("src");
���:
test.jpg
#T=attr({src:"test.jpg",alt:"Test Image"})�oƥ��Č�����Ӷ�������ֵ
jQuery����:
$("img").attr({src:"test.jpg",alt:"Test Image"});
���:
[<img src="test.jpg" alt:="Test Image" />]
#T=attr("src","test.jpg")�oƥ��Č������һ������ֵ
HTML����:
<img/>
<img/>
jQuery����:
$("img").attr("src","test.jpg");
���:
[<img src="test.jpg" />,<img src="test.jpg" />]
#T=attr("alt",function(){return this.src})Ϊ����ƥ���Ԫ������һ������
HTML����:
<img src="test.jpg"/>
jQuery����:
$("img").attr("alt",function(){return this.src});
���:
<img src="test.jpg" alt="test" />
#T=removeAttr("src")��ÿһ��ƥ���Ԫ����ɾ��һ������
HTML����:
<img src="test.jpg"/>
jQuery����:
$("img").removeAttr("src");
���:
[<img />]
#T=$('').append('');�����innerHTML
$('body').append('<div class="clickme">Another target</div>');
#T=$('').html("�µă���!")ȡ�û��O��ƥ��Ԫ�ص�html����
//���������������XML�ĵ�������������XHTML�ĵ�
$("ul").find("li").each(function(i){
	$(this).html($(this).html()+"�µă���!"+i);
});
#T=$('').text()ȡ������ƥ��Ԫ�ص�����
$('').text();
#T=$('').val()��õ�һ��ƥ��Ԫ�صĵ�ǰֵ
$('').val()
#T= 
 
#T=λ�ò���
λ�ò���
#T=$("p").offset().left;Ԫ���ڵ�ǰ�ӿڵ����ƫ��leftֵ,�˷���ֻ�Կɼ�Ԫ����Ч
$("p").offset().left;Ԫ���ڵ�ǰ�ӿڵ����ƫ��leftֵ,�˷���ֻ�Կɼ�Ԫ����Ч
#T=$("p").offset().top;Ԫ���ڵ�ǰ�ӿڵ����ƫ��topֵ,�˷���ֻ�Կɼ�Ԫ����Ч
$("p").offset().top;Ԫ���ڵ�ǰ�ӿڵ����ƫ��topֵ,�˷���ֻ�Կɼ�Ԫ����Ч
#T=$("p").position().left;Ԫ����Ը�Ԫ�ص�ƫ��leftֵ
//Ϊ��ȷ�����������ڲ��ס��߿�����������ʹ�����ص�λ���˷���ֻ�Կɼ�Ԫ����Ч��
#T=$("p").position().top;Ԫ����Ը�Ԫ�ص�ƫ��topֵ
//Ϊ��ȷ�����������ڲ��ס��߿�����������ʹ�����ص�λ���˷���ֻ�Կɼ�Ԫ����Ч��
#T=$("p").scrollTop();Ԫ����Թ�����������ƫ��,�Կɼ�������Ԫ�ؾ���Ч
$("p").scrollTop();Ԫ����Թ�����������ƫ��,�Կɼ�������Ԫ�ؾ���Ч
#T=$("p").scrollLeft();ƥ��Ԫ����Թ���������ƫ��,�Կɼ�������Ԫ�ؾ���Ч
$("p").scrollLeft();ƥ��Ԫ����Թ���������ƫ��,�Կɼ�������Ԫ�ؾ���Ч
#T= 
 
#T=���ĺ���
���ĺ���
#T=$("img").each(function(i){this.src="test"+i+".jpg";});
$("img").each(function(i){this.src="test"+i+".jpg";});
#T=$("img").size();�����ĵ�������ͼƬ����
$("img").size();�����ĵ�������ͼƬ����
#T=$("img").length;�����ĵ�������ͼƬ����
$("img").length;�����ĵ�������ͼƬ����
#T=$("ul li").selector;����ul li
$("ul li").selector;����ul li
#T=$("ul",document.body).context.nodeName����body
$("ul",document.body).context.nodeName����body
#T=$("img").get(0);ȡ�õ�һ��img
$("img").get(0);ȡ�õ�һ��img
#T=$('li').index($('#bar'));����ƥ���Ԫ�ز�����ԓԪ�ص�����ֵ��0��ʼ
$('li').index($('#bar'));����ƥ���Ԫ�ز�����ԓԪ�ص�����ֵ��0��ʼ
#T= 
 
#T=����Ч��
����Ч��
#T=$('').fadeOut("slow",function(){alert("������ʧ��")});����
//slow����Q��normal,fast,������딵
$('^!').fadeOut("slow",function(){alert("������ʧ��")});
#T=$('').fadeIn("slow",function(){alert("�������F��")});����
//slow����Q��normal,fast,������딵
$('^!').fadeIn("slow",function(){alert("�������F��")});
#T=$('').fadeTo������Ԫ�صĲ�͸�����Խ�����ʽ������ָ��ֵ
//slow����Q��normal,fast,������딵
$('^!').fadeTo("slow",0.5,function(){alert("��͸���ȱ��50%��")});
#T= 
 
#T=-------------------------
-------------------------
#T=����
����
#T=.show("normal");��ʾ���ص�ƥ��Ԫ��
$('^!').show("normal",function(){alert("!")});
#T=.hide("normal");������ʾ��Ԫ��
$('^!').hide("normal",function(){alert("!")});
#T=.toggle(function(){},function(){});������л�Ԫ�صĿɼ�״̬
$("td").toggle(function(){
	$(this).addClass("selected");
},function(){
	$(this).removeClass("selected");
});

var f=0;
$("button").click(function(){
	$("p").toggle(f++ % 2==0);
});
#T=����
����
#T=.slideDown("normal");������������
$('^!').slideDown("normal",function(){alert("^!")});
#T=.slideUp("normal");�������ϼ�С
$('^!').slideUp("normal",function(){alert("^!")});
#T=.slideToggle("normal");�����л�Ч��
$('^!').slideToggle("normal",function(){alert("^!")});
#T=���뵭��
���뵭��
#T=.fadeIn("normal");����Ч��
$('^!').fadeIn("normal",function(){alert("^!")});
#T=.fadeOut("normal");����Ч��
$('^!').fadeOut("normal",function(){alert("^!")});
#T=.fadeTo("normal");�Խ�����ʽ����͸����
$('^!').fadeTo("normal",0.5,function(){alert("^!")});
#T=�Զ���
�Զ���
#T=.animate({},1000);���ڴ����Զ��嶯��
$('^!').animate({
	width:"90%",
	height:"100%",
	fontSize:"10em",
	borderWidth:10
},1000);

//�л�����ĸ߶Ⱥ�͸����
$('^!').animate({height:'toggle',opacity:'toggle'},"slow");

//��ǰһ��������ɺ󣬺�һ�������ŻῪʼ.
$('^!').animate({width:"90%"},{queue:false,duration:5000})
	.animate({fontSize:'10em'},1000)
	.animate({borderWidth:5},1000);
#T=.stop();ֹͣ������ָ��Ԫ�����������еĶ���
$('^!').stop();
#T=.delay(800)����һ����ʱ���Ƴ�ִ�ж�����֮�����Ŀ
$('^!').slideUp(300).delay(800).fadeIn(400);
#T=�¼��л�
�¼��л�
#T=.hover(function(){},function(){});�ГQhover���Ƴ���
$('^!').hover(function(){
	$(this).addClass("green");
},function(){
	$(this).removeClass("green");
});
#T=.toggle(function(){},function(){}...);ÿ�ε�������ε��ú���
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
 
#T=����
����
#T=$.trim("  hello, how are you?  ");ȥ���ַ�����ʼ�ͽ�β�Ŀո�
$.trim("  hello, how are you?  ");ȥ���ַ�����ʼ�ͽ�β�Ŀո�
#T=alert($('li').toArray());�õ�����li��Ԫ������
alert($('li').toArray());�õ�����li��Ԫ������
#T=$('').bind('click',function(){});
$('.clickme').bind('click',function(){alert($(this).text());});
#T=$('').live('click',function(){});
$('.clickme').live('click',function(){alert($(this).text());});
#T=$('').load("loadhtml.html");��html�ļ������d���������
//��html�ļ������d����div��
$("div").load("loadhtml.html");
//��html�ļ����id=div2������ ���ص�div����
$("div").load("loadhtml.html #div2");
//�d��rpost��ʽ���f����limit
$("div").load("feeds.php",{limit:25},function(){
	alert("�d��ɹ���!");
});
#T=$('').hover(function(){},function(){});
//�ГQhover���Ƴ����class
$(".clickme").hover(function(){
		$(this).addClass("green");
	},function(){
		$(this).removeClass("green");
});
#T=$('').find('').hide().end().find('').click(function(){});
//�ГQvisible����
$('#faq').find('dd').hide().end().find('dt').click(function(){
	var answer=$(this).next();
	if(answer.is(':visible')){
		answer.slideUp();
	}else{
		answer.slideDown();
	}
});
#T=$('').toggle()�л��ɼ�״̬
//�л�Ԫ�صĿɼ�״̬
$("p").toggle()
#T=$('').click(function(event){function("test");});
//���{����
var foobar="test";
var handler=function(data){alert(data)};
$('a').click(function(event){handler("test");});
#T=$('').bind('click',{msg:'����!'},function(event){alert(event.data.msg);});
//��ֵ,��ֹԭֵ���޸�
$('#bar').bind('click',{msg:'����!'},function(event){
	alert(event.data.msg);
});
#T=$('').bind('mouseenter mouseleave',function(){});
//��һ��Ԫ�أ���ʼ�����classû�����ó�entered,������ƽ�ȥ��ʱ����class�м���entered����֮��ȥ��
$('#foo').bind('mouseenter mouseleave',function(){
	$(this).toggleClass('entered');
});
#T=$('').bind({click:function(){},mouseenter:function(){}});
//һ�νoͬһ��Ԫ�ؽ��������¼�
$('#foo').bind({
	click:function(){alert('a');},
	mouseenter:function(){alert('b');}
});
#T=$('').bind('click',function(event){alert(event.pageX+','+event.pageY);});
//�c��body�ĕr��ȡ�î�ǰ����
$('body').bind('click',function(event){
	alert('The mouse cursor is at('+event.pageX+','+event.pageY+')');
});
#T=$('').one("click",function(){});
//�����ж��䱻��һ�ε����ʱ����ʾ�������ı���
$("p").one("click",function(){
	alert($(this).text());
});
#T=$('').click(function(event,a,b){}).trigger("click",["aa","bb"]);
//��һ���¼����ݲ���
$("p").click(function(event,a,b){
//һ����ͨ�ĵ���¼�ʱ��a��b��undefined����
//������������䴥������ôaָ��"foo",��bָ��"bar"
}).trigger("click",["foo","bar"]);

//�ѵ�һ��form�ύ
$("form:first").trigger("submit");
//�oԪ�������¼�
$('body').bind('click',function(event){
	alert('The mouse cursor is at('+event.pageX+','+event.pageY+')');
});
#T=one(type,[data],fn)
//�����ж��䱻��һ�ε����ʱ����ʾ�������ı���
$("p").one("click",function(){
	alert($(this).text());
});
#T=trigger(type,[data])
//��ÿһ��ƥ���Ԫ���ϴ���ĳ���¼�
//�ѵ�һ��form�ύ
$("form:first").trigger("submit");
#T=triggerHandler(type,[data])
//���ᴥ��ָ�����¼����������а󶨵Ĵ�����
#T=�¼�ί��
�¼�ί��
#T=live(type,[data],fn)
$('.clickme').live('click',function(){alert($(this).text());});
#T= 
 
#T=��Ԫ���ϰ󶨵��¼��Ƴ�
��Ԫ���ϰ󶨵��¼��Ƴ�
#T=----------------------
----------------------
#T=$('').unbind()
//�����ж���������¼�ȡ����
$("p").unbind()
#T=$('').unbind("click")
//�������click�¼�ȡ����
$("p").unbind("click")
#T=$('').die("click",aClick)
//��span��click�¼�ȡ����
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
 
#T=aJax����
aJax����
#T=----------------------
----------------------
#T=$.get
//��get�����l�͔�����test.php,ͬ�r���f�ɂ�����,���{�����@ʾ��������ݔ������,php����$_GET["name"]ȡ�Å���
$.get("test.php",{name:"John1",time:"2pm"},function(msg){
	alert(msg);
});
#T=$.post
//��post�����l�͔�����test.php,ͬ�r���f�ɂ�����,���{�����@ʾ��������ݔ������,php����$_POST["name"]ȡ�Å���
$.post("test.php",{name:"John2",time:"2pm"},function(msg){
	alert(msg);
});
#T=$.ajax
//��post�����l�͔�����test.php,ͬ�r���f�ɂ�����,���{�����@ʾ��������ݔ������,php����$_POST["name"]ȡ�Å���
$.ajax({
	type:"POST",url:"test.php",data:"name=�L��&location=Boston",
	success:function(msg){
		if(msg.indexOf('Error:')!=-1){alert(msg);return false;}
		alert(msg);
	},error:function(msg){alert(msg);}
});$.ajaxSetup({cache:false});
#T=$.getJSON
//ͨ��HTTP GET��������JSON����
$.getJSON("test.php?name=�L��1&location=Boston",function(data){
	alert(data);
//	$.each(data.items,function(i,item){
//		$("<img/>").attr("src",item.media.m).appendTo("#images");
//		if(i==3){return false;}
//	});
});
#T=$.getScript
//ͨ��HTTP GET�������벢ִ��һ��JavaScript�ļ�
$.getScript("custom.js",function(data){
	alert(data);
//	$("#go").click(function(){
//		$(".block").animate({backgroundColor:'pink'},1000)
//		.animate({backgroundColor:'blue'},1000);
//	});
});
#T=$('').load
//�d��rʹ��post��ʽ���f����limit
$("div").load("feeds.php",{limit:25},function(){
	alert("�d��ɹ���!");
});
#T= 
 
#T=�ĵ�����
�ĵ�����
#T=----------------------
----------------------
#T=$("p").append("He<b>llo</b>");��p��ǩ��������
$("p").append("He<b>llo</b>");��p��ǩ��������
#T=$("p").appendTo("div");��p��ǩ�����ݲ�����div
$("p").appendTo("div");��p��ǩ�����ݲ�����div
#T=$("p").prepend($("div")[0]);����һ��div�������ݷ���p��ǩ
$("p").prepend($("div")[0]);����һ��div�������ݷ���p��ǩ
#T=$("p").prependTo("div");��p��ǩ�������ݲ�����div
$("p").prependTo("div");��p��ǩ�������ݲ�����div
#T=$("p").after("<b>Hello</b>");��p��ǩ���������
$("p").after("<b>Hello</b>");��p��ǩ���������
#T=$("p").before("<b>Hello</b>");��p��ǩǰ��������
$("p").before("<b>Hello</b>");��p��ǩǰ��������
#T=$("p").insertAfter("div");��p��ǩ���������Ƶ�div��ǩ���
$("p").insertAfter("div");��p��ǩ���������Ƶ�div��ǩ���
#T=$("p").insertBefore("div");��p��ǩ���������Ƶ�div��ǩǰ��
$("p").insertBefore("div");��p��ǩ���������Ƶ�div��ǩǰ��
#T=$("p").wrap("<div id='a'></div>");�ڵ�ǰp��ǩ��Χ����div
$("p").wrap("<div id='a'></div>");�ڵ�ǰp��ǩ��Χ����div
#T=$("p").unwrap()��p��ǩ���ĸ���ǩȥ��
$("p").unwrap()��p��ǩ���ĸ���ǩȥ��
#T=$("p").wrapAll("<div></div>");������ƥ���p��ǩ������һ������
$("p").wrapAll("<div></div>");������ƥ���p��ǩ������һ������
#T=$("p").wrapInner("<b></b>");��p��ǩ������֮�����b�˻`
$("p").wrapInner("<b></b>");��p��ǩ������֮�����b�˻`
#T=$("p").replaceWith("����");�����е�p�˻`���������Q������
$("p").replaceWith("����");�����е�p�˻`���������Q������
#T=$("����").replaceAll("p");�����е�p�˻`���������Q������
$("����").replaceAll("p");�����е�p�˻`���������Q������
#T=$("p").empty();��p�˻`�Ȳ��ă��݄h��
$("p").empty();��p�˻`�Ȳ��ă��݄h��
#T=$("p").remove();��p�˻`�Լ���Ȳ��ă��݄h��
$("p").remove();��p�˻`�Լ���Ȳ��ă��݄h��
#T=$("p").detach("[align]");��p�˻`�б��Єh������align�Ę˻`�������
$("p").detach("[align]");��p�˻`�б��Єh������align�Ę˻`�������
#T=$("b").clone().prependTo("p");��b�˻`��������}�u��p�˻`��
$("b").clone().prependTo("p");��b�˻`��������}�u��p�˻`��
#T= 
 
#T=----------------------
----------------------
#T=��Ҏ�¼�
��Ҏ�¼�
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
 $(this).append('Mouse ������.');
}).mousedown(function(){
 $(this).append('Mouse ������.');
});
#T=mousedown(fn)
$("p").mouseup(function(){
 $(this).append('Mouse ������.');
}).mousedown(function(){
 $(this).append('Mouse ������.');
});
#T=mouseenter(fn)
$("div.enterleave").mouseenter(function(){
 $("p:first",this).text("��������");
}).mouseleave(function(){
 $("p:first",this).text("����뿪��");
});
#T=mouseleave(fn)
$("div.enterleave").mouseenter(function(){
 $("p:first",this).text("��������");
}).mouseleave(function(){
 $("p:first",this).text("����뿪��");
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
#T=ȡ�ô����¼��������Ϣ
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
 
#T=���䌍��
���䌍��
#T=----------------------
----------------------
#T=���ГQɫ
$("tr").each(function(i){this.style.backgroundColor=['#ccc','#fff'][i%2]})
#T=�Զ��x�Uչ�¼�
//�Uչ��min��max�ɂ�����
$.extend({min:function(a,b){return a<b?a:b;},max:function(a,b){return a>b?a:b;}})
//�{��
alert("a=10,b=20,max="+$.max(10,20)+",min="+(10,20));
#T=��$���Ğ�jQuery
jQuery.noConflict();֮��Ϳ���jQuery("div")��
#T=��jQuery��Cache�P�]
$.ajaxSetup({cache:false});
#T=ȡ��Ԫ�ؿ�����
$("ul li").length;
#T=�|�l�¼���Ԫ������ֵ
$("ul li").click(function(){
	alert($(this).index());
})
#T=��parents()��children()׷��
$('td.1').click(function(){
	alert($(this).parents().parents().children().children().children('td.2 span').html());
});
#T=��find()׷��
$('td.1').click(function(){
	alert($(this).parents().parents().find('td.2 span').html());
});
//find()�����������ã�
$('td.1').click(function(){
	alert($('').find('td.2 span').html());
});
#T=��ȡ�������ʾ����ĸ߶�|����
$(window).height();$(window).width();
#T=��ȡҳ����ĵ��߶�|����
$(document).height();$(document).width();
#T=��ȡ�������������Ĵ�ֱ�߶�
$(document).scrollTop();
#T=��ȡ����������ߵĴ�ֱ���
$(document).scrollLeft();
#T=����Ԫ��λ�ú�ƫ����offset
var o=$(this).offset();
offset������һ�������õķ����������ذ�װ���е�һ��Ԫ�ص�ƫ����Ϣ��Ĭ������������body��ƫ����Ϣ���������top��left�������ԡ�
offset(options,results)
options.relativeTo	ָ����Լ���ƫ��λ�õ�����Ԫ�ء����Ԫ��Ӧ����relative��absolute��λ��ʡ�������body��
options.scroll		�Ƿ�ѹ������������ڣ�Ĭ��TRUE
options.padding		�Ƿ��padding�������ڣ�Ĭ��false
options.margin		�Ƿ��margin�������ڣ�Ĭ��true
options.border		�Ƿ�ѱ߿�������ڣ�Ĭ��true
#
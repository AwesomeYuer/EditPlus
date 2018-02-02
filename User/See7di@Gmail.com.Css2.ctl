#TITLE=See7di.Css 2.0
#INFO
Cliptext Library for CSS2 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=Css Charset
@charset "utf-8";
#T=强制不换行
white-space: nowrap;
#T=content:".";
#T=<metahttp-equivmetahttp-equiv="x-ua-compatible"content="IE=7"/>
#T=Css针对不同浏览器的写法
<meta http-equiv="x-ua-compatible" content="ie=7" />
IE8 最新css hack：
　　"\9"　例:"margin:0px auto\9;".这里的"\9"可以区别所有IE和FireFox。
　　"*"　IE6、IE7可以识别.IE8、FireFox不能.
　　"_"　IE6可以识别"_",IE7、IE8、FireFox不能。

_只有ie6
*只有ie6,ie7
!important IE7+ FF(!important需要在前边)
*+html 与 *html是IE特有的标签,FF暂支持.而*+html又是IE7特有标签.

{
background-color:#FF0000 !important;/*IE8和Firefox、Opera、Safari*/
*background-color:#00FF00 !important;/*IE7(IE7对识别important)*/
*background-color:#0000FF;/*IE7*/
background-color:#000000;/*IE6(IE6对不识别important)*/
_background-color:#000000;/*IE6(IE7,IE8,FF,Opera,Safari均不支持下划线)*/
width: 100px !important; /*IE7+ FF(!important需要在前边)*/
width: 80px; /*IE6*/
}


万能 float 闭合(非常重要!)
将以下代码加入Global CSS 中,给需要闭合的div加上 class="clearfix"即可,屡试不爽.
<style>
/*Clear Fix*/
{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-block;}
.clearfix{display:block;}
/*End Fix*/
</style>
三、其他兼容技巧
1,FF下给div设置padding后会导致width和height增加,但IE不会.(可用!important解决)
2,居中问题.
1).垂直居中.将line-height设置为当前div相同的高度,再通过vertical-align:middle.(注意内容不要换行.)
2).水平居中.margin:0 auto;(当然不是万能)
3,若需给a标签内内容加上样式,需要设置display:block;(常见于导航标签)
4,FF和IE对BOX理解的差异导致相差2px的还有设为float的div在ie下margin加倍等问题.
5,ul标签在FF下面默认有list-style和padding.最好事先声明,以避免不必要的麻烦.(常见于导航标签和内容列表)
6,作为外部wrapper的div不要定死高度,最好还加上overflow:hidden.以达到高度自适应.
1针对firefox ie6 ie7的css样式
现在大部分都是用!important来hack，对于ie6和firefox测试可以正常显示，
但是ie7对!important可以正确解释，会导致页面没按要求显示！找到一个针
对IE7不错的hack方式就是使用“*+html”，现在用IE7浏览一下，应该没有问题了。
现在写一个CSS可以这样：
^#1{color:#333;}/*Moz*/
*html #1{color:#666;}/*IE6*/
*+html #1{color:#999;}/*IE7*/
那么在firefox下字体颜色显示为#333，IE6下字体颜色显示为#666，IE7下字体颜色显示为#999。
2css布局中的居中问题
主要的样式定义如下：
body{TEXT-ALIGN:center;}
^#center{MARGIN-RIGHT:auto;MARGIN-LEFT:auto;}
说明：
首先在父级元素定义TEXT-ALIGN:center;这个的意思就是在父级元素内的内容居中；对于IE这样设定就已经可以了。
但在mozilla中不能居中。解决办法就是在子元素定义时候设定时再加上“MARGIN-RIGHT:auto;MARGIN-LEFT:auto;”
需要说明的是，如果你想用这个方法使整个页面要居中，建议不要套在一个DIV里，你可以依次拆出多个div，
只要在每个拆出的div里定义MARGIN-RIGHT:auto;MARGIN-LEFT:auto;就可以了。
3盒模型不同解释.
^#box{width:600px;//for ie6.0- width:500px; //for ff+ie6.0}
^#box{ width:600px!important //for ff width:600px; //for ff+ie6.0 width /**/:500px; //for ie6.0-}
4 浮动ie产生的双倍距离
^#box{ float:left; width:100px; margin:0 0 0 100px; //这种情况之下IE会产生200px的距离 display:inline; //使浮动忽略}
这里细说一下block,inline两个元素,Block元素的特点是:总是在新行上开始,高度,宽度,行高,边距都可以控制(块元素);Inline元素的特点是:和其他元素在同一行上,…不可控制(内嵌元素);
^#box{ display:block; //可以为内嵌元素模拟为块元素 display:inline; //实现同一行排列的的效果 diplay:table;
5 IE与宽度和高度的问题
IE不认得min-这个定义，但实际上它把正常的width和height当作有min的情况来使。这样问题就大了，如果只用宽度和高度，
正常的浏览器里这两个值就不会变，如果只用min-width和min-height的话，IE下面根本等于没有设置宽度和高度。
比如要设置背景图片，这个宽度是比较重要的。要解决这个问题，可以这样：
^#box{ width: 80px; height: 35px;}html>body #box{ width: auto; height: auto; min-width: 80px; min-height: 35px;}
6 页面的最小宽度
min-width是个非常方便的CSS命令，它可以指定元素最小也不能小于某个宽度，这样就能保证排版一直正确。但IE不认得这个，
而它实际上把width当做最小宽度来使。为了让这一命令在IE上也能用，可以把一个<div> 放到 <body> 标签下，然后为div指定一个类：
然后CSS这样设计：
^#container{ min-width: 600px; width:expression(document.body.clientWidth < 600? “600px”: “auto” );}
第一个min-width是正常的；但第2行的width使用了Javascript，这只有IE才认得，这也会让你的HTML文档不太正规。它实际上通过Javascript的判断来实现最小宽度。
7 清除浮动
.hackbox{ display:table; //将对象作为块元素级的表格显示}或者.hackbox{ clear:both;}
或者加入:after（伪对象）,设置在对象后发生的内容，通常和content配合使用，IE不支持此伪对象，非Ie 浏览器支持，
所以并不影响到IE/WIN浏览器。这种的最麻烦的……#box:after{ content: “.”; display: block; height: 0; clear: both; visibility: hidden;}
8 DIV浮动IE文本产生3象素的bug
左边对象浮动，右边采用外补丁的左边距来定位，右边对象内的文本会离左边有3px的间距.
^#box{ float:left; width:800px;}#left{ float:left; width:50%;}#right{ width:50%;}*html #left{ margin-right:-3px; //这句是关键}
HTML代码<div id=”box”> <div id=”left”></div> <div id=”right”></div></div>
9 属性选择器(这个不能算是兼容,是隐藏css的一个bug)
p[id]{}div[id]{}
这个对于IE6.0和IE6.0以下的版本都隐藏,FF和OPera作用
属性选择器和子选择器还是有区别的,子选择器的范围从形式来说缩小了,属性选择器的范围比较大,如p[id]中,所有p标签中有id的都是同样式的.
10 IE捉迷藏的问题
当div应用复杂的时候每个栏中又有一些链接，DIV等这个时候容易发生捉迷藏的问题。
有些内容显示不出来，当鼠标选择这个区域是发现内容确实在页面。
解决办法：对#layout使用line-height属性 或者给#layout使用固定高和宽。页面结构尽量简单。
11 高度不适应
高度不适应是当内层对象的高度发生变化时外层高度不能自动进行调节，特别是当内层对象使用
margin 或paddign 时。
例：
<div id=”box”>
<p>p对象中的内容</p>
</div>
CSS：#box {background-color:#eee; }
^#box p {margin-top: 20px;margin-bottom: 20px; text-align:center; }
解决方法：在P对象上下各加2个空的div对象CSS代码：.1{height:0px;overflow:hidden;}或者为DIV加上border属性。
内置与外置写法
外置：
.main{ float:left;#float:none;_float:none;html*.main{ float:left;#float:none;_float:none; }*+html .main{ float:left;#float:none;_float:none; }
* html .main{ float:left;#float:none;_float:none; }第1行给Firefox以及其他浏览器看 
第2行给safari/IE6/iE7看，如果safari/IE6/iE7 视觉效果不统一，就要在后面跟IE6/IE7的定义 
第3行给IE7看 
第4行给IE6以及更老的版本看 
内置：
.main{ float:left;#float:none;_float:none;[float:none;]float:none; }第1个float给Firefox以及其他浏览器看 
第2个加#的float给IE7看 
第3个加_的float给IE6以及更老的版本看 
第4个加[的float给safari看 
第5个加]的float给IE看 
各种常见浏览器使用的内核 (Rendering Engine) 
Mozilla Firefox ( Gecko )
Internet Explorer ( Trident )
Opera ( Presto )
Konqueror ( KHTML )
Safari Swift ( WebKit )
用css自动隐藏超出宽度内容并省略显示，浏览器兼容ie、ff
text-overflow:ellipsis;
-o-text-overflow:ellipsis;
-icab-text-overflow: ellipsis;
-khtml-text-overflow: ellipsis;
-moz-text-overflow: ellipsis;
-webkit-text-overflow: ellipsis; 别兴奋了，该支持的都支持，其他都是骗小朋友滴。基本非IE的浏览器的私有属性都会以-xxx-这样开始，-o-就是以Presto为引擎的 Opera私有的、-icab-是iCab私有的，-khtml-就是以KHTML为引擎的浏览器（如Konqueror Safari）、-moz-就是以mozilla的Gecko为引擎的浏览器（如Firefox，mozilla）、-webkit-就是以Webkit 渲染引擎（是KHTML的衍生产品）的浏览器（如Safari、Swift）。
并不是说像-moz-text-overflow现在有用，而是一个幻想的写法，当一个浏览器的开发人员决定在浏览器支持一种还没得到公认的属性时，一般都会在属性的前面加上-xxx-这种，表明这种是属于该浏览器私有的属性，当然，这些属性多数来自CSS3的，使用这样的写法在浏览器升级后也许才有作用
IE、Firefox、Opera和Safari对CSS样式important和*的支持
#T=半透明且圆角的浮动层,兼容各种浏览器
background-image:url('source/plugin/google_api_map_note/images/opbg.png');behavior:url('source/plugin/google_api_map_note/images/pie.htc');filter:Alpha(opacity=80);-moz-opacity:.8;opacity:0.8;border-radius:10px 10px 10px 10px;color:#FFFFFF;padding:15px;position:absolute;margin-left:80px;margin-top:-450px;max-width:680px;z-index:100;display:none;
#T= 

#T=font:字体
{font:30px arial;}
{font:oblique solid 24px;}
{font:15pt/17pt bold "Arial" normal;}
{font:italic small-caps bold 12px 22px Verdana;}
#T=font-family:字体族科
font-family:Verdana,arial,Times,serif;
#T=font-style:字体风格[normal | italic | oblique]
font-style:normal;
#T=font-variant:字体变形[normal | small-caps]
font-variant:small-caps;
#T=font-weight:字体加粗[normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900]
font-weight:bold;
#T=font-size:字体大小
font-size:12px;
#T= 
 
#T=color:颜色
color:#DDDDDD;
#T=background:背景样式[<背景颜色> || <背景图象> || || <背景附件> || <背景位置>]
{background:red no-repeat scroll 5% 60%;}
{background:url("bg.gif") repeat-y;}
{background:url("bg.gif") top;}
#T=background-color:背景颜色[颜色 | transparent]
background-color:transparent;
#T=background-image:背景图象
background-image:url("bg.jpg");
#T=background-repeat:背景重复[repeat | repeat-x | repeat-y | no-repeat]
background-repeat:repeat-x;
#T=background-attachment:背景是否滾動[scroll(滚动) | fixed(固定)]
background-attachment:fixed;
#T=background-position:背景图像位置[[百分比 | <长度> ]{1,2} | [top | center | bottom] || [left | center | right]]
background:url("bg.gif");background-position:bottom 10px;
#T= 
 
#T=border:边框[<边框宽度> || <边框式样> || <颜色>]
border:1px dashed #666666;
#T=border-width:边框宽度[thin | medium | thick | <长度>]
border-width:1px;
#T=border-color:边框颜色[<颜色>{1,4}]
border-color:#DDDDDD;
#T=border-style:边框风格[[ none | dotted | dashed | solid | double | groove | ridge | inset | outset ]{1,4}]
border-style:dashed;
#T=border-collapse:将表格的内线合并为1px
border-collapse:collapse;
#T=border-spacing:1px;相當于cellspacing='1'
border-spacing:1px;
#T=border-radius:3px;圓角
border-radius:3px;
#T= 
 
#T=margin:外部边界[<长度> | <百分比> | auto]
margin:0px auto;
#T=margin-bottom:下边界
margin-bottom:5px;
#T=padding:內部补白[[ <长度> | <百分比> ]{1,4}]
padding:5px;
#T=padding-bottom:下部补白
padding-bottom:10px;
#T= 
 
#T=width:宽度[<长度> | <百分比> | auto]
width:500px;
#T=height:高度[<长度> | auto]
height:500px;
#T=float:漂浮[left | right | none]
float:Left;
#T=clear:清除[none | left | right | both]
clear:both;
#T= 
 
#T=line-height:行高[normal | <数字> | <长度> | 百分比]
line-height:24px;
#T=word-spacing:文字间隔[normal | <长度>]
word-spacing:-0.2em;
#T=letter-spacing:字母间隔[normal | <长度>]
letter-spacing:0.1em;
#T=text-decoration:文字修饰[none | [ underline || overline || line-through || blink ]
text-decoration:underline;
#T=vertical-align:纵向对齐方式[baseline | sub | super | top | text-top | middle | bottom | text-bottom | 百分比]
vertical-align:text-top;
#T=text-transform:文本的大小写[none | Capitalize | UPPERCASE | lowercase]
text-transform:capitalize;
#T=text-align:文本排列[left | right | center | justify]
text-align:left;
#T=text-indent:文本缩进[<长度> | <百分比>]
text-indent:10px;
#T= 
 
#T=display:显示[block(在元素的前和后都会有换行) | inline(在元素的前和后都不会有换行) | list-item | none]
display:none;
空白
#T=white-space:空格字符的处理方式,不换行[normal(将多个空格折叠成一个) | pre(不折叠空格) | nowrap(不允许换行，除非遇到<BR>标记)]
white-space:nowrap;
#T=list-style:列表项目的样式[<目录样式类型> || <目录样式位置> || <url>]
list-style:outside upper-roman;
#T=list-style-type:列表项样式类型[disc | circle | square | decimal | lower-roman | upper-roman | lower-alpha | upper-alpha | none]
list-style-type:none;
#T=list-style-image:目录样式图象[<url> | none]
list-style-position:outside;list-style-image:url("images/ie.gif");
#T=list-style-position:目录样式位置[inside | outside]
display:list-item;list-style-position:inside;
#T= 
 
#T=clip:设置对象的可视区域
position:absolute;clip:rect(50px,auto,auto,auto);
#T=cursor:
cursor:pointer;
#T=left:
left:24px;
#T=marker-offset:两个容器靠近的一边的间距
marker-offset:5px;
#T=max-height:对象的最大高度
max-height:200px;
#T=max-width:对象的最大宽度
max-width:200px;
#T=min-height:对象的最小高度
min-height:200px;
#T=min-width:对象的最小宽度
min-width:200px;
#T=overflow:
overflow:hidden;
#T=overflow-x:
overflow-x:hidden;
#T=overflow-y:
overflow-y:hidden;
#T=position:对象的定位方式
position:absolute;对象可层叠relative;对象不可层叠
#T=right:对象与其最近一个具有定位设置的父对象右边相关的位置
right:6px;
#T=table-layout:表格的布局
{table-layout:fixed;}
#T=top:
top:50px;
#T=z-index:对象的层叠顺序
z-index:999;
#T=visibility:或检索是否显示
visibility:visible;显示hidden隐藏;inherit;继承父对象
#T=┉━┉━┉━┉━┉━┉
#T=azimuth:设置当前声音的音场角度
azimuth:center-left;
#T=border-spacing:表格的内线距离(测试过无用)
border-spacing:1px;
#T=bottom:对象与其最近一个具有定位设置的父对象底边相关的位置
position:absolute;bottom:1in;
#T=caption-side:设置或检索表格( table )的 caption 对象是在表格的那一边
caption-side:top;width:auto;text-align:left;
#T=content:在对象前或后显示内容
content:url("beep.wav");
#T=counter-increment:当一个选择符(selector)发生时计数器增加的值
counter-increment:当一个选择符(selector)发生时计数器增加的值
#T=counter-reset:将指定选择符(selector)的计数器复位
counter-reset:将指定选择符(selector)的计数器复位
#T=cue:在对象前后播放的声音
cue:url(orchestralsneeze.wav);
#T=cue-after:在对象后播放的声音
cue-after:url(orchestralsneeze.wav);
#T=cue-before:在对象前播放的声音
cue-before:url(orchestralsneeze.wav);
#T=direction:文本从右向左显示
direction:rtl;unicode-bidi:bidi-override;
#T=elevation:当前声音的音源仰角
elevation:75deg;
#T=empty-cells:当表格的单元格无内容时是否显示该单元格的边框
empty-cells:show;
#T=font-stretch:对象中文本的文字是否横向的拉伸变形
font-stretch:wider;
#T=font-variant:对象中的文本是否为小型的大写字母
font-variant:small-caps;
#T=font-size-adjust:对象中文本的字体名称序列是否强制使用同一尺寸。
font-family:verdana,courier;font-size-adjust:.56;
#T=marks:印刷业印刷色块标记
marks: crop cross;
#T=orphans:对象内容内一定要留在一页范围底端以内的行的最少数量
orphans:4;
#T=outline:对象外的线条轮廓
outline:#E9E9E9 double thin;
#T=outline-color:对象外的线条轮廓
outline-color:orange;outline-style:solid;outline-width:medium;
#T=outline-style:对象外的线条轮廓
outline-color:orange;outline-style:solid;outline-width:medium;
#T=outline-width:对象外的线条轮廓
outline-color:orange;outline-style:solid;outline-width:medium;
#T=page:指定显示对象容器时使用的页面类型
@page doublepage{size:8.5in 11in;page-break-after:left}
body {page:doublepage;page-break-after:right}
#T=page-break-after:对象后出现的页分割符
page-break-after:always;
#T=page-break-before:对象前出现的页分割符
page-break-before:always;
#T=page-break-inside:对象容器中出现的页分割符
page-break-inside:auto;
#T=pause:对象前后的声音暂停
pause:2s;
#T=pause-after:定义对象内容被发音后的暂停
pause-after:2s;
#T=pause-before:定义对象内容发音前的暂停
pause-before:2s;
#T=pitch:音高
pitch:75hz;
#T=pitch-range:声音的平滑程度
pitch-range:80;
#T=play-during:背景音乐的播放
play-during:url(accordian.wav) mix;
#T=quotes:对象内使用的嵌套标记
quotes: """ """ "'" "'";
#T=richness:当前声音的音色
richness:75;
#T=size:纸张尺寸
size:300px 500px;
#T=speak:是否输出发声
speak:spell-out;
#T=speak-header:表格标题的发声模式
speak-header:once;
#T=speak-numeral:数字如何发音
speak-numeral:digits;
#T=speak-punctuation:标点符号如何发音
speak-punctuation:code;
#T=speech-rate:或检索发音速度
speech-rate:fast;
#T=stress:当前声音波形的最高峰值
stress:75;
#T=text-shadow:文本是否有阴影及模糊效果
{text-shadow:0px 0px 20px yellow, 0px 0px 10px orange, red 5px -5px;}
#T=unicode-bidi:文本从右向左显示
direction:rtl;
unicode-bidi:bidi-override;
#T=voice-family:或检索当前声音类型
voice-family:male;
#T=volume:或检索音量
volume:medium;
#T=widows:指定一定要留在页面顶部的行数
widows:3;
#T=┉━┉━┉━┉━┉━┉
#T=CSS中区别IE6, IE7和 IE8 的4个非常有用的字符
	在一个月前，我总结了IE条件注释，还有如何使用特殊的字符（如：星号，下划线）在你的样式表中区别 IE 6 ，IE7 和 IE8。
	今天我们再次提起这些东西，我想说的是我们在使用这些CSS Hacks的时候是否考虑到它们的安全性，毕竟它们是使用特殊风格的指令来区别一些浏览器 的，它们是暂时的解决方案，并代表未来也是这样的。假如，
	随着火狐4的发布，他们也承认带有*前缀的属性。那个时候你头疼的事就来了。
	虽然我们一般情况下是不提倡使用的，我认为如果我能找到一个真正的CSS解决方案来处理现有问题的话，我们就谨慎的使用它。如果没有办法我就毫不迟疑地使用它们。
	但是，如果把 IE条件注释 和 CSS Hacks 组合使用，也许能为我们减少不必要的麻烦。
	<!--[if lte IE 7]>
	   让IE7的快乐。
	<![endif]-->
	认识「\9」、「*」、「_」区别字符
	IE系列的浏览器可读「\9」，而IE6和IE7可读「*」(星号)，另外IE6可辨识「_」(下划线)，因此可以依照顺序写下来，就会让浏 览器正确的读取到自己看得懂得CSS语法，所以就可以有效区分IE各版本和非IE浏览器(像是Firefox、Opera、Google Chrome、Safari等)。
	IE8 及 以下的
	对于IE8 及以下的的浏览器，用一个hack,那就是在你的样式属性末尾处添加 “ \9 ” 。
	例如：
	body {
	 color: red; /*支持所有的浏览器*/
	 color : green\9; /* 支持IE8 及 以下的 */
	}
	IE7 及 以下的
	当然要使用 “ * ” ，它只有IE6和IE7可以认出来，IE8和其它的浏览器不做处理。
	body {  
	 color: red; /*支持所有的浏览器*/
	 color : green\9; /* 支持IE8 及 以下的 */
	 *color : yellow; /* 支持IE7 及 以下的  */  
	}
	最后，我们强调一个hack，在IE6没有离开我们之前，大多数设计师所熟的是“ _ ” 下划线 ，而不是“ * ” 符号。它只针对Internet Explorer 6 。
	body {
	 color: red; /* all browsers, of course */
	 color : green\9; /* IE8 and below */
	 *color : yellow; /* IE7 and below */
	 _color : orange; /* IE6 */
	}
#T=点超链接不要有鬼影
a{text-decoration:none;}
a:focus{outline:0;}
#T=强制不换行
white-space:nowrap;
#T=让Div的高度自适应
height:auto;
min-height:100%;
#T=不显示的地方用...代替
.ul li a{
	overflow:hidden;/*超出的部分隐藏起来*/
	white-space:nowrap;/*不显示的地方用省略号...代替*/
	text-overflow:ellipsis;/*支持IE*/
	-o-text-overflow:ellipsis;/*支持Opera*/
}
#T=自动完成功能
<input  type=text  autocomplete=on>打开该功能  
<input  type=text  autocomplete=off>关闭该功能    
#T=无关闭按钮IE
window.open("aa.htm", "meizz", "fullscreen=7");
#T=统一编码/解码
alert(decodeURIComponent(encodeURIComponent("http://你好.com?as= hehe")))
encodeURIComponent对":"、"/"、";" 和 "?"也编码
#T=两个按键一起按下
if(event.ctrlKey && window.event.keyCode==13)
#T=使窗口变成指定的大小
window.resizeTo(300,283);
#T=状态栏显示
<base onmouseover="window.status='网站建设';return true">
#T=文档最后修改日期
document.lastModified
#T=表格行指示
<tr onmouseover="this.bgColor='#f0f0f0'" onmouseout="this.bgColor='#ffffff'"> 
#T=title换行
obj.title = "123&#13sdfs&#32"
#T=获得时间所代表的微秒
var n1 = new Date("2004-10-10".replace(/-/g, "\/")).getTime()
#T=窗口是否关闭
win.closed
#T=checkbox扁平
<input type=checkbox style="position: absolute; clip:rect(5px 15px 15px 5px)">
#T=查看源码
<input type=button value=查看网页源代码 onclick="window.location = 'view-source:'+ 'http://www.csdn.net/'">
#T=关闭输入法
<input style="ime-mode:disabled"> 
#T=获得style内容
obj.style.cssText
#T=第一个style标签
document.styleSheets[0]
#T=style标签里的第一个样式
document.styleSheets[0].rules[0] 
#T=IFRAME透明背景
<IFRAME src="1.htm" width=300 height=180 allowtransparency></iframe> 
#T=让英文字符串超出表格宽度自动换行
word-wrap: break-word; word-break: break-all; 
#T=让input的下拉提示不出现
<input type='text' name='bind' autocomplete='off'>
#T=宽度最小150px,超过时自动宽度
{min-width:150px;width:auto;}
#T=高度最小150px,超过时自动宽度
{min-height:150px;height:auto;}
#T=背景图切割-单个
{background-image:url("Img.Gif");background-position:0px -28px;}
#T=背景图切割-循环
{background-image:url("Img.Gif");background-position:-1px -24px;background-repeat:repeat-x;}
#T=滚动条样式
{SCROLLBAR-SHADOW-COLOR:buttonface;SCROLLBAR-3DLIGHT-COLOR:buttonface;SCROLLBAR-BASE-COLOR:buttonface;SCROLLBAR-DARKSHADOW-COLOR:buttonhighlight;}
#T=把超出容器长度的内容用...表示
{width:60px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;}
#T=浮动层
{z-index:997;position:absolute;top:10%;left:10%;border:1px solid red;}
#T=将超出容器宽度的内容强制换行
{width:300px;word-wrap:break-word;border:1px solid red;}
#T=把超出容器的内容隐藏起来
{width:100px;TABLE-LAYOUT:fixed;OVERFLOW:hidden;BORDER-BOTTOM:#eeeeee 1px solid;}
#T=Border圓角
-moz-border-radius:10px 10px 10px 10px;
border:1px solid #346F97;
#T=圆角+投影,不太兼容
{-webkit-box-shadow:0px 0px 10px rgba(0, 0, 0, 0.5);-moz-box-shadow:0px 0px 10px rgba(0, 0, 0, 0.5);-moz-border-radius:5px;-webkit-border-radius:5px;background:#eee;width:328px;}
#T=盒子加投影
-moz-box-shadow:2px 2px 10px #06C;
-webkit-box-shadow:2px 2px 10px #06C;
box-shadow:2px 2px 10px #06C;
#T=文字投影
text-shadow:0 1px 0 #2595BA;
#T=關閉輸入法
ime-mode:disabled;
#T=输入的內容为小写
text-transform:lowercase;
#T=输入的內容为大写
text-transform:uppercase;
#T=將圖片拆分為16進制應用
.firebugRulerH {
    top: -15px;
    left: 0;
    width: 100%;
    height: 14px;
    background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%13%88%00%00%00%0E%08%02%00%00%00L%25a%0A%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%04%F8IDATx%DA%EC%DD%D1n%E2%3A%00E%D1%80%F8%FF%EF%E2%AF2%95%D0D4%0E%C1%14%B0%8Fa-%E9%3E%CC%9C%87n%B9%81%A6W0%1C%A6i%9A%E7y%0As8%1CT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AATE9%FE%FCw%3E%9F%AF%2B%2F%BA%97%FDT%1D~K(%5C%9D%D5%EA%1B%5C%86%B5%A9%BDU%B5y%80%ED%AB*%03%FAV9%AB%E1%CEj%E7%82%EF%FB%18%BC%AEJ8%AB%FA'%D2%BEU9%D7U%ECc0%E1%A2r%5DynwVi%CFW%7F%BB%17%7Dy%EACU%CD%0E%F0%FA%3BX%FEbV%FEM%9B%2B%AD%BE%AA%E5%95v%AB%AA%E3E5%DCu%15rV9%07%B5%7F%B5w%FCm%BA%BE%AA%FBY%3D%14%F0%EE%C7%60%0EU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5JU%88%D3%F5%1F%AE%DF%3B%1B%F2%3E%DAUCNa%F92%D02%AC%7Dm%F9%3A%D4%F2%8B6%AE*%BF%5C%C2Ym~9g5%D0Y%95%17%7C%C8c%B0%7C%18%26%9CU%CD%13i%F7%AA%90%B3Z%7D%95%B4%C7%60%E6E%B5%BC%05%B4%FBY%95U%9E%DB%FD%1C%FC%E0%9F%83%7F%BE%17%7DkjMU%E3%03%AC%7CWj%DF%83%9An%BCG%AE%F1%95%96yQ%0Dq%5Dy%00%3Et%B5'%FC6%5DS%95pV%95%01%81%FF'%07%00%00%00%00%00%00%00%00%00%F8x%C7%F0%BE%9COp%5D%C9%7C%AD%E7%E6%EBV%FB%1E%E0(%07%E5%AC%C6%3A%ABi%9C%8F%C6%0E9%AB%C0'%D2%8E%9F%F99%D0E%B5%99%14%F5%0D%CD%7F%24%C6%DEH%B8%E9rV%DFs%DB%D0%F7%00k%FE%1D%84%84%83J%B8%E3%BA%FB%EF%20%84%1C%D7%AD%B0%8E%D7U%C8Y%05%1E%D4t%EF%AD%95Q%BF8w%BF%E9%0A%BF%EB%03%00%00%00%00%00%00%00%00%00%B8vJ%8E%BB%F5%B1u%8Cx%80%E1o%5E%CA9%AB%CB%CB%8E%03%DF%1D%B7T%25%9C%D5(%EFJM8%AB%CC'%D2%B2*%A4s%E7c6%FB%3E%FA%A2%1E%80~%0E%3E%DA%10x%5D%95Uig%15u%15%ED%7C%14%B6%87%A1%3B%FCo8%A8%D8o%D3%ADO%01%EDx%83%1A~%1B%9FpP%A3%DC%C6'%9C%95gK%00%00%00%00%00%00%00%00%00%20%D9%C9%11%D0%C0%40%AF%3F%EE%EE%92%94%D6%16X%B5%BCMH%15%2F%BF%D4%A7%C87%F1%8E%F2%81%AE%AAvzr%DA2%ABV%17%7C%E63%83%E7I%DC%C6%0Bs%1B%EF6%1E%00%00%00%00%00%00%00%00%00%80cr%9CW%FF%7F%C6%01%0E%F1%CE%A5%84%B3%CA%BC%E0%CB%AA%84%CE%F9%BF)%EC%13%08WU%AE%AB%B1%AE%2BO%EC%8E%CBYe%FE%8CN%ABr%5Dy%60~%CFA%0D%F4%AE%D4%BE%C75%CA%EDVB%EA(%B7%F1%09g%E5%D9%12%00%00%00%00%00%00%00%00%00H%F6%EB%13S%E7y%5E%5E%FB%98%F0%22%D1%B2'%A7%F0%92%B1%BC%24z3%AC%7Dm%60%D5%92%B4%7CEUO%5E%F0%AA*%3BU%B9%AE%3E%A0j%94%07%A0%C7%A0%AB%FD%B5%3F%A0%F7%03T%3Dy%D7%F7%D6%D4%C0%AAU%D2%E6%DFt%3F%A8%CC%AA%F2%86%B9%D7%F5%1F%18%E6%01%F8%CC%D5%9E%F0%F3z%88%AA%90%EF%20%00%00%00%00%00%00%00%00%00%C0%A6%D3%EA%CFi%AFb%2C%7BB%0A%2B%C3%1A%D7%06V%D5%07%A8r%5D%3D%D9%A6%CAu%F5%25%CF%A2%99%97zNX%60%95%AB%5DUZ%D5%FBR%03%AB%1C%D4k%9F%3F%BB%5C%FF%81a%AE%AB'%7F%F3%EA%FE%F3z%94%AA%D8%DF%5B%01%00%00%00%00%00%00%00%00%00%8E%FB%F3%F2%B1%1B%8DWU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*UiU%C7%BBe%E7%F3%B9%CB%AAJ%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5*%AAj%FD%C6%D4%5Eo%90%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5%86%AF%1B%9F%98%DA%EBm%BBV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%AD%D6%E4%F58%01%00%00%00%00%00%00%00%00%00%00%00%00%00%40%85%7F%02%0C%008%C2%D0H%16j%8FX%00%00%00%00IEND%AEB%60%82") repeat-x;
    border-top: 1px solid #BBBBBB;
    border-right: 1px dashed #BBBBBB;
    border-bottom: 1px solid #000000;
}
#T=使用div產生類似iframe的容器
Echo '<div style="word-wrap:break-word;height:200px;overflow-x:hidden;padding:8px;width:745px;">',Nl2br(File_Get_Contents("service.txt")),'</div>';
#T=IE6显示PNG透明图片
.Div{
	width: 300px;
	height: 99px;
	background: url('images/top.png') no-repeat top;
	*background: none;
	*filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true', sizingMethod='corp', src='template/flower/images/top.png');
}
#T=<!--[if !IE]><!--> 除IE外都可识别 <!--<![endif]-->
<!--[if !IE]><!--> 除IE外都可识别 <!--<![endif]-->
<!--[if IE]> 所有的IE可识别 <![endif]-->
<!--[if IE 5.0]> 只有IE5.0可以识别 <![endif]-->
<!--[if IE 5]> 仅IE5.0与IE5.5可以识别 <![endif]-->
<!--[if gt IE 5.0]> IE5.0以及IE5.0以上版本都可以识别 <![endif]-->
<!--[if IE 6]> 仅IE6可识别 <![endif]-->
<!--[if lt IE 6]> IE6以及IE6以下版本可识别 <![endif]-->
<!--[if gte IE 6]> IE6以及IE6以上版本可识别 <![endif]-->
<!--[if IE 7]> 仅IE7可识别 <![endif]-->
<!--[if lt IE 7]> IE7以及IE7以下版本可识别 <![endif]-->
<!--[if gte IE 7]> IE7以及IE7以上版本可识别 <![endif]-->
<!--[if lte IE 6]>……<![endif]-->
lte:小于或等于IE6浏览器
#T=鼠标放在图片上会变亮
.pictures img{
filter:alpha(opacity=45);
}
.pictures a:hover img{
filter:alpha(opacity=90);
}
#T=css禁止选择文字
-moz-user-select:none;
hutia:expression(this.onselectstart=function(){return(false)});
#T=兼容各瀏覽器圓角及投影
.highlight {
    background-color: #fff34d;
    -moz-border-radius: 5px; /* FF1+ */
    -webkit-border-radius: 5px; /* Saf3-4 */
    border-radius: 5px; /* Opera 10.5, IE 9, Saf5, Chrome */
    -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* FF3.5+ */
    -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Saf3.0+, Chrome */
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Opera 10.5+, IE 9.0 */
}
#T=┉━┉━┉━┉━┉━┉
#T=IE下的Firebug
<script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script>
#T=兼容各浏览器的禁止选中内容
css style:html,body{-moz-user-select: none; -khtml-user-select: none; user-select: none;}
   这是通过CSS样式来实现的禁止用鼠标选择功能：unselectable为IE准备,onselectstart为Chrome、Safari准备,-moz-user-select是FF的
   屏蔽选择的样式定义：-moz-user-select属性（只支持ff）。
   属性有三个属性值：
   1、 none：用none,子元素所有的文字都不能选择，包括input输入框中的文字也不能选择。
   2、 -moz-all：子元素所有的文字都可以被选择，但是input输入框中的文字不可以被选择。
   3、 -moz-none：子元素所有的文字都不能选择，但是input输入框中的文字除外。   
#T=兼容各浏览器的半透明
{filter: Alpha(opacity=92);-moz-opacity:.92;opacity:0.92;}
#T=兼容FF和IE的display:inline-block;
{width:25%;display:-moz-inline-stack;*display:inline;*zoom:1;text-align:left;vertical-align:top;}
#T=兼容Ie和FF的marign
{margin:30px!important;margin:28px;}
#T=内部可滚动的盒子定义方法
td{width:500px;position:relative;}
td .box{width:500px;overflow:hidden;position:relative;z-index:2;}
#
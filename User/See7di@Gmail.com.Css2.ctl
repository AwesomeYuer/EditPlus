#TITLE=See7di.Css 2.0
#INFO
Cliptext Library for CSS2 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=Css Charset
@charset "utf-8";
#T=ǿ�Ʋ�����
white-space: nowrap;
#T=content:".";
#T=<metahttp-equivmetahttp-equiv="x-ua-compatible"content="IE=7"/>
#T=Css��Բ�ͬ�������д��
<meta http-equiv="x-ua-compatible" content="ie=7" />
IE8 ����css hack��
����"\9"����:"margin:0px auto\9;".�����"\9"������������IE��FireFox��
����"*"��IE6��IE7����ʶ��.IE8��FireFox����.
����"_"��IE6����ʶ��"_",IE7��IE8��FireFox���ܡ�

_ֻ��ie6
*ֻ��ie6,ie7
!important IE7+ FF(!important��Ҫ��ǰ��)
*+html �� *html��IE���еı�ǩ,FF��֧��.��*+html����IE7���б�ǩ.

{
background-color:#FF0000 !important;/*IE8��Firefox��Opera��Safari*/
*background-color:#00FF00 !important;/*IE7(IE7��ʶ��important)*/
*background-color:#0000FF;/*IE7*/
background-color:#000000;/*IE6(IE6�Բ�ʶ��important)*/
_background-color:#000000;/*IE6(IE7,IE8,FF,Opera,Safari����֧���»���)*/
width: 100px !important; /*IE7+ FF(!important��Ҫ��ǰ��)*/
width: 80px; /*IE6*/
}


���� float �պ�(�ǳ���Ҫ!)
�����´������Global CSS ��,����Ҫ�պϵ�div���� class="clearfix"����,���Բ�ˬ.
<style>
/*Clear Fix*/
{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-block;}
.clearfix{display:block;}
/*End Fix*/
</style>
�����������ݼ���
1,FF�¸�div����padding��ᵼ��width��height����,��IE����.(����!important���)
2,��������.
1).��ֱ����.��line-height����Ϊ��ǰdiv��ͬ�ĸ߶�,��ͨ��vertical-align:middle.(ע�����ݲ�Ҫ����.)
2).ˮƽ����.margin:0 auto;(��Ȼ��������)
3,�����a��ǩ�����ݼ�����ʽ,��Ҫ����display:block;(�����ڵ�����ǩ)
4,FF��IE��BOX���Ĳ��쵼�����2px�Ļ�����Ϊfloat��div��ie��margin�ӱ�������.
5,ul��ǩ��FF����Ĭ����list-style��padding.�����������,�Ա��ⲻ��Ҫ���鷳.(�����ڵ�����ǩ�������б�)
6,��Ϊ�ⲿwrapper��div��Ҫ�����߶�,��û�����overflow:hidden.�Դﵽ�߶�����Ӧ.
1���firefox ie6 ie7��css��ʽ
���ڴ󲿷ֶ�����!important��hack������ie6��firefox���Կ���������ʾ��
����ie7��!important������ȷ���ͣ��ᵼ��ҳ��û��Ҫ����ʾ���ҵ�һ����
��IE7�����hack��ʽ����ʹ�á�*+html����������IE7���һ�£�Ӧ��û�������ˡ�
����дһ��CSS����������
^#1{color:#333;}/*Moz*/
*html #1{color:#666;}/*IE6*/
*+html #1{color:#999;}/*IE7*/
��ô��firefox��������ɫ��ʾΪ#333��IE6��������ɫ��ʾΪ#666��IE7��������ɫ��ʾΪ#999��
2css�����еľ�������
��Ҫ����ʽ�������£�
body{TEXT-ALIGN:center;}
^#center{MARGIN-RIGHT:auto;MARGIN-LEFT:auto;}
˵����
�����ڸ���Ԫ�ض���TEXT-ALIGN:center;�������˼�����ڸ���Ԫ���ڵ����ݾ��У�����IE�����趨���Ѿ������ˡ�
����mozilla�в��ܾ��С�����취��������Ԫ�ض���ʱ���趨ʱ�ټ��ϡ�MARGIN-RIGHT:auto;MARGIN-LEFT:auto;��
��Ҫ˵�����ǣ�����������������ʹ����ҳ��Ҫ���У����鲻Ҫ����һ��DIV���������β�����div��
ֻҪ��ÿ�������div�ﶨ��MARGIN-RIGHT:auto;MARGIN-LEFT:auto;�Ϳ����ˡ�
3��ģ�Ͳ�ͬ����.
^#box{width:600px;//for ie6.0- width:500px; //for ff+ie6.0}
^#box{ width:600px!important //for ff width:600px; //for ff+ie6.0 width /**/:500px; //for ie6.0-}
4 ����ie������˫������
^#box{ float:left; width:100px; margin:0 0 0 100px; //�������֮��IE�����200px�ľ��� display:inline; //ʹ��������}
����ϸ˵һ��block,inline����Ԫ��,BlockԪ�ص��ص���:�����������Ͽ�ʼ,�߶�,���,�и�,�߾඼���Կ���(��Ԫ��);InlineԪ�ص��ص���:������Ԫ����ͬһ����,�����ɿ���(��ǶԪ��);
^#box{ display:block; //����Ϊ��ǶԪ��ģ��Ϊ��Ԫ�� display:inline; //ʵ��ͬһ�����еĵ�Ч�� diplay:table;
5 IE���Ⱥ͸߶ȵ�����
IE���ϵ�min-������壬��ʵ��������������width��height������min�������ʹ����������ʹ��ˣ����ֻ�ÿ�Ⱥ͸߶ȣ�
�������������������ֵ�Ͳ���䣬���ֻ��min-width��min-height�Ļ���IE�����������û�����ÿ�Ⱥ͸߶ȡ�
����Ҫ���ñ���ͼƬ���������ǱȽ���Ҫ�ġ�Ҫ���������⣬����������
^#box{ width: 80px; height: 35px;}html>body #box{ width: auto; height: auto; min-width: 80px; min-height: 35px;}
6 ҳ�����С���
min-width�Ǹ��ǳ������CSS���������ָ��Ԫ����СҲ����С��ĳ����ȣ��������ܱ�֤�Ű�һֱ��ȷ����IE���ϵ������
����ʵ���ϰ�width������С�����ʹ��Ϊ������һ������IE��Ҳ���ã����԰�һ��<div> �ŵ� <body> ��ǩ�£�Ȼ��Ϊdivָ��һ���ࣺ
Ȼ��CSS������ƣ�
^#container{ min-width: 600px; width:expression(document.body.clientWidth < 600? ��600px��: ��auto�� );}
��һ��min-width�������ģ�����2�е�widthʹ����Javascript����ֻ��IE���ϵã���Ҳ�������HTML�ĵ���̫���档��ʵ����ͨ��Javascript���ж���ʵ����С��ȡ�
7 �������
.hackbox{ display:table; //��������Ϊ��Ԫ�ؼ��ı����ʾ}����.hackbox{ clear:both;}
���߼���:after��α����,�����ڶ�����������ݣ�ͨ����content���ʹ�ã�IE��֧�ִ�α���󣬷�Ie �����֧�֣�
���Բ���Ӱ�쵽IE/WIN����������ֵ����鷳�ġ���#box:after{ content: ��.��; display: block; height: 0; clear: both; visibility: hidden;}
8 DIV����IE�ı�����3���ص�bug
��߶��󸡶����ұ߲����ⲹ������߾�����λ���ұ߶����ڵ��ı����������3px�ļ��.
^#box{ float:left; width:800px;}#left{ float:left; width:50%;}#right{ width:50%;}*html #left{ margin-right:-3px; //����ǹؼ�}
HTML����<div id=��box��> <div id=��left��></div> <div id=��right��></div></div>
9 ����ѡ����(����������Ǽ���,������css��һ��bug)
p[id]{}div[id]{}
�������IE6.0��IE6.0���µİ汾������,FF��OPera����
����ѡ��������ѡ���������������,��ѡ�����ķ�Χ����ʽ��˵��С��,����ѡ�����ķ�Χ�Ƚϴ�,��p[id]��,����p��ǩ����id�Ķ���ͬ��ʽ��.
10 IE׽�Բص�����
��divӦ�ø��ӵ�ʱ��ÿ����������һЩ���ӣ�DIV�����ʱ�����׷���׽�Բص����⡣
��Щ������ʾ�������������ѡ����������Ƿ�������ȷʵ��ҳ�档
����취����#layoutʹ��line-height���� ���߸�#layoutʹ�ù̶��ߺͿ�ҳ��ṹ�����򵥡�
11 �߶Ȳ���Ӧ
�߶Ȳ���Ӧ�ǵ��ڲ����ĸ߶ȷ����仯ʱ���߶Ȳ����Զ����е��ڣ��ر��ǵ��ڲ����ʹ��
margin ��paddign ʱ��
����
<div id=��box��>
<p>p�����е�����</p>
</div>
CSS��#box {background-color:#eee; }
^#box p {margin-top: 20px;margin-bottom: 20px; text-align:center; }
�����������P�������¸���2���յ�div����CSS���룺.1{height:0px;overflow:hidden;}����ΪDIV����border���ԡ�
����������д��
���ã�
.main{ float:left;#float:none;_float:none;html*.main{ float:left;#float:none;_float:none; }*+html .main{ float:left;#float:none;_float:none; }
* html .main{ float:left;#float:none;_float:none; }��1�и�Firefox�Լ������������ 
��2�и�safari/IE6/iE7�������safari/IE6/iE7 �Ӿ�Ч����ͳһ����Ҫ�ں����IE6/IE7�Ķ��� 
��3�и�IE7�� 
��4�и�IE6�Լ����ϵİ汾�� 
���ã�
.main{ float:left;#float:none;_float:none;[float:none;]float:none; }��1��float��Firefox�Լ������������ 
��2����#��float��IE7�� 
��3����_��float��IE6�Լ����ϵİ汾�� 
��4����[��float��safari�� 
��5����]��float��IE�� 
���ֳ��������ʹ�õ��ں� (Rendering Engine) 
Mozilla Firefox ( Gecko )
Internet Explorer ( Trident )
Opera ( Presto )
Konqueror ( KHTML )
Safari Swift ( WebKit )
��css�Զ����س���������ݲ�ʡ����ʾ�����������ie��ff
text-overflow:ellipsis;
-o-text-overflow:ellipsis;
-icab-text-overflow: ellipsis;
-khtml-text-overflow: ellipsis;
-moz-text-overflow: ellipsis;
-webkit-text-overflow: ellipsis; ���˷��ˣ���֧�ֵĶ�֧�֣���������ƭС���ѵΡ�������IE���������˽�����Զ�����-xxx-������ʼ��-o-������PrestoΪ����� Opera˽�еġ�-icab-��iCab˽�еģ�-khtml-������KHTMLΪ��������������Konqueror Safari����-moz-������mozilla��GeckoΪ��������������Firefox��mozilla����-webkit-������Webkit ��Ⱦ���棨��KHTML��������Ʒ�������������Safari��Swift����
������˵��-moz-text-overflow�������ã�����һ�������д������һ��������Ŀ�����Ա�����������֧��һ�ֻ�û�õ����ϵ�����ʱ��һ�㶼�������Ե�ǰ�����-xxx-���֣��������������ڸ������˽�е����ԣ���Ȼ����Щ���Զ�������CSS3�ģ�ʹ��������д���������������Ҳ���������
IE��Firefox��Opera��Safari��CSS��ʽimportant��*��֧��
#T=��͸����Բ�ǵĸ�����,���ݸ��������
background-image:url('source/plugin/google_api_map_note/images/opbg.png');behavior:url('source/plugin/google_api_map_note/images/pie.htc');filter:Alpha(opacity=80);-moz-opacity:.8;opacity:0.8;border-radius:10px 10px 10px 10px;color:#FFFFFF;padding:15px;position:absolute;margin-left:80px;margin-top:-450px;max-width:680px;z-index:100;display:none;
#T= 

#T=font:����
{font:30px arial;}
{font:oblique solid 24px;}
{font:15pt/17pt bold "Arial" normal;}
{font:italic small-caps bold 12px 22px Verdana;}
#T=font-family:�������
font-family:Verdana,arial,Times,serif;
#T=font-style:������[normal | italic | oblique]
font-style:normal;
#T=font-variant:�������[normal | small-caps]
font-variant:small-caps;
#T=font-weight:����Ӵ�[normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900]
font-weight:bold;
#T=font-size:�����С
font-size:12px;
#T= 
 
#T=color:��ɫ
color:#DDDDDD;
#T=background:������ʽ[<������ɫ> || <����ͼ��> || || <��������> || <����λ��>]
{background:red no-repeat scroll 5% 60%;}
{background:url("bg.gif") repeat-y;}
{background:url("bg.gif") top;}
#T=background-color:������ɫ[��ɫ | transparent]
background-color:transparent;
#T=background-image:����ͼ��
background-image:url("bg.jpg");
#T=background-repeat:�����ظ�[repeat | repeat-x | repeat-y | no-repeat]
background-repeat:repeat-x;
#T=background-attachment:�����Ƿ�L��[scroll(����) | fixed(�̶�)]
background-attachment:fixed;
#T=background-position:����ͼ��λ��[[�ٷֱ� | <����> ]{1,2} | [top | center | bottom] || [left | center | right]]
background:url("bg.gif");background-position:bottom 10px;
#T= 
 
#T=border:�߿�[<�߿���> || <�߿�ʽ��> || <��ɫ>]
border:1px dashed #666666;
#T=border-width:�߿���[thin | medium | thick | <����>]
border-width:1px;
#T=border-color:�߿���ɫ[<��ɫ>{1,4}]
border-color:#DDDDDD;
#T=border-style:�߿���[[ none | dotted | dashed | solid | double | groove | ridge | inset | outset ]{1,4}]
border-style:dashed;
#T=border-collapse:���������ߺϲ�Ϊ1px
border-collapse:collapse;
#T=border-spacing:1px;�ஔ��cellspacing='1'
border-spacing:1px;
#T=border-radius:3px;�A��
border-radius:3px;
#T= 
 
#T=margin:�ⲿ�߽�[<����> | <�ٷֱ�> | auto]
margin:0px auto;
#T=margin-bottom:�±߽�
margin-bottom:5px;
#T=padding:�Ȳ�����[[ <����> | <�ٷֱ�> ]{1,4}]
padding:5px;
#T=padding-bottom:�²�����
padding-bottom:10px;
#T= 
 
#T=width:���[<����> | <�ٷֱ�> | auto]
width:500px;
#T=height:�߶�[<����> | auto]
height:500px;
#T=float:Ư��[left | right | none]
float:Left;
#T=clear:���[none | left | right | both]
clear:both;
#T= 
 
#T=line-height:�и�[normal | <����> | <����> | �ٷֱ�]
line-height:24px;
#T=word-spacing:���ּ��[normal | <����>]
word-spacing:-0.2em;
#T=letter-spacing:��ĸ���[normal | <����>]
letter-spacing:0.1em;
#T=text-decoration:��������[none | [ underline || overline || line-through || blink ]
text-decoration:underline;
#T=vertical-align:������뷽ʽ[baseline | sub | super | top | text-top | middle | bottom | text-bottom | �ٷֱ�]
vertical-align:text-top;
#T=text-transform:�ı��Ĵ�Сд[none | Capitalize | UPPERCASE | lowercase]
text-transform:capitalize;
#T=text-align:�ı�����[left | right | center | justify]
text-align:left;
#T=text-indent:�ı�����[<����> | <�ٷֱ�>]
text-indent:10px;
#T= 
 
#T=display:��ʾ[block(��Ԫ�ص�ǰ�ͺ󶼻��л���) | inline(��Ԫ�ص�ǰ�ͺ󶼲����л���) | list-item | none]
display:none;
�հ�
#T=white-space:�ո��ַ��Ĵ���ʽ,������[normal(������ո��۵���һ��) | pre(���۵��ո�) | nowrap(�������У���������<BR>���)]
white-space:nowrap;
#T=list-style:�б���Ŀ����ʽ[<Ŀ¼��ʽ����> || <Ŀ¼��ʽλ��> || <url>]
list-style:outside upper-roman;
#T=list-style-type:�б�����ʽ����[disc | circle | square | decimal | lower-roman | upper-roman | lower-alpha | upper-alpha | none]
list-style-type:none;
#T=list-style-image:Ŀ¼��ʽͼ��[<url> | none]
list-style-position:outside;list-style-image:url("images/ie.gif");
#T=list-style-position:Ŀ¼��ʽλ��[inside | outside]
display:list-item;list-style-position:inside;
#T= 
 
#T=clip:���ö���Ŀ�������
position:absolute;clip:rect(50px,auto,auto,auto);
#T=cursor:
cursor:pointer;
#T=left:
left:24px;
#T=marker-offset:��������������һ�ߵļ��
marker-offset:5px;
#T=max-height:��������߶�
max-height:200px;
#T=max-width:����������
max-width:200px;
#T=min-height:�������С�߶�
min-height:200px;
#T=min-width:�������С���
min-width:200px;
#T=overflow:
overflow:hidden;
#T=overflow-x:
overflow-x:hidden;
#T=overflow-y:
overflow-y:hidden;
#T=position:����Ķ�λ��ʽ
position:absolute;����ɲ��relative;���󲻿ɲ��
#T=right:�����������һ�����ж�λ���õĸ������ұ���ص�λ��
right:6px;
#T=table-layout:���Ĳ���
{table-layout:fixed;}
#T=top:
top:50px;
#T=z-index:����Ĳ��˳��
z-index:999;
#T=visibility:������Ƿ���ʾ
visibility:visible;��ʾhidden����;inherit;�̳и�����
#T=����������������������
#T=azimuth:���õ�ǰ�����������Ƕ�
azimuth:center-left;
#T=border-spacing:�������߾���(���Թ�����)
border-spacing:1px;
#T=bottom:�����������һ�����ж�λ���õĸ�����ױ���ص�λ��
position:absolute;bottom:1in;
#T=caption-side:���û�������( table )�� caption �������ڱ�����һ��
caption-side:top;width:auto;text-align:left;
#T=content:�ڶ���ǰ�����ʾ����
content:url("beep.wav");
#T=counter-increment:��һ��ѡ���(selector)����ʱ���������ӵ�ֵ
counter-increment:��һ��ѡ���(selector)����ʱ���������ӵ�ֵ
#T=counter-reset:��ָ��ѡ���(selector)�ļ�������λ
counter-reset:��ָ��ѡ���(selector)�ļ�������λ
#T=cue:�ڶ���ǰ�󲥷ŵ�����
cue:url(orchestralsneeze.wav);
#T=cue-after:�ڶ���󲥷ŵ�����
cue-after:url(orchestralsneeze.wav);
#T=cue-before:�ڶ���ǰ���ŵ�����
cue-before:url(orchestralsneeze.wav);
#T=direction:�ı�����������ʾ
direction:rtl;unicode-bidi:bidi-override;
#T=elevation:��ǰ��������Դ����
elevation:75deg;
#T=empty-cells:�����ĵ�Ԫ��������ʱ�Ƿ���ʾ�õ�Ԫ��ı߿�
empty-cells:show;
#T=font-stretch:�������ı��������Ƿ������������
font-stretch:wider;
#T=font-variant:�����е��ı��Ƿ�ΪС�͵Ĵ�д��ĸ
font-variant:small-caps;
#T=font-size-adjust:�������ı����������������Ƿ�ǿ��ʹ��ͬһ�ߴ硣
font-family:verdana,courier;font-size-adjust:.56;
#T=marks:ӡˢҵӡˢɫ����
marks: crop cross;
#T=orphans:����������һ��Ҫ����һҳ��Χ�׶����ڵ��е���������
orphans:4;
#T=outline:���������������
outline:#E9E9E9 double thin;
#T=outline-color:���������������
outline-color:orange;outline-style:solid;outline-width:medium;
#T=outline-style:���������������
outline-color:orange;outline-style:solid;outline-width:medium;
#T=outline-width:���������������
outline-color:orange;outline-style:solid;outline-width:medium;
#T=page:ָ����ʾ��������ʱʹ�õ�ҳ������
@page doublepage{size:8.5in 11in;page-break-after:left}
body {page:doublepage;page-break-after:right}
#T=page-break-after:�������ֵ�ҳ�ָ��
page-break-after:always;
#T=page-break-before:����ǰ���ֵ�ҳ�ָ��
page-break-before:always;
#T=page-break-inside:���������г��ֵ�ҳ�ָ��
page-break-inside:auto;
#T=pause:����ǰ���������ͣ
pause:2s;
#T=pause-after:����������ݱ����������ͣ
pause-after:2s;
#T=pause-before:����������ݷ���ǰ����ͣ
pause-before:2s;
#T=pitch:����
pitch:75hz;
#T=pitch-range:������ƽ���̶�
pitch-range:80;
#T=play-during:�������ֵĲ���
play-during:url(accordian.wav) mix;
#T=quotes:������ʹ�õ�Ƕ�ױ��
quotes: """ """ "'" "'";
#T=richness:��ǰ��������ɫ
richness:75;
#T=size:ֽ�ųߴ�
size:300px 500px;
#T=speak:�Ƿ��������
speak:spell-out;
#T=speak-header:������ķ���ģʽ
speak-header:once;
#T=speak-numeral:������η���
speak-numeral:digits;
#T=speak-punctuation:��������η���
speak-punctuation:code;
#T=speech-rate:����������ٶ�
speech-rate:fast;
#T=stress:��ǰ�������ε���߷�ֵ
stress:75;
#T=text-shadow:�ı��Ƿ�����Ӱ��ģ��Ч��
{text-shadow:0px 0px 20px yellow, 0px 0px 10px orange, red 5px -5px;}
#T=unicode-bidi:�ı�����������ʾ
direction:rtl;
unicode-bidi:bidi-override;
#T=voice-family:�������ǰ��������
voice-family:male;
#T=volume:���������
volume:medium;
#T=widows:ָ��һ��Ҫ����ҳ�涥��������
widows:3;
#T=����������������������
#T=CSS������IE6, IE7�� IE8 ��4���ǳ����õ��ַ�
	��һ����ǰ�����ܽ���IE����ע�ͣ��������ʹ��������ַ����磺�Ǻţ��»��ߣ��������ʽ�������� IE 6 ��IE7 �� IE8��
	���������ٴ�������Щ����������˵����������ʹ����ЩCSS Hacks��ʱ���Ƿ��ǵ����ǵİ�ȫ�ԣ��Ͼ�������ʹ���������ָ��������һЩ����� �ģ���������ʱ�Ľ��������������δ��Ҳ�������ġ����磬
	���Ż��4�ķ���������Ҳ���ϴ���*ǰ׺�����ԡ��Ǹ�ʱ����ͷ�۵��¾����ˡ�
	��Ȼ����һ��������ǲ��ᳫʹ�õģ�����Ϊ��������ҵ�һ��������CSS���������������������Ļ������Ǿͽ�����ʹ���������û�а취�Ҿͺ������ɵ�ʹ�����ǡ�
	���ǣ������ IE����ע�� �� CSS Hacks ���ʹ�ã�Ҳ����Ϊ���Ǽ��ٲ���Ҫ���鷳��
	<!--[if lte IE 7]>
	   ��IE7�Ŀ��֡�
	<![endif]-->
	��ʶ��\9������*������_�������ַ�
	IEϵ�е�������ɶ���\9������IE6��IE7�ɶ���*��(�Ǻ�)������IE6�ɱ�ʶ��_��(�»���)����˿�������˳��д�������ͻ���� ������ȷ�Ķ�ȡ���Լ����ö���CSS�﷨�����ԾͿ�����Ч����IE���汾�ͷ�IE�����(����Firefox��Opera��Google Chrome��Safari��)��
	IE8 �� ���µ�
	����IE8 �����µĵ����������һ��hack,�Ǿ����������ʽ����ĩβ����� �� \9 �� ��
	���磺
	body {
	 color: red; /*֧�����е������*/
	 color : green\9; /* ֧��IE8 �� ���µ� */
	}
	IE7 �� ���µ�
	��ȻҪʹ�� �� * �� ����ֻ��IE6��IE7�����ϳ�����IE8���������������������
	body {  
	 color: red; /*֧�����е������*/
	 color : green\9; /* ֧��IE8 �� ���µ� */
	 *color : yellow; /* ֧��IE7 �� ���µ�  */  
	}
	�������ǿ��һ��hack����IE6û���뿪����֮ǰ����������ʦ������ǡ� _ �� �»��� �������ǡ� * �� ���š���ֻ���Internet Explorer 6 ��
	body {
	 color: red; /* all browsers, of course */
	 color : green\9; /* IE8 and below */
	 *color : yellow; /* IE7 and below */
	 _color : orange; /* IE6 */
	}
#T=�㳬���Ӳ�Ҫ�й�Ӱ
a{text-decoration:none;}
a:focus{outline:0;}
#T=ǿ�Ʋ�����
white-space:nowrap;
#T=��Div�ĸ߶�����Ӧ
height:auto;
min-height:100%;
#T=����ʾ�ĵط���...����
.ul li a{
	overflow:hidden;/*�����Ĳ�����������*/
	white-space:nowrap;/*����ʾ�ĵط���ʡ�Ժ�...����*/
	text-overflow:ellipsis;/*֧��IE*/
	-o-text-overflow:ellipsis;/*֧��Opera*/
}
#T=�Զ���ɹ���
<input  type=text  autocomplete=on>�򿪸ù���  
<input  type=text  autocomplete=off>�رոù���    
#T=�޹رհ�ťIE
window.open("aa.htm", "meizz", "fullscreen=7");
#T=ͳһ����/����
alert(decodeURIComponent(encodeURIComponent("http://���.com?as= hehe")))
encodeURIComponent��":"��"/"��";" �� "?"Ҳ����
#T=��������һ����
if(event.ctrlKey && window.event.keyCode==13)
#T=ʹ���ڱ��ָ���Ĵ�С
window.resizeTo(300,283);
#T=״̬����ʾ
<base onmouseover="window.status='��վ����';return true">
#T=�ĵ�����޸�����
document.lastModified
#T=�����ָʾ
<tr onmouseover="this.bgColor='#f0f0f0'" onmouseout="this.bgColor='#ffffff'"> 
#T=title����
obj.title = "123&#13sdfs&#32"
#T=���ʱ���������΢��
var n1 = new Date("2004-10-10".replace(/-/g, "\/")).getTime()
#T=�����Ƿ�ر�
win.closed
#T=checkbox��ƽ
<input type=checkbox style="position: absolute; clip:rect(5px 15px 15px 5px)">
#T=�鿴Դ��
<input type=button value=�鿴��ҳԴ���� onclick="window.location = 'view-source:'+ 'http://www.csdn.net/'">
#T=�ر����뷨
<input style="ime-mode:disabled"> 
#T=���style����
obj.style.cssText
#T=��һ��style��ǩ
document.styleSheets[0]
#T=style��ǩ��ĵ�һ����ʽ
document.styleSheets[0].rules[0] 
#T=IFRAME͸������
<IFRAME src="1.htm" width=300 height=180 allowtransparency></iframe> 
#T=��Ӣ���ַ�������������Զ�����
word-wrap: break-word; word-break: break-all; 
#T=��input��������ʾ������
<input type='text' name='bind' autocomplete='off'>
#T=�����С150px,����ʱ�Զ����
{min-width:150px;width:auto;}
#T=�߶���С150px,����ʱ�Զ����
{min-height:150px;height:auto;}
#T=����ͼ�и�-����
{background-image:url("Img.Gif");background-position:0px -28px;}
#T=����ͼ�и�-ѭ��
{background-image:url("Img.Gif");background-position:-1px -24px;background-repeat:repeat-x;}
#T=��������ʽ
{SCROLLBAR-SHADOW-COLOR:buttonface;SCROLLBAR-3DLIGHT-COLOR:buttonface;SCROLLBAR-BASE-COLOR:buttonface;SCROLLBAR-DARKSHADOW-COLOR:buttonhighlight;}
#T=�ѳ����������ȵ�������...��ʾ
{width:60px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;}
#T=������
{z-index:997;position:absolute;top:10%;left:10%;border:1px solid red;}
#T=������������ȵ�����ǿ�ƻ���
{width:300px;word-wrap:break-word;border:1px solid red;}
#T=�ѳ���������������������
{width:100px;TABLE-LAYOUT:fixed;OVERFLOW:hidden;BORDER-BOTTOM:#eeeeee 1px solid;}
#T=Border�A��
-moz-border-radius:10px 10px 10px 10px;
border:1px solid #346F97;
#T=Բ��+ͶӰ,��̫����
{-webkit-box-shadow:0px 0px 10px rgba(0, 0, 0, 0.5);-moz-box-shadow:0px 0px 10px rgba(0, 0, 0, 0.5);-moz-border-radius:5px;-webkit-border-radius:5px;background:#eee;width:328px;}
#T=���Ӽ�ͶӰ
-moz-box-shadow:2px 2px 10px #06C;
-webkit-box-shadow:2px 2px 10px #06C;
box-shadow:2px 2px 10px #06C;
#T=����ͶӰ
text-shadow:0 1px 0 #2595BA;
#T=�P�]ݔ�뷨
ime-mode:disabled;
#T=����ă���ΪСд
text-transform:lowercase;
#T=����ă���Ϊ��д
text-transform:uppercase;
#T=���DƬ��֞�16�M�Ƒ���
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
#T=ʹ��div�a�����iframe������
Echo '<div style="word-wrap:break-word;height:200px;overflow-x:hidden;padding:8px;width:745px;">',Nl2br(File_Get_Contents("service.txt")),'</div>';
#T=IE6��ʾPNG͸��ͼƬ
.Div{
	width: 300px;
	height: 99px;
	background: url('images/top.png') no-repeat top;
	*background: none;
	*filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true', sizingMethod='corp', src='template/flower/images/top.png');
}
#T=<!--[if !IE]><!--> ��IE�ⶼ��ʶ�� <!--<![endif]-->
<!--[if !IE]><!--> ��IE�ⶼ��ʶ�� <!--<![endif]-->
<!--[if IE]> ���е�IE��ʶ�� <![endif]-->
<!--[if IE 5.0]> ֻ��IE5.0����ʶ�� <![endif]-->
<!--[if IE 5]> ��IE5.0��IE5.5����ʶ�� <![endif]-->
<!--[if gt IE 5.0]> IE5.0�Լ�IE5.0���ϰ汾������ʶ�� <![endif]-->
<!--[if IE 6]> ��IE6��ʶ�� <![endif]-->
<!--[if lt IE 6]> IE6�Լ�IE6���°汾��ʶ�� <![endif]-->
<!--[if gte IE 6]> IE6�Լ�IE6���ϰ汾��ʶ�� <![endif]-->
<!--[if IE 7]> ��IE7��ʶ�� <![endif]-->
<!--[if lt IE 7]> IE7�Լ�IE7���°汾��ʶ�� <![endif]-->
<!--[if gte IE 7]> IE7�Լ�IE7���ϰ汾��ʶ�� <![endif]-->
<!--[if lte IE 6]>����<![endif]-->
lte:С�ڻ����IE6�����
#T=������ͼƬ�ϻ����
.pictures img{
filter:alpha(opacity=45);
}
.pictures a:hover img{
filter:alpha(opacity=90);
}
#T=css��ֹѡ������
-moz-user-select:none;
hutia:expression(this.onselectstart=function(){return(false)});
#T=���ݸ��g�[���A�Ǽ�ͶӰ
.highlight {
    background-color: #fff34d;
    -moz-border-radius: 5px; /* FF1+ */
    -webkit-border-radius: 5px; /* Saf3-4 */
    border-radius: 5px; /* Opera 10.5, IE 9, Saf5, Chrome */
    -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* FF3.5+ */
    -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Saf3.0+, Chrome */
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Opera 10.5+, IE 9.0 */
}
#T=����������������������
#T=IE�µ�Firebug
<script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script>
#T=���ݸ�������Ľ�ֹѡ������
css style:html,body{-moz-user-select: none; -khtml-user-select: none; user-select: none;}
   ����ͨ��CSS��ʽ��ʵ�ֵĽ�ֹ�����ѡ���ܣ�unselectableΪIE׼��,onselectstartΪChrome��Safari׼��,-moz-user-select��FF��
   ����ѡ�����ʽ���壺-moz-user-select���ԣ�ֻ֧��ff����
   ��������������ֵ��
   1�� none����none,��Ԫ�����е����ֶ�����ѡ�񣬰���input������е�����Ҳ����ѡ��
   2�� -moz-all����Ԫ�����е����ֶ����Ա�ѡ�񣬵���input������е����ֲ����Ա�ѡ��
   3�� -moz-none����Ԫ�����е����ֶ�����ѡ�񣬵���input������е����ֳ��⡣   
#T=���ݸ�������İ�͸��
{filter: Alpha(opacity=92);-moz-opacity:.92;opacity:0.92;}
#T=����FF��IE��display:inline-block;
{width:25%;display:-moz-inline-stack;*display:inline;*zoom:1;text-align:left;vertical-align:top;}
#T=����Ie��FF��marign
{margin:30px!important;margin:28px;}
#T=�ڲ��ɹ����ĺ��Ӷ��巽��
td{width:500px;position:relative;}
td .box{width:500px;overflow:hidden;position:relative;z-index:2;}
#
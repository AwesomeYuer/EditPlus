#TITLE=XSLT 1.0
#INFO
XSLT 1.0 Auto Completion clips.

Completion prefixes:
	xsl -- XSLT element
	el  -- HTML element
Completion suffixes:
	as  -- XSLT attribute
	is  -- HTML attribute
	--  -- XSLT attribute helper

Author: Welman Jordan (Zuo Weiming)
Contact: wmjordan(at)163[dot]com

#SORT=n

#T=--
<!--^!-->
#T=CDATA
<![CDATA[^!]]>
#T=_____________________
^!
#T=XSLT Elements
^!
#T=xslapply
<xsl:apply-templates select="^!"/>
#T=xslapplyall
<xsl:apply-templates />
#T=xslapplywith
<xsl:apply-templates select="^!">
	<xsl:with-param name="" select=""/>
</xsl:apply-templates>
#T=xslapplyimports
<xsl:apply-imports />
#T=xslattr
<xsl:attribute name="^!"></xsl:attribute>
#T=xslattribute
<xsl:attribute name="^!"></xsl:attribute>
#T=xslattrset
<xsl:attribute-set name="^!">
	
</xsl:attribute-set>
#T=xslattributeset
<xsl:attribute-set name="^!">
	
</xsl:attribute-set>
#T=xslcall
<xsl:call-template name="^!"/>
#T=xslcallwith
<xsl:call-template name="^!">
	<xsl:with-param name="" select=""/>
</xsl:call-template>
#T=xslchoose
<xsl:choose>
	<xsl:when test="^!">
		
	</xsl:when>
</xsl:choose>
#T=xslcomment
<xsl:comment>
	^!
</xsl:comment>
#T=xslcopy
<xsl:copy>
	^!
</xsl:copy>
#T=xslcopyof
<xsl:copy-of select="^!" />
#T=xsldecimal
<xsl:decimal-format name="^!" />
#T=xslele
<xsl:element name="^!">
	
</xsl:element>
#T=xslelement
<xsl:element name="^!">
	
</xsl:element>
#T=xslfallback
<xsl:fallback>
	^!
</xsl:fallback>
#T=xslfor
<xsl:for-each select="^!">
	
</xsl:for-each>
#T=xslforeach
<xsl:for-each select="^!">
	
</xsl:for-each>
#T=xslif
<xsl:if test="^!">
	
</xsl:if>
#T=xslimport
<xsl:import href="^!.xsl" />
#T=xslinclude
<xsl:include href="^!.xsl" />
#T=xslkey
<xsl:key name="^!" match="" use="" />
#T=xslmessage
<xsl:message terminate="yes">
	^!
</xsl:message>
#T=xslnamespace
<xsl:namespace-alias stylesheet-prefix="^!" result-prefix=""/>
#T=xslnum
<xsl:number count="^!"/>
#T=xslnumber
<xsl:number count="^!" level="multiple" from="" format="" />
#T=xslother
<xsl:otherwise>
	^!
</xsl:otherwise>
#T=xslotherwise
<xsl:otherwise>
	^!
</xsl:otherwise>
#T=xslout
<xsl:output method="^!"/>
#T=xsloutput
<xsl:output method="^!" indent="yes" encoding=""/>
#T=xsloutxml
<xsl:output method="xml" indent="yes" encoding="^!"/>
#T=xsloutputxml
<xsl:output method="xml" indent="yes" encoding="^!"/>
#T=xslouthtml
<xsl:output method="html" indent="yes" media-type="text/html; charset=^!gb2312"/>
#T=xsloutputhtml
<xsl:output method="html" indent="yes" media-type="text/html; charset=^!gb2312"/>
#T=xslouttext
<xsl:output method="text" encoding="^!"/>
#T=xsloutputtext
<xsl:output method="text" encoding="^!"/>
#T=xslparam
<xsl:param name="^!"/>
#T=xslpreserve
<xsl:preserve-space elements="^!"/>
#T=xslprocess
<xsl:processing-instruction name="^!">
	
</xsl:processing-instruction>
#T=xslsort
<xsl:sort select="^!" data-type="text" order="ascending" />
#T=xslsortnum
<xsl:sort select="^!" data-type="number" order="ascending" />
#T=xslstrip
<xsl:strip-space elements="^!"/>
#T=xslstylesheet
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		^!
	</xsl:template>
</xsl:stylesheet>
#T=xsltemplate
<xsl:template match="^!">
	
</xsl:template>
#T=xsltemplatename
<xsl:template name="^!">
	
</xsl:template>
#T=xsltext
<xsl:text>^!</xsl:text>
#T=xsltext-
<xsl:text disable-output-escaping="yes">^!</xsl:text>
#T=xsltextdisable
<xsl:text disable-output-escaping="yes">^!</xsl:text>
#T=xsltransform
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	^!
</xsl:transform>
#T=xsluse
xsl:use-attribute-sets="^!"
#T=xslval
<xsl:value-of select="^!"/>
#T=xslvalue
<xsl:value-of select="^!"/>
#T=xslvalue-
<xsl:value-of select="^!" disable-output-escaping="yes"/>
#T=xslvar
<xsl:variable name="^!" select=""/>
#T=xslvariable
<xsl:variable name="^!">
	
</xsl:variable>
#T=xslwhen
<xsl:when test="^!">
	
</xsl:when>
#T=xslwith
<xsl:with-param name="^!" select=""/>
#T=xslwithparam
<xsl:with-param name="^!">
	
</xsl:with-param>
#T=msxslscript
<msxsl:script language="jscript" implements-prefix="js"><![CDATA[
^!
]]></msxsl:script>
^!
#T=_____________________
^!
#T=XSLT Attributes
^!
#T=caseorderas
case-order="^!"
#T=caseorder--
case-order="upper-first^!|lower-first"
#T=cdataas
cdata-section-elements="^!"
#T=countas
count="^!"
#T=datatypeas
data-type="^!"
#T=datatype--
data-type="text^!|number"
#T=decimalas
decimal-separator="^!"
#T=digitas
digit="^!"
#T=disableescapingas
disable-output-escaping="yes^!"
#T=noescapingas
disable-output-escaping="yes^!"
#T=docpublicas
doctype-public="^!"
#T=docsystemas
doctype-system="^!"
#T=encodingas
encoding="^!"
#T=elementsas
elements="^!"
#T=excludeas
exclude-result-prefixes="^!"
#T=extensionas
extension-element-prefixes="^!"
#T=formatas
format="^!"
#T=fromas
from="^!"
#T=groupingas
grouping-separator="^!"
#T=hrefas
href="^!"
#T=idas
id="^!"
#T=indentas
indent="^!"
#T=indent--
indent="yes^!|no"
#T=infinityas
infinity="^!"
#T=langas
lang="^!"
#T=levelas
level="^!"
#T=level--
level="single^!|multiple|any"
#T=matchas
match="^!"
#T=mediatypeas
media-type="^!"
#T=methodas
method="^!"
#T=method--
method="xml^!|html|text"
#T=minussignas
minus-sign="^!"
#T=modeas
mode="^!"
#T=nameas
name="^!"
#T=namespaceas
namespace="^!"
#T=nanas
NaN="^!"
#T=omitxmlas
omit-xml-declaration="^!"
#T=omitxmlas
omit-xml-declaration="yes^!|no"
#T=orderas
order="^!"
#T=order--
order="ascending^!|descending"
#T=patternas
pattern-separator="^!"
#T=percent
percent="^!"
#T=permilleas
per-mille="^!"
#T=priorityas
priority="^!"
#T=resultas
result-prefix="^!"
#T=selectas
select="^!"
#T=standaloneas
standalone="^!"
#T=standalone--
standalone="yes^!|no"
#T=stylesheetas
stylesheet-prefix="^!"
#T=terminateas
terminate="^!"
#T=terminate--
terminate="yes^!|no"
#T=testas
test="^!"
#T=useas
use="^!"
#T=useattrsetsas
use-attribute-sets="^!"
#T=valueas
value="^!"
#T=versionas
version="^!"
#T=zerodigitas
zero-digit="^!"
#T=disablescaping
disable-output-escaping="yes"
#T=xmlnsfo
xmlns:fo="http://www.w3.org/1999/XSL/Format" ^!
#T=xmlnsmsxsl
xmlns:msxsl="urn:schemas-microsoft-com:xslt" ^!
#T=xmlnsxsl
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" ^!
#T=xmlnsjs
xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:js="http://www.dreamstudioz.org/xslt/js" exclude-result-prefixes="msxsl js"
#T=_____________________
^!
#T=XML Attributes
^!
#T=xmlnsas
xmlns="^!"
#T=xmllangas
xml:lang="^!"
#T=xmlspaceas
xml:space="preserve^!"
#T=_____________________
^!
#T=HTML Elements
^!
#T=elhtml
<html>
	^!
</html>
#T=elhead
<head>
	^!
</head>
#T=eltitle
<title>^!</title>
#T=elheadtitle
<head>
	<title>^!</title>
</head>
#T=elmeta
<meta^! />
#T=elmetacontent
<meta http-equiv="Content-Type" content="text/html; charset=^!" />
#T=elmetacharset
<meta http-equiv="Content-Type" content="text/html; charset=^!" />
#T=elmetarefresh
<meta http-equiv="Refresh" content="^!" />
#T=elmetarobots
<meta http-equiv="Robots" content="noindex^!" />
#T=ellink
<link^! />
#T=ellinkcss
<link rel="stylesheet" href="^!.css" type="text/css" />
#T=ellinkicon
<link rel="shortcut icon" href="^!.ico" />
#T=elstyle
<style>
^!
</style>
#T=elstylesheet
<link rel="stylesheet" href="^!.css" type="text/css" />
#T=elscript
<script type="text/javascript"><![CDATA[
^!
]]></script>
#T=elbody
<body>
	^!
</body>
#T=elimg
<img src="^!" alt="" />
#T=elp
<p>^!</p>
#T=elh1
<h1>^!</h1>
#T=elh2
<h2>^!</h2>
#T=elh3
<h3>^!</h3>
#T=elh4
<h4>^!</h4>
#T=elh5
<h5>^!</h5>
#T=elh6
<h6>^!</h6>
#T=eldiv
<div>^!</div>
#T=eldivid
<div id="^!"></div>
#T=elblockquote
<blockquote>^!</blockquote>
#T=elspan
<span>^!</span>
#T=elspanid
<span id="^!"></span>
#T=elfont
<font>^!</font>
#T=elb
<b>^!</b>
#T=eli
<i>^!</i>
#T=elu
<u>^!</u>
#T=elacronym
<acronym>^!</acronym>
#T=elstrong
<strong>^!</strong>
#T=elem
<em>^!</em>
#T=elcode
<code>^!</code>
#T=elcite
<cite>^!</cite>
#T=elstrike
<strike>^!</strike>
#T=elq
<q>^!</q>
#T=elpre
<pre>^!</pre>
#T=elul
<ul>
	<li>^!</li>
</ul>
#T=elli
<li>^!</li>
#T=elol
<ol>
	<li>^!</li>
</ol>
#T=eldl
<dl>
	<dt>^!</dt>
	<dd></dd>
</dl>
#T=eldd
<dd>^!</dd>
#T=eldt
<dt>^!</dt>
#T=elfieldset
<fieldset>
	<legend>^!</legend>
</fieldset>
#T=ellegend
<legend>^!</legend>
#T=elframe
<frame>^!</frame>
#T=elframeset
<frameset>^!</frameset>
#T=eliframe
<iframe src="^!" />
#T=ellabel
<label for="^!"></label>
#T=elmap
<map name="^!">
	<area shape="" coords="" href="" />
</map>
#T=elarea
<area shape="^!" coords="" href="" />
#T=eltable
<table>
	^!
</table>
#T=elcolgroup
<colgroup>
	<col>^!</col>
</colgroup>
#T=elcol
<col ^!/>
#T=elthead
<thead>
	^!
</thead>
#T=eltbody
<tbody>
	^!
</tbody>
#T=eltfoot
<tfoot>
	^!
</tfoot>
#T=eltr
<tr>^!</tr>
#T=eltd
<td>^!</td>
#T=elth
<th>^!</th>
#T=elrow
<tr>
	<td>^!</td>
</tr>
#T=eltrow
<tr>
	<td>^!</td>
</tr>
#T=ela
<a href="^!"></a>
#T=elbr
<br />
#T=elhr
<hr />
#T=elbig
<big>^!</big>
#T=elsmall
<small>^!</small>
#T=elsup
<sup>^!</sup>
#T=elsub
<sub>^!</sub>
#T=elcenter
<center>^!</center>
#T=elbutton
<button onclick="^!"></button>
#T=elform
<form action="^!" method="post">
</form>
#T=eltext
<input type="text" id="txt^!" />
#T=elcheckbox
<input type="checkbox" id="chk^!" />
#T=elradio
<input type="radio" id="rad^!" />
#T=elpassword
<input type="password" id="pwd^!" />
#T=elfile
<input type="file" id="file^!" />
#T=elsubmit
<input type="submit" id="btn^!" />
#T=elimage
<input type="image" id="btn^!" src="" />
#T=elhidden
<input type="hidden" id="hdn^!" />
#T=elbtn
<input type="button" id="btn^!" />
#T=elreset
<input type="reset" value="btn^!">
#T=eltextarea
<textarea id="txt^!"></textarea>
#T=elselect
<select id="sel^!">
</select>
#T=eloptgroup
<optgroup label="">^!</optgroup>
#T=elop
<option>^!</option>
#T=eloption
<option>^!</option>
#T=elobject
<object>
	^!
</object>
#T=elparam
<param name="^!" value="" />
#T=elxml
<xml>^!</xml>
#T=_____________________
^!
#T=HTML Properties
^!
#T=accesskeyis
accesskey="^!"
#T=actionis
action="^!"
#T=alignis
align="^!"
#T=alinkis
alink="^!"
#T=altis
alt="^!"
#T=backgroundis
background="^!"
#T=behavioris
behavior="^!"
#T=bgcoloris
bgcolor="^!"
#T=borderis
border="^!"
#T=bordercoloris
bordercolor="^!"
#T=cellpaddingis
cellpadding="^!"
#T=cellspacingis
cellspacing="^!"
#T=checkedis
checked="checked"
#T=classis
class="^!"
#T=classidis
classid="^!"
#T=clearis
clear="^!"
#T=codeis
code="^!"
#T=codebaseis
codebase="^!"
#T=codetypeis
codetype="^!"
#T=coloris
color="^!"
#T=colspanis
colspan="^!"
#T=colsis
cols="^!"
#T=contentis
content="^!"
#T=contenteditableis
contenteditable="true"
#T=datais
data="^!"
#T=datafldis
datafld="^!"
#T=dataformatasis
dataformatas="^!"
#T=datapagesizeis
datapagesize="^!"
#T=datasrcis
datasrc="^!"
#T=datapagesizeis
datapagesize="^!"
#T=deferis
defer="defer"
#T=diris
dir="^!"
#T=directionis
direction="^!"
#T=disabledis
disabled="disabled"
#T=encodingis
encoding="^!"
#T=faceis
face="^!"
#T=fgcoloris
fgcolor="^!"
#T=foris
for="^!"
#T=frameis
frame="^!"
#T=frameborderis
frameborder="^!"
#T=framespacing
framespacing="^!"
#T=heightis
height="^!"
#T=hrefis
href="^!"
#T=hspaceis
hspace="^!"
#T=httpequivis
http-equiv="^!"
#T=idis
id="^!"
#T=labelis
label="^!"
#T=langis
lang="^!"
#T=languageis
language="^!"
#T=linkis
link="^!"
#T=lowsrcis
lowsrc="^!"
#T=maxlengthis
maxlength="^!"
#T=mediais
media="^!"
#T=methodis
method="^!"
#T=multipleis
multiple="multiple"
#T=nameis
name="^!"
#T=noresizeis
noresize="true"
#T=noshadeis
noshade="noshade"
#T=nowrapis
nowrap="nowrap"
#T=onactivateis
onactivate="^!"
#T=onbluris
onblur="^!"
#T=onchangeis
onchange="^!"
#T=onclickis
onclick="^!"
#T=oncontextmenuis
oncontextmenu="^!"
#T=oncopyis
oncopy="^!"
#T=oncutis
oncut="^!"
#T=ondblclickis
ondblclick="^!"
#T=onfocusis
onfocus="^!"
#T=onkeydownis
onkeydown="^!"
#T=onkeypressis
onkeypress="^!"
#T=onkeyupis
onkeyup="^!"
#T=onloadis
onload="^!"
#T=onmousedownis
onmousedown="^!"
#T=onmouseenteris
onmouseenter="^!"
#T=onmouseleaveis
onmouseleave="^!"
#T=onmouseoutis
onmouseout="^!"
#T=onmouseoveris
onmouseover="^!"
#T=onmouseupis
onmouseup="^!"
#T=onmoveis
onmove="^!"
#T=onpasteis
onpaste="^!"
#T=onpropertychangeis
onpropertychange="^!"
#T=onreadystatechangeis
onreadystatechange="^!"
#T=onresizeis
onresize="^!"
#T=onselectis
onselect="^!"
#T=onunloadis
onunload="^!"
#T=readonlyis
readonly="^!"
#T=relis
rel="^!"
#T=revis
rev="^!"
#T=rowspanis
rowspan="^!"
#T=rowsis
rows="^!"
#T=rulesis
rules="^!"
#T=scrollingis
scrolling="^!"
#T=selectedis
selected="selected"
#T=sizeis
size="^!"
#T=spanis
span="^!"
#T=srcis
src="^!"
#T=styleis
style="^!"
#T=tabindexis
tabindex="^!"
#T=targetis
target="^!"
#T=textis
text="^!"
#T=titleis
title="^!"
#T=typeis
type="^!"
#T=unselectableis
unselectable="true"
#T=valignis
valign="^!"
#T=valueis
value="^!"
#T=vlinkis
vlink="^!"
#T=widthis
width="^!"
#T=_____________________
^!
#T=Entities
^!
#T=nbsp
&#160;
#T=crlf
&#13;&#10;
#T=nl
&#13;&#10;
#T=lf
&#10;
#T=cr
&#13;
#T=sp
&#32;
#T=tab
&#09;
#T=lt
&lt;
#T=gt
&gt;
#T=amp
&amp;
#T=quot
&quot;
#T=apos
&apos;
#
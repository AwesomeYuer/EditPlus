#TITLE=ASP.net with C#
#INFO
This file is provided as an auto-completion file for ASP.net, C# and HTML.
If the C# Auto-Completion messes your HTML authoring (probably so if
you are an English speaker), please remove that section.
If you like, you can also cut the C# auto-completion section and paste
it as a new Auto-Completion file for your C# programming.

Date: 2005-7-24
Author: Welman Jordan
E-Mail: wmjordan(at)163[dot]com

Notice: It is recommended to download the latest Editplus support
patch to work correctly with this file.


#SORT=n

#T=_____________________
_____________________
#T=  C# Auto Completion
C# Auto Completion
#T=if
if (^!)
{
}
#T=else
else
{
	^!
}
#T=elseif
else if (^!)
{
}
#T=while
while (^!)
{
}
#T=for
for (int i=0; i<^!; i++)
{
}
#T=foreach
foreach (^!)
{
}
#T=switch
switch (^!)
{
    case :
}
#T=do
do {
} while (^!);
#T=case
case ^!:
#T=acase
case ^!:
	break;
#T=default
default: ^!
	break;
#T=try
try
{
	^!
}
#T=catch
catch (^!)
{
}
#T=finally
finally
{
	^!
}
#T=fixed
fixed (^!)
{
}
#T=typeof
typeof (^!)
#T=lock
lock (^!)
{
}
#T=get
get { ^! }
#T=set
set { ^! }
#T=namespace
namespace ^!
{
}
#T=class
class ^!
{
}
#T=struct
struct ^!
{
}
#T=inf
interface ^!
{
}
#T=interface
interface ^!
{
}
#T=use
using (^!)
{
}
#T=br
break;
#T=cont
continue;
#T=rt
return ^!;
#T=ne
!= ^!
#T=nes
!= "^!"
#T=eq
== ^!
#T=es
== "^!"
#T=and
&& ^!
#T=or
|| ^!
#T=nonull
!= null
#T=nofalse
!= false
#T=notrue
!= true
#T=nenull
!= null
#T=nefalse
!= false
#T=netrue
!= true
#T=isnull
== null
#T=isfalse
== false
#T=istrue
== true
#T=enull
= null;
#T=efalse
= false;
#T=etrue
= true;
#T=evalue
= value;
#T=eqnull
= null;
#T=eqfalse
= false;
#T=eqtrue
= true;
#T=eqvalue
= value;
#T=getval
get { return ^!; }
#T=setval
set { ^! = value; }
#T=pclass
public class ^!
{
}
#T=pinf
public interface ^!
{
}
#T=pinterface
public interface ^!
{
}
#T=penum
public enum ^!
{
}
#T=pstruct
public struct ^!
{
}
#T=pp
public ^! {
}
#T=ppv
public void ^! {
}
#T=pps
public static ^! {
}
#T=ppsv
public static void ^! {
}
#T=iclass
internal class ^!
{
}
#T=iinf
internal interface ^!
{
}
#T=iinterface
internal interface ^!
{
}
#T=ienum
internal enum ^!
{
}
#T=istruct
internal struct ^!
{
}
#T=ii
internal ^! {
}
#T=iiv
internal void ^! {
}
#T=iis
internal static ^! {
}
#T=iisv
internal static void ^! {
}
#T=pr
protected ^! {
}
#T=prenum
protected enum ^! {
}
#T=prstruct
protected struct ^! {
}
#T=prv
protected void ^! {
}
#T=pri
private ^!
#T=priv
private void ^! {
}
#T=region
^#region ^!
^#endregion
#T=_____________________
_____________________
#T=  .Net Controls
.Net Controls
#T=asptextbox
<asp:TextBox id="^!" MaxLength="" RunAt="server" />
#T=aspbtn
<asp:Button OnClick="^!_Click" Text="" RunAt="server" />
#T=aspbutton
<asp:Button CommandName="^!" CommandArgument="" OnClick="_Click" Text="" RunAt="server" />
#T=aspimgbtn
<asp:ImageButton OnClick="^!_Click" ImageUrl="" RunAt="server" />
#T=aspimagebutton
<asp:ImageButton OnClick="^!_Click" ImageUrl="" RunAt="server" />
#T=asplinkbtn
<asp:LinkButton OnClick="^!_Click" Text="" RunAt="server" />
#T=asplinkbutton
<asp:LinkButton OnClick="^!_Click" CommandName="" CommandArgument="" Text="" RunAt="server">
</asp:LinkButton>
#T=asphyperlink
<asp:HyperLink id="^!" NavigateUrl="" Text="" RunAt="server"/>
#T=aspimglink
<asp:HyperLink id="^!" NavigateUrl="" ImageUrl="" RunAt="server"></asp:HyperLink>
#T=aspcheckbox
<asp:CheckBox id="^!" Text="" Checked="False" RunAt="server"/>
#T=aspradiobtn
<asp:RadioButton id="^!" Text="" GroupName="" RunAt="server"/>
#T=aspdropdown
<asp:DropDownList id="^!" RunAt="server">
</asp:DropDownList>
#T=aspdropdownlist
<asp:DropDownList id="^!" DataTextField="" DataValueField="" RunAt="server" />
#T=asplistbox
<asp:ListBox id="^!" SelectionMode="" Rows="" RunAt="server">
</asp:ListBox>
#T=asplistitem
<asp:ListItem value="^!"></asp:ListItem>
#T=aspimg
<asp:Image id="^!" ImageUrl="" AlternateText="" RunAt="Server" />
#T=_____________________
_____________________
#T=  Data Controls
Data Controls
#T=aspdg
<asp:DataGrid id="^!" AutoGenerateColumns="True" RunAt="server">
</asp:DataGrid>
#T=aspdatagrid
<asp:DataGrid id="^!" AutoGenerateColumns="False" RunAt="server">
	<Columns>
	</Columns>
</asp:DataGrid>
#T=aspboundcol
<asp:BoundColumn DataField="^!" HeaderText="" />
#T=aspboundcolumn
<asp:BoundColumn DataField="^!" HeaderText="" />
#T=aspbuttoncol
<asp:ButtonColumn Command="^!" DataTextField="" HeaderText="" ButtonType="PushButton" />
#T=aspbuttoncolumn
<asp:ButtonColumn Command="^!" DataTextField="" HeaderText="" ButtonType="PushButton" />
#T=asplinkcol
<asp:HyperLinkColumn DataNavigateUrlField="^!" DataNavigateUrlFormatString="" DataTextField="" DataTextFormatString="" HeaderText="" />
#T=asphyperlinkcolumn
<asp:HyperLinkColumn DataNavigateUrlField="^!" DataNavigateUrlFormatString="" DataTextField="" DataTextFormatString="" HeaderText="" />
#T=asptemplatecol
<asp:TemplateColumn HeaderText="^!">
	<ItemTemplate>
	</ItemTemplate>
</asp:TemplateColumn>
#T=asptemplatecolumn
<asp:TemplateColumn HeaderText="^!">
	<ItemTemplate>
	</ItemTemplate>
</asp:TemplateColumn>
#T=aspdatalist
<asp:DataList id="^!" RunAt="server">
</asp:DataList>
#T=asprepeater
<asp:Repeater id="^!" RunAt="Server">
	<HeaderTemplate></HeaderTemplate>
	<ItemTemplate></ItemTemplate>
	<SeparatorTemplate></SeparatorTemplate>
	<FooterTemplate></FooterTemplate>
</asp:Repeater>
#T=_____________________
_____________________
#T=  Misc Controls
Misc Controls
#T=aspregval
<asp:RegularExpressionValidator id="^!" ControlToValidate="" ValidationExpression="" ErrorMessage="" Text="" Display="Dynamic" RunAt="server" />
#T=asprangeval
<asp:RangeValidator id="^!" ControlToValidate="" MinimumValue="" MaximumValue="" Type="" ErrorMessage="" Text="" Display="Dynamic" RunAt="server"/>
#T=asprequiredval
<asp:RequiredFieldValidator id="^!" ControlToValidate="" InitialValue="" ErrorMessage="" Text="" Display="Dynamic" RunAt="server"/>
#T=aspcompareval
<asp:CompareValidator id="^!" ControlToValidate="" ValueToCompare="" Type="" Operator="" ErrorMessage="" Text="" Display="Dynamic" RunAt="server"/>
#T=_____________________
_____________________
#T=  Layout Controls
Layout Controls
#T=asplabel
<asp:Label id="^!" RunAt="server">
</asp:Label>
#T=aspliteral
<asp:Literal id="^!" Text="" RunAt="server" />
#T=aspplaceholder
<asp:PlaceHolder id="^!" RunAt="server" />
#T=aspph
<asp:PlaceHolder id="^!" RunAt="server" />
#T=asppanel
<asp:Panel id="^!" RunAt="server">
</asp:Panel>
#T=_____________________
_____________________
#T=  Directives
Directives
#T=asppage
<%@ Page language="^!" %>
#T=aspcontrol
<%@ Control language="^!" %>
#T=aspassembly
<%@ Assembly Name="^!" %>
#T=aspasm
<%@ Assembly Name="^!" %>
#T=aspasms
<%@ Assembly Src="^!" %>
#T=aspimplements
<%@ Implements interface="^!" %>
#T=aspimport
<%@ Import namespace="System.^!" %>
#T=aspoutputcache
<%@ OutputCache Duration="^!" VariyByParam="*" %>
#T=aspregister
<%@ Register Src="^!" TagPrefix="" TagName="" %>
#T=aspreg
<%@ Register Src="^!" TagPrefix="" TagName="" %>
#T=asprega
<%@ Register Assembly="^!" Namespace="" TagPrefix="" %>
#T=aspreference
<%@ Reference page="^!" %>
#T=aspref
<%@ Reference page="^!" %>
#T=asprefc
<%@ Reference control="^!" %>
#T=aspwebservice
<%@ WebService Class="^!" %>
#T=aspweb
<%@ WebService ^! %>
#T=aspdatabinder
<%# DataBinder.Eval(Container.DataItem, "^!") %>
#T=aspform
<form method="post" action="" RunAt="server">
^!
</form>
#T=asphanchor
<a id="^!" OnServerClick="" RunAt="server"></a>
#T=asphbtn
<button id="^!" OnServerClick="" RunAt="server"></button>
#T=asphbutton
<button id="^!" onclick="" OnServerClick="" RunAt="server"></button>
#T=asphcheck
<input id="^!" Type="checkbox" Value="" RunAt="server" />
#T=asphradio
<input id="^!" Type="radio" Name="" Value="" RunAt="server" />
#T=asphradiobtn
<input id="^!" Type="radio" Name="" Value="" OnServerChange="" RunAt="server" />
#T=_____________________
_____________________
#T=  Some handy abbreviations
Some handy abbreviations
#T=_comm
//*********************************************************************
#T=aspcomm
<%-- ^! --%>
#T=aspeq
<%= ^! %>
#T=aspbind
<%# ^! %>
#T=isevent
(Object source, EventArgs args)
{
	^!
}
#T=aspinclude
<!--#Include file="^!" -->
#T=aspincludefile
<!--#Include file="^!" -->
#T=aspscript
<script RunAt="server">
^!
</script>
#T=elscriptsrc
<script language="Javascript" type="text/javascript" src="^!"></script>
#T=eljscript
<script language="JScript">
^!
</script>
#T=elvbscript
<script language="VBScript">
^!
</script>
#T=aspscriptsrc
<script src="^!" RunAt="server" />
#T=aspfile
<Input type="file" id="^!" Accept="" RunAt="server" />
#T=_____________________
_____________________
#T=  ASPX attributes
ASPX attributes
#T=autopostbackas
AutoPostBack="True^!"
#T=backcoloras
BackColor="^!"
#T=bordercoloras
BorderColor="^!"
#T=borderstyleas
BorderStyle="^!"
#T=borderwidthas
BorderWidth="^!"
#T=bufferas
Buffer="True^!"
#T=causesvalidationas
CausesValidation="False^!"
#T=checkedas
Checked="True^!"
#T=commandas
 CommandName="^!" CommandArgument=""
#T=commandnameas
CommandName="^!"
#T=commandargumentas
CommandArgument="^!"
#T=columnsas
Columns="^!"
#T=cssclassas
CssClass="^!"
#T=classnameas
ClassName="^!"
#T=debugas
Debug="True^!"
#T=enabledas
Enabled="False^!"
#T=enableviewstateas
EnableViewState="False^!"
#T=errorpageas
ErrorPage="^!"
#T=forecoloras
ForeColor="^!"
#T=groupnameas
GroupName="^!"
#T=heightas
Height="^!"
#T=inheritsas
Inherits="^!"
#T=maxlengthas
MaxLength="^!"
#T=oncheckedchangedas
OnCheckedChanged="^!_CheckChanged"
#T=onclickas
OnClick="^!_Click"
#T=ondatabindingas
OnDataBinding="^!_DataBinding"
#T=ondisposedas
OnDisposed="^!_Disposed"
#T=oninitas
OnInit="^!_Init"
#T=onloadas
OnLoad="^!_Load"
#T=onprerenderas
OnPreRender="^!_PreRender"
#T=onselectedindexchangedas
OnSelectedIndexChanged="^!_SelectedIndexChanged"
#T=ontextchangedas
OnTextChanged="^!_TextChanged"
#T=onunloadas
OnUnload="^!_Unload"
#T=rowsas
Rows="^!"
#T=sessionstateas
EnableSessionState="False^!"
#T=nosessionstate
EnableSessionState="False"
#T=tabindexas
TabIndex="^!"
#T=textas
Text="^!"
#T=textalignas
TextAlign="^!"
#T=textmodeas
TextMode="^!"
#T=tooltipas
ToolTip="^!"
#T=traceas
Trace="True^!"
#T=viewstateas
EnableViewState="False^!"
#T=noviewstate
EnableViewState="False"
#T=visibleas
Visible="^!"
#T=widthas
Width="^!"
#T=runat
RunAt="Server"
#T=_____________________
_____________________
#T=  HTML
HTML
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
#T=elmeta
<meta^! />
#T=elmetacharset
<meta http-equiv="Content-Type" content="text/html; charset=^!">
#T=elmetarefresh
<meta http-equiv="Refresh" content="^!">
#T=elmetarobots
<meta http-equiv="Robots" content="noindex^!">
#T=ellink
<link^! />
#T=ellinkcss
<link rel="stylesheet" href="^!.css" type="text/css">
#T=ellinkicon
<link rel="shortcut icon" href="^!.ico">
#T=elstyle
<style>
^!
</style>
#T=elstylesheet
<link rel="stylesheet" href="^!.css" type="text/css">
#T=elscript
<script language="javascript">
<!--
^!
//-->
</script>
#T=elbody
<body>
	^!
</body>
#T=elimg
<img src="^!" alt="">
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
<iframe src="^!"></iframe>
#T=ellabel
<label for="^!"></label>
#T=elmap
<map name="^!">
	<area shape="" coords="" href="">
</map>
#T=elarea
<area shape="^!" coords="" href="">
#T=eltable
<table>
	^!
</table>
#T=elcolgroup
<colgroup>
	<col>^!</col>
</colgroup>
#T=elcol
<col>^!</col>
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
#T=ela
<a href="^!"></a>
#T=elbr
<br>
#T=elhr
<hr>
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
<input type="text" id="txt^!">
#T=elcheckbox
<input type="checkbox" id="chk^!">
#T=elchkbox
<input type="checkbox" id="chk^!">
#T=elradio
<input type="radio" id="rad^!">
#T=elpassword
<input type="password" id="pwd^!">
#T=elfile
<input type="file" id="file^!">
#T=elsubmit
<input type="submit" value="^!">
#T=elimage
<input type="image" src="^!">
#T=elhidden
<input type="hidden" id="hdn^!">
#T=elbtn
<input type="button" onclick="^!">
#T=elreset
<input type="reset" value="^!">
#T=eltextarea
<textarea id="txt^!"></textarea>
#T=elselect
<select id="sel^!">
</select>
#T=eloptgroup
<optgroup label="">^!</optgroup>
#T=elopt
<option>^!</option>
#T=eloption
<option value="^!"></option>
#T=elobject
<object>
	^!
</object>
#T=elparam
<param name="^!" value="">
#T=elxml
<xml>^!</xml>
#T=_____________________
_____________________
#T=  Attributes
Attributes
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
#T=onsubmitis
onsubmit="^!"
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
#T=nbsp
&nbsp;
#T=gt
&gt;
#T=lt
&lt;
#T=quot
&quot;
#
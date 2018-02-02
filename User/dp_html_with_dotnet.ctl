#TITLE=dp HTML with ASP.net and CSS
#INFO
; HTML with ASP.net and css include syntax and Cliptext(CTL) control file 
; Written by datta Puro (dp) - U-Tosolutions(I) Pvt. Ltd. (dp@u-tosolutions.com).
; This file is required for EditPlus to run correctly.
#SORT=n


#T====================
=====================
#T=Tag Attribute:- 
<!-- Tag Attribute:- -->
<!--Use these Attribute in your html tag wherever you require them in your project -->
#T====================
=====================

#T=Body Attribute 
<body alink=#66cc33 background="^!" bgcolor=#FFFFFF bgproperties=fixed bottommargin=0 class=main datafld="" dataformatas=html datasrc="" dir="" id=new lang="" language="" leftmargin=0 link=#003366 nowrap rightmargin=0 runat=server scroll=yes style="" tabindex="" text=#000000 title="testing this style"  topmargin=10 vlink=#ff3300 ><!-- MS_POSITIONING="GridLayout" -->

#T=Form Attribute 
<form action="^!" autocomplete=off class=normal dir="" enctype="" id=test lang="" language="" method=post name=new runat=server style="" tabindex="" target=_blank title="testing">

#T=Table Attribute 
<asp:Table AccessKey="" BackColor="#FFFFFF" BackImageUrl="^!"  BorderColor="#0D366A"  BorderStyle="Solid"  BorderWidth=1 CellPadding=5 CellSpacing=5 CssClass="normal" Enabled="" EnableViewState="" Font-Bold=True Font-Italic=True Font-Name="Verdana" Font-Names="Aril,verdana"  Font-Overline=False Font-Size="12px" Font-Strikeout=False Font-Underline=False ForeColor=#000066 Height="105" HorizontalAlign=Center ID=dp1  Runat=server TabIndex="2" Visible="" Width="95%"></asp:Table>

#T=TableHeader Attribute 
<asp:TableHeaderCell AccessKey="^!"  BackColor=#0D366A BorderColor=#0D366A  BorderStyle=Solid BorderWidth="1" ColumnSpan="2" CssClass="table_head" Enabled=False  EnableViewState="true" Font-Bold="true" Font-Italic="true" Font-Name="Verdana" Font-Names="Arial, Verdana" Font-Overline="False" Font-Size="12" Font-Strikeout=False Font-Underline="true" ForeColor="#FFF17F" Height="15" HorizontalAlign="Center" ID=head  RowSpan="0" Runat="server" TabIndex="2" Text="Head Text"  VerticalAlign="Top" Visible="" Wrap="true" ></asp:TableHeaderCell>

#T=Row Attribute 
<asp:TableRow AccessKey="^!" BackColor=#144D97 BorderColor=#0D366A BorderStyle=Outset BorderWidth=1 CssClass=band1 Enabled=False EnableViewState=True Font-Bold=True Font-Italic=False Font-Name="verdana" Font-Names="Arial, Verdana" Font-Overline=False  Font-Size=12 Font-Strikeout=False Font-Underline=False ForeColor=#000000 Height=100 HorizontalAlign=Center ID=dp11 Runat=server TabIndex="2" VerticalAlign=Top Visible=True  Width=100></asp:TableRow>

#T=Colum Attribute 
 <asp:TableCell AccessKey="^!" BackColor=#144D97 BorderColor=#0D366A BorderStyle=Inset BorderWidth=1 ColumnSpan=2 CssClass=normal Enabled=False EnableViewState=True Font-Bold=True Font-Italic=False Font-Name=Verdana Font-Names="Arial, Verdana" Font-Overline=False Font-Size=12 Font-Strikeout=False  Font-Underline=False  ForeColor=#000000 Height=15 HorizontalAlign=Left ID=dp_td RowSpan=0 Runat=server TabIndex="2" Text="Arial" VerticalAlign=Middle Visible=True Width=10% Wrap=False></asp:TableCell>

#T=TextBox Attribute 
<INPUT type="text" accesskey="" autocomplete=off class=text datafld="" datasrc="" dir="" disabled=false id=textbo lang="" language="^!" maxlength=35 name="fname" readonly runat=server size="25" style="" tabindex="2" title="test"  value="">

#T=ListBox Attribute 
<SELECT size=2 accesskey="" align=absmiddle class=select datafld="" DataMember=""  datasrc="" DataTextField="" DataValueField="" dir="" disabled id=sele lang="" language="" multiple name="" runat=server style="" tabindex="2" title="" type=select-one >
	<OPTION class="" dir="" id="op1" lang="" language="" runat="server" selected style="" title=""	value="1">Please Select^!</OPTION>
</SELECT>

#T=Textarea Attribute 
<TEXTAREA rows=2 cols=20 accesskey="" class="textarea" datafld="" datasrc="" dir="" disabled id=texta lang="" language="" readonly runat=server style="" tabindex="2" title="" wrap=soft  NAME="^!"></TEXTAREA>

#T=Checkbox Attribute 
<INPUT type="checkbox" accesskey="" checked=true class="" datafld="" datasrc="" dir="" disabled=true  id=ceck1  lang="" language="" name="^!"  runat=server size="" style="" tabindex="2" title=""  value="1">

#T=Radio Attribute 
<INPUT type="radio" accesskey="" checked=false class="" datafld="" datasrc="" dir="" disabled=false  id=ra1 lang="" language="" name="^!" runat=server size="" style="" tabindex="2" title=""  value="1" >

#T=File Upload Attribute 
<INPUT type="file" accesskey="" class="" datafld="" datasrc="" dir="" disabled=false id=fle1 lang="" language="" name="^!"  size="10" style="" tabindex="2" title=""  value="">

#T=Button Attribute 
<INPUT type="button" value="Back" accesskey="" class="" datafld="" datasrc="" dir="" disabled=false id=bu1 lang="" language="" name="^!" runat=server size="" style="" tabindex="2" title="" >

#T=Submit Attribute 
<INPUT type="submit" value="Submit" accesskey="" class="" datafld="" datasrc="" dir="" disabled=false id=sub1 lang="" language="" name="^!" runat=server size="" style="" tabindex="2" title="">

#T=Reset Attribute 
<INPUT type="reset" value="Reset" accesskey="" class="" datafld="" datasrc="" dir="" disabled=false id="Reset1" lang="" language="" name="^!" runat=server size="" style="" tabindex="2" title="">

#T====================
=====================
#T=Function:- 
<!-- Function:- -->
<!-- Use these function to Textbox, List box, Text area, checkbox, Radio button, file upload and all button (submit / Reset / Button)-->
#T====================
=====================
#T=onafterupdate 
onafterupdate() 
<!--Function use in Textbox, Textarea  -->

#T=onbeforeeditfocus 
onbeforeeditfocus() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onbeforeupdate 
onbeforeupdate() 
<!--Function use in Textbox, Textarea  -->

#T=onblur 
onblur() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onchange
onchange() 
<!--Function use in Textbox, listbox, Textarea -->

#T=onclick 
onclick() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=oncontextmenu 
oncontextmenu() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondblclick 
ondblclick() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondrag 
ondrag() 
<!--Function use in Textbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondragend 
ondragend() 
<!--Function use in Textbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondragenter
ondragenter() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondragleave
ondragleave() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondragover
ondragover() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondragstart 
ondragstart() 
<!--Function use in Textbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=ondrop
ondrop() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onerrorupdate
onerrorupdate() 
<!--Function use in Textbox, Textarea -->

#T=onfilterchange
onfilterchange() 
<!--Function use in Textbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onfocus
onfocus() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onhelp
onhelp() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onkeydown
onkeydown() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onkeypress
onkeypress() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onkeyup
onkeyup() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onlosecapture
onlosecapture() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onmousedown
onmousedown() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onmousemove
onmousemove() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onmouseout
onmouseout() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onmouseover
onmouseover() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onmouseup
onmouseup() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onpropertychange
onpropertychange() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onreadystatechange
onreadystatechange() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onresize
onresize() 
<!--Function use in Textbox, listbox, Textarea, file upload and submit button -->

#T=onselect
onselect() 
<!--Function use in Textbox, Textarea -->

#T=onselectstart
onselectstart() 
<!--Function use in Textbox, listbox, Textarea, Checkbox, Radio button, file upload and submit button -->

#T=onserverchange
onserverchange() 
<!--Function use in Textbox, listbox, Textarea, Checkbox -->

#T=onpaste
onpaste() 
<!--Function use in listbox -->

#T=onscroll
onscroll() 
<!--Function use in listbox, Textarea -->

#T=onbeforecopy
onbeforecopy() 
<!--Function use in Textarea -->

#T=onbeforecut
onbeforecut() 
<!--Function use in Textarea -->

#T=onbeforepaste
onbeforepaste() 
<!--Function use in Textarea -->

#T=oncopy
oncopy() 
<!--Function use in Textarea -->

#T=oncut
oncut() 
<!--Function use in Textarea -->

#T=onserverclick
onserverclick() 
<!--Function use in submit button -->

#T====================
=====================
#T=Form Template:-
<!-- Form Template:- -->
<!-- copy following template to your project and add also dp_dotnet.css in same project. -->
#T====================
=====================

#T=Template 

<%@ Page language="c#" Codebehind="dp_htmlwithasp.aspx.cs" AutoEventWireup="false" Inherits="PrimeHrd.html_css" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>html_css</title>
<link rel="stylesheet" type="text/css" href="dp_dotnet.css">
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.1">
<meta name="CODE_LANGUAGE" Content="C#">
<meta name="vs_defaultClientScript" content="JavaScript">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="10" scroll="yes"><!-- MS_POSITIONING="GridLayout" -->
<form method="post" action="" enctype="application/x-www-form-urlencoded"  target="_blank">
<asp:Table CellPadding="5" CellSpacing="0" CssClass="main" HorizontalAlign="Center" ID="dp1" Runat="server"  Width="95%">
	<asp:TableRow>
		<asp:TableHeaderCell ColumnSpan="2" CssClass="TableHeader" ID="head" Runat="server" TabIndex="2" Text="Head Text" Wrap="true"></asp:TableHeaderCell>
	</asp:TableRow>
	<asp:TableRow  CssClass="band1">
		<asp:TableCell ColumnSpan="2" CssClass="band1"	Wrap="False">Testing</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal" Width="20%">Text Box</asp:TableCell>
		<asp:TableCell CssClass="normal">
			<INPUT type="text" class="text" maxlength="35" name="fname" size="25" title="TextBox" value=""></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal">List box</asp:TableCell>
		<asp:TableCell CssClass="normal">
			<SELECT class="select"  name="" title="List Box">
				<OPTION class="" selected value="1">------ Please Select ------</OPTION>
				<OPTION class="" value="2">Jan</OPTION>							
			</SELECT>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal">Textarea</asp:TableCell>
		<asp:TableCell CssClass="normal">
			<TEXTAREA rows="2" cols="27" class="textarea" title="" NAME=""></TEXTAREA>
		</asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal">Checkbox</asp:TableCell>
		<asp:TableCell CssClass="normal">
			Yes <INPUT type="checkbox" checked class="checkbox" disabled  title="Checkbox" name=c1 value="1">
			No <INPUT type="checkbox"  class="checkbox" name=c1 title="Checkbox" value="2"></asp:TableCell>						
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal">Radio</asp:TableCell>
		<asp:TableCell CssClass="normal">
			1<INPUT type="radio" checked class="radio" disabled name="r1" title="Radio Button" value="1">
			2<INPUT type="radio"  class="radio" name="r1" title="Radio Button" value="2"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell CssClass="normal">File upload</asp:TableCell>
		<asp:TableCell CssClass="normal">
			<INPUT type="file" class="text"  name="f1" size="15" title="" value="1"></asp:TableCell>
	</asp:TableRow>
	<asp:TableRow>
		<asp:TableCell HorizontalAlign="Right">
			<INPUT type="submit" value="Submit" class="button" title="" ^!></asp:TableCell>
		<asp:TableCell>
			<INPUT type="reset" value="Reset" class="button" title=""></asp:TableCell>
	</asp:TableRow>
</asp:Table>
</form>
</body>
</HTML>
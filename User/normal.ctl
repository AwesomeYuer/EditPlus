#TITLE=normal(dot)html
#INFO
This Clip Lib is designed to be the HTML equivalent to Microsoft Word's
normal.dot. It contains HTML tags that are useful for the preparation of
documents rather than web pages; documents that are, however, viewed in a web
browser. This version has been modified to work with EditPlus.
Author:   Peter Anderson (peterjohnanderson@gmail.com)
Licence:  Creative Commons Attribution Unported (current version)
          http://creativecommons.org.au/licences
Created:  Sunday, 16 December 2007
Modified: Wednesday, 18 March 2009

#SORT=n

#T=Blank HTML page
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>^!</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Language" content="en-AU">
<meta name="author" content="Peter Anderson">
<meta name="copyright" content="Creative Commons Attribution Unported (current version)">
<meta name="copyright-url" content="http://creativecommons.org.au/licences">
<meta name="description" content="page description">
<style type="text/css" media="all">
a{background-color:transparent; text-decoration:none;}
a:link, a:visited, a:active, a:hover{color:navy;}
a:hover{text-decoration:underline;}
html, body{background-color:white; color:black;}
body{font-family:Georgia,"Times New Roman",Times,serif; font-size:12pt; margin:2%;}
h1{font-size:18pt;}
h2{font-size:16pt;}
h3{font-size:14pt;}
h4{font-size:12pt;}
h1, h2, h3, h4, h5, h6{font-family:Verdana,Arial,Helvetica,sans-serif;}
hr{background-color:black; color:black; border:0; height:1px; text-align:center; width:80%;}
code, pre{font-family:"Courier New",Courier,monospace; font-size:12pt;}
table{border-collapse:collapse; font-size:12pt; width:100%;}
td{border:1px solid black; padding:5px; text-align:left; vertical-align:middle;}
td.col1{width:60%;}
td.col2{width:40%;}
img.float-left{float:left;padding-right:10px;padding-bottom:10px;}
img.float-right{float:right;padding-left:10px;padding-bottom:10px;}
.box{border:1px solid black; padding:5px; margin:10px 0px;}
.highlight{background-color:yellow;}
.underline{text-decoration:underline;}
.note{background-color:lightgray;}
</style>
</head>
<body>

</body>
</html>

#T=-------------------------
-------------------------
#T=_@_ - e-mail address
&nbsp;&#064;&nbsp;
#T=:// - web address
&#058;&#047;&#047;
#T=-------------------------
-------------------------
#T=Non-breaking space
&nbsp;
#T=… Ellipses
&hellip;
#T=& Ampersand
&amp;
#T=" Double quote
&quot;
#T=' Single quote
&#039;
#T=• Bullet
&bull;
#T=· Middle dot
&middot;
#T=< Less than
&lt;
#T=> Greater than
&gt;
#T=<= Less Than or Equal To
&le;
#T=>= Greater Than or Equal To
&ge;
#T=== Identical To
&equiv;
#T=~~ Approximately Equal To
&cong;
#T=/= Not Equal To
&ne;
#T=:. Therfore
&there4;
#T=± Plus/Minus
&plusmn;
#T=¦ Broken vertical bar
&brvbar;
#T=em Dash (longer)
&mdash;
#T=en Dash (shorter)
&ndash;
#T=-------------------------
-------------------------
#T=Comment
<!-- ^! -->
#T=Paragraph
<p>^!</p>
#T=Line break
<br>
#T=Heading 1
<h1>^!</h1>
#T=Heading 2
<h2>^!</h2>
#T=Heading 3
<h3>^!</h3>
#T=Heading 4
<h4>^!</h4>
#T=Horizontal Rule
<hr>
#T=Page break (before)
 style="page-break-before: always;"
#T=Word wrap
<wbr>
#T=-------------------------
-------------------------
#T=Bold
<b>^!</b>
#T=Italic
<i>^!</i>
#T=Underline text
<span class="underline">^!</span>
#T=Code fragment
<code>^!</code>
#T=Highligt text - yellow
<span class="highlight">^!</span>
#T=Centre text
<div style="text-align: center;">
^!
</div>

#T=Block Quote
<blockquote>
^!
</blockquote>
#T=Preformatted text
<pre>
^!
</pre>
#T=Outline box
<div class="box">
^!
</div>

#T=Span
<span style="">^!</span>
#T=-------------------------
-------------------------
#T=bookmark
<a name="">^!</a>
#T=   link to bookmark
<a href="#">^!</a>
#T=e-mail link
<a href="mailto:foo.bar@dev.null">^!</a>
#T=image link
<a href="../foo.gif"><img src="?.gif" alt="?" border=0>^!</a>
#T=page link
<a href="">^!</a>
#T=-------------------------
-------------------------
#T=Ordered list
<ol>
    <li>^!</li>
    <li></li>
</ol>
#T=Unordered List
<ul>
    <li>^!</li>
    <li></li>
</ul>

#T=List item
<li>^!</li>
#T=List item - no value
<li style="list-style-type: none;">^!</li>
#T=Definition list
<dl>
    <dt>^!</dt>
        <dd></dd>
    <dt></dt>
        <dd></dd>
</dl>

#T=Definition term
<dt>^!</dt>
#T=Definition data
<dd>^!</dd>
#T=-------------------------
-------------------------
#T=Table
<table summary="^!">
  <tr>
    <th width="50%"></th>
    <th width="50%"></th>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>

#T=Table row
<tr>
^!
</tr>
#T=Table data cell
<td width="">^!</td>
#T=Table header cell
<th>^!</th>
#T=Table cell width
 width="^!"
#T=Table column span
 colspan="^!"
#T=-------------------------
-------------------------
#T=Image
<img src="ScreenShot^!.jpg" alt="?" border=0>
#T=Float left
 class="float-left"
#T=Float right
 class="float-right"
#T=Clear float
<div style="clear:both;"></div>
#
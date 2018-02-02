#TITLE=HTML 4.01 by function
#INFO
Cliptext Library for HTML 4.01
Based on the W3C HTML 4.01 Specification and the w3schools.com 4.01/XHTML 1.0 Reference
    http://www.w3.org/TR/html401/
    http://www.w3schools.com/tags/ref_byfunc.asp
This cliptext contains the HTML tags ordered by function.
Depricated tags have not been included.
Author:   Peter Anderson (peterjohnanderson@gmail.com)
Licence:  Creative Commons Attribution Unported (current version)
          http://creativecommons.org.au/licences
Created:  Wednesday, 1 April 2009

#SORT=n

#T=BASIC TAGS
#T=DOCTYPE - Defines the document type
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

#T=HTML document definition
<html>
^!
</html>

#T=Body element
<body>
^!
</body>

#T=Heading 1
<h1>^!</h1>
#T=Heading 2
<h2>^!</h2>
#T=Heading 3
<h3>^!</h3>
#T=Heading 4
<h4>^!</h4>
#T=Heading 5
<h5>^!</h5>
#T=Heading 6
<h6>^!</h6>
#T=Paragraph
<p>^!</p>
#T=Line break
<br>
#T=Horizontal Rule
<hr>
#T=Comment
<!-- ^! -->
#T=--------------------
#T=CHAR FORMAT
#T=Bold text
<b>^!</b>
#T=Italic text
<i>^!</i>
#T=Strong text
<strong>^!</strong
#T=Em text
<em>^!</em>
#T=Big text
<big>^!</big>
#T=Small text
<small>^!</small>
#T=Superscripted text
<sup>^!</sup>
#T=Subscripted text
<sub>^!</sub>
#T=Bdo
<bdo dir="rtl|ltr">^!<?bdo>
#T=Underline text
<span style="text-decoration: underline;">^!</span>
#T=--------------------
#T=OUTPUT
#T=Preformatted text
<pre>
^!
</pre>

#T=Code fragment
<code>^!</code>
#T=Teletype text
<tt>^!</tt>
#T=Keyboard text
<kbd>^!</kbd>
#T=Variable
<var>^!</var>
#T=Definition term
<dfn>^!</dfn>
#T=Sample computer code
<samp>^!</samp>
#T=--------------------
#T=BLOCKS
#T=Acronym
<acronym>^!</acronym>
#T=Abbreviation
<abbr>^!</abbr>
#T=Address
<address>^!</address>
#T=Block or long quotation
<blockquote>
^!
</blockquote>

#T=Short quotation
<q>^!</q>
#T=Centered text
<div style="text-align: center;">
^!
</div>

#T=Citation
<cite>^!</cite>
#T=Inserted text
<ins>^!</ins>
#T=Deleted text
<del>^!</del>
#T=Strikethrough text
<span style="text-decoration: line-through;">^!</span>
#T=--------------------
#T=LINKS
#T=Bookmark
<a name="">^!</a>
#T=   link to bookmark
<a href="#">^!</a>
#T=E-mail link
<a href="mailto:xxx@yyy.com">^!</a>
#T=Image link
<a href="../xxx.jpg"><img src="?.jpg" alt="" border=0>^!</a>
#T=Page link
<a href="">^!</a>
#T=Link to an external resource
<link href="^!.css" rel="stylesheet" type="text/css">

#T=--------------------
#T=INPUT
#T=Form
<form action="" method="get | post">
    ^!
</form>

#T=Fieldset
<fieldset>
    ^!
</fieldset>

#T=Title in a fieldset
<legend>^!</legend>
#T=Input field
<input ^!accept="" | alt="" | checked="" | disabled="" | maxlength="" | name="" | readonly="" | size="" | src="" | type="" | text="" | value="">
#T=Text area
<textarea cols="n" rows="n">
    ^!
</textarea>

#T=Push button
<button type="button | reset | submit">^!</button>
#T=Selectable list
<select>
    <option value="">^!</option>
</select>

#T=Option group
<optgroup label="">
    <option value="">^!</option>
    ...
</optgroup>
#T=List box item
<option value="">^!</option>
#T=Label for a form control
<label for="">^!</label>
#T=--------------------
#T=LISTS
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
#T=--------------------
#T=IMAGES
#T=Image
<img src="^!.jpg" alt="?" border=0>
#T=Map - an image-map with clickable areas
<img src="^!.jpg" width="" height="" alt="" usemap="#map_name" />

<map name="map_name">
  <area...>
</map>

#T=Area - defines an area inside an image-map
<area shape="^!default | rect | circle | poly" coords="x1,y1,...,xn,yn | x,y,radius" href="?.htm" alt="Sun">
#T=--------------------
#T=TABLES
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

#T=Table caption
<caption>^!</caption>
#T=Table row
<tr>
^!
</tr>
#T=Table header cell
<th>^!</th>
#T=Table data cell
<td>^!</td>
#T=Table header
<thead>
    ^!
</thead>
#T=Table body
<tbody>
    ^!
</tbody>
#T=Table footer
<tfoot>
    ^!
</tfoot>
#T=Table columns
<col align="left" width="">^!</col>
#T=Groups of table columns
<colgroup span="" align="">^!</colgroup>

#T=Table cell width
 width="^!"
#T=Table column span
 colspan="^!"
#T=--------------------
#T=STYLES
#T=Style definition
<style type="text/css" media="screen print">
^!
</style>

#T=Division section in a document
<div class="" id="" style="">
^!
</div>

#T=Span
<span style="">^!</span>
#T=--------------------
#T=META INFO
#T=Head element container
<head>
^!
</head>

#T=Document title
<title>^!</title>

#T=Meta information about the document
<meta name="author" content="Hege Refsnes">
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">

#T=Base URL for all the links in a page
<base href="http://www.w3schools.com/images/">
<base target="_blank">

#T=--------------------
#T=PROGRAMMING
#T=Script
<script type="text/javascript">
^!
</script>
#T=Noscript section
<noscript>Your browser does not support JavaScript!</noscript>
#T=Embedded object
<object classid="^!" id="" width="" height="">
    <param name="" value="1">
    ...
</object>
#T=Parameter for an object
<param name="^!" value="">

#T=--------------------
#T=FRAMES
#T=Frameset DOCTYPE
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN"
"http://www.w3.org/TR/html4/frameset.dtd">

#T=Frame or sub-window
<frame src="^!">
#T=Set of frames
<frameset cols="^!" rows="">
    <frame src="" />
    ...
</frameset>

#T=Noframes for browsers that do not handle frames
<noframes>
    Sorry, your browser does not handle frames!
</noframes>

#T=Inline sub window (frame)
<iframe src ="^!" width="" height="">
    <p>Your browser does not support iframes.</p>
    ...
</iframe>

#

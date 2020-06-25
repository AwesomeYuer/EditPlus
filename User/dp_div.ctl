#TITLE=dp_div control
#INFO
;EditPlus Cliptext Library v1.0 written by datta Puro (dp) - U-Tosolutions(I) Pvt. Ltd.
;This file is provided as a sample Cliptext library of EditPlus.
#SORT=n

#T=Onclick div open
<script language="JavaScript">
var prevDiv = '';
function showme ( div )
{
	if (prevDiv !="")
		document.getElementById( prevDiv ).style.display='none';

		document.getElementById( div ).style.display='block';
	prevDiv = div;
	return;
}
</script>
<!-- <body ^! onload="showme('div1');"> -->
<!-- 
	<input type="button" value="Submit" class="button" onclick="showme('div1');" name=""  style="cursor:hand;">
	<input type="button" value="Submit" class="button" onclick="showme('div1');" name=""  style="cursor:hand;">
 -->
<!-- 1st div start -->
<!-- 
	<div id="div1" style="display: none;">
		<iframe frameborder='0' scrolling='auto'  width='100%' height='360' src='pageName1.htm'></iframe>
	</div>
-->
<!-- 1st div  end-->
<!-- 2nd div start -->
<!--	
	<div id="div2" style="display: none;">
		<iframe frameborder='0' scrolling='auto'  width='100%' height='360' src='cpageName2.htm'></iframe>
	</div>
-->
<!-- 2nd div  end-->

#T=Onchange/Onclick div 
<script language="JavaScript">
<!--
function playDiv(d1,d2,d3)
{
	document.getElementById(d1).style.display = "block";
	document.getElementById(d2).style.display = "none";
	document.getElementById(d3).style.display = "none";
}
function deactAll()
{
	document.getElementById('div1').style.display = document.getElementById('div2').style.display = document.getElementById('div3').style.display ="none";
	alert("Select the Type");
}
function showDiv(Obj)
{
	divToActivate = ""
	if(Obj.value == 0)
		deactAll()
	else if(Obj.value == 1)
		playDiv('div1','div2','div3')				
	else if (Obj.value == 2)
		playDiv('div2','div1','div3')				
	else if (Obj.value == 3)
		playDiv('div3','div1','div2')				
}
//-->
</script>
^!
<!-- For List Box -->
<!-- 
	<select name="" onchange="showDiv(this);">
		<option value="0" selected>Select</option>
		<option value="1">div 1....</option>
		<option value="2">div 2....</option>
		<option value="3">div 3....</option>
	</select>
 -->
<!-- For checkbox -->
<!-- 
	 <input type="checkbox" name="btn" value='1' onclick="showDiv(this);">
	 <input type="checkbox" name="btn" value='2' onclick="showDiv(this);">
	 <input type="checkbox" name="btn" value='3' onclick="showDiv(this);">
-->
<!-- For radio button -->
<!-- 
	<input type="radio" name="btn" value='1' onclick="showDiv(this);">
	<input type="radio" name="btn" value='2' onclick="showDiv(this);">
	<input type="radio" name="btn" value='3' onclick="showDiv(this);">
-->
<!-- 
	<div id="div1" style="display: none;">Div-1</div>
	<div id="div2" style="display: none;">Div-2</div>
	<div id="div3" style="display: none;">Div-3^!</div>
 -->
#T=checkbox 
<script language="JavaScript">
function Showdiv(obj)
{
	if (obj.checked==true)
	{
		document.getElementById("newDiv").style.display="block"
	}
	else 
	{
		document.getElementById("newDiv").style.display="none"	
	}
}
</script>
^!
<!--
<table width='100%' border='0' cellpadding='0' cellspacing='0' align='center' valign='top'>
	<tr>
		<td class='normal'><input type='checkbox' name='check1' value='check1'  style='cursor:hand;' onclick="Showdiv(this);"></td>
	</tr>
	<tr id="newDiv" style="display:none">
		<td class='normal'>Show div here</td>
	</tr>
</table>
 -->
#T=Radio Button 
<script language="JavaScript">
function Showdiv(obj)
{
	if (obj.value==1)
	{
		document.getElementById("newDiv").style.display="block"
		document.getElementById("newDiv2").style.display="none"
	}
	else if (obj.value==2)
	{
		document.getElementById("newDiv").style.display="none"	
		document.getElementById("newDiv2").style.display="block"
	}
}
</script>
^!
<!--
<table width='100%' border='0' cellpadding='0' cellspacing='0' align='center' valign='top'>
	<tr>
		<td class='normal'><input type='radio' name='radio1' value='1' style='cursor:hand;' onclick="Showdiv(this)">Div1&nbsp;<input type='radio' name='radio1' value='2' style='cursor:hand;' onclick="Showdiv(this)">Div1</td>
	</tr>
	<tr id="newDiv" style="display:none">
		<td class='normal'>Show div 1 here</td>
	</tr>
	<tr id="newDiv2" style="display:none">
		<td class='normal'>Show div 2 here</td>
	</tr>
</table>
 -->
#T=Select List 
<script language="JavaScript">
function Showdiv(obj)
{
	if(obj.value==0)
	{
		alert("Select List");
	}
	else if (obj.value==1)
	{
		document.getElementById("newDiv").style.display="block"
		document.getElementById("newDiv2").style.display="none"
		document.getElementById("newDiv3").style.display="none"
	}
	else if (obj.value==2)
	{
		document.getElementById("newDiv").style.display="none"	
		document.getElementById("newDiv2").style.display="block"
		document.getElementById("newDiv3").style.display="none"
	}
	else if (obj.value==3)
	{
		document.getElementById("newDiv").style.display="none"	
		document.getElementById("newDiv2").style.display="none"
		document.getElementById("newDiv3").style.display="block"
	}

}
</script>
^!
<!--
<table width='100%' border='1' cellpadding='0' cellspacing='0' align='center' valign='top'>
	<tr>
		<td class='normal'>
		<select name='' class='select' onchange="Showdiv(this);">
			<option value='0'>Please Select</option>
			<option value='1'>List Item-1</option>
			<option value='2'>List Item-2</option>
			<option value='3'>List Item-3</option>
		</select>
		</td>
	</tr>
	<tr id="newDiv" style="display:none">
		<td class='normal'>Show div 1 here</td>
	</tr>
	<tr id="newDiv2" style="display:none">
		<td class='normal'>Show div 2 here</td>
	</tr>
	<tr id="newDiv3" style="display:none">
		<td class='normal'>Show div 3 here</td>
	</tr>
</table>
 -->

#T=Tab click 
<script language="JavaScript">
function ShowTab1()
	{
		document.getElementById("tab1").style.display="block"
		document.getElementById("tab2").style.display="none"
	}
function ShowTab2()
	{
		document.getElementById("tab1").style.display="none"	
		document.getElementById("tab2").style.display="block"
	}
</script>
^!
<!--
<body onload="ShowTab1();">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
	<tr>
		<td class="normal" colspan=2 >
			<table width='10%' border='1' cellpadding='0' cellspacing='0' align='right' valign='top'>
				<tr>
					<td class='normal' width="50%" id='tab_1'><input type='button' value='TAB-1' class='button' name=''  style='cursor:hand;' onclick="ShowTab1();"></td>
					<td class='normal' id='tab_2'><input type='button' value='TAB-2' class='button' name=''  style='cursor:hand;' onclick="ShowTab2();"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr id="tab1" style="display:none">
		<td class="normal" colspan=2>
			<table width='100%' height="100" border='1' cellpadding='0' cellspacing='0' align='center' valign='top'>
				<tr>
					<td class='normal' valign='top'>Tab-1</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr id="tab2" style="display:none">
		<td class="normal" colspan=2>
			<table width='100%' height="100" border='1' cellpadding='0' cellspacing='0' align='center' valign='top'>
				<tr>
					<td class='normal' valign='top'>Tab-2</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
 -->

#
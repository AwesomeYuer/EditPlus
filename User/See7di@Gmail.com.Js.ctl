#TITLE=See7di.@JavaScript
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=GoogleMap v3例子
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
	<script type="text/javascript" src="mootools-1.2.5-core-nc.js" onerror="alert('Error loading '+this.src);"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=GB" onerror="alert('Error loading '+this.src);"></script>
	</head>

	<body id="index">
	<div id="map_canvas" style="float:left;width:900px;height:500px;"></div>
	<div id="msg" style="float:left;height:500px;width:130px;"></div>
	</body>
	<script type='text/javascript'>

	//google.maps.Marker 对象可以侦听以下用户事件
	'click','dblclick','mouseup','mousedown','mouseover','mouseout'
	'zoom_changed','click','draggend','center_changed','bounds_changed'

	Map的Events
		bounds_changed 	None 	当可视区域范围更改时会触发此事件。
		center_changed 	None 	当地图中心属性更改时会触发此事件。
		click 	MouseEvent 	当用户点击地图（但不是点击标记或信息窗口）时会触发此事件。
		dblclick 	MouseEvent 	当用户双击地图时会触发此事件。请注意，触发此事件前还会触发点击事件。
		drag 	None 	当用户拖动地图时会反复触发此事件。
		dragend 	None 	当用户停止拖动地图时会触发此事件。
		dragstart 	None 	当用户开始拖动地图时会触发此事件。
		idle 	None 	如果地图在平移或缩放之后变为闲置状态，则会触发此事件。
		maptypeid_changed 	None 	当 mapTypeId 属性更改时会触发此事件。
		mousemove 	MouseEvent 	只要用户的鼠标在地图容器上移动，就会触发此事件。
		mouseout 	MouseEvent 	当用户的鼠标从地图容器上退出时会触发此事件。
		mouseover 	MouseEvent 	当用户的鼠标进入地图容器时会触发此事件。
		projection_changed 	None 	当投影更改时会触发此事件。
		resize 	None 	当 div 更改大小时，开发人员应在地图上触发此事件：google.maps.event.trigger(map, 'resize') 。
		rightclick 	MouseEvent 	在地图容器中触发 DOM contextmenu 事件时会触发此事件。
		tilesloaded 	None 	可见图块载入完成后会触发此事件。
		zoom_changed 	None 	当地图缩放属性更改时会触发此事件。

	Marker的Events
		click 	Event 	点击标记图标后会触发此事件。
		clickable_changed 	None 	当标记的可点击属性更改时会触发此事件。
		cursor_changed 	None 	当标记的光标属性更改时会触发此事件。
		dblclick 	Event 	当双击标记图标时会触发此事件。
		drag 	MouseEvent 	当用户拖动标记时会反复触发此事件。
		dragend 	MouseEvent 	当用户停止拖动标记时会触发此事件。
		draggable_changed 	None 	当标记的可拖动属性更改时会触发此事件。
		dragstart 	MouseEvent 	当用户开始拖动标记时会触发此事件。
		flat_changed 	None 	当标记的平面属性更改时会触发此事件。
		icon_changed 	None 	当标记图标属性更改时会触发此事件。
		mousedown 	Event 	对标记图标触发 DOM mousedown 事件时会触发此事件。
		mouseout 	Event 	当鼠标离开标记图标区域时会触发此事件。
		mouseover 	Event 	当鼠标进入标记图标区域时会触发此事件。
		mouseup 	Event 	对标记触发 DOM mouseup 事件时会触发此事件。
		position_changed 	None 	当标记位置属性更改时会触发此事件。
		rightclick 	Event 	右键点击标记时会触发此事件。
		shadow_changed 	None 	当标记的阴影属性更改时会触发此事件。
		shape_changed 	None 	当标记的形状属性更改时会触发此事件。
		title_changed 	None 	当标记名称属性更改时会触发此事件。
		visible_changed 	None 	当标记的可见属性更改时会触发此事件。
		zindex_changed 	None 	当标记的 zIndex 属性更改时会触发此事件。

	google.maps.event.addDomListener(window, 'load', init);

	//地图div
	var mapDiv = document.getElementById("map_canvas");

	//创建地图
	var myLatlng = new google.maps.LatLng(29.2, -245);
	var myOptions = {
		zoom:4,
		center: myLatlng,
		mapTypeControl: false,//是否显示右上角控制
		navigationControlOptions:{//左侧的控制工具栏样式
			style: google.maps.NavigationControlStyle.SMALL
		},
		mapTypeId: google.maps.MapTypeId.ROADMAP//TERRAIN
	}
	var map = new google.maps.Map(mapDiv,myOptions);
	//=========================================================

	//拖拽完毕取得中心点坐标
	google.maps.event.addListener(map, 'dragend', function() {
		var center = map.getCenter();
		alert(center.toString());
	});

	//根据指定的 GeoRSS 供稿构造 KmlLayer
	var georssLayer = new google.maps.KmlLayer('http://api.flickr.com/services/feeds/geo/?g=322338@N20&lang=en-us&format=feed-georss');
	georssLayer.setMap(map);

	//透过kml读取数据库并标注
	var ctaLayer = new google.maps.KmlLayer('http://gmaps-samples.googlecode.com/svn/trunk/ggeoxml/cta.kml');
	ctaLayer.setMap(map);

	//点击 KML 地图项时在<div>中显示 KML 地图项的 <Description> 文本
	var nyLayer = new google.maps.KmlLayer('http://www.searcharoo.net/SearchKml/newyork.kml',{suppressInfoWindows:true});
	nyLayer.setMap(map);
	google.maps.event.addListener(nyLayer, 'click', function(kmlEvent){
		var text = kmlEvent.featureData.description;
		showInDiv(text);
		alert(text);
	});
	function showInDiv(text){
		var sidediv = document.getElementById('msg');
		sidediv.innerHTML = text;
	}

	//拖拽之后取得坐标点
	google.maps.event.addListener(map,'click',function(){
		var at = '';
		var center = map.getCenter();
		at='中心点坐标是:'+center.toString()+'\n';
		//获得四角坐标
		var minX = map.getBounds().getSouthWest().lng();
		var maxX = map.getBounds().getNorthEast().lng();
		var minY = map.getBounds().getSouthWest().lat();
		var maxY = map.getBounds().getNorthEast().lat();
		//X坐标中心点的算法:(maxX-minX)/2+minX
		//Y坐标中心点的算法:(maxY-minY)/2+minY
		at+='minX坐标是:'+minX.toString()+' maxX坐标是:'+maxX.toString()+'\n';
		at+='minY坐标是:'+minY.toString()+' maxY坐标是:'+maxY.toString()+'\n';
		alert(at);
	});
	//PHP端搜索这个范围内的数据
	$Sql="SELECT id,name,lat,lng,class,tranfic,substr(remark,30) FROM markers WHERE lng >= ".$minX." and lng <=".$maxX." and lat >= ".$minY." and lat <=".$maxY." order by id";
	</script>
#T=GoogleMap v3比较完整的例子
	function _$(s){return document.getElementById(s);}

	if(_$("map_canvas") && _$("result")){
		var tim = 0;
		var map = null;//清理对象
		var sel = _$('result');
		var mapDiv = _$("map_canvas");//地图div
		var Latlng = new google.maps.LatLng(_lat,_lng);//中心点坐标
		var iPop = new google.maps.InfoWindow({position:Latlng});//气泡
		var arrMarker=[];//存储被标记过的点
		var myOptions = {
			zoom:4,
			center:Latlng,
			navigationControl:false,//左上角缩放栏
			mapTypeId:google.maps.MapTypeId.ROADMAP
			//scaleControl:true,//左下角比例尺
			//mapTypeControl:false,//右上角控制
		}
		var map = new google.maps.Map(mapDiv,myOptions);

		google.maps.event.addListenerOnce(map,'idle',Drag);//初始进入
		google.maps.event.addListenerOnce(map,'idle',MapCursorControl);//初始进入
		google.maps.event.addListener(map,'click',function(event){getPoint(event.latLng.lat(),event.latLng.lng());});//点击地图添加新内容
		google.maps.event.addListener(map,'dragend',Drag);//拖拽之后
		//显示隐藏左侧的控制栏
		google.maps.event.addListener(map,'mouseover',function(){map.setOptions({navigationControl:true})});
		google.maps.event.addListener(map,'mouseout',function(){map.setOptions({navigationControl:false})});

		//是否为查看某个已标记的点
		if(IsViewPot==true){
			iPop.setPosition(Latlng);
			iPop.setContent('<b>操作提示:</b><br>'+Latlng+'<br>您要查看的许愿信息在此,点击标记图标即可浏览此愿望!');
			iPop.open(map);
		}
		Latlng=myOptions=null;
		$try(function(){CollectGarbage();});
	}

		//map.setOptions({navigationControl:true});


	function MapCursorControl(){
		var Pot = document.createElement("div");Pot.id="LatLonTxt";Pot.style.padding="3px";Pot.style.width="auto";//Pot.style.marginLeft="-65px";Pot.style.marginBottom="30px";
		google.maps.event.addListener(map,"mousemove",function(event){
			var tim2 = new Date;
			if(tim2.getTime() > tim){
				var ws=fixedLlString(event.latLng.lat(), event.latLng.lng());
				if(map.getMapTypeId() == google.maps.MapTypeId.HYBRID || map.getMapTypeId() == google.maps.MapTypeId.SATELLITE){
					Pot.style.color = "White";
				}else{Pot.style.color="Black";}
				Pot.innerHTML = ws;tim = tim2.getTime() + 50;
			} 
		});
		map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(Pot);
		
		return Pot;
	}

	function fixedLlString(la,lo){
		var s = "N"; var w = "E"; if (la < 0) { la = -la; s = "S" } if (lo < 0) { lo = -lo; w = "W" } var lai = Math.floor(la); var laf = Math.round((la - lai) * 1E4); var lais = lai.toString(); while (lais.length < 2) lais = "0" + lais; var lafs = laf.toString(); while (lafs.length < 4) lafs = "0" + lafs; var loi = Math.floor(lo); var lof = Math.round((lo - loi) * 1E4); var lois = loi.toString(); while (lois.length < 3) lois = "0" + lois; var lofs = lof.toString(); while (lofs.length < 4) lofs = "0" + lofs; var lamin = Math.floor((la - lai) * 60); var lasec = ((la - lai) * 60 - lamin)*60;var laseci = Math.floor(lasec); var lasecf = Math.floor((lasec - laseci) * 100); if (lamin.toString().length == 1) lamin = "0" + lamin; if (laseci.toString().length == 1) laseci = "0" + laseci; if (lasecf.toString().length == 1) lasecf = "0" + lasecf; var lomin = Math.floor((lo - loi) * 60); var losec = ((lo - loi) * 60 - lomin) * 60; var loseci = Math.floor(losec); var losecf = Math.floor((losec - loseci) * 100); if (lomin.toString().length == 1) lomin = "0" + lomin; if (loseci.toString().length == 1) loseci = "0" + loseci; if (losecf.toString().length == 1) losecf = "0" + losecf; var res=""; res = s + lais + "&deg;" + lamin + "'" + laseci + "." + lasecf + '"<br/>'; res += w + lois + "&deg;" + lomin + "'" + loseci + "." + losecf + '"<br/>'; res += "(" + (s == "S" ? "-" : "") + lais + "." + lafs + ", " + (w == "W" ? "-" : "") + lois + "." + lofs + ")";
		return res;
	}

	function Drag(){
		//隐藏显示层var center = map.getCenter();
		_$("result").style.display='none';

		//获得四角坐标
		var minX = map.getBounds().getSouthWest().lng();//西南
		var maxX = map.getBounds().getNorthEast().lng();//东北//X坐标中心点的算法:(maxX-minX)/2+minX
		var minY = map.getBounds().getSouthWest().lat();//西南
		var maxY = map.getBounds().getNorthEast().lat();//东北//Y坐标中心点的算法:(maxY-minY)/2+minY

		var myAjax=new Request({
			method:'get',
			noCache:true,
			headers:{'X-Request':'JSON'},
			url:"plugin.php?id=google_api_map_note:core&action=getlist&maxX="+maxX+"&maxY="+maxY+"&minX="+minX+"&minY="+minY+"",
			onSuccess:function(msg){
				if(msg=='[]'){return false;}

				//清理所有的标记点
				if(arrMarker && arrMarker.length){
					arrMarker.each(function(i){
						i.setMap(null);
					});
					arrMarker.empty();
				}

				var Arr=eval(""+msg+"");
				Arr.each(function(item,index){
					//$xml.=",['id':{$Rs['id']},'uid':{$Rs['uid']},'user':'','lat':'{$Rs['lat']}','lng':'{$Rs['lng']}','mess':'{$Rs['mess']}','addtime':'{$Rs['addtime']}'}";
					var marker = new google.maps.Marker({
						map:map,
						position:new google.maps.LatLng(item[4].toFloat(),item[3].toFloat()),
						//draggable:true,
						icon:image
					});
					arrMarker.push(marker);//将marker保存到数组
					var mess = '<b style="font-size:14px;">'+item[2]+'</b> 许的愿望:<br><b>'+item[5]+'</b><br><span style="font-size:11px;color:#aaa;">Time:'+item[6]+'</span>';
					PopMessage(marker,item[1],mess);//点击marker显示消息框
					marker=null;$try(function(){CollectGarbage()});
				});
				Arr=null;msg=null;$try(function(){CollectGarbage();});
			},
			onFailure:function(headerName,value){
				alert('请求失败:'+headerName+':'+value);
			}
		}).send('');
		myAjax=null;minX=null;maxX=null;minY=null;maxY=null;$try(function(){CollectGarbage();});
	}

	function PopMessage(marker,uid,mess){
		google.maps.event.addListener(marker,'click',function(){
			iPop.close();
			_$('mess').innerHTML=mess;
			_$('avatar').innerHTML='<a href="home.php?mod=space&uid='+uid+'"><img src="uc_server/avatar.php?uid='+uid+'&size=small"></a>';
			_$('avatar').style.display='';
			_$("result").style.display='';
		});
	}

	function DelMarker(){
		if(arrMarker){
			for(i in arrMarker){
				arrMarker[i].setMap(null);
			}
			arrMarker.empty();
		}
	}

	function getPoint(lat,lng){
		//iPop.close();
		if(!IsLogin){location.href='member.php?mod=logging&action=login';return false;}
		if(!confirm('操作提示:\n您需要在此许愿吗？如果是则请点击\"确定\"按钮,否则点击\"取消\"!')){return false;}

		_$('avatar').innerHTML='';
		_$('avatar').style.display='none';

		var mess = '<form method="post" action="plugin.php?id=google_api_map_note:core&action=add" onsubmit="return chkform()"><h3 style="font-size:14px;">我要许愿:</h3>请填写您的愿望:<br><textarea name="pmess" id="pmess" rows="6" style="width:100%"></textarea><input type="hidden" name="plat" id="plat" value="'+(lat)+'"><input type="hidden" name="plng" id="plng" value="'+(lng)+'"><input type="submit" value="送出我的愿望" class="btn" style="margin-top:12px;">　<input type="button" value="取消并关闭" onclick="closeLayer()" class="btn"></form>';//地图的缩放等级: '+map.getZoom()+'级<br>您许愿的坐标是: '+e.latLng+'<br>
		_$('mess').innerHTML=mess;
		_$("result").style.display='';
		lng=lat=null;$try(function(){CollectGarbage();});
	}

	function useLatlng(elat,elng){
		elat=elat.toFloat();
		elng=elng.toFloat();
		if(!$chk(elat)){alert('经度坐标值必须填写且只能填写数字!');return false;}
		if(!$chk(elng)){alert('纬度坐标值必须填写且只能填写数字!');return false;}

		Latlng=new google.maps.LatLng(elat,elng);
		var html = '经度坐标值是: '+elat+'<br>纬度坐标值是: '+elng+'<br><a href="javascript:void(0)" onclick="getPoint('+elat+','+elng+')" style="color:blue;">点击此处</a> 在这个位置许愿!';

		map.setCenter(Latlng);
		iPop.setPosition(Latlng);
		iPop.setContent(html);
		iPop.open(map);
		Drag();
	}

	function chkform(){
		plat=_$('plat').value;
		plng=_$('plng').value;
		pmess=_$('pmess').value;
		pmesslen=new String(pmess).length;
		if(!$chk(plat)){alert('经度坐标值必须填写且只能填写数字!');return false;}
		if(!$chk(plng)){alert('纬度坐标值必须填写且只能填写数字!');return false;}
		if(!$chk(pmess) || pmess=='0'){alert('愿望的内容不可为空!');return false;}
		if(pmesslen<4 || pmesslen>100){alert('愿望的内容文字个数请在3-100之间!');return false;}
		
		plat=plng=pmess=pmesslen=null;
		return true;
	}

	function closeLayer(){
		_$('avatar').innerHTML='';
		_$('mess').innerHTML='';
		_$("result").style.display='none';
	}

	//=========================================================
	document.addEvent('unload',function(){
		$try(function(){
			iPop=null;
			myOptions=null;
			Latlng=null;
			myOptions=null;
			image=null;
			sel=null;
			mapDiv=null;
			map=null;
			marker=null;
			mess=null;
			_lat=null;
			_lng=null;
			image=null;
			IsLogin=null;
			IsViewPot=null;
			GUnload;
			CollectGarbage();
		});
	});
#T=createElement
var Div1=document.createElement("div");
var Div2=document.createElement("div");
Div2.id="LatLonTxt";
Div2.style.padding="3px";
Div1.appendChild(Div2);
#T=阻止冒泡事件
<script type="text/javascript">
function aaaclick(){
    alert("td click");
}
function bbbclick(evt){
    alert("td click");
    if (window.event) {
        event.cancelBubble = true;
    }else if (evt){
        evt.stopPropagation();
    }
}
function trclick(){
    alert("tr click");
}

function tableclick(){
    alert("table click");
}
</script>
</head>
<body>
<p>点击aaaa会触发上层的onclick事件，点击bbbb不会触发上层onclick事件</p>
<table width="204" onclick="tableclick()" class="tab">
  <tr onclick="trclick()">
    <td onclick="aaaclick()">aaaa</td>
    <td onclick="bbbclick(event)">bbbbb</td>
  </tr>
</table>
</body>
#T=对象存值,可替代Array
	function cn(){
		this.Itm={};
	}
	cn.prototype.add=function(id,iArray){
		this.Itm[id]=iArray;
	}
	cn.prototype.Ext=function(id){
		if(typeof(this.Itm[id]) == "undefined"){return false;}
		return true;
	}

	var a_t = new cn();

	a_t.add("a1",["中国","韩国","台湾"]);
	a_t.add("a2",["安庆","蚌埠","巢湖","池州"]);
	a_t.add("a3",["安徽","北京","福建","甘肃","泉州"]);

	a_t.add("a4",["长春","吉林","辽源","四平","松原","通化"]);

	a_t.Itm['a5']=["滨州","德州","东营","菏泽","济南","济宁","莱芜","聊城","临沂","青岛"];

	at='';
	//输出某项的值
	at+='a2的内容:'+a_t.Itm['a2']+"\n";

	//输出某项的值的个数
	at+='a2的内容个数:'+a_t.Itm['a2'].length+"\n";

	//输出某项的值的子项
	at+='a2中第3个值为:'+a_t.Itm['a2'][2]+"\n";

	//输出某项的值
	at+='a5的内容:'+a_t.Itm['a5']+"\n";

	//是否包含某个项目
	at+='a_t内包含a7吗:';
	at+=(a_t.Ext('a57'))?'包含':'不包含';
	at+="\n";

	//是否包含某个项目
	at+='a_t内包含a5吗:';
	at+=(a_t.Ext('a5'))?'包含':'不包含';
	at+="\n";

	//修改值
	at+='a_t.Itm[\'a5\']内第5项原值是:'+(a_t.Itm['a5'][4])+"\n";
	a_t.Itm['a5'][4]='潍坊';
	at+='a_t.Itm[\'a5\']内第5项现值是:'+(a_t.Itm['a5'][4])+"\n";
	at+=

	//输出所有的内容
	at+='a_t的全部内容为:\n'+(a_t['Itm'].toSource())+'\n---------------\n';

	//输出对象的属性及属性值
	at+="a_t的属性和值分别为:\n---------------\n";
	for(i in a_t){
		at+=''+i+'的属性值是:\n'+(a_t[i])+"\n---------------\n";
	}
	at+=" \n";

	alert(at);
#T=屏蔽鼠标右键
document.oncontextmenu=function(){return false};
#T=判断变量是否为空
if(value==null||value=="")
#T=关于计时的一些例子
	<html>
	<head>
	<script type="text/javascript">
	function timedMsg(){
	var t=setTimeout("alert('5 秒！')",5000)
	}
	</script>
	</head>

	<body>
	<form><input type="button" value="显示定时的警告框" onClick = "timedMsg()"></form>
	<p>请点击上面的按钮。警告框会在 5 秒后显示。</p>
	</body>
	</html>


	<html>
	<head>
	<script type="text/javascript">
	function timedText(){
	var t1=setTimeout("document.getElementById('txt').value='2 秒'",2000)
	var t2=setTimeout("document.getElementById('txt').value='4 秒'",4000)
	var t3=setTimeout("document.getElementById('txt').value='6 秒'",6000)
	}
	</script>
	</head>
	<body><form>
	<input type="button" value="显示计时的文本" onClick="timedText()">
	<input type="text" id="txt">
	</form>
	<p>点击上面的按钮。输入框会显示出已经逝去的时间（2、4、6 秒）。</p></body></html>


	<html><head>
	<script type="text/javascript">
	var c=0
	var t
	function timedCount(){
	document.getElementById('txt').value=c
	c=c+1
	t=setTimeout("timedCount()",1000)
	}
	</script></head>

	<body><form>
	<input type="button" value="开始计时！" onClick="timedCount()">
	<input type="text" id="txt">
	</form>
	<p>请点击上面的按钮。输入框会从 0 开始一直进行计时。</p>
	</body>
	</html>


	<html>
	<head>
	<script type="text/javascript">
	var c=0
	var t
	function timedCount(){
	document.getElementById('txt').value=c
	c=c+1
	t=setTimeout("timedCount()",1000)
	}

	function stopCount(){
	clearTimeout(t)
	}
	</script>
	</head>
	<body>
	<form>
	<input type="button" value="开始计时！" onClick="timedCount()">
	<input type="text" id="txt">
	<input type="button" value="停止计时！" onClick="stopCount()">
	</form>
	<p>请点击上面的“开始计时”按钮来启动计时器。输入框会一直进行计时，从 0 开始。点击“停止计时”按钮可以终止计时。</p>
	</body></html>


	<html>
	<head>
	<script type="text/javascript">
	function startTime(){
	var today=new Date()
	var h=today.getHours()
	var m=today.getMinutes()
	var s=today.getSeconds()
	// add a zero in front of numbers<10
	m=checkTime(m)
	s=checkTime(s)
	document.getElementById('txt').innerHTML=h+":"+m+":"+s
	t=setTimeout('startTime()',500)
	}

	function checkTime(i){
	if (i<10) 
	  {i="0" + i}
	  return i
	}
	</script>
	</head>

	<body onload="startTime()"><div id="txt"></div>
	</body></html>
#T=事件批量绑定及取得事件类型,显示在title
var o = document;
o.title='';

//需要绑定的事件数组
var e = ['click','mouseup','contextmenu','scroll'];

for(var i=0;i<e.length;i++){
	var e1 = e[i];
	o['on'+e1]=function(event){
		o.title='您在'+event.type;
	}
}
#T=最好的全局变量定义方式
(function(){
	var m = '全局';

	window.onload=function(){
		alert('加载时初始值:'+m);
	};

	window.onunload=function(){
		alert('结束时初始值:'+m);
		m=null;
		alert('结束时结束值:'+m);
	}
})();
#T=对类的研究,待续
	//class类的构造函数
	function class($o1,$o2){
		this.$o1=$o1;
		this.$o2=$o2;

		//class类的一个方法
		this.get=function(i){
			return ('参数1:'+this.$o1[i]+" 参数2:"+this.$o2);
		}

		//class类的一个方法
		this.len=function(){
			return this.$o1.length;
		}

		//class类的一个方法
		this.die=function(){
			return delete this;
		}
	}

	//class类的一个方法
	class.prototype.view=function(len){
		var str='';
		//遍历每项
		for(var i=0;i<len;i++){
			str+=this.get(i)+'\n';
		}
		return str;
	}

	//创建一个clss对象,保存在变量my中
	var my=new class('Seven','冯健');
	var my=new class('Sven','冯 健');
	var my=new class('Seve','fengjian');
	alert(''+my.die);
	alert(''+my.view(my.len()));
#T=引用,待续
//不可多层引用
var a=new Object();
var b=a;

var a=new Array('a','b');
var b=a;
a.push('c');//此时b的值也随之改变
#T=闭包,待续
//闭包可以直接使用包围他的外部函数的变量
function a(msg,tim){
	window.setInterval(function(){
		alert(msg);
	},tim);
}
a('message',3000);
#T=取得参数个数以及类型
typeof和constructor的取值
{object}|object|Object
[array]|object|Array
function(){}|function|Function
'string'|string|String
55|number|Number
true|boolean|Boolean
new User()|object|User

function a(){
	if(typeof(arguments[0])=='undefined'){
		alert('没有传递任何参数!');
		return;
	}
	var arr = [];
	for(var i = 0;i<arguments.length;i++){
		if(typeof(arguments[i])=='object'){
			if(arguments[i].constructor==Object){
				arr.push('对象\n');
			}else if(arguments[i].constructor==Array){
				arr.push('数组:'+arguments[i]+' len:'+arguments[i].length+'\n');
			}
		}else{
			arr.push(typeof(arguments[i])+':'+arguments[i]+'\n');
		}
	}
	alert(arr);
}
var c = Array('qq','ww');
var d = new Object();
a('a','b',c,d,1);

//通用对参数个数和类型进行严格判断
function strict(types,args){
	//确保类型数和参数数匹配
	if(types.length!=args.length){
		console.log('个数不匹配!');
	}

	//确保类型匹配
	for(var i=0;i<args.length;i++){
		if(args[i].constructor!=types[i]){
			console.log('类型不匹配');
		}
	}
}
function a(s,d,f){
	//确保s是字串,d是数字,f是数组
	strict([String,Number,Array],arguments);
	alert(s+'|'+d+'|'+f);
}
var c = Array('qq','ww');
a('a','1',c);
#T=计时函数(仿PHP)
//函数:计时函数
//用法:Runtime($s);
function Runtime($s){
	var $e=new Date();var $e=$e.getTime();
	var $e=($e-$s);
	console.log('页面执行时间:'+$e+'毫秒');
	delete $s;delete $e;
}with(new Date){var $s=getTime();}
#T=事件绑定
a=document.getElementById('a1');
a.onmouseover=function(){
	alert('a');
};
a.onmouseout=function(){
	alert('b');
};
#T=删除节点
a=document.getElementById('a1');
a.parentNode.removeChild(a);
#T=对象操作
personObj=new Object()
personObj.firstname="John"
personObj.lastname="Adams"
personObj.age=35
personObj.eyecolor="black"
document.write(personObj.firstname + " 的年龄是 " + personObj.age + " 岁。")

//对象模板
function person(firstname,lastname,age,eyecolor){
	this.firstname=firstname
	this.lastname=lastname
	this.age=age
	this.eyecolor=eyecolor
}
myFather=new person("John","Adams",35,"black")
document.write(myFather.firstname + " 的年龄是 " + myFather.age + " 岁。")

//对象及方法
function person(name,age){
	this.firstname=name
	this.age=age
	this.aa=function(e){
		document.write(e);
	}
}
myFather=new person("John",34)
myFather.aa('bcd<br>');
document.write(myFather.firstname + "是姓名"+myFather.age)

//对象及方法
function person(name,age){
	this.firstname=name
	this.age=age
	this.aa=aa
}
function aa(e){
	document.write(e);
}
myFather=new person("John",34)
myFather.aa('bcd<br>');
document.write(myFather.firstname + "是姓名"+myFather.age)
#T=访问根节点
document.documentElement
document.body
每个节点都拥有包含着关于节点某些信息的属性。这些属性是：
nodeName（节点名称）
nodeValue（节点值）
nodeType（节点类型）
#T=getElementById
function _(s){return document.getElementById(s);}
document.getElementById('maindiv').getElementsByTagName("p");

//找到带有指定 id 的节点，然后移至其父节点并执行 removeChild() 方法
var x=document.getElementById("maindiv");
x.parentNode.removeChild(x);
#T=getElementsByTagName
function _t(s){return document.getElementsByTagName(s);}
for(var i=0;i<x.length;i++){}
var y=x[2];
#T=getElementById
function _(s){return document.getElementById(s);}
#T=getElementsByName
function _n(s){return document.getElementsByName(s);}
#T=getElementsByTagName
function _t(s){return document.getElementsByTagName(s)[0];}
#T=parentNode 返回一个给定节点的父节点
parentNode 返回一个给定节点的父节点
#T=childNodes 该属性返回一个数组，这个数组由给定元素节点的子节点构成
childNodes 该属性返回一个数组，这个数组由给定元素节点的子节点构成
#T=firstChild 返回第一个子节点
firstChild 返回第一个子节点
#T=lastChild 返回最后一个子节点
lastChild 返回最后一个子节点
#T=nextSibling 返回给定节点的下一个兄弟节点
nextSibling 返回给定节点的下一个兄弟节点
#T=previousSibling 返回给定节点的前一个兄弟节点
previousSibling 返回给定节点的前一个兄弟节点
#T=nodeType：显示节点的类型
nodeType：显示节点的类型
#T=nodeName：显示节点的名称
nodeName：显示节点的名称
#T=nodeValue：显示节点的值
nodeValue：显示节点的值
#T=attributes：获取一个属性节点
attributes：获取一个属性节点
#T=tagName:标签名
tagName:标签名
#T= 
 
#T=src="?.js"
<script type="text/javascript" src="jquery-1.6.1.min.js"></script>
<script>
	!window.jQuery && document.write('<script src="jquery-1.6.1.min.js"><\/script>');
</script>
#T=_g
_g('^!')
#T=if
if(^!){}else{}
#T=for
for(var i=0;i<_num;i++){
}
#T=DOM
对象 	描述
Window 	JavaScript 层级中的顶层对象。Window 对象表示浏览器窗口。每当 <body> 或者 <frameset> 标签出现，Window 对象就会被自动创建。
Navigator 	包含客户端浏览器的信息。
Screen 	包含客户端显示屏的信息。
History 	包含了浏览器窗口访问过的 URL。
Location 	包含了当前URL的信息。
http://www.w3school.com.cn/js/js_obj_htmldom.asp
#T=typeof
typeof(^!)=='undefined'
#T=constructor
^!.constructor==Array
#T=try
try{
	^!
}catch(e){}


try{
	//一个异常在这里产生
	window.style.diplay="";
}catch(theException){
	var name=theException.name;//异常的name
	var msg=theException.message;//异常的message
	alert(name+":" +msg);
}


try{
   //在此运行代码
}catch(err){
	txt="错误描述: " + err.description + "\n\n"
	txt+="点击OK继续。\n\n"
	alert(txt)
}

try{ 
if(x>10) 
throw "Err1"
else if(x<0)
throw "Err2"
}catch(er){
if(er=="Err1") 
alert("Error! The value is too high")
if(er == "Err2") 
alert("Error! The value is too low")
}
#T=cookie
首先，我们会创建一个可在 cookie 变量中存储访问者姓名的函数：

function setCookie(c_name,value,expiredays){
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+
((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}
上面这个函数中的参数存有 cookie 的名称、值以及过期天数。
在上面的函数中，我们首先将天数转换为有效的日期，然后我们将 cookie 名称、值及其过期日期存入 document.cookie 对象。
之后，我们要创建另一个函数来检查是否已设置 cookie：
function getCookie(c_name){
if (document.cookie.length>0){
  c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1){ 
    c_start=c_start + c_name.length+1 
    c_end=document.cookie.indexOf(";",c_start)
    if (c_end==-1) c_end=document.cookie.length
    return unescape(document.cookie.substring(c_start,c_end))
    } 
  }
return ""
}
最后，我们要创建一个函数，这个函数的作用是：如果 cookie 已设置，则显示欢迎词，否则显示提示框来要求用户输入名字。
function checkCookie(){
username=getCookie('username')
if (username!=null && username!="")
  {alert('Welcome again '+username+'!')}
else {
  username=prompt('Please enter your name:',"")
  if (username!=null && username!=""){
    setCookie('username',username,365)
    }
  }
}
#T=length
var txt="Hello world!"
document.write(txt.length)
#T=Date
with(new Date){document.write(getFullYear()+'-'+(getMonth()+1)+'-'+getDate()+'<em>星期'+'日一二三四五六'.charAt(getDay())+'</em>');}
#T=match
var str="Hello world!"

document.write(str.match("world") + "<br />")//world
document.write(str.match("World") + "<br />")//null
document.write(str.match("worlld") + "<br />")//null
document.write(str.match("world!"))//world! 
#T=onerror
onerror=handleErr
var txt=""

function handleErr(msg,url,l){
txt="There was an error on this page.\n\n"
txt+="Error: " + msg + "\n"
txt+="URL: " + url + "\n"
txt+="Line: " + l + "\n\n"
txt+="Click OK to continue.\n\n"
alert(txt)
return true
}

function message(){
adddlert("Welcome guest!")
}
#T=eval
var str = '[{"name":"王强","age":20},{"name":"王海云","age":18}]';
var JsonL=eval("("+str+")");//或var JsonL=new Function("return "+str)();
alert(JsonL[1].name);
#T=Json
///////////////////////////////////////////
var JsonL=[
	["9|a11","7|a12","5|a13","4|a14","2|a15"],
	["9|a12","7|a13","5|a13","4|a14"],
	["9|a13","7|a14","5|a13"],
];
alert(JsonL[1][0]);

var str = '[{"name":"王强","age":20},{"name":"王海云","age":18}]';
var JsonL=eval("("+str+")");//或var JsonL=new Function("return "+str)();
alert(JsonL[1].name);
for(var i=0;i<JsonL.length;i++){
	for(var key in JsonL[i]){
		alert("key："+key+",value："+JsonL[i][key]);
	}
}

var Item={"_5":"停車場","_4":"W\\ii","_3":"麥\/克風","_2":"DVD","_1":"電視機",};

//alert(Item._4);
id=4;
alert(Item['_'+id]);

//var JsonL=[
//	{"parent":1,"id":11,"tit":"a1","lst":["9|a11","7|a12","5|a13","4|a14","2|a15"]},
//	{"parent":2,"id":12,"tit":"a2","lst":["9|a11","7|a12","5|a13","4|a14"]},
//	{"parent":3,"id":13,"tit":"a3","lst":["9|a11","7|a12","5|a13"]},
//];
//alert(JsonL[0].id);
//alert(JsonL[0].lst.length);
//alert(JsonL[1].parent);
//alert(JsonL.length);
//for(var i=0;i<JsonL.length;i++){
//	for(var key in JsonL[i]){
//		alert("鍵名："+key+",值："+JsonL[i][key]);
//	}
//}
//for(var i=0;i<JsonL[0].lst.length;i++){
//	alert("值："+JsonL[0].lst[i]);
//}
//----------------------PHP应用
<?
Echo "[{'kid':{$kid},'count':{$zong}}]";
Die();
?>
success:function(msg){
	if(msg.indexOf('Error:')!=-1){alert(msg);}
	var JsonL=eval(""+msg+"");
	alert(JsonL[0].kid+'|'+JsonL[0].count);
}
#T=IsIE
var ie = !-[1,];
if(!ie){
	alert("这不是IE浏览器");
}else{
	alert("这是IE浏览器");
}
#T=inner
_g('^!').innerHTML
#T=split
Reval = "a|b|c|d";
var Arr=new Array();
Arr=Reval.split("|");//return a,b,c,d
Arr=Reval.split("|",2);//return a,b

for(i=0;i<Arr.length;i++){
	_g('selectid').options[_g('selectid').length]=new Option(Arr[i],Arr[i]);
}

#T=Boolean
var b1=new Boolean( 0)
var b2=new Boolean(1)
var b3=new Boolean("")
var b4=new Boolean(null)
var b5=new Boolean(NaN)
var b6=new Boolean("false")

document.write("0 是逻辑的 "+ b1 +"<br />")
document.write("1 是逻辑的 "+ b2 +"<br />")
document.write("空字符串是逻辑的 "+ b3 + "<br />")
document.write("null 是逻辑的 "+ b4+ "<br />")
document.write("NaN 是逻辑的 "+ b5 +"<br />")
document.write("字符串 'false' 是逻辑的 "+ b6 +"<br />")

0 是逻辑的 false
1 是逻辑的 true
空字符串是逻辑的 false
null 是逻辑的 false
NaN 是逻辑的 false
字符串 'false' 是逻辑的 true

#T=console.log();
console.log('^!');
#T=round 四舍五入
document.write(Math.round(0.60) + "<br />");//1
document.write(Math.round(0.50) + "<br />");//1
document.write(Math.round(0.49) + "<br />");//0
document.write(Math.round(-4.40) + "<br />");//-4
document.write(Math.round(-4.60));//-5
#T=四舍五入,保留小數點位數
用法：
Number_Format(3.1) 返回 3.1
Number_Format(3.1475926) 返回 3.15
function Number_Format(num){
	var num = parseFloat(num);
	if(isNaN(num)){
		alert('非數字型,不可以四捨五入!');
		return false;
	}
	return Math.round(num*100)/100;
}

用法：
Number_Format(3.1) 返回 3.10
Number_Format(3.1475926) 返回 3.15
function Number_Format(num){
	var num = parseFloat(num);
	if(isNaN(num)){
		alert('非數字型,不可以四捨五入!');
		return false;
	}
	var num = Math.round(num*100)/100;
	var s_x = num.toString();
	var pos_decimal = s_x.indexOf('.');
	if(pos_decimal < 0){
		pos_decimal = s_x.length;
		s_x += '.';
	}
	while(s_x.length <= pos_decimal + 2){s_x += '0';}
	return s_x;
}

#T=random 随机数
document.write(Math.random())

//用Math 对象的 floor() 方法和 random() 来返回一个介于 0 和 10 之间的随机数
document.write(Math.floor(Math.random()*11)) 
#T=max取最大值 min最小值
document.write(Math.max(5,7) + "<br />")
document.write(Math.max(-3,5) + "<br />")
document.write(Math.max(-3,-5) + "<br />")
document.write(Math.max(7.25,7.30))
#T=Array
var arr=new Array(1,2,3,4);
var arr=new Array();
for(i=0;i<10;i++){
	arr[i]=i;
}
x=arr[4];
y=arr.length;
//反转数组的内容
a = new Array(0,1,2,3,4);
l = a.reverse();

a = new Array(0,1,2,3,4);
//用-間隔,類似php的implode
alert(a.join("-"));//0-1-2-3-4

//往數組內追加值,用來合併數組,不修改原數組
alert(a.concat("W"));//0,1,2,3,4,W
alert(a.concat("Q", new Array(42,"VB")));//0,1,2,3,4,Q,42,VB

//移除并顯示最後一項
alert(a.pop());//4

//将新元素添加到一个数组中，并返回数组的新长度值
alert(a.push('F'));//5
alert(a);//0,1,2,3,4,F

var mycars = new Array()
mycars[0] = "Saab"
mycars[1] = "Volvo"
mycars[2] = "BMW"
for (i=0;i<mycars.length;i++){
document.write(mycars[i] + "<br />")
}
#T=while
var i=0;
while(i<=10){
	document.write("The number is " + i);
	i=i+1;
}
#T=Arrayy
Array 对象的方法

FF: Firefox, N: Netscape, IE: Internet Explorer
方法 	描述 	FF 	N 	IE
concat() 	连接两个或更多的数组，并返回结果。 	1 	4 	4
join() 	把数组的所有元素放入一个字符串。元素通过指定的分隔符进行分隔。 	1 	3 	4
pop() 	删除并返回数组的最后一个元素 	1 	4 	5.5
push() 	向数组的末尾添加一个或更多元素，并返回新的长度。 	1 	4 	5.5
reverse() 	颠倒数组中元素的顺序。 	1 	3 	4
shift() 	删除并返回数组的第一个元素 	1 	4 	5.5
slice() 	从某个已有的数组返回选定的元素 	1 	4 	4
sort() 	对数组的元素进行排序 	1 	3 	4
splice() 	删除元素，并向数组添加新元素。 	1 	4 	5.5
toSource() 	代表对象的源代码 	1 	4 	-
toString() 	把数组转换为字符串，并返回结果。 	1 	3 	4
toLocaleString() 	把数组转换为本地数组，并返回结果。 	1 	3 	4
unshift() 	向数组的开头添加一个或更多元素，并返回新的长度。 	1 	4 	6
valueOf() 	返回数组对象的原始值 	1 	2 	4
Array 对象的属性

FF: Firefox, N: Netscape, IE: Internet Explorer
属性 	描述 	FF 	N 	IE
constructor 	对创建此对象的函数的一个引用 	1 	2 	4
index 	  	1 	3 	4
input 	  	1 	3 	4
length 	设置或返回数组中元素的数目。 	1 	2 	4
prototype 	使您有能力向对象添加属性和方法 	1 	2 	4

new Array()
new Array(len)
new Array([item0,[item1,[item2,...]]]
使用数组对象的方法：
var objArray=new Array();
objArray.concact([item1[,item2[,....]]]-------------------将参数列表连接到objArray的后面形成一个新的数组并返回，原有数组不受影响。如：var arr=["a","b","c"];
arr.concact("d","e");
将返回包括从"a"到"e"字母元素的数组。而arr本身不受影响。
objArray.join(separator)-----------------以separator指定的字符作为分割符，将数组转换为字符串，当seperator 为逗号时，其作用和toString()相同。
objArray.pop()---------通俗的讲，就是弹出数组的最后一个元素。结合下面的push方法，使得将数组作为栈来使用成为可能。pop方法返回数组最后一个元素的值，并将length属性减１，即返回后立即丢失最后一个元素。
objArray.push([value1[,value2[,....]]])-------------将参数添加到数组的结尾。如：[1,2,3, 4].push("a","b")将得到[1,2,3,4,"a","b"]
objArray.reverse()将数组中的元素反转排列。如：[1,2,3].reverse()将得到[3,2,1]，这个操作是在原有数组上经行操作，同时也返回数组本身
objArray.shift()-----------移去数组的第一个元素，并返回这个元素的值。这个方法的性质和pop方法很类似，pop方法是移去最后一个元素。
objArray.slice(start,end)----------- 返回数组对象的一个子集，索引从start开始（包括 start），到end结束（不包括end),原有数组不受影响。如：[1,2,3,4,5,6].slice(1,4)将得到[2,3,4]。当 start或者end为负数时，则使用他们加上length后地值。如：[1,2,3,4,5,6].slice(-4,-1)将得到[3,4,5]。如果end小于等于start，将返回空数组。
objArray.sort(comparefn)------- 根据comparefn定义的大小比较函数，对一个数组进行排序。函数comparefn必须接受两个参数element1,element2,如果需要需要element1排在element2之前，应该返回一个负数；如果需要element1排在element2之后，应该返回一个正数，如果两个数平等对待（即保持原有顺序）则返回０。当省略comparefn时，则元素按照字典顺序排列。如：对定义的比较函数cmp: function cmp(e1,e2){return e1-e2;}则[3,4,2,7].sort(cmp)将得到[2,3,4,7].
objArray.splice(start,deleteCount[,item1,item2[,...]]]) 这是一个复杂的函数，用于完成数组元素的删除　取代和插入操作。其中，start参数表示要进行操作的索引位置，deleteCount指从start开始要删除的元素的元素个数（包括了start位置），如果deleteCount省略，则表示从start开始要删除数组的剩余部分。[,item1[,item2[,...]]]则表示可选的插入到start之前的元素列表。如：
var arr=[0,1,2,3,4,5,6];
arr.splice(1,1);
document.write(arr);//显示“０，２，３，４，５，６”
arr=[0,1,2,3,4,5,6];
arr.splice(0,0,"a","b");
document.write(arr);//显示“a,b,0,1,2,3,4,5,6"
arr=[0,1,2,3,4,5,6];
arr.splice(3,2,"c","d");
document.write(arr);//显示"0,1,2,c,d,5,6"
objArray.unshift(item1[,item2[,...]]])------------------- 将参数列表插入到数组的开头。其性质和push方法类型，但push方法是将元素添加到数组的结尾。如： [1,2,3,4].unshift("a","b")将得到["a","b",1,2,3,4]。
从大到小冒泡排序法：

var regs = new Array();
regs.push(new Array("item_1","^[\\s\\S]+$","item_1Span","法人代表不能为空","填写正确",true));
regs.push(new Array("item_2","^[\\s\\S]+$","item_2Span","开户银行不能为空","填写正确",true));
regs.push(new Array("item_3","^[\\s\\S]+$","item_3Span","帐号不能为空","填写正确",true));
//regs.push(new Array("PlantArea","^[\\s\\S]+$","PlantAreaSpan","厂房面积不能为空","填写正确",true));
regs.push(new Array("DdlWorkerNum","^[\\s\\S]+$","DdlWorkerNumSpan","员工人数不能为空","填写正确",true));
regs.push(new Array("DdlDeveloperNum","^[\\s\\S]+$","DdlDeveloperNumSpan","研发人数不能为空","填写正确",true));
//regs.push(new Array("item_7","^[\\s\\S]+$","item_7Span","品牌名称不能为空","填写正确",true));
regs.push(new Array("DdlTurnover","^[\\s\\S]+$","DdlTurnoverSpan","年营业额不能为空","填写正确",true));
//regs.push(new Array("DdlImport","^[\\s\\S]+$","DdlImportSpan","年进口额不能为空","填写正确",true));
//regs.push(new Array("DdlExport","^[\\s\\S]+$","DdlExportSpan","年出口额不能为空","填写正确",true));
regs.push(new Array("item_14","^[\\s\\S]+$","item_14Span","主要客户群不能为空","填写正确",true));
#T=RegExp
//RegExp 对象有 3 个方法：test()、exec() 以及 compile()。
test() 方法检索字符串中的指定值。返回值是 true 或 false。
var patt1=new RegExp("e");
document.write(patt1.test("The best things in life are free"));
由于该字符串中存在字母 "e"，以上代码的输出将是：true

exec() 方法检索字符串中的指定值。返回值是被找到的值。如果没有发现匹配，则返回 null。
var patt1=new RegExp("e");
document.write(patt1.exec("The best things in life are free")); 
由于该字符串中存在字母 "e"，以上代码的输出将是：e

compile() 方法用于改变 RegExp。
compile() 既可以改变检索模式，也可以添加或删除第二个参数。
var patt1=new RegExp("e");
document.write(patt1.test("The best things in life are free"));
patt1.compile("d");
document.write(patt1.test("The best things in life are free"));
由于字符串中存在 "e"，而没有 "d"，以上代码的输出是：truefalse

var r = new RegExp("^\\d{4}"+"-"+"\\d{2}$");
#T=parent
parent._g('^!').cols='160,*';
#T=switch
switch(^!.toLowerCase()){
case "^!":
	break;
default:
}
#T=isArray
if(^!.constructor==window.Array){
	window.alert ("Yes");
}
#T=confirm
if(confirm('是否確定要刪除該項目？')){window.location=('?work=del&Id=1');}
#T=replace
str=str.replace(/\n/g,"<br/>");
//g代表全部替換
//str=str.replace("abc","123");

var aa = ',1,2,3,1,2,2,2,22,202,4,';
_val='2';
re=eval('/,'+_val+'(?=,)/gi');
alert(aa.replace(re,''));
#T=indexOf
if(^!.indexOf("|")!=-1){}
#T=for in
var myArr=new Array();
myArr[0] = "Saab";
myArr[1] = "Volvo";
myArr[2] = "BMW";
for(x in myArr){
	alert(myArr[x]);
}
#T=do while
var i=0;
do{
	document.write("The number is " + i);
	i=i+1;
}while(i<0);
#T=parseInt
parseInt(^!)
#T=parseFloat
parseFloat(lat^!)
#T=toLowerCase
^!.toLowerCase();
#T=toUpperCase
^!.toUpperCase();
#T=substring
^!.substring(0,^!);
^!.substr(0,^!);
#T=try|catch
fix=function(){
	try{
		alert('a');
	}catch(exp){
		window.setTimeout("fix()", 1000);
	}
}
#T=encodeURI
encodeURI(^!)
#T=Math.random
Math.random(10)
#T=createElement
var newDiv = document.createElement('div'); 
var newText = document.createTextNode('这是新建立 div 中的文字。'); 
document.body.appendChild(newDiv); //漏了这一句，否则行不通 
newDiv.id = 'divSouth'; 
newDiv.className = 'newDivClass'; 
newDiv.setAttribute('name ','newDivName'); 
newDiv.style.margin = '0 auto'; 
newDiv.style.border = '1px solid #DDD'; 
newDiv.appendChild(newText);
#T=encodeURIComponent
window.location="?work="+encodeURIComponent(^!);
#T=window.onerror
window.onerror=function(){return true;}
#T=onselectstart
window.document.body.onselectstart = function(){return false;}
#T=window.location.reload
window.location.href=window.location.href;
window.location.reload;

location.replace(location.href)
window.top.location.replace("http://www.jb51.net")
window.location.replace(location.href+'#list')
top.location.href("http://www.jb51.net")
window.navigate ("http://www.jb51.net") 
#T=window.location.href
location.href='?work=add'
#T=location.search();
location.search();
#T=obj.contenteditable=true 
obj.contenteditable=true 
#T=Dialog:显示showModalDialog模态弹出窗口
function Dialog(url,name,w,h){
	var top=(screen.height-h)/3;
	var left=(screen.width-w)/2;
	return showModalDialog(url,name,'dialogLeft:'+left+'px;dialogTop:'+top+'px;dialogWidth:'+w+'px;dialogHeight:'+h+'px;help:no;scroll:yes;status:yes;');
}
//瀏覽本站圖片
function OpenExplorer(url){
	var Reval=Dialog(url,'ResWin',(screen.width-100),500);
	if(Reval!=null){	//返回值必須要求被訪問頁用window.returnValue = Str;賦值才可以返回結果.
		try{_g('BigImg').value=Reval;}catch(e){};
	}
}
#T=滚动文档
window.scrollBy(100,100);
#T=取得文档标题
alert(document.title)
#T=height:得到高度
_g('PopMenuBG').style.height=(document.body.scrollHeight>screen.height)?document.body.scrollHeight:screen.height;
#T=aJax:函数
//Ajax
function Ajax(){
	var _xmlHttp = null;
	this.createXMLHttpRequest = function(){try{if (window.ActiveXObject){_xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");}else if (window.XMLHttpRequest){_xmlHttp = new XMLHttpRequest();}}catch(e){alert(e.name +" : " + e.message);}}
	this.backFunction = function(_backFunction){if(_xmlHttp.readyState == 4){if(_xmlHttp.status == 200){_backFunction(_xmlHttp.responseText);}}_xmlHttp.onreadystatechange = null;}
	this.doPost = function(_url,_parameter,_backFunction){try{_xmlHttp.open("POST",_url, false);_xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");_xmlHttp.send(_parameter);}catch(e){alert(e.name +" : " + e.message);}}
	this.doGet = function(_url,_parameter,_backFunction){try{var _random = Math.round(Math.random()*10000);_xmlHttp.open("GET", (_url+"?random=" +_random +"&" + _parameter), false);_xmlHttp.send(null);}catch(e){alert(e.name +" : " + e.message);}}
	this.ajaxRequest = function(_url,_parameter,_method,_backFunction){try{this.createXMLHttpRequest();if(_method.toLowerCase() == "post"){this.doPost(_url,_parameter,_backFunction);}else{this.doGet(_url,_parameter,_backFunction);}try{_xmlHttp.onreadystatechange = this.backFunction(_backFunction);}catch(err){}}catch(e){alert(e.name+" : "+e.message);}}
}
//资源审核
function Docheck(Id){
	var url = "Sys_NewsList.php?work=docheck";
	var parameter = "Id="+Id;
	var method = "post";
	new Ajax().ajaxRequest(url,parameter,method,callBack);
	function callBack(xml){if(xml.length==0){_g('Ischk'+Id+'').innerHTML=((_g('Ischk'+Id+'').innerHTML.length<10)?'<a href=\"javascript:Docheck('+Id+')\">審核</a>':' ');}else{alert(unescape(xml));}}
}
#T=Select:操作Select内的项目
//操作Select内的项目
//参数:(来源,目的)
function S_del(Item,mudi){
	var val=_g(Item).value;
		val=val.substring(0,val.indexOf("|"));
	var txt=_g(Item).options[_g(Item).selectedIndex].text;
		txt=txt.substring(0,txt.indexOf(" ["));

	try{
		var ob=new Option(txt,val);
		_g(mudi).options[_g(mudi).length]=ob;
		_g(Item).remove(_g(Item).selectedIndex);
	}catch(e){};
}
#T=document.onmousemove:给页面内的项目加入事件
document.onmousemove = function(F){
	F=F||event;var E=F.srcElement||F.target;
	if(E.className.toLowerCase()!='line' || E.tagName.toLowerCase()!='div'){return;}
	if(document.attachEvent){//IE
		E.attachEvent("onmouseout",function(){_g('chhit').style.display='none';E.style.borderColor='#B3B3DC';});
		//window.attachEvent("onunload",function(){document.detachEvent("onmouseover","")})
	}else{//FF
		E.addEventListener("mouseout",function(){_g('chhit').style.display='none';E.style.borderColor='#B3B3DC';},false);
		//window.addEventListener("unload",function(){document.removeEventListener("mouseover","",false)},false)
	}
}
#T=document.createElement("DIV"):创建DIV
var aBg = top.window.document.createElement("DIV");
	aBg.id = "aBg";
    aBg.setAttribute("align","center");
top.window.document.body.appendChild(aBg);

var bgObj = document.getElementById("aBg");
top.document.body.removeChild(bgObj);
#T=new:创建对象
var lev=function(){
	return "啊打";
};
function Parent(){
	this.name="李小龙";
	this.age="30";
	this.lev=lev;
};
var x =new Parent();
alert(x.name);
alert(x.lev());
#T=$("frame:last",parent.document.body).detach("[scrolling]");
$("frame:last",parent.document.body).detach("[scrolling]");
#T=parent.document.getElementsByTagName("frameset")[0].cols='*,1';
parent.document.getElementsByTagName("frameset")[0].cols='*,1';
#T=判断变量已存在且不为空
var arr=new Array(1,2,3,4,'');

if(typeof(arr[3])!='undefined' && arr[3]!=''){
alert('cunzai')
}
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=window.onerror
window.onerror=function(){return true;}
#T=var userAgent
var userAgent=navigator.userAgent.toLowerCase();
#T=var is_opera
var is_opera=userAgent.indexOf('opera') != -1 && opera.version();
#T=var is_ie
var is_ie=(userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5,3);
#T=框架页不可以被单独打开
if(top.location==self.location){
	top.location="index.asp"
}
#T=传统aJax函数
//通用Ajax
function Save(Obj,StrMess,Urls){
	//alert(unescape(StrMess));
	if(window.XMLHttpRequest){xmlHttp=new XMLHttpRequest();}else if(window.ActiveXObject){xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");}
	xmlHttp.open("POST",unescape(Urls),true);//POST;Get
	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlHttp.send((StrMess));
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var msg=unescape(xmlHttp.responseText);
				//alert ('ajax返回：'+msg);//alert(xmlHttp.responseXML);
				if(msg.indexOf("【×】")!=-1){
					alert ("发生错误，原因可能如下：\n\n1.可能参数传递出错.\n\n2.您可能没有登录系统.\n\n");
					window.location.href(location.reload());
				}else{
					$(Obj).innerHTML=msg;
				}
			}else{
				var msg=unescape(xmlHttp.responseText);
				alert (msg);
				alert("ajax调用失败！"+xmlHttp.status);
			}
		}
	}
}
function editInfotitle(str,str1){//编辑信息标题str:id/str1:修改后的标题
	if(window.XMLHttpRequest){
	oBj=new XMLHttpRequest();
	}else if(window.ActiveXObject){
	oBj=new ActiveXObject("Microsoft.XMLHTTP");
	}
	oBj.open("POST","system.asp?action=Mdy_info&types=edittitle&id="+escape(str)+"&title="+escape(str1),false);
	oBj.send(null);
	var msg=unescape(oBj.responseText)
	if(msg.indexOf("Error:")!=-1){alert(msg);return false;}
}
#T=1秒钟改变一次时间
function Loadtime(){
	setInterval("DateTime.innerHTML=new Date().toLocaleString()",1000);
}
#T=改变框架窗口高度
function AutoSize(){
	if(screen.width<1024){
		alert ("为了更好的使用该系统,\n\n强烈建议您将您的显示器分辨率设置为1024*768.");
	}
	if(parent.document.getElementById("main_Frame").height<535){
		parent.document.getElementById("main_Frame").height=535;
	}
}
function iframeResize(){
	var dyniframe=null;
	var indexwin=null;
	if(document.getElementById){
		dyniframe=document.getElementById("main_Frame");
		indexwin=window;
		if(dyniframe){
			if(dyniframe.contentDocument){
				dyniframe.height=dyniframe.contentDocument.body.scrollHeight+10;
			}else if(dyniframe.document && dyniframe.document.body.scrollHeight){
				iframeheight=main_Frame.document.body.scrollHeight+10;
				windowheight=indexwin.document.body.scrollHeight-128;
				dyniframe.height=(iframeheight < windowheight) ? windowheight : iframeheight;
			//alert(iframeheight);
			//alert(windowheight);
			}
		}
	}
}
#T=接收參數
function get_url(){
	var src = window.location.href;
	var I = src.substr(src.indexOf("?u=") + 3).length;
	var T = src.indexOf("?u=");
	if (0 >= T) return "";
	if (I == src.length) return -1;
	var url = src.substr(src.indexOf("?u=") + 3);
	return url;
}
alert(get_url());
#T=操作框架
window.frames["frameName"];
window.frames["frameName"].frames["frameName2"];

window.frames.frameName
window.frames[index]
window.parent.frames["frame2"]
#T=延时操作
window.setTimeout(function(){...},1000);//只延迟1秒,不循环
window.setInterval(function(){...},1000);//延迟1秒,再循环

<meta HTTP-EQUIV=REFRESH CONTENT='60; URL=?work='>
#T=全局容错
window.onerror=function(){return true;}
#T=点击刷新
window.location.reload();
#T=获取来源
alert("你的来源是"+document.referrer);
#T=超鏈接鬼影
onFocus='if(this.blur)this.blur();'
#T=延时并清理
ID=setTimeout(hide,500);//ID=setInterval(hidebytime,500);
hide=function(){
	alert('hello');
	clearTimeout(ID);
}
#T=禁止后退
window.history.forward();
#T=延时跳转
<meta HTTP-EQUIV=REFRESH CONTENT='2; URL=in.asp'>
//setTimeout(function{windows.location='';},500);
#T=隐藏网页源文件
function clear() {            
Source=document.body.firstChild.data;          
document.open();            
document.close();            
document.body.innerHTML=Source;            
} 
#T=无提示关闭
<a href="javascript:window.opener=null;self.close();">
function closeself(){window.open('about:blank','_top','');self.close();}
#T=返回上一页
window.history.back();
#T=动态创建style节点
	有很多提供动态创建 style 节点的方法，但是大多数都仅限于外部的 css 文件。如何能使用程序生成的字符串动态创建 style 节点，我搞了2个小时。
	静态外部 css 文件语法：
	@import url(style.css);
	动态外部 css 文件加载的方法有如下：
	第一种：
	var style = document.createElement(’link’);
	style.href = ’style.css’;
	style.rel = ’stylesheet’;
	style.type = ‘text/css’;
	document.getElementsByTagName(’HEAD’).item(0).appendChild(style);
	第二种简单：
	document.createStyleSheet(style.css);
	动态的 style 节点，使用程序生成的字符串：
	var style = document.createElement(’style’);
	style.type = ‘text/css’;
	style.innerHTML=”body{ background-color:blue; }”;
	document.getElementsByTagName(’HEAD’).item(0).appendChild(style);
	很遗憾，上面的代码在 ff 里面成功，但是 ie 不支持。从老外论坛得到代码：
	var sheet = document.createStyleSheet();
	sheet.addRule(’body’,'background-color:red’);
	成功，但是很麻烦，要把字符串拆开写，长一点的写死,累的像狗一样。
	接着搜，在一个不知道什么国家的什么语言的blog上找到代码：
	document.createStyleSheet(”javascript:’body{background-color:blue;’”);
	成功，此人实在厉害，但是问题出来了，url 最大 255 个字符，长一点的就不行了，改：
	window.style=”body{background-color:blue;”;
	document.createStyleSheet(”javascript:style”);
	完美解决！！代码:
	<html>
	<head>
	<script>
	function blue(){
	if(document.all){
	window.style="body{background-color:blue;";
	document.createStyleSheet("javascript:style");
	}else{
	var style = document.createElement('style');
	style.type = 'text/css';
	style.innerHTML="body{ background-color:blue }";
	document.getElementsByTagName('HEAD').item(0).appendChild(style);
	}
	}
	</script>
	</head>
	<body>
	<input type="button" value="blue" onclick="blue();"/>
	</body>
#T=取得選中的內容
var t=window.getSelection?window.getSelection():(document.getSelection?document.getSelection():(document.selection?document.selection.createRange().text:""))
document.forms[0].selectedtext.value = t; 
#T=进入下一页
window.history.forward();//window.history.go(返回第几页,也可以使用访问过的URL);
#T=动态往iframe写内容
<div id="dd">132</div>
<script>
var s = '<iframe src="javascript:document.open();document.write(\'<script>alert(1);<\/script><div>test</div>\');document.close();"></iframe>'; 
document.getElementById("dd").innerHTML = s
</script>

<iframe id="tst" name="tst" ></iframe>   
<script> 
alert(2);  
var cw = window.document.getElementById('tst').contentWindow; 
cw.document.open();   
cw.document.write('<script>alert("test")<' + '/script>');   
cw.document.write('<div>test</div>');   
cw.document.close();   
</script>
#T=在文本字符串内部使用反斜杠对代码进行折行
document.write("Hello \
World!");
#T=在网页上显示一个时钟
<html>
<head>
<script type="text/javascript">
function startTime(){
var today=new Date()
var h=today.getHours()
var m=today.getMinutes()
var s=today.getSeconds()
// add a zero in front of numbers<10
m=checkTime(m)
s=checkTime(s)
document.getElementById('txt').innerHTML=h+":"+m+":"+s
t=setTimeout('startTime()',500)
}

function checkTime(i){
if (i<10) 
  {i="0" + i}
  return i
}
</script>
</head>

<body onload="startTime()">
<div id="txt"></div>
</body>
</html>
#T=日期比较
var myDate=new Date();
myDate.setFullYear(2008,7,9);
var today = new Date();
if (myDate>today){
alert("Today is before 9th August 2008");
}else{
alert("Today is after 9th August 2008");
}
#T=单击选择双击复制代码
<textarea name='str' id='str' cols='80%' rows='3' onClick='select();' ondblclick='window.clipboardData.setData("text",document.getElementById("str").innerText);'>测试内容……</textarea>  

#T=打开页面后间隔多少时间才显示下载链接
    <a id="readylink" href="javascript:download();" class="submitbutton">請稍等</a>  
    <a id="downloadlink" href="http://kalvin.cn/" class="submitbutton" style="display:none;">下載</a>  
      
    <script type="text/javascript">  
    var timeout="25";    
    function countdown()   
    {   
        if (timeout<=0)   
        {   
            document.getElementById("readylink").style.display="none";   
            document.getElementById("downloadlink").style.display="block";   
        }   
        if (timeout>0)   
        {   
            document.getElementById("readylink").innerHTML='請稍等'+timeout+'秒';   
            setTimeout("countdown()",1000);   
        }   
        timeout--;   
    }   
    countdown();   
      
    function download() {   
        if(timeout>0) {   
            alert('請稍等，服務器正在取得相關資源。');   
        }   
    }   
    </script>  


#T=后退刷新前进
<input type=button value=后退 onclick=history.go(-1)>
<input type=button value=刷新 onclick=history.go(-0)>
<input type=button value=前进 onclick=history.go(+1)>
#T=来源页跳转代码
    <script type="text/javascript">   
    <!--   
        if(parent.window.opener)   
        parent.window.opener.location='http://kalvin.cn/';   
    //-->   
    </script>  

#T=比较完美的复制网址到剪贴版的代码
<script type="text/javascript">  
function setCopy(content){   
    if(navigator.userAgent.toLowerCase().indexOf('ie') > -1) {   
        clipboardData.setData('Text',content);   
        alert ("该地址已经复制到剪切板");   
    } else {   
        prompt("请复制网站地址:",content);   
    }   
}     
</script>    
<a href="http://kalvin.cn/" onclick="setCopy(this.href);return false;" target="_self">复制网址</a>
#T=兼容各瀏覽器的加入收藏
<a href="http://kalvin.cn/" onclick="window.external.addFavorite(this.href,this.title);return false;" title='孤魂居' rel="sidebar">加入收藏</a>
#T=查看网站的COOKIE值
javascript:document.write(document.cookie)
#T=设为首页,加为收藏，加入频道
<A href="javascript:this.style.behavior='url(#default#homepage)';this.setHomePage('url');">设为首页</a>
<a href="javascript:window.external.AddFavorite(location.href,document.title);">加入收藏</a>
<a href="javascript:window.external.addChannel('typhoon.cdf')">加入频道</a>
#T=Marquee滚动框
<marquee direction="up" height="150" onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount=1 scrolldelay=0>
向上混动代码:
<marquee direction="up" scrolldelay="200" style="font-size: 9pt; color: #FF0000; line-height: 150%; font-style:italic; font-weight:bold" scrollamount="2" width="206" height="207" bgcolor="#FFFF00">hhhhhhhhhhhhhhhhhhh</marquee>
滚动N行，暂停数秒
<script>
function startmarquee(lh,speed,delay,index){
var t;var p=false;var o=document.getElementById("marqueebox"+index);o.innerHTML+=o.innerHTML;o.onmouseover=function(){p=true}o.onmouseout=function(){p=false}o.scrollTop = 0;
function start(){t=setInterval(scrolling,speed);if(!p) o.scrollTop += 2;}
function scrolling(){if(o.scrollTop%lh!=0){o.scrollTop += 2;if(o.scrollTop>=o.scrollHeight/2) o.scrollTop = 0;}else{clearInterval(t);setTimeout(start,delay);}}
setTimeout(start,delay);
}
startmarquee(22,50,3000,0);
</script>
#T=保留小数点位数
a=123.543543;
a.toFixed(2);
#T=全屏幕打开页面
function openw(){window.open("home.htm","","fullscreen=yes");}
#T=打开定界窗口
<a href="javascript:window.open('readMES.asp','','width=450,height=400,scrollbars=no,status=no,location=no,toolbar=no,directories=no,menubar=no')">点击</a>
#T=高级定界窗口
function Dialog(url,name,w,h){
	var top=(screen.height-h)/3;
	var left=(screen.width-w)/2;
	return showModalDialog(url,name,'dialogLeft:'+left+'px;dialogTop:'+top+'px;dialogWidth:'+w+'px;dialogHeight:'+h+'px;help:no;scroll:yes;status:yes;');
}
//瀏覽本站圖片
function OpenExplorer(url,id){
	var Reval=Dialog(url,'ResWin',(screen.width-100),500);
	try{
		if(Reval!=null){//返回值必須要求被訪問頁用window.returnValue = Str;賦值才可以返回結果.
			var Arr=new Array();
			Arr=Reval.split("|");

			for(i=0;i<Arr.length;i++){
				_g(id).options[_g(id).length]=new Option(Arr[i],Arr[i]);
			}
		}
	}catch(e){}
}
#T=FRAME不可单独打开
if(top.location==self.location){top.location='?work=getout';}
#T=在css中嵌入js
a:hover{test:expression(alert('aa'));}
#T=用mp3做背景音乐
<EMBED SRC="1.mp3" tppabs="" hidden="true" AUTOSTART="TRUE" LOOP="TRUE">
#T=全面屏蔽on事件
<body oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false" onmouseup="document.selection.empty()">
#T=禁止另存页面
<noscript><iframe src='*'></iframe></noscript>
#T=Js操作HTML的顺序
Js操作HTML的顺序:window->document->html->(head,body)
浏览器窗口中的DOM顺序是:window->(navigator,screen,history,location,document)
#T=改变状态栏的提示
<base onmouseover="window.status='^!';return true;">
#T=确认操作对话框
if(confirm('是否確認要刪除?')){
	window.location='?work=del&cpath='+encodeURIComponent(Filep)+'';
}
#T=要求用户输入内容
var str;
str=prompt('請填寫修改之后的名稱(請勿使用雙字節字符):','jpg');
if(str!=null){
	if(str==''){
		alert('Error:\n\nDirecty name empty!');
	}else{
		window.location='?work=re&oldname='+encodeURIComponent(Filen)+'';
	}
}
#T=退出之前调用过程
function Close(){alert('a');}
window.onbeforeunload=Close;
#T=防止链接文字折行
document.body.noWrap=true;
#T=字符串转换大小写
string.toUpperCase();//string.toLowerCase();
#T=定义日期型变量
var today = new Date();
#T=FRAME的表示方式
parent代表父亲对象,top代表最顶端对象,打开子窗口的父窗口为:opener
[window.]frames[n].ObjFuncVarName,frames["frameName"].ObjFuncVarName,frameName.ObjFuncVarName
today = new Date();
self.status = today.toString();
#T=运行代码的代码
<script>function Preview(){var TestWin=open('');TestWin.document.write(code.value);}</script>
<textarea id=code cols=60 rows=15></textarea><br><button onclick=Preview()>运行</button>
#T=判断上一页的来源
document.referrer
#T=获得窗口的大小
document.body.clientWidth,document.body.clientHeight
document.body.offsetWidth,document.body.offsetHeight
有时还需要知道window.screenTop,window.screenLeft
#T=定位鼠标
onload=document.form1.username.focus()
#T=网页图标
<link rel="Shortcut Icon" href="/favicon.ico"><link rel="Bookmark" href="http://www.7di.net/favicon.ico">
#T=背景音乐
<bgsound src="liushui.wav" loop="-1">
#T=去除滚动条
<body scroll="no" style="overflow-y:hidden">
#T=更换Css链接
document.all.css.href = "a.css";
#T=只能输入汉字
<input onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))">
#T=只能输入全角
<input onkeyup="value=value.replace(/[^\uFF00-\uFFFF]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\uFF00-\uFFFF]/g,''))">
#T=只能输入数字
<input onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
#T=只能输入数字
onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" onblur=\"if(isNaN(this.value)){this.value='';this.focus();}\"
#T=网页不会被缓存
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
或者<META HTTP-EQUIV="expires" CONTENT="0">
#T=禁止编辑源代码
<!-- #BeginEditable "doctitle" --><title>::</title><!-- #EndEditable -->
#T=查看网页源代码
<input type=button value=查看网页源代码 onclick="window.location = 'view-source:'+ 'http://www.csdn.net/'">
#T=判断是否包含字符
if(/[^\x00-\xff]/g.test(s)){alert("含有汉字");}else{alert("全是字符");}
#T=威龙供求信息框架
<iframe src='http://www.vlongbiz.com' name='InfoFrame' scrolling='auto' width='95%' height='450' frameborder='0'></iframe>
#T=取得控件的绝对位置
function getIE(e){
var t=e.offsetTop;var l=e.offsetLeft;
while(e=e.offsetParent){t+=e.offsetTop;l+=e.offsetLeft;}
alert("top="+t+"\nleft="+l);}
#T=只能输入英文或数字
<input onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
#T=获得系统,浏览器版本
<script>window.document.write("版本："+navigator.appName+navigator.appVersion+" browser.")</script>
#T=ENTER键可以让光标下移
<input onkeydown="if(event.keyCode==13)event.keyCode=9">
#T=点击鼠标右键起动收藏夹
if(document.all){document.body.onmousedown=new Function("if (event.button==2||event.button==3)window.external.addFavorite('http://free.pixel2001.com/88tuba/','中华网络')")}
#T=按下F12键,直接返回首页
function look(){if(event.keyCode==123){document.location.href='a.asp'}}
if(document.onkeydown==null){document.onkeydown=look}
#T=TEXTAREA自适应文字行数
<textarea rows=1 name=s1 cols=27 onpropertychange="this.style.posHeight=this.scrollHeight">
#T=状态栏动态显示现在时间
window.setTimeout("see()",1000);
#T=从指定字符串中抓取字符串
返回指定字符的ASCII码值:StringA.charCodeAt(1);
取字符串中指定位置的字符:StringA.charAt(9);
取出字符串起止点的字符串:stringA.substring(2,6);
#T=如果文字过长,则将过长的部分变成省略号显示
<DIV STYLE="width:120px;height: 50px;border:1px solid blue;overflow:hidden;text-overflow:ellipsis">
<NOBR>就是比如有一行文字，很长，表格内一行显示不下.</NOBR></DIV>
#T=日期减去天数等于第二个日期
function cc(dd,dadd){
var a = new Date(dd);a = a.valueOf();a = a - dadd * 24 * 60 * 60 * 1000;a = new Date(a);alert(a.getFullYear() + "年" + (a.getMonth() + 1) + "月" + a.getDate() + "日");}cc("12/23/2002",2);
#T=类似关机时的灰色
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<a href="login.php?do=logout&amp;u=219" onclick="return log_out()">注销登录</a>
<script type="text/javascript">
function log_out(){
	ht = document.getElementsByTagName("html");
	ht[0].style.filter = "progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)";
	if (confirm('你确认要注销吗?')){
		return true;
	}else{
		ht[0].style.filter = "";
		return false;
	}
}
</script>
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=事件总表
属性 	当以下情况发生时，出现此事件 	FF 	N 	IE
#T=onabort 	图像加载被中断 	1 	3 	4
onabort 	图像加载被中断 	1 	3 	4
#T=onblur 		元素失去焦点 	1 	2 	3
onblur 		元素失去焦点 	1 	2 	3
#T=onchange 	用户改变域的内容 	1 	2 	3
onchange 	用户改变域的内容 	1 	2 	3
#T=onclick 	鼠标点击某个对象 	1 	2 	3
onclick 	鼠标点击某个对象 	1 	2 	3
#T=ondblclick 	鼠标双击某个对象 	1 	4 	4
ondblclick 	鼠标双击某个对象 	1 	4 	4
#T=onerror 	当加载文档或图像时发生某个错误 	1 	3 	4
onerror 	当加载文档或图像时发生某个错误 	1 	3 	4
#T=onfocus 	元素获得焦点 	1 	2 	3
onfocus 	元素获得焦点 	1 	2 	3
#T=onkeydown 	某个键盘的键被按下 	1 	4 	3
onkeydown 	某个键盘的键被按下 	1 	4 	3
#T=onkeypress 	某个键盘的键被按下或按住 	1 	4 	3
onkeypress 	某个键盘的键被按下或按住 	1 	4 	3
#T=onkeyup 	某个键盘的键被松开 	1 	4 	3
onkeyup 	某个键盘的键被松开 	1 	4 	3
#T=onload		某个页面或图像被完成加载 	1 	2 	3
onload		某个页面或图像被完成加载 	1 	2 	3
#T=onmousedown 	某个鼠标按键被按下 	1 	4 	4
onmousedown 	某个鼠标按键被按下 	1 	4 	4
#T=onmousemove 	鼠标被移动 	1 	6 	3
onmousemove 	鼠标被移动 	1 	6 	3
#T=onmouseout 	鼠标从某元素移开 	1 	4 	4
onmouseout 	鼠标从某元素移开 	1 	4 	4
#T=onmouseover 	鼠标被移到某元素之上 	1 	2 	3
onmouseover 	鼠标被移到某元素之上 	1 	2 	3
#T=onmouseup 	某个鼠标按键被松开 	1 	4 	4
onmouseup 	某个鼠标按键被松开 	1 	4 	4
#T=onreset 	重置按钮被点击 	1 	3 	4
onreset 	重置按钮被点击 	1 	3 	4
#T=onresize 	窗口或框架被调整尺寸 	1 	4 	4
onresize 	窗口或框架被调整尺寸 	1 	4 	4
#T=onselect 	文本被选定 	1 	2 	3
onselect 	文本被选定 	1 	2 	3
#T=onsubmit 	提交按钮被点击 	1 	2 	3
onsubmit 	提交按钮被点击 	1 	2 	3
#T=onunload 	用户退出页面 	1 	2 	3
onunload 	用户退出页面 	1 	2 	3
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onMouseDown
onmousedown=""
#T=onMouseUp
onmouseup=""
#T=onMouseOver:当鼠标移动到某对象范围的上方时触发的事件
onMouseOver(^!)
#T=onMouseMove:鼠标移动时触发的事件
onMouseMove(^!)
#T=onMouseOut:当鼠标离开某对象范围时触发的事件
onMouseOut(^!)
#T=onKeyPress:当键盘上的某个键被按下并且释放时触发的事件.[注意:页面内必须有被聚焦的对象]
onKeyPress(^!)
#T=onKeyDown:当键盘上某个按键被按下时触发的事件[注意:页面内必须有被聚焦的对象]
onKeyDown(^!)
#T=onKeyUp:当键盘上某个按键被按放开时触发的事件[注意:页面内必须有被聚焦的对象]
onKeyUp(^!)
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onAbort:图片在下载时被用户中断
onAbort(^!)
#T=onBeforeUnload:当前页面的内容将要被改变时触发的事件
onBeforeUnload(^!)
#T=onError:捕抓当前页面因为某种原因而出现的错误，如脚本错误与外部数据引用的错误
onError(^!)
#T=onLoad:页面内空完成传送到浏览器时触发的事件，包括外部文件引入完成
onLoad(^!)
#T=onMove:浏览器的窗口被移动时触发的事件
onMove(^!)
#T=onResize:当浏览器的窗口大小被改变时触发的事件
onResize(^!)
#T=onScroll:浏览器的滚动条位置发生变化时触发的事件
onScroll(^!)
#T=onStop:浏览器的停止按钮被按下时触发的事件或者正在下载的文件被中断
onStop(^!)
#T=onUnload:当前页面将被改变时触发的事件
onUnload(^!)
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onBlur:当前元素失去焦点时触发的事件 [鼠标与键盘的触发均可]
onBlur(^!)
#T=onChange:当前元素失去焦点并且元素的内容发生改变而触发的事件 [鼠标与键盘的触发均可]
onChange(^!)
#T=onFocus:当某个元素获得焦点时触发的事件
onFocus(^!)
#T=onReset:当表单中RESET的属性被激发时触发的事件
onReset(^!)
#T=onSubmit:一个表单被递交时触发的事件
onSubmit(^!)
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onBounce:在Marquee内的内容移动至Marquee显示范围之外时触发的事件
onBounce(^!)
#T=onFinish:当Marquee元素完成需要显示的内容后触发的事件
onFinish(^!)
#T=onStart:当Marquee元素开始显示内容时触发的事件
onStart(^!)
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onBeforeCopy:当页面当前的被选择内容将要复制到浏览者系统的剪贴板前触发的事件
onBeforeCopy(^!)
#T=onBeforeCut:当页面中的一部分或者全部的内容将被移离当前页面[剪贴]并移动到浏览者的系统剪贴板时触发的事件
onBeforeCut(^!)
#T=onBeforeEditFocus:当前元素将要进入编辑状态
onBeforeEditFocus(^!)
#T=onBeforePaste:内容将要从浏览者的系统剪贴板传送[粘贴]到页面中时触发的事件
onBeforePaste(^!)
#T=onBeforeUpdate:当浏览者粘贴系统剪贴板中的内容时通知目标对象
onBeforeUpdate(^!)
#T=onContextMenu:当浏览者按下鼠标右键出现菜单时或者通过键盘的按键触发页面菜单时触发的事件 [试试在页面中的<body>中加入onContentMenu="return false"就可禁止使用鼠标右键了]
onContextMenu(^!)
#T=onCopy:当页面当前的被选择内容被复制后触发的事件
onCopy(^!)
#T=onCut:当页面当前的被选择内容被剪切时触发的事件
onCut(^!)
#T=onDrag:当某个对象被拖动时触发的事件 [活动事件]
onDrag(^!)
#T=onDragDrop:一个外部对象被鼠标拖进当前窗口或者帧
onDragDrop(^!)
#T=onDragEnd:当鼠标拖动结束时触发的事件，即鼠标的按钮被释放了
onDragEnd(^!)
#T=onDragEnter:当对象被鼠标拖动的对象进入其容器范围内时触发的事件
onDragEnter(^!)
#T=onDragLeave:当对象被鼠标拖动的对象离开其容器范围内时触发的事件
onDragLeave(^!)
#T=onDragOver:当某被拖动的对象在另一对象容器范围内拖动时触发的事件
onDragOver(^!)
#T=onDragStart:当某对象将被拖动时触发的事件
onDragStart(^!)
#T=onDrop:在一个拖动过程中，释放鼠标键时触发的事件
onDrop(^!)
#T=onLoseCapture:当元素失去鼠标移动所形成的选择焦点时触发的事件
onLoseCapture(^!)
#T=onPaste:当内容被粘贴时触发的事件
onPaste(^!)
#T=onSelect:当文本内容被选择时的事件
onSelect(^!)
#T=onSelectStart:当文本内容选择将开始发生时触发的事件
onSelectStart(^!)
#T=┉━┉━┉━┉━┉━┉
┉━┉━┉━┉━┉━┉
#T=onAfterUpdate:当数据完成由数据源到对象的传送时触发的事件
onAfterUpdate(^!)
#T=onCellChange:当数据来源发生变化时
onCellChange(^!)
#T=onDataAvailable:当数据接收完成时触发事件
onDataAvailable(^!)
#T=onDatasetChanged:数据在数据源发生变化时触发的事件
onDatasetChanged(^!)
#T=onDatasetComplete:当来子数据源的全部有效数据读取完毕时触发的事件
onDatasetComplete(^!)
#T=onErrorUpdate:当使用onBeforeUpdate事件触发取消了数据传送时，代替onAfterUpdate事件
onErrorUpdate(^!)
#T=onRowEnter:当前数据源的数据发生变化并且有新的有效数据时触发的事件
onRowEnter(^!)
#T=onRowExit:当前数据源的数据将要发生变化时触发的事件
onRowExit(^!)
#T=onRowsDelete:当前数据记录将被删除时触发的事件
onRowsDelete(^!)
#T=onRowsInserted:当前数据源将要插入新数据记录时触发的事件
onRowsInserted(^!)
#T=onAfterPrint:当文档被打印后触发的事件
onAfterPrint(^!)
#T=onBeforePrint:当文档即将打印时触发的事件
onBeforePrint(^!)
#T=onFilterChange:当某个对象的滤镜效果发生变化时触发的事件
onFilterChange(^!)
#T=onHelp:当浏览者按下F1或者浏览器的帮助选择时触发的事件
onHelp(^!)
#T=onPropertyChange:当对象的属性之一发生变化时触发的事件
onPropertyChange(^!)
#T=onReadyStateChange:当对象的初始化属性值发生变化时触发的事件
onReadyStateChange(^!)
#
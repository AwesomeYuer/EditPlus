#TITLE=See7di.@JavaScript
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=GoogleMap v3����
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

	//google.maps.Marker ����������������û��¼�
	'click','dblclick','mouseup','mousedown','mouseover','mouseout'
	'zoom_changed','click','draggend','center_changed','bounds_changed'

	Map��Events
		bounds_changed 	None 	����������Χ����ʱ�ᴥ�����¼���
		center_changed 	None 	����ͼ�������Ը���ʱ�ᴥ�����¼���
		click 	MouseEvent 	���û������ͼ�������ǵ����ǻ���Ϣ���ڣ�ʱ�ᴥ�����¼���
		dblclick 	MouseEvent 	���û�˫����ͼʱ�ᴥ�����¼�����ע�⣬�������¼�ǰ���ᴥ������¼���
		drag 	None 	���û��϶���ͼʱ�ᷴ���������¼���
		dragend 	None 	���û�ֹͣ�϶���ͼʱ�ᴥ�����¼���
		dragstart 	None 	���û���ʼ�϶���ͼʱ�ᴥ�����¼���
		idle 	None 	�����ͼ��ƽ�ƻ�����֮���Ϊ����״̬����ᴥ�����¼���
		maptypeid_changed 	None 	�� mapTypeId ���Ը���ʱ�ᴥ�����¼���
		mousemove 	MouseEvent 	ֻҪ�û�������ڵ�ͼ�������ƶ����ͻᴥ�����¼���
		mouseout 	MouseEvent 	���û������ӵ�ͼ�������˳�ʱ�ᴥ�����¼���
		mouseover 	MouseEvent 	���û����������ͼ����ʱ�ᴥ�����¼���
		projection_changed 	None 	��ͶӰ����ʱ�ᴥ�����¼���
		resize 	None 	�� div ���Ĵ�Сʱ��������ԱӦ�ڵ�ͼ�ϴ������¼���google.maps.event.trigger(map, 'resize') ��
		rightclick 	MouseEvent 	�ڵ�ͼ�����д��� DOM contextmenu �¼�ʱ�ᴥ�����¼���
		tilesloaded 	None 	�ɼ�ͼ��������ɺ�ᴥ�����¼���
		zoom_changed 	None 	����ͼ�������Ը���ʱ�ᴥ�����¼���

	Marker��Events
		click 	Event 	������ͼ���ᴥ�����¼���
		clickable_changed 	None 	����ǵĿɵ�����Ը���ʱ�ᴥ�����¼���
		cursor_changed 	None 	����ǵĹ�����Ը���ʱ�ᴥ�����¼���
		dblclick 	Event 	��˫�����ͼ��ʱ�ᴥ�����¼���
		drag 	MouseEvent 	���û��϶����ʱ�ᷴ���������¼���
		dragend 	MouseEvent 	���û�ֹͣ�϶����ʱ�ᴥ�����¼���
		draggable_changed 	None 	����ǵĿ��϶����Ը���ʱ�ᴥ�����¼���
		dragstart 	MouseEvent 	���û���ʼ�϶����ʱ�ᴥ�����¼���
		flat_changed 	None 	����ǵ�ƽ�����Ը���ʱ�ᴥ�����¼���
		icon_changed 	None 	�����ͼ�����Ը���ʱ�ᴥ�����¼���
		mousedown 	Event 	�Ա��ͼ�괥�� DOM mousedown �¼�ʱ�ᴥ�����¼���
		mouseout 	Event 	������뿪���ͼ������ʱ�ᴥ�����¼���
		mouseover 	Event 	����������ͼ������ʱ�ᴥ�����¼���
		mouseup 	Event 	�Ա�Ǵ��� DOM mouseup �¼�ʱ�ᴥ�����¼���
		position_changed 	None 	�����λ�����Ը���ʱ�ᴥ�����¼���
		rightclick 	Event 	�Ҽ�������ʱ�ᴥ�����¼���
		shadow_changed 	None 	����ǵ���Ӱ���Ը���ʱ�ᴥ�����¼���
		shape_changed 	None 	����ǵ���״���Ը���ʱ�ᴥ�����¼���
		title_changed 	None 	������������Ը���ʱ�ᴥ�����¼���
		visible_changed 	None 	����ǵĿɼ����Ը���ʱ�ᴥ�����¼���
		zindex_changed 	None 	����ǵ� zIndex ���Ը���ʱ�ᴥ�����¼���

	google.maps.event.addDomListener(window, 'load', init);

	//��ͼdiv
	var mapDiv = document.getElementById("map_canvas");

	//������ͼ
	var myLatlng = new google.maps.LatLng(29.2, -245);
	var myOptions = {
		zoom:4,
		center: myLatlng,
		mapTypeControl: false,//�Ƿ���ʾ���Ͻǿ���
		navigationControlOptions:{//���Ŀ��ƹ�������ʽ
			style: google.maps.NavigationControlStyle.SMALL
		},
		mapTypeId: google.maps.MapTypeId.ROADMAP//TERRAIN
	}
	var map = new google.maps.Map(mapDiv,myOptions);
	//=========================================================

	//��ק���ȡ�����ĵ�����
	google.maps.event.addListener(map, 'dragend', function() {
		var center = map.getCenter();
		alert(center.toString());
	});

	//����ָ���� GeoRSS ���幹�� KmlLayer
	var georssLayer = new google.maps.KmlLayer('http://api.flickr.com/services/feeds/geo/?g=322338@N20&lang=en-us&format=feed-georss');
	georssLayer.setMap(map);

	//͸��kml��ȡ���ݿⲢ��ע
	var ctaLayer = new google.maps.KmlLayer('http://gmaps-samples.googlecode.com/svn/trunk/ggeoxml/cta.kml');
	ctaLayer.setMap(map);

	//��� KML ��ͼ��ʱ��<div>����ʾ KML ��ͼ��� <Description> �ı�
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

	//��ק֮��ȡ�������
	google.maps.event.addListener(map,'click',function(){
		var at = '';
		var center = map.getCenter();
		at='���ĵ�������:'+center.toString()+'\n';
		//����Ľ�����
		var minX = map.getBounds().getSouthWest().lng();
		var maxX = map.getBounds().getNorthEast().lng();
		var minY = map.getBounds().getSouthWest().lat();
		var maxY = map.getBounds().getNorthEast().lat();
		//X�������ĵ���㷨:(maxX-minX)/2+minX
		//Y�������ĵ���㷨:(maxY-minY)/2+minY
		at+='minX������:'+minX.toString()+' maxX������:'+maxX.toString()+'\n';
		at+='minY������:'+minY.toString()+' maxY������:'+maxY.toString()+'\n';
		alert(at);
	});
	//PHP�����������Χ�ڵ�����
	$Sql="SELECT id,name,lat,lng,class,tranfic,substr(remark,30) FROM markers WHERE lng >= ".$minX." and lng <=".$maxX." and lat >= ".$minY." and lat <=".$maxY." order by id";
	</script>
#T=GoogleMap v3�Ƚ�����������
	function _$(s){return document.getElementById(s);}

	if(_$("map_canvas") && _$("result")){
		var tim = 0;
		var map = null;//�������
		var sel = _$('result');
		var mapDiv = _$("map_canvas");//��ͼdiv
		var Latlng = new google.maps.LatLng(_lat,_lng);//���ĵ�����
		var iPop = new google.maps.InfoWindow({position:Latlng});//����
		var arrMarker=[];//�洢����ǹ��ĵ�
		var myOptions = {
			zoom:4,
			center:Latlng,
			navigationControl:false,//���Ͻ�������
			mapTypeId:google.maps.MapTypeId.ROADMAP
			//scaleControl:true,//���½Ǳ�����
			//mapTypeControl:false,//���Ͻǿ���
		}
		var map = new google.maps.Map(mapDiv,myOptions);

		google.maps.event.addListenerOnce(map,'idle',Drag);//��ʼ����
		google.maps.event.addListenerOnce(map,'idle',MapCursorControl);//��ʼ����
		google.maps.event.addListener(map,'click',function(event){getPoint(event.latLng.lat(),event.latLng.lng());});//�����ͼ���������
		google.maps.event.addListener(map,'dragend',Drag);//��ק֮��
		//��ʾ�������Ŀ�����
		google.maps.event.addListener(map,'mouseover',function(){map.setOptions({navigationControl:true})});
		google.maps.event.addListener(map,'mouseout',function(){map.setOptions({navigationControl:false})});

		//�Ƿ�Ϊ�鿴ĳ���ѱ�ǵĵ�
		if(IsViewPot==true){
			iPop.setPosition(Latlng);
			iPop.setContent('<b>������ʾ:</b><br>'+Latlng+'<br>��Ҫ�鿴����Ը��Ϣ�ڴ�,������ͼ�꼴�������Ը��!');
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
		//������ʾ��var center = map.getCenter();
		_$("result").style.display='none';

		//����Ľ�����
		var minX = map.getBounds().getSouthWest().lng();//����
		var maxX = map.getBounds().getNorthEast().lng();//����//X�������ĵ���㷨:(maxX-minX)/2+minX
		var minY = map.getBounds().getSouthWest().lat();//����
		var maxY = map.getBounds().getNorthEast().lat();//����//Y�������ĵ���㷨:(maxY-minY)/2+minY

		var myAjax=new Request({
			method:'get',
			noCache:true,
			headers:{'X-Request':'JSON'},
			url:"plugin.php?id=google_api_map_note:core&action=getlist&maxX="+maxX+"&maxY="+maxY+"&minX="+minX+"&minY="+minY+"",
			onSuccess:function(msg){
				if(msg=='[]'){return false;}

				//�������еı�ǵ�
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
					arrMarker.push(marker);//��marker���浽����
					var mess = '<b style="font-size:14px;">'+item[2]+'</b> ���Ը��:<br><b>'+item[5]+'</b><br><span style="font-size:11px;color:#aaa;">Time:'+item[6]+'</span>';
					PopMessage(marker,item[1],mess);//���marker��ʾ��Ϣ��
					marker=null;$try(function(){CollectGarbage()});
				});
				Arr=null;msg=null;$try(function(){CollectGarbage();});
			},
			onFailure:function(headerName,value){
				alert('����ʧ��:'+headerName+':'+value);
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
		if(!confirm('������ʾ:\n����Ҫ�ڴ���Ը�������������\"ȷ��\"��ť,������\"ȡ��\"!')){return false;}

		_$('avatar').innerHTML='';
		_$('avatar').style.display='none';

		var mess = '<form method="post" action="plugin.php?id=google_api_map_note:core&action=add" onsubmit="return chkform()"><h3 style="font-size:14px;">��Ҫ��Ը:</h3>����д����Ը��:<br><textarea name="pmess" id="pmess" rows="6" style="width:100%"></textarea><input type="hidden" name="plat" id="plat" value="'+(lat)+'"><input type="hidden" name="plng" id="plng" value="'+(lng)+'"><input type="submit" value="�ͳ��ҵ�Ը��" class="btn" style="margin-top:12px;">��<input type="button" value="ȡ�����ر�" onclick="closeLayer()" class="btn"></form>';//��ͼ�����ŵȼ�: '+map.getZoom()+'��<br>����Ը��������: '+e.latLng+'<br>
		_$('mess').innerHTML=mess;
		_$("result").style.display='';
		lng=lat=null;$try(function(){CollectGarbage();});
	}

	function useLatlng(elat,elng){
		elat=elat.toFloat();
		elng=elng.toFloat();
		if(!$chk(elat)){alert('��������ֵ������д��ֻ����д����!');return false;}
		if(!$chk(elng)){alert('γ������ֵ������д��ֻ����д����!');return false;}

		Latlng=new google.maps.LatLng(elat,elng);
		var html = '��������ֵ��: '+elat+'<br>γ������ֵ��: '+elng+'<br><a href="javascript:void(0)" onclick="getPoint('+elat+','+elng+')" style="color:blue;">����˴�</a> �����λ����Ը!';

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
		if(!$chk(plat)){alert('��������ֵ������д��ֻ����д����!');return false;}
		if(!$chk(plng)){alert('γ������ֵ������д��ֻ����д����!');return false;}
		if(!$chk(pmess) || pmess=='0'){alert('Ը�������ݲ���Ϊ��!');return false;}
		if(pmesslen<4 || pmesslen>100){alert('Ը�����������ָ�������3-100֮��!');return false;}
		
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
#T=��ֹð���¼�
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
<p>���aaaa�ᴥ���ϲ��onclick�¼������bbbb���ᴥ���ϲ�onclick�¼�</p>
<table width="204" onclick="tableclick()" class="tab">
  <tr onclick="trclick()">
    <td onclick="aaaclick()">aaaa</td>
    <td onclick="bbbclick(event)">bbbbb</td>
  </tr>
</table>
</body>
#T=�����ֵ,�����Array
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

	a_t.add("a1",["�й�","����","̨��"]);
	a_t.add("a2",["����","����","����","����"]);
	a_t.add("a3",["����","����","����","����","Ȫ��"]);

	a_t.add("a4",["����","����","��Դ","��ƽ","��ԭ","ͨ��"]);

	a_t.Itm['a5']=["����","����","��Ӫ","����","����","����","����","�ĳ�","����","�ൺ"];

	at='';
	//���ĳ���ֵ
	at+='a2������:'+a_t.Itm['a2']+"\n";

	//���ĳ���ֵ�ĸ���
	at+='a2�����ݸ���:'+a_t.Itm['a2'].length+"\n";

	//���ĳ���ֵ������
	at+='a2�е�3��ֵΪ:'+a_t.Itm['a2'][2]+"\n";

	//���ĳ���ֵ
	at+='a5������:'+a_t.Itm['a5']+"\n";

	//�Ƿ����ĳ����Ŀ
	at+='a_t�ڰ���a7��:';
	at+=(a_t.Ext('a57'))?'����':'������';
	at+="\n";

	//�Ƿ����ĳ����Ŀ
	at+='a_t�ڰ���a5��:';
	at+=(a_t.Ext('a5'))?'����':'������';
	at+="\n";

	//�޸�ֵ
	at+='a_t.Itm[\'a5\']�ڵ�5��ԭֵ��:'+(a_t.Itm['a5'][4])+"\n";
	a_t.Itm['a5'][4]='Ϋ��';
	at+='a_t.Itm[\'a5\']�ڵ�5����ֵ��:'+(a_t.Itm['a5'][4])+"\n";
	at+=

	//������е�����
	at+='a_t��ȫ������Ϊ:\n'+(a_t['Itm'].toSource())+'\n---------------\n';

	//�����������Լ�����ֵ
	at+="a_t�����Ժ�ֵ�ֱ�Ϊ:\n---------------\n";
	for(i in a_t){
		at+=''+i+'������ֵ��:\n'+(a_t[i])+"\n---------------\n";
	}
	at+=" \n";

	alert(at);
#T=��������Ҽ�
document.oncontextmenu=function(){return false};
#T=�жϱ����Ƿ�Ϊ��
if(value==null||value=="")
#T=���ڼ�ʱ��һЩ����
	<html>
	<head>
	<script type="text/javascript">
	function timedMsg(){
	var t=setTimeout("alert('5 �룡')",5000)
	}
	</script>
	</head>

	<body>
	<form><input type="button" value="��ʾ��ʱ�ľ����" onClick = "timedMsg()"></form>
	<p>��������İ�ť���������� 5 �����ʾ��</p>
	</body>
	</html>


	<html>
	<head>
	<script type="text/javascript">
	function timedText(){
	var t1=setTimeout("document.getElementById('txt').value='2 ��'",2000)
	var t2=setTimeout("document.getElementById('txt').value='4 ��'",4000)
	var t3=setTimeout("document.getElementById('txt').value='6 ��'",6000)
	}
	</script>
	</head>
	<body><form>
	<input type="button" value="��ʾ��ʱ���ı�" onClick="timedText()">
	<input type="text" id="txt">
	</form>
	<p>�������İ�ť����������ʾ���Ѿ���ȥ��ʱ�䣨2��4��6 �룩��</p></body></html>


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
	<input type="button" value="��ʼ��ʱ��" onClick="timedCount()">
	<input type="text" id="txt">
	</form>
	<p>��������İ�ť��������� 0 ��ʼһֱ���м�ʱ��</p>
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
	<input type="button" value="��ʼ��ʱ��" onClick="timedCount()">
	<input type="text" id="txt">
	<input type="button" value="ֹͣ��ʱ��" onClick="stopCount()">
	</form>
	<p>��������ġ���ʼ��ʱ����ť��������ʱ����������һֱ���м�ʱ���� 0 ��ʼ�������ֹͣ��ʱ����ť������ֹ��ʱ��</p>
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
#T=�¼������󶨼�ȡ���¼�����,��ʾ��title
var o = document;
o.title='';

//��Ҫ�󶨵��¼�����
var e = ['click','mouseup','contextmenu','scroll'];

for(var i=0;i<e.length;i++){
	var e1 = e[i];
	o['on'+e1]=function(event){
		o.title='����'+event.type;
	}
}
#T=��õ�ȫ�ֱ������巽ʽ
(function(){
	var m = 'ȫ��';

	window.onload=function(){
		alert('����ʱ��ʼֵ:'+m);
	};

	window.onunload=function(){
		alert('����ʱ��ʼֵ:'+m);
		m=null;
		alert('����ʱ����ֵ:'+m);
	}
})();
#T=������о�,����
	//class��Ĺ��캯��
	function class($o1,$o2){
		this.$o1=$o1;
		this.$o2=$o2;

		//class���һ������
		this.get=function(i){
			return ('����1:'+this.$o1[i]+" ����2:"+this.$o2);
		}

		//class���һ������
		this.len=function(){
			return this.$o1.length;
		}

		//class���һ������
		this.die=function(){
			return delete this;
		}
	}

	//class���һ������
	class.prototype.view=function(len){
		var str='';
		//����ÿ��
		for(var i=0;i<len;i++){
			str+=this.get(i)+'\n';
		}
		return str;
	}

	//����һ��clss����,�����ڱ���my��
	var my=new class('Seven','�뽡');
	var my=new class('Sven','�� ��');
	var my=new class('Seve','fengjian');
	alert(''+my.die);
	alert(''+my.view(my.len()));
#T=����,����
//���ɶ������
var a=new Object();
var b=a;

var a=new Array('a','b');
var b=a;
a.push('c');//��ʱb��ֵҲ��֮�ı�
#T=�հ�,����
//�հ�����ֱ��ʹ�ð�Χ�����ⲿ�����ı���
function a(msg,tim){
	window.setInterval(function(){
		alert(msg);
	},tim);
}
a('message',3000);
#T=ȡ�ò��������Լ�����
typeof��constructor��ȡֵ
{object}|object|Object
[array]|object|Array
function(){}|function|Function
'string'|string|String
55|number|Number
true|boolean|Boolean
new User()|object|User

function a(){
	if(typeof(arguments[0])=='undefined'){
		alert('û�д����κβ���!');
		return;
	}
	var arr = [];
	for(var i = 0;i<arguments.length;i++){
		if(typeof(arguments[i])=='object'){
			if(arguments[i].constructor==Object){
				arr.push('����\n');
			}else if(arguments[i].constructor==Array){
				arr.push('����:'+arguments[i]+' len:'+arguments[i].length+'\n');
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

//ͨ�öԲ������������ͽ����ϸ��ж�
function strict(types,args){
	//ȷ���������Ͳ�����ƥ��
	if(types.length!=args.length){
		console.log('������ƥ��!');
	}

	//ȷ������ƥ��
	for(var i=0;i<args.length;i++){
		if(args[i].constructor!=types[i]){
			console.log('���Ͳ�ƥ��');
		}
	}
}
function a(s,d,f){
	//ȷ��s���ִ�,d������,f������
	strict([String,Number,Array],arguments);
	alert(s+'|'+d+'|'+f);
}
var c = Array('qq','ww');
a('a','1',c);
#T=��ʱ����(��PHP)
//����:��ʱ����
//�÷�:Runtime($s);
function Runtime($s){
	var $e=new Date();var $e=$e.getTime();
	var $e=($e-$s);
	console.log('ҳ��ִ��ʱ��:'+$e+'����');
	delete $s;delete $e;
}with(new Date){var $s=getTime();}
#T=�¼���
a=document.getElementById('a1');
a.onmouseover=function(){
	alert('a');
};
a.onmouseout=function(){
	alert('b');
};
#T=ɾ���ڵ�
a=document.getElementById('a1');
a.parentNode.removeChild(a);
#T=�������
personObj=new Object()
personObj.firstname="John"
personObj.lastname="Adams"
personObj.age=35
personObj.eyecolor="black"
document.write(personObj.firstname + " �������� " + personObj.age + " �ꡣ")

//����ģ��
function person(firstname,lastname,age,eyecolor){
	this.firstname=firstname
	this.lastname=lastname
	this.age=age
	this.eyecolor=eyecolor
}
myFather=new person("John","Adams",35,"black")
document.write(myFather.firstname + " �������� " + myFather.age + " �ꡣ")

//���󼰷���
function person(name,age){
	this.firstname=name
	this.age=age
	this.aa=function(e){
		document.write(e);
	}
}
myFather=new person("John",34)
myFather.aa('bcd<br>');
document.write(myFather.firstname + "������"+myFather.age)

//���󼰷���
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
document.write(myFather.firstname + "������"+myFather.age)
#T=���ʸ��ڵ�
document.documentElement
document.body
ÿ���ڵ㶼ӵ�а����Ź��ڽڵ�ĳЩ��Ϣ�����ԡ���Щ�����ǣ�
nodeName���ڵ����ƣ�
nodeValue���ڵ�ֵ��
nodeType���ڵ����ͣ�
#T=getElementById
function _(s){return document.getElementById(s);}
document.getElementById('maindiv').getElementsByTagName("p");

//�ҵ�����ָ�� id �Ľڵ㣬Ȼ�������丸�ڵ㲢ִ�� removeChild() ����
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
#T=parentNode ����һ�������ڵ�ĸ��ڵ�
parentNode ����һ�������ڵ�ĸ��ڵ�
#T=childNodes �����Է���һ�����飬��������ɸ���Ԫ�ؽڵ���ӽڵ㹹��
childNodes �����Է���һ�����飬��������ɸ���Ԫ�ؽڵ���ӽڵ㹹��
#T=firstChild ���ص�һ���ӽڵ�
firstChild ���ص�һ���ӽڵ�
#T=lastChild �������һ���ӽڵ�
lastChild �������һ���ӽڵ�
#T=nextSibling ���ظ����ڵ����һ���ֵܽڵ�
nextSibling ���ظ����ڵ����һ���ֵܽڵ�
#T=previousSibling ���ظ����ڵ��ǰһ���ֵܽڵ�
previousSibling ���ظ����ڵ��ǰһ���ֵܽڵ�
#T=nodeType����ʾ�ڵ������
nodeType����ʾ�ڵ������
#T=nodeName����ʾ�ڵ������
nodeName����ʾ�ڵ������
#T=nodeValue����ʾ�ڵ��ֵ
nodeValue����ʾ�ڵ��ֵ
#T=attributes����ȡһ�����Խڵ�
attributes����ȡһ�����Խڵ�
#T=tagName:��ǩ��
tagName:��ǩ��
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
���� 	����
Window 	JavaScript �㼶�еĶ������Window �����ʾ��������ڡ�ÿ�� <body> ���� <frameset> ��ǩ���֣�Window ����ͻᱻ�Զ�������
Navigator 	�����ͻ������������Ϣ��
Screen 	�����ͻ�����ʾ������Ϣ��
History 	��������������ڷ��ʹ��� URL��
Location 	�����˵�ǰURL����Ϣ��
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
	//һ���쳣���������
	window.style.diplay="";
}catch(theException){
	var name=theException.name;//�쳣��name
	var msg=theException.message;//�쳣��message
	alert(name+":" +msg);
}


try{
   //�ڴ����д���
}catch(err){
	txt="��������: " + err.description + "\n\n"
	txt+="���OK������\n\n"
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
���ȣ����ǻᴴ��һ������ cookie �����д洢�����������ĺ�����

function setCookie(c_name,value,expiredays){
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+
((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}
������������еĲ������� cookie �����ơ�ֵ�Լ�����������
������ĺ����У��������Ƚ�����ת��Ϊ��Ч�����ڣ�Ȼ�����ǽ� cookie ���ơ�ֵ����������ڴ��� document.cookie ����
֮������Ҫ������һ������������Ƿ������� cookie��
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
�������Ҫ����һ����������������������ǣ���� cookie �����ã�����ʾ��ӭ�ʣ�������ʾ��ʾ����Ҫ���û��������֡�
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
with(new Date){document.write(getFullYear()+'-'+(getMonth()+1)+'-'+getDate()+'<em>����'+'��һ����������'.charAt(getDay())+'</em>');}
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
var str = '[{"name":"��ǿ","age":20},{"name":"������","age":18}]';
var JsonL=eval("("+str+")");//��var JsonL=new Function("return "+str)();
alert(JsonL[1].name);
#T=Json
///////////////////////////////////////////
var JsonL=[
	["9|a11","7|a12","5|a13","4|a14","2|a15"],
	["9|a12","7|a13","5|a13","4|a14"],
	["9|a13","7|a14","5|a13"],
];
alert(JsonL[1][0]);

var str = '[{"name":"��ǿ","age":20},{"name":"������","age":18}]';
var JsonL=eval("("+str+")");//��var JsonL=new Function("return "+str)();
alert(JsonL[1].name);
for(var i=0;i<JsonL.length;i++){
	for(var key in JsonL[i]){
		alert("key��"+key+",value��"+JsonL[i][key]);
	}
}

var Item={"_5":"ͣ܇��","_4":"W\\ii","_3":"��\/���L","_2":"DVD","_1":"�ҕ�C",};

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
//		alert("�I����"+key+",ֵ��"+JsonL[i][key]);
//	}
//}
//for(var i=0;i<JsonL[0].lst.length;i++){
//	alert("ֵ��"+JsonL[0].lst[i]);
//}
//----------------------PHPӦ��
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
	alert("�ⲻ��IE�����");
}else{
	alert("����IE�����");
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

document.write("0 ���߼��� "+ b1 +"<br />")
document.write("1 ���߼��� "+ b2 +"<br />")
document.write("���ַ������߼��� "+ b3 + "<br />")
document.write("null ���߼��� "+ b4+ "<br />")
document.write("NaN ���߼��� "+ b5 +"<br />")
document.write("�ַ��� 'false' ���߼��� "+ b6 +"<br />")

0 ���߼��� false
1 ���߼��� true
���ַ������߼��� false
null ���߼��� false
NaN ���߼��� false
�ַ��� 'false' ���߼��� true

#T=console.log();
console.log('^!');
#T=round ��������
document.write(Math.round(0.60) + "<br />");//1
document.write(Math.round(0.50) + "<br />");//1
document.write(Math.round(0.49) + "<br />");//0
document.write(Math.round(-4.40) + "<br />");//-4
document.write(Math.round(-4.60));//-5
#T=��������,����С���cλ��
�÷���
Number_Format(3.1) ���� 3.1
Number_Format(3.1475926) ���� 3.15
function Number_Format(num){
	var num = parseFloat(num);
	if(isNaN(num)){
		alert('�ǔ�����,�������Ē�����!');
		return false;
	}
	return Math.round(num*100)/100;
}

�÷���
Number_Format(3.1) ���� 3.10
Number_Format(3.1475926) ���� 3.15
function Number_Format(num){
	var num = parseFloat(num);
	if(isNaN(num)){
		alert('�ǔ�����,�������Ē�����!');
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

#T=random �����
document.write(Math.random())

//��Math ����� floor() ������ random() ������һ������ 0 �� 10 ֮��������
document.write(Math.floor(Math.random()*11)) 
#T=maxȡ���ֵ min��Сֵ
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
//��ת���������
a = new Array(0,1,2,3,4);
l = a.reverse();

a = new Array(0,1,2,3,4);
//��-�g��,���php��implode
alert(a.join("-"));//0-1-2-3-4

//�����M��׷��ֵ,�Á�ρ㔵�M,���޸�ԭ���M
alert(a.concat("W"));//0,1,2,3,4,W
alert(a.concat("Q", new Array(42,"VB")));//0,1,2,3,4,Q,42,VB

//�Ƴ����@ʾ����һ�
alert(a.pop());//4

//����Ԫ����ӵ�һ�������У�������������³���ֵ
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
Array ����ķ���

FF: Firefox, N: Netscape, IE: Internet Explorer
���� 	���� 	FF 	N 	IE
concat() 	�����������������飬�����ؽ���� 	1 	4 	4
join() 	�����������Ԫ�ط���һ���ַ�����Ԫ��ͨ��ָ���ķָ������зָ��� 	1 	3 	4
pop() 	ɾ����������������һ��Ԫ�� 	1 	4 	5.5
push() 	�������ĩβ���һ�������Ԫ�أ��������µĳ��ȡ� 	1 	4 	5.5
reverse() 	�ߵ�������Ԫ�ص�˳�� 	1 	3 	4
shift() 	ɾ������������ĵ�һ��Ԫ�� 	1 	4 	5.5
slice() 	��ĳ�����е����鷵��ѡ����Ԫ�� 	1 	4 	4
sort() 	�������Ԫ�ؽ������� 	1 	3 	4
splice() 	ɾ��Ԫ�أ��������������Ԫ�ء� 	1 	4 	5.5
toSource() 	��������Դ���� 	1 	4 	-
toString() 	������ת��Ϊ�ַ����������ؽ���� 	1 	3 	4
toLocaleString() 	������ת��Ϊ�������飬�����ؽ���� 	1 	3 	4
unshift() 	������Ŀ�ͷ���һ�������Ԫ�أ��������µĳ��ȡ� 	1 	4 	6
valueOf() 	������������ԭʼֵ 	1 	2 	4
Array ���������

FF: Firefox, N: Netscape, IE: Internet Explorer
���� 	���� 	FF 	N 	IE
constructor 	�Դ����˶���ĺ�����һ������ 	1 	2 	4
index 	  	1 	3 	4
input 	  	1 	3 	4
length 	���û򷵻�������Ԫ�ص���Ŀ�� 	1 	2 	4
prototype 	ʹ�������������������Ժͷ��� 	1 	2 	4

new Array()
new Array(len)
new Array([item0,[item1,[item2,...]]]
ʹ���������ķ�����
var objArray=new Array();
objArray.concact([item1[,item2[,....]]]-------------------�������б����ӵ�objArray�ĺ����γ�һ���µ����鲢���أ�ԭ�����鲻��Ӱ�졣�磺var arr=["a","b","c"];
arr.concact("d","e");
�����ذ�����"a"��"e"��ĸԪ�ص����顣��arr������Ӱ�졣
objArray.join(separator)-----------------��separatorָ�����ַ���Ϊ�ָ����������ת��Ϊ�ַ�������seperator Ϊ����ʱ�������ú�toString()��ͬ��
objArray.pop()---------ͨ�׵Ľ������ǵ�����������һ��Ԫ�ء���������push������ʹ�ý�������Ϊջ��ʹ�ó�Ϊ���ܡ�pop���������������һ��Ԫ�ص�ֵ������length���Լ����������غ�������ʧ���һ��Ԫ�ء�
objArray.push([value1[,value2[,....]]])-------------��������ӵ�����Ľ�β���磺[1,2,3, 4].push("a","b")���õ�[1,2,3,4,"a","b"]
objArray.reverse()�������е�Ԫ�ط�ת���С��磺[1,2,3].reverse()���õ�[3,2,1]�������������ԭ�������Ͼ��в�����ͬʱҲ�������鱾��
objArray.shift()-----------��ȥ����ĵ�һ��Ԫ�أ����������Ԫ�ص�ֵ��������������ʺ�pop���������ƣ�pop��������ȥ���һ��Ԫ�ء�
objArray.slice(start,end)----------- ������������һ���Ӽ���������start��ʼ������ start������end������������end),ԭ�����鲻��Ӱ�졣�磺[1,2,3,4,5,6].slice(1,4)���õ�[2,3,4]���� start����endΪ����ʱ����ʹ�����Ǽ���length���ֵ���磺[1,2,3,4,5,6].slice(-4,-1)���õ�[3,4,5]�����endС�ڵ���start�������ؿ����顣
objArray.sort(comparefn)------- ����comparefn����Ĵ�С�ȽϺ�������һ������������򡣺���comparefn���������������element1,element2,�����Ҫ��Ҫelement1����element2֮ǰ��Ӧ�÷���һ�������������Ҫelement1����element2֮��Ӧ�÷���һ�����������������ƽ�ȶԴ���������ԭ��˳���򷵻أ�����ʡ��comparefnʱ����Ԫ�ذ����ֵ�˳�����С��磺�Զ���ıȽϺ���cmp: function cmp(e1,e2){return e1-e2;}��[3,4,2,7].sort(cmp)���õ�[2,3,4,7].
objArray.splice(start,deleteCount[,item1,item2[,...]]]) ����һ�����ӵĺ����������������Ԫ�ص�ɾ����ȡ���Ͳ�����������У�start������ʾҪ���в���������λ�ã�deleteCountָ��start��ʼҪɾ����Ԫ�ص�Ԫ�ظ�����������startλ�ã������deleteCountʡ�ԣ����ʾ��start��ʼҪɾ�������ʣ�ಿ�֡�[,item1[,item2[,...]]]���ʾ��ѡ�Ĳ��뵽start֮ǰ��Ԫ���б��磺
var arr=[0,1,2,3,4,5,6];
arr.splice(1,1);
document.write(arr);//��ʾ��������������������������
arr=[0,1,2,3,4,5,6];
arr.splice(0,0,"a","b");
document.write(arr);//��ʾ��a,b,0,1,2,3,4,5,6"
arr=[0,1,2,3,4,5,6];
arr.splice(3,2,"c","d");
document.write(arr);//��ʾ"0,1,2,c,d,5,6"
objArray.unshift(item1[,item2[,...]]])------------------- �������б���뵽����Ŀ�ͷ�������ʺ�push�������ͣ���push�����ǽ�Ԫ����ӵ�����Ľ�β���磺 [1,2,3,4].unshift("a","b")���õ�["a","b",1,2,3,4]��
�Ӵ�Сð�����򷨣�

var regs = new Array();
regs.push(new Array("item_1","^[\\s\\S]+$","item_1Span","���˴�����Ϊ��","��д��ȷ",true));
regs.push(new Array("item_2","^[\\s\\S]+$","item_2Span","�������в���Ϊ��","��д��ȷ",true));
regs.push(new Array("item_3","^[\\s\\S]+$","item_3Span","�ʺŲ���Ϊ��","��д��ȷ",true));
//regs.push(new Array("PlantArea","^[\\s\\S]+$","PlantAreaSpan","�����������Ϊ��","��д��ȷ",true));
regs.push(new Array("DdlWorkerNum","^[\\s\\S]+$","DdlWorkerNumSpan","Ա����������Ϊ��","��д��ȷ",true));
regs.push(new Array("DdlDeveloperNum","^[\\s\\S]+$","DdlDeveloperNumSpan","�з���������Ϊ��","��д��ȷ",true));
//regs.push(new Array("item_7","^[\\s\\S]+$","item_7Span","Ʒ�����Ʋ���Ϊ��","��д��ȷ",true));
regs.push(new Array("DdlTurnover","^[\\s\\S]+$","DdlTurnoverSpan","��Ӫҵ���Ϊ��","��д��ȷ",true));
//regs.push(new Array("DdlImport","^[\\s\\S]+$","DdlImportSpan","����ڶ��Ϊ��","��д��ȷ",true));
//regs.push(new Array("DdlExport","^[\\s\\S]+$","DdlExportSpan","����ڶ��Ϊ��","��д��ȷ",true));
regs.push(new Array("item_14","^[\\s\\S]+$","item_14Span","��Ҫ�ͻ�Ⱥ����Ϊ��","��д��ȷ",true));
#T=RegExp
//RegExp ������ 3 ��������test()��exec() �Լ� compile()��
test() ���������ַ����е�ָ��ֵ������ֵ�� true �� false��
var patt1=new RegExp("e");
document.write(patt1.test("The best things in life are free"));
���ڸ��ַ����д�����ĸ "e"�����ϴ����������ǣ�true

exec() ���������ַ����е�ָ��ֵ������ֵ�Ǳ��ҵ���ֵ�����û�з���ƥ�䣬�򷵻� null��
var patt1=new RegExp("e");
document.write(patt1.exec("The best things in life are free")); 
���ڸ��ַ����д�����ĸ "e"�����ϴ����������ǣ�e

compile() �������ڸı� RegExp��
compile() �ȿ��Ըı����ģʽ��Ҳ������ӻ�ɾ���ڶ���������
var patt1=new RegExp("e");
document.write(patt1.test("The best things in life are free"));
patt1.compile("d");
document.write(patt1.test("The best things in life are free"));
�����ַ����д��� "e"����û�� "d"�����ϴ��������ǣ�truefalse

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
if(confirm('�Ƿ�_��Ҫ�h��ԓ�Ŀ��')){window.location=('?work=del&Id=1');}
#T=replace
str=str.replace(/\n/g,"<br/>");
//g����ȫ����Q
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
var newText = document.createTextNode('�����½��� div �е����֡�'); 
document.body.appendChild(newDiv); //©����һ�䣬�����в�ͨ 
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
#T=Dialog:��ʾshowModalDialogģ̬��������
function Dialog(url,name,w,h){
	var top=(screen.height-h)/3;
	var left=(screen.width-w)/2;
	return showModalDialog(url,name,'dialogLeft:'+left+'px;dialogTop:'+top+'px;dialogWidth:'+w+'px;dialogHeight:'+h+'px;help:no;scroll:yes;status:yes;');
}
//�g�[��վ�DƬ
function OpenExplorer(url){
	var Reval=Dialog(url,'ResWin',(screen.width-100),500);
	if(Reval!=null){	//����ֵ���Ҫ���L�����window.returnValue = Str;�xֵ�ſ��Է��ؽY��.
		try{_g('BigImg').value=Reval;}catch(e){};
	}
}
#T=�����ĵ�
window.scrollBy(100,100);
#T=ȡ���ĵ�����
alert(document.title)
#T=height:�õ��߶�
_g('PopMenuBG').style.height=(document.body.scrollHeight>screen.height)?document.body.scrollHeight:screen.height;
#T=aJax:����
//Ajax
function Ajax(){
	var _xmlHttp = null;
	this.createXMLHttpRequest = function(){try{if (window.ActiveXObject){_xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");}else if (window.XMLHttpRequest){_xmlHttp = new XMLHttpRequest();}}catch(e){alert(e.name +" : " + e.message);}}
	this.backFunction = function(_backFunction){if(_xmlHttp.readyState == 4){if(_xmlHttp.status == 200){_backFunction(_xmlHttp.responseText);}}_xmlHttp.onreadystatechange = null;}
	this.doPost = function(_url,_parameter,_backFunction){try{_xmlHttp.open("POST",_url, false);_xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");_xmlHttp.send(_parameter);}catch(e){alert(e.name +" : " + e.message);}}
	this.doGet = function(_url,_parameter,_backFunction){try{var _random = Math.round(Math.random()*10000);_xmlHttp.open("GET", (_url+"?random=" +_random +"&" + _parameter), false);_xmlHttp.send(null);}catch(e){alert(e.name +" : " + e.message);}}
	this.ajaxRequest = function(_url,_parameter,_method,_backFunction){try{this.createXMLHttpRequest();if(_method.toLowerCase() == "post"){this.doPost(_url,_parameter,_backFunction);}else{this.doGet(_url,_parameter,_backFunction);}try{_xmlHttp.onreadystatechange = this.backFunction(_backFunction);}catch(err){}}catch(e){alert(e.name+" : "+e.message);}}
}
//��Դ���
function Docheck(Id){
	var url = "Sys_NewsList.php?work=docheck";
	var parameter = "Id="+Id;
	var method = "post";
	new Ajax().ajaxRequest(url,parameter,method,callBack);
	function callBack(xml){if(xml.length==0){_g('Ischk'+Id+'').innerHTML=((_g('Ischk'+Id+'').innerHTML.length<10)?'<a href=\"javascript:Docheck('+Id+')\">����</a>':' ');}else{alert(unescape(xml));}}
}
#T=Select:����Select�ڵ���Ŀ
//����Select�ڵ���Ŀ
//����:(��Դ,Ŀ��)
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
#T=document.onmousemove:��ҳ���ڵ���Ŀ�����¼�
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
#T=document.createElement("DIV"):����DIV
var aBg = top.window.document.createElement("DIV");
	aBg.id = "aBg";
    aBg.setAttribute("align","center");
top.window.document.body.appendChild(aBg);

var bgObj = document.getElementById("aBg");
top.document.body.removeChild(bgObj);
#T=new:��������
var lev=function(){
	return "����";
};
function Parent(){
	this.name="��С��";
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
#T=�жϱ����Ѵ����Ҳ�Ϊ��
var arr=new Array(1,2,3,4,'');

if(typeof(arr[3])!='undefined' && arr[3]!=''){
alert('cunzai')
}
#T=����������������������
����������������������
#T=window.onerror
window.onerror=function(){return true;}
#T=var userAgent
var userAgent=navigator.userAgent.toLowerCase();
#T=var is_opera
var is_opera=userAgent.indexOf('opera') != -1 && opera.version();
#T=var is_ie
var is_ie=(userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5,3);
#T=���ҳ�����Ա�������
if(top.location==self.location){
	top.location="index.asp"
}
#T=��ͳaJax����
//ͨ��Ajax
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
				//alert ('ajax���أ�'+msg);//alert(xmlHttp.responseXML);
				if(msg.indexOf("������")!=-1){
					alert ("��������ԭ��������£�\n\n1.���ܲ������ݳ���.\n\n2.������û�е�¼ϵͳ.\n\n");
					window.location.href(location.reload());
				}else{
					$(Obj).innerHTML=msg;
				}
			}else{
				var msg=unescape(xmlHttp.responseText);
				alert (msg);
				alert("ajax����ʧ�ܣ�"+xmlHttp.status);
			}
		}
	}
}
function editInfotitle(str,str1){//�༭��Ϣ����str:id/str1:�޸ĺ�ı���
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
#T=1���Ӹı�һ��ʱ��
function Loadtime(){
	setInterval("DateTime.innerHTML=new Date().toLocaleString()",1000);
}
#T=�ı��ܴ��ڸ߶�
function AutoSize(){
	if(screen.width<1024){
		alert ("Ϊ�˸��õ�ʹ�ø�ϵͳ,\n\nǿ�ҽ�������������ʾ���ֱ�������Ϊ1024*768.");
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
#T=���Յ���
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
#T=�������
window.frames["frameName"];
window.frames["frameName"].frames["frameName2"];

window.frames.frameName
window.frames[index]
window.parent.frames["frame2"]
#T=��ʱ����
window.setTimeout(function(){...},1000);//ֻ�ӳ�1��,��ѭ��
window.setInterval(function(){...},1000);//�ӳ�1��,��ѭ��

<meta HTTP-EQUIV=REFRESH CONTENT='60; URL=?work='>
#T=ȫ���ݴ�
window.onerror=function(){return true;}
#T=���ˢ��
window.location.reload();
#T=��ȡ��Դ
alert("�����Դ��"+document.referrer);
#T=��朽ӹ�Ӱ
onFocus='if(this.blur)this.blur();'
#T=��ʱ������
ID=setTimeout(hide,500);//ID=setInterval(hidebytime,500);
hide=function(){
	alert('hello');
	clearTimeout(ID);
}
#T=��ֹ����
window.history.forward();
#T=��ʱ��ת
<meta HTTP-EQUIV=REFRESH CONTENT='2; URL=in.asp'>
//setTimeout(function{windows.location='';},500);
#T=������ҳԴ�ļ�
function clear() {            
Source=document.body.firstChild.data;          
document.open();            
document.close();            
document.body.innerHTML=Source;            
} 
#T=����ʾ�ر�
<a href="javascript:window.opener=null;self.close();">
function closeself(){window.open('about:blank','_top','');self.close();}
#T=������һҳ
window.history.back();
#T=��̬����style�ڵ�
	�кܶ��ṩ��̬���� style �ڵ�ķ��������Ǵ�������������ⲿ�� css �ļ��������ʹ�ó������ɵ��ַ�����̬���� style �ڵ㣬�Ҹ���2��Сʱ��
	��̬�ⲿ css �ļ��﷨��
	@import url(style.css);
	��̬�ⲿ css �ļ����صķ��������£�
	��һ�֣�
	var style = document.createElement(��link��);
	style.href = ��style.css��;
	style.rel = ��stylesheet��;
	style.type = ��text/css��;
	document.getElementsByTagName(��HEAD��).item(0).appendChild(style);
	�ڶ��ּ򵥣�
	document.createStyleSheet(style.css);
	��̬�� style �ڵ㣬ʹ�ó������ɵ��ַ�����
	var style = document.createElement(��style��);
	style.type = ��text/css��;
	style.innerHTML=��body{ background-color:blue; }��;
	document.getElementsByTagName(��HEAD��).item(0).appendChild(style);
	���ź�������Ĵ����� ff ����ɹ������� ie ��֧�֡���������̳�õ����룺
	var sheet = document.createStyleSheet();
	sheet.addRule(��body��,'background-color:red��);
	�ɹ������Ǻ��鷳��Ҫ���ַ�����д����һ���д��,�۵���һ����
	�����ѣ���һ����֪��ʲô���ҵ�ʲô���Ե�blog���ҵ����룺
	document.createStyleSheet(��javascript:��body{background-color:blue;����);
	�ɹ�������ʵ��������������������ˣ�url ��� 255 ���ַ�����һ��ľͲ����ˣ��ģ�
	window.style=��body{background-color:blue;��;
	document.createStyleSheet(��javascript:style��);
	���������������:
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
#T=ȡ���x�еă���
var t=window.getSelection?window.getSelection():(document.getSelection?document.getSelection():(document.selection?document.selection.createRange().text:""))
document.forms[0].selectedtext.value = t; 
#T=������һҳ
window.history.forward();//window.history.go(���صڼ�ҳ,Ҳ����ʹ�÷��ʹ���URL);
#T=��̬��iframeд����
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
#T=���ı��ַ����ڲ�ʹ�÷�б�ܶԴ����������
document.write("Hello \
World!");
#T=����ҳ����ʾһ��ʱ��
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
#T=���ڱȽ�
var myDate=new Date();
myDate.setFullYear(2008,7,9);
var today = new Date();
if (myDate>today){
alert("Today is before 9th August 2008");
}else{
alert("Today is after 9th August 2008");
}
#T=����ѡ��˫�����ƴ���
<textarea name='str' id='str' cols='80%' rows='3' onClick='select();' ondblclick='window.clipboardData.setData("text",document.getElementById("str").innerText);'>�������ݡ���</textarea>  

#T=��ҳ���������ʱ�����ʾ��������
    <a id="readylink" href="javascript:download();" class="submitbutton">Ո�Ե�</a>  
    <a id="downloadlink" href="http://kalvin.cn/" class="submitbutton" style="display:none;">���d</a>  
      
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
            document.getElementById("readylink").innerHTML='Ո�Ե�'+timeout+'��';   
            setTimeout("countdown()",1000);   
        }   
        timeout--;   
    }   
    countdown();   
      
    function download() {   
        if(timeout>0) {   
            alert('Ո�Եȣ�����������ȡ�����P�YԴ��');   
        }   
    }   
    </script>  


#T=����ˢ��ǰ��
<input type=button value=���� onclick=history.go(-1)>
<input type=button value=ˢ�� onclick=history.go(-0)>
<input type=button value=ǰ�� onclick=history.go(+1)>
#T=��Դҳ��ת����
    <script type="text/javascript">   
    <!--   
        if(parent.window.opener)   
        parent.window.opener.location='http://kalvin.cn/';   
    //-->   
    </script>  

#T=�Ƚ������ĸ�����ַ��������Ĵ���
<script type="text/javascript">  
function setCopy(content){   
    if(navigator.userAgent.toLowerCase().indexOf('ie') > -1) {   
        clipboardData.setData('Text',content);   
        alert ("�õ�ַ�Ѿ����Ƶ����а�");   
    } else {   
        prompt("�븴����վ��ַ:",content);   
    }   
}     
</script>    
<a href="http://kalvin.cn/" onclick="setCopy(this.href);return false;" target="_self">������ַ</a>
#T=���ݸ��g�[���ļ����ղ�
<a href="http://kalvin.cn/" onclick="window.external.addFavorite(this.href,this.title);return false;" title='�»��' rel="sidebar">�����ղ�</a>
#T=�鿴��վ��COOKIEֵ
javascript:document.write(document.cookie)
#T=��Ϊ��ҳ,��Ϊ�ղأ�����Ƶ��
<A href="javascript:this.style.behavior='url(#default#homepage)';this.setHomePage('url');">��Ϊ��ҳ</a>
<a href="javascript:window.external.AddFavorite(location.href,document.title);">�����ղ�</a>
<a href="javascript:window.external.addChannel('typhoon.cdf')">����Ƶ��</a>
#T=Marquee������
<marquee direction="up" height="150" onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount=1 scrolldelay=0>
���ϻ춯����:
<marquee direction="up" scrolldelay="200" style="font-size: 9pt; color: #FF0000; line-height: 150%; font-style:italic; font-weight:bold" scrollamount="2" width="206" height="207" bgcolor="#FFFF00">hhhhhhhhhhhhhhhhhhh</marquee>
����N�У���ͣ����
<script>
function startmarquee(lh,speed,delay,index){
var t;var p=false;var o=document.getElementById("marqueebox"+index);o.innerHTML+=o.innerHTML;o.onmouseover=function(){p=true}o.onmouseout=function(){p=false}o.scrollTop = 0;
function start(){t=setInterval(scrolling,speed);if(!p) o.scrollTop += 2;}
function scrolling(){if(o.scrollTop%lh!=0){o.scrollTop += 2;if(o.scrollTop>=o.scrollHeight/2) o.scrollTop = 0;}else{clearInterval(t);setTimeout(start,delay);}}
setTimeout(start,delay);
}
startmarquee(22,50,3000,0);
</script>
#T=����С����λ��
a=123.543543;
a.toFixed(2);
#T=ȫ��Ļ��ҳ��
function openw(){window.open("home.htm","","fullscreen=yes");}
#T=�򿪶��細��
<a href="javascript:window.open('readMES.asp','','width=450,height=400,scrollbars=no,status=no,location=no,toolbar=no,directories=no,menubar=no')">���</a>
#T=�߼����細��
function Dialog(url,name,w,h){
	var top=(screen.height-h)/3;
	var left=(screen.width-w)/2;
	return showModalDialog(url,name,'dialogLeft:'+left+'px;dialogTop:'+top+'px;dialogWidth:'+w+'px;dialogHeight:'+h+'px;help:no;scroll:yes;status:yes;');
}
//�g�[��վ�DƬ
function OpenExplorer(url,id){
	var Reval=Dialog(url,'ResWin',(screen.width-100),500);
	try{
		if(Reval!=null){//����ֵ���Ҫ���L�����window.returnValue = Str;�xֵ�ſ��Է��ؽY��.
			var Arr=new Array();
			Arr=Reval.split("|");

			for(i=0;i<Arr.length;i++){
				_g(id).options[_g(id).length]=new Option(Arr[i],Arr[i]);
			}
		}
	}catch(e){}
}
#T=FRAME���ɵ�����
if(top.location==self.location){top.location='?work=getout';}
#T=��css��Ƕ��js
a:hover{test:expression(alert('aa'));}
#T=��mp3����������
<EMBED SRC="1.mp3" tppabs="" hidden="true" AUTOSTART="TRUE" LOOP="TRUE">
#T=ȫ������on�¼�
<body oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false" onmouseup="document.selection.empty()">
#T=��ֹ���ҳ��
<noscript><iframe src='*'></iframe></noscript>
#T=Js����HTML��˳��
Js����HTML��˳��:window->document->html->(head,body)
����������е�DOM˳����:window->(navigator,screen,history,location,document)
#T=�ı�״̬������ʾ
<base onmouseover="window.status='^!';return true;">
#T=ȷ�ϲ����Ի���
if(confirm('�Ƿ�_�JҪ�h��?')){
	window.location='?work=del&cpath='+encodeURIComponent(Filep)+'';
}
#T=Ҫ���û���������
var str;
str=prompt('Ո��޸�֮������Q(Ո��ʹ���p�ֹ��ַ�):','jpg');
if(str!=null){
	if(str==''){
		alert('Error:\n\nDirecty name empty!');
	}else{
		window.location='?work=re&oldname='+encodeURIComponent(Filen)+'';
	}
}
#T=�˳�֮ǰ���ù���
function Close(){alert('a');}
window.onbeforeunload=Close;
#T=��ֹ������������
document.body.noWrap=true;
#T=�ַ���ת����Сд
string.toUpperCase();//string.toLowerCase();
#T=���������ͱ���
var today = new Date();
#T=FRAME�ı�ʾ��ʽ
parent�����׶���,top������˶���,���Ӵ��ڵĸ�����Ϊ:opener
[window.]frames[n].ObjFuncVarName,frames["frameName"].ObjFuncVarName,frameName.ObjFuncVarName
today = new Date();
self.status = today.toString();
#T=���д���Ĵ���
<script>function Preview(){var TestWin=open('');TestWin.document.write(code.value);}</script>
<textarea id=code cols=60 rows=15></textarea><br><button onclick=Preview()>����</button>
#T=�ж���һҳ����Դ
document.referrer
#T=��ô��ڵĴ�С
document.body.clientWidth,document.body.clientHeight
document.body.offsetWidth,document.body.offsetHeight
��ʱ����Ҫ֪��window.screenTop,window.screenLeft
#T=��λ���
onload=document.form1.username.focus()
#T=��ҳͼ��
<link rel="Shortcut Icon" href="/favicon.ico"><link rel="Bookmark" href="http://www.7di.net/favicon.ico">
#T=��������
<bgsound src="liushui.wav" loop="-1">
#T=ȥ��������
<body scroll="no" style="overflow-y:hidden">
#T=����Css����
document.all.css.href = "a.css";
#T=ֻ�����뺺��
<input onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))">
#T=ֻ������ȫ��
<input onkeyup="value=value.replace(/[^\uFF00-\uFFFF]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\uFF00-\uFFFF]/g,''))">
#T=ֻ����������
<input onkeyup="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
#T=ֻ����������
onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" onblur=\"if(isNaN(this.value)){this.value='';this.focus();}\"
#T=��ҳ���ᱻ����
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
����<META HTTP-EQUIV="expires" CONTENT="0">
#T=��ֹ�༭Դ����
<!-- #BeginEditable "doctitle" --><title>::</title><!-- #EndEditable -->
#T=�鿴��ҳԴ����
<input type=button value=�鿴��ҳԴ���� onclick="window.location = 'view-source:'+ 'http://www.csdn.net/'">
#T=�ж��Ƿ�����ַ�
if(/[^\x00-\xff]/g.test(s)){alert("���к���");}else{alert("ȫ���ַ�");}
#T=����������Ϣ���
<iframe src='http://www.vlongbiz.com' name='InfoFrame' scrolling='auto' width='95%' height='450' frameborder='0'></iframe>
#T=ȡ�ÿؼ��ľ���λ��
function getIE(e){
var t=e.offsetTop;var l=e.offsetLeft;
while(e=e.offsetParent){t+=e.offsetTop;l+=e.offsetLeft;}
alert("top="+t+"\nleft="+l);}
#T=ֻ������Ӣ�Ļ�����
<input onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
#T=���ϵͳ,������汾
<script>window.document.write("�汾��"+navigator.appName+navigator.appVersion+" browser.")</script>
#T=ENTER�������ù������
<input onkeydown="if(event.keyCode==13)event.keyCode=9">
#T=�������Ҽ����ղؼ�
if(document.all){document.body.onmousedown=new Function("if (event.button==2||event.button==3)window.external.addFavorite('http://free.pixel2001.com/88tuba/','�л�����')")}
#T=����F12��,ֱ�ӷ�����ҳ
function look(){if(event.keyCode==123){document.location.href='a.asp'}}
if(document.onkeydown==null){document.onkeydown=look}
#T=TEXTAREA����Ӧ��������
<textarea rows=1 name=s1 cols=27 onpropertychange="this.style.posHeight=this.scrollHeight">
#T=״̬����̬��ʾ����ʱ��
window.setTimeout("see()",1000);
#T=��ָ���ַ�����ץȡ�ַ���
����ָ���ַ���ASCII��ֵ:StringA.charCodeAt(1);
ȡ�ַ�����ָ��λ�õ��ַ�:StringA.charAt(9);
ȡ���ַ�����ֹ����ַ���:stringA.substring(2,6);
#T=������ֹ���,�򽫹����Ĳ��ֱ��ʡ�Ժ���ʾ
<DIV STYLE="width:120px;height: 50px;border:1px solid blue;overflow:hidden;text-overflow:ellipsis">
<NOBR>���Ǳ�����һ�����֣��ܳ��������һ����ʾ����.</NOBR></DIV>
#T=���ڼ�ȥ�������ڵڶ�������
function cc(dd,dadd){
var a = new Date(dd);a = a.valueOf();a = a - dadd * 24 * 60 * 60 * 1000;a = new Date(a);alert(a.getFullYear() + "��" + (a.getMonth() + 1) + "��" + a.getDate() + "��");}cc("12/23/2002",2);
#T=���ƹػ�ʱ�Ļ�ɫ
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<a href="login.php?do=logout&amp;u=219" onclick="return log_out()">ע����¼</a>
<script type="text/javascript">
function log_out(){
	ht = document.getElementsByTagName("html");
	ht[0].style.filter = "progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)";
	if (confirm('��ȷ��Ҫע����?')){
		return true;
	}else{
		ht[0].style.filter = "";
		return false;
	}
}
</script>
#T=����������������������
����������������������
#T=�¼��ܱ�
���� 	�������������ʱ�����ִ��¼� 	FF 	N 	IE
#T=onabort 	ͼ����ر��ж� 	1 	3 	4
onabort 	ͼ����ر��ж� 	1 	3 	4
#T=onblur 		Ԫ��ʧȥ���� 	1 	2 	3
onblur 		Ԫ��ʧȥ���� 	1 	2 	3
#T=onchange 	�û��ı�������� 	1 	2 	3
onchange 	�û��ı�������� 	1 	2 	3
#T=onclick 	�����ĳ������ 	1 	2 	3
onclick 	�����ĳ������ 	1 	2 	3
#T=ondblclick 	���˫��ĳ������ 	1 	4 	4
ondblclick 	���˫��ĳ������ 	1 	4 	4
#T=onerror 	�������ĵ���ͼ��ʱ����ĳ������ 	1 	3 	4
onerror 	�������ĵ���ͼ��ʱ����ĳ������ 	1 	3 	4
#T=onfocus 	Ԫ�ػ�ý��� 	1 	2 	3
onfocus 	Ԫ�ػ�ý��� 	1 	2 	3
#T=onkeydown 	ĳ�����̵ļ������� 	1 	4 	3
onkeydown 	ĳ�����̵ļ������� 	1 	4 	3
#T=onkeypress 	ĳ�����̵ļ������»�ס 	1 	4 	3
onkeypress 	ĳ�����̵ļ������»�ס 	1 	4 	3
#T=onkeyup 	ĳ�����̵ļ����ɿ� 	1 	4 	3
onkeyup 	ĳ�����̵ļ����ɿ� 	1 	4 	3
#T=onload		ĳ��ҳ���ͼ����ɼ��� 	1 	2 	3
onload		ĳ��ҳ���ͼ����ɼ��� 	1 	2 	3
#T=onmousedown 	ĳ����갴�������� 	1 	4 	4
onmousedown 	ĳ����갴�������� 	1 	4 	4
#T=onmousemove 	��걻�ƶ� 	1 	6 	3
onmousemove 	��걻�ƶ� 	1 	6 	3
#T=onmouseout 	����ĳԪ���ƿ� 	1 	4 	4
onmouseout 	����ĳԪ���ƿ� 	1 	4 	4
#T=onmouseover 	��걻�Ƶ�ĳԪ��֮�� 	1 	2 	3
onmouseover 	��걻�Ƶ�ĳԪ��֮�� 	1 	2 	3
#T=onmouseup 	ĳ����갴�����ɿ� 	1 	4 	4
onmouseup 	ĳ����갴�����ɿ� 	1 	4 	4
#T=onreset 	���ð�ť����� 	1 	3 	4
onreset 	���ð�ť����� 	1 	3 	4
#T=onresize 	���ڻ��ܱ������ߴ� 	1 	4 	4
onresize 	���ڻ��ܱ������ߴ� 	1 	4 	4
#T=onselect 	�ı���ѡ�� 	1 	2 	3
onselect 	�ı���ѡ�� 	1 	2 	3
#T=onsubmit 	�ύ��ť����� 	1 	2 	3
onsubmit 	�ύ��ť����� 	1 	2 	3
#T=onunload 	�û��˳�ҳ�� 	1 	2 	3
onunload 	�û��˳�ҳ�� 	1 	2 	3
#T=����������������������
����������������������
#T=onMouseDown
onmousedown=""
#T=onMouseUp
onmouseup=""
#T=onMouseOver:������ƶ���ĳ����Χ���Ϸ�ʱ�������¼�
onMouseOver(^!)
#T=onMouseMove:����ƶ�ʱ�������¼�
onMouseMove(^!)
#T=onMouseOut:������뿪ĳ����Χʱ�������¼�
onMouseOut(^!)
#T=onKeyPress:�������ϵ�ĳ���������²����ͷ�ʱ�������¼�.[ע��:ҳ���ڱ����б��۽��Ķ���]
onKeyPress(^!)
#T=onKeyDown:��������ĳ������������ʱ�������¼�[ע��:ҳ���ڱ����б��۽��Ķ���]
onKeyDown(^!)
#T=onKeyUp:��������ĳ�����������ſ�ʱ�������¼�[ע��:ҳ���ڱ����б��۽��Ķ���]
onKeyUp(^!)
#T=����������������������
����������������������
#T=onAbort:ͼƬ������ʱ���û��ж�
onAbort(^!)
#T=onBeforeUnload:��ǰҳ������ݽ�Ҫ���ı�ʱ�������¼�
onBeforeUnload(^!)
#T=onError:��ץ��ǰҳ����Ϊĳ��ԭ������ֵĴ�����ű��������ⲿ�������õĴ���
onError(^!)
#T=onLoad:ҳ���ڿ���ɴ��͵������ʱ�������¼��������ⲿ�ļ��������
onLoad(^!)
#T=onMove:������Ĵ��ڱ��ƶ�ʱ�������¼�
onMove(^!)
#T=onResize:��������Ĵ��ڴ�С���ı�ʱ�������¼�
onResize(^!)
#T=onScroll:������Ĺ�����λ�÷����仯ʱ�������¼�
onScroll(^!)
#T=onStop:�������ֹͣ��ť������ʱ�������¼������������ص��ļ����ж�
onStop(^!)
#T=onUnload:��ǰҳ�潫���ı�ʱ�������¼�
onUnload(^!)
#T=����������������������
����������������������
#T=onBlur:��ǰԪ��ʧȥ����ʱ�������¼� [�������̵Ĵ�������]
onBlur(^!)
#T=onChange:��ǰԪ��ʧȥ���㲢��Ԫ�ص����ݷ����ı���������¼� [�������̵Ĵ�������]
onChange(^!)
#T=onFocus:��ĳ��Ԫ�ػ�ý���ʱ�������¼�
onFocus(^!)
#T=onReset:������RESET�����Ա�����ʱ�������¼�
onReset(^!)
#T=onSubmit:һ�������ݽ�ʱ�������¼�
onSubmit(^!)
#T=����������������������
����������������������
#T=onBounce:��Marquee�ڵ������ƶ���Marquee��ʾ��Χ֮��ʱ�������¼�
onBounce(^!)
#T=onFinish:��MarqueeԪ�������Ҫ��ʾ�����ݺ󴥷����¼�
onFinish(^!)
#T=onStart:��MarqueeԪ�ؿ�ʼ��ʾ����ʱ�������¼�
onStart(^!)
#T=����������������������
����������������������
#T=onBeforeCopy:��ҳ�浱ǰ�ı�ѡ�����ݽ�Ҫ���Ƶ������ϵͳ�ļ�����ǰ�������¼�
onBeforeCopy(^!)
#T=onBeforeCut:��ҳ���е�һ���ֻ���ȫ�������ݽ������뵱ǰҳ��[����]���ƶ�������ߵ�ϵͳ������ʱ�������¼�
onBeforeCut(^!)
#T=onBeforeEditFocus:��ǰԪ�ؽ�Ҫ����༭״̬
onBeforeEditFocus(^!)
#T=onBeforePaste:���ݽ�Ҫ������ߵ�ϵͳ�����崫��[ճ��]��ҳ����ʱ�������¼�
onBeforePaste(^!)
#T=onBeforeUpdate:�������ճ��ϵͳ�������е�����ʱ֪ͨĿ�����
onBeforeUpdate(^!)
#T=onContextMenu:������߰�������Ҽ����ֲ˵�ʱ����ͨ�����̵İ�������ҳ��˵�ʱ�������¼� [������ҳ���е�<body>�м���onContentMenu="return false"�Ϳɽ�ֹʹ������Ҽ���]
onContextMenu(^!)
#T=onCopy:��ҳ�浱ǰ�ı�ѡ�����ݱ����ƺ󴥷����¼�
onCopy(^!)
#T=onCut:��ҳ�浱ǰ�ı�ѡ�����ݱ�����ʱ�������¼�
onCut(^!)
#T=onDrag:��ĳ�������϶�ʱ�������¼� [��¼�]
onDrag(^!)
#T=onDragDrop:һ���ⲿ��������Ͻ���ǰ���ڻ���֡
onDragDrop(^!)
#T=onDragEnd:������϶�����ʱ�������¼��������İ�ť���ͷ���
onDragEnd(^!)
#T=onDragEnter:����������϶��Ķ��������������Χ��ʱ�������¼�
onDragEnter(^!)
#T=onDragLeave:����������϶��Ķ����뿪��������Χ��ʱ�������¼�
onDragLeave(^!)
#T=onDragOver:��ĳ���϶��Ķ�������һ����������Χ���϶�ʱ�������¼�
onDragOver(^!)
#T=onDragStart:��ĳ���󽫱��϶�ʱ�������¼�
onDragStart(^!)
#T=onDrop:��һ���϶������У��ͷ�����ʱ�������¼�
onDrop(^!)
#T=onLoseCapture:��Ԫ��ʧȥ����ƶ����γɵ�ѡ�񽹵�ʱ�������¼�
onLoseCapture(^!)
#T=onPaste:�����ݱ�ճ��ʱ�������¼�
onPaste(^!)
#T=onSelect:���ı����ݱ�ѡ��ʱ���¼�
onSelect(^!)
#T=onSelectStart:���ı�����ѡ�񽫿�ʼ����ʱ�������¼�
onSelectStart(^!)
#T=����������������������
����������������������
#T=onAfterUpdate:���������������Դ������Ĵ���ʱ�������¼�
onAfterUpdate(^!)
#T=onCellChange:��������Դ�����仯ʱ
onCellChange(^!)
#T=onDataAvailable:�����ݽ������ʱ�����¼�
onDataAvailable(^!)
#T=onDatasetChanged:����������Դ�����仯ʱ�������¼�
onDatasetChanged(^!)
#T=onDatasetComplete:����������Դ��ȫ����Ч���ݶ�ȡ���ʱ�������¼�
onDatasetComplete(^!)
#T=onErrorUpdate:��ʹ��onBeforeUpdate�¼�����ȡ�������ݴ���ʱ������onAfterUpdate�¼�
onErrorUpdate(^!)
#T=onRowEnter:��ǰ����Դ�����ݷ����仯�������µ���Ч����ʱ�������¼�
onRowEnter(^!)
#T=onRowExit:��ǰ����Դ�����ݽ�Ҫ�����仯ʱ�������¼�
onRowExit(^!)
#T=onRowsDelete:��ǰ���ݼ�¼����ɾ��ʱ�������¼�
onRowsDelete(^!)
#T=onRowsInserted:��ǰ����Դ��Ҫ���������ݼ�¼ʱ�������¼�
onRowsInserted(^!)
#T=onAfterPrint:���ĵ�����ӡ�󴥷����¼�
onAfterPrint(^!)
#T=onBeforePrint:���ĵ�������ӡʱ�������¼�
onBeforePrint(^!)
#T=onFilterChange:��ĳ��������˾�Ч�������仯ʱ�������¼�
onFilterChange(^!)
#T=onHelp:������߰���F1����������İ���ѡ��ʱ�������¼�
onHelp(^!)
#T=onPropertyChange:�����������֮һ�����仯ʱ�������¼�
onPropertyChange(^!)
#T=onReadyStateChange:������ĳ�ʼ������ֵ�����仯ʱ�������¼�
onReadyStateChange(^!)
#
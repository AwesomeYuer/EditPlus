#TITLE=See7di.@PHP 5.2.6
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=CI框架部分
#T= 
#T=Class test extends
Class test^! extends CI_Controller{
	Public function first($page='home'){
		IF(!File_exists('application/views/page/'.$page.'.php')){
			show_404();//页面不存在
		}
		$data['title'] = ucfirst($page); // 将title中的第一个字符大写
		$data['info'] = '将title中的第一个字符大写';
		$this->load->view('tpl/header',$data);
		$this->load->view('page/'.$page,$data);
		$this->load->view('tpl/footer', $data);
	}
}
#T=$this->load->view('tpl/^!',$data);
$data['title'] = ucfirst($page);
$this->load->view('tpl/header',$data);


#T= 
#T=━━━━━━━━━━━━━━━━━ 
#T= 
#T=另類的執行php函數方法
$_="\x45\x63\x68\x6F";
$_ '我要輸出的內容';

实际上相当于下边的代码:
Echo preg_replace('//e',find);
或
Function e($a) {
	Echo $a;
}
$_="\x65";
$_('我要輸出的內容');
#T=不斷循環重試獲取數據
$cnt=0;
While($cnt<311 && ($html=File_Get_Contents('http://?'))===FALSE){
	$cnt++;
}

$opts = array(
    'http'=>array(
        'method'=>"POST",
        'timeout'=>60,
    )
);
$con = stream_context_create($opts);
$html =File_Get_Contents('http://?',false,$con);
#T=share一段curl采集程序的代码
	看到总有人问curl的问题，这两天没事写了个采集论坛的小程序。里面包括了模拟登陆，获取页面源代码，正则匹配结果等部分，希望对大家有用。
	<?php
	set_time_limit(0);

	//cookie保存目录
	$cookie_jar = '/tmp/cookie.tmp';

	/*函数------------------------------------------------------------------------------------------------------------*/

	//模拟请求数据
	function request($url,$fields='',$cookie_jar='/tmp/cookie.tmp',$referer=''){
	$ch = curl_init();
	$options = array(CURLOPT_URL => $url,
	  CURLOPT_HEADER => 0,
	  CURLOPT_NOBODY => 0,
	  CURLOPT_PORT => 80,
	  CURLOPT_POST => 1,
	  CURLOPT_POSTFIELDS => $fields,
	  CURLOPT_RETURNTRANSFER => 1,
	  CURLOPT_FOLLOWLOCATION => 1,
	  CURLOPT_COOKIEJAR => $cookie_jar,
	  CURLOPT_COOKIEFILE => $cookie_jar,
	  CURLOPT_REFERER => $referer
	);
	curl_setopt_array($ch, $options);
	$code = curl_exec($ch);
	curl_close($ch);
	return $code;
	}

	//获取帖子列表
	function getThreadsList($code){
	preg_match_all('/<!--[.|\r|\n]*?<a href=\"viewthread.php\?tid=(\d+)/',$code,$threads);
	return $threads[1];
	}

	//判断该帖子是否存在
	function isExits($code){
	preg_match('/<p>指定的主题不存在或已被删除或正在被审核，请返回。<\/p>/',$code,$error);
	return isset($error[0])?false:true;
	}

	//获取帖子标题
	function getTitle($code){
	preg_match('/<h1>[^<\/h1>]*/',$code,$title_tmp);
	$title = $title_tmp[0];
	return $title;
	}

	//获取帖子作者:
	function getAuthor($code){
	preg_match('/<a href=\"space.php\?uid=\d+\" target=\"_blank\" id=\"userinfo\d+\" onmouseover=\"showMenu\(this\.id\)\">.+/',$code,$author_tmp);
	$author = strip_tags($author_tmp[0]);
	return $author;
	}

	//获取楼主发表的内容
	function getContents($code){
	preg_match('/<div id=\"postmessage_\d+\" class=\"t_msgfont\">(.|\r|\n)*?<\/div>/',$code,$contents_tmp);
	$contents = preg_replace('/images\//','http://bbs.war3.cn/images/',$contents_tmp[0]);
	return $contents;
	}

	//打印帖子标题
	function printTitle($title){
	echo "<strong><h2>帖子标题:</h2></strong>",strip_tags($title),"<br/><br/>";
	}

	//输出帖子作者
	function printAuthor($author){
	echo "<strong><h2>帖子作者:</h2></strong>",strip_tags($author),"<br/><br/>";
	}

	//打印帖子内容
	function printContents($contents){
	echo "<strong><h2>作者发表的内容:</h2>",$contents,"</strong><br/>";
	}

	//错误
	function printError(){
	echo "<i>该帖子不存在!</i>";
	}

	/*函数列表end---------------------------------------------------------------------------------------------------*/


	/*登录论坛 begin*/
	$url = 'http://bbs.war3.cn/logging.php?action=login';
	$postfields='loginfield=username&username=1nject10n&password=xxxxxx&questionid=0&cookietime=315360000&referer=http://bbs.war3.cn/&loginsubmit=提交';
	request($url,$postfields,$cookie_jar,'');
	unset($postfields,$url);
	/*登录论坛 end*/


	/*获取帖子列表(位于第一页的帖子) begin*/
	$url = 'http://bbs.war3.cn/forumdisplay.php?fid=57';
	$code = request($url,'',$cookie_jar,'');
	$threadsList = getThreadsList($code);
	/*获取帖子列表 end*/

	//帖子序列
	$rows = 0;

	/*循环抓取所有帖子源代码 begin*/
	foreach($threadsList as $list){
	$url = "http://bbs.war3.cn/viewthread.php?tid=$list";

	if(isExits($code)){
	$code = request($url,'',$cookie_jar,'');
	$color = $rows%2==0?'#00CCFF':'#FFFF33';
	echo "<div style='background-color:$color'>";
	echo "<h1>第",($rows+1),"贴:</h1><br/>";
	$author = getAuthor($code);
	printAuthor($author);

	$title = getTitle($code);
	printTitle($title);

	$contents = getContents($code);
	printContents($contents);
	echo "</div>";
	$rows++;
	}
	else
	printError();

	echo "-----------------------------------------------------------------------------------------<br/><br/>";
	}
	/*抓取源代码 end*/
	?>
#T=模拟浏览器採集數據
//先发送UA，模拟浏览器浏览
ini_set('user_agent','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; GreenBrowser)');

$flg=File_get_contents('http://mtgox.com/api/0/data/ticker.php');
$obj=Json_decode($flg,true);//将JSON格式转为PHP数组  
#T=重写默认全局变量
if(PHP_VERSION < '5.3.0'){
	set_magic_quotes_runtime(0);
}

define('DISCUZ_ROOT',substr(dirname(__FILE__),0,-12));
define('MAGIC_QUOTES_GPC',function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc());
define('ICONV_ENABLE',function_exists('iconv'));
define('MB_ENABLE',function_exists('mb_convert_encoding'));
define('EXT_OBGZIP',function_exists('ob_gzhandler'));

define('TIMESTAMP',time());
#T=某全局变量是否已经定义过
if(!defined('DISCUZ_CORE_FUNCTION')){
	exit('function_core.php is missing');
}
#T=是否已经include过某文件
if(!@include(DISCUZ_ROOT.'./source/function/function_core.php')){
	exit('function_core.php is missing');
}
#T=重写$GLOBALS内的值
foreach($GLOBALS as $key => $value){
	if(!isset($this->superglobal[$key])){
		$GLOBALS[$key] = null; unset($GLOBALS[$key]);
	}
}
#T=准确取得PHP_SELF的值
$_G['PHP_SELF'] = htmlspecialchars(_get_script_url());
Function _get_script_url(){
	if($this->var['PHP_SELF'] === null){
		$scriptName = basename($_SERVER['SCRIPT_FILENAME']);
		if(basename($_SERVER['SCRIPT_NAME']) === $scriptName){
			$this->var['PHP_SELF'] = $_SERVER['SCRIPT_NAME'];
		}else if(basename($_SERVER['PHP_SELF']) === $scriptName){
			$this->var['PHP_SELF'] = $_SERVER['PHP_SELF'];
		}else if(isset($_SERVER['ORIG_SCRIPT_NAME']) && basename($_SERVER['ORIG_SCRIPT_NAME']) === $scriptName){
			$this->var['PHP_SELF'] = $_SERVER['ORIG_SCRIPT_NAME'];
		}else if(($pos = strpos($_SERVER['PHP_SELF'],'/'.$scriptName)) !== false){
			$this->var['PHP_SELF'] = substr($_SERVER['SCRIPT_NAME'],0,$pos).'/'.$scriptName;
		}else if(isset($_SERVER['DOCUMENT_ROOT']) && strpos($_SERVER['SCRIPT_FILENAME'],$_SERVER['DOCUMENT_ROOT']) === 0){
			$this->var['PHP_SELF'] = str_replace('\\','/',str_replace($_SERVER['DOCUMENT_ROOT'],'',$_SERVER['SCRIPT_FILENAME']));
		}else{
			system_error('request_tainting');
		}
	}
	return $this->var['PHP_SELF'];
}
#T=_get_client_ip
Function _get_client_ip(){
	$ip = $_SERVER['REMOTE_ADDR'];
	if(isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/',$_SERVER['HTTP_CLIENT_IP'])){
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	}elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) AND preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s',$_SERVER['HTTP_X_FORWARDED_FOR'],$matches)){
		foreach($matches[0] AS $xip){
			if(!preg_match('#^(10|172\.16|192\.168)\.#',$xip)){
				$ip = $xip;
				break;
			}
		}
	}
	return $ip;
}
#T=设置默认时区
Function timezone_set($timeoffset = 0){
	if(function_exists('date_default_timezone_set')){
		@date_default_timezone_set('Etc/GMT'.($timeoffset > 0 ? '-' : '+').(abs($timeoffset)));
	}
}
#T=通用内容获取
Function getgpc($k,$type='GP'){
	$type = strtoupper($type);
	switch($type){
		case 'G': $var = &$_GET; break;
		case 'P': $var = &$_POST; break;
		case 'C': $var = &$_COOKIE; break;
		default:
			if(isset($_GET[$k])){
				$var = &$_GET;
			}else{
				$var = &$_POST;
			}
			break;
	}

	return isset($var[$k]) ? $var[$k] : NULL;
}
#T=避免使用Global而是用:类名::方法()
Function getuserbyuid($uid){
	static $users = array();
	if(empty($users[$uid])){
		$users[$uid] = Mysql::fetch_first("SELECT * FROM ".DB::table('common_member')." WHERE uid='$uid'");
	}
	return $users[$uid];
}
#T=cache
Function loadcache($cachenames,$force = false){
	global $_G;
	static $loadedcache = array();
	$cachenames = is_array($cachenames) ? $cachenames : array($cachenames);
	$caches = array();
	foreach($cachenames as $k){
		if(!isset($loadedcache[$k]) || $force){
			$caches[] = $k;
			$loadedcache[$k] = true;
		}
	}

	if(!empty($caches)){
		$cachedata = cachedata($caches);
		foreach($cachedata as $cname => $data){
			if($cname == 'setting'){
				$_G['setting'] = $data;
			}elseif(strpos($cname,'usergroup_'.$_G['groupid']) !== false){
				$_G['cache'][$cname] = $_G['group'] = $data;
			}elseif($cname == 'style_default'){
				$_G['cache'][$cname] = $_G['style'] = $data;
			}elseif($cname == 'grouplevels'){
				$_G['grouplevels'] = $data;
			}else{
				$_G['cache'][$cname] = $data;
			}
		}
	}
	return true;
}

Function cachedata($cachenames){
	global $_G;
	static $isfilecache,$allowmem;

	if(!isset($isfilecache)){
		$isfilecache = getglobal('config/cache/type') == 'file';
		$allowmem = memory('check');
	}

	$data = array();
	$cachenames = is_array($cachenames) ? $cachenames : array($cachenames);
	if($allowmem){
		$newarray = array();
		foreach($cachenames as $name){
			$data[$name] = memory('get',$name);
			if($data[$name] === null){
				$data[$name] = null;
				$newarray[] = $name;
			}
		}
		if(empty($newarray)){
			return $data;
		}else{
			$cachenames = $newarray;
		}
	}

	if($isfilecache){
		$lostcaches = array();
		foreach($cachenames as $cachename){
			if(!@include_once(DISCUZ_ROOT.'./data/cache/cache_'.$cachename.'.php')){
				$lostcaches[] = $cachename;
			}
		}
		if(!$lostcaches){
			return $data;
		}
		$cachenames = $lostcaches;
		unset($lostcaches);
	}
	$query = DB::query("SELECT * FROM ".DB::table('common_syscache')." WHERE cname IN('".implode("','",$cachenames)."')");
	while($syscache = DB::fetch($query)){
		$data[$syscache['cname']] = $syscache['ctype'] ? unserialize($syscache['data']) : $syscache['data'];
		$allowmem &&(memory('set',$syscache['cname'],$data[$syscache['cname']]));
		if($isfilecache){
			$cachedata = '$data[\''.$syscache['cname'].'\'] = '.var_export($data[$syscache['cname']],true).";\n\n";
			if($fp = @fopen(DISCUZ_ROOT.'./data/cache/cache_'.$syscache['cname'].'.php','wb')){
				fwrite($fp,"<?php\n//Discuz! cache file,DO NOT modify me!\n//Identify: ".md5($syscache['cname'].$cachedata.$_G['config']['security']['authkey'])."\n\n$cachedata?>");
				fclose($fp);
			}
		}
	}

	foreach($cachenames as $name){
		if($data[$name] === null){
			$data[$name] = null;
			$allowmem &&(memory('set',$name,array()));
		}
	}

	return $data;
}
#T=检测中文长度,切割字串
Function dstrlen($str){
	if(strtolower(CHARSET) != 'utf-8'){
		return strlen($str);
	}
	$count = 0;
	for($i = 0; $i < strlen($str); $i++){
		$value = ord($str[$i]);
		if($value > 127){
			$count++;
			if($value >= 192 && $value <= 223) $i++;
			elseif($value >= 224 && $value <= 239) $i = $i + 2;
			elseif($value >= 240 && $value <= 247) $i = $i + 3;
	    	}
    		$count++;
	}
	return $count;
}

Function cutstr($string,$length,$dot = ' ...'){
	if(strlen($string) <= $length){
		return $string;
	}

	$pre = chr(1);
	$end = chr(1);
	$string = str_replace(array('&amp;','&quot;','&lt;','&gt;'),array($pre.'&'.$end,$pre.'"'.$end,$pre.'<'.$end,$pre.'>'.$end),$string);

	$strcut = '';
	if(strtolower(CHARSET) == 'utf-8'){

		$n = $tn = $noc = 0;
		while($n < strlen($string)){

			$t = ord($string[$n]);
			if($t == 9 || $t == 10 ||(32 <= $t && $t <= 126)){
				$tn = 1; $n++; $noc++;
			}elseif(194 <= $t && $t <= 223){
				$tn = 2; $n += 2; $noc += 2;
			}elseif(224 <= $t && $t <= 239){
				$tn = 3; $n += 3; $noc += 2;
			}elseif(240 <= $t && $t <= 247){
				$tn = 4; $n += 4; $noc += 2;
			}elseif(248 <= $t && $t <= 251){
				$tn = 5; $n += 5; $noc += 2;
			}elseif($t == 252 || $t == 253){
				$tn = 6; $n += 6; $noc += 2;
			}else{
				$n++;
			}

			if($noc >= $length){
				break;
			}

		}
		if($noc > $length){
			$n -= $tn;
		}

		$strcut = substr($string,0,$n);

	}else{
		for($i = 0; $i < $length; $i++){
			$strcut .= ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
		}
	}

	$strcut = str_replace(array($pre.'&'.$end,$pre.'"'.$end,$pre.'<'.$end,$pre.'>'.$end),array('&amp;','&quot;','&lt;','&gt;'),$strcut);

	$pos = strrpos($strcut,chr(1));
	if($pos !== false){
		$strcut = substr($strcut,0,$pos);
	}
	return $strcut.$dot;
}
#T=通用addslashes
Function daddslashes($string,$force = 1){
	if(is_array($string)){
		$keys = array_keys($string);
		foreach($keys as $key){
			$val = $string[$key];
			unset($string[$key]);
			$string[addslashes($key)] = daddslashes($val,$force);
		}
	}else{
		$string = addslashes($string);
	}
	return $string;
}
Function dstripslashes($string){
	if(empty($string)) return $string;
	if(is_array($string)){
		foreach($string as $key => $val){
			$string[$key] = dstripslashes($val);
		}
	}else{
		$string = stripslashes($string);
	}
	return $string;
}
#T=通用htmlspecialchars
Function dhtmlspecialchars($string){
	if(is_array($string)){
		foreach($string as $key => $val){
			$string[$key] = dhtmlspecialchars($val);
		}
	}else{
		$string = str_replace(array('&','"','<','>'),array('&amp;','&quot;','&lt;','&gt;'),$string);
		if(strpos($string,'&amp;#') !== false){
			$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4}));)/','&\\1',$string);
		}
	}
	return $string;
}
#T=通用email检查
Function isemail($email){
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/",$email);
}
#T=多国语言思路
//lang_程序文件名.php
//每个程序文件对应了一个lang文件
Function lang($file,$langvar = null,$vars = array(),$default = null){
	global $_G;
	list($path,$file) = explode('/',$file);
	if(!$file){
		$file = $path;
		$path = '';
	}

	if($path != 'plugin'){
		$key = $path == '' ? $file : $path.'_'.$file;
		if(!isset($_G['lang'][$key])){
			include DISCUZ_ROOT.'./source/language/'.($path == '' ? '' : $path.'/').'lang_'.$file.'.php';
			$_G['lang'][$key] = $lang;
		}
		if(defined('IN_MOBILE') && !defined('TPL_DEFAULT')){
			include DISCUZ_ROOT.'./source/language/mobile/lang_template.php';
			$_G['lang'][$key] = array_merge($_G['lang'][$key],$lang);
		}
		$returnvalue = &$_G['lang'];
	}else{
		if(empty($_G['config']['plugindeveloper'])){
			loadcache('pluginlanguage_script');
		}elseif(!isset($_G['cache']['pluginlanguage_script'][$file]) && preg_match("/^[a-z]+[a-z0-9_]*$/i",$file)){
			if(@include(DISCUZ_ROOT.'./data/plugindata/'.$file.'.lang.php')){
				$_G['cache']['pluginlanguage_script'][$file] = $scriptlang[$file];
			}else{
				loadcache('pluginlanguage_script');
			}
		}
		$returnvalue = & $_G['cache']['pluginlanguage_script'];
		$key = &$file;
	}
	$return = $langvar !== null ?(isset($returnvalue[$key][$langvar]) ? $returnvalue[$key][$langvar] : null) : $returnvalue[$key];
	$return = $return === null ?($default !== null ? $default : $langvar) : $return;
	$searchs = $replaces = array();
	if($vars && is_array($vars)){
		foreach($vars as $k => $v){
			$searchs[] = '{'.$k.'}';
			$replaces[] = $v;
		}
	}
	if(is_string($return) && strpos($return,'{_G/') !== false){
		preg_match_all('/\{_G\/(.+?)\}/',$return,$gvar);
		foreach($gvar[0] as $k => $v){
			$searchs[] = $v;
			$replaces[] = getglobal($gvar[1][$k]);
		}
	}
	$return = str_replace($searchs,$replaces,$return);
	return $return;
}
#T= 
#T=测试时间
Function Runtime($mode=0){
	Static $s;
	IF(!$mode){
		$s=microtime();
		Return;
	}
	$e=microtime();
	$s=Explode(" ",$s);
	$e=Explode(" ",$e);
	Return Sprintf("%.2f ms",($e[1]+$e[0]-$s[1]-$s[0])*1000);
}Runtime();

For($i=0;$i<10;$i++){
	^!
}

Echo Runtime(1);
Die();
#T=循环输出变量
$a_0 = "我";
$a_1 = "是";
$a_2 = "php";
$a_3 = "程序员";
For($i=0;$i<4;$i++){
	Echo ${"a_".$i}."-";
}
#T=拆分字符串
$str="abcdefgh";
$str=implode(',',Str_Split($str));
Echo $str;
#T=比较两个无序的字符串是否相同
$s1='abc';$s1=Str_Split($s1);sort($s1);
$s1='acb';$s2=Str_Split($s2);sort($s2);
IF(Implode($s1)==Implode($s2)){
	Echo 'yes';
}
#T=使用全局变量用$GLOBALS['var']代替global $var
$t=='全局值';
$GLOBALS["t"];
Function F(){
	$t="重新赋值";
    Echo '当前:'.$GLOBALS["t"]."<br>";
    Echo '当前:'.$t."<br>";
}
F();
#T=把同一个字符串替换成序号值
Function str_replace_limit($search,$replace,$subject,$limit=-1){
    IF(is_array($search)){
        foreach($search as $k=>$v){
            $search[$k] = '`' . preg_quote($search[$k],'`') . '`';
        }
    }Else{
        $search = '`' . preg_quote($search,'`') . '`';
    }
    Return preg_replace($search,$replace,$subject,$limit);
}

$a=File_Get_Contents("./a.htm");
$c=substr_count($a,'"16|');
For($i=1;$i<=$c;$i++){
	$a=str_replace_limit('"16|','"'.$i.'|',$a,1);
}
#T=标准后台通用表格

Echo "<form id='f1' method='post' action='?work=&id=' onsubmit='return ck(this);'><div class='tBox'>";
Echo "<table width='100%' align='center' border='0' cellspacing='0' cellpadding='1' class='Tab'>".Chr(10);
Echo "<tr class='Head'><td colspan='10'><strong>列表</strong> | <a href='?work=adduser'>添加资料</a> | <a href='javascript:' submit='true' fid='f1'>保存资料</a></td></tr>".Chr(10);
Echo "<tr class='tit'><td colspan='10' class='info h'>下边显示的是...</td></tr>".Chr(10);
Echo "<tr class='tit'><td width='25'><input type='checkbox' id='id'></td><td>类型</td><td>身份证号</td><td width='90'>管理项目</td></tr>".Chr(10);

Echo "<tr class='main'><td><input type='checkbox' value='' name='id[]'></td><td><a href='?work=mdy&id='>类型</a></td><td>身份证号</td><td><a href='?work=mdy&id='>修改</a>┆<a href='?work=del&id='>删除</a></td></tr>".Chr(10);

Echo "<tr class='pag'><td colspan='3'><a href='?work=deluser' submit='true' fid='f1' js=\"$('#f1').attr('action',this.href);\">删除所选</a></td><td colspan='7'>分页</td></tr>".Chr(10);
Echo "</table></div></form>".Chr(10);

//<style type='text/css'>
//a{color: #627AAD;}
//a:hover{color: #627AAD;}
/*The Global Table Style*/
//.tBox{background-color:white;border:8px solid white;}
//.Tab{background-color:#FFF;}
//.Tab td{line-height:25px;font-size:12px;}
//.Head td{font-size:14px;letter-spacing:2px;padding-bottom:8px;}
//.Tab .tit{background-color:#F1F8FF;}
//.Tab .tit td{border-color:#E4EFF5 #FFF;border-style:solid;border-width:1px 0;}
//.Tab .main td{border-bottom:1px dotted #C1C1C1;line-height:40px;color: #34668B;}
//.Tab .pag{padding:0px;letter-spacing:0.1em;}
//.bnone{border-bottom:none;}
//</style>
#T=False的取值范围
当转换为 boolean 时，以下值被认为是 FALSE： 
■FALSE 自身 
■整型值 0(零) 
■浮点型值 0.0(零) 
■空字符串,以及 字符串 "0" 
■不包括任何元素的数组 
■不包括任何成员变量的对象（仅PHP 4.0 适用） 
■特殊类型 NULL(包括尚未设定的变量) 
■从没有任何标记（tags）的XML文档生成的SimpleXML 对象 
其它值都被认为是 True（包括任何资源）。 
#T=总结的一些PHP开发中的tips
以下这些tips，是我在实际工作中慢慢形成的，有些可能是不正确的，有些出于个人习惯，所以，千万不要把以下这些条当成什么标准，其中可能隐藏着天大的bug，代码可能正在病态的运行中，SO!请一定仔细的看过后想想，这么做的好处是什么？会产生怎样的负面影响？有问题特别欢迎你来和我讨论。这就是我写这篇文字的目的，希望能和大家多多交流，也希望不断完善自己，同时又能给大家一些帮助。

开发习惯和PHP代码：

1、准确的理解各种概念。现在的新东西层出不穷，望文生义和一知半解对开发工作有害无益；

2、代码美观，适当的空行、缩进，空格，这样能更容易理解代码段的意思；

3、一定要写注释，而且要恰当的注释，要不然后面的维护工作或者接手代码的人会痛哭不已；

4、静态方法、类访问权限、接口、抽象类应该综合起来使用，发挥各自特点；

5、不要复制粘贴，即使是要用到现成的代码，也要一行一行的审阅后，再加入到新项目，因为经验告诉我们，这太容易出错了，对于使用开源类这种大段代码更需要；

6、变量都要初始化；

7、不要只处理error，而忽略warning和notice，这可能会导致日后的莫名其妙的问题，项目在开发状态下应该是error_reporting( E_ALL  ^  E_NOTICE )，等到发布的外网生产环境时，应关闭所有错误报告display_errors=Off,error_reporting(0)网友 pAUL gAO分享了他们更合理的方案，error_reporting(E_ALL | E_STRICT)，并且在生产环境中记录错误日志

8、记录一些必要的错误日志，比如写文件失败、写memcache失败，socket连接失败、读写数据库失败，日志能够帮助出现问题时的快速定位，外部生产环境我个人是强烈建议关闭所有错误报告的；

9、用try、catch捕获异常，对代码的健壮有帮助，常常在API接口中碰到，这样子显得友好多了；

10、双引号中出现的变量建议加上大括号，至于是”${nider}at gmail.com”还是”{$tom}at zendstudio.net”看个人习惯，我更喜欢后面一种；

11、尽量少的if else嵌套层数，也许你要表达一个非常复杂的逻辑算法，但这样做至少能让代码逻辑更清晰

12、多阅读网上开源项目的优秀代码（不是优秀项目的开源代码），吸取其中值得借鉴的地方

13、语言包用sprintf的格式化来做是多么惬意的一件事啊！

14、写缓存并不总是要先serialize一次的

15、AJAX传数据的时候，不要将数据库查出的数组直接json_encode后传给客户端，这样做不仅有一定的安全风险（字段名暴露），而且一些不需要的数据被传出浪费带宽，这条同样适用于API接口

16、要记得处理魔术变量，我的方法是直接关闭，当然也可以获取开关状态来避免传输数据被处理两次的问题

17、用$GLOBALS['var']代替global $var

18、不能轻易的die掉程序，尤其是在方法内部

19、require、require_once、include、include_once有着略微不同的应用场景

20、为了最大限度的使得写入缓存成功，可以结合重试次数+usleep，我一般重试3次，还不行那就记下一条log了

21、PHP的常量是个非常好的东西，很多开源项目中用一整个文件来定义要用到的常量

22、尽可能的使用绝对路径寻找文件

23、autoload是个很灵活的东西

24、最好用上set_error_handler和set_exception_handler，那显得你的项目更完美

25、PHP的引用类型是很高效的，在进行复杂运算时建议使用

26、@符号抑制错误是很耗性能的，因此尽可能的找到替代方案
MYSQL部分：

1、SQL语句用双引号，其中的值都用单引号，例如”INSERT INTO gril SET money=’{$iMaxMoney}’,age=’18′”

2、用mysqli扩展代替mysql扩展

2、用mysqli_real_escape_string和mysqli_escape_string处理传出sql语句中的变量

3、用mysqli_set_charset(mysqli->set_charset)代替 query “SET NAMES”

4、联合查询(JOIN)之前，考虑下各个表的数据量，不合适的话应该分开查，尤其是有缓存可用的时候

5、很多地方需要记录发生时间，但不是每一个表都需要，同样，不是每一个表都需要一个自增量作主键

6、很多时候为integer类型加上unsigned是很好的

7、INERT DELEYED、INSERT IGNORE、SELECT DISTINCT…这种语句通常有意想不到的好效果

8、varchar类型并不是不能超过255长度，而是超过了255，这个字段就不能建立索引了，所以，看你的实际需要了

暂时就想到这么多，等再想到的继续update吧。想到什么写什么，没有什么条理性，多多包涵了，如果这些对你有点滴帮助，那我就感到非常开心了。

最后一条终极建议就是——多和别人交流能够进步更快、更大！欢迎与我交流,留下你的宝贵意见。

#T=关键词高亮
	function highlight($sString,$aWords){
	    if(!is_array($aWords) || empty($aWords) || !is_string($sString)){
	        return false;
	    }
	 
	    $sWords = implode('|',$aWords);
	    return preg_replace('@\b('.$sWords.')\b@si','<strong style="background-color:yellow">$1</strong>',$sString);
	}
#T=获取你的Feedburner的用户
	function get_average_readers($feed_id,$interval = 7){
	    $today = date('Y-m-d',strtotime("now"));
	    $ago = date('Y-m-d',strtotime("-".$interval." days"));
	    $feed_url="https://feedburner.google.com/api/awareness/1.0/GetFeedData?uri=".$feed_id."&dates=".$ago.",".$today;
	    $ch = curl_init();
	    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	    curl_setopt($ch,CURLOPT_URL,$feed_url);
	    $data = curl_exec($ch);
	    curl_close($ch);
	    $xml = new SimpleXMLElement($data);
	    $fb = $xml->feed->entry['circulation'];
	 
	    $nb = 0;
	    foreach($xml->feed->children() as $circ){
	        $nb += $circ['circulation'];
	    }
	 
	    return round($nb/$interval);
	}
#T=压缩多个CSS文件
	header('Content-type: text/css');
	ob_start("compress");
	function compress($buffer){
	  /* remove comments */
	  $buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!','',$buffer);
	  /* remove tabs,spaces,newlines,etc. */
	  $buffer = str_replace(array("\r\n","\r","\n","\t",'  ','    ','    '),'',$buffer);
	  return $buffer;
	}
	 
	/* your css files */
	include('master.css');
	include('typography.css');
	include('grid.css');
	include('print.css');
	include('handheld.css');
	 
	ob_end_flush();
#T=获取短网址
	function getTinyUrl($url){
	    return file_get_contents("http://tinyurl.com/api-create.php?url=".$url);
	}
#T=取得所有链接
function get_all_url($code){  
	preg_match_all('/<as+href=["|']?([^>"' ]+)["|']?s*[^>]*>([^>]+)</a>/i',$code,$arr);  //OSPHP.COm.CN 
	return array('name'=>$arr[2],'url'=>$arr[1]);  
}
#T=相对路径转化成绝对路径 
function relative_to_absolute($content,$feed_url){  
preg_match('/(http|https|ftp):///',$feed_url,$protocol);  
$server_url = preg_replace("/(http|https|ftp|news):///","",$feed_url); 
//开源OSPhP.COM.CN
$server_url = preg_replace("//.*/","",$server_url);  
    if($server_url == ''){  
        return $content;  
    } 
    if(isset($protocol[0])){ 
//开源代码OSPhP.COm.CN
$new_content = preg_replace('/href="//','href="'.$protocol[0].$server_url.'/',$content);  
$new_content = preg_replace('/src="//','src="'.$protocol[0].$server_url.'/',$new_content);  //开源OSPhP.COM.CN 
    }else{  
$new_content = $content;  
    } 
    return $new_content;  
}
#T=HTML表格的每行转为CSV格式数组 
function get_tr_array($table){
	//PHP开源代码
	$table = preg_replace("'<td[^>]*?>'si",'"',$table); 
	$table = str_replace("</td>",'",',$table); 
	$table = str_replace("</tr>","{tr}",$table); //开源代码OSPhP.COm.CN 
	//去掉 HTML 标记  
	$table = preg_replace("'<[/!]*?[^<>]*?>'si","",$table); 
	//去掉空白字符   
	$table = preg_replace("'([rn])[s]+'","",$table);
	//开源代码OSPhP.COm.CN
	$table = str_replace(" ","",$table); 
	$table = str_replace(" ","",$table); 
	$table = explode(",{tr}",$table);
	//开源代码OSPHP.COM.Cn
	array_pop($table); 
	return $table; 
}
#T=返回字符串中的所有单词
//$distinct=true 去除重复 
function split_en_str($str,$distinct=true){ 
	preg_match_all('/([a-zA-Z]+)/',$str,$match);
	//开源代码OSPHP.COM.Cn
	if($distinct == true){ 
	$match[1] = array_unique($match[1]); 
	}
	sort($match[1]); //OSPHP.COm.CN 
	return $match[1]; 
}
#T=很另类的Hello world!
	define(_,'chr(');
	define(__,').');
	define(___,"print ");
	define(____,"'!';");
	define(_____,_."0x48".__._."0x65".__._."0x6C".__._."0x6C".__);
	define(______,_."0x6F".__._."0x20".__._."0x77".__._."0x6F".__);
	define(_______,_."0x72".__._."0x6C".__._."0x64".__);
	define(________,_____.______._______);
	define(_________,___.________.____);
	eval(_________);
#T=过滤带有html标签的内容
function html2text($str){
	$str	=	trim($str);
	$str = preg_replace("/||<!--(.*)-->/isU","",$str);
	$alltext = "";
	$start = 1;
	for($i=0;$i31){
		$alltext .= $str[$i];
			}
		}
	}
	$alltext = str_replace("　"," ",$alltext);
	$alltext = preg_replace("/&amp;([^;&amp;]*)(;|&amp;)/","",$alltext);
	$alltext = preg_replace("/[ ]+/s"," ",$alltext);
	$alltext	=	htmlspecialchars($alltext,ENT_QUOTES);
	return $alltext;
}
#T=php读取数据库-存成xml格式
function buildXml($sql,$filepath = ''){
    $xml = "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?><records>";
    $i = 0;
    $rs = mysql_query($sql); //获取数据库资源
    $fp = fopen($filepath,'w+'); //获取文件资源
    while($line = mysql_fetch_assoc($rs)) //读取一行
   {
        $xml .= buildOneXmlNode($line);
        $i++;
        if($i > 0 && $i % 1000 == 0){ //为了避免频繁的io，提高效率，我们这里以1000条记录为限，做了一个缓存。1000条记录大概要迫8M的内存。
            fwrite($fp,$xml);
            $xml = '';
            $i = 0;
        }
    }
    fwrite($fp,$xml . "</records>");//不要忘了这一行，$xml 可能还有没有保存的数据。还有标签要闭合。
    fclose($fp);
}
#T=将指定数据库里的所有表备份为一个SQL文件
<!?php  
  
/******   备份数据库结构 ******/  
    
      /* 
      函数名称：table2sql() 
      函数功能：把表的结构转换成为SQL 
      函数参数：$table: 要进行提取的表名 
      返 回 值：返回提取后的结果，SQL集合 
      函数作者：heiyeluren 
      */  
    
     function table2sql($table)  
     {  
          global $db;  
         $tabledump = "DROP TABLE IF EXISTS $table;\n";  
         $createtable = $db--->query("SHOW CREATE TABLE $table");  
         $create = $db->fetch_row($createtable);  
         $tabledump .= $create[1].";\n\n";  
          return $tabledump;  
      } 
    
    
     /****** 备份数据库结构和所有数据 ******/  
      /* 
      函数名称：data2sql() 
      函数功能：把表的结构和数据转换成为SQL 
      函数参数：$table: 要进行提取的表名 
      返 回 值：返回提取后的结果，SQL集合 
      函数作者：heiyeluren 
      */  
     function data2sql($table)  
     {  
          global $db;  
         $tabledump = "DROP TABLE IF EXISTS $table;\n";  
         $createtable = $db->query("SHOW CREATE TABLE $table");  
         $create = $db->fetch_row($createtable);  
         $tabledump .= $create[1].";\n\n";  
    
         $rows = $db->query("SELECT * FROM $table");  
         $numfields = $db->num_fields($rows);  
         $numrows = $db->num_rows($rows);  
          while($row = $db->fetch_row($rows))  
         {  
             $comma = "";  
             $tabledump .= "INSERT INTO $table VALUES(";  
              for($i = 0; $i < $numfields; $i++)  
             {  
                 $tabledump .= $comma."'".mysql_escape_string($row[$i])."'";  
                 $comma = ",";  
              } 
             $tabledump .= ");\n";  
          } 
         $tabledump .= "\n";  
    
          return $tabledump;  
      } 
?>  
  
<!--?php       
$host="localhost"; //主机名       
$user="root"; //MYSQL用户名       
$password="root"; //密码       
$dbname="dedecmsv4"; //备份的数据库       
     
mysql_connect($host,$user,$password);       
mysql_select_db($dbname);       
     
$q1=mysql_query("show tables");       
while($t=mysql_fetch_array($q1)){       
$table=$t[0];       
$q2=mysql_query("show create table `$table`");       
$sql=mysql_fetch_array($q2);       
$mysql.=$sql['Create Table'].";\r\n\r\n";#DDL       
     
$q3=mysql_query("select * from `$table`");       
while($data=mysql_fetch_assoc($q3))       
{       
$keys=array_keys($data);       
$keys=array_map('addslashes',$keys);       
$keys=join('`,`',$keys);       
$keys="`".$keys."`";       
$vals=array_values($data);       
$vals=array_map('addslashes',$vals);       
$vals=join("','",$vals);       
$vals="'".$vals."'";       
     
$mysql.="insert into `$table`($keys) values($vals);\r\n";       
}      
$mysql.="\r\n";       
     
}      
$filename=date('Ymd')."_".$dbname.".sql"; //文件名为当天的日期       
$fp = fopen($filename,'w');       
fputs($fp,$mysql);       
fclose($fp);       
echo "数据备份成功,生成备份文件".$filename;       
?>  
#T=php缓存
<?php
define('CACHE_ROOT',dirname(__FILE__).'/cache'); //缓存存放目录
define('CACHE_TIME',1800);//缓存时间 单位秒
define('CACHE_FIX','.html');
$CacheName=md5($_SERVER['REQUEST_URI']).CACHE_FIX; //缓存文件名
$CacheDir=CACHE_ROOT.'/'.substr($CacheName,0,1);//缓存文件存放目录
$CacheUrl=$CacheDir.'/'.$CacheName;//缓存文件的完整路径
//GET方式请求才缓存，POST之后一般都希望看到最新的结果 
if($_SERVER['REQUEST_METHOD']=='GET'){
  //如果缓存文件存在，并且没有过期，就把它读出来。
  if(file_exists($CacheName) && time()-filemtime($CacheName)<CACHE_TIME){ 
    $fp=fopen($CacheName,'rb'); 
    fpassthru($fp); 
    fclose($fp); 
    exit; 
  }
  //判断文件夹是否存在，不存在则创建
  elseif(!file_exists($CacheDir)){ 
    if(!file_exists(CACHE_ROOT)){ 
      mkdir(CACHE_ROOT,0777); 
      chmod(CACHE_ROOT,0777); 
    }
    mkdir($CacheDir,0777); 
    chmod($CacheDir,0777); 
  }
  //回调函数，当程序结束时自动调用此函数 
  function AutoCache($contents){ 
    global $CacheUrl; 
    $fp=fopen($CacheUrl,'wb'); 
    fwrite($fp,$contents); 
    fclose($fp); 
    chmod($CacheUrl,0777); 
    //生成新缓存的同时，自动删除所有的老缓存,以节约空间,可忽略。 
    //DelOldCache();
    return $contents;
  }
  function DelOldCache(){ 
    chdir(CACHE_ROOT); 
    foreach(glob("*/*".CACHE_FIX) as $file){ 
      if(time()-filemtime($file)>CACHE_TIME)unlink($file);
    }
  }
  //回调函数 auto_cache 
  ob_start('AutoCache');
}else{ 
  //不是GET的请求就删除缓存文件。 
  if(file_exists($CacheUrl))unlink($CacheUrl); 
}
?>
#T=PHP如何判断浏览器类型
 <?php
 2  if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 8.0″)) 
 3   echo "Internet Explorer 8.0″; 
 4  else if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 7.0″)) 
 5   echo "Internet Explorer 7.0″; 
 6  else if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 6.0″)) 
 7   echo "Internet Explorer 6.0″;
 8  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Firefox/3″))
 9   echo "Firefox 3″;
10  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Firefox/2″))
11   echo "Firefox 2″;
12  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Chrome"))
13   echo "Google Chrome";
14  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Safari"))
15   echo "Safari";
16  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Opera"))
17   echo "Opera";
18  else echo $_SERVER["HTTP_USER_AGENT"]; 
19  ?>
#T=二维数组排序
/**
 * @package     二维数组排序
 * @version     $Id: FunctionsMain.inc.php,v 1.32 2005/09/24 11:38:37 wwccss Exp $
 *
 *
 * Sort an two-dimension array by some level two items use array_multisort() function.
 *
 * sysSortArray($Array,&quot;Key1&quot;,&quot;SORT_ASC&quot;,&quot;SORT_RETULAR&quot;,&quot;Key2&quot;……)
 * @author                      Chunsheng Wang &lt;wwccss@263.net>
 * @param  array   $ArrayData   the array to sort.
 * @param  string  $KeyName1    the first item to sort by.
 * @param  string  $SortOrder1  the order to sort by(&quot;SORT_ASC&quot;|&quot;SORT_DESC&quot;)
 * @param  string  $SortType1   the sort type(&quot;SORT_REGULAR&quot;|&quot;SORT_NUMERIC&quot;|&quot;SORT_STRING&quot;)
 * @return array                sorted array.
 */
function sysSortArray($ArrayData,$KeyName1,$SortOrder1 = "SORT_ASC",$SortType1 = "SORT_REGULAR")
{
    if(!is_array($ArrayData))
   {
        return $ArrayData;
    }

    // Get args number.
    $ArgCount = func_num_args();

    // Get keys to sort by and put them to SortRule array.
    for($I = 1;$I < $ArgCount;$I ++)
   {
        $Arg = func_get_arg($I);
        if(!eregi("SORT",$Arg))
       {
            $KeyNameList[] = $Arg;
            $SortRule[]    = '$'.$Arg;
        }
        else
       {
            $SortRule[]    = $Arg;
        }
    }

    // Get the values according to the keys and put them to array.
    foreach($ArrayData AS $Key => $Info)
   {
        foreach($KeyNameList AS $KeyName)
       {
            ${$KeyName}[$Key] = $Info[$KeyName];
        }
    }

    // Create the eval string and eval it.
    $EvalString = 'array_multisort('.join(",",$SortRule).',$ArrayData);';
    eval($EvalString);
    return $ArrayData;
}

#T=discuz加密解密函数authcode
<?php
/**
* @param string $string 原文或者密文
* @param string $operation 操作(ENCODE | DECODE),默认为 DECODE
* @param string $key 密钥
* @param int $expiry 密文有效期,加密时候有效， 单位 秒，0 为永久有效
* @return string 处理后的 原文或者 经过 base64_encode 处理后的密文
*
* @example
*
*  $a = authcode('abc','ENCODE','key');
*  $b = authcode($a,'DECODE','key');  // $b(abc)
*
*  $a = authcode('abc','ENCODE','key',3600);
*  $b = authcode('abc','DECODE','key'); // 在一个小时内，$b(abc)，否则 $b 为空
*/
function authcode($string,$operation = 'DECODE',$key = '',$expiry = 3600) 
{
  $ckey_length = 4;   
  // 随机密钥长度 取值 0-32;
  // 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
  // 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
  // 当此值为 0 时，则不产生随机密钥

  $key = md5($key ? $key : EABAX::getAppInf('KEY'));
  $keya = md5(substr($key,0,16));
  $keyb = md5(substr($key,16,16));
  $keyc = $ckey_length ?($operation == 'DECODE' ? substr($string,0,$ckey_length): substr(md5(microtime()),-$ckey_length)) : '';

  $cryptkey = $keya.md5($keya.$keyc);
  $key_length = strlen($cryptkey);

  $string = $operation == 'DECODE' ? base64_decode(substr($string,$ckey_length)) : sprintf('%010d',$expiry ? $expiry + time() : 0).substr(md5($string.$keyb),0,16).$string;
  $string_length = strlen($string);

  $result = '';
  $box = range(0,255);

  $rndkey = array();
  for($i = 0; $i <= 255; $i++) 
 {
    $rndkey[$i] = ord($cryptkey[$i % $key_length]);
  }

  for($j = $i = 0; $i < 256; $i++) 
 {
    $j =($j + $box[$i] + $rndkey[$i]) % 256;
    $tmp = $box[$i];
    $box[$i] = $box[$j];
    $box[$j] = $tmp;
  }

  for($a = $j = $i = 0; $i < $string_length; $i++) 
 {
    $a =($a + 1) % 256;
    $j =($j + $box[$a]) % 256;
    $tmp = $box[$a];
    $box[$a] = $box[$j];
    $box[$j] = $tmp;
    $result .= chr(ord($string[$i]) ^($box[($box[$a] + $box[$j]) % 256]));
  }

  if($operation == 'DECODE') 
 {
    if((substr($result,0,10) == 0 || substr($result,0,10) - time() > 0) && substr($result,10,16) == substr(md5(substr($result,26).$keyb),0,16)) 
   {
      return substr($result,26);
    }
    else 
   {
      return '';
    }
  }
  else 
 {
    return $keyc.str_replace('=','',base64_encode($result));
  }
}
?>
#T=PHP获取IP与连接数，并获取IP所在地址
<?php
//获取连接数最高的ip的详细信息
$top = 10;
//获取ip的详细信息
$get_location = true;
//反解ip,用于获取蜘蛛,开启后速度较慢
$reverse = FALSE;
//$reverse = TRUE;

ini_set('extension_dir',dirname(__FILE__));
ini_set('enable_dl',TRUE);
if(!dl("php_curl.dll")){
	exit('Can\'t load curl.');
}
$content = `netstat -an -p TCP`;
$regex = "/\s+TCP\s+\d+\.\d+\.\d+\.\d+:(\d+)\s+(\d+\.\d+\.\d+\.\d+):\d+\s+/sm";

$table = array();
//1、连接数/2、本机ip/3、对方ip
/**
 * 端口/ip是唯一的
 */
if(preg_match_all($regex,$content,$result)){
	foreach($result[1] as $i=>$port){
		if(isset($table[$port.':'.$result[2][$i]]))
			$table[$port.':'.$result[2][$i]]++;
		else
			$table[$port.':'.$result[2][$i]] = 1;
	}
	$curl = curl_init();
	curl_setopt($curl,CURLOPT_TIMEOUT,5);
	curl_setopt($curl,CURLOPT_HEADER,0);
	curl_setopt($curl,CURLOPT_RETURNTRANSFER,TRUE);

	$i = 0;
	$count = 0;
	if(asort($table))
		foreach($table as $key=>$times){
			$ip = substr(strstr($key,':'),1);
			$port = substr($key,0,strpos($key,':'));
			$i++;
			echo "\r\n连接数：",$times,' - ',$key;
			if(!$get_location || $i<count($table)-$top){
				continue;
			}
			if($port=='80') $count += $times;
			if($ip!=='127.0.0.1' || $ip!=='0.0.0.0'){
				$host = $reverse ? gethostbyaddr($ip) : $ip;
				if($host==$ip){
					curl_setopt($curl,CURLOPT_URL,"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=txt&ip=".$ip);
					$location = curl_exec($curl);
					echo "(".preg_replace('/(\s|\d|\.)/','',$location).")";
				}else{
					echo "(".$host.")";
				}
			}
		}
	echo "\r\n",'All(80):',$count;
}
#T=php数组转成json格式
function array_to_json( $array ){
    if( !is_array( $array ) ){
        return false;
    }

    $associative = count( array_diff( array_keys($array),array_keys( array_keys( $array )) ));
    if( $associative ){

        $construct = array();
        foreach( $array as $key => $value ){

            // We first copy each key/value pair into a staging array,
            // formatting each key and value properly as we go.

            // Format the key:
            if( is_numeric($key) ){
                $key = "key_$key";
            }
            $key = "'".addslashes($key)."'";

            // Format the value:
            if( is_array( $value )){
                $value = array_to_json( $value );
            }else if( !is_numeric( $value ) || is_string( $value ) ){
                $value = "'".addslashes($value)."'";
            }

            // Add to staging array:
            $construct[] = "$key: $value";
        }

        // Then we collapse the staging array into the JSON form:
        $result = "{ " . implode( ",",$construct ) . " }";

    }else{ // If the array is a vector(not associative):

        $construct = array();
        foreach( $array as $value ){

            // Format the value:
            if( is_array( $value )){
                $value = array_to_json( $value );
            }else if( !is_numeric( $value ) || is_string( $value ) ){
                $value = "'".addslashes($value)."'";
            }

            // Add to staging array:
            $construct[] = $value;
        }

        // Then we collapse the staging array into the JSON form:
        $result = "[ " . implode( ",",$construct ) . " ]";
    }

    return $result;
}

#T=彻底解决跨浏览器下PHP下载文件名中的中文乱码问题
$ua = $_SERVER["HTTP_USER_AGENT"];

$filename = "中文 文件名.txt";
$encoded_filename = urlencode($filename);
$encoded_filename = str_replace("+","%20",$encoded_filename);

header('Content-Type: application/octet-stream');

if(preg_match("/MSIE/",$ua)){
	header('Content-Disposition: attachment; filename="' . $encoded_filename . '"');
}else if(preg_match("/Firefox/",$ua)){
	header('Content-Disposition: attachment; filename*="utf8\'\'' . $filename . '"');
}else{
	header('Content-Disposition: attachment; filename="' . $filename . '"');
}

print 'ABC';
#T=根据生日计算年龄
	function age($date){
	    $year_diff = '';
	    $time = strtotime($date);
	    if(FALSE === $time){
	        return '';
	    }
	 
	    $date = date('Y-m-d',$time);
	    list($year,$month,$day) = explode("-",$date);
	    $year_diff = date("Y") – $year;
	    $month_diff = date("m") – $month;
	    $day_diff = date("d") – $day;
	    if($day_diff < 0 || $month_diff < 0) $year_diff–;
	 
	    return $year_diff;
	}
#T=PHP的维护模式
	function maintenance($mode = FALSE){
	    if($mode){
	        if(basename($_SERVER['SCRIPT_FILENAME']) != 'maintenance.php'){
	            header("Location: http://example.com/maintenance.php");
	            exit;
	        }
	    }else{
	        if(basename($_SERVER['SCRIPT_FILENAME']) == 'maintenance.php'){
	            header("Location: http://example.com/");
	            exit;
	        }
	    }
	}
#T=对config.php文件的读取，修改
<?php
    $name="admin";//kkkk
    $bb='234';
    $db=4561321;
    $kkk="admin";
?> 
<?php
//配置文件数据值获取。
//默认没有第三个参数时，按照字符串读取提取''中或""中的内容
//如果有第三个参数时为int时按照数字int处理。
function getconfig($file,$ini,$type="string"){
    if($type=="int"){
        $str = file_get_contents($file);
        $config = preg_match("/" . $ini . "=(.*);/",$str,$res);
        Return $res[1];
    }else{
        $str = file_get_contents($file);
        $config = preg_match("/" . $ini . "=\"(.*)\";/",$str,$res);
        if($res[1]==null){  
            $config = preg_match("/" . $ini . "='(.*)';/",$str,$res);
        }
        Return $res[1];
    }
}
 
//配置文件数据项更新
//默认没有第四个参数时，按照字符串读取提取''中或""中的内容
//如果有第四个参数时为int时按照数字int处理。
function updateconfig($file,$ini,$value,$type="string"){
    $str = file_get_contents($file);
    $str2="";
    if($type=="int"){  
        $str2 = preg_replace("/" . $ini . "=(.*);/",$ini . "=" . $value . ";",$str);
    }else{
        $str2 = preg_replace("/" . $ini . "=(.*);/",$ini . "=\"" . $value . "\";",$str);
    }
    file_put_contents($file,$str2);
}

//echo getconfig("./2.php","bb","string");
getconfig("./2.php","bb");//
updateconfig("./2.php","kkk","admin");
//echo "<br/>".getconfig("./2.php","name","string");
?>
#T= 
#T=┉━┉━┉━┉━┉━┉
#T=usleep()		//函数延迟代码执行若干微秒。
usleep()		//函数延迟代码执行若干微秒。
#T=unpack()		//函数从二进制字符串对数据进行解包。
unpack()		//函数从二进制字符串对数据进行解包。
#T=uniqid()		//函数基于以微秒计的当前时间，生成一个唯一的 ID。
uniqid()		//函数基于以微秒计的当前时间，生成一个唯一的 ID。
#T=time_sleep_until() //函数延迟代码执行直到指定的时间。
time_sleep_until() //函数延迟代码执行直到指定的时间。
#T=time_nanosleep() //函数延迟代码执行若干秒和纳秒。
time_nanosleep() //函数延迟代码执行若干秒和纳秒。
#T=sleep() //函数延迟代码执行若干秒。
sleep() //函数延迟代码执行若干秒。
#T=show_source() //函数对文件进行语法高亮显示。
show_source() //函数对文件进行语法高亮显示。
#T=strip_whitespace() //函数返回已删除 PHP 注释以及空白字符的源代码文件。
strip_whitespace() //函数返回已删除 PHP 注释以及空白字符的源代码文件。
#T=pack() //函数把数据装入一个二进制字符串。
pack() //函数把数据装入一个二进制字符串。
#T=ignore_user_abort() //函数设置与客户机断开是否会终止脚本的执行。
ignore_user_abort() //函数设置与客户机断开是否会终止脚本的执行。
#T=highlight_string() //函数对字符串进行语法高亮显示。
highlight_string() //函数对字符串进行语法高亮显示。
#T=highlight_file() //函数对文件进行语法高亮显示。
highlight_file() //函数对文件进行语法高亮显示。
#T=get_browser() //函数返回用户浏览器的性能。
get_browser() //函数返回用户浏览器的性能。
#T=exit()		//函数输出一条消息，并退出当前脚本。
exit()		//函数输出一条消息，并退出当前脚本。
#T=eval()		//函数把字符串按照 PHP 代码来计算。
eval()		//函数把字符串按照 PHP 代码来计算。
#T=die()		//函数输出一条消息，并退出当前脚本。
die()		//函数输出一条消息，并退出当前脚本。
#T=defined()	//函数检查某常量是否存在。
defined()	//函数检查某常量是否存在。
#T=define()		//函数定义一个常量。
define()		//函数定义一个常量。
#T=constant()	//函数返回常量的值。
constant()	//函数返回常量的值。
#T=connection_status() //函数返回当前的连接状态。
connection_status() //函数返回当前的连接状态。
#T=connection_aborted() //函数检查是否断开客户机。
connection_aborted() //函数检查是否断开客户机。
#T=zip_read() //函数读取打开的 zip 档案中的下一个文件。
zip_read() //函数读取打开的 zip 档案中的下一个文件。
#T=zip_open() //函数打开 ZIP 文件以供读取。
zip_open() //函数打开 ZIP 文件以供读取。
#T=zip_entry_read() //函数从打开的 zip 档案项目中获取内容。
zip_entry_read() //函数从打开的 zip 档案项目中获取内容。
#T=zip_entry_open() //函数打开一个 ZIP 档案项目以供读取。
zip_entry_open() //函数打开一个 ZIP 档案项目以供读取。
#T=zip_entry_name() //函数返回 zip 档案项目的名称。
zip_entry_name() //函数返回 zip 档案项目的名称。
#T=zip_entry_filesize() //函数返回 zip 档案项目的原始大小（在压缩之前）。
zip_entry_filesize() //函数返回 zip 档案项目的原始大小（在压缩之前）。
#T=zip_entry_compressionmethod() //函数返回 zip 档案项目的压缩方法。
zip_entry_compressionmethod() //函数返回 zip 档案项目的压缩方法。
#T=zip_entry_compressedsize() //函数返回 zip 档案项目的压缩文件尺寸。
zip_entry_compressedsize() //函数返回 zip 档案项目的压缩文件尺寸。
#T=zip_entry_close() //函数关闭由 zip_entry_open() 函数打开的 zip 档案文件。
zip_entry_close() //函数关闭由 zip_entry_open() 函数打开的 zip 档案文件。
#T=zip_close() //函数关闭由 zip_open() 函数打开的 zip 档案文件。
zip_close() //函数关闭由 zip_open() 函数打开的 zip 档案文件。
#T=xml_set_unparsed_entity_decl_handler() //函数规定在遇到无法解析的实体名称（NDATA）声明时被调用的函数。
xml_set_unparsed_entity_decl_handler() //函数规定在遇到无法解析的实体名称（NDATA）声明时被调用的函数。
#T=xml_set_processing_instruction_handler() //函数规定当解析器在 XML 文档中找到处理指令时所调用的函数。
xml_set_processing_instruction_handler() //函数规定当解析器在 XML 文档中找到处理指令时所调用的函数。
#T=xml_set_object() //函数允许在对象中使用 XML 解析器。
xml_set_object() //函数允许在对象中使用 XML 解析器。
#T=xml_set_notation_decl_handler() //函数规定当解析器在 XML 文档中找到符号声明时被调用的函数。
xml_set_notation_decl_handler() //函数规定当解析器在 XML 文档中找到符号声明时被调用的函数。
#T=xml_set_external_entity_ref_handler() //函数规定当解析器在 XML 文档中找到外部实体时被调用的函数。
xml_set_external_entity_ref_handler() //函数规定当解析器在 XML 文档中找到外部实体时被调用的函数。
#T=xml_set_element_handler() //函数建立起始和终止元素处理器。
xml_set_element_handler() //函数建立起始和终止元素处理器。
#T=xml_set_default_handler() //函数为 XML 解析器建立默认的数据处理器。
xml_set_default_handler() //函数为 XML 解析器建立默认的数据处理器。
#T=xml_set_character_data_handler() //函数建立字符数据处理器。
xml_set_character_data_handler() //函数建立字符数据处理器。
#T=xml_parser_set_option() //函数为 XML 解析器进行选项设置。
xml_parser_set_option() //函数为 XML 解析器进行选项设置。
#T=xml_parser_get_option() //函数从 XML 解析器获取选项设置信息。
xml_parser_get_option() //函数从 XML 解析器获取选项设置信息。
#T=xml_parser_free() //函数释放 XML 解析器。
xml_parser_free() //函数释放 XML 解析器。
#T=xml_parser_create() //函数创建 XML 解析器。
xml_parser_create() //函数创建 XML 解析器。
#T=xml_parser_create_ns() //函数创建带有命名空间支持的 XML 解析器。
xml_parser_create_ns() //函数创建带有命名空间支持的 XML 解析器。
#T=xml_parse_into_struct() //函数把 XML 数据解析到数组中。
xml_parse_into_struct() //函数把 XML 数据解析到数组中。
#T=xml_parse() //函数解析 XML 文档。
xml_parse() //函数解析 XML 文档。
#T=xml_get_error_code() //函数获取 XML 解析器错误代码。
xml_get_error_code() //函数获取 XML 解析器错误代码。
#T=xml_get_current_line_number() //函数获取 XML 解析器的当前行号。
xml_get_current_line_number() //函数获取 XML 解析器的当前行号。
#T=xml_get_current_column_number() //函数获取 XML 解析器的当前列号。
xml_get_current_column_number() //函数获取 XML 解析器的当前列号。
#T=xml_get_current_byte_index() //函数获取 XML 解析器的当前字节索引。
xml_get_current_byte_index() //函数获取 XML 解析器的当前字节索引。
#T=xml_error_string() //函数获取 XML 解析器的错误描述。
xml_error_string() //函数获取 XML 解析器的错误描述。
#T=utf8_encode() //函数把 ISO-8859-1 字符串编码为 UTF-8。
utf8_encode() //函数把 ISO-8859-1 字符串编码为 UTF-8。
#T=utf8_decode() //函数把 UTF-8 字符串解码为 ISO-8859-1。
utf8_decode() //函数把 UTF-8 字符串解码为 ISO-8859-1。
#T=wordwrap() //函数按照指定长度对字符串进行折行处理。
wordwrap() //函数按照指定长度对字符串进行折行处理。
#T=vsprintf() //函数把格式化字符串写入变量中。
vsprintf() //函数把格式化字符串写入变量中。
#T=vprintf() //函数输出格式化的字符串。
vprintf() //函数输出格式化的字符串。
#T=vfprintf() //函数把格式化的字符串写到指定的输出流。
vfprintf() //函数把格式化的字符串写到指定的输出流。
#T=ucwords() //函数把字符串中每个单词的首字符转换为大写。
ucwords() //函数把字符串中每个单词的首字符转换为大写。
#T=ucfirst() //函数把字符串中的首字符转换为大写。
ucfirst() //函数把字符串中的首字符转换为大写。
#T=trim() //函数从字符串的两端删除空白字符和其他预定义字符。
trim() //函数从字符串的两端删除空白字符和其他预定义字符。
#T=substr_replace() //函数把字符串的一部分替换为另一个字符串。
substr_replace() //函数把字符串的一部分替换为另一个字符串。
#T=substr_count() //函数计算子串在字符串中出现的次数。
substr_count() //函数计算子串在字符串中出现的次数。
#T=substr_compare() //函数从指定的开始长度比较两个字符串。
substr_compare() //函数从指定的开始长度比较两个字符串。
#T=substr() //函数返回字符串的一部分。
substr() //函数返回字符串的一部分。
#T=strtr() //函数转换字符串中特定的字符。
strtr() //函数转换字符串中特定的字符。
#T=strtoupper() //函数把字符串转换为大写。
strtoupper() //函数把字符串转换为大写。
#T=strtolower() //函数把字符串转换为小写。
strtolower() //函数把字符串转换为小写。
#T=strtok() //函数把字符串分割为更小的字符串。
strtok() //函数把字符串分割为更小的字符串。
#T=strstr() //函数搜索一个字符串在另一个字符串中的第一次出现。
strstr() //函数搜索一个字符串在另一个字符串中的第一次出现。
#T=strspn() //函数返回在字符串中包含的特定字符的数目。
strspn() //函数返回在字符串中包含的特定字符的数目。
#T=strrpos() //函数查找字符串在另一个字符串中最后一次出现的位置。
strrpos() //函数查找字符串在另一个字符串中最后一次出现的位置。
#T=strripos() //函数查找字符串在另一个字符串中最后一次出现的位置。
strripos() //函数查找字符串在另一个字符串中最后一次出现的位置。
#T=strrev() //函数反转字符串。
strrev() //函数反转字符串。
#T=strrchr() //函数查找字符串在另一个字符串中最后一次出现的位置，并返回从该位置到字符串结尾的所有字符。
strrchr() //函数查找字符串在另一个字符串中最后一次出现的位置，并返回从该位置到字符串结尾的所有字符。
#T=strpos() //函数返回字符串在另一个字符串中第一次出现的位置。
strpos() //函数返回字符串在另一个字符串中第一次出现的位置。
#T=strpbrk() //函数在字符串中搜索指定字符中的任意一个。
strpbrk() //函数在字符串中搜索指定字符中的任意一个。
#T=strncmp() //函数比较两个字符串。
strncmp() //函数比较两个字符串。
#T=strncasecmp() //函数比较两个字符串。
strncasecmp() //函数比较两个字符串。
#T=strnatcmp() //函数使用一种“自然”算法来比较两个字符串。
strnatcmp() //函数使用一种“自然”算法来比较两个字符串。
#T=strnatcasecmp() //函数使用一种“自然”算法来比较两个字符串。
strnatcasecmp() //函数使用一种“自然”算法来比较两个字符串。
#T=strlen() //函数返回字符串的长度。
strlen() //函数返回字符串的长度。
#T=stristr() //函数查找字符串在另一个字符串中第一次出现的位置。
stristr() //函数查找字符串在另一个字符串中第一次出现的位置。
#T=stripos() //函数返回字符串在另一个字符串中第一次出现的位置。
stripos() //函数返回字符串在另一个字符串中第一次出现的位置。
#T=stripslashes() //函数删除由 addslashes() 函数添加的反斜杠。
stripslashes() //函数删除由 addslashes() 函数添加的反斜杠。
#T=stripcslashes() //函数删除由 addcslashes() 函数添加的反斜杠。
stripcslashes() //函数删除由 addcslashes() 函数添加的反斜杠。
#T=strip_tags() //函数剥去 HTML、XML 以及 PHP 的标签。
strip_tags() //函数剥去 HTML、XML 以及 PHP 的标签。
#T=strcspn() //函数返回在找到任何指定的字符之前，在字符串查找的字符数。
strcspn() //函数返回在找到任何指定的字符之前，在字符串查找的字符数。
#T=strcoll() //函数比较两个字符串。
strcoll() //函数比较两个字符串。
#T=strcmp() //函数比较两个字符串。
strcmp() //函数比较两个字符串。
#T=strchr() //函数搜索一个字符串在另一个字符串中的第一次出现。
strchr() //函数搜索一个字符串在另一个字符串中的第一次出现。
#T=strcasecmp() //函数比较两个字符串。
strcasecmp() //函数比较两个字符串。
#T=str_word_count() //函数计算字符串中的单词数。
str_word_count() //函数计算字符串中的单词数。
#T=str_split() //函数把字符串分割到数组中。
str_split() //函数把字符串分割到数组中。
#T=str_shuffle() //函数随机地打乱字符串中的所有字符。
str_shuffle() //函数随机地打乱字符串中的所有字符。
#T=str_rot13() //函数对字符串执行 ROT13 编码。
str_rot13() //函数对字符串执行 ROT13 编码。
#T=str_replace() //函数使用一个字符串替换字符串中的另一些字符。
str_replace() //函数使用一个字符串替换字符串中的另一些字符。
#T=str_repeat() //函数把字符串重复指定的次数。
str_repeat() //函数把字符串重复指定的次数。
#T=str_pad() //函数把字符串填充为指定的长度。
str_pad() //函数把字符串填充为指定的长度。
#T=str_ireplace() //函数使用一个字符串替换字符串中的另一些字符。
str_ireplace() //函数使用一个字符串替换字符串中的另一些字符。
#T=sscanf() //函数根据指定的格式解析来自一个字符串的输入。
sscanf() //函数根据指定的格式解析来自一个字符串的输入。
#T=sprintf() //函数把格式化的字符串写写入一个变量中。
sprintf() //函数把格式化的字符串写写入一个变量中。
#T=soundex() //函数计算字符串的 soundex 键。
soundex() //函数计算字符串的 soundex 键。
#T=similar_text() //函数计算两个字符串的匹配字符的数目。
similar_text() //函数计算两个字符串的匹配字符的数目。
#T=sha1_file() //函数计算文件的 SHA-1 散列。
sha1_file() //函数计算文件的 SHA-1 散列。
#T=sha1() //函数计算字符串的 SHA-1 散列。
sha1() //函数计算字符串的 SHA-1 散列。
#T=setlocale() //函数设置地区信息（地域信息）。
setlocale() //函数设置地区信息（地域信息）。
#T=rtrim() //P rtrim() 函数
rtrim() //P rtrim() 函数
#T=quotemeta() //函数在字符串中某些预定义的字符前添加反斜杠。
quotemeta() //函数在字符串中某些预定义的字符前添加反斜杠。
#T=quoted_printable_decode() //函数对经过 quoted-printable 编码后的字符串进行解码，返回 8 位的字符串。
quoted_printable_decode() //函数对经过 quoted-printable 编码后的字符串进行解码，返回 8 位的字符串。
#T=printf() //函数输出格式化的字符串。
printf() //函数输出格式化的字符串。
#T=print() //函数输出一个或多个字符串。
print() //函数输出一个或多个字符串。
#T=parse_str() //函数把查询字符串解析到变量中。
parse_str() //函数把查询字符串解析到变量中。
#T=ord() //函数返回字符串第一个字符的 ASCII 值。
ord() //函数返回字符串第一个字符的 ASCII 值。
#T=number_format() //函数通过千位分组来格式化数字。
number_format() //函数通过千位分组来格式化数字。
#T=nl2br() //函数在字符串中的每个新行(\n) 之前插入 HTML 换行符(<br />)。
nl2br() //函数在字符串中的每个新行(\n) 之前插入 HTML 换行符(<br />)。
#T=nl_langinfo() //函数返回指定的本地信息。
nl_langinfo() //函数返回指定的本地信息。
#T=money_format() //函数把字符串格式化为货币字符串。
money_format() //函数把字符串格式化为货币字符串。
#T=metaphone() //函数计算字符串的 metaphone 键。
metaphone() //函数计算字符串的 metaphone 键。
#T=md5_file() //函数计算文件的 MD5 散列。
md5_file() //函数计算文件的 MD5 散列。
#T=md5() //函数计算字符串的 MD5 散列。
md5() //函数计算字符串的 MD5 散列。
#T=ltrim() //函数从字符串左侧删除空格或其他预定义字符。
ltrim() //函数从字符串左侧删除空格或其他预定义字符。
#T=localeconv() //函数返回包含本地数字及货币信息格式的数组。
localeconv() //函数返回包含本地数字及货币信息格式的数组。
#T=levenshtein() //函数返回两个字符串之间的 Levenshtein 距离。
levenshtein() //函数返回两个字符串之间的 Levenshtein 距离。
#T=join() //函数把数组元素组合为一个字符串。
join() //函数把数组元素组合为一个字符串。
#T=implode() //函数把数组元素组合为一个字符串。
implode() //函数把数组元素组合为一个字符串。
#T=htmlspecialchars() //函数把一些预定义的字符转换为 HTML 实体。
htmlspecialchars() //函数把一些预定义的字符转换为 HTML 实体。
#T=htmlentities() //函数把字符转换为 HTML 实体。
htmlentities() //函数把字符转换为 HTML 实体。
#T=html_entity_decode() //函数把 HTML 实体转换为字符。
html_entity_decode() //函数把 HTML 实体转换为字符。
#T=hebrevc() //函数把希伯来文本从右至左的流转换为左至右的流。它也会把新行(\n) 转换为 <br />。
hebrevc() //函数把希伯来文本从右至左的流转换为左至右的流。它也会把新行(\n) 转换为 <br />。
#T=hebrev() //函数把希伯来文本从右至左的流转换为左至右的流。
hebrev() //函数把希伯来文本从右至左的流转换为左至右的流。
#T=get_html_translation_table() //函数返回被 htmlentities() 和 htmlspecialchars() 函数使用的翻译表。
get_html_translation_table() //函数返回被 htmlentities() 和 htmlspecialchars() 函数使用的翻译表。
#T=fprintf() //函数把格式化的字符串写到指定的输出流（例如：文件或数据库）。
fprintf() //函数把格式化的字符串写到指定的输出流（例如：文件或数据库）。
#T=explode() //函数把字符串分割为数组。
explode() //函数把字符串分割为数组。
#T=echo() //函数输出一个或多个字符串。
echo() //函数输出一个或多个字符串。
#T=crypt() //函数返回使用 DES、Blowfish 或 MD5 加密的字符串。
crypt() //函数返回使用 DES、Blowfish 或 MD5 加密的字符串。
#T=crc32() //函数计算一个字符串的 crc32 多项式。
crc32() //函数计算一个字符串的 crc32 多项式。
#T=count_chars() //函数返回字符串所用字符的信息。
count_chars() //函数返回字符串所用字符的信息。
#T=convert_uuencode() //函数使用 uuencode 算法对字符串进行编码。
convert_uuencode() //函数使用 uuencode 算法对字符串进行编码。
#T=convert_uudecode() //函数对 uuencode 编码的字符串进行解码。
convert_uudecode() //函数对 uuencode 编码的字符串进行解码。
#T=convert_cyr_string() //函数把字符由一种 Cyrillic 字符转换成另一种。
convert_cyr_string() //函数把字符由一种 Cyrillic 字符转换成另一种。
#T=chunk_split() //函数把字符串分割为一连串更小的部分。
chunk_split() //函数把字符串分割为一连串更小的部分。
#T=chr() //函数从指定的 ASCII 值返回字符。
chr() //函数从指定的 ASCII 值返回字符。
#T=chop() //函数从字符串的末端开始删除空白字符或其他预定义字符。
chop() //函数从字符串的末端开始删除空白字符或其他预定义字符。
#T=bin2hex() //函数把 ASCII 字符的字符串转换为十六进制值。
bin2hex() //函数把 ASCII 字符的字符串转换为十六进制值。
#T=addslashes() //函数在指定的预定义字符前添加反斜杠。
addslashes() //函数在指定的预定义字符前添加反斜杠。
#T=addcslashes() //函数在指定的字符前添加反斜杠。
addcslashes() //函数在指定的字符前添加反斜杠。
#T=xpath() //函数运行对 XML 文档的 XPath 查询。
xpath() //函数运行对 XML 文档的 XPath 查询。
#T=simplexml_load_string() //函数把 XML 字符串载入对象中。
simplexml_load_string() //函数把 XML 字符串载入对象中。
#T=simplexml_load_file() //函数把 XML 文档载入对象中。
simplexml_load_file() //函数把 XML 文档载入对象中。
#T=simplexml_import_dom() //函数把 DOM 节点转换为 SimpleXMLElement 对象。
simplexml_import_dom() //函数把 DOM 节点转换为 SimpleXMLElement 对象。
#T=registerXPathNamespace() //函数为下一次 XPath 查询创建命名空间语境。
registerXPathNamespace() //函数为下一次 XPath 查询创建命名空间语境。
#T=getNamespace() //函数获取在 XML 文档中使用的命名空间。
getNamespace() //函数获取在 XML 文档中使用的命名空间。
#T=getName() //函数从 SimpleXMLElement 对象获取 XML 元素的名称。
getName() //函数从 SimpleXMLElement 对象获取 XML 元素的名称。
#T=getDocNamespaces() //函数从 SimpleXMLElement 对象返回在 XML 文档中声明的命名空间。
getDocNamespaces() //函数从 SimpleXMLElement 对象返回在 XML 文档中声明的命名空间。
#T=children() //函数获取指定节点的子节点。
children() //函数获取指定节点的子节点。
#T=attributes() //函数获取 SimpleXML 元素的属性。
attributes() //函数获取 SimpleXML 元素的属性。
#T=asXML() //函数以字符串的形式从 SimpleXMLElement 对象返回 XML 文档。
asXML() //函数以字符串的形式从 SimpleXMLElement 对象返回 XML 文档。
#T=addChild() //函数向指定的 XML 节点添加一个子节点。
addChild() //函数向指定的 XML 节点添加一个子节点。
#T=addAttribute() //函数给 SimpleXML 元素添加一个属性。
addAttribute() //函数给 SimpleXML 元素添加一个属性。
#T=__construct() //函数创建一个新的 SimpleXMLElement 对象。
__construct() //函数创建一个新的 SimpleXMLElement 对象。
#T=mysql_unbuffered_query() //函数向 MySQL 发送一条 SQL 查询（不获取 / 缓存结果）。
mysql_unbuffered_query() //函数向 MySQL 发送一条 SQL 查询（不获取 / 缓存结果）。
#T=mysql_thread_id() //函数返回当前线程的 ID。
mysql_thread_id() //函数返回当前线程的 ID。
#T=mysql_stat() //函数返回 MySQL 服务器的当前系统状态。
mysql_stat() //函数返回 MySQL 服务器的当前系统状态。
#T=mysql_select_db() //函数设置活动的 MySQL 数据库。
mysql_select_db() //函数设置活动的 MySQL 数据库。
#T=mysql_result() //函数返回结果集中一个字段的值。
mysql_result() //函数返回结果集中一个字段的值。
#T=mysql_real_escape_string() //函数转义 SQL 语句中使用的字符串中的特殊字符。
mysql_real_escape_string() //函数转义 SQL 语句中使用的字符串中的特殊字符。
#T=mysql_query() //函数执行一条 MySQL 查询。
mysql_query() //函数执行一条 MySQL 查询。
#T=mysql_ping() //函数 Ping 一个服务器连接，如果没有连接则重新连接。
mysql_ping() //函数 Ping 一个服务器连接，如果没有连接则重新连接。
#T=mysql_pconnect() //函数打开一个到 MySQL 服务器的持久连接。
mysql_pconnect() //函数打开一个到 MySQL 服务器的持久连接。
#T=mysql_num_rows() //函数返回结果集中行的数目。
mysql_num_rows() //函数返回结果集中行的数目。
#T=mysql_num_fields() //函数返回结果集中字段的数。
mysql_num_fields() //函数返回结果集中字段的数。
#T=mysql_list_processes() //函数列出 MySQL 进程。
mysql_list_processes() //函数列出 MySQL 进程。
#T=mysql_list_dbs() //函数列出 MySQL 服务器中所有的数据库。
mysql_list_dbs() //函数列出 MySQL 服务器中所有的数据库。
#T=mysql_insert_id() //函数返回上一步 INSERT 操作产生的 ID。
mysql_insert_id() //函数返回上一步 INSERT 操作产生的 ID。
#T=mysql_info() //函数返回最近一条查询的信息。
mysql_info() //函数返回最近一条查询的信息。
#T=mysql_get_server_info() //函数返回 MySQL 服务器的信息。
mysql_get_server_info() //函数返回 MySQL 服务器的信息。
#T=mysql_get_proto_info() //函数返回 MySQL 协议的信息。
mysql_get_proto_info() //函数返回 MySQL 协议的信息。
#T=mysql_get_host_info() //函数返回 MySQL 主机的信息。
mysql_get_host_info() //函数返回 MySQL 主机的信息。
#T=mysql_get_client_info() //函数返回 MySQL 客户端信息。
mysql_get_client_info() //函数返回 MySQL 客户端信息。
#T=mysql_free_result() //函数释放结果内存。
mysql_free_result() //函数释放结果内存。
#T=mysql_field_type() //函数返回结果集中指定字段的类型。
mysql_field_type() //函数返回结果集中指定字段的类型。
#T=mysql_field_table() //函数返回指定字段所在的表名。
mysql_field_table() //函数返回指定字段所在的表名。
#T=mysql_field_seek() //函数将结果集中的指针设定为指定的字段偏移量。
mysql_field_seek() //函数将结果集中的指针设定为指定的字段偏移量。
#T=mysql_field_name() //函数取得结果中指定字段的字段名。
mysql_field_name() //函数取得结果中指定字段的字段名。
#T=mysql_field_len() //函数返回指定字段的长度。
mysql_field_len() //函数返回指定字段的长度。
#T=mysql_field_flags() //函数从结果中取得和指定字段关联的标志。
mysql_field_flags() //函数从结果中取得和指定字段关联的标志。
#T=mysql_fetch_row() //函数从结果集中取得一行作为数字数组。
mysql_fetch_row() //函数从结果集中取得一行作为数字数组。
#T=mysql_fetch_object() //函数从结果集（记录集）中取得一行作为对象。
mysql_fetch_object() //函数从结果集（记录集）中取得一行作为对象。
#T=mysql_fetch_lengths() //函数取得一行中每个字段的内容的长度。
mysql_fetch_lengths() //函数取得一行中每个字段的内容的长度。
#T=mysql_fetch_field() //函数从结果集中取得列信息并作为对象返回。
mysql_fetch_field() //函数从结果集中取得列信息并作为对象返回。
#T=mysql_fetch_assoc() //函数从结果集中取得一行作为关联数组。
mysql_fetch_assoc() //函数从结果集中取得一行作为关联数组。
#T=mysql_fetch_array() //函数从结果集中取得一行作为关联数组，或数字数组，或二者兼有
mysql_fetch_array() //函数从结果集中取得一行作为关联数组，或数字数组，或二者兼有
#T=mysql_error() //函数返回上一个 MySQL 操作产生的文本错误信息。
mysql_error() //函数返回上一个 MySQL 操作产生的文本错误信息。
#T=mysql_errno() //函数返回上一个 MySQL 操作中的错误信息的数字编码。
mysql_errno() //函数返回上一个 MySQL 操作中的错误信息的数字编码。
#T=mysql_db_name() //函数取得 mysql_list_dbs() 调用所返回的数据库名。
mysql_db_name() //函数取得 mysql_list_dbs() 调用所返回的数据库名。
#T=mysql_data_seek() //函数移动内部结果的指针。
mysql_data_seek() //函数移动内部结果的指针。
#T=mysql_connect() //函数打开非持久的 MySQL 连接。
mysql_connect() //函数打开非持久的 MySQL 连接。
#T=mysql_close() //函数关闭非持久的 MySQL 连接。
mysql_close() //函数关闭非持久的 MySQL 连接。
#T=mysql_client_encoding() //函数返回当前连接的字符集的名称。
mysql_client_encoding() //函数返回当前连接的字符集的名称。
#T=mysql_affected_rows() //函数返回前一次 MySQL 操作所影响的记录行数。
mysql_affected_rows() //函数返回前一次 MySQL 操作所影响的记录行数。
#T=tanh() //函数返回双曲正切。
tanh() //函数返回双曲正切。
#T=tan() //函数返回正切。
tan() //函数返回正切。
#T=srand() //函数播下随机数发生器种子。
srand() //函数播下随机数发生器种子。
#T=sqrt() //函数返回一个数的平方根。
sqrt() //函数返回一个数的平方根。
#T=sinh() //函数返回一个数的双曲正弦。
sinh() //函数返回一个数的双曲正弦。
#T=sin() //函数返回一个数的正弦。
sin() //函数返回一个数的正弦。
#T=round() //函数对浮点数进行四舍五入。
round() //函数对浮点数进行四舍五入。
#T=rand() //函数返回随机整数。
rand() //函数返回随机整数。
#T=rad2deg() //函数把弧度数转换为角度数。
rad2deg() //函数把弧度数转换为角度数。
#T=pow() //函数返回 x 的 y 次方。
pow() //函数返回 x 的 y 次方。
#T=pi() //函数返回圆周率的值。
pi() //函数返回圆周率的值。
#T=octdec() //函数把八进制转换为十进制。
octdec() //函数把八进制转换为十进制。
#T=mt_srand() //播种 Mersenne Twister 随机数生成器。
mt_srand() //播种 Mersenne Twister 随机数生成器。
#T=mt_rand() //使用 Mersenne Twister 算法返回随机整数。
mt_rand() //使用 Mersenne Twister 算法返回随机整数。
#T=mt_getrandmax() //显示随机数的最大可能值。
mt_getrandmax() //显示随机数的最大可能值。
#T=min() //返回最小值。
min() //返回最小值。
#T=max() //返回最大值。
max() //返回最大值。
#T=log1p() //以返回 log(1 + x)，甚至当 x 的值接近零也能计算出准确结果。
log1p() //以返回 log(1 + x)，甚至当 x 的值接近零也能计算出准确结果。
#T=log10() //以 10 为底的对数。
log10() //以 10 为底的对数。
#T=log() //返回自然对数。
log() //返回自然对数。
#T=lcg_value() //组合线性同余发生器。
lcg_value() //组合线性同余发生器。
#T=is_nan() //判断是否为合法数值。
is_nan() //判断是否为合法数值。
#T=is_infinite() //判断是否为无限值。
is_infinite() //判断是否为无限值。
#T=is_finite() //函数判断是否为有限值。
is_finite() //函数判断是否为有限值。
#T=hypot() //函数计算一直角三角形的斜边长度。
hypot() //函数计算一直角三角形的斜边长度。
#T=hexdec() //函数把十六进制转换为十进制。
hexdec() //函数把十六进制转换为十进制。
#T=fmod() //函数显示随机数最大的可能值。
fmod() //函数显示随机数最大的可能值。
#T=fmod() //函数返回除法的浮点数余数。
fmod() //函数返回除法的浮点数余数。
#T=floor() //函数向下舍入为最接近的整数。
floor() //函数向下舍入为最接近的整数。
#T=expm1() //函数返回 exp(x) - 1，甚至当 number 的值接近零也能计算出准确结果。
expm1() //函数返回 exp(x) - 1，甚至当 number 的值接近零也能计算出准确结果。
#T=exp() //函数计算 e 的指数。
exp() //函数计算 e 的指数。
#T=deg2rad() //函数将角度转换为弧度。
deg2rad() //函数将角度转换为弧度。
#T=decoct() //函数把十进制转换为八进制。
decoct() //函数把十进制转换为八进制。
#T=dechex() //函数把十进制转换为十六进制。
dechex() //函数把十进制转换为十六进制。
#T=decbin() //函数把十进制转换为二进制。
decbin() //函数把十进制转换为二进制。
#T=cosh() //函数返回一个数的双曲余弦。
cosh() //函数返回一个数的双曲余弦。
#T=cos() //函数返回一个数的余弦。
cos() //函数返回一个数的余弦。
#T=ceil() //函数向上舍入为最接近的整数。
ceil() //函数向上舍入为最接近的整数。
#T=bindec() //函数把二进制转换为十进制。
bindec() //函数把二进制转换为十进制。
#T=base_convert() //函数在任意进制之间转换数字。
base_convert() //函数在任意进制之间转换数字。
#T=atanh() //函数返回一个角度的反双曲正切。
atanh() //函数返回一个角度的反双曲正切。
#T=asinh() //函数返回一个数的反双曲正弦。
asinh() //函数返回一个数的反双曲正弦。
#T=asin() //函数返回不同数值的反正弦，返回的结果是介于 -PI/2 与 PI/2 之间的弧度值。
asin() //函数返回不同数值的反正弦，返回的结果是介于 -PI/2 与 PI/2 之间的弧度值。
#T=acosh() //函数返回一个数的反双曲余弦。
acosh() //函数返回一个数的反双曲余弦。
#T=acos() //函数返回一个数的反余弦。
acos() //函数返回一个数的反余弦。
#T=abs() //函数返回一个数的绝对值。
abs() //函数返回一个数的绝对值。
#T=mail() //函数允许您从脚本中直接发送电子邮件。
mail() //函数允许您从脚本中直接发送电子邮件。
#T=libxml_use_internal_errors() //函数禁用标准的 libxml 错误，并启用用户错误处理。
libxml_use_internal_errors() //函数禁用标准的 libxml 错误，并启用用户错误处理。
#T=libxml_get_last_error() //函数从 libxml 错误缓冲中获取最后一个错误。
libxml_get_last_error() //函数从 libxml 错误缓冲中获取最后一个错误。
#T=libxml_get_errors() //函数从 libxml 错误缓冲中获取错误。
libxml_get_errors() //函数从 libxml 错误缓冲中获取错误。
#T=libxml_clear_errors() //函数清空 libxml 错误缓冲。
libxml_clear_errors() //函数清空 libxml 错误缓冲。
#T=setrawcookie() //函数不对 cookie 值进行 URL 编码，发送一个 HTTP cookie。
setrawcookie() //函数不对 cookie 值进行 URL 编码，发送一个 HTTP cookie。
#T=setcookie() //函数向客户端发送一个 HTTP cookie。
setcookie() //函数向客户端发送一个 HTTP cookie。
#T=headers_sent() //函数检查 HTTP 报头是否发送/已发送到何处。
headers_sent() //函数检查 HTTP 报头是否发送/已发送到何处。
#T=headers_list() //函数返回已发送的（或待发送的）响应头部的一个列表。
headers_list() //函数返回已发送的（或待发送的）响应头部的一个列表。
#T=header() //函数向客户端发送原始的 HTTP 报头。
header() //函数向客户端发送原始的 HTTP 报头。
#T=ftp_systype() //函数返回远程 FTP 服务器的系统类型标识符。
ftp_systype() //函数返回远程 FTP 服务器的系统类型标识符。
#T=ftp_ssl_connect() //函数打开一个安全的 SSL-FTP 连接。
ftp_ssl_connect() //函数打开一个安全的 SSL-FTP 连接。
#T=ftp_size() //函数返回指定文件的大小。
ftp_size() //函数返回指定文件的大小。
#T=ftp_site() //函数向服务器发送 SITE 命令。
ftp_site() //函数向服务器发送 SITE 命令。
#T=ftp_set_option() //函数设置各种 FTP 运行时选项。
ftp_set_option() //函数设置各种 FTP 运行时选项。
#T=ftp_rmdir() //函数删除一个目录。
ftp_rmdir() //函数删除一个目录。
#T=ftp_rename() //函数更改 FTP 服务器上的文件或目录名。
ftp_rename() //函数更改 FTP 服务器上的文件或目录名。
#T=ftp_rawlist() //函数返回指定目录中文件的详细列表。
ftp_rawlist() //函数返回指定目录中文件的详细列表。
#T=ftp_raw() //函数向 FTP 服务器发送一个 raw 命令。
ftp_raw() //函数向 FTP 服务器发送一个 raw 命令。
#T=ftp_quit() //函数关闭 FTP 连接。
ftp_quit() //函数关闭 FTP 连接。
#T=ftp_pwd() //函数返回当前目录名。
ftp_pwd() //函数返回当前目录名。
#T=ftp_put() //函数把文件上传到服务器。
ftp_put() //函数把文件上传到服务器。
#T=ftp_pasv() //函数把被动模式设置为打开或关闭。
ftp_pasv() //函数把被动模式设置为打开或关闭。
#T=ftp_nlist() //函数返回指定目录的文件列表。
ftp_nlist() //函数返回指定目录的文件列表。
#T=ftp_nb_put() //函数把文件上传到服务器(non-blocking)。
ftp_nb_put() //函数把文件上传到服务器(non-blocking)。
#T=ftp_nb_get() //函数从 FTP 服务器上获取文件并写入本地文件(non-blocking)。
ftp_nb_get() //函数从 FTP 服务器上获取文件并写入本地文件(non-blocking)。
#T=ftp_nb_fput() //函数上传一个已打开的文件，并在 FTP 服务器上把它保存为文件(non-blocking)。
ftp_nb_fput() //函数上传一个已打开的文件，并在 FTP 服务器上把它保存为文件(non-blocking)。
#T=ftp_nb_fget() //函数从 FTP 服务器上下载一个文件并保存到本地已经打开的一个文件中(non-blocking)。
ftp_nb_fget() //函数从 FTP 服务器上下载一个文件并保存到本地已经打开的一个文件中(non-blocking)。
#T=ftp_nb_continue() //函数连续获取 / 发送文件。
ftp_nb_continue() //函数连续获取 / 发送文件。
#T=ftp_mkdir() //函数在 FTP 服务器上建立新目录。
ftp_mkdir() //函数在 FTP 服务器上建立新目录。
#T=ftp_mdtm() //函数返回指定文件的最后修改时间。
ftp_mdtm() //函数返回指定文件的最后修改时间。
#T=ftp_login() //函数登录 FTP 服务器。
ftp_login() //函数登录 FTP 服务器。
#T=ftp_get() //函数从 FTP 服务器上下载一个文件。
ftp_get() //函数从 FTP 服务器上下载一个文件。
#T=ftp_get_option() //函数返回当前 FTP 连接的各种不同的选项设置。
ftp_get_option() //函数返回当前 FTP 连接的各种不同的选项设置。
#T=ftp_fput() //函数上传一个已经打开的文件到 FTP 服务器。
ftp_fput() //函数上传一个已经打开的文件到 FTP 服务器。
#T=ftp_fget() //函数从 FTP 服务器上下载一个文件并保存到本地一个已经打开的文件中。
ftp_fget() //函数从 FTP 服务器上下载一个文件并保存到本地一个已经打开的文件中。
#T=ftp_exec() //函数请求在 FTP 服务器上执行一个程序或命令。
ftp_exec() //函数请求在 FTP 服务器上执行一个程序或命令。
#T=ftp_delete() //函数删除 FTP 服务器上的一个文件。
ftp_delete() //函数删除 FTP 服务器上的一个文件。
#T=ftp_connect() //函数建立一个新的 FTP 连接。
ftp_connect() //函数建立一个新的 FTP 连接。
#T=ftp_close() //函数关闭 FTP 连接。
ftp_close() //函数关闭 FTP 连接。
#T=ftp_chmod() //函数设置 FTP 服务器上指定文件的权限。
ftp_chmod() //函数设置 FTP 服务器上指定文件的权限。
#T=ftp_chdir() //函数改变 FTP 服务器上的当前目录。
ftp_chdir() //函数改变 FTP 服务器上的当前目录。
#T=ftp_cdup() //函数把当前目录改变为 FTP 服务器上的父目录。
ftp_cdup() //函数把当前目录改变为 FTP 服务器上的父目录。
#T=ftp_alloc() //函数为要上传到 FTP 服务器的文件分配空间。
ftp_alloc() //函数为要上传到 FTP 服务器的文件分配空间。
#T=filter_var() //函数通过指定的过滤器过滤变量。
filter_var() //函数通过指定的过滤器过滤变量。
#T=filter_var_array() //函数获取多项变量，并进行过滤。
filter_var_array() //函数获取多项变量，并进行过滤。
#T=filter_list() //函数返回包含所有得到支持的过滤器的一个数组。
filter_list() //函数返回包含所有得到支持的过滤器的一个数组。
#T=filter_input_array() //函数从脚本外部获取多项输入，并进行过滤。
filter_input_array() //函数从脚本外部获取多项输入，并进行过滤。
#T=filter_input() //函数从脚本外部获取输入，并进行过滤。
filter_input() //函数从脚本外部获取输入，并进行过滤。
#T=filter_id() //函数返回指定过滤器的 ID 号。
filter_id() //函数返回指定过滤器的 ID 号。
#T=filter_has_var() //函数检查是否存在指定输入类型的变量。
filter_has_var() //函数检查是否存在指定输入类型的变量。
#T=unlink() //函数删除文件。
unlink() //函数删除文件。
#T=umask() //函数改变当前的 umask。
umask() //函数改变当前的 umask。
#T=touch() //函数设置指定文件的访问和修改时间。
touch() //函数设置指定文件的访问和修改时间。
#T=tmpfile() //函数以读写（w+）模式建立一个具有唯一文件名的临时文件。
tmpfile() //函数以读写（w+）模式建立一个具有唯一文件名的临时文件。
#T=tempnam() //函数创建一个具有唯一文件名的临时文件。
tempnam() //函数创建一个具有唯一文件名的临时文件。
#T=symlink() //函数创建符号连接。
symlink() //函数创建符号连接。
#T=stat() //函数返回关于文件的信息。
stat() //函数返回关于文件的信息。
#T=set_file_buffer() //函数设置打开文件的缓冲大小。
set_file_buffer() //函数设置打开文件的缓冲大小。
#T=rmdir() //函数删除空的目录。
rmdir() //函数删除空的目录。
#T=rewind() //函数将文件指针的位置倒回文件的开头。
rewind() //函数将文件指针的位置倒回文件的开头。
#T=rename() //函数重命名文件或目录。
rename() //函数重命名文件或目录。
#T=realpath() //函数返回绝对路径。
realpath() //函数返回绝对路径。
#T=readlink() //函数返回符号连接指向的目标。
readlink() //函数返回符号连接指向的目标。
#T=readfile() //函数输出一个文件。
readfile() //函数输出一个文件。
#T=popen() //函数打开进程文件指针。
popen() //函数打开进程文件指针。
#T=pclose() //函数关闭由 popen() 打开的管道。
pclose() //函数关闭由 popen() 打开的管道。
#T=pathinfo() //函数以数组的形式返回文件路径的信息。
pathinfo() //函数以数组的形式返回文件路径的信息。
#T=parse_ini_file() //函数解析一个配置文件，并以数组的形式返回其中的设置。
parse_ini_file() //函数解析一个配置文件，并以数组的形式返回其中的设置。
#T=move_uploaded_file() //函数将上传的文件移动到新位置。
move_uploaded_file() //函数将上传的文件移动到新位置。
#T=mkdir() //函数创建目录。
mkdir() //函数创建目录。
#T=lstat() //函数返回关于文件或符号连接的信息。
lstat() //函数返回关于文件或符号连接的信息。
#T=linkinfo() //函数返回连接的信息。
linkinfo() //函数返回连接的信息。
#T=link() //函数建立一个硬连接。
link() //函数建立一个硬连接。
#T=is_writeable() //函数判断指定的文件是否可写。
is_writeable() //函数判断指定的文件是否可写。
#T=is_writable() //函数判断指定的文件是否可写。
is_writable() //函数判断指定的文件是否可写。
#T=is_uploaded_file() //函数判断指定的文件是否是通过 HTTP POST 上传的。
is_uploaded_file() //函数判断指定的文件是否是通过 HTTP POST 上传的。
#T=is_readable() //函数判断指定文件名是否可读。
is_readable() //函数判断指定文件名是否可读。
#T=is_link() //函数判断指定文件名是否为一个符号连接。
is_link() //函数判断指定文件名是否为一个符号连接。
#T=is_file() //函数检查指定的文件名是否是正常的文件。
is_file() //函数检查指定的文件名是否是正常的文件。
#T=is_executable() //函数检查指定的文件是否可执行。
is_executable() //函数检查指定的文件是否可执行。
#T=is_dir() //函数检查指定的文件是否是目录。
is_dir() //函数检查指定的文件是否是目录。
#T=glob() //函数返回匹配指定模式的文件名或目录。
glob() //函数返回匹配指定模式的文件名或目录。
#T=fwrite() //函数写入文件（可安全用于二进制文件）。
fwrite() //函数写入文件（可安全用于二进制文件）。
#T=ftruncate() //函数把文件截断到指定的长度。
ftruncate() //函数把文件截断到指定的长度。
#T=ftell() //函数在打开文件中的当前位置。
ftell() //函数在打开文件中的当前位置。
#T=fstat() //函数返回关于打开文件的信息。
fstat() //函数返回关于打开文件的信息。
#T=fseek() //函数在打开的文件中定位。
fseek() //函数在打开的文件中定位。
#T=fscanf() //函数根据指定的格式对来自打开的文件的输入进行解析。
fscanf() //函数根据指定的格式对来自打开的文件的输入进行解析。
#T=fread() //函数读取文件（可安全用于二进制文件）。
fread() //函数读取文件（可安全用于二进制文件）。
#T=fputs() //函数写入文件（可安全用于二进制文件）。
fputs() //函数写入文件（可安全用于二进制文件）。
#T=fputcsv() //函数将行格式化为 CSV 并写入一个打开的文件。
fputcsv() //函数将行格式化为 CSV 并写入一个打开的文件。
#T=fpassthru() //函数输出文件指针处的所有剩余数据。
fpassthru() //函数输出文件指针处的所有剩余数据。
#T=fopen() //函数打开文件或者 URL。
fopen() //函数打开文件或者 URL。
#T=fnmatch() //函数根据指定的模式来匹配文件名或字符串。
fnmatch() //函数根据指定的模式来匹配文件名或字符串。
#T=flock() //函数锁定或释放文件。
flock() //函数锁定或释放文件。
#T=filetype() //函数返回指定文件或目录的类型。
filetype() //函数返回指定文件或目录的类型。
#T=filesize() //函数返回指定文件的大小。
filesize() //函数返回指定文件的大小。
#T=fileperms() //函数返回文件或目录的权限。
fileperms() //函数返回文件或目录的权限。
#T=fileowner() //函数返回文件的所有者。
fileowner() //函数返回文件的所有者。
#T=filemtime() //函数返回文件内容上次的修改时间。
filemtime() //函数返回文件内容上次的修改时间。
#T=fileinode() //函数返回文件的 inode 编号。
fileinode() //函数返回文件的 inode 编号。
#T=filegroup() //函数返回指定文件的组 ID。
filegroup() //函数返回指定文件的组 ID。
#T=filectime() //函数返回指定文件的上次 inode 修改时间。
filectime() //函数返回指定文件的上次 inode 修改时间。
#T=fileatime() //函数返回指定文件的上次访问时间。
fileatime() //函数返回指定文件的上次访问时间。
#T=file_put_contents() //函数把一个字符串写入文件中。
file_put_contents() //函数把一个字符串写入文件中。
#T=file_get_contents() //函数把整个文件读入一个字符串中。
file_get_contents() //函数把整个文件读入一个字符串中。
#T=file_exists() //函数检查文件或目录是否存在。
file_exists() //函数检查文件或目录是否存在。
#T=file() //函数把整个文件读入一个数组中。
file() //函数把整个文件读入一个数组中。
#T=fgetss() //函数从打开的文件中读取一行并过滤掉 HTML 和 PHP 标记。
fgetss() //函数从打开的文件中读取一行并过滤掉 HTML 和 PHP 标记。
#T=fgets() //函数从文件指针中读取一行。
fgets() //函数从文件指针中读取一行。
#T=fgetcsv() //函数从文件指针中读入一行并解析 CSV 字段。
fgetcsv() //函数从文件指针中读入一行并解析 CSV 字段。
#T=fgetc() //函数从文件指针中读取一个字符。
fgetc() //函数从文件指针中读取一个字符。
#T=fflush() //函数将缓冲内容输出到文件。
fflush() //函数将缓冲内容输出到文件。
#T=feof() //函数检测是否已到达文件末尾(eof)。
feof() //函数检测是否已到达文件末尾(eof)。
#T=fclose() //函数关闭一个打开文件。
fclose() //函数关闭一个打开文件。
#T=diskfreespace() //函数返回目录中的可用空间。该函数是 disk_free_space() 函数的别名。
diskfreespace() //函数返回目录中的可用空间。该函数是 disk_free_space() 函数的别名。
#T=disk_total_space() //函数返回指定目录的磁盘总大小。
disk_total_space() //函数返回指定目录的磁盘总大小。
#T=disk_free_space() //函数返回目录中的可用空间
disk_free_space() //函数返回目录中的可用空间
#T=dirname() //函数返回路径中的目录部分。
dirname() //函数返回路径中的目录部分。
#T=clearstatcache() //函数拷贝文件。
clearstatcache() //函数拷贝文件。
#T=clearstatcache() //函数清除文件状态缓存。
clearstatcache() //函数清除文件状态缓存。
#T=chown() //函数改变指定文件的所有者。
chown() //函数改变指定文件的所有者。
#T=chmod() //函数改变文件模式。
chmod() //函数改变文件模式。
#T=chgrp() //函数改变文件所属的组。
chgrp() //函数改变文件所属的组。
#T=basename() //函数返回路径中的文件名部分。
basename() //函数返回路径中的文件名部分。
#T=set_exception_handler() //函数设置用户自定义的异常处理函数。
set_exception_handler() //函数设置用户自定义的异常处理函数。
#T=set_error_handler() //函数设置用户自定义的错误处理函数。
set_error_handler() //函数设置用户自定义的错误处理函数。
#T=restore_exception_handler() //函数恢复之前的异常处理程序，该程序是由 set_exception_handler() 函数改变的。
restore_exception_handler() //函数恢复之前的异常处理程序，该程序是由 set_exception_handler() 函数改变的。
#T=restore_error_handler() //函数恢复之前的错误处理程序，该程序是由 set_error_handler() 函数改变的。
restore_error_handler() //函数恢复之前的错误处理程序，该程序是由 set_error_handler() 函数改变的。
#T=error_reporting() //设置 PHP 的报错级别并返回当前级别。
error_reporting() //设置 PHP 的报错级别并返回当前级别。
#T=error_log() //函数向服务器错误记录、文件或远程目标发送一个错误。
error_log() //函数向服务器错误记录、文件或远程目标发送一个错误。
#T=error_get_last() //函数获取最后发生的错误。
error_get_last() //函数获取最后发生的错误。
#T=debug_print_backtrace() //函数输出 backtrace。
debug_print_backtrace() //函数输出 backtrace。
#T=debug_backtrace() //cktrace() 函数
debug_backtrace() //cktrace() 函数
#T=scandir() //函数返回一个数组，其中包含指定路径中的文件和目录。
scandir() //函数返回一个数组，其中包含指定路径中的文件和目录。
#T=rewinddir() //函数重置由 opendir() 打开的目录句柄。
rewinddir() //函数重置由 opendir() 打开的目录句柄。
#T=readdir() //函数返回由 opendir() 打开的目录句柄中的条目。
readdir() //函数返回由 opendir() 打开的目录句柄中的条目。
#T=opendir() //函数打开一个目录句柄，可由 closedir()，readdir() 和 rewinddir() 使用。
opendir() //函数打开一个目录句柄，可由 closedir()，readdir() 和 rewinddir() 使用。
#T=getcwd() //函数返回当前目录。
getcwd() //函数返回当前目录。
#T=closedir() //函数关闭由 opendir() 函数打开的目录句柄。
closedir() //函数关闭由 opendir() 函数打开的目录句柄。
#T=dir() //函数打开一个目录句柄，并返回一个对象。这个对象包含三个方法：read() ,rewind() 以及 close()。
dir() //函数打开一个目录句柄，并返回一个对象。这个对象包含三个方法：read() ,rewind() 以及 close()。
#T=chroot() //函数把当前进程的根目录改变为指定的目录。
chroot() //函数把当前进程的根目录改变为指定的目录。
#T=chdir() //函数把当前的目录改变为指定的目录。
chdir() //函数把当前的目录改变为指定的目录。
#T=time() //函数返回当前时间的 Unix 时间戳。
time() //函数返回当前时间的 Unix 时间戳。
#T=strtotime() //函数将任何英文文本的日期时间描述解析为 Unix 时间戳。
strtotime() //函数将任何英文文本的日期时间描述解析为 Unix 时间戳。
#T=strptime() //函数解析由 strftime() 生成的日期／时间。
strptime() //函数解析由 strftime() 生成的日期／时间。
#T=strftime() //函数根据区域设置格式化本地时间／日期。
strftime() //函数根据区域设置格式化本地时间／日期。
#T=mktime() //函数返回一个日期的 Unix 时间戳。
mktime() //函数返回一个日期的 Unix 时间戳。
#T=microtime() //函数返回当前 Unix 时间戳和微秒数。
microtime() //函数返回当前 Unix 时间戳和微秒数。
#T=localtime() //函数返回本地时间（一个数组）。
localtime() //函数返回本地时间（一个数组）。
#T=idate() //函数将本地时间/日期格式化为整数。
idate() //函数将本地时间/日期格式化为整数。
#T=gmstrftime() //函数根据本地区域设置格式化 GMT/UTC 时间／日期。
gmstrftime() //函数根据本地区域设置格式化 GMT/UTC 时间／日期。
#T=gmmktime() //函数取得 GMT 日期的 UNIX 时间戳。
gmmktime() //函数取得 GMT 日期的 UNIX 时间戳。
#T=gmdate() //函数格式化 GMT/UTC 日期/时间。
gmdate() //函数格式化 GMT/UTC 日期/时间。
#T=gettimeofday() //函数返回一个包含当前时间信息的数组。
gettimeofday() //函数返回一个包含当前时间信息的数组。
#T=getdate() //函数取得日期／时间信息。
getdate() //函数取得日期／时间信息。
#T=date() //函数格式化一个本地时间／日期。
date() //函数格式化一个本地时间／日期。
#T=date_sunset() //函数返回指定的日期与地点的日落时间。
date_sunset() //函数返回指定的日期与地点的日落时间。
#T=date_sunrise() //函数返回指定的日期与地点的日出时间。
date_sunrise() //函数返回指定的日期与地点的日出时间。
#T=date_default_timezone_set() //函数设置用在脚本中所有日期/时间函数的默认时区。
date_default_timezone_set() //函数设置用在脚本中所有日期/时间函数的默认时区。
#T=date_default_timezone_get() //函数返回脚本中所有日期时间函数所使用的默认时区。
date_default_timezone_get() //函数返回脚本中所有日期时间函数所使用的默认时区。
#T=checkdate() //函数验证一个格里高里日期。
checkdate() //函数验证一个格里高里日期。
#T=UnixToJD() //函数把 Unix 时间戳转换为儒略日计数。
UnixToJD() //函数把 Unix 时间戳转换为儒略日计数。
#T=JulianToJD() //函数把儒略历转换为儒略日计数。
JulianToJD() //函数把儒略历转换为儒略日计数。
#T=JewishToJD() //函数把犹太历法转换为儒略日计数。
JewishToJD() //函数把犹太历法转换为儒略日计数。
#T=JDToUnix() //函数把儒略日计数转换为 Unix 时间戳。
JDToUnix() //函数把儒略日计数转换为 Unix 时间戳。
#T=JDToGregorian() //lian() 函数
JDToGregorian() //lian() 函数
#T=JDToGregorian() //函数把儒略日计数转换为格利高里历法。
JDToGregorian() //函数把儒略日计数转换为格利高里历法。
#T=JDToFrench() //函数把儒略日计数转换为法国共和国历法。
JDToFrench() //函数把儒略日计数转换为法国共和国历法。
#T=JDMonthName() //函数返回指定历法的月份字符串。
JDMonthName() //函数返回指定历法的月份字符串。
#T=JDDayOfWeek() //函数返回日期在周几。
JDDayOfWeek() //函数返回日期在周几。
#T=GregorianToJD() //函数将格利高里历法转换成为儒略日计数。
GregorianToJD() //函数将格利高里历法转换成为儒略日计数。
#T=FrenchToJD() //函数将法国共和历法转换成为儒略日计数。
FrenchToJD() //函数将法国共和历法转换成为儒略日计数。
#T=easter_days() //函数返回指定年份的复活节与 3 月 21 日之间的天数。
easter_days() //函数返回指定年份的复活节与 3 月 21 日之间的天数。
#T=easter_date() //函数返回指定年份的复活节午夜的 Unix 时间戳。
easter_date() //函数返回指定年份的复活节午夜的 Unix 时间戳。
#T=cal_to_jd() //函数把指定的日期转换为儒略日计数。
cal_to_jd() //函数把指定的日期转换为儒略日计数。
#T=cal_info() //函数返回一个数组，其中包含了关于给定历法的信息。
cal_info() //函数返回一个数组，其中包含了关于给定历法的信息。
#T=cal_from_jd() //函数把儒略日计数转换为指定历法的日期。
cal_from_jd() //函数把儒略日计数转换为指定历法的日期。
#T=cal_days_in_month() //函数针对指定的年份和日历，返回一个月中的天数。
cal_days_in_month() //函数针对指定的年份和日历，返回一个月中的天数。
#T=usort() //函数使用用户自定义的函数对数组排序。
usort() //函数使用用户自定义的函数对数组排序。
#T=uksort() //函数使用用户自定义的比较函数按照键名对数组排序，并保持索引关系。
uksort() //函数使用用户自定义的比较函数按照键名对数组排序，并保持索引关系。
#T=uasort() //函数使用用户自定义的比较函数对数组排序，并保持索引关联（不为元素分配新的键）。
uasort() //函数使用用户自定义的比较函数对数组排序，并保持索引关联（不为元素分配新的键）。
#T=sort() //函数按升序对给定数组的值排序。
sort() //函数按升序对给定数组的值排序。
#T=sizeof() //函数计算数组中的单元数目或对象中的属性个数。
sizeof() //函数计算数组中的单元数目或对象中的属性个数。
#T=shuffle() //函数把数组中的元素按随机顺序重新排列。
shuffle() //函数把数组中的元素按随机顺序重新排列。
#T=rsort() //函数对数组的元素按照键值进行逆向排序。与 arsort() 的功能基本相同。
rsort() //函数对数组的元素按照键值进行逆向排序。与 arsort() 的功能基本相同。
#T=reset() //函数把数组的内部指针指向第一个元素，并返回这个元素的值。
reset() //函数把数组的内部指针指向第一个元素，并返回这个元素的值。
#T=range() //函数创建并返回一个包含指定范围的元素的数组。
range() //函数创建并返回一个包含指定范围的元素的数组。
#T=prev() //HP prev() 函数
prev() //HP prev() 函数
#T=pos() //函数是 current() 函数 的别名。它可返回数组中当前元素的值。
pos() //函数是 current() 函数 的别名。它可返回数组中当前元素的值。
#T=next() //函数把指向当前元素的指针移动到下一个元素的位置，并返回当前元素的值。
next() //函数把指向当前元素的指针移动到下一个元素的位置，并返回当前元素的值。
#T=natsort() //函数用自然顺序算法对给定数组中的元素排序。
natsort() //函数用自然顺序算法对给定数组中的元素排序。
#T=natcasesort() //函数用不区分大小写的自然顺序算法对给定数组中的元素排序。
natcasesort() //函数用不区分大小写的自然顺序算法对给定数组中的元素排序。
#T=list() //函数用数组中的元素为一组变量赋值。
list() //函数用数组中的元素为一组变量赋值。
#T=ksort() //函数按照键名对数组排序，为数组值保留原来的键。
ksort() //函数按照键名对数组排序，为数组值保留原来的键。
#T=krsort() //函数将数组按照键逆向排序，为数组值保留原来的键。
krsort() //函数将数组按照键逆向排序，为数组值保留原来的键。
#T=key() //函数返回数组内部指针当前指向元素的键名。
key() //函数返回数组内部指针当前指向元素的键名。
#T=in_array() //函数在数组中搜索给定的值。
in_array() //函数在数组中搜索给定的值。
#T=extract()
extract()
#T=end() //函数将数组内部指针指向最后一个元素，并返回该元素的值（如果成功）。
end() //函数将数组内部指针指向最后一个元素，并返回该元素的值（如果成功）。
#T=each() //函数生成一个由数组当前内部指针所指向的元素的键名和键值组成的数组，并把内部指针向前移动。
each() //函数生成一个由数组当前内部指针所指向的元素的键名和键值组成的数组，并把内部指针向前移动。
#T=current() //函数返回数组中的当前元素（单元）。
current() //函数返回数组中的当前元素（单元）。
#T=count() //函数计算数组中的单元数目或对象中的属性个数。
count() //函数计算数组中的单元数目或对象中的属性个数。
#T=compact() //函数创建一个由参数所带变量组成的数组。如果参数中存在数组，该数组中变量的值也会被获取。
compact() //函数创建一个由参数所带变量组成的数组。如果参数中存在数组，该数组中变量的值也会被获取。
#T=asort() //函数对数组进行排序并保持索引关系。主要用于对那些单元顺序很重要的结合数组进行排序。
asort() //函数对数组进行排序并保持索引关系。主要用于对那些单元顺序很重要的结合数组进行排序。
#T=arsort() //函数对数组进行逆向排序并保持索引关系。主要用于对那些单元顺序很重要的结合数组进行排序。
arsort() //函数对数组进行逆向排序并保持索引关系。主要用于对那些单元顺序很重要的结合数组进行排序。
#T=array_walk_recursive() //cursive() 函数
array_walk_recursive() //cursive() 函数
#T=array_walk() //函数对数组中的每个元素应用回调函数。如果成功则返回 TRUE，否则返回 FALSE。
array_walk() //函数对数组中的每个元素应用回调函数。如果成功则返回 TRUE，否则返回 FALSE。
#T=array_values() //函数返回一个包含给定数组中所有键值的数组，但不保留键名。
array_values() //函数返回一个包含给定数组中所有键值的数组，但不保留键名。
#T=array_unshift() //函数在数组开头插入一个或多个元素。
array_unshift() //函数在数组开头插入一个或多个元素。
#T=array_unique() //函数移除数组中的重复的值，并返回结果数组。
array_unique() //函数移除数组中的重复的值，并返回结果数组。
#T=array_uintersect_assoc() //函数带索引检查计算数组的交集，用回调函数比较数据。
array_uintersect_assoc() //函数带索引检查计算数组的交集，用回调函数比较数据。
#T=array_uintersect() //函数计算数组的交集，用回调函数比较数据。
array_uintersect() //函数计算数组的交集，用回调函数比较数据。
#T=array_udiff_uassoc() //函数返回 array1 数组中存在但其它数组中都不存在的部分。返回的数组中键名保持不变。
array_udiff_uassoc() //函数返回 array1 数组中存在但其它数组中都不存在的部分。返回的数组中键名保持不变。
#T=array_udiff_assoc() //函数返回 array1 中存在但其它数组中都不存在的部分。
array_udiff_assoc() //函数返回 array1 中存在但其它数组中都不存在的部分。
#T=array_udiff() //函数返回一个数组，该数组包括了所有在被比较数组中，但是不在任何其它参数数组中的值，键名保留不变。
array_udiff() //函数返回一个数组，该数组包括了所有在被比较数组中，但是不在任何其它参数数组中的值，键名保留不变。
#T=array_sum() //函数返回数组中所有值的总和。
array_sum() //函数返回数组中所有值的总和。
#T=array_splice() //函数与 array_slice() 函数类似，选择数组中的一系列元素，但不返回，而是删除它们并用其它值代替。
array_splice() //函数与 array_slice() 函数类似，选择数组中的一系列元素，但不返回，而是删除它们并用其它值代替。
#T=array_slice() //函数在数组中根据条件取出一段值，并返回。
array_slice() //函数在数组中根据条件取出一段值，并返回。
#T=array_shift() //函数删除数组中的第一个元素，并返回被删除元素的值。
array_shift() //函数删除数组中的第一个元素，并返回被删除元素的值。
#T=array_search() //函数与 in_array() 一样，在数组中查找一个键值。如果找到了该值，匹配元素的键名会被返回。如果没找到，则返回 false。
array_search() //函数与 in_array() 一样，在数组中查找一个键值。如果找到了该值，匹配元素的键名会被返回。如果没找到，则返回 false。
#T=array_reverse() //函数将原数组中的元素顺序翻转，创建新的数组并返回。如果第二个参数指定为 true，则元素的键名保持不变，否则键名将丢失。
array_reverse() //函数将原数组中的元素顺序翻转，创建新的数组并返回。如果第二个参数指定为 true，则元素的键名保持不变，否则键名将丢失。
#T=array_reduce() //函数用回调函数迭代地将数组简化为单一的值。如果指定第三个参数，则该参数将被当成是数组中的第一个值来处理，或者如果数组为空的话就作为最终返回值。
array_reduce() //函数用回调函数迭代地将数组简化为单一的值。如果指定第三个参数，则该参数将被当成是数组中的第一个值来处理，或者如果数组为空的话就作为最终返回值。
#T=array_rand() //函数从数组中随机选出一个或多个元素，并返回。
array_rand() //函数从数组中随机选出一个或多个元素，并返回。
#T=array_push() //函数向第一个参数的数组尾部添加一个或多个元素（入栈），然后返回新数组的长度。
array_push() //函数向第一个参数的数组尾部添加一个或多个元素（入栈），然后返回新数组的长度。
#T=array_product() //函数计算并返回数组中所有值的乘积。
array_product() //函数计算并返回数组中所有值的乘积。
#T=array_pop() //函数删除数组中的最后一个元素。
array_pop() //函数删除数组中的最后一个元素。
#T=array_pad() //函数向一个数组插入带有指定值的指定数量的元素。
array_pad() //函数向一个数组插入带有指定值的指定数量的元素。
#T=array_multisort() //函数对多个数组或多维数组进行排序。
array_multisort() //函数对多个数组或多维数组进行排序。
#T=array_merge_recursive() //函数与 array_merge() 函数 一样，将一个或多个数组的元素的合并起来，一个数组中的值附加在前一个数组的后面。并返回作为结果的数组。
array_merge_recursive() //函数与 array_merge() 函数 一样，将一个或多个数组的元素的合并起来，一个数组中的值附加在前一个数组的后面。并返回作为结果的数组。
#T=array_merge() //函数把两个或多个数组合并为一个数组。
array_merge() //函数把两个或多个数组合并为一个数组。
#T=array_map() //函数返回用户自定义函数作用后的数组。回调函数接受的参数数目应该和传递给 array_map() 函数的数组数目一致。
array_map() //函数返回用户自定义函数作用后的数组。回调函数接受的参数数目应该和传递给 array_map() 函数的数组数目一致。
#T=array_keys() //函数返回包含数组中所有键名的一个新数组。
array_keys() //函数返回包含数组中所有键名的一个新数组。
#T=array_key_exists() //函数判断某个数组中是否存在指定的 key，如果该 key 存在，则返回 true，否则返回 false。
array_key_exists() //函数判断某个数组中是否存在指定的 key，如果该 key 存在，则返回 true，否则返回 false。
#T=array_intersect_ukey() //函数用回调函数比较键名来计算数组的交集。
array_intersect_ukey() //函数用回调函数比较键名来计算数组的交集。
#T=array_intersect_uassoc() //函数使用用户自定义的回调函数计算数组的交集，用回调函数比较索引。
array_intersect_uassoc() //函数使用用户自定义的回调函数计算数组的交集，用回调函数比较索引。
#T=array_intersect_key() //函数使用键名比较计算数组的交集。
array_intersect_key() //函数使用键名比较计算数组的交集。
#T=array_intersect_assoc() //函数返回两个或多个数组的交集数组。
array_intersect_assoc() //函数返回两个或多个数组的交集数组。
#T=array_intersect() //函数返回两个或多个数组的交集数组。
array_intersect() //函数返回两个或多个数组的交集数组。
#T=array_flip() //函数返回一个反转后的数组，如果同一值出现了多次，则最后一个键名将作为它的值，所有其他的键名都将丢失。
array_flip() //函数返回一个反转后的数组，如果同一值出现了多次，则最后一个键名将作为它的值，所有其他的键名都将丢失。
#T=array_filter() //函数用回调函数过滤数组中的元素，如果自定义过滤函数返回 true，则被操作的数组的当前值就会被包含在返回的结果数组中， 并将结果组成一个新的数组。如果原数组是一个关联数组，键名保持不变。
array_filter() //函数用回调函数过滤数组中的元素，如果自定义过滤函数返回 true，则被操作的数组的当前值就会被包含在返回的结果数组中， 并将结果组成一个新的数组。如果原数组是一个关联数组，键名保持不变。
#T=array_fill() //函数用给定的值填充数组，返回的数组有 number 个元素，值为 value。返回的数组使用数字索引，从 start 位置开始并递增。如果 number 为 0 或小于 0，就会出错。
array_fill() //函数用给定的值填充数组，返回的数组有 number 个元素，值为 value。返回的数组使用数字索引，从 start 位置开始并递增。如果 number 为 0 或小于 0，就会出错。
#T=array_diff_ukey() //返回一个数组，该数组包括了所有出现在 array1 中但是未出现在任何其它参数数组中的键名的值。注意关联关系保留不变。与 array_diff() 不同的是，比较是根据键名而不是值来进行的。
array_diff_ukey() //返回一个数组，该数组包括了所有出现在 array1 中但是未出现在任何其它参数数组中的键名的值。注意关联关系保留不变。与 array_diff() 不同的是，比较是根据键名而不是值来进行的。
#T=array_diff_uassoc() //函数使用用户自定义的回调函数(callback) 做索引检查来计算两个或多个数组的差集。返回一个数组，该数组包括了在 array1 中但是不在任何其他参数数组中的值。
array_diff_uassoc() //函数使用用户自定义的回调函数(callback) 做索引检查来计算两个或多个数组的差集。返回一个数组，该数组包括了在 array1 中但是不在任何其他参数数组中的值。
#T=array_diff_key() //函数返回一个数组，该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键。
array_diff_key() //函数返回一个数组，该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键。
#T=array_diff_assoc() //函数返回两个数组的差集数组。该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键和值。
array_diff_assoc() //函数返回两个数组的差集数组。该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键和值。
#T=array_diff() //函数返回两个数组的差集数组。该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键值。
array_diff() //函数返回两个数组的差集数组。该数组包括了所有在被比较的数组中，但是不在任何其他参数数组中的键值。
#T=array_count_values() //函数用于统计数组中所有值出现的次数。
array_count_values() //函数用于统计数组中所有值出现的次数。
#T=array_combine() //函数通过合并两个数组来创建一个新数组，其中的一个数组是键名，另一个数组的值为键值。
array_combine() //函数通过合并两个数组来创建一个新数组，其中的一个数组是键名，另一个数组的值为键值。
#T=array_chunk() //函数把一个数组分割为新的数组块。
array_chunk() //函数把一个数组分割为新的数组块。
#T=array_change_key_case() //函数将数组的所有的 KEY 都转换为大写或小写。
array_change_key_case() //函数将数组的所有的 KEY 都转换为大写或小写。
#T=array() //创建数组，带有键和值。如果在规定数组时省略了键，则生成一个整数键，这个 key 从 0 开始，然后以 1 进行递增。
array() //创建数组，带有键和值。如果在规定数组时省略了键，则生成一个整数键，这个 key 从 0 开始，然后以 1 进行递增。
#
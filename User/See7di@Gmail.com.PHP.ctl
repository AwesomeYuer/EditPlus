#TITLE=See7di.@PHP 5.2.6
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=CI��ܲ���
#T= 
#T=Class test extends
Class test^! extends CI_Controller{
	Public function first($page='home'){
		IF(!File_exists('application/views/page/'.$page.'.php')){
			show_404();//ҳ�治����
		}
		$data['title'] = ucfirst($page); // ��title�еĵ�һ���ַ���д
		$data['info'] = '��title�еĵ�һ���ַ���д';
		$this->load->view('tpl/header',$data);
		$this->load->view('page/'.$page,$data);
		$this->load->view('tpl/footer', $data);
	}
}
#T=$this->load->view('tpl/^!',$data);
$data['title'] = ucfirst($page);
$this->load->view('tpl/header',$data);


#T= 
#T=���������������������������������� 
#T= 
#T=��Ĉ���php��������
$_="\x45\x63\x68\x6F";
$_ '��Ҫݔ���ă���';

ʵ�����൱���±ߵĴ���:
Echo preg_replace('//e',find);
��
Function e($a) {
	Echo $a;
}
$_="\x65";
$_('��Ҫݔ���ă���');
#T=����ѭ�h��ԇ�@ȡ����
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
#T=shareһ��curl�ɼ�����Ĵ���
	������������curl�����⣬������û��д�˸��ɼ���̳��С�������������ģ���½����ȡҳ��Դ���룬����ƥ�����Ȳ��֣�ϣ���Դ�����á�
	<?php
	set_time_limit(0);

	//cookie����Ŀ¼
	$cookie_jar = '/tmp/cookie.tmp';

	/*����------------------------------------------------------------------------------------------------------------*/

	//ģ����������
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

	//��ȡ�����б�
	function getThreadsList($code){
	preg_match_all('/<!--[.|\r|\n]*?<a href=\"viewthread.php\?tid=(\d+)/',$code,$threads);
	return $threads[1];
	}

	//�жϸ������Ƿ����
	function isExits($code){
	preg_match('/<p>ָ�������ⲻ���ڻ��ѱ�ɾ�������ڱ���ˣ��뷵�ء�<\/p>/',$code,$error);
	return isset($error[0])?false:true;
	}

	//��ȡ���ӱ���
	function getTitle($code){
	preg_match('/<h1>[^<\/h1>]*/',$code,$title_tmp);
	$title = $title_tmp[0];
	return $title;
	}

	//��ȡ��������:
	function getAuthor($code){
	preg_match('/<a href=\"space.php\?uid=\d+\" target=\"_blank\" id=\"userinfo\d+\" onmouseover=\"showMenu\(this\.id\)\">.+/',$code,$author_tmp);
	$author = strip_tags($author_tmp[0]);
	return $author;
	}

	//��ȡ¥�����������
	function getContents($code){
	preg_match('/<div id=\"postmessage_\d+\" class=\"t_msgfont\">(.|\r|\n)*?<\/div>/',$code,$contents_tmp);
	$contents = preg_replace('/images\//','http://bbs.war3.cn/images/',$contents_tmp[0]);
	return $contents;
	}

	//��ӡ���ӱ���
	function printTitle($title){
	echo "<strong><h2>���ӱ���:</h2></strong>",strip_tags($title),"<br/><br/>";
	}

	//�����������
	function printAuthor($author){
	echo "<strong><h2>��������:</h2></strong>",strip_tags($author),"<br/><br/>";
	}

	//��ӡ��������
	function printContents($contents){
	echo "<strong><h2>���߷��������:</h2>",$contents,"</strong><br/>";
	}

	//����
	function printError(){
	echo "<i>�����Ӳ�����!</i>";
	}

	/*�����б�end---------------------------------------------------------------------------------------------------*/


	/*��¼��̳ begin*/
	$url = 'http://bbs.war3.cn/logging.php?action=login';
	$postfields='loginfield=username&username=1nject10n&password=xxxxxx&questionid=0&cookietime=315360000&referer=http://bbs.war3.cn/&loginsubmit=�ύ';
	request($url,$postfields,$cookie_jar,'');
	unset($postfields,$url);
	/*��¼��̳ end*/


	/*��ȡ�����б�(λ�ڵ�һҳ������) begin*/
	$url = 'http://bbs.war3.cn/forumdisplay.php?fid=57';
	$code = request($url,'',$cookie_jar,'');
	$threadsList = getThreadsList($code);
	/*��ȡ�����б� end*/

	//��������
	$rows = 0;

	/*ѭ��ץȡ��������Դ���� begin*/
	foreach($threadsList as $list){
	$url = "http://bbs.war3.cn/viewthread.php?tid=$list";

	if(isExits($code)){
	$code = request($url,'',$cookie_jar,'');
	$color = $rows%2==0?'#00CCFF':'#FFFF33';
	echo "<div style='background-color:$color'>";
	echo "<h1>��",($rows+1),"��:</h1><br/>";
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
	/*ץȡԴ���� end*/
	?>
#T=ģ��������񼯔���
//�ȷ���UA��ģ����������
ini_set('user_agent','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; GreenBrowser)');

$flg=File_get_contents('http://mtgox.com/api/0/data/ticker.php');
$obj=Json_decode($flg,true);//��JSON��ʽתΪPHP����  
#T=��дĬ��ȫ�ֱ���
if(PHP_VERSION < '5.3.0'){
	set_magic_quotes_runtime(0);
}

define('DISCUZ_ROOT',substr(dirname(__FILE__),0,-12));
define('MAGIC_QUOTES_GPC',function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc());
define('ICONV_ENABLE',function_exists('iconv'));
define('MB_ENABLE',function_exists('mb_convert_encoding'));
define('EXT_OBGZIP',function_exists('ob_gzhandler'));

define('TIMESTAMP',time());
#T=ĳȫ�ֱ����Ƿ��Ѿ������
if(!defined('DISCUZ_CORE_FUNCTION')){
	exit('function_core.php is missing');
}
#T=�Ƿ��Ѿ�include��ĳ�ļ�
if(!@include(DISCUZ_ROOT.'./source/function/function_core.php')){
	exit('function_core.php is missing');
}
#T=��д$GLOBALS�ڵ�ֵ
foreach($GLOBALS as $key => $value){
	if(!isset($this->superglobal[$key])){
		$GLOBALS[$key] = null; unset($GLOBALS[$key]);
	}
}
#T=׼ȷȡ��PHP_SELF��ֵ
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
#T=����Ĭ��ʱ��
Function timezone_set($timeoffset = 0){
	if(function_exists('date_default_timezone_set')){
		@date_default_timezone_set('Etc/GMT'.($timeoffset > 0 ? '-' : '+').(abs($timeoffset)));
	}
}
#T=ͨ�����ݻ�ȡ
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
#T=����ʹ��Global������:����::����()
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
#T=������ĳ���,�и��ִ�
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
#T=ͨ��addslashes
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
#T=ͨ��htmlspecialchars
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
#T=ͨ��email���
Function isemail($email){
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/",$email);
}
#T=�������˼·
//lang_�����ļ���.php
//ÿ�������ļ���Ӧ��һ��lang�ļ�
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
#T=����ʱ��
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
#T=ѭ���������
$a_0 = "��";
$a_1 = "��";
$a_2 = "php";
$a_3 = "����Ա";
For($i=0;$i<4;$i++){
	Echo ${"a_".$i}."-";
}
#T=����ַ���
$str="abcdefgh";
$str=implode(',',Str_Split($str));
Echo $str;
#T=�Ƚ�����������ַ����Ƿ���ͬ
$s1='abc';$s1=Str_Split($s1);sort($s1);
$s1='acb';$s2=Str_Split($s2);sort($s2);
IF(Implode($s1)==Implode($s2)){
	Echo 'yes';
}
#T=ʹ��ȫ�ֱ�����$GLOBALS['var']����global $var
$t=='ȫ��ֵ';
$GLOBALS["t"];
Function F(){
	$t="���¸�ֵ";
    Echo '��ǰ:'.$GLOBALS["t"]."<br>";
    Echo '��ǰ:'.$t."<br>";
}
F();
#T=��ͬһ���ַ����滻�����ֵ
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
#T=��׼��̨ͨ�ñ��

Echo "<form id='f1' method='post' action='?work=&id=' onsubmit='return ck(this);'><div class='tBox'>";
Echo "<table width='100%' align='center' border='0' cellspacing='0' cellpadding='1' class='Tab'>".Chr(10);
Echo "<tr class='Head'><td colspan='10'><strong>�б�</strong> | <a href='?work=adduser'>�������</a> | <a href='javascript:' submit='true' fid='f1'>��������</a></td></tr>".Chr(10);
Echo "<tr class='tit'><td colspan='10' class='info h'>�±���ʾ����...</td></tr>".Chr(10);
Echo "<tr class='tit'><td width='25'><input type='checkbox' id='id'></td><td>����</td><td>���֤��</td><td width='90'>������Ŀ</td></tr>".Chr(10);

Echo "<tr class='main'><td><input type='checkbox' value='' name='id[]'></td><td><a href='?work=mdy&id='>����</a></td><td>���֤��</td><td><a href='?work=mdy&id='>�޸�</a>��<a href='?work=del&id='>ɾ��</a></td></tr>".Chr(10);

Echo "<tr class='pag'><td colspan='3'><a href='?work=deluser' submit='true' fid='f1' js=\"$('#f1').attr('action',this.href);\">ɾ����ѡ</a></td><td colspan='7'>��ҳ</td></tr>".Chr(10);
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
#T=False��ȡֵ��Χ
��ת��Ϊ boolean ʱ������ֵ����Ϊ�� FALSE�� 
��FALSE ���� 
������ֵ 0(��) 
��������ֵ 0.0(��) 
�����ַ���,�Լ� �ַ��� "0" 
���������κ�Ԫ�ص����� 
���������κγ�Ա�����Ķ��󣨽�PHP 4.0 ���ã� 
���������� NULL(������δ�趨�ı���) 
����û���κα�ǣ�tags����XML�ĵ����ɵ�SimpleXML ���� 
����ֵ������Ϊ�� True�������κ���Դ���� 
#T=�ܽ��һЩPHP�����е�tips
������Щtips��������ʵ�ʹ����������γɵģ���Щ�����ǲ���ȷ�ģ���Щ���ڸ���ϰ�ߣ����ԣ�ǧ��Ҫ��������Щ������ʲô��׼�����п�������������bug������������ڲ�̬�������У�SO!��һ����ϸ�Ŀ��������룬��ô���ĺô���ʲô������������ĸ���Ӱ�죿�������ر�ӭ�����������ۡ��������д��ƪ���ֵ�Ŀ�ģ�ϣ���ܺʹ�Ҷ�ཻ����Ҳϣ�����������Լ���ͬʱ���ܸ����һЩ������

����ϰ�ߺ�PHP���룺

1��׼ȷ�������ָ�����ڵ��¶������������������һ֪���Կ��������к����棻

2���������ۣ��ʵ��Ŀ��С��������ո������ܸ�����������ε���˼��

3��һ��Ҫдע�ͣ�����Ҫǡ����ע�ͣ�Ҫ��Ȼ�����ά���������߽��ִ�����˻�ʹ�޲��ѣ�

4����̬�����������Ȩ�ޡ��ӿڡ�������Ӧ���ۺ�����ʹ�ã����Ӹ����ص㣻

5����Ҫ����ճ������ʹ��Ҫ�õ��ֳɵĴ��룬ҲҪһ��һ�е����ĺ��ټ��뵽����Ŀ����Ϊ����������ǣ���̫���׳����ˣ�����ʹ�ÿ�Դ�����ִ�δ������Ҫ��

6��������Ҫ��ʼ����

7����Ҫֻ����error��������warning��notice������ܻᵼ���պ��Ī����������⣬��Ŀ�ڿ���״̬��Ӧ����error_reporting( E_ALL  ^  E_NOTICE )���ȵ�������������������ʱ��Ӧ�ر����д��󱨸�display_errors=Off,error_reporting(0)���� pAUL gAO���������Ǹ�����ķ�����error_reporting(E_ALL | E_STRICT)�����������������м�¼������־

8����¼һЩ��Ҫ�Ĵ�����־������д�ļ�ʧ�ܡ�дmemcacheʧ�ܣ�socket����ʧ�ܡ���д���ݿ�ʧ�ܣ���־�ܹ�������������ʱ�Ŀ��ٶ�λ���ⲿ���������Ҹ�����ǿ�ҽ���ر����д��󱨸�ģ�

9����try��catch�����쳣���Դ���Ľ�׳�а�����������API�ӿ����������������Ե��Ѻö��ˣ�

10��˫�����г��ֵı���������ϴ����ţ������ǡ�${nider}at gmail.com�����ǡ�{$tom}at zendstudio.net��������ϰ�ߣ��Ҹ�ϲ������һ�֣�

11�������ٵ�if elseǶ�ײ�����Ҳ����Ҫ���һ���ǳ����ӵ��߼��㷨�����������������ô����߼�������

12�����Ķ����Ͽ�Դ��Ŀ��������루����������Ŀ�Ŀ�Դ���룩����ȡ����ֵ�ý���ĵط�

13�����԰���sprintf�ĸ�ʽ�������Ƕ�ô����һ���°���

14��д���沢������Ҫ��serializeһ�ε�

15��AJAX�����ݵ�ʱ�򣬲�Ҫ�����ݿ���������ֱ��json_encode�󴫸��ͻ��ˣ�������������һ���İ�ȫ���գ��ֶ�����¶��������һЩ����Ҫ�����ݱ������˷Ѵ�������ͬ��������API�ӿ�

16��Ҫ�ǵô���ħ���������ҵķ�����ֱ�ӹرգ���ȻҲ���Ի�ȡ����״̬�����⴫�����ݱ��������ε�����

17����$GLOBALS['var']����global $var

18���������׵�die�������������ڷ����ڲ�

19��require��require_once��include��include_once������΢��ͬ��Ӧ�ó���

20��Ϊ������޶ȵ�ʹ��д�뻺��ɹ������Խ�����Դ���+usleep����һ������3�Σ��������Ǿͼ���һ��log��

21��PHP�ĳ����Ǹ��ǳ��õĶ������ܶ࿪Դ��Ŀ����һ�����ļ�������Ҫ�õ��ĳ���

22�������ܵ�ʹ�þ���·��Ѱ���ļ�

23��autoload�Ǹ������Ķ���

24���������set_error_handler��set_exception_handler�����Ե������Ŀ������

25��PHP�����������Ǻܸ�Ч�ģ��ڽ��и�������ʱ����ʹ��

26��@�������ƴ����Ǻܺ����ܵģ���˾����ܵ��ҵ��������
MYSQL���֣�

1��SQL�����˫���ţ����е�ֵ���õ����ţ����硱INSERT INTO gril SET money=��{$iMaxMoney}��,age=��18�䡱

2����mysqli��չ����mysql��չ

2����mysqli_real_escape_string��mysqli_escape_string������sql����еı���

3����mysqli_set_charset(mysqli->set_charset)���� query ��SET NAMES��

4�����ϲ�ѯ(JOIN)֮ǰ�������¸�������������������ʵĻ�Ӧ�÷ֿ��飬�������л�����õ�ʱ��

5���ܶ�ط���Ҫ��¼����ʱ�䣬������ÿһ������Ҫ��ͬ��������ÿһ������Ҫһ��������������

6���ܶ�ʱ��Ϊinteger���ͼ���unsigned�Ǻܺõ�

7��INERT DELEYED��INSERT IGNORE��SELECT DISTINCT���������ͨ�������벻���ĺ�Ч��

8��varchar���Ͳ����ǲ��ܳ���255���ȣ����ǳ�����255������ֶξͲ��ܽ��������ˣ����ԣ������ʵ����Ҫ��

��ʱ���뵽��ô�࣬�����뵽�ļ���update�ɡ��뵽ʲôдʲô��û��ʲô�����ԣ��������ˣ������Щ�����е�ΰ��������Ҿ͸е��ǳ������ˡ�

���һ���ռ�������ǡ�����ͱ��˽����ܹ��������졢���󣡻�ӭ���ҽ���,������ı��������

#T=�ؼ��ʸ���
	function highlight($sString,$aWords){
	    if(!is_array($aWords) || empty($aWords) || !is_string($sString)){
	        return false;
	    }
	 
	    $sWords = implode('|',$aWords);
	    return preg_replace('@\b('.$sWords.')\b@si','<strong style="background-color:yellow">$1</strong>',$sString);
	}
#T=��ȡ���Feedburner���û�
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
#T=ѹ�����CSS�ļ�
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
#T=��ȡ����ַ
	function getTinyUrl($url){
	    return file_get_contents("http://tinyurl.com/api-create.php?url=".$url);
	}
#T=ȡ����������
function get_all_url($code){  
	preg_match_all('/<as+href=["|']?([^>"' ]+)["|']?s*[^>]*>([^>]+)</a>/i',$code,$arr);  //OSPHP.COm.CN 
	return array('name'=>$arr[2],'url'=>$arr[1]);  
}
#T=���·��ת���ɾ���·�� 
function relative_to_absolute($content,$feed_url){  
preg_match('/(http|https|ftp):///',$feed_url,$protocol);  
$server_url = preg_replace("/(http|https|ftp|news):///","",$feed_url); 
//��ԴOSPhP.COM.CN
$server_url = preg_replace("//.*/","",$server_url);  
    if($server_url == ''){  
        return $content;  
    } 
    if(isset($protocol[0])){ 
//��Դ����OSPhP.COm.CN
$new_content = preg_replace('/href="//','href="'.$protocol[0].$server_url.'/',$content);  
$new_content = preg_replace('/src="//','src="'.$protocol[0].$server_url.'/',$new_content);  //��ԴOSPhP.COM.CN 
    }else{  
$new_content = $content;  
    } 
    return $new_content;  
}
#T=HTML����ÿ��תΪCSV��ʽ���� 
function get_tr_array($table){
	//PHP��Դ����
	$table = preg_replace("'<td[^>]*?>'si",'"',$table); 
	$table = str_replace("</td>",'",',$table); 
	$table = str_replace("</tr>","{tr}",$table); //��Դ����OSPhP.COm.CN 
	//ȥ�� HTML ���  
	$table = preg_replace("'<[/!]*?[^<>]*?>'si","",$table); 
	//ȥ���հ��ַ�   
	$table = preg_replace("'([rn])[s]+'","",$table);
	//��Դ����OSPhP.COm.CN
	$table = str_replace(" ","",$table); 
	$table = str_replace(" ","",$table); 
	$table = explode(",{tr}",$table);
	//��Դ����OSPHP.COM.Cn
	array_pop($table); 
	return $table; 
}
#T=�����ַ����е����е���
//$distinct=true ȥ���ظ� 
function split_en_str($str,$distinct=true){ 
	preg_match_all('/([a-zA-Z]+)/',$str,$match);
	//��Դ����OSPHP.COM.Cn
	if($distinct == true){ 
	$match[1] = array_unique($match[1]); 
	}
	sort($match[1]); //OSPHP.COm.CN 
	return $match[1]; 
}
#T=�������Hello world!
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
#T=���˴���html��ǩ������
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
	$alltext = str_replace("��"," ",$alltext);
	$alltext = preg_replace("/&amp;([^;&amp;]*)(;|&amp;)/","",$alltext);
	$alltext = preg_replace("/[ ]+/s"," ",$alltext);
	$alltext	=	htmlspecialchars($alltext,ENT_QUOTES);
	return $alltext;
}
#T=php��ȡ���ݿ�-���xml��ʽ
function buildXml($sql,$filepath = ''){
    $xml = "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?><records>";
    $i = 0;
    $rs = mysql_query($sql); //��ȡ���ݿ���Դ
    $fp = fopen($filepath,'w+'); //��ȡ�ļ���Դ
    while($line = mysql_fetch_assoc($rs)) //��ȡһ��
   {
        $xml .= buildOneXmlNode($line);
        $i++;
        if($i > 0 && $i % 1000 == 0){ //Ϊ�˱���Ƶ����io�����Ч�ʣ�����������1000����¼Ϊ�ޣ�����һ�����档1000����¼���Ҫ��8M���ڴ档
            fwrite($fp,$xml);
            $xml = '';
            $i = 0;
        }
    }
    fwrite($fp,$xml . "</records>");//��Ҫ������һ�У�$xml ���ܻ���û�б�������ݡ����б�ǩҪ�պϡ�
    fclose($fp);
}
#T=��ָ�����ݿ�������б���Ϊһ��SQL�ļ�
<!?php  
  
/******   �������ݿ�ṹ ******/  
    
      /* 
      �������ƣ�table2sql() 
      �������ܣ��ѱ�Ľṹת����ΪSQL 
      ����������$table: Ҫ������ȡ�ı��� 
      �� �� ֵ��������ȡ��Ľ����SQL���� 
      �������ߣ�heiyeluren 
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
    
    
     /****** �������ݿ�ṹ���������� ******/  
      /* 
      �������ƣ�data2sql() 
      �������ܣ��ѱ�Ľṹ������ת����ΪSQL 
      ����������$table: Ҫ������ȡ�ı��� 
      �� �� ֵ��������ȡ��Ľ����SQL���� 
      �������ߣ�heiyeluren 
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
$host="localhost"; //������       
$user="root"; //MYSQL�û���       
$password="root"; //����       
$dbname="dedecmsv4"; //���ݵ����ݿ�       
     
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
$filename=date('Ymd')."_".$dbname.".sql"; //�ļ���Ϊ���������       
$fp = fopen($filename,'w');       
fputs($fp,$mysql);       
fclose($fp);       
echo "���ݱ��ݳɹ�,���ɱ����ļ�".$filename;       
?>  
#T=php����
<?php
define('CACHE_ROOT',dirname(__FILE__).'/cache'); //������Ŀ¼
define('CACHE_TIME',1800);//����ʱ�� ��λ��
define('CACHE_FIX','.html');
$CacheName=md5($_SERVER['REQUEST_URI']).CACHE_FIX; //�����ļ���
$CacheDir=CACHE_ROOT.'/'.substr($CacheName,0,1);//�����ļ����Ŀ¼
$CacheUrl=$CacheDir.'/'.$CacheName;//�����ļ�������·��
//GET��ʽ����Ż��棬POST֮��һ�㶼ϣ���������µĽ�� 
if($_SERVER['REQUEST_METHOD']=='GET'){
  //��������ļ����ڣ�����û�й��ڣ��Ͱ�����������
  if(file_exists($CacheName) && time()-filemtime($CacheName)<CACHE_TIME){ 
    $fp=fopen($CacheName,'rb'); 
    fpassthru($fp); 
    fclose($fp); 
    exit; 
  }
  //�ж��ļ����Ƿ���ڣ��������򴴽�
  elseif(!file_exists($CacheDir)){ 
    if(!file_exists(CACHE_ROOT)){ 
      mkdir(CACHE_ROOT,0777); 
      chmod(CACHE_ROOT,0777); 
    }
    mkdir($CacheDir,0777); 
    chmod($CacheDir,0777); 
  }
  //�ص����������������ʱ�Զ����ô˺��� 
  function AutoCache($contents){ 
    global $CacheUrl; 
    $fp=fopen($CacheUrl,'wb'); 
    fwrite($fp,$contents); 
    fclose($fp); 
    chmod($CacheUrl,0777); 
    //�����»����ͬʱ���Զ�ɾ�����е��ϻ���,�Խ�Լ�ռ�,�ɺ��ԡ� 
    //DelOldCache();
    return $contents;
  }
  function DelOldCache(){ 
    chdir(CACHE_ROOT); 
    foreach(glob("*/*".CACHE_FIX) as $file){ 
      if(time()-filemtime($file)>CACHE_TIME)unlink($file);
    }
  }
  //�ص����� auto_cache 
  ob_start('AutoCache');
}else{ 
  //����GET�������ɾ�������ļ��� 
  if(file_exists($CacheUrl))unlink($CacheUrl); 
}
?>
#T=PHP����ж����������
 <?php
 2  if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 8.0��)) 
 3   echo "Internet Explorer 8.0��; 
 4  else if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 7.0��)) 
 5   echo "Internet Explorer 7.0��; 
 6  else if(strpos($_SERVER["HTTP_USER_AGENT"],"MSIE 6.0��)) 
 7   echo "Internet Explorer 6.0��;
 8  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Firefox/3��))
 9   echo "Firefox 3��;
10  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Firefox/2��))
11   echo "Firefox 2��;
12  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Chrome"))
13   echo "Google Chrome";
14  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Safari"))
15   echo "Safari";
16  else if(strpos($_SERVER["HTTP_USER_AGENT"],"Opera"))
17   echo "Opera";
18  else echo $_SERVER["HTTP_USER_AGENT"]; 
19  ?>
#T=��ά��������
/**
 * @package     ��ά��������
 * @version     $Id: FunctionsMain.inc.php,v 1.32 2005/09/24 11:38:37 wwccss Exp $
 *
 *
 * Sort an two-dimension array by some level two items use array_multisort() function.
 *
 * sysSortArray($Array,&quot;Key1&quot;,&quot;SORT_ASC&quot;,&quot;SORT_RETULAR&quot;,&quot;Key2&quot;����)
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

#T=discuz���ܽ��ܺ���authcode
<?php
/**
* @param string $string ԭ�Ļ�������
* @param string $operation ����(ENCODE | DECODE),Ĭ��Ϊ DECODE
* @param string $key ��Կ
* @param int $expiry ������Ч��,����ʱ����Ч�� ��λ �룬0 Ϊ������Ч
* @return string ������ ԭ�Ļ��� ���� base64_encode ����������
*
* @example
*
*  $a = authcode('abc','ENCODE','key');
*  $b = authcode($a,'DECODE','key');  // $b(abc)
*
*  $a = authcode('abc','ENCODE','key',3600);
*  $b = authcode('abc','DECODE','key'); // ��һ��Сʱ�ڣ�$b(abc)������ $b Ϊ��
*/
function authcode($string,$operation = 'DECODE',$key = '',$expiry = 3600) 
{
  $ckey_length = 4;   
  // �����Կ���� ȡֵ 0-32;
  // ���������Կ���������������κι��ɣ�������ԭ�ĺ���Կ��ȫ��ͬ�����ܽ��Ҳ��ÿ�β�ͬ�������ƽ��Ѷȡ�
  // ȡֵԽ�����ı䶯����Խ�����ı仯 = 16 �� $ckey_length �η�
  // ����ֵΪ 0 ʱ���򲻲��������Կ

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
#T=PHP��ȡIP��������������ȡIP���ڵ�ַ
<?php
//��ȡ��������ߵ�ip����ϸ��Ϣ
$top = 10;
//��ȡip����ϸ��Ϣ
$get_location = true;
//����ip,���ڻ�ȡ֩��,�������ٶȽ���
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
//1��������/2������ip/3���Է�ip
/**
 * �˿�/ip��Ψһ��
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
			echo "\r\n��������",$times,' - ',$key;
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
#T=php����ת��json��ʽ
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

#T=���׽�����������PHP�����ļ����е�������������
$ua = $_SERVER["HTTP_USER_AGENT"];

$filename = "���� �ļ���.txt";
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
#T=�������ռ�������
	function age($date){
	    $year_diff = '';
	    $time = strtotime($date);
	    if(FALSE === $time){
	        return '';
	    }
	 
	    $date = date('Y-m-d',$time);
	    list($year,$month,$day) = explode("-",$date);
	    $year_diff = date("Y") �C $year;
	    $month_diff = date("m") �C $month;
	    $day_diff = date("d") �C $day;
	    if($day_diff < 0 || $month_diff < 0) $year_diff�C;
	 
	    return $year_diff;
	}
#T=PHP��ά��ģʽ
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
#T=��config.php�ļ��Ķ�ȡ���޸�
<?php
    $name="admin";//kkkk
    $bb='234';
    $db=4561321;
    $kkk="admin";
?> 
<?php
//�����ļ�����ֵ��ȡ��
//Ĭ��û�е���������ʱ�������ַ�����ȡ��ȡ''�л�""�е�����
//����е���������ʱΪintʱ��������int����
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
 
//�����ļ����������
//Ĭ��û�е��ĸ�����ʱ�������ַ�����ȡ��ȡ''�л�""�е�����
//����е��ĸ�����ʱΪintʱ��������int����
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
#T=����������������������
#T=usleep()		//�����ӳٴ���ִ������΢�롣
usleep()		//�����ӳٴ���ִ������΢�롣
#T=unpack()		//�����Ӷ������ַ��������ݽ��н����
unpack()		//�����Ӷ������ַ��������ݽ��н����
#T=uniqid()		//����������΢��Ƶĵ�ǰʱ�䣬����һ��Ψһ�� ID��
uniqid()		//����������΢��Ƶĵ�ǰʱ�䣬����һ��Ψһ�� ID��
#T=time_sleep_until() //�����ӳٴ���ִ��ֱ��ָ����ʱ�䡣
time_sleep_until() //�����ӳٴ���ִ��ֱ��ָ����ʱ�䡣
#T=time_nanosleep() //�����ӳٴ���ִ������������롣
time_nanosleep() //�����ӳٴ���ִ������������롣
#T=sleep() //�����ӳٴ���ִ�������롣
sleep() //�����ӳٴ���ִ�������롣
#T=show_source() //�������ļ������﷨������ʾ��
show_source() //�������ļ������﷨������ʾ��
#T=strip_whitespace() //����������ɾ�� PHP ע���Լ��հ��ַ���Դ�����ļ���
strip_whitespace() //����������ɾ�� PHP ע���Լ��հ��ַ���Դ�����ļ���
#T=pack() //����������װ��һ���������ַ�����
pack() //����������װ��һ���������ַ�����
#T=ignore_user_abort() //����������ͻ����Ͽ��Ƿ����ֹ�ű���ִ�С�
ignore_user_abort() //����������ͻ����Ͽ��Ƿ����ֹ�ű���ִ�С�
#T=highlight_string() //�������ַ��������﷨������ʾ��
highlight_string() //�������ַ��������﷨������ʾ��
#T=highlight_file() //�������ļ������﷨������ʾ��
highlight_file() //�������ļ������﷨������ʾ��
#T=get_browser() //���������û�����������ܡ�
get_browser() //���������û�����������ܡ�
#T=exit()		//�������һ����Ϣ�����˳���ǰ�ű���
exit()		//�������һ����Ϣ�����˳���ǰ�ű���
#T=eval()		//�������ַ������� PHP ���������㡣
eval()		//�������ַ������� PHP ���������㡣
#T=die()		//�������һ����Ϣ�����˳���ǰ�ű���
die()		//�������һ����Ϣ�����˳���ǰ�ű���
#T=defined()	//�������ĳ�����Ƿ���ڡ�
defined()	//�������ĳ�����Ƿ���ڡ�
#T=define()		//��������һ��������
define()		//��������һ��������
#T=constant()	//�������س�����ֵ��
constant()	//�������س�����ֵ��
#T=connection_status() //�������ص�ǰ������״̬��
connection_status() //�������ص�ǰ������״̬��
#T=connection_aborted() //��������Ƿ�Ͽ��ͻ�����
connection_aborted() //��������Ƿ�Ͽ��ͻ�����
#T=zip_read() //������ȡ�򿪵� zip �����е���һ���ļ���
zip_read() //������ȡ�򿪵� zip �����е���һ���ļ���
#T=zip_open() //������ ZIP �ļ��Թ���ȡ��
zip_open() //������ ZIP �ļ��Թ���ȡ��
#T=zip_entry_read() //�����Ӵ򿪵� zip ������Ŀ�л�ȡ���ݡ�
zip_entry_read() //�����Ӵ򿪵� zip ������Ŀ�л�ȡ���ݡ�
#T=zip_entry_open() //������һ�� ZIP ������Ŀ�Թ���ȡ��
zip_entry_open() //������һ�� ZIP ������Ŀ�Թ���ȡ��
#T=zip_entry_name() //�������� zip ������Ŀ�����ơ�
zip_entry_name() //�������� zip ������Ŀ�����ơ�
#T=zip_entry_filesize() //�������� zip ������Ŀ��ԭʼ��С����ѹ��֮ǰ����
zip_entry_filesize() //�������� zip ������Ŀ��ԭʼ��С����ѹ��֮ǰ����
#T=zip_entry_compressionmethod() //�������� zip ������Ŀ��ѹ��������
zip_entry_compressionmethod() //�������� zip ������Ŀ��ѹ��������
#T=zip_entry_compressedsize() //�������� zip ������Ŀ��ѹ���ļ��ߴ硣
zip_entry_compressedsize() //�������� zip ������Ŀ��ѹ���ļ��ߴ硣
#T=zip_entry_close() //�����ر��� zip_entry_open() �����򿪵� zip �����ļ���
zip_entry_close() //�����ر��� zip_entry_open() �����򿪵� zip �����ļ���
#T=zip_close() //�����ر��� zip_open() �����򿪵� zip �����ļ���
zip_close() //�����ر��� zip_open() �����򿪵� zip �����ļ���
#T=xml_set_unparsed_entity_decl_handler() //�����涨�������޷�������ʵ�����ƣ�NDATA������ʱ�����õĺ�����
xml_set_unparsed_entity_decl_handler() //�����涨�������޷�������ʵ�����ƣ�NDATA������ʱ�����õĺ�����
#T=xml_set_processing_instruction_handler() //�����涨���������� XML �ĵ����ҵ�����ָ��ʱ�����õĺ�����
xml_set_processing_instruction_handler() //�����涨���������� XML �ĵ����ҵ�����ָ��ʱ�����õĺ�����
#T=xml_set_object() //���������ڶ�����ʹ�� XML ��������
xml_set_object() //���������ڶ�����ʹ�� XML ��������
#T=xml_set_notation_decl_handler() //�����涨���������� XML �ĵ����ҵ���������ʱ�����õĺ�����
xml_set_notation_decl_handler() //�����涨���������� XML �ĵ����ҵ���������ʱ�����õĺ�����
#T=xml_set_external_entity_ref_handler() //�����涨���������� XML �ĵ����ҵ��ⲿʵ��ʱ�����õĺ�����
xml_set_external_entity_ref_handler() //�����涨���������� XML �ĵ����ҵ��ⲿʵ��ʱ�����õĺ�����
#T=xml_set_element_handler() //����������ʼ����ֹԪ�ش�������
xml_set_element_handler() //����������ʼ����ֹԪ�ش�������
#T=xml_set_default_handler() //����Ϊ XML ����������Ĭ�ϵ����ݴ�������
xml_set_default_handler() //����Ϊ XML ����������Ĭ�ϵ����ݴ�������
#T=xml_set_character_data_handler() //���������ַ����ݴ�������
xml_set_character_data_handler() //���������ַ����ݴ�������
#T=xml_parser_set_option() //����Ϊ XML ����������ѡ�����á�
xml_parser_set_option() //����Ϊ XML ����������ѡ�����á�
#T=xml_parser_get_option() //������ XML ��������ȡѡ��������Ϣ��
xml_parser_get_option() //������ XML ��������ȡѡ��������Ϣ��
#T=xml_parser_free() //�����ͷ� XML ��������
xml_parser_free() //�����ͷ� XML ��������
#T=xml_parser_create() //�������� XML ��������
xml_parser_create() //�������� XML ��������
#T=xml_parser_create_ns() //�����������������ռ�֧�ֵ� XML ��������
xml_parser_create_ns() //�����������������ռ�֧�ֵ� XML ��������
#T=xml_parse_into_struct() //������ XML ���ݽ����������С�
xml_parse_into_struct() //������ XML ���ݽ����������С�
#T=xml_parse() //�������� XML �ĵ���
xml_parse() //�������� XML �ĵ���
#T=xml_get_error_code() //������ȡ XML ������������롣
xml_get_error_code() //������ȡ XML ������������롣
#T=xml_get_current_line_number() //������ȡ XML �������ĵ�ǰ�кš�
xml_get_current_line_number() //������ȡ XML �������ĵ�ǰ�кš�
#T=xml_get_current_column_number() //������ȡ XML �������ĵ�ǰ�кš�
xml_get_current_column_number() //������ȡ XML �������ĵ�ǰ�кš�
#T=xml_get_current_byte_index() //������ȡ XML �������ĵ�ǰ�ֽ�������
xml_get_current_byte_index() //������ȡ XML �������ĵ�ǰ�ֽ�������
#T=xml_error_string() //������ȡ XML �������Ĵ���������
xml_error_string() //������ȡ XML �������Ĵ���������
#T=utf8_encode() //������ ISO-8859-1 �ַ�������Ϊ UTF-8��
utf8_encode() //������ ISO-8859-1 �ַ�������Ϊ UTF-8��
#T=utf8_decode() //������ UTF-8 �ַ�������Ϊ ISO-8859-1��
utf8_decode() //������ UTF-8 �ַ�������Ϊ ISO-8859-1��
#T=wordwrap() //��������ָ�����ȶ��ַ����������д���
wordwrap() //��������ָ�����ȶ��ַ����������д���
#T=vsprintf() //�����Ѹ�ʽ���ַ���д������С�
vsprintf() //�����Ѹ�ʽ���ַ���д������С�
#T=vprintf() //���������ʽ�����ַ�����
vprintf() //���������ʽ�����ַ�����
#T=vfprintf() //�����Ѹ�ʽ�����ַ���д��ָ�����������
vfprintf() //�����Ѹ�ʽ�����ַ���д��ָ�����������
#T=ucwords() //�������ַ�����ÿ�����ʵ����ַ�ת��Ϊ��д��
ucwords() //�������ַ�����ÿ�����ʵ����ַ�ת��Ϊ��д��
#T=ucfirst() //�������ַ����е����ַ�ת��Ϊ��д��
ucfirst() //�������ַ����е����ַ�ת��Ϊ��д��
#T=trim() //�������ַ���������ɾ���հ��ַ�������Ԥ�����ַ���
trim() //�������ַ���������ɾ���հ��ַ�������Ԥ�����ַ���
#T=substr_replace() //�������ַ�����һ�����滻Ϊ��һ���ַ�����
substr_replace() //�������ַ�����һ�����滻Ϊ��һ���ַ�����
#T=substr_count() //���������Ӵ����ַ����г��ֵĴ�����
substr_count() //���������Ӵ����ַ����г��ֵĴ�����
#T=substr_compare() //������ָ���Ŀ�ʼ���ȱȽ������ַ�����
substr_compare() //������ָ���Ŀ�ʼ���ȱȽ������ַ�����
#T=substr() //���������ַ�����һ���֡�
substr() //���������ַ�����һ���֡�
#T=strtr() //����ת���ַ������ض����ַ���
strtr() //����ת���ַ������ض����ַ���
#T=strtoupper() //�������ַ���ת��Ϊ��д��
strtoupper() //�������ַ���ת��Ϊ��д��
#T=strtolower() //�������ַ���ת��ΪСд��
strtolower() //�������ַ���ת��ΪСд��
#T=strtok() //�������ַ����ָ�Ϊ��С���ַ�����
strtok() //�������ַ����ָ�Ϊ��С���ַ�����
#T=strstr() //��������һ���ַ�������һ���ַ����еĵ�һ�γ��֡�
strstr() //��������һ���ַ�������һ���ַ����еĵ�һ�γ��֡�
#T=strspn() //�����������ַ����а������ض��ַ�����Ŀ��
strspn() //�����������ַ����а������ض��ַ�����Ŀ��
#T=strrpos() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�á�
strrpos() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�á�
#T=strripos() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�á�
strripos() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�á�
#T=strrev() //������ת�ַ�����
strrev() //������ת�ַ�����
#T=strrchr() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�ã������شӸ�λ�õ��ַ�����β�������ַ���
strrchr() //���������ַ�������һ���ַ��������һ�γ��ֵ�λ�ã������شӸ�λ�õ��ַ�����β�������ַ���
#T=strpos() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
strpos() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
#T=strpbrk() //�������ַ���������ָ���ַ��е�����һ����
strpbrk() //�������ַ���������ָ���ַ��е�����һ����
#T=strncmp() //�����Ƚ������ַ�����
strncmp() //�����Ƚ������ַ�����
#T=strncasecmp() //�����Ƚ������ַ�����
strncasecmp() //�����Ƚ������ַ�����
#T=strnatcmp() //����ʹ��һ�֡���Ȼ���㷨���Ƚ������ַ�����
strnatcmp() //����ʹ��һ�֡���Ȼ���㷨���Ƚ������ַ�����
#T=strnatcasecmp() //����ʹ��һ�֡���Ȼ���㷨���Ƚ������ַ�����
strnatcasecmp() //����ʹ��һ�֡���Ȼ���㷨���Ƚ������ַ�����
#T=strlen() //���������ַ����ĳ��ȡ�
strlen() //���������ַ����ĳ��ȡ�
#T=stristr() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
stristr() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
#T=stripos() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
stripos() //���������ַ�������һ���ַ����е�һ�γ��ֵ�λ�á�
#T=stripslashes() //����ɾ���� addslashes() ������ӵķ�б�ܡ�
stripslashes() //����ɾ���� addslashes() ������ӵķ�б�ܡ�
#T=stripcslashes() //����ɾ���� addcslashes() ������ӵķ�б�ܡ�
stripcslashes() //����ɾ���� addcslashes() ������ӵķ�б�ܡ�
#T=strip_tags() //������ȥ HTML��XML �Լ� PHP �ı�ǩ��
strip_tags() //������ȥ HTML��XML �Լ� PHP �ı�ǩ��
#T=strcspn() //�����������ҵ��κ�ָ�����ַ�֮ǰ�����ַ������ҵ��ַ�����
strcspn() //�����������ҵ��κ�ָ�����ַ�֮ǰ�����ַ������ҵ��ַ�����
#T=strcoll() //�����Ƚ������ַ�����
strcoll() //�����Ƚ������ַ�����
#T=strcmp() //�����Ƚ������ַ�����
strcmp() //�����Ƚ������ַ�����
#T=strchr() //��������һ���ַ�������һ���ַ����еĵ�һ�γ��֡�
strchr() //��������һ���ַ�������һ���ַ����еĵ�һ�γ��֡�
#T=strcasecmp() //�����Ƚ������ַ�����
strcasecmp() //�����Ƚ������ַ�����
#T=str_word_count() //���������ַ����еĵ�������
str_word_count() //���������ַ����еĵ�������
#T=str_split() //�������ַ����ָ�����С�
str_split() //�������ַ����ָ�����С�
#T=str_shuffle() //��������ش����ַ����е������ַ���
str_shuffle() //��������ش����ַ����е������ַ���
#T=str_rot13() //�������ַ���ִ�� ROT13 ���롣
str_rot13() //�������ַ���ִ�� ROT13 ���롣
#T=str_replace() //����ʹ��һ���ַ����滻�ַ����е���һЩ�ַ���
str_replace() //����ʹ��һ���ַ����滻�ַ����е���һЩ�ַ���
#T=str_repeat() //�������ַ����ظ�ָ���Ĵ�����
str_repeat() //�������ַ����ظ�ָ���Ĵ�����
#T=str_pad() //�������ַ������Ϊָ���ĳ��ȡ�
str_pad() //�������ַ������Ϊָ���ĳ��ȡ�
#T=str_ireplace() //����ʹ��һ���ַ����滻�ַ����е���һЩ�ַ���
str_ireplace() //����ʹ��һ���ַ����滻�ַ����е���һЩ�ַ���
#T=sscanf() //��������ָ���ĸ�ʽ��������һ���ַ��������롣
sscanf() //��������ָ���ĸ�ʽ��������һ���ַ��������롣
#T=sprintf() //�����Ѹ�ʽ�����ַ���дд��һ�������С�
sprintf() //�����Ѹ�ʽ�����ַ���дд��һ�������С�
#T=soundex() //���������ַ����� soundex ����
soundex() //���������ַ����� soundex ����
#T=similar_text() //�������������ַ�����ƥ���ַ�����Ŀ��
similar_text() //�������������ַ�����ƥ���ַ�����Ŀ��
#T=sha1_file() //���������ļ��� SHA-1 ɢ�С�
sha1_file() //���������ļ��� SHA-1 ɢ�С�
#T=sha1() //���������ַ����� SHA-1 ɢ�С�
sha1() //���������ַ����� SHA-1 ɢ�С�
#T=setlocale() //�������õ�����Ϣ��������Ϣ����
setlocale() //�������õ�����Ϣ��������Ϣ����
#T=rtrim() //P rtrim() ����
rtrim() //P rtrim() ����
#T=quotemeta() //�������ַ�����ĳЩԤ������ַ�ǰ��ӷ�б�ܡ�
quotemeta() //�������ַ�����ĳЩԤ������ַ�ǰ��ӷ�б�ܡ�
#T=quoted_printable_decode() //�����Ծ��� quoted-printable �������ַ������н��룬���� 8 λ���ַ�����
quoted_printable_decode() //�����Ծ��� quoted-printable �������ַ������н��룬���� 8 λ���ַ�����
#T=printf() //���������ʽ�����ַ�����
printf() //���������ʽ�����ַ�����
#T=print() //�������һ�������ַ�����
print() //�������һ�������ַ�����
#T=parse_str() //�����Ѳ�ѯ�ַ��������������С�
parse_str() //�����Ѳ�ѯ�ַ��������������С�
#T=ord() //���������ַ�����һ���ַ��� ASCII ֵ��
ord() //���������ַ�����һ���ַ��� ASCII ֵ��
#T=number_format() //����ͨ��ǧλ��������ʽ�����֡�
number_format() //����ͨ��ǧλ��������ʽ�����֡�
#T=nl2br() //�������ַ����е�ÿ������(\n) ֮ǰ���� HTML ���з�(<br />)��
nl2br() //�������ַ����е�ÿ������(\n) ֮ǰ���� HTML ���з�(<br />)��
#T=nl_langinfo() //��������ָ���ı�����Ϣ��
nl_langinfo() //��������ָ���ı�����Ϣ��
#T=money_format() //�������ַ�����ʽ��Ϊ�����ַ�����
money_format() //�������ַ�����ʽ��Ϊ�����ַ�����
#T=metaphone() //���������ַ����� metaphone ����
metaphone() //���������ַ����� metaphone ����
#T=md5_file() //���������ļ��� MD5 ɢ�С�
md5_file() //���������ļ��� MD5 ɢ�С�
#T=md5() //���������ַ����� MD5 ɢ�С�
md5() //���������ַ����� MD5 ɢ�С�
#T=ltrim() //�������ַ������ɾ���ո������Ԥ�����ַ���
ltrim() //�������ַ������ɾ���ո������Ԥ�����ַ���
#T=localeconv() //�������ذ����������ּ�������Ϣ��ʽ�����顣
localeconv() //�������ذ����������ּ�������Ϣ��ʽ�����顣
#T=levenshtein() //�������������ַ���֮��� Levenshtein ���롣
levenshtein() //�������������ַ���֮��� Levenshtein ���롣
#T=join() //����������Ԫ�����Ϊһ���ַ�����
join() //����������Ԫ�����Ϊһ���ַ�����
#T=implode() //����������Ԫ�����Ϊһ���ַ�����
implode() //����������Ԫ�����Ϊһ���ַ�����
#T=htmlspecialchars() //������һЩԤ������ַ�ת��Ϊ HTML ʵ�塣
htmlspecialchars() //������һЩԤ������ַ�ת��Ϊ HTML ʵ�塣
#T=htmlentities() //�������ַ�ת��Ϊ HTML ʵ�塣
htmlentities() //�������ַ�ת��Ϊ HTML ʵ�塣
#T=html_entity_decode() //������ HTML ʵ��ת��Ϊ�ַ���
html_entity_decode() //������ HTML ʵ��ת��Ϊ�ַ���
#T=hebrevc() //������ϣ�����ı������������ת��Ϊ�����ҵ�������Ҳ�������(\n) ת��Ϊ <br />��
hebrevc() //������ϣ�����ı������������ת��Ϊ�����ҵ�������Ҳ�������(\n) ת��Ϊ <br />��
#T=hebrev() //������ϣ�����ı������������ת��Ϊ�����ҵ�����
hebrev() //������ϣ�����ı������������ת��Ϊ�����ҵ�����
#T=get_html_translation_table() //�������ر� htmlentities() �� htmlspecialchars() ����ʹ�õķ����
get_html_translation_table() //�������ر� htmlentities() �� htmlspecialchars() ����ʹ�õķ����
#T=fprintf() //�����Ѹ�ʽ�����ַ���д��ָ��������������磺�ļ������ݿ⣩��
fprintf() //�����Ѹ�ʽ�����ַ���д��ָ��������������磺�ļ������ݿ⣩��
#T=explode() //�������ַ����ָ�Ϊ���顣
explode() //�������ַ����ָ�Ϊ���顣
#T=echo() //�������һ�������ַ�����
echo() //�������һ�������ַ�����
#T=crypt() //��������ʹ�� DES��Blowfish �� MD5 ���ܵ��ַ�����
crypt() //��������ʹ�� DES��Blowfish �� MD5 ���ܵ��ַ�����
#T=crc32() //��������һ���ַ����� crc32 ����ʽ��
crc32() //��������һ���ַ����� crc32 ����ʽ��
#T=count_chars() //���������ַ��������ַ�����Ϣ��
count_chars() //���������ַ��������ַ�����Ϣ��
#T=convert_uuencode() //����ʹ�� uuencode �㷨���ַ������б��롣
convert_uuencode() //����ʹ�� uuencode �㷨���ַ������б��롣
#T=convert_uudecode() //������ uuencode ������ַ������н��롣
convert_uudecode() //������ uuencode ������ַ������н��롣
#T=convert_cyr_string() //�������ַ���һ�� Cyrillic �ַ�ת������һ�֡�
convert_cyr_string() //�������ַ���һ�� Cyrillic �ַ�ת������һ�֡�
#T=chunk_split() //�������ַ����ָ�Ϊһ������С�Ĳ��֡�
chunk_split() //�������ַ����ָ�Ϊһ������С�Ĳ��֡�
#T=chr() //������ָ���� ASCII ֵ�����ַ���
chr() //������ָ���� ASCII ֵ�����ַ���
#T=chop() //�������ַ�����ĩ�˿�ʼɾ���հ��ַ�������Ԥ�����ַ���
chop() //�������ַ�����ĩ�˿�ʼɾ���հ��ַ�������Ԥ�����ַ���
#T=bin2hex() //������ ASCII �ַ����ַ���ת��Ϊʮ������ֵ��
bin2hex() //������ ASCII �ַ����ַ���ת��Ϊʮ������ֵ��
#T=addslashes() //������ָ����Ԥ�����ַ�ǰ��ӷ�б�ܡ�
addslashes() //������ָ����Ԥ�����ַ�ǰ��ӷ�б�ܡ�
#T=addcslashes() //������ָ�����ַ�ǰ��ӷ�б�ܡ�
addcslashes() //������ָ�����ַ�ǰ��ӷ�б�ܡ�
#T=xpath() //�������ж� XML �ĵ��� XPath ��ѯ��
xpath() //�������ж� XML �ĵ��� XPath ��ѯ��
#T=simplexml_load_string() //������ XML �ַ�����������С�
simplexml_load_string() //������ XML �ַ�����������С�
#T=simplexml_load_file() //������ XML �ĵ���������С�
simplexml_load_file() //������ XML �ĵ���������С�
#T=simplexml_import_dom() //������ DOM �ڵ�ת��Ϊ SimpleXMLElement ����
simplexml_import_dom() //������ DOM �ڵ�ת��Ϊ SimpleXMLElement ����
#T=registerXPathNamespace() //����Ϊ��һ�� XPath ��ѯ���������ռ��ﾳ��
registerXPathNamespace() //����Ϊ��һ�� XPath ��ѯ���������ռ��ﾳ��
#T=getNamespace() //������ȡ�� XML �ĵ���ʹ�õ������ռ䡣
getNamespace() //������ȡ�� XML �ĵ���ʹ�õ������ռ䡣
#T=getName() //������ SimpleXMLElement �����ȡ XML Ԫ�ص����ơ�
getName() //������ SimpleXMLElement �����ȡ XML Ԫ�ص����ơ�
#T=getDocNamespaces() //������ SimpleXMLElement ���󷵻��� XML �ĵ��������������ռ䡣
getDocNamespaces() //������ SimpleXMLElement ���󷵻��� XML �ĵ��������������ռ䡣
#T=children() //������ȡָ���ڵ���ӽڵ㡣
children() //������ȡָ���ڵ���ӽڵ㡣
#T=attributes() //������ȡ SimpleXML Ԫ�ص����ԡ�
attributes() //������ȡ SimpleXML Ԫ�ص����ԡ�
#T=asXML() //�������ַ�������ʽ�� SimpleXMLElement ���󷵻� XML �ĵ���
asXML() //�������ַ�������ʽ�� SimpleXMLElement ���󷵻� XML �ĵ���
#T=addChild() //������ָ���� XML �ڵ����һ���ӽڵ㡣
addChild() //������ָ���� XML �ڵ����һ���ӽڵ㡣
#T=addAttribute() //������ SimpleXML Ԫ�����һ�����ԡ�
addAttribute() //������ SimpleXML Ԫ�����һ�����ԡ�
#T=__construct() //��������һ���µ� SimpleXMLElement ����
__construct() //��������һ���µ� SimpleXMLElement ����
#T=mysql_unbuffered_query() //������ MySQL ����һ�� SQL ��ѯ������ȡ / ����������
mysql_unbuffered_query() //������ MySQL ����һ�� SQL ��ѯ������ȡ / ����������
#T=mysql_thread_id() //�������ص�ǰ�̵߳� ID��
mysql_thread_id() //�������ص�ǰ�̵߳� ID��
#T=mysql_stat() //�������� MySQL �������ĵ�ǰϵͳ״̬��
mysql_stat() //�������� MySQL �������ĵ�ǰϵͳ״̬��
#T=mysql_select_db() //�������û�� MySQL ���ݿ⡣
mysql_select_db() //�������û�� MySQL ���ݿ⡣
#T=mysql_result() //�������ؽ������һ���ֶε�ֵ��
mysql_result() //�������ؽ������һ���ֶε�ֵ��
#T=mysql_real_escape_string() //����ת�� SQL �����ʹ�õ��ַ����е������ַ���
mysql_real_escape_string() //����ת�� SQL �����ʹ�õ��ַ����е������ַ���
#T=mysql_query() //����ִ��һ�� MySQL ��ѯ��
mysql_query() //����ִ��һ�� MySQL ��ѯ��
#T=mysql_ping() //���� Ping һ�����������ӣ����û���������������ӡ�
mysql_ping() //���� Ping һ�����������ӣ����û���������������ӡ�
#T=mysql_pconnect() //������һ���� MySQL �������ĳ־����ӡ�
mysql_pconnect() //������һ���� MySQL �������ĳ־����ӡ�
#T=mysql_num_rows() //�������ؽ�������е���Ŀ��
mysql_num_rows() //�������ؽ�������е���Ŀ��
#T=mysql_num_fields() //�������ؽ�������ֶε�����
mysql_num_fields() //�������ؽ�������ֶε�����
#T=mysql_list_processes() //�����г� MySQL ���̡�
mysql_list_processes() //�����г� MySQL ���̡�
#T=mysql_list_dbs() //�����г� MySQL �����������е����ݿ⡣
mysql_list_dbs() //�����г� MySQL �����������е����ݿ⡣
#T=mysql_insert_id() //����������һ�� INSERT ���������� ID��
mysql_insert_id() //����������һ�� INSERT ���������� ID��
#T=mysql_info() //�����������һ����ѯ����Ϣ��
mysql_info() //�����������һ����ѯ����Ϣ��
#T=mysql_get_server_info() //�������� MySQL ����������Ϣ��
mysql_get_server_info() //�������� MySQL ����������Ϣ��
#T=mysql_get_proto_info() //�������� MySQL Э�����Ϣ��
mysql_get_proto_info() //�������� MySQL Э�����Ϣ��
#T=mysql_get_host_info() //�������� MySQL ��������Ϣ��
mysql_get_host_info() //�������� MySQL ��������Ϣ��
#T=mysql_get_client_info() //�������� MySQL �ͻ�����Ϣ��
mysql_get_client_info() //�������� MySQL �ͻ�����Ϣ��
#T=mysql_free_result() //�����ͷŽ���ڴ档
mysql_free_result() //�����ͷŽ���ڴ档
#T=mysql_field_type() //�������ؽ������ָ���ֶε����͡�
mysql_field_type() //�������ؽ������ָ���ֶε����͡�
#T=mysql_field_table() //��������ָ���ֶ����ڵı�����
mysql_field_table() //��������ָ���ֶ����ڵı�����
#T=mysql_field_seek() //������������е�ָ���趨Ϊָ�����ֶ�ƫ������
mysql_field_seek() //������������е�ָ���趨Ϊָ�����ֶ�ƫ������
#T=mysql_field_name() //����ȡ�ý����ָ���ֶε��ֶ�����
mysql_field_name() //����ȡ�ý����ָ���ֶε��ֶ�����
#T=mysql_field_len() //��������ָ���ֶεĳ��ȡ�
mysql_field_len() //��������ָ���ֶεĳ��ȡ�
#T=mysql_field_flags() //�����ӽ����ȡ�ú�ָ���ֶι����ı�־��
mysql_field_flags() //�����ӽ����ȡ�ú�ָ���ֶι����ı�־��
#T=mysql_fetch_row() //�����ӽ������ȡ��һ����Ϊ�������顣
mysql_fetch_row() //�����ӽ������ȡ��һ����Ϊ�������顣
#T=mysql_fetch_object() //�����ӽ��������¼������ȡ��һ����Ϊ����
mysql_fetch_object() //�����ӽ��������¼������ȡ��һ����Ϊ����
#T=mysql_fetch_lengths() //����ȡ��һ����ÿ���ֶε����ݵĳ��ȡ�
mysql_fetch_lengths() //����ȡ��һ����ÿ���ֶε����ݵĳ��ȡ�
#T=mysql_fetch_field() //�����ӽ������ȡ������Ϣ����Ϊ���󷵻ء�
mysql_fetch_field() //�����ӽ������ȡ������Ϣ����Ϊ���󷵻ء�
#T=mysql_fetch_assoc() //�����ӽ������ȡ��һ����Ϊ�������顣
mysql_fetch_assoc() //�����ӽ������ȡ��һ����Ϊ�������顣
#T=mysql_fetch_array() //�����ӽ������ȡ��һ����Ϊ�������飬���������飬����߼���
mysql_fetch_array() //�����ӽ������ȡ��һ����Ϊ�������飬���������飬����߼���
#T=mysql_error() //����������һ�� MySQL �����������ı�������Ϣ��
mysql_error() //����������һ�� MySQL �����������ı�������Ϣ��
#T=mysql_errno() //����������һ�� MySQL �����еĴ�����Ϣ�����ֱ��롣
mysql_errno() //����������һ�� MySQL �����еĴ�����Ϣ�����ֱ��롣
#T=mysql_db_name() //����ȡ�� mysql_list_dbs() ���������ص����ݿ�����
mysql_db_name() //����ȡ�� mysql_list_dbs() ���������ص����ݿ�����
#T=mysql_data_seek() //�����ƶ��ڲ������ָ�롣
mysql_data_seek() //�����ƶ��ڲ������ָ�롣
#T=mysql_connect() //�����򿪷ǳ־õ� MySQL ���ӡ�
mysql_connect() //�����򿪷ǳ־õ� MySQL ���ӡ�
#T=mysql_close() //�����رշǳ־õ� MySQL ���ӡ�
mysql_close() //�����رշǳ־õ� MySQL ���ӡ�
#T=mysql_client_encoding() //�������ص�ǰ���ӵ��ַ��������ơ�
mysql_client_encoding() //�������ص�ǰ���ӵ��ַ��������ơ�
#T=mysql_affected_rows() //��������ǰһ�� MySQL ������Ӱ��ļ�¼������
mysql_affected_rows() //��������ǰһ�� MySQL ������Ӱ��ļ�¼������
#T=tanh() //��������˫�����С�
tanh() //��������˫�����С�
#T=tan() //�����������С�
tan() //�����������С�
#T=srand() //����������������������ӡ�
srand() //����������������������ӡ�
#T=sqrt() //��������һ������ƽ������
sqrt() //��������һ������ƽ������
#T=sinh() //��������һ������˫�����ҡ�
sinh() //��������һ������˫�����ҡ�
#T=sin() //��������һ���������ҡ�
sin() //��������һ���������ҡ�
#T=round() //�����Ը����������������롣
round() //�����Ը����������������롣
#T=rand() //�����������������
rand() //�����������������
#T=rad2deg() //�����ѻ�����ת��Ϊ�Ƕ�����
rad2deg() //�����ѻ�����ת��Ϊ�Ƕ�����
#T=pow() //�������� x �� y �η���
pow() //�������� x �� y �η���
#T=pi() //��������Բ���ʵ�ֵ��
pi() //��������Բ���ʵ�ֵ��
#T=octdec() //�����Ѱ˽���ת��Ϊʮ���ơ�
octdec() //�����Ѱ˽���ת��Ϊʮ���ơ�
#T=mt_srand() //���� Mersenne Twister �������������
mt_srand() //���� Mersenne Twister �������������
#T=mt_rand() //ʹ�� Mersenne Twister �㷨�������������
mt_rand() //ʹ�� Mersenne Twister �㷨�������������
#T=mt_getrandmax() //��ʾ�������������ֵ��
mt_getrandmax() //��ʾ�������������ֵ��
#T=min() //������Сֵ��
min() //������Сֵ��
#T=max() //�������ֵ��
max() //�������ֵ��
#T=log1p() //�Է��� log(1 + x)�������� x ��ֵ�ӽ���Ҳ�ܼ����׼ȷ�����
log1p() //�Է��� log(1 + x)�������� x ��ֵ�ӽ���Ҳ�ܼ����׼ȷ�����
#T=log10() //�� 10 Ϊ�׵Ķ�����
log10() //�� 10 Ϊ�׵Ķ�����
#T=log() //������Ȼ������
log() //������Ȼ������
#T=lcg_value() //�������ͬ�෢������
lcg_value() //�������ͬ�෢������
#T=is_nan() //�ж��Ƿ�Ϊ�Ϸ���ֵ��
is_nan() //�ж��Ƿ�Ϊ�Ϸ���ֵ��
#T=is_infinite() //�ж��Ƿ�Ϊ����ֵ��
is_infinite() //�ж��Ƿ�Ϊ����ֵ��
#T=is_finite() //�����ж��Ƿ�Ϊ����ֵ��
is_finite() //�����ж��Ƿ�Ϊ����ֵ��
#T=hypot() //��������һֱ�������ε�б�߳��ȡ�
hypot() //��������һֱ�������ε�б�߳��ȡ�
#T=hexdec() //������ʮ������ת��Ϊʮ���ơ�
hexdec() //������ʮ������ת��Ϊʮ���ơ�
#T=fmod() //������ʾ��������Ŀ���ֵ��
fmod() //������ʾ��������Ŀ���ֵ��
#T=fmod() //�������س����ĸ�����������
fmod() //�������س����ĸ�����������
#T=floor() //������������Ϊ��ӽ���������
floor() //������������Ϊ��ӽ���������
#T=expm1() //�������� exp(x) - 1�������� number ��ֵ�ӽ���Ҳ�ܼ����׼ȷ�����
expm1() //�������� exp(x) - 1�������� number ��ֵ�ӽ���Ҳ�ܼ����׼ȷ�����
#T=exp() //�������� e ��ָ����
exp() //�������� e ��ָ����
#T=deg2rad() //�������Ƕ�ת��Ϊ���ȡ�
deg2rad() //�������Ƕ�ת��Ϊ���ȡ�
#T=decoct() //������ʮ����ת��Ϊ�˽��ơ�
decoct() //������ʮ����ת��Ϊ�˽��ơ�
#T=dechex() //������ʮ����ת��Ϊʮ�����ơ�
dechex() //������ʮ����ת��Ϊʮ�����ơ�
#T=decbin() //������ʮ����ת��Ϊ�����ơ�
decbin() //������ʮ����ת��Ϊ�����ơ�
#T=cosh() //��������һ������˫�����ҡ�
cosh() //��������һ������˫�����ҡ�
#T=cos() //��������һ���������ҡ�
cos() //��������һ���������ҡ�
#T=ceil() //������������Ϊ��ӽ���������
ceil() //������������Ϊ��ӽ���������
#T=bindec() //�����Ѷ�����ת��Ϊʮ���ơ�
bindec() //�����Ѷ�����ת��Ϊʮ���ơ�
#T=base_convert() //�������������֮��ת�����֡�
base_convert() //�������������֮��ת�����֡�
#T=atanh() //��������һ���Ƕȵķ�˫�����С�
atanh() //��������һ���Ƕȵķ�˫�����С�
#T=asinh() //��������һ�����ķ�˫�����ҡ�
asinh() //��������һ�����ķ�˫�����ҡ�
#T=asin() //�������ز�ͬ��ֵ�ķ����ң����صĽ���ǽ��� -PI/2 �� PI/2 ֮��Ļ���ֵ��
asin() //�������ز�ͬ��ֵ�ķ����ң����صĽ���ǽ��� -PI/2 �� PI/2 ֮��Ļ���ֵ��
#T=acosh() //��������һ�����ķ�˫�����ҡ�
acosh() //��������һ�����ķ�˫�����ҡ�
#T=acos() //��������һ�����ķ����ҡ�
acos() //��������һ�����ķ����ҡ�
#T=abs() //��������һ�����ľ���ֵ��
abs() //��������һ�����ľ���ֵ��
#T=mail() //�����������ӽű���ֱ�ӷ��͵����ʼ���
mail() //�����������ӽű���ֱ�ӷ��͵����ʼ���
#T=libxml_use_internal_errors() //�������ñ�׼�� libxml ���󣬲������û�������
libxml_use_internal_errors() //�������ñ�׼�� libxml ���󣬲������û�������
#T=libxml_get_last_error() //������ libxml ���󻺳��л�ȡ���һ������
libxml_get_last_error() //������ libxml ���󻺳��л�ȡ���һ������
#T=libxml_get_errors() //������ libxml ���󻺳��л�ȡ����
libxml_get_errors() //������ libxml ���󻺳��л�ȡ����
#T=libxml_clear_errors() //������� libxml ���󻺳塣
libxml_clear_errors() //������� libxml ���󻺳塣
#T=setrawcookie() //�������� cookie ֵ���� URL ���룬����һ�� HTTP cookie��
setrawcookie() //�������� cookie ֵ���� URL ���룬����һ�� HTTP cookie��
#T=setcookie() //������ͻ��˷���һ�� HTTP cookie��
setcookie() //������ͻ��˷���һ�� HTTP cookie��
#T=headers_sent() //������� HTTP ��ͷ�Ƿ���/�ѷ��͵��δ���
headers_sent() //������� HTTP ��ͷ�Ƿ���/�ѷ��͵��δ���
#T=headers_list() //���������ѷ��͵ģ�������͵ģ���Ӧͷ����һ���б�
headers_list() //���������ѷ��͵ģ�������͵ģ���Ӧͷ����һ���б�
#T=header() //������ͻ��˷���ԭʼ�� HTTP ��ͷ��
header() //������ͻ��˷���ԭʼ�� HTTP ��ͷ��
#T=ftp_systype() //��������Զ�� FTP ��������ϵͳ���ͱ�ʶ����
ftp_systype() //��������Զ�� FTP ��������ϵͳ���ͱ�ʶ����
#T=ftp_ssl_connect() //������һ����ȫ�� SSL-FTP ���ӡ�
ftp_ssl_connect() //������һ����ȫ�� SSL-FTP ���ӡ�
#T=ftp_size() //��������ָ���ļ��Ĵ�С��
ftp_size() //��������ָ���ļ��Ĵ�С��
#T=ftp_site() //��������������� SITE ���
ftp_site() //��������������� SITE ���
#T=ftp_set_option() //�������ø��� FTP ����ʱѡ�
ftp_set_option() //�������ø��� FTP ����ʱѡ�
#T=ftp_rmdir() //����ɾ��һ��Ŀ¼��
ftp_rmdir() //����ɾ��һ��Ŀ¼��
#T=ftp_rename() //�������� FTP �������ϵ��ļ���Ŀ¼����
ftp_rename() //�������� FTP �������ϵ��ļ���Ŀ¼����
#T=ftp_rawlist() //��������ָ��Ŀ¼���ļ�����ϸ�б�
ftp_rawlist() //��������ָ��Ŀ¼���ļ�����ϸ�б�
#T=ftp_raw() //������ FTP ����������һ�� raw ���
ftp_raw() //������ FTP ����������һ�� raw ���
#T=ftp_quit() //�����ر� FTP ���ӡ�
ftp_quit() //�����ر� FTP ���ӡ�
#T=ftp_pwd() //�������ص�ǰĿ¼����
ftp_pwd() //�������ص�ǰĿ¼����
#T=ftp_put() //�������ļ��ϴ�����������
ftp_put() //�������ļ��ϴ�����������
#T=ftp_pasv() //�����ѱ���ģʽ����Ϊ�򿪻�رա�
ftp_pasv() //�����ѱ���ģʽ����Ϊ�򿪻�رա�
#T=ftp_nlist() //��������ָ��Ŀ¼���ļ��б�
ftp_nlist() //��������ָ��Ŀ¼���ļ��б�
#T=ftp_nb_put() //�������ļ��ϴ���������(non-blocking)��
ftp_nb_put() //�������ļ��ϴ���������(non-blocking)��
#T=ftp_nb_get() //������ FTP �������ϻ�ȡ�ļ���д�뱾���ļ�(non-blocking)��
ftp_nb_get() //������ FTP �������ϻ�ȡ�ļ���д�뱾���ļ�(non-blocking)��
#T=ftp_nb_fput() //�����ϴ�һ���Ѵ򿪵��ļ������� FTP �������ϰ�������Ϊ�ļ�(non-blocking)��
ftp_nb_fput() //�����ϴ�һ���Ѵ򿪵��ļ������� FTP �������ϰ�������Ϊ�ļ�(non-blocking)��
#T=ftp_nb_fget() //������ FTP ������������һ���ļ������浽�����Ѿ��򿪵�һ���ļ���(non-blocking)��
ftp_nb_fget() //������ FTP ������������һ���ļ������浽�����Ѿ��򿪵�һ���ļ���(non-blocking)��
#T=ftp_nb_continue() //����������ȡ / �����ļ���
ftp_nb_continue() //����������ȡ / �����ļ���
#T=ftp_mkdir() //������ FTP �������Ͻ�����Ŀ¼��
ftp_mkdir() //������ FTP �������Ͻ�����Ŀ¼��
#T=ftp_mdtm() //��������ָ���ļ�������޸�ʱ�䡣
ftp_mdtm() //��������ָ���ļ�������޸�ʱ�䡣
#T=ftp_login() //������¼ FTP ��������
ftp_login() //������¼ FTP ��������
#T=ftp_get() //������ FTP ������������һ���ļ���
ftp_get() //������ FTP ������������һ���ļ���
#T=ftp_get_option() //�������ص�ǰ FTP ���ӵĸ��ֲ�ͬ��ѡ�����á�
ftp_get_option() //�������ص�ǰ FTP ���ӵĸ��ֲ�ͬ��ѡ�����á�
#T=ftp_fput() //�����ϴ�һ���Ѿ��򿪵��ļ��� FTP ��������
ftp_fput() //�����ϴ�һ���Ѿ��򿪵��ļ��� FTP ��������
#T=ftp_fget() //������ FTP ������������һ���ļ������浽����һ���Ѿ��򿪵��ļ��С�
ftp_fget() //������ FTP ������������һ���ļ������浽����һ���Ѿ��򿪵��ļ��С�
#T=ftp_exec() //���������� FTP ��������ִ��һ����������
ftp_exec() //���������� FTP ��������ִ��һ����������
#T=ftp_delete() //����ɾ�� FTP �������ϵ�һ���ļ���
ftp_delete() //����ɾ�� FTP �������ϵ�һ���ļ���
#T=ftp_connect() //��������һ���µ� FTP ���ӡ�
ftp_connect() //��������һ���µ� FTP ���ӡ�
#T=ftp_close() //�����ر� FTP ���ӡ�
ftp_close() //�����ر� FTP ���ӡ�
#T=ftp_chmod() //�������� FTP ��������ָ���ļ���Ȩ�ޡ�
ftp_chmod() //�������� FTP ��������ָ���ļ���Ȩ�ޡ�
#T=ftp_chdir() //�����ı� FTP �������ϵĵ�ǰĿ¼��
ftp_chdir() //�����ı� FTP �������ϵĵ�ǰĿ¼��
#T=ftp_cdup() //�����ѵ�ǰĿ¼�ı�Ϊ FTP �������ϵĸ�Ŀ¼��
ftp_cdup() //�����ѵ�ǰĿ¼�ı�Ϊ FTP �������ϵĸ�Ŀ¼��
#T=ftp_alloc() //����ΪҪ�ϴ��� FTP ���������ļ�����ռ䡣
ftp_alloc() //����ΪҪ�ϴ��� FTP ���������ļ�����ռ䡣
#T=filter_var() //����ͨ��ָ���Ĺ��������˱�����
filter_var() //����ͨ��ָ���Ĺ��������˱�����
#T=filter_var_array() //������ȡ��������������й��ˡ�
filter_var_array() //������ȡ��������������й��ˡ�
#T=filter_list() //�������ذ������еõ�֧�ֵĹ�������һ�����顣
filter_list() //�������ذ������еõ�֧�ֵĹ�������һ�����顣
#T=filter_input_array() //�����ӽű��ⲿ��ȡ�������룬�����й��ˡ�
filter_input_array() //�����ӽű��ⲿ��ȡ�������룬�����й��ˡ�
#T=filter_input() //�����ӽű��ⲿ��ȡ���룬�����й��ˡ�
filter_input() //�����ӽű��ⲿ��ȡ���룬�����й��ˡ�
#T=filter_id() //��������ָ���������� ID �š�
filter_id() //��������ָ���������� ID �š�
#T=filter_has_var() //��������Ƿ����ָ���������͵ı�����
filter_has_var() //��������Ƿ����ָ���������͵ı�����
#T=unlink() //����ɾ���ļ���
unlink() //����ɾ���ļ���
#T=umask() //�����ı䵱ǰ�� umask��
umask() //�����ı䵱ǰ�� umask��
#T=touch() //��������ָ���ļ��ķ��ʺ��޸�ʱ�䡣
touch() //��������ָ���ļ��ķ��ʺ��޸�ʱ�䡣
#T=tmpfile() //�����Զ�д��w+��ģʽ����һ������Ψһ�ļ�������ʱ�ļ���
tmpfile() //�����Զ�д��w+��ģʽ����һ������Ψһ�ļ�������ʱ�ļ���
#T=tempnam() //��������һ������Ψһ�ļ�������ʱ�ļ���
tempnam() //��������һ������Ψһ�ļ�������ʱ�ļ���
#T=symlink() //���������������ӡ�
symlink() //���������������ӡ�
#T=stat() //�������ع����ļ�����Ϣ��
stat() //�������ع����ļ�����Ϣ��
#T=set_file_buffer() //�������ô��ļ��Ļ����С��
set_file_buffer() //�������ô��ļ��Ļ����С��
#T=rmdir() //����ɾ���յ�Ŀ¼��
rmdir() //����ɾ���յ�Ŀ¼��
#T=rewind() //�������ļ�ָ���λ�õ����ļ��Ŀ�ͷ��
rewind() //�������ļ�ָ���λ�õ����ļ��Ŀ�ͷ��
#T=rename() //�����������ļ���Ŀ¼��
rename() //�����������ļ���Ŀ¼��
#T=realpath() //�������ؾ���·����
realpath() //�������ؾ���·����
#T=readlink() //�������ط�������ָ���Ŀ�ꡣ
readlink() //�������ط�������ָ���Ŀ�ꡣ
#T=readfile() //�������һ���ļ���
readfile() //�������һ���ļ���
#T=popen() //�����򿪽����ļ�ָ�롣
popen() //�����򿪽����ļ�ָ�롣
#T=pclose() //�����ر��� popen() �򿪵Ĺܵ���
pclose() //�����ر��� popen() �򿪵Ĺܵ���
#T=pathinfo() //�������������ʽ�����ļ�·������Ϣ��
pathinfo() //�������������ʽ�����ļ�·������Ϣ��
#T=parse_ini_file() //��������һ�������ļ��������������ʽ�������е����á�
parse_ini_file() //��������һ�������ļ��������������ʽ�������е����á�
#T=move_uploaded_file() //�������ϴ����ļ��ƶ�����λ�á�
move_uploaded_file() //�������ϴ����ļ��ƶ�����λ�á�
#T=mkdir() //��������Ŀ¼��
mkdir() //��������Ŀ¼��
#T=lstat() //�������ع����ļ���������ӵ���Ϣ��
lstat() //�������ع����ļ���������ӵ���Ϣ��
#T=linkinfo() //�����������ӵ���Ϣ��
linkinfo() //�����������ӵ���Ϣ��
#T=link() //��������һ��Ӳ���ӡ�
link() //��������һ��Ӳ���ӡ�
#T=is_writeable() //�����ж�ָ�����ļ��Ƿ��д��
is_writeable() //�����ж�ָ�����ļ��Ƿ��д��
#T=is_writable() //�����ж�ָ�����ļ��Ƿ��д��
is_writable() //�����ж�ָ�����ļ��Ƿ��д��
#T=is_uploaded_file() //�����ж�ָ�����ļ��Ƿ���ͨ�� HTTP POST �ϴ��ġ�
is_uploaded_file() //�����ж�ָ�����ļ��Ƿ���ͨ�� HTTP POST �ϴ��ġ�
#T=is_readable() //�����ж�ָ���ļ����Ƿ�ɶ���
is_readable() //�����ж�ָ���ļ����Ƿ�ɶ���
#T=is_link() //�����ж�ָ���ļ����Ƿ�Ϊһ���������ӡ�
is_link() //�����ж�ָ���ļ����Ƿ�Ϊһ���������ӡ�
#T=is_file() //�������ָ�����ļ����Ƿ����������ļ���
is_file() //�������ָ�����ļ����Ƿ����������ļ���
#T=is_executable() //�������ָ�����ļ��Ƿ��ִ�С�
is_executable() //�������ָ�����ļ��Ƿ��ִ�С�
#T=is_dir() //�������ָ�����ļ��Ƿ���Ŀ¼��
is_dir() //�������ָ�����ļ��Ƿ���Ŀ¼��
#T=glob() //��������ƥ��ָ��ģʽ���ļ�����Ŀ¼��
glob() //��������ƥ��ָ��ģʽ���ļ�����Ŀ¼��
#T=fwrite() //����д���ļ����ɰ�ȫ���ڶ������ļ�����
fwrite() //����д���ļ����ɰ�ȫ���ڶ������ļ�����
#T=ftruncate() //�������ļ��ضϵ�ָ���ĳ��ȡ�
ftruncate() //�������ļ��ضϵ�ָ���ĳ��ȡ�
#T=ftell() //�����ڴ��ļ��еĵ�ǰλ�á�
ftell() //�����ڴ��ļ��еĵ�ǰλ�á�
#T=fstat() //�������ع��ڴ��ļ�����Ϣ��
fstat() //�������ع��ڴ��ļ�����Ϣ��
#T=fseek() //�����ڴ򿪵��ļ��ж�λ��
fseek() //�����ڴ򿪵��ļ��ж�λ��
#T=fscanf() //��������ָ���ĸ�ʽ�����Դ򿪵��ļ���������н�����
fscanf() //��������ָ���ĸ�ʽ�����Դ򿪵��ļ���������н�����
#T=fread() //������ȡ�ļ����ɰ�ȫ���ڶ������ļ�����
fread() //������ȡ�ļ����ɰ�ȫ���ڶ������ļ�����
#T=fputs() //����д���ļ����ɰ�ȫ���ڶ������ļ�����
fputs() //����д���ļ����ɰ�ȫ���ڶ������ļ�����
#T=fputcsv() //�������и�ʽ��Ϊ CSV ��д��һ���򿪵��ļ���
fputcsv() //�������и�ʽ��Ϊ CSV ��д��һ���򿪵��ļ���
#T=fpassthru() //��������ļ�ָ�봦������ʣ�����ݡ�
fpassthru() //��������ļ�ָ�봦������ʣ�����ݡ�
#T=fopen() //�������ļ����� URL��
fopen() //�������ļ����� URL��
#T=fnmatch() //��������ָ����ģʽ��ƥ���ļ������ַ�����
fnmatch() //��������ָ����ģʽ��ƥ���ļ������ַ�����
#T=flock() //�����������ͷ��ļ���
flock() //�����������ͷ��ļ���
#T=filetype() //��������ָ���ļ���Ŀ¼�����͡�
filetype() //��������ָ���ļ���Ŀ¼�����͡�
#T=filesize() //��������ָ���ļ��Ĵ�С��
filesize() //��������ָ���ļ��Ĵ�С��
#T=fileperms() //���������ļ���Ŀ¼��Ȩ�ޡ�
fileperms() //���������ļ���Ŀ¼��Ȩ�ޡ�
#T=fileowner() //���������ļ��������ߡ�
fileowner() //���������ļ��������ߡ�
#T=filemtime() //���������ļ������ϴε��޸�ʱ�䡣
filemtime() //���������ļ������ϴε��޸�ʱ�䡣
#T=fileinode() //���������ļ��� inode ��š�
fileinode() //���������ļ��� inode ��š�
#T=filegroup() //��������ָ���ļ����� ID��
filegroup() //��������ָ���ļ����� ID��
#T=filectime() //��������ָ���ļ����ϴ� inode �޸�ʱ�䡣
filectime() //��������ָ���ļ����ϴ� inode �޸�ʱ�䡣
#T=fileatime() //��������ָ���ļ����ϴη���ʱ�䡣
fileatime() //��������ָ���ļ����ϴη���ʱ�䡣
#T=file_put_contents() //������һ���ַ���д���ļ��С�
file_put_contents() //������һ���ַ���д���ļ��С�
#T=file_get_contents() //�����������ļ�����һ���ַ����С�
file_get_contents() //�����������ļ�����һ���ַ����С�
#T=file_exists() //��������ļ���Ŀ¼�Ƿ���ڡ�
file_exists() //��������ļ���Ŀ¼�Ƿ���ڡ�
#T=file() //�����������ļ�����һ�������С�
file() //�����������ļ�����һ�������С�
#T=fgetss() //�����Ӵ򿪵��ļ��ж�ȡһ�в����˵� HTML �� PHP ��ǡ�
fgetss() //�����Ӵ򿪵��ļ��ж�ȡһ�в����˵� HTML �� PHP ��ǡ�
#T=fgets() //�������ļ�ָ���ж�ȡһ�С�
fgets() //�������ļ�ָ���ж�ȡһ�С�
#T=fgetcsv() //�������ļ�ָ���ж���һ�в����� CSV �ֶΡ�
fgetcsv() //�������ļ�ָ���ж���һ�в����� CSV �ֶΡ�
#T=fgetc() //�������ļ�ָ���ж�ȡһ���ַ���
fgetc() //�������ļ�ָ���ж�ȡһ���ַ���
#T=fflush() //��������������������ļ���
fflush() //��������������������ļ���
#T=feof() //��������Ƿ��ѵ����ļ�ĩβ(eof)��
feof() //��������Ƿ��ѵ����ļ�ĩβ(eof)��
#T=fclose() //�����ر�һ�����ļ���
fclose() //�����ر�һ�����ļ���
#T=diskfreespace() //��������Ŀ¼�еĿ��ÿռ䡣�ú����� disk_free_space() �����ı�����
diskfreespace() //��������Ŀ¼�еĿ��ÿռ䡣�ú����� disk_free_space() �����ı�����
#T=disk_total_space() //��������ָ��Ŀ¼�Ĵ����ܴ�С��
disk_total_space() //��������ָ��Ŀ¼�Ĵ����ܴ�С��
#T=disk_free_space() //��������Ŀ¼�еĿ��ÿռ�
disk_free_space() //��������Ŀ¼�еĿ��ÿռ�
#T=dirname() //��������·���е�Ŀ¼���֡�
dirname() //��������·���е�Ŀ¼���֡�
#T=clearstatcache() //���������ļ���
clearstatcache() //���������ļ���
#T=clearstatcache() //��������ļ�״̬���档
clearstatcache() //��������ļ�״̬���档
#T=chown() //�����ı�ָ���ļ��������ߡ�
chown() //�����ı�ָ���ļ��������ߡ�
#T=chmod() //�����ı��ļ�ģʽ��
chmod() //�����ı��ļ�ģʽ��
#T=chgrp() //�����ı��ļ��������顣
chgrp() //�����ı��ļ��������顣
#T=basename() //��������·���е��ļ������֡�
basename() //��������·���е��ļ������֡�
#T=set_exception_handler() //���������û��Զ�����쳣��������
set_exception_handler() //���������û��Զ�����쳣��������
#T=set_error_handler() //���������û��Զ���Ĵ���������
set_error_handler() //���������û��Զ���Ĵ���������
#T=restore_exception_handler() //�����ָ�֮ǰ���쳣������򣬸ó������� set_exception_handler() �����ı�ġ�
restore_exception_handler() //�����ָ�֮ǰ���쳣������򣬸ó������� set_exception_handler() �����ı�ġ�
#T=restore_error_handler() //�����ָ�֮ǰ�Ĵ�������򣬸ó������� set_error_handler() �����ı�ġ�
restore_error_handler() //�����ָ�֮ǰ�Ĵ�������򣬸ó������� set_error_handler() �����ı�ġ�
#T=error_reporting() //���� PHP �ı����𲢷��ص�ǰ����
error_reporting() //���� PHP �ı����𲢷��ص�ǰ����
#T=error_log() //����������������¼���ļ���Զ��Ŀ�귢��һ������
error_log() //����������������¼���ļ���Զ��Ŀ�귢��һ������
#T=error_get_last() //������ȡ������Ĵ���
error_get_last() //������ȡ������Ĵ���
#T=debug_print_backtrace() //������� backtrace��
debug_print_backtrace() //������� backtrace��
#T=debug_backtrace() //cktrace() ����
debug_backtrace() //cktrace() ����
#T=scandir() //��������һ�����飬���а���ָ��·���е��ļ���Ŀ¼��
scandir() //��������һ�����飬���а���ָ��·���е��ļ���Ŀ¼��
#T=rewinddir() //���������� opendir() �򿪵�Ŀ¼�����
rewinddir() //���������� opendir() �򿪵�Ŀ¼�����
#T=readdir() //���������� opendir() �򿪵�Ŀ¼����е���Ŀ��
readdir() //���������� opendir() �򿪵�Ŀ¼����е���Ŀ��
#T=opendir() //������һ��Ŀ¼��������� closedir()��readdir() �� rewinddir() ʹ�á�
opendir() //������һ��Ŀ¼��������� closedir()��readdir() �� rewinddir() ʹ�á�
#T=getcwd() //�������ص�ǰĿ¼��
getcwd() //�������ص�ǰĿ¼��
#T=closedir() //�����ر��� opendir() �����򿪵�Ŀ¼�����
closedir() //�����ر��� opendir() �����򿪵�Ŀ¼�����
#T=dir() //������һ��Ŀ¼�����������һ��������������������������read() ,rewind() �Լ� close()��
dir() //������һ��Ŀ¼�����������һ��������������������������read() ,rewind() �Լ� close()��
#T=chroot() //�����ѵ�ǰ���̵ĸ�Ŀ¼�ı�Ϊָ����Ŀ¼��
chroot() //�����ѵ�ǰ���̵ĸ�Ŀ¼�ı�Ϊָ����Ŀ¼��
#T=chdir() //�����ѵ�ǰ��Ŀ¼�ı�Ϊָ����Ŀ¼��
chdir() //�����ѵ�ǰ��Ŀ¼�ı�Ϊָ����Ŀ¼��
#T=time() //�������ص�ǰʱ��� Unix ʱ�����
time() //�������ص�ǰʱ��� Unix ʱ�����
#T=strtotime() //�������κ�Ӣ���ı�������ʱ����������Ϊ Unix ʱ�����
strtotime() //�������κ�Ӣ���ı�������ʱ����������Ϊ Unix ʱ�����
#T=strptime() //���������� strftime() ���ɵ����ڣ�ʱ�䡣
strptime() //���������� strftime() ���ɵ����ڣ�ʱ�䡣
#T=strftime() //���������������ø�ʽ������ʱ�䣯���ڡ�
strftime() //���������������ø�ʽ������ʱ�䣯���ڡ�
#T=mktime() //��������һ�����ڵ� Unix ʱ�����
mktime() //��������һ�����ڵ� Unix ʱ�����
#T=microtime() //�������ص�ǰ Unix ʱ�����΢������
microtime() //�������ص�ǰ Unix ʱ�����΢������
#T=localtime() //�������ر���ʱ�䣨һ�����飩��
localtime() //�������ر���ʱ�䣨һ�����飩��
#T=idate() //����������ʱ��/���ڸ�ʽ��Ϊ������
idate() //����������ʱ��/���ڸ�ʽ��Ϊ������
#T=gmstrftime() //�������ݱ����������ø�ʽ�� GMT/UTC ʱ�䣯���ڡ�
gmstrftime() //�������ݱ����������ø�ʽ�� GMT/UTC ʱ�䣯���ڡ�
#T=gmmktime() //����ȡ�� GMT ���ڵ� UNIX ʱ�����
gmmktime() //����ȡ�� GMT ���ڵ� UNIX ʱ�����
#T=gmdate() //������ʽ�� GMT/UTC ����/ʱ�䡣
gmdate() //������ʽ�� GMT/UTC ����/ʱ�䡣
#T=gettimeofday() //��������һ��������ǰʱ����Ϣ�����顣
gettimeofday() //��������һ��������ǰʱ����Ϣ�����顣
#T=getdate() //����ȡ�����ڣ�ʱ����Ϣ��
getdate() //����ȡ�����ڣ�ʱ����Ϣ��
#T=date() //������ʽ��һ������ʱ�䣯���ڡ�
date() //������ʽ��һ������ʱ�䣯���ڡ�
#T=date_sunset() //��������ָ����������ص������ʱ�䡣
date_sunset() //��������ָ����������ص������ʱ�䡣
#T=date_sunrise() //��������ָ����������ص���ճ�ʱ�䡣
date_sunrise() //��������ָ����������ص���ճ�ʱ�䡣
#T=date_default_timezone_set() //�����������ڽű�����������/ʱ�亯����Ĭ��ʱ����
date_default_timezone_set() //�����������ڽű�����������/ʱ�亯����Ĭ��ʱ����
#T=date_default_timezone_get() //�������ؽű�����������ʱ�亯����ʹ�õ�Ĭ��ʱ����
date_default_timezone_get() //�������ؽű�����������ʱ�亯����ʹ�õ�Ĭ��ʱ����
#T=checkdate() //������֤һ������������ڡ�
checkdate() //������֤һ������������ڡ�
#T=UnixToJD() //������ Unix ʱ���ת��Ϊ�����ռ�����
UnixToJD() //������ Unix ʱ���ת��Ϊ�����ռ�����
#T=JulianToJD() //������������ת��Ϊ�����ռ�����
JulianToJD() //������������ת��Ϊ�����ռ�����
#T=JewishToJD() //��������̫����ת��Ϊ�����ռ�����
JewishToJD() //��������̫����ת��Ϊ�����ռ�����
#T=JDToUnix() //�����������ռ���ת��Ϊ Unix ʱ�����
JDToUnix() //�����������ռ���ת��Ϊ Unix ʱ�����
#T=JDToGregorian() //lian() ����
JDToGregorian() //lian() ����
#T=JDToGregorian() //�����������ռ���ת��Ϊ��������������
JDToGregorian() //�����������ռ���ת��Ϊ��������������
#T=JDToFrench() //�����������ռ���ת��Ϊ�������͹�������
JDToFrench() //�����������ռ���ת��Ϊ�������͹�������
#T=JDMonthName() //��������ָ���������·��ַ�����
JDMonthName() //��������ָ���������·��ַ�����
#T=JDDayOfWeek() //���������������ܼ���
JDDayOfWeek() //���������������ܼ���
#T=GregorianToJD() //������������������ת����Ϊ�����ռ�����
GregorianToJD() //������������������ת����Ϊ�����ռ�����
#T=FrenchToJD() //������������������ת����Ϊ�����ռ�����
FrenchToJD() //������������������ת����Ϊ�����ռ�����
#T=easter_days() //��������ָ����ݵĸ������ 3 �� 21 ��֮���������
easter_days() //��������ָ����ݵĸ������ 3 �� 21 ��֮���������
#T=easter_date() //��������ָ����ݵĸ������ҹ�� Unix ʱ�����
easter_date() //��������ָ����ݵĸ������ҹ�� Unix ʱ�����
#T=cal_to_jd() //������ָ��������ת��Ϊ�����ռ�����
cal_to_jd() //������ָ��������ת��Ϊ�����ռ�����
#T=cal_info() //��������һ�����飬���а����˹��ڸ�����������Ϣ��
cal_info() //��������һ�����飬���а����˹��ڸ�����������Ϣ��
#T=cal_from_jd() //�����������ռ���ת��Ϊָ�����������ڡ�
cal_from_jd() //�����������ռ���ת��Ϊָ�����������ڡ�
#T=cal_days_in_month() //�������ָ������ݺ�����������һ�����е�������
cal_days_in_month() //�������ָ������ݺ�����������һ�����е�������
#T=usort() //����ʹ���û��Զ���ĺ�������������
usort() //����ʹ���û��Զ���ĺ�������������
#T=uksort() //����ʹ���û��Զ���ıȽϺ������ռ������������򣬲�����������ϵ��
uksort() //����ʹ���û��Զ���ıȽϺ������ռ������������򣬲�����������ϵ��
#T=uasort() //����ʹ���û��Զ���ıȽϺ������������򣬲�����������������ΪԪ�ط����µļ�����
uasort() //����ʹ���û��Զ���ıȽϺ������������򣬲�����������������ΪԪ�ط����µļ�����
#T=sort() //����������Ը��������ֵ����
sort() //����������Ը��������ֵ����
#T=sizeof() //�������������еĵ�Ԫ��Ŀ������е����Ը�����
sizeof() //�������������еĵ�Ԫ��Ŀ������е����Ը�����
#T=shuffle() //�����������е�Ԫ�ذ����˳���������С�
shuffle() //�����������е�Ԫ�ذ����˳���������С�
#T=rsort() //�����������Ԫ�ذ��ռ�ֵ�������������� arsort() �Ĺ��ܻ�����ͬ��
rsort() //�����������Ԫ�ذ��ռ�ֵ�������������� arsort() �Ĺ��ܻ�����ͬ��
#T=reset() //������������ڲ�ָ��ָ���һ��Ԫ�أ����������Ԫ�ص�ֵ��
reset() //������������ڲ�ָ��ָ���һ��Ԫ�أ����������Ԫ�ص�ֵ��
#T=range() //��������������һ������ָ����Χ��Ԫ�ص����顣
range() //��������������һ������ָ����Χ��Ԫ�ص����顣
#T=prev() //HP prev() ����
prev() //HP prev() ����
#T=pos() //������ current() ���� �ı��������ɷ��������е�ǰԪ�ص�ֵ��
pos() //������ current() ���� �ı��������ɷ��������е�ǰԪ�ص�ֵ��
#T=next() //������ָ��ǰԪ�ص�ָ���ƶ�����һ��Ԫ�ص�λ�ã������ص�ǰԪ�ص�ֵ��
next() //������ָ��ǰԪ�ص�ָ���ƶ�����һ��Ԫ�ص�λ�ã������ص�ǰԪ�ص�ֵ��
#T=natsort() //��������Ȼ˳���㷨�Ը��������е�Ԫ������
natsort() //��������Ȼ˳���㷨�Ը��������е�Ԫ������
#T=natcasesort() //�����ò����ִ�Сд����Ȼ˳���㷨�Ը��������е�Ԫ������
natcasesort() //�����ò����ִ�Сд����Ȼ˳���㷨�Ը��������е�Ԫ������
#T=list() //�����������е�Ԫ��Ϊһ�������ֵ��
list() //�����������е�Ԫ��Ϊһ�������ֵ��
#T=ksort() //�������ռ�������������Ϊ����ֵ����ԭ���ļ���
ksort() //�������ռ�������������Ϊ����ֵ����ԭ���ļ���
#T=krsort() //���������鰴�ռ���������Ϊ����ֵ����ԭ���ļ���
krsort() //���������鰴�ռ���������Ϊ����ֵ����ԭ���ļ���
#T=key() //�������������ڲ�ָ�뵱ǰָ��Ԫ�صļ�����
key() //�������������ڲ�ָ�뵱ǰָ��Ԫ�صļ�����
#T=in_array() //����������������������ֵ��
in_array() //����������������������ֵ��
#T=extract()
extract()
#T=end() //�����������ڲ�ָ��ָ�����һ��Ԫ�أ������ظ�Ԫ�ص�ֵ������ɹ�����
end() //�����������ڲ�ָ��ָ�����һ��Ԫ�أ������ظ�Ԫ�ص�ֵ������ɹ�����
#T=each() //��������һ�������鵱ǰ�ڲ�ָ����ָ���Ԫ�صļ����ͼ�ֵ��ɵ����飬�����ڲ�ָ����ǰ�ƶ���
each() //��������һ�������鵱ǰ�ڲ�ָ����ָ���Ԫ�صļ����ͼ�ֵ��ɵ����飬�����ڲ�ָ����ǰ�ƶ���
#T=current() //�������������еĵ�ǰԪ�أ���Ԫ����
current() //�������������еĵ�ǰԪ�أ���Ԫ����
#T=count() //�������������еĵ�Ԫ��Ŀ������е����Ը�����
count() //�������������еĵ�Ԫ��Ŀ������е����Ը�����
#T=compact() //��������һ���ɲ�������������ɵ����顣��������д������飬�������б�����ֵҲ�ᱻ��ȡ��
compact() //��������һ���ɲ�������������ɵ����顣��������д������飬�������б�����ֵҲ�ᱻ��ȡ��
#T=asort() //����������������򲢱���������ϵ����Ҫ���ڶ���Щ��Ԫ˳�����Ҫ�Ľ�������������
asort() //����������������򲢱���������ϵ����Ҫ���ڶ���Щ��Ԫ˳�����Ҫ�Ľ�������������
#T=arsort() //��������������������򲢱���������ϵ����Ҫ���ڶ���Щ��Ԫ˳�����Ҫ�Ľ�������������
arsort() //��������������������򲢱���������ϵ����Ҫ���ڶ���Щ��Ԫ˳�����Ҫ�Ľ�������������
#T=array_walk_recursive() //cursive() ����
array_walk_recursive() //cursive() ����
#T=array_walk() //�����������е�ÿ��Ԫ��Ӧ�ûص�����������ɹ��򷵻� TRUE�����򷵻� FALSE��
array_walk() //�����������е�ÿ��Ԫ��Ӧ�ûص�����������ɹ��򷵻� TRUE�����򷵻� FALSE��
#T=array_values() //��������һ�������������������м�ֵ�����飬��������������
array_values() //��������һ�������������������м�ֵ�����飬��������������
#T=array_unshift() //���������鿪ͷ����һ������Ԫ�ء�
array_unshift() //���������鿪ͷ����һ������Ԫ�ء�
#T=array_unique() //�����Ƴ������е��ظ���ֵ�������ؽ�����顣
array_unique() //�����Ƴ������е��ظ���ֵ�������ؽ�����顣
#T=array_uintersect_assoc() //��������������������Ľ������ûص������Ƚ����ݡ�
array_uintersect_assoc() //��������������������Ľ������ûص������Ƚ����ݡ�
#T=array_uintersect() //������������Ľ������ûص������Ƚ����ݡ�
array_uintersect() //������������Ľ������ûص������Ƚ����ݡ�
#T=array_udiff_uassoc() //�������� array1 �����д��ڵ����������ж������ڵĲ��֡����ص������м������ֲ��䡣
array_udiff_uassoc() //�������� array1 �����д��ڵ����������ж������ڵĲ��֡����ص������м������ֲ��䡣
#T=array_udiff_assoc() //�������� array1 �д��ڵ����������ж������ڵĲ��֡�
array_udiff_assoc() //�������� array1 �д��ڵ����������ж������ڵĲ��֡�
#T=array_udiff() //��������һ�����飬����������������ڱ��Ƚ������У����ǲ����κ��������������е�ֵ�������������䡣
array_udiff() //��������һ�����飬����������������ڱ��Ƚ������У����ǲ����κ��������������е�ֵ�������������䡣
#T=array_sum() //������������������ֵ���ܺ͡�
array_sum() //������������������ֵ���ܺ͡�
#T=array_splice() //������ array_slice() �������ƣ�ѡ�������е�һϵ��Ԫ�أ��������أ�����ɾ�����ǲ�������ֵ���档
array_splice() //������ array_slice() �������ƣ�ѡ�������е�һϵ��Ԫ�أ��������أ�����ɾ�����ǲ�������ֵ���档
#T=array_slice() //�����������и�������ȡ��һ��ֵ�������ء�
array_slice() //�����������и�������ȡ��һ��ֵ�������ء�
#T=array_shift() //����ɾ�������еĵ�һ��Ԫ�أ������ر�ɾ��Ԫ�ص�ֵ��
array_shift() //����ɾ�������еĵ�һ��Ԫ�أ������ر�ɾ��Ԫ�ص�ֵ��
#T=array_search() //������ in_array() һ�����������в���һ����ֵ������ҵ��˸�ֵ��ƥ��Ԫ�صļ����ᱻ���ء����û�ҵ����򷵻� false��
array_search() //������ in_array() һ�����������в���һ����ֵ������ҵ��˸�ֵ��ƥ��Ԫ�صļ����ᱻ���ء����û�ҵ����򷵻� false��
#T=array_reverse() //������ԭ�����е�Ԫ��˳��ת�������µ����鲢���ء�����ڶ�������ָ��Ϊ true����Ԫ�صļ������ֲ��䣬�����������ʧ��
array_reverse() //������ԭ�����е�Ԫ��˳��ת�������µ����鲢���ء�����ڶ�������ָ��Ϊ true����Ԫ�صļ������ֲ��䣬�����������ʧ��
#T=array_reduce() //�����ûص����������ؽ������Ϊ��һ��ֵ�����ָ����������������ò������������������еĵ�һ��ֵ�����������������Ϊ�յĻ�����Ϊ���շ���ֵ��
array_reduce() //�����ûص����������ؽ������Ϊ��һ��ֵ�����ָ����������������ò������������������еĵ�һ��ֵ�����������������Ϊ�յĻ�����Ϊ���շ���ֵ��
#T=array_rand() //���������������ѡ��һ������Ԫ�أ������ء�
array_rand() //���������������ѡ��һ������Ԫ�أ������ء�
#T=array_push() //�������һ������������β�����һ������Ԫ�أ���ջ����Ȼ�󷵻�������ĳ��ȡ�
array_push() //�������һ������������β�����һ������Ԫ�أ���ջ����Ȼ�󷵻�������ĳ��ȡ�
#T=array_product() //�������㲢��������������ֵ�ĳ˻���
array_product() //�������㲢��������������ֵ�ĳ˻���
#T=array_pop() //����ɾ�������е����һ��Ԫ�ء�
array_pop() //����ɾ�������е����һ��Ԫ�ء�
#T=array_pad() //������һ������������ָ��ֵ��ָ��������Ԫ�ء�
array_pad() //������һ������������ָ��ֵ��ָ��������Ԫ�ء�
#T=array_multisort() //�����Զ��������ά�����������
array_multisort() //�����Զ��������ά�����������
#T=array_merge_recursive() //������ array_merge() ���� һ������һ�����������Ԫ�صĺϲ�������һ�������е�ֵ������ǰһ������ĺ��档��������Ϊ��������顣
array_merge_recursive() //������ array_merge() ���� һ������һ�����������Ԫ�صĺϲ�������һ�������е�ֵ������ǰһ������ĺ��档��������Ϊ��������顣
#T=array_merge() //������������������ϲ�Ϊһ�����顣
array_merge() //������������������ϲ�Ϊһ�����顣
#T=array_map() //���������û��Զ��庯�����ú�����顣�ص��������ܵĲ�����ĿӦ�úʹ��ݸ� array_map() ������������Ŀһ�¡�
array_map() //���������û��Զ��庯�����ú�����顣�ص��������ܵĲ�����ĿӦ�úʹ��ݸ� array_map() ������������Ŀһ�¡�
#T=array_keys() //�������ذ������������м�����һ�������顣
array_keys() //�������ذ������������м�����һ�������顣
#T=array_key_exists() //�����ж�ĳ���������Ƿ����ָ���� key������� key ���ڣ��򷵻� true�����򷵻� false��
array_key_exists() //�����ж�ĳ���������Ƿ����ָ���� key������� key ���ڣ��򷵻� true�����򷵻� false��
#T=array_intersect_ukey() //�����ûص������Ƚϼ�������������Ľ�����
array_intersect_ukey() //�����ûص������Ƚϼ�������������Ľ�����
#T=array_intersect_uassoc() //����ʹ���û��Զ���Ļص�������������Ľ������ûص������Ƚ�������
array_intersect_uassoc() //����ʹ���û��Զ���Ļص�������������Ľ������ûص������Ƚ�������
#T=array_intersect_key() //����ʹ�ü����Ƚϼ�������Ľ�����
array_intersect_key() //����ʹ�ü����Ƚϼ�������Ľ�����
#T=array_intersect_assoc() //��������������������Ľ������顣
array_intersect_assoc() //��������������������Ľ������顣
#T=array_intersect() //��������������������Ľ������顣
array_intersect() //��������������������Ľ������顣
#T=array_flip() //��������һ����ת������飬���ͬһֵ�����˶�Σ������һ����������Ϊ����ֵ�����������ļ���������ʧ��
array_flip() //��������һ����ת������飬���ͬһֵ�����˶�Σ������һ����������Ϊ����ֵ�����������ļ���������ʧ��
#T=array_filter() //�����ûص��������������е�Ԫ�أ�����Զ�����˺������� true���򱻲���������ĵ�ǰֵ�ͻᱻ�����ڷ��صĽ�������У� ����������һ���µ����顣���ԭ������һ���������飬�������ֲ��䡣
array_filter() //�����ûص��������������е�Ԫ�أ�����Զ�����˺������� true���򱻲���������ĵ�ǰֵ�ͻᱻ�����ڷ��صĽ�������У� ����������һ���µ����顣���ԭ������һ���������飬�������ֲ��䡣
#T=array_fill() //�����ø�����ֵ������飬���ص������� number ��Ԫ�أ�ֵΪ value�����ص�����ʹ�������������� start λ�ÿ�ʼ����������� number Ϊ 0 ��С�� 0���ͻ����
array_fill() //�����ø�����ֵ������飬���ص������� number ��Ԫ�أ�ֵΪ value�����ص�����ʹ�������������� start λ�ÿ�ʼ����������� number Ϊ 0 ��С�� 0���ͻ����
#T=array_diff_ukey() //����һ�����飬��������������г����� array1 �е���δ�������κ��������������еļ�����ֵ��ע�������ϵ�������䡣�� array_diff() ��ͬ���ǣ��Ƚ��Ǹ��ݼ���������ֵ�����еġ�
array_diff_ukey() //����һ�����飬��������������г����� array1 �е���δ�������κ��������������еļ�����ֵ��ע�������ϵ�������䡣�� array_diff() ��ͬ���ǣ��Ƚ��Ǹ��ݼ���������ֵ�����еġ�
#T=array_diff_uassoc() //����ʹ���û��Զ���Ļص�����(callback) ���������������������������Ĳ������һ�����飬������������� array1 �е��ǲ����κ��������������е�ֵ��
array_diff_uassoc() //����ʹ���û��Զ���Ļص�����(callback) ���������������������������Ĳ������һ�����飬������������� array1 �е��ǲ����κ��������������е�ֵ��
#T=array_diff_key() //��������һ�����飬����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ���
array_diff_key() //��������һ�����飬����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ���
#T=array_diff_assoc() //����������������Ĳ���顣����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ���ֵ��
array_diff_assoc() //����������������Ĳ���顣����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ���ֵ��
#T=array_diff() //����������������Ĳ���顣����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ�ֵ��
array_diff() //����������������Ĳ���顣����������������ڱ��Ƚϵ������У����ǲ����κ��������������еļ�ֵ��
#T=array_count_values() //��������ͳ������������ֵ���ֵĴ�����
array_count_values() //��������ͳ������������ֵ���ֵĴ�����
#T=array_combine() //����ͨ���ϲ���������������һ�������飬���е�һ�������Ǽ�������һ�������ֵΪ��ֵ��
array_combine() //����ͨ���ϲ���������������һ�������飬���е�һ�������Ǽ�������һ�������ֵΪ��ֵ��
#T=array_chunk() //������һ������ָ�Ϊ�µ�����顣
array_chunk() //������һ������ָ�Ϊ�µ�����顣
#T=array_change_key_case() //��������������е� KEY ��ת��Ϊ��д��Сд��
array_change_key_case() //��������������е� KEY ��ת��Ϊ��д��Сд��
#T=array() //�������飬���м���ֵ������ڹ涨����ʱʡ���˼���������һ������������� key �� 0 ��ʼ��Ȼ���� 1 ���е�����
array() //�������飬���м���ֵ������ڹ涨����ʱʡ���˼���������һ������������� key �� 0 ��ʼ��Ȼ���� 1 ���е�����
#
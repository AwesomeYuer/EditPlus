#TITLE=See7di.Mysql 4.0
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=字符串函数
#T=┉━┉━┉━┉━┉━┉
#T=ASCII(str) 返回字符串str的第一个字符的ASCII值(str是空串时返回0)
mysql> select ASCII('2');
-> 50
mysql> select ASCII(2);
-> 50
mysql> select ASCII('dete');
-> 100

#T=ORD(str) 如果字符串str句首是单字节返回与ASCII()函数返回的相同值。 如果是一个多字节字符,以格式返回((first byte ASCII code)*256+(second byte ASCII code))[*256+third byte ASCII code...]
mysql> select ORD('2');
-> 50

#T=CONV(N,from_base,to_base) 对数字N进制转换,并转换为字串返回(任何参数为NULL时返回NULL,进制范围为2-36进制,当to_base是负数时N作为有符号数否则作无符号数,CONV以64位点精度工作)
mysql> select CONV("a",16,2);
-> '1010'
mysql> select CONV("6E",18,8);
-> '172'
mysql> select CONV(-17,10,-18);
-> '-H'
mysql> select CONV(10+"10"+'10'+0xa,10,10);
-> '40'

#T=BIN(N) 把N转为二进制值并以字串返回(N是BIGINT数字,等价于CONV(N,10,2))
mysql> select BIN(12);
-> '1100'

#T=OCT(N) 把N转为八进制值并以字串返回(N是BIGINT数字,等价于CONV(N,10,8))
mysql> select OCT(12);
-> '14'

#T=HEX(N) 把N转为十六进制并以字串返回(N是BIGINT数字,等价于CONV(N,10,16))
mysql> select HEX(255);
-> 'FF'

#T=CHAR(N,...) 返回由参数N,...对应的ASCII代码字符组成的一个字串(参数是N,...是数字序列,NULL值被跳过)
mysql> select CHAR(77,121,83,81,'76');
-> 'MySQL'
mysql> select CHAR(77,77.3,'77.3');
-> 'MMM'

#T=CONCAT(str1,str2,...) 把参数连成一个长字符串并返回(任何参数是NULL时返回NULL)
mysql> select CONCAT('My', 'S', 'QL');
-> 'MySQL'
mysql> select CONCAT('My', NULL, 'QL');
-> NULL
mysql> select CONCAT(14.3);
-> '14.3'

#T=LENGTH(str) 返回字符串str的长度
#T=OCTET_LENGTH(str) 返回字符串str的长度
mysql> select OCTET_LENGTH('text');
-> 4
#T=CHAR_LENGTH(str) 返回字符串str的长度(对于多字节字符CHAR_LENGTH仅计算一次)
mysql> select LENGTH('text');
-> 4
#T=CHARACTER_LENGTH(str) 返回字符串str的长度
#T=LOCATE(substr,str) 返回字符串substr在字符串str第一次出现的位置(str不包含substr时返回0)
mysql> select LOCATE('bar', 'foobarbar');
-> 4
mysql> select LOCATE('xbar', 'foobar');
-> 0

LOCATE(substr,str,pos) 返回字符串substr在字符串str的第pos个位置起第一次出现的位置(str不包含substr时返回0)
mysql> select LOCATE('bar', 'foobarbar',5);
-> 7

#T=POSITION(substr IN str) 返回字符串substr在字符串str第一次出现的位置(str不包含substr时返回0)
#T=INSTR(str,substr) 返回字符串substr在字符串str第一次出现的位置(str不包含substr时返回0)
mysql> select INSTR('foobarbar', 'bar');
-> 4
mysql> select INSTR('xbar', 'foobar');
-> 0

#T=LPAD(str,len,padstr) 用字符串padstr填补str左端直到字串长度为len并返回
mysql> select LPAD('hi',4,'??');
-> '??hi'

#T=RPAD(str,len,padstr) 用字符串padstr填补str右端直到字串长度为len并返回
mysql> select RPAD('hi',5,'?');
-> 'hi???'

#T=LEFT(str,len) 返回字符串str的左端len个字符
mysql> select LEFT('foobarbar', 5);
-> 'fooba'

#T=RIGHT(str,len) 返回字符串str的右端len个字符
mysql> select RIGHT('foobarbar', 4);
-> 'rbar'

#T=SUBSTRING(str,pos,len) 返回字符串str的位置pos起len个字符(使用FROM的丑陋语法是ANSI SQL92标准)
#T=SUBSTRING(str FROM pos FOR len) 返回字符串str的位置pos起len个字符(使用FROM的丑陋语法是ANSI SQL92标准)
#T=MID(str,pos,len) 返回字符串str的位置pos起len个字符(使用FROM的丑陋语法是ANSI SQL92标准)
mysql> select SUBSTRING('Quadratically',5,6);
-> 'ratica'

#T=SUBSTRING(str,pos) 返回字符串str的位置pos起的一个子串
#T=SUBSTRING(str FROM pos) 返回字符串str的位置pos起的一个子串
mysql> select SUBSTRING('Quadratically',5);
-> 'ratically'
mysql> select SUBSTRING('foobarbar' FROM 4);
-> 'barbar'

#T=SUBSTRING_INDEX(str,delim,count) 返回从字符串str的第count个出现的分隔符delim之后的子串(count为正数时返回左端,否则返回右端子串)
mysql> select SUBSTRING_INDEX('www.mysql.com', '.', 2);
-> 'www.mysql'
mysql> select SUBSTRING_INDEX('www.mysql.com', '.', -2);
-> 'mysql.com'

#T=LTRIM(str) 返回删除了左空格的字符串str
mysql> select LTRIM('  barbar');
-> 'barbar'

#T=RTRIM(str) 返回删除了右空格的字符串str
mysql> select RTRIM('barbar   ');
-> 'barbar'

#T=TRIM([[BOTH | LEADING | TRAILING] [remstr] FROM] str) 返回前缀或后缀remstr被删除了的字符串str(位置参数默认BOTH,remstr默认值为空格)
mysql> select TRIM('  bar   ');
-> 'bar'
mysql> select TRIM(LEADING 'x' FROM 'xxxbarxxx');
-> 'barxxx'
mysql> select TRIM(BOTH 'x' FROM 'xxxbarxxx');
-> 'bar'
mysql> select TRIM(TRAILING 'xyz' FROM 'barxxyz');
-> 'barx'

#T=SOUNDEX(str) 返回str的一个同音字符串(听起来“大致相同”字符串有相同的同音字符串,非数字字母字符被忽略,在A-Z外的字母被当作元音)
mysql> select SOUNDEX('Hello');
-> 'H400'
mysql> select SOUNDEX('Quadratically');
-> 'Q36324'

#T=SPACE(N) 返回由N个空格字符组成的一个字符串
mysql> select SPACE(6);
-> '      '

#T=REPLACE(str,from_str,to_str) 用字符串to_str替换字符串str中的子串from_str并返回
mysql> select REPLACE('www.mysql.com', 'w', 'Ww');
-> 'WwWwWw.mysql.com'

#T=REPEAT(str,count) 返回由count个字符串str连成的一个字符串(任何参数为NULL时返回NULL,count<=0时返回一个空字符串)
mysql> select REPEAT('MySQL', 3);
-> 'MySQLMySQLMySQL'

#T=REVERSE(str) 颠倒字符串str的字符顺序并返回
mysql> select REVERSE('abc');
-> 'cba'

#T=INSERT(str,pos,len,newstr) 把字符串str由位置pos起len个字符长的子串替换为字符串newstr并返回
mysql> select INSERT('Quadratic', 3, 4, 'What');
-> 'QuWhattic'

#T=ELT(N,str1,str2,str3,...) 返回第N个字符串(N小于1或大于参数个数返回NULL)
mysql> select ELT(1, 'ej', 'Heja', 'hej', 'foo');
-> 'ej'
mysql> select ELT(4, 'ej', 'Heja', 'hej', 'foo');
-> 'foo'

#T=FIELD(str,str1,str2,str3,...) 返回str等于其后的第N个字符串的序号(如果str没找到返回0)
mysql> select FIELD('ej', 'Hej', 'ej', 'Heja', 'hej', 'foo');
-> 2
mysql> select FIELD('fo', 'Hej', 'ej', 'Heja', 'hej', 'foo');
-> 0

#T=FIND_IN_SET(str,strlist) 返回str在字符串集strlist中的序号(任何参数是NULL则返回NULL,如果str没找到返回0,参数1包含","时工作异常)
mysql> SELECT FIND_IN_SET('b','a,b,c,d');
-> 2

#T=MAKE_SET(bits,str1,str2,...) 把参数1的数字转为二进制,假如某个位置的二进制位等于1,对应位置的字串选入字串集并返回(NULL串不添加到结果中)
mysql> SELECT MAKE_SET(1,'a','b','c');
-> 'a'
mysql> SELECT MAKE_SET(1 | 4,'hello','nice','world');
-> 'hello,world'
mysql> SELECT MAKE_SET(0,'a','b','c');
-> ''

#T=EXPORT_SET(bits,on,off,[separator,[number_of_bits]]) 按bits排列字符串集,只有当位等于1时插入字串on,否则插入off(separator默认值",",number_of_bits参数使用时长度不足补0而过长截断)
mysql> select EXPORT_SET(5,'Y','N',',',4)
-> Y,N,Y,N

#T=LCASE(str)
#T=LOWER(str) 返回小写的字符串str
mysql> select LCASE('QUADRATICALLY');
-> 'quadratically'

#T=UCASE(str)
#T=UPPER(str) 返回大写的字符串str
mysql> select UCASE('quadratically');
-> 'QUADRATICALLY'

#T=LOAD_FILE(file_name) 读入文件并且作为一个字符串返回文件内容(文件无法找到,路径不完整,没有权限,长度大于max_allowed_packet会返回NULL)
mysql> UPDATE table_name SET blob_column=LOAD_FILE("/tmp/picture") WHERE id=1;
#T=

#T=数学函数
#T=┉━┉━┉━┉━┉━┉
#T=ABS(N) 返回N的绝对值
mysql> select ABS(2);
-> 2
mysql> select ABS(-32);
-> 32

#T=SIGN(N) 返回参数的符号(为-1、0或1)
mysql> select SIGN(-32);
-> -1
mysql> select SIGN(0);
-> 0
mysql> select SIGN(234);
-> 1

#T=MOD(N,M) 取模运算,返回N被M除的余数(同%操作符)
mysql> select MOD(234, 10);
-> 4
mysql> select 234 % 10;
-> 4
mysql> select MOD(29,9);
-> 2

#T=FLOOR(N) 返回不大于N的最大整数值
mysql> select FLOOR(1.23);
-> 1
mysql> select FLOOR(-1.23);
-> -2

#T=CEILING(N) 返回不小于N的最小整数值
mysql> select CEILING(1.23);
-> 2
mysql> select CEILING(-1.23);
-> -1

#T=ROUND(N,D) 返回N的四舍五入值,保留D位小数(D的默认值为0)
mysql> select ROUND(-1.23);
-> -1
mysql> select ROUND(-1.58);
-> -2
mysql> select ROUND(1.58);
-> 2
mysql> select ROUND(1.298, 1);
-> 1.3
mysql> select ROUND(1.298, 0);
-> 1

#T=EXP(N) 返回值e的N次方(自然对数的底)
mysql> select EXP(2);
-> 7.389056
mysql> select EXP(-2);
-> 0.135335

#T=LOG(N) 返回N的自然对数
mysql> select LOG(2);
-> 0.693147
mysql> select LOG(-2);
-> NULL

#T=LOG10(N) 返回N以10为底的对数
mysql> select LOG10(2);
-> 0.301030
mysql> select LOG10(100);
-> 2.000000
mysql> select LOG10(-100);
-> NULL

#T=POW(X,Y)
POWER(X,Y) 返回值X的Y次幂
mysql> select POW(2,2);
-> 4.000000
mysql> select POW(2,-2);
-> 0.250000

#T=SQRT(N) 返回非负数N的平方根
mysql> select SQRT(4);
-> 2.000000
mysql> select SQRT(20);
-> 4.472136

#T=PI() 返回圆周率
mysql> select PI();
-> 3.141593

#T=COS(N) 返回N的余弦值
mysql> select COS(PI());
-> -1.000000

#T=SIN(N) 返回N的正弦值
mysql> select SIN(PI());
-> 0.000000

#T=TAN(N) 返回N的正切值
mysql> select TAN(PI()+1);
-> 1.557408

#T=ACOS(N) 返回N反余弦(N是余弦值,在-1到1的范围,否则返回NULL)
mysql> select ACOS(1);
-> 0.000000
mysql> select ACOS(1.0001);
-> NULL
mysql> select ACOS(0);
-> 1.570796

#T=ASIN(N) 返回N反正弦值
mysql> select ASIN(0.2);
-> 0.201358
mysql> select ASIN('foo');
-> 0.000000

#T=ATAN(N) 返回N的反正切值
mysql> select ATAN(2);
-> 1.107149
mysql> select ATAN(-2);
-> -1.107149

#T=ATAN2(X,Y) 返回2个变量X和Y的反正切(类似Y/X的反正切,符号决定象限)
mysql> select ATAN(-2,2);
-> -0.785398
mysql> select ATAN(PI(),0);
-> 1.570796

#T=COT(N) 返回X的余切
mysql> select COT(12);
-> -1.57267341
mysql> select COT(0);
-> NULL

#T=RAND()
#T=RAND(N) 返回在范围0到1.0内的随机浮点值(可以使用数字N作为初始值)
mysql> select RAND();
-> 0.5925
mysql> select RAND(20);
-> 0.1811
mysql> select RAND(20);
-> 0.1811
mysql> select RAND();
-> 0.2079
mysql> select RAND();
-> 0.7888

#T=DEGREES(N) 把N从弧度变换为角度并返回
mysql> select DEGREES(PI());
-> 180.000000

#T=RADIANS(N) 把N从角度变换为弧度并返回
mysql> select RADIANS(90);
-> 1.570796

#T=TRUNCATE(N,D) 保留数字N的D位小数并返回
mysql> select TRUNCATE(1.223,1);
-> 1.2
mysql> select TRUNCATE(1.999,1);
-> 1.9
mysql> select TRUNCATE(1.999,0);
-> 1

#T=LEAST(X,Y,...) 返回最小值(如果返回值被用在整数(实数或大小敏感字串)上下文或所有参数都是整数(实数或大小敏感字串)则他们作为整数(实数或大小敏感字串)比较,否则按忽略大小写的字符串被比较)
mysql> select LEAST(2,0);
-> 0
mysql> select LEAST(34.0,3.0,5.0,767.0);
-> 3.0
mysql> select LEAST("B","A","C");
-> "A"

#T=GREATEST(X,Y,...) 返回最大值(其余同LEAST())
mysql> select GREATEST(2,0);
-> 2
mysql> select GREATEST(34.0,3.0,5.0,767.0);
-> 767.0
mysql> select GREATEST("B","A","C");
-> "C"
#T=

#T=时期时间函数
#T=┉━┉━┉━┉━┉━┉
#T=DAYOFWEEK(date) 返回日期date是星期几(1=星期天,2=星期一,……7=星期六,ODBC标准)
mysql> select DAYOFWEEK('1998-02-03');
-> 3

#T=WEEKDAY(date) 返回日期date是星期几(0=星期一,1=星期二,……6= 星期天)。
mysql> select WEEKDAY('1997-10-04 22:23:00');
-> 5
mysql> select WEEKDAY('1997-11-05');
-> 2

#T=DAYOFMONTH(date) 返回date是一月中的第几日(在1到31范围内)
mysql> select DAYOFMONTH('1998-02-03');
-> 3

#T=DAYOFYEAR(date) 返回date是一年中的第几日(在1到366范围内)
mysql> select DAYOFYEAR('1998-02-03');
-> 34

#T=MONTH(date) 返回date中的月份数值
mysql> select MONTH('1998-02-03');
-> 2

#T=DAYNAME(date) 返回date是星期几(按英文名返回)
mysql> select DAYNAME("1998-02-05");
-> 'Thursday'

#T=MONTHNAME(date) 返回date是几月(按英文名返回)
mysql> select MONTHNAME("1998-02-05");
-> 'February'

#T=QUARTER(date) 返回date是一年的第几个季度
mysql> select QUARTER('98-04-01');
-> 2

#T=WEEK(date,first) 返回date是一年的第几周(first默认值0,first取值1表示周一是周的开始,0从周日开始)
mysql> select WEEK('1998-02-20');
-> 7
mysql> select WEEK('1998-02-20',0);
-> 7
mysql> select WEEK('1998-02-20',1);
-> 8

#T=YEAR(date) 返回date的年份(范围在1000到9999)
mysql> select YEAR('98-02-03');
-> 1998

#T=HOUR(time) 返回time的小时数(范围是0到23)
mysql> select HOUR('10:05:03');
-> 10

#T=MINUTE(time) 返回time的分钟数(范围是0到59)
mysql> select MINUTE('98-02-03 10:05:03');
-> 5

#T=SECOND(time) 返回time的秒数(范围是0到59)
mysql> select SECOND('10:05:03');
-> 3

#T=PERIOD_ADD(P,N) 增加N个月到时期P并返回(P的格式YYMM或YYYYMM)
mysql> select PERIOD_ADD(9801,2);
-> 199803

#T=PERIOD_DIFF(P1,P2) 返回在时期P1和P2之间月数(P1和P2的格式YYMM或YYYYMM)
mysql> select PERIOD_DIFF(9802,199703);
-> 11

#T=DATE_ADD(date,INTERVAL expr type)
#T=DATE_SUB(date,INTERVAL expr type)
#T=ADDDATE(date,INTERVAL expr type)
#T=SUBDATE(date,INTERVAL expr type) 对日期时间进行加减法运算
　(ADDDATE()和SUBDATE()是DATE_ADD()和DATE_SUB()的同义词,也可以用运算符+和-而不是函数
　date是一个DATETIME或DATE值,expr对date进行加减法的一个表达式字符串type指明表达式expr应该如何被解释
　[type值 含义 期望的expr格式]:
　SECOND 秒 SECONDS
　MINUTE 分钟 MINUTES
　HOUR 时间 HOURS
　DAY 天 DAYS
　MONTH 月 MONTHS
　YEAR 年 YEARS
　MINUTE_SECOND 分钟和秒 "MINUTES:SECONDS"
　HOUR_MINUTE 小时和分钟 "HOURS:MINUTES"
　DAY_HOUR 天和小时 "DAYS HOURS"
　YEAR_MONTH 年和月 "YEARS-MONTHS"
　HOUR_SECOND 小时, 分钟， "HOURS:MINUTES:SECONDS"
　DAY_MINUTE 天, 小时, 分钟 "DAYS HOURS:MINUTES"
　DAY_SECOND 天, 小时, 分钟, 秒 "DAYS HOURS:MINUTES:SECONDS"
　expr中允许任何标点做分隔符,如果所有是DATE值时结果是一个DATE值,否则结果是一个DATETIME值)
　如果type关键词不完整,则MySQL从右端取值,DAY_SECOND因为缺少小时分钟等于MINUTE_SECOND)
　如果增加MONTH、YEAR_MONTH或YEAR,天数大于结果月份的最大天数则使用最大天数)
mysql> SELECT "1997-12-31 23:59:59" + INTERVAL 1 SECOND;
-> 1998-01-01 00:00:00
mysql> SELECT INTERVAL 1 DAY + "1997-12-31";
-> 1998-01-01
mysql> SELECT "1998-01-01" - INTERVAL 1 SECOND;
-> 1997-12-31 23:59:59
mysql> SELECT DATE_ADD("1997-12-31 23:59:59",INTERVAL 1 SECOND);
-> 1998-01-01 00:00:00
mysql> SELECT DATE_ADD("1997-12-31 23:59:59",INTERVAL 1 DAY);
-> 1998-01-01 23:59:59
mysql> SELECT DATE_ADD("1997-12-31 23:59:59",INTERVAL "1:1" MINUTE_SECOND);
-> 1998-01-01 00:01:00
mysql> SELECT DATE_SUB("1998-01-01 00:00:00",INTERVAL "1 1:1:1" DAY_SECOND);
-> 1997-12-30 22:58:59
mysql> SELECT DATE_ADD("1998-01-01 00:00:00", INTERVAL "-1 10" DAY_HOUR);
-> 1997-12-30 14:00:00
mysql> SELECT DATE_SUB("1998-01-02", INTERVAL 31 DAY);
-> 1997-12-02
mysql> SELECT EXTRACT(YEAR FROM "1999-07-02");
-> 1999
mysql> SELECT EXTRACT(YEAR_MONTH FROM "1999-07-02 01:02:03");
-> 199907
mysql> SELECT EXTRACT(DAY_MINUTE FROM "1999-07-02 01:02:03");
-> 20102

#T=TO_DAYS(date) 返回日期date是西元0年至今多少天(不计算1582年以前)
mysql> select TO_DAYS(950501);
-> 728779
mysql> select TO_DAYS('1997-10-07');
-> 729669

#T=FROM_DAYS(N) 给出西元0年至今多少天返回DATE值(不计算1582年以前)
mysql> select FROM_DAYS(729669);
-> '1997-10-07'

#T=DATE_FORMAT(date,format) 根据format字符串格式化date值 (在format字符串中可用以下的标志符):
　%M 月名字(January……December)
　%W 星期名字(Sunday……Saturday)
　%D 有英语前缀的月份的日期(1st, 2nd, 3rd, 等等。）
　%Y 年, 数字, 4 位
　%y 年, 数字, 2 位
　%a 缩写的星期名字(Sun……Sat)
　%d 月份中的天数, 数字(00……31)
　%e 月份中的天数, 数字(0……31)
　%m 月, 数字(01……12)
　%c 月, 数字(1……12)
　%b 缩写的月份名字(Jan……Dec)
　%j 一年中的天数(001……366)
　%H 小时(00……23)
　%k 小时(0……23)
　%h 小时(01……12)
　%I 小时(01……12)
　%l 小时(1……12)
　%i 分钟, 数字(00……59)
　%r 时间,12 小时(hh:mm:ss [AP]M)
　%T 时间,24 小时(hh:mm:ss)
　%S 秒(00……59)
　%s 秒(00……59)
　%p AM或PM
　%w 一个星期中的天数(0=Sunday ……6=Saturday ）
　%U 星期(0……52), 这里星期天是星期的第一天
　%u 星期(0……52), 这里星期一是星期的第一天
　%% 字符% )
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%W %M %Y');
-> 'Saturday October 1997'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%H:%i:%s');
-> '22:23:00'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%D %y %a %d %m %b %j');
-> '4th 97 Sat 04 10 Oct 277'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%H %k %I %r %T %S %w');
-> '22 22 10 10:23:00 PM 22:23:00 00 6'

TIME_FORMAT(time,format)和DATE_FORMAT()类似,但TIME_FORMAT只处理小时、分钟和秒(其余符号产生一个NULL值或0)

#T=CURDATE()
#T=CURRENT_DATE() 以'YYYY-MM-DD'或YYYYMMDD格式返回当前日期值(根据返回值所处上下文是字符串或数字)
mysql> select CURDATE();
-> '1997-12-15'
mysql> select CURDATE() + 0;
-> 19971215

#T=CURTIME()
#T=CURRENT_TIME() 以'HH:MM:SS'或HHMMSS格式返回当前时间值(根据返回值所处上下文是字符串或数字)
mysql> select CURTIME();
-> '23:50:26'
mysql> select CURTIME() + 0;
-> 235026

#T=NOW()
#T=SYSDATE()
#T=CURRENT_TIMESTAMP() 以'YYYY-MM-DD HH:MM:SS'或YYYYMMDDHHMMSS格式返回当前日期时间(根据返回值所处上下文是字符串或数字)
mysql> select NOW();
-> '1997-12-15 23:50:26'
mysql> select NOW() + 0;
-> 19971215235026

#T=UNIX_TIMESTAMP()
#T=UNIX_TIMESTAMP(date) 返回一个Unix时间戳(从'1970-01-01 00:00:00'GMT开始的秒数,date默认值为当前时间)
mysql> select UNIX_TIMESTAMP();
-> 882226357
mysql> select UNIX_TIMESTAMP('1997-10-04 22:23:00');
-> 875996580

#T=FROM_UNIXTIME(unix_timestamp) 以'YYYY-MM-DD HH:MM:SS'或YYYYMMDDHHMMSS格式返回时间戳的值(根据返回值所处上下文是字符串或数字)
mysql> select FROM_UNIXTIME(875996580);
-> '1997-10-04 22:23:00'
mysql> select FROM_UNIXTIME(875996580) + 0;
-> 19971004222300

#T=FROM_UNIXTIME(unix_timestamp,format) 以format字符串格式返回时间戳的值
mysql> select FROM_UNIXTIME(UNIX_TIMESTAMP(),'%Y %D %M %h:%i:%s %x');
-> '1997 23rd December 03:43:30 x'

#T=SEC_TO_TIME(seconds) 以'HH:MM:SS'或HHMMSS格式返回秒数转成的TIME值(根据返回值所处上下文是字符串或数字)
mysql> select SEC_TO_TIME(2378);
-> '00:39:38'
mysql> select SEC_TO_TIME(2378) + 0;
-> 3938

#T=TIME_TO_SEC(time) 返回time值有多少秒
mysql> select TIME_TO_SEC('22:23:00');
-> 80580
mysql> select TIME_TO_SEC('00:39:38');
-> 2378

#
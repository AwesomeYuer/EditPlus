#TITLE=See7di.Mysql 4.0
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=�ַ�������
#T=����������������������
#T=ASCII(str) �����ַ���str�ĵ�һ���ַ���ASCIIֵ(str�ǿմ�ʱ����0)
mysql> select ASCII('2');
-> 50
mysql> select ASCII(2);
-> 50
mysql> select ASCII('dete');
-> 100

#T=ORD(str) ����ַ���str�����ǵ��ֽڷ�����ASCII()�������ص���ֵͬ�� �����һ�����ֽ��ַ�,�Ը�ʽ����((first byte ASCII code)*256+(second byte ASCII code))[*256+third byte ASCII code...]
mysql> select ORD('2');
-> 50

#T=CONV(N,from_base,to_base) ������N����ת��,��ת��Ϊ�ִ�����(�κβ���ΪNULLʱ����NULL,���Ʒ�ΧΪ2-36����,��to_base�Ǹ���ʱN��Ϊ�з������������޷�����,CONV��64λ�㾫�ȹ���)
mysql> select CONV("a",16,2);
-> '1010'
mysql> select CONV("6E",18,8);
-> '172'
mysql> select CONV(-17,10,-18);
-> '-H'
mysql> select CONV(10+"10"+'10'+0xa,10,10);
-> '40'

#T=BIN(N) ��NתΪ������ֵ�����ִ�����(N��BIGINT����,�ȼ���CONV(N,10,2))
mysql> select BIN(12);
-> '1100'

#T=OCT(N) ��NתΪ�˽���ֵ�����ִ�����(N��BIGINT����,�ȼ���CONV(N,10,8))
mysql> select OCT(12);
-> '14'

#T=HEX(N) ��NתΪʮ�����Ʋ����ִ�����(N��BIGINT����,�ȼ���CONV(N,10,16))
mysql> select HEX(255);
-> 'FF'

#T=CHAR(N,...) �����ɲ���N,...��Ӧ��ASCII�����ַ���ɵ�һ���ִ�(������N,...����������,NULLֵ������)
mysql> select CHAR(77,121,83,81,'76');
-> 'MySQL'
mysql> select CHAR(77,77.3,'77.3');
-> 'MMM'

#T=CONCAT(str1,str2,...) �Ѳ�������һ�����ַ���������(�κβ�����NULLʱ����NULL)
mysql> select CONCAT('My', 'S', 'QL');
-> 'MySQL'
mysql> select CONCAT('My', NULL, 'QL');
-> NULL
mysql> select CONCAT(14.3);
-> '14.3'

#T=LENGTH(str) �����ַ���str�ĳ���
#T=OCTET_LENGTH(str) �����ַ���str�ĳ���
mysql> select OCTET_LENGTH('text');
-> 4
#T=CHAR_LENGTH(str) �����ַ���str�ĳ���(���ڶ��ֽ��ַ�CHAR_LENGTH������һ��)
mysql> select LENGTH('text');
-> 4
#T=CHARACTER_LENGTH(str) �����ַ���str�ĳ���
#T=LOCATE(substr,str) �����ַ���substr���ַ���str��һ�γ��ֵ�λ��(str������substrʱ����0)
mysql> select LOCATE('bar', 'foobarbar');
-> 4
mysql> select LOCATE('xbar', 'foobar');
-> 0

LOCATE(substr,str,pos) �����ַ���substr���ַ���str�ĵ�pos��λ�����һ�γ��ֵ�λ��(str������substrʱ����0)
mysql> select LOCATE('bar', 'foobarbar',5);
-> 7

#T=POSITION(substr IN str) �����ַ���substr���ַ���str��һ�γ��ֵ�λ��(str������substrʱ����0)
#T=INSTR(str,substr) �����ַ���substr���ַ���str��һ�γ��ֵ�λ��(str������substrʱ����0)
mysql> select INSTR('foobarbar', 'bar');
-> 4
mysql> select INSTR('xbar', 'foobar');
-> 0

#T=LPAD(str,len,padstr) ���ַ���padstr�str���ֱ���ִ�����Ϊlen������
mysql> select LPAD('hi',4,'??');
-> '??hi'

#T=RPAD(str,len,padstr) ���ַ���padstr�str�Ҷ�ֱ���ִ�����Ϊlen������
mysql> select RPAD('hi',5,'?');
-> 'hi???'

#T=LEFT(str,len) �����ַ���str�����len���ַ�
mysql> select LEFT('foobarbar', 5);
-> 'fooba'

#T=RIGHT(str,len) �����ַ���str���Ҷ�len���ַ�
mysql> select RIGHT('foobarbar', 4);
-> 'rbar'

#T=SUBSTRING(str,pos,len) �����ַ���str��λ��pos��len���ַ�(ʹ��FROM�ĳ�ª�﷨��ANSI SQL92��׼)
#T=SUBSTRING(str FROM pos FOR len) �����ַ���str��λ��pos��len���ַ�(ʹ��FROM�ĳ�ª�﷨��ANSI SQL92��׼)
#T=MID(str,pos,len) �����ַ���str��λ��pos��len���ַ�(ʹ��FROM�ĳ�ª�﷨��ANSI SQL92��׼)
mysql> select SUBSTRING('Quadratically',5,6);
-> 'ratica'

#T=SUBSTRING(str,pos) �����ַ���str��λ��pos���һ���Ӵ�
#T=SUBSTRING(str FROM pos) �����ַ���str��λ��pos���һ���Ӵ�
mysql> select SUBSTRING('Quadratically',5);
-> 'ratically'
mysql> select SUBSTRING('foobarbar' FROM 4);
-> 'barbar'

#T=SUBSTRING_INDEX(str,delim,count) ���ش��ַ���str�ĵ�count�����ֵķָ���delim֮����Ӵ�(countΪ����ʱ�������,���򷵻��Ҷ��Ӵ�)
mysql> select SUBSTRING_INDEX('www.mysql.com', '.', 2);
-> 'www.mysql'
mysql> select SUBSTRING_INDEX('www.mysql.com', '.', -2);
-> 'mysql.com'

#T=LTRIM(str) ����ɾ������ո���ַ���str
mysql> select LTRIM('  barbar');
-> 'barbar'

#T=RTRIM(str) ����ɾ�����ҿո���ַ���str
mysql> select RTRIM('barbar   ');
-> 'barbar'

#T=TRIM([[BOTH | LEADING | TRAILING] [remstr] FROM] str) ����ǰ׺���׺remstr��ɾ���˵��ַ���str(λ�ò���Ĭ��BOTH,remstrĬ��ֵΪ�ո�)
mysql> select TRIM('  bar   ');
-> 'bar'
mysql> select TRIM(LEADING 'x' FROM 'xxxbarxxx');
-> 'barxxx'
mysql> select TRIM(BOTH 'x' FROM 'xxxbarxxx');
-> 'bar'
mysql> select TRIM(TRAILING 'xyz' FROM 'barxxyz');
-> 'barx'

#T=SOUNDEX(str) ����str��һ��ͬ���ַ���(��������������ͬ���ַ�������ͬ��ͬ���ַ���,��������ĸ�ַ�������,��A-Z�����ĸ������Ԫ��)
mysql> select SOUNDEX('Hello');
-> 'H400'
mysql> select SOUNDEX('Quadratically');
-> 'Q36324'

#T=SPACE(N) ������N���ո��ַ���ɵ�һ���ַ���
mysql> select SPACE(6);
-> '      '

#T=REPLACE(str,from_str,to_str) ���ַ���to_str�滻�ַ���str�е��Ӵ�from_str������
mysql> select REPLACE('www.mysql.com', 'w', 'Ww');
-> 'WwWwWw.mysql.com'

#T=REPEAT(str,count) ������count���ַ���str���ɵ�һ���ַ���(�κβ���ΪNULLʱ����NULL,count<=0ʱ����һ�����ַ���)
mysql> select REPEAT('MySQL', 3);
-> 'MySQLMySQLMySQL'

#T=REVERSE(str) �ߵ��ַ���str���ַ�˳�򲢷���
mysql> select REVERSE('abc');
-> 'cba'

#T=INSERT(str,pos,len,newstr) ���ַ���str��λ��pos��len���ַ������Ӵ��滻Ϊ�ַ���newstr������
mysql> select INSERT('Quadratic', 3, 4, 'What');
-> 'QuWhattic'

#T=ELT(N,str1,str2,str3,...) ���ص�N���ַ���(NС��1����ڲ�����������NULL)
mysql> select ELT(1, 'ej', 'Heja', 'hej', 'foo');
-> 'ej'
mysql> select ELT(4, 'ej', 'Heja', 'hej', 'foo');
-> 'foo'

#T=FIELD(str,str1,str2,str3,...) ����str�������ĵ�N���ַ��������(���strû�ҵ�����0)
mysql> select FIELD('ej', 'Hej', 'ej', 'Heja', 'hej', 'foo');
-> 2
mysql> select FIELD('fo', 'Hej', 'ej', 'Heja', 'hej', 'foo');
-> 0

#T=FIND_IN_SET(str,strlist) ����str���ַ�����strlist�е����(�κβ�����NULL�򷵻�NULL,���strû�ҵ�����0,����1����","ʱ�����쳣)
mysql> SELECT FIND_IN_SET('b','a,b,c,d');
-> 2

#T=MAKE_SET(bits,str1,str2,...) �Ѳ���1������תΪ������,����ĳ��λ�õĶ�����λ����1,��Ӧλ�õ��ִ�ѡ���ִ���������(NULL������ӵ������)
mysql> SELECT MAKE_SET(1,'a','b','c');
-> 'a'
mysql> SELECT MAKE_SET(1 | 4,'hello','nice','world');
-> 'hello,world'
mysql> SELECT MAKE_SET(0,'a','b','c');
-> ''

#T=EXPORT_SET(bits,on,off,[separator,[number_of_bits]]) ��bits�����ַ�����,ֻ�е�λ����1ʱ�����ִ�on,�������off(separatorĬ��ֵ",",number_of_bits����ʹ��ʱ���Ȳ��㲹0�������ض�)
mysql> select EXPORT_SET(5,'Y','N',',',4)
-> Y,N,Y,N

#T=LCASE(str)
#T=LOWER(str) ����Сд���ַ���str
mysql> select LCASE('QUADRATICALLY');
-> 'quadratically'

#T=UCASE(str)
#T=UPPER(str) ���ش�д���ַ���str
mysql> select UCASE('quadratically');
-> 'QUADRATICALLY'

#T=LOAD_FILE(file_name) �����ļ�������Ϊһ���ַ��������ļ�����(�ļ��޷��ҵ�,·��������,û��Ȩ��,���ȴ���max_allowed_packet�᷵��NULL)
mysql> UPDATE table_name SET blob_column=LOAD_FILE("/tmp/picture") WHERE id=1;
#T=

#T=��ѧ����
#T=����������������������
#T=ABS(N) ����N�ľ���ֵ
mysql> select ABS(2);
-> 2
mysql> select ABS(-32);
-> 32

#T=SIGN(N) ���ز����ķ���(Ϊ-1��0��1)
mysql> select SIGN(-32);
-> -1
mysql> select SIGN(0);
-> 0
mysql> select SIGN(234);
-> 1

#T=MOD(N,M) ȡģ����,����N��M��������(ͬ%������)
mysql> select MOD(234, 10);
-> 4
mysql> select 234 % 10;
-> 4
mysql> select MOD(29,9);
-> 2

#T=FLOOR(N) ���ز�����N���������ֵ
mysql> select FLOOR(1.23);
-> 1
mysql> select FLOOR(-1.23);
-> -2

#T=CEILING(N) ���ز�С��N����С����ֵ
mysql> select CEILING(1.23);
-> 2
mysql> select CEILING(-1.23);
-> -1

#T=ROUND(N,D) ����N����������ֵ,����DλС��(D��Ĭ��ֵΪ0)
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

#T=EXP(N) ����ֵe��N�η�(��Ȼ�����ĵ�)
mysql> select EXP(2);
-> 7.389056
mysql> select EXP(-2);
-> 0.135335

#T=LOG(N) ����N����Ȼ����
mysql> select LOG(2);
-> 0.693147
mysql> select LOG(-2);
-> NULL

#T=LOG10(N) ����N��10Ϊ�׵Ķ���
mysql> select LOG10(2);
-> 0.301030
mysql> select LOG10(100);
-> 2.000000
mysql> select LOG10(-100);
-> NULL

#T=POW(X,Y)
POWER(X,Y) ����ֵX��Y����
mysql> select POW(2,2);
-> 4.000000
mysql> select POW(2,-2);
-> 0.250000

#T=SQRT(N) ���طǸ���N��ƽ����
mysql> select SQRT(4);
-> 2.000000
mysql> select SQRT(20);
-> 4.472136

#T=PI() ����Բ����
mysql> select PI();
-> 3.141593

#T=COS(N) ����N������ֵ
mysql> select COS(PI());
-> -1.000000

#T=SIN(N) ����N������ֵ
mysql> select SIN(PI());
-> 0.000000

#T=TAN(N) ����N������ֵ
mysql> select TAN(PI()+1);
-> 1.557408

#T=ACOS(N) ����N������(N������ֵ,��-1��1�ķ�Χ,���򷵻�NULL)
mysql> select ACOS(1);
-> 0.000000
mysql> select ACOS(1.0001);
-> NULL
mysql> select ACOS(0);
-> 1.570796

#T=ASIN(N) ����N������ֵ
mysql> select ASIN(0.2);
-> 0.201358
mysql> select ASIN('foo');
-> 0.000000

#T=ATAN(N) ����N�ķ�����ֵ
mysql> select ATAN(2);
-> 1.107149
mysql> select ATAN(-2);
-> -1.107149

#T=ATAN2(X,Y) ����2������X��Y�ķ�����(����Y/X�ķ�����,���ž�������)
mysql> select ATAN(-2,2);
-> -0.785398
mysql> select ATAN(PI(),0);
-> 1.570796

#T=COT(N) ����X������
mysql> select COT(12);
-> -1.57267341
mysql> select COT(0);
-> NULL

#T=RAND()
#T=RAND(N) �����ڷ�Χ0��1.0�ڵ��������ֵ(����ʹ������N��Ϊ��ʼֵ)
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

#T=DEGREES(N) ��N�ӻ��ȱ任Ϊ�ǶȲ�����
mysql> select DEGREES(PI());
-> 180.000000

#T=RADIANS(N) ��N�ӽǶȱ任Ϊ���Ȳ�����
mysql> select RADIANS(90);
-> 1.570796

#T=TRUNCATE(N,D) ��������N��DλС��������
mysql> select TRUNCATE(1.223,1);
-> 1.2
mysql> select TRUNCATE(1.999,1);
-> 1.9
mysql> select TRUNCATE(1.999,0);
-> 1

#T=LEAST(X,Y,...) ������Сֵ(�������ֵ����������(ʵ�����С�����ִ�)�����Ļ����в�����������(ʵ�����С�����ִ�)��������Ϊ����(ʵ�����С�����ִ�)�Ƚ�,���򰴺��Դ�Сд���ַ������Ƚ�)
mysql> select LEAST(2,0);
-> 0
mysql> select LEAST(34.0,3.0,5.0,767.0);
-> 3.0
mysql> select LEAST("B","A","C");
-> "A"

#T=GREATEST(X,Y,...) �������ֵ(����ͬLEAST())
mysql> select GREATEST(2,0);
-> 2
mysql> select GREATEST(34.0,3.0,5.0,767.0);
-> 767.0
mysql> select GREATEST("B","A","C");
-> "C"
#T=

#T=ʱ��ʱ�亯��
#T=����������������������
#T=DAYOFWEEK(date) ��������date�����ڼ�(1=������,2=����һ,����7=������,ODBC��׼)
mysql> select DAYOFWEEK('1998-02-03');
-> 3

#T=WEEKDAY(date) ��������date�����ڼ�(0=����һ,1=���ڶ�,����6= ������)��
mysql> select WEEKDAY('1997-10-04 22:23:00');
-> 5
mysql> select WEEKDAY('1997-11-05');
-> 2

#T=DAYOFMONTH(date) ����date��һ���еĵڼ���(��1��31��Χ��)
mysql> select DAYOFMONTH('1998-02-03');
-> 3

#T=DAYOFYEAR(date) ����date��һ���еĵڼ���(��1��366��Χ��)
mysql> select DAYOFYEAR('1998-02-03');
-> 34

#T=MONTH(date) ����date�е��·���ֵ
mysql> select MONTH('1998-02-03');
-> 2

#T=DAYNAME(date) ����date�����ڼ�(��Ӣ��������)
mysql> select DAYNAME("1998-02-05");
-> 'Thursday'

#T=MONTHNAME(date) ����date�Ǽ���(��Ӣ��������)
mysql> select MONTHNAME("1998-02-05");
-> 'February'

#T=QUARTER(date) ����date��һ��ĵڼ�������
mysql> select QUARTER('98-04-01');
-> 2

#T=WEEK(date,first) ����date��һ��ĵڼ���(firstĬ��ֵ0,firstȡֵ1��ʾ��һ���ܵĿ�ʼ,0�����տ�ʼ)
mysql> select WEEK('1998-02-20');
-> 7
mysql> select WEEK('1998-02-20',0);
-> 7
mysql> select WEEK('1998-02-20',1);
-> 8

#T=YEAR(date) ����date�����(��Χ��1000��9999)
mysql> select YEAR('98-02-03');
-> 1998

#T=HOUR(time) ����time��Сʱ��(��Χ��0��23)
mysql> select HOUR('10:05:03');
-> 10

#T=MINUTE(time) ����time�ķ�����(��Χ��0��59)
mysql> select MINUTE('98-02-03 10:05:03');
-> 5

#T=SECOND(time) ����time������(��Χ��0��59)
mysql> select SECOND('10:05:03');
-> 3

#T=PERIOD_ADD(P,N) ����N���µ�ʱ��P������(P�ĸ�ʽYYMM��YYYYMM)
mysql> select PERIOD_ADD(9801,2);
-> 199803

#T=PERIOD_DIFF(P1,P2) ������ʱ��P1��P2֮������(P1��P2�ĸ�ʽYYMM��YYYYMM)
mysql> select PERIOD_DIFF(9802,199703);
-> 11

#T=DATE_ADD(date,INTERVAL expr type)
#T=DATE_SUB(date,INTERVAL expr type)
#T=ADDDATE(date,INTERVAL expr type)
#T=SUBDATE(date,INTERVAL expr type) ������ʱ����мӼ�������
��(ADDDATE()��SUBDATE()��DATE_ADD()��DATE_SUB()��ͬ���,Ҳ�����������+��-�����Ǻ���
��date��һ��DATETIME��DATEֵ,expr��date���мӼ�����һ�����ʽ�ַ���typeָ�����ʽexprӦ����α�����
��[typeֵ ���� ������expr��ʽ]:
��SECOND �� SECONDS
��MINUTE ���� MINUTES
��HOUR ʱ�� HOURS
��DAY �� DAYS
��MONTH �� MONTHS
��YEAR �� YEARS
��MINUTE_SECOND ���Ӻ��� "MINUTES:SECONDS"
��HOUR_MINUTE Сʱ�ͷ��� "HOURS:MINUTES"
��DAY_HOUR ���Сʱ "DAYS HOURS"
��YEAR_MONTH ����� "YEARS-MONTHS"
��HOUR_SECOND Сʱ, ���ӣ� "HOURS:MINUTES:SECONDS"
��DAY_MINUTE ��, Сʱ, ���� "DAYS HOURS:MINUTES"
��DAY_SECOND ��, Сʱ, ����, �� "DAYS HOURS:MINUTES:SECONDS"
��expr�������κα�����ָ���,���������DATEֵʱ�����һ��DATEֵ,��������һ��DATETIMEֵ)
�����type�ؼ��ʲ�����,��MySQL���Ҷ�ȡֵ,DAY_SECOND��Ϊȱ��Сʱ���ӵ���MINUTE_SECOND)
���������MONTH��YEAR_MONTH��YEAR,�������ڽ���·ݵ����������ʹ���������)
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

#T=TO_DAYS(date) ��������date����Ԫ0�����������(������1582����ǰ)
mysql> select TO_DAYS(950501);
-> 728779
mysql> select TO_DAYS('1997-10-07');
-> 729669

#T=FROM_DAYS(N) ������Ԫ0����������췵��DATEֵ(������1582����ǰ)
mysql> select FROM_DAYS(729669);
-> '1997-10-07'

#T=DATE_FORMAT(date,format) ����format�ַ�����ʽ��dateֵ (��format�ַ����п������µı�־��):
��%M ������(January����December)
��%W ��������(Sunday����Saturday)
��%D ��Ӣ��ǰ׺���·ݵ�����(1st, 2nd, 3rd, �ȵȡ���
��%Y ��, ����, 4 λ
��%y ��, ����, 2 λ
��%a ��д����������(Sun����Sat)
��%d �·��е�����, ����(00����31)
��%e �·��е�����, ����(0����31)
��%m ��, ����(01����12)
��%c ��, ����(1����12)
��%b ��д���·�����(Jan����Dec)
��%j һ���е�����(001����366)
��%H Сʱ(00����23)
��%k Сʱ(0����23)
��%h Сʱ(01����12)
��%I Сʱ(01����12)
��%l Сʱ(1����12)
��%i ����, ����(00����59)
��%r ʱ��,12 Сʱ(hh:mm:ss [AP]M)
��%T ʱ��,24 Сʱ(hh:mm:ss)
��%S ��(00����59)
��%s ��(00����59)
��%p AM��PM
��%w һ�������е�����(0=Sunday ����6=Saturday ��
��%U ����(0����52), ���������������ڵĵ�һ��
��%u ����(0����52), ��������һ�����ڵĵ�һ��
��%% �ַ�% )
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%W %M %Y');
-> 'Saturday October 1997'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%H:%i:%s');
-> '22:23:00'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%D %y %a %d %m %b %j');
-> '4th 97 Sat 04 10 Oct 277'
mysql> select DATE_FORMAT('1997-10-04 22:23:00','%H %k %I %r %T %S %w');
-> '22 22 10 10:23:00 PM 22:23:00 00 6'

TIME_FORMAT(time,format)��DATE_FORMAT()����,��TIME_FORMATֻ����Сʱ�����Ӻ���(������Ų���һ��NULLֵ��0)

#T=CURDATE()
#T=CURRENT_DATE() ��'YYYY-MM-DD'��YYYYMMDD��ʽ���ص�ǰ����ֵ(���ݷ���ֵ�������������ַ���������)
mysql> select CURDATE();
-> '1997-12-15'
mysql> select CURDATE() + 0;
-> 19971215

#T=CURTIME()
#T=CURRENT_TIME() ��'HH:MM:SS'��HHMMSS��ʽ���ص�ǰʱ��ֵ(���ݷ���ֵ�������������ַ���������)
mysql> select CURTIME();
-> '23:50:26'
mysql> select CURTIME() + 0;
-> 235026

#T=NOW()
#T=SYSDATE()
#T=CURRENT_TIMESTAMP() ��'YYYY-MM-DD HH:MM:SS'��YYYYMMDDHHMMSS��ʽ���ص�ǰ����ʱ��(���ݷ���ֵ�������������ַ���������)
mysql> select NOW();
-> '1997-12-15 23:50:26'
mysql> select NOW() + 0;
-> 19971215235026

#T=UNIX_TIMESTAMP()
#T=UNIX_TIMESTAMP(date) ����һ��Unixʱ���(��'1970-01-01 00:00:00'GMT��ʼ������,dateĬ��ֵΪ��ǰʱ��)
mysql> select UNIX_TIMESTAMP();
-> 882226357
mysql> select UNIX_TIMESTAMP('1997-10-04 22:23:00');
-> 875996580

#T=FROM_UNIXTIME(unix_timestamp) ��'YYYY-MM-DD HH:MM:SS'��YYYYMMDDHHMMSS��ʽ����ʱ�����ֵ(���ݷ���ֵ�������������ַ���������)
mysql> select FROM_UNIXTIME(875996580);
-> '1997-10-04 22:23:00'
mysql> select FROM_UNIXTIME(875996580) + 0;
-> 19971004222300

#T=FROM_UNIXTIME(unix_timestamp,format) ��format�ַ�����ʽ����ʱ�����ֵ
mysql> select FROM_UNIXTIME(UNIX_TIMESTAMP(),'%Y %D %M %h:%i:%s %x');
-> '1997 23rd December 03:43:30 x'

#T=SEC_TO_TIME(seconds) ��'HH:MM:SS'��HHMMSS��ʽ��������ת�ɵ�TIMEֵ(���ݷ���ֵ�������������ַ���������)
mysql> select SEC_TO_TIME(2378);
-> '00:39:38'
mysql> select SEC_TO_TIME(2378) + 0;
-> 3938

#T=TIME_TO_SEC(time) ����timeֵ�ж�����
mysql> select TIME_TO_SEC('22:23:00');
-> 80580
mysql> select TIME_TO_SEC('00:39:38');
-> 2378

#
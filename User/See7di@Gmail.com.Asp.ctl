#TITLE=See7di.������ (ASP)
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n

#T=Array(list)		'����һ���������.����:list Ϊ��������е�ÿ����ֵ��,�м��ö��ż��
#T=Cint(expression)	'��һ���ʽ/�������͵ı���ת������������(int).����:expression ���κ���Ч�ı��ʽ/�������͵ı���
#T=CreatObject(obname)	'����������һ��ActiveX����.����:obname �Ƕ��������
#T=Cstr(expression)	'��һ���ʽ/�������͵ı���ת�����ַ�����(string).����:expression���κ���Ч�ı��ʽ/�������͵ı���
#T=Date()		'���ص�ǰϵͳ(server��)������.����:��
#T=DateAdd(timeinterval,number,date)'����ĳ��ָ����ʱ���.����:timeinterval��ʱ�䵥λ(��,��..); number��ʱ����ֵ,date��ʱ��ʼ��
#T=DateDiff(timeinterval,date1,date2[,firstdayofweek[,firstdayofyear]])'����ĳ����ָ����ʱ���.����:timeinterval ��ʱ�䵥λ; date1,date2����Ч�����ڱ��ʽ,firstdayofweek,firstdayofyear ������ѡ��
#T=Day(date)		'����һ������ֵ,��Ӧ��ĳ�µ�ĳ��.����:date��һ����Ч�����ڱ��ʽ
#T=FormatCurrency(expression [,digit[,leadingdigit[,paren[,groupdigit]]]])'ת���ɻ��Ҹ�ʽ.����:expression ����Ч�����ֱ��ʽ;digit��ʾС������λ��;leadingdigit,paren,groupdigit������ѡ��
#T=FormatDateTime(date[,nameformat])'��ʽ�����ڱ��ʽ/����.����:dateΪ��Ч�����ڱ��ʽ/����;nameformat��ָ�������ڸ�ʽ��������
#T=FormatNumbe(expression [,digit[,leadingdigit[,paren[,groupdigit]]]])'��ʽ�����ֱ��ʽ/����.����:expressΪ��Ч�����ֱ��ʽ, digit��ʾС������λ��;leadingdigit,paren,groupdigit������ѡ��
#T=FormatNumber(expression [,digit [,leading [,paren[,groupdigit]]]])'��ʽ���ٷ������ʽ/����.����:expression ����Ч�����ֱ��ʽ,digit��ʾС������λ��;leadingdigit,paren,groupdigit������ѡ��
#T=Hour(time)		'����һ����ֵ,��Ӧ�ڵ�ָ��ʱ��.����:time��Ӧ�ڵ�ָ��ʱ��
#T=InStr([start,]strtobesearched,strsearchfor [,compare])'����һ����ֵ,��Ӧ��ĳ�ַ�(��)����һ�ַ����е�λ��.����:start(��ѡ)�Ǵӵ�startλѰ��,strtobesearched �Ǳ��������ַ���,strsearchfor�Ǳ�Ѱ�ҵ�Ŀ��.compare������ѡ��
#T=InStrrev([start,] strtobesearched,strsearchfor[,compare])'����һ����ֵ,��Ӧ��ĳ�ַ�(��)����һ�ַ����е�λ��(�Ӻ�����ʼѰ��).����:�ο� instr()
#T=Int(number)		'����ȡ��.����:number ���κ���Ч�����ֱ��ʽ/�������͵ı���
#T=IsArray(name)	'����һ������ֵ,�жϱ����Ƿ�Ϊ����.����:name�Ǳ�������
#T=IsDate(expression)	'����һ������ֵ,�жϱ����Ƿ�Ϊ���ڱ���.����:expression ������ı���
#T=IsEmpty(expression)	'����һ������ֵ,�жϱ����Ƿ�Ϊ��.����:expression ������ı���
#T=IsNull(expression)	'����һ������ֵ,�жϱ����Ƿ�����Ƿ�������.����:expression ������ı���
#T=IsNumeric(expression)'����һ������ֵ,�жϱ����Ƿ�Ϊ���ֱ���,�����ǿ���ת�������ֵ���������.����:expression ������ı���
#T=IsObject(expression)	'����һ������ֵ,�жϱ����Ƿ�Ϊ����ı���.����:expression ������ı���
#T=Lbound(arrayname[,dimension])'����һ��������½�.����:arrayname ���������,dimension ��������
#T=Lcase(string)	'��һ�ַ����ͱ������ַ�ȫ���任Сд�ַ�.����:string���ִ�����
#T=Left(string,length)	'��ȡһ���ַ�����ǰ����.����:string�ַ���,length��ȡ�ĳ���
#T=Len(string |varname)	'�����ַ������Ȼ��߱������ֽڳ���.����:string�ַ���;varname����ı�������
#T=Ltrim(string)	'ȥ���ַ���ǰ�Ŀո�.����:string �ִ�
#T=Minute(time)		'����һ��ֵ, ��ʾ����.����: time��ʱ�����
#T=Month(time)		'����һ��ֵ, ��ʾ�·�.����:time�����ڱ���
#T=Monthname(date [,abb])'�����·ݵ��ַ���(����).����:date�����ڱ���,abb=trueʱ ���·ݵ���д
#T=Now()		'����ϵͳ�ĵ�ǰʱ�������.����:��
#T=Replace(strtobesearched,strsearchfor,strreplacewith [,start[,count[,compare]]])'���ִ��в���,���ָ�����ִ�.����:strtobesearched���ִ�; strsearchfor�Ǳ����ҵ����ִ�;strreplacewith ��������������ִ�.start,count,compare ������ѡ��
#T=Right(string,length)'��ȡһ���ַ����ĺ󲿷�.����:string�ַ���,length��ȡ�ĳ���
#T=Rnd[(number)]	'����һ�������ֵ.����:number��������ֵ
#T=Round(expression[,numright])'������ֵ.����:expression���ֱ��ʽ;numright����ѡ��
#T=Rtrim(string)	'ȥ���ַ�����Ŀո�.����:string ���ִ�
#T=Second(time)		'����һ������ֵ.����:time��һ����Ч��ʱ����ʽ
#T=StrReverse(string)	'������ԭ�ִ�����������ִ�.����:string���ִ�
#
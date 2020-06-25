#TITLE=See7di.函数表 (ASP)
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n

#T=Array(list)		'创建一个数组变量.参数:list 为数组变量中的每个数值列,中间用逗号间隔
#T=Cint(expression)	'将一表达式/其它类型的变量转换成整数类型(int).参数:expression 是任何有效的表达式/其它类型的变量
#T=CreatObject(obname)	'创建及返回一个ActiveX对象.参数:obname 是对象的名称
#T=Cstr(expression)	'将一表达式/其它类型的变量转换成字符类型(string).参数:expression是任何有效的表达式/其它类型的变量
#T=Date()		'返回当前系统(server端)的日期.参数:无
#T=DateAdd(timeinterval,number,date)'计算某个指定的时间和.参数:timeinterval是时间单位(月,日..); number是时间间隔值,date是时间始点
#T=DateDiff(timeinterval,date1,date2[,firstdayofweek[,firstdayofyear]])'计算某量个指定的时间差.参数:timeinterval 是时间单位; date1,date2是有效的日期表达式,firstdayofweek,firstdayofyear 是任意选项
#T=Day(date)		'返回一个整数值,对应于某月的某日.参数:date是一个有效的日期表达式
#T=FormatCurrency(expression [,digit[,leadingdigit[,paren[,groupdigit]]]])'转换成货币格式.参数:expression 是有效的数字表达式;digit表示小数点后的位数;leadingdigit,paren,groupdigit是任意选项
#T=FormatDateTime(date[,nameformat])'格式化日期表达式/变量.参数:date为有效的日期表达式/变量;nameformat是指定的日期格式常量名称
#T=FormatNumbe(expression [,digit[,leadingdigit[,paren[,groupdigit]]]])'格式化数字表达式/变量.参数:express为有效的数字表达式, digit表示小数点后的位数;leadingdigit,paren,groupdigit是任意选项
#T=FormatNumber(expression [,digit [,leading [,paren[,groupdigit]]]])'格式化百分数表达式/变量.参数:expression 是有效的数字表达式,digit表示小数点后的位数;leadingdigit,paren,groupdigit是任意选项
#T=Hour(time)		'返回一个数值,对应于的指定时间.参数:time对应于的指定时间
#T=InStr([start,]strtobesearched,strsearchfor [,compare])'返回一个数值,对应于某字符(串)在另一字符串中的位置.参数:start(任选)是从第start位寻找,strtobesearched 是被搜索的字符串,strsearchfor是被寻找的目标.compare是任意选项
#T=InStrrev([start,] strtobesearched,strsearchfor[,compare])'返回一个数值,对应于某字符(串)在另一字符串中的位置(从后面起开始寻找).参数:参考 instr()
#T=Int(number)		'数字取整.参数:number 是任何有效的数字表达式/其它类型的变量
#T=IsArray(name)	'返回一个布尔值,判断变量是否为数组.参数:name是变量名称
#T=IsDate(expression)	'返回一个布尔值,判断变量是否为日期变量.参数:expression 是任意的变量
#T=IsEmpty(expression)	'返回一个布尔值,判断变量是否为空.参数:expression 是任意的变量
#T=IsNull(expression)	'返回一个布尔值,判断变量是否包含非法的数据.参数:expression 是任意的变量
#T=IsNumeric(expression)'返回一个布尔值,判断变量是否为数字变量,或者是可以转换成数字的其它变量.参数:expression 是任意的变量
#T=IsObject(expression)	'返回一个布尔值,判断变量是否为对象的变量.参数:expression 是任意的变量
#T=Lbound(arrayname[,dimension])'返回一个数组的下界.参数:arrayname 是数组变量,dimension 是任意项
#T=Lcase(string)	'将一字符类型变量的字符全部变换小写字符.参数:string是字串变量
#T=Left(string,length)	'截取一个字符串的前部分.参数:string字符串,length截取的长度
#T=Len(string |varname)	'返回字符串长度或者变量的字节长度.参数:string字符串;varname任意的变量名称
#T=Ltrim(string)	'去掉字符串前的空格.参数:string 字串
#T=Minute(time)		'返回一数值, 表示分钟.参数: time是时间变量
#T=Month(time)		'返回一数值, 表示月份.参数:time是日期变量
#T=Monthname(date [,abb])'返回月份的字符串(名称).参数:date是日期变量,abb=true时 则月份的缩写
#T=Now()		'返回系统的当前时间和日期.参数:无
#T=Replace(strtobesearched,strsearchfor,strreplacewith [,start[,count[,compare]]])'在字串中查找,替代指定的字串.参数:strtobesearched是字串; strsearchfor是被查找的子字串;strreplacewith 是用来替代的子字串.start,count,compare 是任意选项
#T=Right(string,length)'截取一个字符串的后部分.参数:string字符串,length截取的长度
#T=Rnd[(number)]	'返回一个随机数值.参数:number是任意数值
#T=Round(expression[,numright])'完整数值.参数:expression数字表达式;numright任意选项
#T=Rtrim(string)	'去掉字符串后的空格.参数:string 是字串
#T=Second(time)		'返回一个整数值.参数:time是一个有效的时间表达式
#T=StrReverse(string)	'返回与原字串排列逆向的字串.参数:string是字串
#
#TITLE=80.命令行
#INFO
New Cliptext library
#SORT=n

#T=AppCmd IIS
rem AppCmdLine www.microshaoft.local .\WebAppUser !@#123QWE 9000 d:\temp10\
set _AppPool_=%1.AppPool
set _Site_=%1
set _AppPoolUser_=%2
set _AppPoolPassword_=%3
set _HttpPort_=%4
set _PhysicalRootPath_=%5
%windir%\system32\inetsrv\appcmd.exe delete site "%_Site_%"
%windir%\system32\inetsrv\appcmd.exe delete apppool "%_AppPool_%"
echo deleted!
pause
%windir%\system32\inetsrv\appcmd.exe add apppool /name:"%_AppPool_%" /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated
%windir%\system32\inetsrv\appcmd.exe set config /section:applicationPools /[name='%_AppPool_%'].processModel.identityType:SpecificUser /[name='%_AppPool_%'].processModel.userName:%_AppPoolUser_% /[name='%_AppPool_%'].processModel.password:%_AppPoolPassword_%
%windir%\system32\inetsrv\appcmd.exe add site /name:"%1" /bindings:http://*:%_HttpPort_% /physicalpath:"%_PhysicalRootPath_%%_Site_%"
%windir%\system32\inetsrv\appcmd.exe set app "%_Site_%/" /applicationPool:"%_AppPool_%"
echo added!
pause
%windir%\system32\inetsrv\appcmd.exe set config "%_Site_%" -section:system.webServer/security/authentication/anonymousAuthentication /enabled:"False" /commit:apphost
%windir%\system32\inetsrv\appcmd.exe set config "%_Site_%" -section:system.webServer/security/authentication/windowsAuthentication /enabled:"True" /commit:apphost
#T=Assembly ImageRuntimeVersion PS
[System.Reflection.Assembly]::LoadFrom('C:\Users\xiyueyu\Desktop\EasyPerformanceCounterHelper.dll').ImageRuntimeVersion
#T=CHM 无法打开 reg
REGEDIT4 
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\HTMLHelp] 

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\HTMLHelp\1.x\HHRestrictions] 
"MaxAllowedZone"=dword:00000003

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\HTMLHelp\1.x\ItssRestrictions] 
"MaxAllowedZone"=dword:00000003
#T=CMD命令速查手册 生成
:: CMDHelp.cmd - Gather commands' help of CMD to HTML
:: Author: junluck
:: Modify 4: Will Sort - 2006-01-15 - CMD@WinXP
:: 发表于：http://www.cn-dos.net/forum/viewthread.php?tid=18321
@echo off & setlocal EnableDelayedExpansion
echo.========================================
echo 开始创建《CMD命令速查手册》，请稍候……
echo 创建网页文件头……
>CMDHelp.htm echo ^<head^>
>>CMDHelp.htm echo     ^<title^>CMD命令速查手册^</title^> 
>>CMDHelp.htm echo     ^<meta http-equiv="Content-Type" content="text/html^; charset=gb2312" ^/^>
>>CMDHelp.htm echo ^</head^> 
>>CMDHelp.htm echo ^<A NAME="Top"^>
>>CMDHelp.htm echo ^<center^>^<h1^>CMD 命令速查手册^</h1^>%username% - %date%^</center^>^<br^>
>>CMDHelp.htm echo ^<table^>

echo 创建帮助目录……
for /f "delims=:" %%f in ('help^|findstr /n "^ASSOC"') do set head=%%f
set /a head-=1
if "%head%"=="0" (set head=) else set head=skip=%head%
for /f "%head% delims=" %%i in ('help') do (
    set str=%%i & set name=!str:~0,9! & set desc=!str:~9!
    echo.!name! | findstr /v "^[A-Z]" >nul && echo !desc! >>CMDHelp.htm
    if errorlevel 1 echo ^</td^>^</tr^>^<tr^>^<td^>^<a href="#!name!"^>!name!^</a^>^</td^>^<td^>^ ^ ^ !desc!>>CMDHelp.htm
) 
>>CMDHelp.htm echo ^</td^>^</tr^>^</table^>^<br^>^<a href="#top"^>返回页首^</a^>^<br^>

echo 创建帮助正文……
::将默认的脚本宿主改为 cScript.exe,不知还有没有更好的办法
cscript //h:cscript //b
::因为有一些命令需要使用cscript来启动
for /f  %%i in ('help^|findstr "^[A-Z]"') do ( 
    >>CMDHelp.htm echo ^<a name="%%i"^>^<h2^>%%i^</h2^>^<pre^>
    echo 正在创建 %%i 的帮助正文中……
    if /I "%%i"=="SC" echo 请按Y键继续……
    help %%i | findstr "<.*>" >nul
    if not errorlevel 1 (
         for /f "delims=" %%a in ('help %%i') do (
                set st=%%a & set st=!st:^<=^&lt;! & set st=!st:^>=^&gt;!
                echo !st!>> CMDHelp.htm
            )
        ) else help %%i>>CMDHelp.htm 
        >>CMDHelp.htm echo ^</pre^>^<a href="#top"^>返回页首^</a^>^<br^>^<br^>
    )


echo 《CMD命令速查手册》创建完毕，任意键打开
echo.========================================
pause>nul && start CMDHelp.htm 
#T=curl post json
rem curl Post Json
D:\curl\curl-7.33.0-win64\bin\curl.exe -i -X POST -H "Accept: application/json" -H "Content-Type: application/json; charset=utf-8" -d "[{Name:'curl',\"Age\":0,'Height':1,'Weight':2},{'Name':\"curl2\",'Age':0,'Height':1,'Weight':2}]" "http://api.asp.net.local/services/restful/api/persons/" -v

#T=dir /S /B
dir /S /B
#T=dsquery  acl 创建本人完全权限,其他人只读的目录
rem 创建本人完全权限,其他人只读的目录
for /f "tokens=1,2,3" %j in ('net user /domain') do (for /f %i in ('\\server1\script\dsquery user -samid %j -o rdn') do md "\\server1\share\%j%i" && cacls \\server1\share\%j%i /t /e /g hhsj\%j:f & for /f %i in ('\\server1\script\dsquery user -samid %k -o rdn') do md "\\server1\share\%k%i" && cacls \\server1\share\%k%i /t /e /g hhsj\%k:f & for /f %i in ('\\server1\script\dsquery user -samid %l -o rdn') do md "\\server1\share\%l%i" && cacls \\server1\share\%l%i /t /e /g hhsj\%l:f)

#T=eclipse 技巧及快捷键
eclipse 技巧及快捷键(转发)
技巧：取消自动validation
validation有一堆，什么xml、jsp、jsf、js等等，我们没有必要全部都去自动校验一下，只是需要的时候才会手工校验一下，速度立马提升好几个档次！
取消方法： windows-->perferences-->myeclipse-->validation 除开Manual下面的复选框全部选中之外，其他全部不选手工验证方法：
       在要验证的文件上，单击鼠标右键-->myeclipse-->run validation
程序代码自动排版：Ctrl+Shift+F，会自动把代码进行格式化的排版，非常方便
快速执行程序：Ctrl + F11第一次执行时，它会询问您执行模式，设置好后，以后只要按这个热键，它就会快速执行.
Ctrl+Shift+/ 加上段注释/**/
Ctrl+Shift+\ 取消段注释/**/
Ctrl+/ 加上行注释或取消行注释
自动汇入所需要的类别：Ctrl+Shift+M Ctrl+Shift+O  好象使用Ctrl+Shift+O  也可以
重要技巧
Eclipse中默认是输入"."后出现自动提示，用于类成员的自动提示，可是有时候我们希望它能在我们输入类的首字母后就出现自动提示，可以节省大量的输入时间(虽然按alt + /会出现提示，但还是要多按一次按键，太麻烦了).
从Window -> preferences -> Java -> Editor -> Content assist -> Auto-Activation下，我们可以在"."号后面加入我们需要自动提示的首字幕，比如"ahiz".
然后我们回到Eclipse的开发环境，输入"a"，提示就出现了.
但是我们可以发现，这个Auto-Activation下的输入框里最多只能输入5个字母，也许是Eclipse的开发人员担心我们输入的太多会影响性能，但计算机的性能不用白不用，所以我们要打破这个限制.
其实上面都是铺垫，制造一下气氛，以显得我们下面要做的事情很牛似的，其实不然，一切都很简单.嘿嘿 :)
在"."后面随便输入几个字符，比如"abij"，然后回到开发环境，File -> export -> general -> preferences -> 选一个地方保存你的首选项，比如C:\a.epf
用任何文本编辑器打开a.epf，查找字符串“abij”，找到以后，替换成“abcdefghijklmnopqrstuvwxyz”，总之就是你想怎样就怎样！！然后回到Eclipse，File -> import -> general -> preferences -> 导入刚才的a.epf文件.此时你会发现输入任何字幕都可以得到自动提示了.爽！！！
最后：自动提示弹出的时间最好改成100毫秒以下，这样会比较爽一点，不然你都完事了，自动提示才弹出来:)，不过也要看机器性能.

myeclipse自动提示背景颜色设置
window--preference--java--editor- completion proposals Background 颜色推荐85，90，205

Eclipse 常用快捷键
Eclipse的编辑功能非常强大，掌握了Eclipse快捷键功能，能够大大提高开发效率。Eclipse中有如下一些和编辑相关的快捷键。
  1. 【ALT+/】
  此快捷键为用户编辑的好帮手，能为用户提供内容的辅助，不要为记不全方法和属性名称犯愁，当记不全类、方法和属性的名字时，多体验一下【ALT+/】快捷键带来的好处吧。
  2. 【Ctrl+O】
  显示类中方法和属性的大纲，能快速定位类的方法和属性，在查找Bug时非常有用。
  3. 【Ctrl+/】
  快速添加注释，能为光标所在行或所选定行快速添加注释或取消注释，在调试的时候可能总会需要注释一些东西或取消注释，现在好了，不需要每行进行重复的注释。
  4. 【Ctrl+D】
  删除当前行，这也是笔者的最爱之一，不用为删除一行而按那么多次的删除键。
  5. 【Ctrl+M】
  窗口最大化和还原，用户在窗口中进行操作时，总会觉得当前窗口小（尤其在编写代码时），现在好了，试试【Ctrl+M】快捷键。
  查看和定位快捷键
  在程序中，迅速定位代码的位置，快速找到Bug的所在，是非常不容易的事，Eclipse提供了强大的查找功能，可以利用如下的快捷键帮助完成查找定位的工作。
  1. 【Ctrl+K】、【Ctrl++Shift+K】
  快速向下和向上查找选定的内容，从此不再需要用鼠标单击查找对话框了。
  2. 【Ctrl+Shift+T】
  查找工作空间（Workspace）构建路径中的可找到Java类文件，不要为找不到类而痛苦，而且可以使用“*”、“？”等通配符。
  3. 【Ctrl+Shift+R】
  和【Ctrl+Shift+T】对应，查找工作空间（Workspace）中的所有文件（包括Java文件），也可以使用通配符。
  4. 【Ctrl+Shift+G】
  查找类、方法和属性的引用。这是一个非常实用的快捷键，例如要修改引用某个方法的代码，可以通过【Ctrl+Shift+G】快捷键迅速定位所有引用此方法的位置。
  5. 【Ctrl+Shift+O】
快速生成import，当从网上拷贝一段程序后，不知道如何import进所调用的类，试试【Ctrl+Shift+O】快捷键，一定会有惊喜。
  6. 【Ctrl+Shift+F】
  格式化代码，书写格式规范的代码是每一个程序员的必修之课，当看见某段代码极不顺眼时，选定后按【Ctrl+Shift+F】快捷键可以格式化这段代码，如果不选定代码则默认格式化当前文件（Java文件）。
  7. 【ALT+Shift+W】
  查找当前文件所在项目中的路径，可以快速定位浏览器视图的位置，如果想查找某个文件所在的包时，此快捷键非常有用（特别在比较大的项目中）。
  8. 【Ctrl+L】
  定位到当前编辑器的某一行，对非Java文件也有效。
  9. 【Alt+←】、【Alt+→】
  后退历史记录和前进历史记录，在跟踪代码时非常有用，用户可能查找了几个有关联的地方，但可能记不清楚了，可以通过这两个快捷键定位查找的顺序。
  10. 【F3】
快速定位光标位置的某个类、方法和属性。
  11. 【F4】
  显示类的继承关系，并打开类继承视图。
  调试快捷键
  Eclipse中有如下一些和运行调试相关的快捷键。
  1. 【Ctrl+Shift+B】：在当前行设置断点或取消设置的断点。
  2. 【F11】：调试最后一次执行的程序。
  3. 【Ctrl+F11】：运行最后一次执行的程序。
  4. 【F5】：跟踪到方法中，当程序执行到某方法时，可以按【F5】键跟踪到方法中。
  5. 【F6】：单步执行程序。
  6. 【F7】：执行完方法，返回到调用此方法的后一条语句。
  7. 【F8】：继续执行，到下一个断点或程序结束。
  常用编辑器快捷键
  通常文本编辑器都提供了一些和编辑相关的快捷键，在Eclipse中也可以通过这些快捷键进行文本编辑。
  1. 【Ctrl+C】：复制。
  2. 【Ctrl+X】：剪切。
  3. 【Ctrl+V】：粘贴。
  4. 【Ctrl+S】：保存文件。
  5. 【Ctrl+Z】：撤销。
  6. 【Ctrl+Y】：重复。
  7. 【Ctrl+F】：查找。
  其他快捷键
  Eclipse中还有很多快捷键，无法一一列举，用户可以通过帮助文档找到它们的使用方式，另外还有几个常用的快捷键如下。
  1. 【Ctrl+F6】：切换到下一个编辑器。
  2. 【Ctrl+Shift+F6】：切换到上一个编辑器。
  3. 【Ctrl+F7】：切换到下一个视图。
  4. 【Ctrl+Shift+F7】：切换到上一个视图。
  5. 【Ctrl+F8】：切换到下一个透视图。
  6. 【Ctrl+Shift+F8】：切换到上一个透视图。
  Eclipse中快捷键比较多，可以通过帮助文档找到所有快捷键的使用，但要掌握所有快捷键的使用是不可能的，也没有必要，如果花点时间熟悉本节列举的快捷键，必将会事半功倍

1. edit->content Assist - >  add      Alt+/  代码关联
2. Window -> Next Editor -> add    Ctrl+Tab 切换窗口
3. Run/Debug Toggle Line Breakpoint -> add Ctrl+` 在调试的时候 增删断点
4. Source-> Surround with try/catch Block -> Ctrl+Shift+v  增加try catch 框框
5. Source -> Generate Getters and Setters -> Ctrl+Shift+. 增加get set 方法

-----------有用的快捷键-----------
Alt+/ 代码助手完成一些代码的插入(但一般和输入法有冲突,可以修改输入法的热键,也可以暂用Alt+/来代替)
Ctrl+1:光标停在某变量上，按Ctrl+1键，可以提供快速重构方案。选中若干行，按Ctrl+1键可将此段代码放入for、while、if、do或try等代码块中。
双击左括号（小括号、中括号、大括号），将选择括号内的所有内容。
Alt+Enter 显示当前选择资源(工程,or 文件 or文件)的属性
-----------Ctrl系列-----------
Ctrl+K:将光标停留在变量上，按Ctrl+K键可以查找到下一个同样的变量
Ctrl+Shift+K:和Ctrl+K查找的方向相反
Ctrl+E 快速显示当前Editer的下拉列表(如果当前页面没有显示的用黑体表示)
Ctrl+Shift+E 显示管理当前打开的所有的View的管理器(可以选择关闭,激活等操作)
Ctrl+Q 定位到最后编辑的地方
Ctrl+L 定位在某行 (对于程序超过100的人就有福音了)
Ctrl+M 最大化当前的Edit或View (再按则反之)
Ctrl+/ 注释当前行,再按则取消注释
Ctrl+T 快速显示当前类的继承结构
Ctrl+Shift-T: 打开类型（Open type）。如果你不是有意磨洋工，还是忘记通过源码树（source tree）打开的方式吧。
Ctrl+O:在代码中打开类似大纲视图的小窗口
Ctrl+鼠标停留:可以显示类和方法的源码
Ctrl+H:打开搜索窗口
Ctrl+/(小键盘) 折叠当前类中的所有代码
Ctrl+×(小键盘) 展开当前类中的所有代码
-----------Ctrl+Shift 系列-----------
Ctrl+Shift+F 格式化当前代码
Ctrl+Shift+X 把当前选中的文本全部变味小写
Ctrl+Shift+Y 把当前选中的文本全部变为小写
Ctrl+Shift+O:快速地导入import
Ctrl+Shift+R:打开资源 open Resource
-----------F快捷键 系列-----------
F3:打开声明该引用的文件
F4:打开类型层次结构
F5:单步跳入
F6:单步跳过
F7:单步跳出
F8:继续，如果后面没有断点，程序将运行完
-----------行编辑用-----------
Ctrl+D: 删除当前行
Ctrl+Alt+↓ 复制当前行到下一行(复制增加)
Ctrl+Alt+↑ 复制当前行到上一行(复制增加)
Alt+↓ 当前行和下面一行交互位置(特别实用,可以省去先剪切,再粘贴了)
Alt+↑ 当前行和上面一行交互位置(同上)
Shift+Enter 在当前行的下一行插入空行(这时鼠标可以在当前行的任一位置,不一定是最后)
Ctrl+Shift+Enter 在当前行插入空行(原理同上条)
-----------不常用的-----------
Alt+← 前一个编辑的页面
Alt+→ 下一个编辑的页面(当然是针对上面那条来说了)
Ctrl+Shift+S:保存全部
Ctrl+W 关闭当前Editer
Ctrl+Shift+F4 关闭所有打开的Editer
Ctrl+Shift+G: 在workspace中搜索引用
Ctrl+Shift+P 定位到对于的匹配符(譬如{}) (从前面定位后面时,光标要在匹配符里面,后面到前面,则反之)
-----------不明白-----------
Ctrl+J 正向增量查找(按下Ctrl+J后,你所输入的每个字母编辑器都提供快速匹配定位到某个单词,如果没有,则在stutes line中显示没有找到了,查一个单词时,特别实用,这个功能Idea两年前就有了)
Ctrl+Shift+J 反向增量查找(和上条相同,只不过是从后往前查)
#T=editplus expire datediff 1998-01-01
@echo off & setlocal ENABLEEXTENSIONS
echo EditPlus 过期处理
for /f "tokens=1-3 delims=-/. " %%j in ('Date /T') do set y=%%j&set m=%%k&set d=%%l
call :DateToDays %y% %m% %d% days1
rem echo %y% %m% %d% %days%
call :DateToDays 1998 01 01 days2
set /a days=%days1%-%days2%
echo/%days%
rem EditPlus v3.12(b531)
REG ADD "HKCU\Software\ES-Computing\EditPlus 3" /v Install /t REG_DWORD /d %days% /f
rem EditPlus v3.11(b463)
REG ADD "HKCU\Software\ES-Computing\EditPlus 3\Install" /v Install /t REG_DWORD /d %days% /f
endlocal
goto :EOF

:DateToDays %yy% %mm% %dd% days
setlocal ENABLEEXTENSIONS
set yy=%1&set mm=%2&set dd=%3
if 1%yy% LSS 200 if 1%yy% LSS 170 (set yy=20%yy%) else (set yy=19%yy%)
set /a dd=100%dd%%%100,mm=100%mm%%%100
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF
#T=editplus 右键菜单
reg add HKCR\*\shell\EditPlus\Command /ve /t REG_SZ /d "d:\editplus\editplus.exe %%1" /f
#T=eventcreate
eventcreate /t error /id 100 /l application /d "Create event in application log" 
eventcreate /t information /id 1000 /so winmgmt /d "Create event in WinMgmt source" 
eventcreate /t error /id 2001 /so winword /l application /d "new src Winword in application log" 
eventcreate /s server /t error /id 100 /l application /d "Remote machine without user credentials" 
eventcreate /s server /u user /p password /id 100 /t error /l application /d "Remote machine with user credentials" 
eventcreate /s server1 /s server2 /u user /p password /id 100 /t error /so winmgmt /d "Creating events on Multiple remote machines" 
eventcreate /s server /u user /id 100 /t warning /so winmgmt /d "Remote machine with partial user credentials"
#T=eventLog PowerShell
new-eventlog -LogName MicroshaoftLog -Source MicroshaoftSource
write-eventlog -LogName MicroshaoftLog -Message "This is a test message" -Source MicroshaoftSource -id 1001 -EntryType error
write-eventlog -LogName MicroshaoftLog -Message "This is a test message" -Source MicroshaoftSource -id 1001 -EntryType err
write-eventlog -LogName MicroshaoftLog -Message "This is a test message" -Source MicroshaoftSource -id 1001 -EntryType e
remove-eventlog -Source MicroshaoftSource
remove-eventlog -LogName MicroshaoftLog
#T=FindStr
1.findstr . 2.txt 或 Findstr "." 2.txt  
从文件2.txt中查找任意字符，不包括空字符或空行
====================


2.findstr .* 2.txt 或 findstr ".*" 2.txt
从文件2.txt中查找任意字符包括空行和空字符
====================


3.findstr "[0-9]" 2.txt
从文件2.txt中查找包括数字0－9的字符串或行
====================


4.findstr "[a-zA-Z]" 2.txt
从文件2.txt中查找包括任意字符的字符串或行
====================


5.findstr "[abcezy]" 2.txt
从文件2.txt中查找包括a b c e z y字母的字符串或行
====================


6.findstr "[a-fl-z]" 2.txt
从文件2.txt中查找小写字符a-f l-z的字符串，但不包含g h I j k这几个字母。
====================


7.findstr "M[abc][hig]Y" 2.txt
从文件2.txt中可以匹配 MahY , MbiY, MahY等…..
====================


8. ^和$符号的应用
^ 表示行首，"^step"仅匹配 "step hello world"中的第一个单词
$ 表示行尾，"step$"仅匹配 "hello world step"中最后一个单词
====================


9.findstr "[^0-9]" 2.txt
如果是纯数字的字符串或者行便过滤掉，例如2323423423 这样的字符串，如果是345hh888这样的形式就不成了。
====================


10.findstr "[^a-z]" 2.txt
同上，如果是纯字母的字符串或者行便过滤掉，例如 sdlfjlkjlksjdklfjlskdf这样的字符，如果是sdfksjdkf99999这样的形式，掺杂着数字就不成了
====================


11.*号的作用
前面已经说过了 ".*"表示搜索的条件是任意字符，*号在正则表达式中的作用不是任何字符，而是表示左侧字符或者表达式的重复次数，*号表示重复的次数为零次或者多次。
====================


12.findstr "^[0-9]*$" 2.txt
这个是匹配找到的纯数字，例如 234234234234，如果是2133234kkjl234就被过滤掉了。
   Findstr "^[a-z]*$" 2.txt
这个是匹配找到的纯字母，例如 sdfsdfsdfsdf，如果是213sldjfkljsdlk就被过滤掉了
如果在搜索条件里没有*号，也就是说不重复左侧的搜索条件，也就是[0-9] [a-z]那只能匹配字符串的第一个字符也只有这一个字符，因为有行首和行尾的限制，"^[0-9]$"第一个字符如果是数字就匹配，如果不是就过滤掉，如果字符串是 9 就匹配，如果是98或者9j之类的就不可以了。
=====================


13. "\<…\>"这个表达式的作用
这个表示精确查找一个字符串，\<sss 表示字的开始位置，sss\>表示字的结束位置
echo hello world computer|findstr "\<computer\>"这样的形式
echo hello worldcomputer|findstr "\<computer\>" 这样的形式就不成了，他要找的是 "computer"这个字符串，所以不可以。
echo hello worldcomputer|findstr ".*computer\>"这样就可以匹配了
#T=forfiles 删除 N 天前最后修改的文件
@echo off
setlocal ENABLEDELAYEDEXPANSION
set _daysOffset_=-1
For /f "tokens=1,* delims=	" %%i in (RootsDirectorysListForFilesDelete.txt) do (
	set _directory_=%%i
	set _file_=%%j
	echo [!_directory_!] [!_file_!]
	if exist !_directory_! (
			rem echo FORFILES /P  !_directory_! /S /D %_daysOffset_% /M !_file_! /C "cmd /c echo @path" 2>nul
			FORFILES /P  !_directory_! /S /D %_daysOffset_% /M "!_file_!" /C "cmd /c echo @path" 2>nul
	)
)
endlocal

#T=FTP 远程下载备份
@echo off
echo ********====================================================== 
echo ********====================================================== 
echo ++++++++    批处理功能： 远程数据FTP备份到本地
echo ++++++++    Date:    %Date:~0,4%-%Date:~5,2%-%Date:~8,2% 
echo ++++++++    Author:    zc_0101                 
echo ++++++++    Blog:    www.cnblogs.com/zc_0101
echo ++++++++    Email:    zc_0101@163.com
echo ++++++++    QQ：    275374095
echo ++++++++    Mark:
echo ++++++++        请严格按照参数说明定义参数，输入参数
echo ++++++++        请尽量常规化，不要带特殊字符包括空格
echo ++++++++        如果文件已存在则跳过，不支持短点续传
echo ++++++++        不检测备份数据完整性，用户可自行修改
echo ++++++++    PS:    转载请注明出处(^_^),谢谢！
echo ********====================================================== 
echo ********====================================================== 
pause

Rem 远程IP(请保证开启Server_U)
Set Remote_IP=192.168.1.1

Rem 远程登录用户名
Set Remote_User=admin

Rem 远程登录密码
Set Remote_Pwd=admin

Rem 远程操作目录,如果是根目录，请填写".."(无双引号),否则直接填写目录名,如Databaseback
set Remote_Path=Databaseback

Rem 远程要下载的目录列表(注意仅下载这些父目录下的文件，不会下载子目录下的文件)，请用逗号隔开,如果没有子目录，请什么也不要填写(包括空格)
Set Remote_Directory=a,b

Rem 本地备份目录，请填写一个已存在的目录(本程序将会自动在该目录下创建和远程服务器上同样的子目录,请务必带上"\"斜杠)
Set Local_Path=D:\DBBack\

Rem 操作日志和临时文件存放路径(请务必带上"\"斜杠)
Set Log_Path=D:\

Rem 取得当前日期，作为日志文件名称,本例为日志存放目录加当日日期
set today=%Log_Path%%Date:~0,4%-%Date:~5,2%-%Date:~8,2%-%Time:~0,2%%Time:~3,2%%Time:~6,2%.txt

echo 正在对您输入的参数进行基本检测…………
echo 正在检测输入参数…………>%today%
if "%Remote_IP%" EQU "" (
    echo 远程IP不能为空！请返回为Remote_IP赋值
    echo 远程IP为空，程序退出。>>%today%
    pause
    exit
)
if "%Remote_User%" EQU "" (
    echo 远程登录名不能为空！请返回为Remote_User赋值
    echo 远程登录名为空，程序退出。>>%today%
    pause
    exit
)
if "%Remote_Pwd%" EQU "" (
    echo 远程登录密码不能为空！请返回为Remote_Pwd赋值
    echo 远程登录密码为空，程序退出。>>%today%
    pause
    exit
)
if "%Remote_Path%" EQU "" (
    echo 远程操作目录不能为空！请返回为Remote_Path赋值,如果是对根目录操作，请输入^(点点^)，即".."
    echo 远程操作目录为空，程序退出。>>%today%
    pause
    exit
)
if "%Remote_Directory%" EQU " " (
    echo 远程子目录有误！您是否为Remote_Directory误赋值为空格了？如果没有子目录请不要赋值，包括空格。
    echo 远程子目录有误，程序退出。>>%today%
    pause
    exit
)
if "%Local_Path%" EQU "" (
    echo 本地操作目录不能为空！请返回为Local_Path赋值 
    echo 本地操作目录为空，程序退出。>>%today%
    pause
    exit
)
if "%Log_Path%" EQU "" (
    echo 本地日志存放目录不能为空！请返回为Log_Path赋值 
    echo 本地日志存放目录为空，程序退出。>>%today%
    pause
    exit
)
echo 参数基本检测通过，准备执行数据库备份
echo 参数基本检测通过，数据库备份现在开始>>%today%
echo 今天是%Date%,时间是：%Time:~0,2%:%Time:~3,2%:%Time:~6,2%,正在执行数据库备份…………
echo 今天是%Date%,时间是：%Time:~0,2%:%Time:~3,2%:%Time:~6,2%,正在执行数据库备份…………>>%today%

echo 正在创建生成文件列表的ftp文件，请稍候………
echo 正在创建生成文件列表的ftp文件，请稍候…………>>%today%
ping -n 3 127.1>nul

echo 正在将远程登录用户名写入ftp文件…………>>%today%
echo %Remote_User%>%Log_Path%command.txt
echo 正在将远程登录密码写入ftp文件…………>>%today%
echo %Remote_Pwd%>>%Log_Path%command.txt
echo 正在将下载方式写入ftp文件…………>>%today%
echo type ASCII>>%Log_Path%command.txt
echo 正在判断远程父目录是否为根目录 …………>>%today%
if "%Remote_Path%" NEQ ".." (
    if  "%Remote_Path%" NEQ "" (
        echo 正在将进入远程目录%Remote_Path%的语句写入ftp文件…………>>%today%
        echo cd %Remote_Path%>>%Log_Path%command.txt
    )
)
echo 正在判断远程子目录…………>>%today%
if "%Remote_Directory%" NEQ "" (
    echo 正在将子目录列表的生成语句写入ftp文件…………>>%today%
    for %%i in (%Remote_Directory%) do (
         echo 正在将子目录列表%%i的生成语句写入ftp文件…………>>%today%
         echo mls %%i %Log_Path%%%i.txt>>%Log_Path%command.txt
    )
) else (
    echo 由于没有填写子目录，则将根目录下文件列表的生成语句写入ftp文件…………>>%today%
    echo mls .. FileList.txt>>%Log_Path%command.txt
) 
echo close>>%Log_Path%command.txt 
echo quit>>%Log_Path%command.txt
echo 正在对command.txt文件进行判断
if exist "%Log_Path%command.txt" (
    echo %Log_Path%command.txt文件创建成功
    echo %Log_Path%command.txt文件创建成功>>%today%
) else (
    echo %Log_Path%command.txt文件创建失败，程序将退出。
    echo %Log_Path%command.txt文件创建失败，程序退出>>%today%
    pause
    echo exit
)

echo 正在执行服务器目录文件列表创建,请稍候…………
echo 正在执行服务器目录文件列表创建,请稍候…………>>%today%
ping -n 3 127.1>nul
ftp -i -s:%Log_Path%command.txt %Remote_IP%
echo 正在检查已创建的服务器目录文件列表，请稍候…………
echo 正在检查已创建的服务器目录文件列表，请稍候…………>>%today%
if "%Remote_Directory%" NEQ "" (
    for %%i in (%Remote_Directory%) do (
        if exist "%Log_Path%%%i.txt" (
            echo %Log_Path%%%i.txt文件创建成功！
            echo %Log_Path%%%i.txt文件创建成功！>>%today%
        ) else (
            echo 对不起，%Log_Path%%%i.txt文件创建失败！程序将退出！
            echo %Log_Path%%%i.txt文件创建失败！程序终止>>%today%
            pause
            exit            
        )
    )
) else (
    if exist "%Log_Path%FileList.txt" (
        echo %Log_Path%FileList.txt文件创建成功！
        echo %Log_Path%FileList.txt文件创建成功！>>%today%
    ) else (
        echo 对不起，%Log_Path%FileList.txt文件创建失败！
        echo %Log_Path%FileList.txt文件创建失败！程序终止>>%today%
        pause
        exit
    )
)


echo 程序开始下载文件，请耐心等待…………
echo 程序开始下载文件，请耐心等待…………>>%today%
if "%Remote_Directory%" NEQ "" (
    for %%i in (%Remote_Directory%) do (
        echo 正在创建目录%Local_Path%%%i…………
        echo 创建目录%Local_Path%%%i…………>>%today%
        md %Local_Path%%%i
        echo 正在下载%Remote_Path%%%i文件夹备份,请稍候…………
        echo 正在下载%Remote_Path%%%i文件夹备份,请稍候…………>>%today%
        ping -n 3 127.1>nul
        for /f "delims=." %%j in (%Log_Path%%%i.txt) do (
            if not exist "%Local_Path%%%i\%%j.txt" (
                echo 正在创建下载文件%%j.txt的脚本,请稍候…………
                echo 正在创建下载文件%%j.txt的脚本,请稍候…………>>%today%
                echo %Remote_User%>%Log_Path%GetFiles.txt
                echo %Remote_Pwd%>>%Log_Path%GetFiles.txt
                echo type ASCII>>%Log_Path%GetFiles.txt
                if "%Remote_Path%" NEQ "" (
                    if "%Remote_Path%" NEQ ".." ( 
                        echo cd %Remote_Path%>>%Log_Path%GetFiles.txt
                    )
                )
                echo cd %%i>>%Log_Path%GetFiles.txt
                echo lcd %Local_Path%%%i>>%Log_Path%GetFiles.txt
                echo mget "%%j.txt">>%Log_Path%GetFiles.txt
                echo close>>%Log_Path%GetFiles.txt
                echo quit>>%Log_Path%GetFiles.txt
                ftp -i -s:%Log_Path%GetFiles.txt %Remote_IP%
                echo 正在检查文件%Local_Path%%%i\%%j.txt，请稍候……
                echo 正在检查文件%Local_Path%%%i\%%j.txt，请稍候……>>%today%
                if exist "%Local_Path%%%i\%%j.txt" (
                    echo ————下载%Local_Path%%%i\%%j.txt成功！
                    echo ————下载%Local_Path%%%i\%%j.txt成功！>>%today%
                ) else (
                    echo ——由于未知原因，下载%Local_Path%%%i\%%j.txt失败！
                    echo ——由于未知原因，下载%Local_Path%%%i\%%j.txt失败！>>%today%
                )
            ) else (
                echo %Local_Path%%%i\%%j.txt已存在，正在跳过————
                echo %Local_Path%%%i\%%j.txt已存在，正在跳过————>>%today%
            )
        )
    )
) else (
    echo 由于没有指定服务器子目录，程序将把服务器父目录下的文件备份到您指定的本地目录中…………
    echo 由于没有指定服务器子目录，程序将把服务器父目录下的文件备份到您指定的本地目录中…………>>%today%
    for /f "delims=佴" %%j in (%Log_Path%FileList.txt) do (
        if not exist "%Local_Path%%%j.txt" (
            echo 正在创建下载文件%%j.txt的脚本,请稍候…………
            echo 正在创建下载文件%%j.txt的脚本,请稍候…………>>%today%
            echo %Remote_User%>%Log_Path%GetFiles.txt
            echo %Remote_Pwd%>>%Log_Path%GetFiles.txt
            echo type ASCII>>%Log_Path%GetFiles.txt
            if "%Remote_Path%" NEQ "" (
                if "%Remote_Path%" NEQ ".." ( 
                    echo cd %Remote_Path%>>%Log_Path%GetFiles.txt
                )
            )
            echo lcd %Local_Path%>>%Log_Path%GetFiles.txt
            echo mget "%%j.txt">>%Log_Path%GetFiles.txt
            echo close>>%Log_Path%GetFiles.txt
            echo quit>>%Log_Path%GetFiles.txt
            ftp -i -s:%Log_Path%GetFiles.txt %Remote_IP%
            echo 正在检查文件%Local_Path%%%i\%%j.txt，请稍候……
            echo 正在检查文件%Local_Path%%%i\%%j.txt，请稍候……>>%today%
            if exist "%Local_Path%%%j.txt" (
                echo ————下载%Local_Path%%%i\%%j.txt成功！
                echo ————下载%Local_Path%%%i\%%j.txt成功！>>%today%
            ) else (
                echo ——由于未知原因，下载%Local_Path%%%i\%%j.txt失败！
                echo ——由于未知原因，下载%Local_Path%%%i\%%j.txt失败！>>%today%
            )
        ) else (
            echo %Local_Path%%%i\%%j.txt已存在，正在跳过————
            echo %Local_Path%%%i\%%j.txt已存在，正在跳过————>>%today%
        )
    )
)


echo 程序正在清除临时文件，请稍候…………
echo 程序将删除%Log_Path%command.txt文件…………>>%today%
del %Log_Path%command.txt
if exist "%Log_Path%command.txt" (
    echo %Log_Path%command.txt文件删除失败，程序继续运行
    echo %Log_Path%command.txt文件删除失败，程序继续运行>>%today%
) else (
    echo %Log_Path%command.txt文件删除成功
    echo %Log_Path%command.txt文件删除成功>>%today%
)

echo 程序正在删除下载备份之ftp语句文件，请稍候…………
echo 程序正在删除下载备份之ftp语句文件，请稍候…………>>%today%
Del %Log_Path%GetFiles.txt
if exist "%Log_Path%GetFiles.txt" (
    echo %Log_Path%GetFiles.txt文件删除失败，程序继续运行
    echo %Log_Path%GetFiles.txt文件删除失败，程序继续运行>>%today%
) else (
    echo %Log_Path%GetFiles.txt文件删除成功
    echo %Log_Path%GetFiles.txt文件删除成功>>%today%
)


echo 程序正在删除临时文件列表文件，请稍候…………
echo 程序正在删除临时文件列表文件，请稍候…………>>%today%
if "%Remote_Directory%" NEQ "" (
    for %%i in (%Remote_Directory%) do (
        Del %Log_Path%%%i.txt
        if exist "%Log_Path%%%i.txt" (
            echo %Log_Path%%%i.txt文件删除失败，程序继续运行
            echo %Log_Path%%%i.txt文件删除失败，程序继续运行>>%today%
        ) else (
            echo %Log_Path%%%i.txt文件删除成功 
            echo %Log_Path%%%i.txt文件删除成功 >>%today%
        )
    )
) else (
    del %Log_Path%FileList.txt
    if exist "%Log_Path%FileList.txt" (
        echo %Log_Path%FileList.txt文件删除失败，程序继续运行
        echo %Log_Path%FileList.txt文件删除失败，程序继续运行>>%today%
    ) else (
        echo %Log_Path%FileList.txt文件删除成功
        echo %Log_Path%FileList.txt文件删除成功>>%today%
    )
)
echo 恭喜您，本次备份工作已经圆满完成！详情请查看%today%日志文件！
echo 恭喜您，本次备份工作已经圆满完成！>>%today%
echo 数据已被备份到%Local_Path%目录中。>>%today%
echo 完成时间：%Time:~0,2%:%Time:~3,2%:%Time:~6,2%>>%today%
pause
exit

#T=Git 命令总结
【使用git前的基础知识】
第一点，git是分布式的，而svn不是，git在本地就包含了所有文件元数据信息，不需要网络即可在本地进行提交。还有有一个特征，svn托管的代码目录里有.svn文件夹，这个文件夹要比git工作树中的.git文件夹小很多，这也是因为git没有服务器客户端之分，所有仓库存储项目的所有数据。
第二点，git的版本号其实就是40位的sha-1的字符串commit，一般取前7位来使用，而svn的版本号是一个数字。但他们使用特殊的版本号倒是一致的，如用HEAD表示最新，用HEAD^表示HEAD的上个版本，而HEAD^^则表示HEAD的上上个版本，HEAD~4则表示HEAD倒数第四个版本。
注意HEAD版本是以分支为单位的，每个分支都有一个HEAD版本，而分支名就是一个ref，指向其分支的HEAD版本。
 
【在服务器仓库中使用git-init】
建立git代码仓库，默认仓库名为.git，当建立的仓库作为服务器使用时用git init --bare，如果不使用--bare选项， 则被push的仓库的当前分支不能为push的分支，否则出现如下错误提示。
remote: error: refusing to update checked out branch: refs/heads/master
remote: error: By default, updating the current branch in a non-bare repository
remote: error: is denied, because it will make the index and work tree inconsistent
remote: error: with what you pushed, and will require 'git reset --hard' to match
remote: error: the work tree to HEAD.
remote: error: 
remote: error: You can set 'receive.denyCurrentBranch' configuration variable to
remote: error: 'ignore' or 'warn' in the remote repository to allow pushing into
remote: error: its current branch; however, this is not recommended unless you
remote: error: arranged to update its work tree to match what you pushed in some
remote: error: other way.
remote: error: 
remote: error: To squelch this message and still keep the default behaviour, set
remote: error: 'receive.denyCurrentBranch' configuration variable to 'refuse'.
To ../gitc1
 ! [remote rejected] master -> master (branch is currently checked out)
error: failed to push some refs to '../gitc1'
 
 
【如何使用git-commit命令】
git ci -a -m "modified main.c"
对于修改的文件，svn会自动记录并在下次commit时提交到服务器，而git不会自动添加到索引，仍然需要用git-add添加到索引。但也可以使用git commit -a，-a选项表示自动提交修改和删除的，但不包括新建的。
vim main.c; git ci --amend = git reset --soft HEAD^;vim mai.c; git commit  修改最新版本的log信息或增补提交
 
【如何使用git-checkout和git-branch命令】
git br b1 ; git co b1  建立本地分支b1（版本，内容和当前分支相同），切换到b1
git br new; git push origin new:new 新建远程分支new
git br -m b1 b2 将b1分支重命名为b2（注意br -m只查看refs/heads/，不查看refs/remotes，因此不能修改远程分支）
git br -d b1 删除分支b1
git push origin :new 删除远程分支new
git co cc4e2e3 切换到版本cc4e2e3，即使非当前分支的版本也可
git co origin/master 切换到远程仓库origin的分支master
git co -b b1 orgin/b1 = git br b1 origin/b1 = git br b1; git pull origin b1 根据远程分支来创建本地分支
git co -f b1 忽略当前修改并切换到b1，（免去使用checkout来撤销的功夫）
git co --merge b1 如当前分支有修改，则自动合并当前分支和b1分支，并切换到b1
git br --no-merge 显示与当前分支合并过/未合并过的分支

git remote prune origin 删除远程仓库中已经删除的分支（当其他分支删除远程分支b1时，本地不知道会导致对远程分支b1的操作失败，其实了remote prune本质是清理refs/remotes下的文件）
 
【如何撤销修改】
可用git-checkout，git-reset，git-revert三个命令来实现撤销
git co head main.c 撤销对main.c的修改
git co head *.c 撤销所有c文件的修改
git co head . 撤销所有文件的修改 
git reset HEAD^ 还原到HEAD^版本，即撤销HEAD的修改
git revert HEAD 反转HEAD的修改，同reset一样还原到HEAD^，但保留提交记录，可用log观察它和reset的区别
 
【如何使用git-merge和git-rebase，git-pull和git-push和】
git merge b1 合并即将b1单独的操作在当前分支中重新操作，如操作同行即冲突（merge是本地合并，pull和push则是远程合并）
git merge --no-commit b1 只merge，不commit（该条命令的--no-commit选项失效）
git merge --squash b1 压合合并，被merge的b1分支上的多个提交操作在合并到当前分支后只有一个提交记录
git cherry-pick 7a6c80a 合并版本7a6c80a的操作（该版本可以是另一个分支很久以前的一个提交，比较无敌）
git rebase 35a8405 重置分支的分叉基点到35a8405版本（如果冲突，则修改后add并rebase --continue完成或rebase --skip跳过）
git pull origin master = git fetch origin; git merge origin/master 其实git-pull命令就类似于svn-update，将远程仓库合并到本地（pull = fetch + merge，一般fetch后用diff观察区别再merge）
git br new; git push origin new:new 新建远程分支new
git push origin :new 删除远程分支new
git fetch origin 下载origin仓库的refs和obj信息（有时用pull无法更新远程仓库的信息，而fetch则有效，可用log --decorate观察区别）
git log --graph --oneline 可观察其他分支被merge前的提交记录（一般是并行分叉线），XXX 但当前分支被其他分支merge的信息无法观察（merge操作只会将被merge方的提交信息传递到merge，除非使用merge --squash压合合并）
git pull origin --tags 更新远程仓库的tag到本地仓库
git push origin --tags 上传本地仓库tags到远程仓库
 
 
【如何使用git-log命令】
git log main.c显示包含main.c文件改动的提交记录
git log a07120b 显示a07120b之前的提交记录（包括a07120b）
git log b1 显示分支b1的提交记录
git log a07120d..HEAD^ 显示从a07120d到HEAD上个版本的提交记录（不包括a07120d）
git log master..b1 显示分支b1的HEAD版本到master的HEAD版本的提交记录
 
#T=HelpLibrary2
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs]
"ContentStore"="D:\\HelpLibrary2\\Catalogs\\"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\SQL2012]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\SQL2012\\"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VS2012]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\VS2012\\"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VS2010]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\VS2010\\"

#T=HelpLibrary2 OLD
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs]
"ContentStore"="C:\\ProgramData\\Microsoft\\HelpLibrary2\\Catalogs\\"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\SQL11]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\SQL11\\"
"LastUpdated"="04/07/2013 07:03:39"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\SQL11\en-US]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\SQL11\\"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VisualStudio11]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\VisualStudio11\\"
"LastUpdated"="04/12/2013 07:50:35"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VisualStudio11\en-US]
"SeedFilePath"="C:\\Program Files (x86)\\Microsoft Help Viewer\\v2.0\\CatalogInfo\\VS11_en-us.cab"
"catalogName"="Visual Studio 2012 Documentation"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VS10]
"LocationPath"="D:\\HelpLibrary2\\Catalogs\\VS10\\"
"LastUpdated"="04/08/2013 13:16:14"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Help\v2.0\Catalogs\VS10\zh-CN]


#T=lambda form add-type PS
Add-Type -Path C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Windows.Forms.dll
[System.Reflection.Assembly]::LoadFrom('C:\Users\xiyueyu\Desktop\EasyPerformanceCounterHelper.dll').ImageRuntimeVersion
{ param($x)  [System.Console]::WriteLine($x) }.Invoke('asdsadsa')
(New-Object System.Windows.Forms.Form).ShowDialog()

#T=Linux维护命令 常用
常用Linux维护命令
** 查看Linux系统性能参数
top
free -m
vmstat -S M # 内核线程、虚拟内存、磁盘、陷阱和 CPU 活动的统计信息
sysctl -p # 查看内核参数 
ulimit -n # 检查文件描述符

** 查看MySql相关参数
show processlist; # 查看mysql进程
show variables; # 查看mysql配置

** 清掉页面缓存
sync # 未写盘的操作写盘
echo 1 >/proc/sys/vm/drop_caches # 清PageCache
echo 2 >/proc/sys/vm/drop_caches # 清dentries and inodes
echo 3 >/proc/sys/vm/drop_caches # 清pagecache, dentries and inodes

 

** 重启php-fpm
kill -USR2 `cat /sxmobi/php/var/run/php-fpm.pid` # 重启
kill -INT `cat /sxmobi/php/var/run/php-fpm.pid` # 关闭
ps aux | grep -c php-fpm # 查看php-fpm进程数


** 结束重启nginx
cd /sxmobi/nginx/sbin # 进到nginx的安装目录
./nginx -s reload # 发送信息停止，退出，重打开，重加载

ps -ef | grep nginx
kill -HUP 20657 # kill掉nginx主进程
./nginx
./nginx -s reload


** 启动/停止/重启MySQL
/etc/init.d/mysqld {start|stop|restart}
service mysqld restart

/etc/init.d/mysqld restart
/etc/my.cnf

** 启动/停止/重启Apache
/sxmobi/apache2/bin/httpd -k start/stop/restart

#T=menu 菜单
@echo off
cls
rem ::file name: go.bat
::##################Menu##################
:menuLoop

echo     请选择
echo 1   答案1
echo 2   答案2
echo 3   答案3
set choice=
echo.&set /p choice=Choose one task or hit ENTER to quit: ||(goto :EOF)
echo.&call :task_%choice%
goto :EOF

::##################Tasks##################
:task_1
rem call gradle clean build
echo 1111111111111
cls
goto :menuLoop

:task_2
rem call gradle clean check -x :integrationTest -x :coberturaIntegrationTest
echo 222222222222
cls
goto :menuLoop

:task_3
rem call gradle --refresh-dependencies cleanIdea idea
echo 33333333333
cls
goto :menuLoop

::#################Accept Parameters#################
::set option=%1
if "%1" == "" (
    goto :menuLoop   
) else (
    goto :task_%1
)
#T=net 命令大全
 
net use \\ip\ipc$ " " /user:" " 建立IPC空链接
net use \\ip\ipc$ "密码" /user:"用户名" 建立IPC非空链接 
net use h: \\ip\c$ 登陆后映射对方C：到本地为H: 
net use \\ip\ipc$ /del 删除IPC链接 
net use h: /del 删除映射对方到本地的为H:的映射 
net user 用户名　密码　/add 建立用户 
net user guest /active:yes 激活guest用户
net user 查看有哪些用户 
net user 帐户名 查看帐户的属性
net localgroup administrators 用户名 /add 把“用户”添加到管理员中使其具有管理员权限,注意：
administrator后加s用复数
net start 查看开启了哪些服务 
net start 服务名　 开启服务；(如:net start telnet， net start schedule)
net stop 服务名 停止某服务
net time \\目标ip 查看对方时间
net time \\目标ip /set 设置本地计算机时间与“目标IP”主机的时间同步,加上参数/yes可取消确认信息
net view 查看本地局域网内开启了哪些共享
net view \\ip 查看对方局域网内开启了哪些共享 
net config 显示系统网络设置
net logoff 断开连接的共享 
net pause 服务名 暂停某服务 
net send ip "文本信息" 向对方发信息 
net ver 局域网内正在使用的网络连接类型和信息 
net share 查看本地开启的共享
net share ipc$ 开启ipc$共享 
net share ipc$ /del 删除ipc$共享
net share c$ /del 删除C：共享 
net user guest 12345 用guest用户登陆后用将密码改为12345 
net password 密码 更改系统登陆密码
netstat -a 查看开启了哪些端口,常用netstat -an
netstat -n 查看端口的网络连接情况，常用netstat -an 
netstat -v 查看正在进行的工作 
netstat -p 协议名 例：netstat -p tcq/ip 查看某协议使用情况（查看tcp/ip协议使用情况） 
netstat -s 查看正在使用的所有协议使用情况
#T=netsh interface 网卡
netsh interface ip set address name="本地连接" source=static addr=192.168.1.37 mask=255.255.255.0 gateway=192.168.1.1
netsh interface ip set dns name="本地连接" source=static addr=210.21.4.130  register=PRIMARY
netsh interface ip add dns name="本地连接" addr=210.21.196.6 index=2
#T=netsh 防火墙打开端口
@echo =========  SQL Server Ports  ===================
@echo Enabling SQLServer default instance port 1433
netsh firewall set portopening TCP 1433 "SQLServer" 
@echo Enabling Dedicated Admin Connection port 1434
netsh firewall set portopening TCP 1434 "SQL Admin Connection" 
@echo Enabling conventional SQL Server Service Broker port 4022  
netsh firewall set portopening TCP 4022 "SQL Service Broker" 
@echo Enabling Transact-SQL Debugger/RPC port 135 
netsh firewall set portopening TCP 135 "SQL Debugger/RPC" 
@echo =========  Analysis Services Ports  ==============
@echo Enabling SSAS Default Instance port 2383
netsh firewall set portopening TCP 2383 "Analysis Services" 
@echo Enabling SQL Server Browser Service port 2382
netsh firewall set portopening TCP 2382 "SQL Browser" 
@echo =========  Misc Applications  ==============
@echo Enabling HTTP port 80 
netsh firewall set portopening TCP 80 "HTTP" 
@echo Enabling SSL port 443
netsh firewall set portopening TCP 443 "SSL" 
@echo Enabling port for SQL Server Browser Service's 'Browse' Button
netsh firewall set portopening UDP 1434 "SQL Browser" 
@echo Allowing multicast broadcast response on UDP (Browser Service Enumerations OK)
netsh firewall set multicastbroadcastresponse ENABLE 
#T=netsh 高级防火墙
netsh advfirewall firewall add rule name=HadoopNameNodeWebUIHttp dir=in action=allow protocol=TCP localport=50070
netsh advfirewall firewall add rule name=HadoopNameNodeWebUIHttps dir=in action=allow protocol=TCP localport=50470
netsh advfirewall firewall add rule name=HadoopNameNodeMetadataService1 dir=in action=allow protocol=TCP localport=8020
netsh advfirewall firewall add rule name=HadoopNameNodeMetadataService2 dir=in action=allow protocol=TCP localport=9000
netsh advfirewall firewall add rule name=HadoopDataNodeHttp dir=in action=allow protocol=TCP localport=50075
netsh advfirewall firewall add rule name=HadoopDataNodeHttps dir=in action=allow protocol=TCP localport=50475
netsh advfirewall firewall add rule name=HadoopDataNodeDataTransfer dir=in action=allow protocol=TCP localport=50010
netsh advfirewall firewall add rule name=HadoopDataNodeIPC dir=in action=allow protocol=TCP localport=50090
netsh advfirewall firewall add rule name=HadoopIPC dir=in action=allow protocol=TCP localport=50300

netsh advfirewall firewall add rule name=HadoopJobTrackerWebUIHttp dir=in action=allow protocol=TCP localport=50030
netsh advfirewall firewall add rule name=HadoopJobTrackerIPC dir=in action=allow protocol=TCP localport=8021
netsh advfirewall firewall add rule name=HadoopTaskTrackerWebUIHttp dir=in action=allow protocol=TCP localport=50060
netsh advfirewall firewall add rule name=HadoopHistoryServerWebUIHttp dir=in action=allow protocol=TCP localport=51111

netsh advfirewall firewall add rule name=HadoopHiveServer2 dir=in action=allow protocol=TCP localport=10001
netsh advfirewall firewall add rule name=HadoopHiveServer dir=in action=allow protocol=TCP localport=10000
netsh advfirewall firewall add rule name=HadoopMetastore dir=in action=allow protocol=TCP localport=9083
netsh advfirewall firewall add rule name=HadoopTempletonServer dir=in action=allow protocol=TCP localport=50111

netsh advfirewall firewall add rule name=HadoopHMaster dir=in action=allow protocol=TCP localport=60000
netsh advfirewall firewall add rule name=HadoopHMasterInfoWebUI dir=in action=allow protocol=TCP localport=60010
netsh advfirewall firewall add rule name=HadoopRegionServer dir=in action=allow protocol=TCP localport=60020
netsh advfirewall firewall add rule name=HadoopRegionServerInfo dir=in action=allow protocol=TCP localport=60030
netsh advfirewall firewall add rule name=HadoopZooKeeperPeer dir=in action=allow protocol=TCP localport=2888
netsh advfirewall firewall add rule name=HadoopZooKeeperLeader dir=in action=allow protocol=TCP localport=3888
netsh advfirewall firewall add rule name=HadoopZooKeeperPropertyClient dir=in action=allow protocol=TCP localport=2181

netsh advfirewall firewall add rule name=ICMPv4 dir=in action=allow protocol=icmpv4
#T=NetTaskList 读取文件
rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set _now_=%%j.%%k.%%l
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set _now_=%_now_%-%%j.%%k

md %_now_%
cd %_now_%

for /f %%i in (..\machines.txt) do tasklist /s %%i /v /fo csv > %%i.%_now_%.csv.txt

cd ..

#T=PerformanceCounterCategory]::Delete PowerShell
[Diagnostics.PerformanceCounterCategory]::Delete( "Your Category Name" )
[Diagnostics.PerformanceCounterCategory]::GetCategories() | Format-Table -auto
[Diagnostics.PerformanceCounterCategory]::GetCategories() | Where {$_.CategoryName -like "*microshaoft*" } | Format-Table -auto
[Diagnostics.PerformanceCounterCategory]::GetCategories() | Where {$_.CategoryName -like "*network*" } | Format-Table -auto
[Diagnostics.PerformanceCounterCategory]::GetCategories() | Where {$_.CategoryName -match "^SQL.*Stat.*" } | Format-Table -auto


$categoryName = "Microshaoft ConcurrentAsyncQueue Performance Counters"
$counterName = ""
$instanceName = ""
if ([System.Diagnostics.PerformanceCounterCategory]::Exists($categoryName))
{
    #if ([System.Diagnostics.PerformanceCounterCategory]::CounterExists($counterName,$categoryName))
    {

    }
    if ([System.Diagnostics.PerformanceCounterCategory]::InstanceExists($instanceName, $categoryName))
    {
       $pc = New-Object [System.Diagnostics.PerformanceCounter]  ($categoryName, $counterName, $instanceName)
       $pc.RemoveInstance()
       [System.Console]::WriteLine("RemoveInstance")
    }
    [System.Diagnostics.PerformanceCounterCategory]::Delete($categoryName)
    [System.Console]::WriteLine("Delete")
   
}

#T=robocopy mir disk to folder/directory
Robocopy h:\ Q:\T61P.20110630\C /A-:SH /MIR /XD "$RECYCLE.BIN" "RECYCLER" "System Volume Information" /r:2 /w:5
#T=SharePoint AddGroups/AddUsersToGroups/RemoveUsersFromGroups
$WebAppUrl = "http://u1w10ifap01"
$Web = Get-SPWeb $WebAppUrl


function AddGroup($groupName)
{
	$Web.SiteGroups.Add($groupName, $Web.AssociatedOwnerGroup, $z, $groupName);
}


function RemoveUserFromGroup($domainName, $userName, $groupName)
{
	$user = $web.Site.RootWeb.EnsureUser($domainName + "\" + $userName)
	$group = $Web.SiteGroups[$groupName]
	$group.RemoveUser($user)
}


function RemoveUserFromGroup($domainName, $userName, $groupName)
{
	$user = $web.Site.RootWeb.EnsureUser($domainName + "\" + $userName)
	$group = $Web.SiteGroups[$groupName]
	$group.RemoveUser($user)
}


AddGroup "_安徽分行"
AddGroup "_北京分行"

AddUserToGroup  "Domain" "AHuser" "_安徽分行"
AddUserToGroup  "Domain" "BJuser" "_北京分行"

RemoveUserFromGroup  "BOCFM" "AHuser" "_安徽分行"
RemoveUserFromGroup  "BOCFM" "BJuser" "_北京分行"

#T=SharePoint AddUserToGroup
$WebAppUrl = "http://u1w10ifap01"
$Web = Get-SPWeb $WebAppUrl


#T=SharePoint Get SP Groups Users
 Add-PSSnapin Microsoft.SharePoint.PowerShell

 $SiteUrl = "http://22.11.128.58:8080"
 $FilePath = "C:\Temp\users.txt"

 $spSite = Get-SPSite -Identity $SiteUrl
 $spWeb = $spSite.AllWebs[0]
 
 Add-Content -Path $FilePath -Value "=================================================================="
 #Get All Groups
 Write-Host "1.开始获取网站所有用户组..."
 Add-Content -Path $FilePath -Value "1. 网站用户组"
 foreach($group in $spWeb.Groups)
 {
    $n = "[" + $group.Name + "]"
    Add-Content -Path $FilePath -Value $group.Name
    Write-Host $group.Name
 }
 Write-Host "成功获取网站所有用户组."
 Add-Content -Path $FilePath -Value "=================================================================="
 


 #Get All Users
 Write-Host "2.开始获取网站所有用户..."
 Add-Content -Path $FilePath -Value "2. 网站用户"
 foreach($user in $spWeb.SiteUsers)
 {
    $n = "[" + $user.LoginName + "]`t[" + $user.Name + "]`t[" + $user.DisplayName + "]"
    Add-Content -Path $FilePath -Value $n
    Write-Host $n
 }
 Write-Host "成功获取网站所有用户."
 Add-Content -Path $FilePath -Value "=================================================================="
 


 #Get All UserGroups and Users Relationship
 Write-Host "3.开始获取网站用户组和用户关系..."
 Add-Content -Path $FilePath -Value "3. 用户组和用户关系"
 foreach($group in $spWeb.Groups)
 {
    #Add-Content -Path $FilePath -Value $group.Name
    #Write-Host $group.Name
    foreach($user in $group.Users)
    {
        $n = "[" + $group.Name + "]`t[" + $user.LoginName + "]`t["+ $user.Name + "]`t[" + $user.DisplayName + "]"
        Add-Content -Path $FilePath -Value $n
        Write-Host $n
    }
    #Add-Content -Path $FilePath -Value ""
    #11Write-Host ""
 }
Add-Content -Path $FilePath -Value "=================================================================="
Write-Host "成功获取网站用户组和用户关系."

#T=USB RDVDenyWriteAccess 
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Policies\Microsoft\FVE" /v RDVDenyWriteAccess /f
#T=Visual Studio 2005快捷键
这里把我积累的一些Visual Studio 2005快捷键同大家分享，希望对大家能有所帮助
----------------------------------------------------------------
代码编写
----------------------------------------------------------------
Shift + Alt + Ente - 全屏显示
Shift + Alt + F10 - 打开用于实现接口的选项，继续按I可实现接口，按R则重命名
Ctrl + R + E - 封装字段
Ctrl + J - 列出成员，仅包括代码提示
Tab(按两下) - 补齐代码块，例如在try、for、do后按
Ctrl + K + S - 外侧代码，仅包括代码块模版
"cw" + Tab + Tab - Console.WriteLine();
"mbox" + Tab + Tab - Messagebox.Show();
Ctrl + Shift + Space - 参数信息
Ctrl + Shift + B - 生成解决方案
----------------------------------------------------------------
代码操作
----------------------------------------------------------------
Ctrl + K + C - 注释
Ctrl + K + U - 取消注释
Ctrl + ] - 寻找匹配的括号
Ctrl + Shift + ] - 选择匹配的括号与其中的代码
Ctrl + F - 快速查找
Ctrl + H - 快速替换
Ctrl + Shift + U - 转换为大写
Ctrl + U - 转换为小写
Ctrl + K + D - 设置文档格式
Tab - 增加缩进
Shift + Tab - 减少缩进
----------------------------------------------------------------
调试运行
----------------------------------------------------------------
F5 - 启动调试
Shift + F5 - 停止调试
F9 - 设置断点
Ctrl + Shift + F9 - 删除所有断点
F10 - 逐过程调试
F11 - 逐语句调试
----------------------------------------------------------------
项目的操作
----------------------------------------------------------------
Alt + Enter - 打开选定项的属性对话框
Ctrl + Shift + N - 新建项目
Ctrl + N - 新建文件
----------------------------------------------------------------
视图调用
----------------------------------------------------------------
Ctrl + Alt + X - 工具箱
Ctrl + Alt + L - 解决方案资源管理器
Ctrl + Alt + S - 服务器资源管理器
F4 - 属性
----------------------------------------------------------------
技巧
----------------------------------------------------------------
双击控件工具，自动添加控件。
Alt + 方向键 - 可用方向键细微调整控件的大小
方向键 - 调整控件的位置
----------------------------------------------------------------

#T=wbadmin Windows Server Backup 备份
@echo off
setlocal enabledelayedexpansion

set _BackupTarget_=F:
rem set _BackupTarget_=\\yuer-w530\h$\backup
set _BackupTargetRootPath_=%_BackupTarget_%\WindowsImageBackup
echo %_BackupTargetRootPath_%
call :GetTime HH mm ss tt
call :GetDate yyyy mm dd 
set _now_=%yyyy%-%mm%-%dd%.%HH%-%mm%-%ss%

IF EXIST %_BackupTargetRootPath_% (
	echo %_BackupTargetRootPath_% found..
	move %_BackupTargetRootPath_% %_BackupTargetRootPath_%.before.%_now_%
	echo %_BackupTargetRootPath_% rename to .%_BackupTargetRootPath_%.before.%_now_%
)






for /f "delims=" %%i in (include.paths.list.txt) do (
	if not defined i (
		set i="%%i"
	) else (
		set i=!i!,"%%i"
	)
)
rem echo %i%
wbadmin start backup -BackupTarget:%_BackupTarget_% -Include:%i% -quiet

goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:GetTime hh mm ss tt
::
:: 作者:Ritchie Lawrence, 2007-05-12. 版本 1.3
::
:: 功能:把本地系统日期赋值给参数 1 到 4.
::       适用于 NT4/2000/XP/2003
:: 
:: 参数:%1 该变量用于接收小时，两位,00 到 23(引用调用)
::       %2 该变量用于接收分钟,两位,00 到 59(引用调用)
::       %3 该变量用于接收秒钟,两位,00 到 59(引用调用)
::       %4 该变量用于接收百分之一秒,两位,00 到 99(引用调用)
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
for /f "tokens=5-8 delims=:,. " %%a in ('echo/^|time') do (
  set hh=%%a&set mm=%%b&set ss=%%c&set cs=%%d)
if 1%hh% LSS 20 set hh=0%hh%
endlocal&set %1=%hh%&set %2=%mm%&set %3=%ss%&set %4=%cs%&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:GetDate yy mm dd
::
:: 作者:Ritchie Lawrence, 2002-06-15. 版本 1.0
::
:: 功能:把本地系统日期赋值给参数 1 到 3.
::       适用于 NT4/2000/XP/2003.
:: 
:: 参数:%1 该变量用于接收年,四位(引用调用)
::       %2 该变量用于接收月,两位,01 到 12(引用调用)
::       %3 该变量用于接收日,两位,01 到 31(引用调用)
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
set t=2&if "%date%z" LSS "A" set t=1
for /f "skip=1 tokens=2-4 delims=(-)" %%a in ('echo/^|date') do (
  for /f "tokens=%t%-4 delims=.-/ " %%d in ('date/t') do (
    set %%a=%%d&set %%b=%%e&set %%c=%%f))
endlocal&set %1=%yy%&set %2=%mm%&set %3=%dd%&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#T=WebRequest Invoke- PS
param([string]$url = "http://www.infoq.com/presentations/readable-code-f-sharp", [string]$outPath = 'D:\downloads')

$ua = "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10"
$res = Invoke-WebRequest -UserAgent $ua -Uri $url
$srcPrefix =  '<source src="'

$posStart = $res.Content.IndexOf($srcPrefix) + $src.Length
$posEnd = $res.Content.IndexOf('"', $posStart)

$fileUrl = $res.Content.SubString($posStart, $posEnd - $posStart)

$fileName = [System.IO.Path]::Combine($outPath,  $fileUrl.SubString($fileUrl.LastIndexOf('/') + 1))
Invoke-WebRequest -UserAgent $ua -Uri $fileUrl -OutFile $fileName

#T=whoami
@echo off
rem  get current date and time
for /f "tokens=1, 2 delims=\ " %%j in ('whoami') do (
	set _user_=%%k
	set _domain_=%%j
)
echo %_user_% %_domain_%
#T=Wifi
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid=你热点的名字 key=你热点的密码
netsh wlan start hostednetwork
#T=Win7 备份还原
C:\Windows\System32\sdclt.exe /configure
#T=Windows 快捷键
F1帮助
F2改名
F3搜索
F4地址
F5刷新
F6切换
F10菜单
CTRL+A全选
CTRL+C复制
CTRL+X剪切
CTRL+V粘贴
CTRL+Z撤消
CTRL+O打开
SHIFT+DELETE永久删除
DELETE删除
ALT+ENTER属性
ALT+F4关闭
CTRL+F4关闭
ALT+TAB切换
ALT+ESC切换
ALT+空格键窗口菜单
CTRL+ESC开始菜单
拖动某一项时按CTRL复制所选项目
拖动某一项时按CTRL+SHIFT创建快捷方式
将光盘插入到CD-ROM驱动器时按SHIFT键阻止光盘自动播放
Ctrl+1,2,3...　切换到从左边数起第1,2,3...个标签
Ctrl+A　全部选中当前页面内容
Ctrl+C　复制当前选中内容
Ctrl+D　打开“添加收藏”面版(把当前页面添加到收藏夹中)
Ctrl+E　打开或关闭“搜索”侧边栏(各种搜索引擎可选)
Ctrl+F　打开“查找”面版
Ctrl+G　打开或关闭“简易收集”面板
Ctrl+H　打开“历史”侧边栏
Ctrl+I　打开“收藏夹”侧边栏/另:将所有垂直平铺或水平平铺或层叠的窗口恢复
Ctrl+K　关闭除当前和锁定标签外的所有标签
Ctrl+L　打开“打开”面版(可以在当前页面打开Iternet地址或其他文件...)
Ctrl+N　新建一个空白窗口(可更改,Maxthon选项→标签→新建)
Ctrl+O　打开“打开”面版(可以在当前页面打开Iternet地址或其他文件...)
Ctrl+P　打开“打印”面板(可以打印网页,图片什么的...)
Ctrl+Q　打开“添加到过滤列表”面板(将当前页面地址发送到过滤列表)
Ctrl+R　刷新当前页面
Ctrl+S　打开“保存网页”面板(可以将当前页面所有内容保存下来)
Ctrl+T　垂直平铺所有窗口
Ctrl+V　粘贴当前剪贴板内的内容
Ctrl+W　关闭当前标签(窗口)
Ctrl+X　剪切当前选中内容(一般只用于文本操作)
Ctrl+Y　重做刚才动作(一般只用于文本操作)
Ctrl+Z　撤消刚才动作(一般只用于文本操作)
Ctrl+F4　关闭当前标签(窗口)
Ctrl+F5　刷新当前页面
Ctrl+F6　按页面打开的先后时间顺序向前切换标签(窗口)
Ctrl+F11　隐藏或显示菜单栏
Ctrl+Tab　以小菜单方式向下切换标签(窗口)
Ctrl+Enter　域名自动完成http://www.**.com(内容可更改,Maxthon选项→地址栏→常规)/另:当输入焦点在搜索栏中时,为高亮关键字
Ctrl+拖曳　保存该链接的地址或已选中的文本或指定的图片到一个文件夹中(保存目录可更改,Maxthon选项→保存)
Ctrl+小键盘'+'　当前页面放大20%
Ctrl+小键盘'-'　当前页面缩小20%
Ctrl+小键盘'*'　恢复当前页面的缩放为原始大小
Ctrl+Alt+S　自动保存当前页面所有内容到指定文件夹(保存路径可更改,Maxthon选项→保存)
Ctrl+Shift+小键盘'+'　所有页面放大20%
Ctrl+Shift+小键盘'-'　所有页面缩小20%
Ctrl+Shift+F　输入焦点移到搜索栏
Ctrl+Shift+G　关闭“简易收集”面板
Ctrl+Shift+H　打开并激活到你设置的主页
Ctrl+Shift+N　在新窗口中打开剪贴板中的地址,如果剪贴板中为文字,则调用搜索引擎搜索该文字(搜索引擎可选择,Maxthon选项→搜索)
Ctrl+Shift+S　打开“保存网页”面板(可以将当前页面所有内容保存下来,等同于Ctrl+S)　
Ctrl+Shift+W　关闭除锁定标签外的全部标签(窗口)
Ctrl+Shift+F6　按页面打开的先后时间顺序向后切换标签(窗口)
Ctrl+Shift+Tab　以小菜单方式向上切换标签(窗口)
Ctrl+Shift+Enter　域名自动完成
Alt+1　保存当前表单
Alt+2　保存为通用表单
Alt+A　展开收藏夹列表
资源管理器
END显示当前窗口的底端
HOME显示当前窗口的顶端
NUMLOCK+数字键盘的减号(-)折叠所选的文件夹
NUMLOCK+数字键盘的加号(+)显示所选文件夹的内容
NUMLOCK+数字键盘的星号(*)显示所选文件夹的所有子文件夹
向左键当前所选项处于展开状态时折叠该项，或选定其父文件夹
向右键当前所选项处于折叠状态时展开该项，或选定第一个子文件夹
自然键盘
【窗口】显示或隐藏“开始”菜单
【窗口】+F1帮助
【窗口】+D显示桌面
【窗口】+R打开“运行”
【窗口】+E打开“我的电脑”
【窗口】+F搜索文件或文件夹
【窗口】+U打开“工具管理器”
【窗口】+BREAK显示“系统属性”
【窗口】+TAB在打开的项目之间切换
辅助功能
按右边的SHIFT键八秒钟切换筛选键的开和关
按SHIFT五次切换粘滞键的开和关
按NUMLOCK五秒钟切换切换键的开和关
左边的ALT+左边的SHIFT+NUMLOCK切换鼠标键的开和关
左边的ALT+左边的SHIFT+PRINTSCREEN切换高对比度的开和关
运行
按“开始”－“运行”，或按WIN键+R，在『运行』窗口中输入：
（按英文字符顺序排列）
%temp%---------打开临时文件夹
.--------------C:\DocumentsandSettings\用户名所在文件夹
..-------------C:\DocumentsandSettings
...------------我的电脑
\--------------C盘
appwize.cpl----添加、删除程序
access.cpl-----辅助功能选项
Accwiz---------辅助功能向导
cmd------------CMD命令提示符
command--------CMD命令提示符
chkdsk.exe-----Chkdsk磁盘检查
certmgr.msc----证书管理实用程序
calc-----------启动计算器
charmap--------启动字符映射表
cintsetp-------仓颉拼音输入法
cliconfg-------SQLSERVER客户端网络实用程序
clipbrd--------剪贴板查看器
control--------打开控制面板
conf-----------启动netmeeting
c完达山mgmt.msc---计算机管理
cleanmgr-------垃圾整理
ciadv.msc------索引服务程序
dcomcnfg-------打开系统组件服务
ddeshare-------打开DDE共享设置
dxdiag---------检查DirectX信息
drwtsn32-------系统医生
devmgmt.msc----设备管理器
desk.cpl-------显示属性
dfrg.msc-------磁盘碎片整理程序
diskmgmt.msc---磁盘管理实用程序
dvdplay--------DVD播放器
eventvwr-------一个事情查看器
eudcedit-------造字程序
explorer-------打开资源管理器
fsmgmt.msc-----共享文件夹管理器
firewall.cpl---WINDOWS防火墙
gpedit.msc-----组策略
hdwwiz.cpl-----添加硬件
iexpress-------木马捆绑工具，系统自带
inetcpl.cpl----INTETNET选项
intl.cpl-------区域和语言选项（输入法选项）
irprops.cpl----无线链接
joy.cpl--------游戏控制器
lusrmgr.msc----本机用户和组
logoff---------注销命令
main.cpl-------鼠标
mem.exe--------显示内存使用情况
migwiz---------文件转移向导
mlcfg32.cpl----邮件
mplayer2-------简易widnowsmediaplayer
mspaint--------画图板
msconfig.exe---系统配置实用程序
mstsc----------远程桌面连接
magnify--------放大镜实用程序
mmc------------打开控制台
mmsys.cpl------声音和音频设备
mobsync--------同步命令
ncpa.cpl-------网络连接
nslookup-------IP地址侦测器
netstartX----开始X服务
netstopX-----停止X服务
netstat-an----命令检查接口
netsetup.cpl---无线网络安装向导
notepad--------打开记事本
nslookup-------IP地址侦探器
narrator-------屏幕“讲述人”
ntbackup-------系统备份和还原
ntmsmgr.msc----移动存储管理器
ntmsoprq.msc---移动存储管理员操作请求
nusrmgr.cpl----用户账户
nwc.cpl--------NetWare客户服务
osk------------打开屏幕键盘
odbcad32-------ODBC数据源管理器
odbccp32.cpl---ODBC数据源管理器
oobe/msoobe/a-检查XP是否激活
packager-------对象包装程序
perfmon.msc----计算机性能监测程序
powercfg.cpl---电源选项
progman--------程序管理器
regedit--------注册表
rsop.msc-------组策略结果集
regedt32-------注册表编辑器
regsvr32/?----调用、卸载DLL文件运行（详细请在cmd中输入regsvr32/?）
sapi.cpl-------语音
services.msc---本地服务设置
syncapp--------创建一个公文包
sysedit--------系统配置编辑器
sigverif-------文件签名验证程序
sndrec32-------录音机
sndvol32-------音量控制程序
shrpubw--------共享文件夹设置工具
secpol.msc-----本地安全策略
sysdm.cpl------系统
syskey---------系统加密（一旦加密就不能解开，保护windowsxp系统的双重密码）
services.msc---本地服务设置
sfc.exe--------系统文件检查器
sfc/scannow---windows文件保护
shutdown-------关机命令（详细请在cmd中输入shutdown/?）
taskmgr--------任务管理器
telephon.cpl---电话和调制解调器选项
telnet---------远程连接程序
timedate.cpl---日期和时间
tourstart------xp简介（安装完成后出现的漫游xp程序）
tsshutdn-------60秒倒计时关机命令
utilman--------辅助工具管理器
winver---------检查Windows版本
winmsd---------系统信息
wiaacmgr-------扫描仪和照相机向导
winchat--------XP自带局域网聊天
wmimgmt.msc----打开windows管理体系结构(WMI)
wordpad--------写字板
wuaucpl.cpl----自动更新
wupdmgr--------windows更新程序
write----------写字板
w script --------windows脚本宿主设置
wscui.cpl------安全中心
#T=wmic 补丁列表
rem http://www.bathome.net/thread-12502-1-1.html
wmic /node:'localhost' /output:c:\a.csv qfe GET description,FixComments,hotfixid,installedby,installedon,servicepackineffect /format:csv

rem http://www.bathome.net/thread-12502-1-1.html
wmic /node:'localhost' /output:c:\a.csv qfe GET description,FixComments,hotfixid,installedby,installedon,servicepackineffect /format:csv
WMIC /NAMESPACE:\\root\cimv2 win32_process get caption
WMIC /NAMESPACE:\\root\cimv2 path win32_serialport get *
WMIC /NAMESPACE:\\root\wmi path MSSerial_PortName get *

#T=XCopy Command
echo off

for /f "tokens=2 delims= " %%j in ('Date /T') do set _WeekDay_=%%j
echo %_WeekDay_%
if %_WeekDay_%==星期一 (set _WeekDayID_=1)
if %_WeekDay_%==星期二 (set _WeekDayID_=2)
if %_WeekDay_%==星期三 (set _WeekDayID_=3)
if %_WeekDay_%==星期四 (set _WeekDayID_=4)
if %_WeekDay_%==星期五 (set _WeekDayID_=5)
if %_WeekDay_%==星期六 (set _WeekDayID_=6)
if %_WeekDay_%==星期日 (set _WeekDayID_=7)


for /f "tokens=1 delims=:" %%j in ('Time /T') do set _Hour_=%%j
echo %_Hour_%

if %_Hour_%==00 (set _HourID_=23)
if %_Hour_%==01 (set _HourID_=00)
if %_Hour_%==02 (set _HourID_=01)
if %_Hour_%==03 (set _HourID_=02)
if %_Hour_%==04 (set _HourID_=03)
if %_Hour_%==05 (set _HourID_=04)
if %_Hour_%==06 (set _HourID_=05)
if %_Hour_%==07 (set _HourID_=06)
if %_Hour_%==08 (set _HourID_=07)
if %_Hour_%==09 (set _HourID_=08)
if %_Hour_%==10 (set _HourID_=09)
if %_Hour_%==11 (set _HourID_=10)
if %_Hour_%==12 (set _HourID_=11)
if %_Hour_%==13 (set _HourID_=12)
if %_Hour_%==14 (set _HourID_=13)
if %_Hour_%==15 (set _HourID_=14)
if %_Hour_%==16 (set _HourID_=15)
if %_Hour_%==17 (set _HourID_=16)
if %_Hour_%==18 (set _HourID_=17)
if %_Hour_%==19 (set _HourID_=18)
if %_Hour_%==20 (set _HourID_=19)
if %_Hour_%==21 (set _HourID_=20)
if %_Hour_%==22 (set _HourID_=21)
if %_Hour_%==23 (set _HourID_=22)

if %_WeekDayID_%==7 (
	if %_Hour_%==04 (
		goto :endLabel
	)
	if %_Hour_%==05 (
		goto :endLabel
	)
	if %_Hour_%==06 (
		set _HourID_=03
	)
)

if %_Hour_%==00 (
	if %_WeekDayID_%==1 (
		set _WeekDayID_=7
	) else (
		set /a _WeekDayID_=%_WeekDayID_%-1
	)
	set _HourID_=23
)

echo %_WeekDayID_%

rem =======================================================

set _DbName_=CMS2005_2
set _DBsourcePath_=\\192.168.136.6\db-prtl2.y.tsmBackup
set _DBtargetPath_=E:\db-prtl2.tsmbackup
set _cmd_=xcopy %_DBsourcePath_%\%_DbName_%\%_WeekDayID_%\%_DbName_%.%_WeekDayID_%.%_HourID_%.*.bak %_DBtargetPath_%\%_DbName_%\%_WeekDayID_%\%_DbName_%.%_WeekDayID_%.%_HourID_%.*.bak /E /R /Y

rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set _now_=%%j.%%k.%%l
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set _now_=%_now_%-%%j.%%k
echo begin **************************************
echo %_cmd_%

:endLabel
echo %_DbName_% begin: %_now_%
rem %_cmd_%
rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set _now_=%%j.%%k.%%l
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set _now_=%_now_%-%%j.%%k
echo %_DbName_% end: %_now_%
echo end **************************************

#T=XP启用远程桌面多用户登录
@echo off
echo.
echo    正在启用远程桌面多用户服务。
echo    请稍候……
net stop TermService>nul 2>nul
ren %SystemRoot%\system32\dllcache\termsrv.dll termsrv.dl_>nul 2>nul
ren %SystemRoot%\system32\termsrv.dll termsrv.dl_>nul 2>nul
copy /y termsrv.dll %SystemRoot%\system32\dllcache\>nul 2>nul
copy /y termsrv.dll %SystemRoot%\system32\>nul 2>nul
setlocal
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\Licensing Core" /f /v EnableConcurrentSessions /t REG_DWORD /d "00000001">nul 2>nul
endlocal
sc config FastUserSwitchingCompatibility start= auto>nul 2>nul
net start TermService>nul 2>nul
echo.
echo    远程桌面多用户登录功能启用完毕！
echo    请重新启动计算机！
echo.
echo    任意键退出……
pause>nul
exit
#T=常用的开始→运行→输入命令集锦
常用的开始→运行→输入命令集锦
gpedit.msc		组策略
sndrec32		录音机
Nslookup		IP地址侦测器
explorer		打开资源管理器
logoff			注销命令
tsshutdn		60秒倒计时关机命令
lusrmgr.msc		本机用户和组
dsa.msc			AD 用户和计算机
services.msc		本地服务设置
oobe/msoobe /a		检查XP是否激活
notepad			打开记事本
cleanmgr		垃圾整理
net start messenger	开始信使服务
compmgmt.msc		计算机管理
net stop messenger	停止信使服务
conf			启动 netmeeting
dvdplay			DVD播放器
charmap			启动字符映射表
diskmgmt.msc		磁盘管理实用程序
calc			启动计算器
dfrg.msc		磁盘碎片整理程序
chkdsk.exe		Chkdsk磁盘检查
devmgmt.msc		设备管理器
regsvr32 /u *.dll	停止dll文件运行
drwtsn32		系统医生
rononce -p		15秒关机
dxdiag			检查DirectX信息
regedt32		注册表编辑器
Msconfig.exe		系统配置实用程序
rsop.msc		组策略结果集
mem.exe			显示内存使用情况
regedit.exe		注册表
winchat			XP自带局域网聊天
progman			程序管理器
winmsd			系统信息
perfmon.msc		计算机性能监测程序
winver			检查Windows版本
sfc /scannow		扫描错误并复原
taskmgr			任务管理器(2000/xp/2003)
#T=当前时间
rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set _now_=%%j.%%k.%%l
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set _now_=%_now_%-%%j.%%k

tasklist /s phs-app-01 /v /fo csv > phs-app-01.%_now_%.csv.txt
tasklist /s phs-app-02 /v /fo csv > phs-app-02.%_now_%.csv.txt
tasklist /s phs-ifc-01 /v /fo csv > phs-ifc-01.%_now_%.csv.txt
tasklist /s phs-ifc-02 /v /fo csv > phs-ifc-02.%_now_%.csv.txt
tasklist /s db-qry-01 /v /fo csv > db-qry-01.%_now_%.csv.txt
tasklist /s db-qry-02 /v /fo csv > db-qry-02.%_now_%.csv.txt
#T=命令行大全
命令大全 
开始菜单中的“运行”是通向程序的快捷途径，输入特定的命令后，即可快速的打开Windows的大部分程序，熟练的运用它，将给我们的操作带来诸多便捷。 

winver 检查Windows版本 
wmimgmt.msc 打开Windows管理体系结构(wmi) 
wupdmgr Windows更新程序 
wscript Windows脚本宿主设置 
write 写字板 
winmsd 系统信息 
wiaacmgr 扫描仪和照相机向导 
winchat xp自带局域网聊天 
mem.exe 显示内存使用情况 
msconfig.exe 系统配置实用程序 
mplayer2 简易widnows media player 
mspaint 画图板 
mstsc 远程桌面连接 
mplayer2 媒体播放机 
magnify 放大镜实用程序 
mmc 打开控制台 
mobsync 同步命令 

dxdiag 检查directx信息 
drwtsn32 系统医生 
devmgmt.msc 设备管理器 
dfrg.msc 磁盘碎片整理程序 
diskmgmt.msc 磁盘管理实用程序 
dcomcnfg 打开系统组件服务 
ddeshare 打开dde共享设置 
dvdplay dvd播放器 

net stop messenger 停止信使服务 
net start messenger 开始信使服务 
notepad 打开记事本 
nslookup 网络管理的工具向导 
ntbackup 系统备份和还原 
narrator 屏幕“讲述人” 
ntmsmgr.msc 移动存储管理器 
ntmsoprq.msc 移动存储管理员操作请求 
netstat -an （tc）命令检查接口 

syncapp 创建一个公文包 
sysedit 系统配置编辑器 
sigverif 文件签名验证程序 
sndrec32 录音机 
shrpubw 创建共享文件夹 
secpol.msc 本地安全策略 
syskey 系统加密，一旦加密就不能解开，保护Windows xp系统的双重密码 
services.msc 本地服务设置 
sndvol32 音量控制程序 
sfc.exe 系统文件检查器 
sfc /scannow windows文件保护 tsshutdn 60秒倒计时关机命令 
tourstart xp简介（安装完成后出现的漫游xp程序） 
taskmgr 任务管理器 

eventvwr 事件查看器 
eudcedit 造字程序 
explorer 打开资源管理器 

packager 对象包装程序 
perfmon.msc 计算机性能监测程序 
progman 程序管理器 

regedit.exe 注册表 
rsop.msc 组策略结果集 
regedt32 注册表编辑器 
rononce -p 15秒关机 
regsvr32 /u *.dll 停止dll文件运行 
regsvr32 /u zipfldr.dll 取消zip支持 

cmd.exe cmd命令提示符 
chkdsk.exe chkdsk磁盘检查 
certmgr.msc 证书管理实用程序 
calc 启动计算器 
charmap 启动字符映射表 
cliconfg sql server 客户端网络实用程序 
clipbrd 剪贴板查看器 
conf 启动netmeeting 
compmgmt.msc 计算机管理 
cleanmgr 垃圾整理 
ciadv.msc 索引服务程序 

osk 打开屏幕键盘 
odbcad32 odbc数据源管理器 
oobe/msoobe /a 检查xp是否激活 
lusrmgr.msc 本机用户和组 
logoff 注销命令 

iexpress 木马捆绑工具，系统自带 

nslookup ip地址侦测器 

fsmgmt.msc 共享文件夹管理器 

utilman 辅助工具管理器 

gpedit.msc 组策略 

以下为Windows操作系统的常用运行命令,执行这些命令,就能打开系统对应的相关实用程序,如果大家能基本利用,就能检查并修复系统的最基本的故障,除注销,关闭系统命令外,其它所有命令,大家不妨一试!! 

运行\输入CMD\输入 对应的相关实用程序: 
. 打开C:＼Documents and Settings＼XXX(当前登录Windows XP的用户名) 
.. 打开Windows XP所在的盘符下的Documents and Settings文件夹 
... 打开“我的电脑”选项。 
accwiz.exe 辅助工具向导 
actmovie.exe 直接显示安装工具 
append.exe 允许程序打开制定目录中的数据 
arp.exe 显示和更改计算机的IP与硬件物理地址的对应列表 
at.exe 计划运行任务 
atmadm.exe ATM调用管理器统计 
attrib.exe 显示和更改文件和文件夹属性 
autochk.exe 检测修复文件系统 (XP不可用) 
autoconv.exe 在启动过程中自动转化系统 (XP不可用) 
autofmt.exe 在启动过程中格式化进程 (XP不可用) 
autolfn.exe 使用长文件名格式 (XP不可用) 
arp.exe 显示和更改计算机的IP与硬件物理地址的对应 
calc.exe 计算器 
Bootvrfy.exe 通报启动成功 
cacls.exe 显示和编辑ACL 
cdplayer.exe CD播放器 
change.exe 与终端服务器相关的查询 (XP不可用) 
charmap.exe 字符映射表 
chglogon.exe 启动或停用会话记录 (XP不可用) 
chgport.exe 改变端口（终端服务） (XP不可用) 
chgusr.exe 改变用户（终端服务） (XP不可用) 
chkdsk.exe 磁盘检测程序 
chkntfs.exe NTFS磁盘检测程序 
cidaemon.exe 组成Ci文档服务 
cipher.exe 在NTFS上显示或改变加密的文件或目录 
cisvc.exe 打开索引内容 
ckcnv.exe 变换Cookie 
cleanmgr.exe 磁盘清理 
cliconfg.exe SQL客户网络工具 
clipbrd.exe 剪贴簿查看器 
clipsrv.exe 运行Clipboard服务 
clspack.exe 建立系统文件列表清单 
cluster.exe 显示域的集群 (XP不可用) 
cmd.exe 进2000\XP DOS 
cmdl32.exe 自动下载连接管理 
cmmgr32.exe 连接管理器 
cmmon32.exe 连接管理器监视 
cmstp.exe 连接管理器配置文件安装程序 
comclust.exe 集群 
comp.exe 比较两个文件和文件集的内容 
conf 启动netmeeting聊天工具 
control userpasswords2 XP密码管理. 
compmgmt.msc 计算机管理 
cprofile.exe 转换显示模式 (XP不可用) 
开始,运行,输入CMD\输入net config workstation计算机名 \完整的计算机名\用户名 
工作站处于活动状态（即网络描述） \软件版本（即软件版本号） \工作站域 工作站域的 DNS 名称 
登录域 \COM 打开时间超时（秒） \COM 发送量（字节） \COM 发送超时 (msec) 
CMD\输入net config workstation 更改可配置工作站服务设置。 
CMD\输入net config server 可以显示不能配置的下服务器计算机名 \服务器注释 \服务器版本（即软件版本号） 
服务器处于活动状态（即网络描述） \服务器处于隐藏状态（即 /hidden 设置） 
最大登录用户数（即可使用服务器共享资源的最大用户数） 
每个会话打开文件的最大数（即用户可在一个会话中打开服务器文件的最大数） 
空闲会话时间（最小值） 
chkdsk.exe 磁盘检查. 
Chkdsk /r 2000命令控制台中的Chkdsk /r命令检查修复系统文件 
cleanmgr 垃圾整理 
Clipbrd 剪贴板查看器 
C:boot.ini 打开启动菜单 
compact.exe 显示或改变NTFS分区上文件的压缩状态 
conime.exe IME控制台 
control.exe 控制面板 
convert.exe NTFS 转换文件系统到NTFS 
convlog.exe 转换IIS日志文件格式到NCSA格式 
cprofile.exe 转换显示模式 
cscript.exe 较本宿主版本 
csrss.exe 客户服务器Runtime进程 (XP不可用) 
csvde.exe 格式转换程序 (XP不可用) 
dcpromo 活动目录安装(XP不可用) 
drwtsn32 系统医生 
diskmgmt.msc 磁盘管理器(和PowerQuest PartitionMagic 8.0) 
dvdplay DVD 播放器 
devmgmt.msc 设备管理器(检查电脑硬件,驱动) 
dxdiag 检查DirectX信息 
dcomcnfg.exe DCOM配置属性 (控制台根目录) 
dcpromo.exe 安装向导 (XP不可用) 
ddeshare.exe DDE共享 
debug.exe 检查DEBUG 
dfrgfat.exe FAT分区磁盘碎片整理程序 
dfrgntfs.exe NTFS分区磁盘碎片整理程序 (XP不可用) 
dfs_cmd_.exe 配置DFS树 (XP不可用) 
dfsinit.exe 分布式文件系统初始化(XP不可用) 
dfssvc.exe 分布式文件系统服务器 (XP不可用) 
diantz.exe 制作CAB文件 
diskperf.exe 磁盘性能计数器 
dmremote.exe 磁盘管理服务的一部分 (XP不可用) 
doskey.exe 命令行创建宏 
dosx.exe DOS扩展 
dplaysvr.exe 直接运行帮助 (XP不可用) 
drwatson.exe 华生医生错误检测 
drwtsn32.exe 华生医生显示和配置管理 
dvdplay.exe DVD播放 
dxdiag.exe Direct-X诊断工具 
edlin.exe 命令行的文本编辑 
esentutl.exe MS数据库工具 
eudcedit.exe 造字程序 
eventvwr.exe 事件查看器 
exe2bin.exe 转换EXE文件到二进制 
expand.exe 解压缩 
extrac32.exe 解CAB工具 
fsmgmt.msc 共享文件夹 
fastopen.exe 快速访问在内存中的硬盘文件 
faxcover.exe 传真封面编辑 
faxqueue.exe 显示传真队列 
faxsend.exe 发送传真向导 
faxsvc.exe 启动传真服务 
fc.exe 比较两个文件的不同 
find.exe 查找文件中的文本行 
findstr.exe 查找文件中的行 
finger.exe 一个用户并显示出统计结果 
fixmapi.exe 修复MAPI文件 
flattemp.exe 允许或者禁用临时文件目录 (XP不可用) 
fontview.exe 显示字体文件中的字体 
forcedos.exe 强制文件在DOS模式下运行 
ftp.exe FTP下载 
gpedit.msc 组策略 
gdi.exe 图形界面驱动 
grpconv.exe 转换程序管理员组 
hostname.exe 显示机器的Hostname 
Internat 输入法图标 
iexpress 木马捆绑工具，系统自带 
ieshwiz.exe 自定义文件夹向导 
iexpress.exe iexpress安装包 
iisreset.exe 重启IIS服务(未安装IIS,不可用) 
internat.exe 键盘语言指示器 (XP不可用) 
ipconfig.exe 查看IP配置 
ipsecmon.exe IP安全监视器 
ipxroute.exe IPX路由和源路由控制程序 
irftp.exe 无线连接 
ismserv.exe 安装或者删除Service Control Manager中的服务 
jdbgmgr.exe Java4的调试器 
jetconv.exe 转换Jet Engine数据库 (XP不可用) 
jetpack.exe 压缩Jet数据库 (XP不可用) 
jview.exe Java的命令行装载者 
label.exe 改变驱动器的卷标 
lcwiz.exe 许可证向导 (XP不可用) 
ldifde.exe LDIF目录交换命令行管理 (XP不可用) 
licmgr.exe 终端服务许可协议管理 (XP不可用) 
lights.exe 显示连接状况 (XP不可用) 
llsmgr.exe Windows 2000 许可协议管理 (XP不可用) 
llssrv.exe 启动许可协议服务器 (XP不可用) 
locator.exe RPC Locator 远程定位 
lodctr.exe 调用性能计数 
logoff.exe 注销当前用户 
lpq.exe 显示远端的LPD打印队列的状态，显示被送到基于Unix的服务器的打印任务 
lpr.exe 用于Unix客户打印机将打印任务发送给连接了打印设备的NT的打印机服务器。 
lsass.exe 运行LSA和Server的DLL 
lserver.exe 指定默认Server新的DNS域 (XP不可用) 
lusrmgr.msc 本地账户管理 
mmc 控制台 
mplayer2 播放器 
macfile.exe 管理MACFILES (XP不可用) 
magnify.exe 放大镜 
makecab.exe 制作CAB文件 
mem.exe 显示内存状态 
migpwd.exe 迁移密码 
mmc.exe 控制台 
mnmsrvc.exe 远程桌面共享 
mobsync.exe 同步目录管理器 
mountvol.exe 创建、删除或列出卷的装入点。 
mplay32.exe Media Player 媒体播放器 
mpnotify.exe 通知应用程序 
mqbkup.exe 信息队列备份和恢复工具 
mqmig.exe MSMQ Migration Utility 信息队列迁移工具 
mrinfo.exe 使用SNMP多点传送路由 
mscdexnt.exe 安装MSCD 
msdtc.exe 动态事务处理控制台 
msg.exe 发送消息到本地或远程客户 
mshta.exe HTML应用程序主机 
msiexec.exe 开始Windows安装程序 
mspaint.exe 打开画图板 
mstask.exe 任务计划表程序 
mstinit.exe 任务计划表安装 
Msconfig.exe 系统配置实用程序 (配置启动选项,服务项) 
mem.exe 显示内存使用情况 
mspaint 画图板 
Net Stop Messenger 停止信使服务 
Net Start Messenger 恢复信使服务 
nslookup 网络管理的工具 
Nslookup IP 地址侦测器 
ntbackup 系统备份和还原 
nbtstat.exe 使用 NBT（TCP/IP 上的 NetBIOS）显示协议统计和当前 TCP/IP 连接。 
nddeapir.exe NDDE API服务器端 
netsh.exe 用于配置和监控 Windows 2000 命令行脚本接口(XP不可用) 
netstat.exe 显示协议统计和当前的 TCP/IP 网络连接。 
nlsfunc.exe 加载特定国家的信息。Windows 2000 和 MS-DOS 子系统不使用该命令接受该命令只是为了与 MS-DOS 文件兼容。 
notepad.exe 打开记事本 
nslookup.exe 该诊断工具显示来自域名系统 (DNS) 名称服务器的信息。 
ntbackup.exe 备份和故障修复工具 
ntfrs.exe NT文件复制服务 (XP不可用) 
ntvdm.exe 模拟16位Windows环境 
nw16.exe NetWare转向器 
nwscript.exe 运行Netware脚本 
odbcad32.exe 32位ODBC数据源管理 (驱动程序管理) 
odbcconf.exe 命令行配置ODBC驱动和数据源 
packager.exe 对象包装程序 
pathping.exe 包含Ping和Tracert的程序 
pentnt.exe 检查Pentium的浮点错误 
perfmon.exe 系统性能监视器 
ping.exe 验证与远程计算机的连接 
posix.exe 用于兼容Unix 
print.exe 打印文本文件或显示打印队列的内容。 
progman.exe 程序管理器 
psxss.exe Posix子系统应用程序 
qappsrv.exe 在网络上显示终端服务器可用的程序 
qprocess.exe 在本地或远程显示进程的信息（需终端服务） 
query.exe 查询进程和对话 (XP不可用) 
quser.exe 显示用户登陆的信息（需终端服务） 
qwinsta.exe 显示终端服务的信息 
rononce -p 15秒关机 
rasAdmin 远程访问服务. 
regedit.exe 注册表编辑器 
rasadmin.exe 启动远程访问服务 (XP不可用) 
rasautou.exe 建立一个RAS连接 
rasdial.exe 宽带,拨号连接 
ras.exe 运行RAS连接 (XP不可用) 
rcp.exe 计算机和运行远程外壳端口监控程序 rshd 的系统之间复制文件 
rdpclip.exe 终端和本地复制和粘贴文件 
recover.exe 从坏的或有缺陷的磁盘中恢复可读取的信息。 
redir.exe 运行重定向服务 
regedt32.exe 32位注册服务 
regini.exe 用脚本修改注册许可 
regwiz.exe 注册向导 
replace.exe 用源目录中的同名文件替换目标目录中的文件。 
rexec.exe rexec 命令在执行指定命令前，验证远程计算机上的用户名，只有安装了 TCP/IP 协议后才可以使用该命令。 
risetup.exe 运行远程安装向导服务 (XP不可用) 
route.exe 控制网络路由表 
rsh.exe 在运行 RSH 服务的远程计算机上运行命令 
rsnotify.exe 远程存储通知回显 
runas.exe 允许用户用其他权限运行指定的工具和程序 
rundll32.exe 启动32位DLL程序 
rwinsta.exe 重置会话子系统硬件和软件到最初的值 
Sndvol32 音量控制程序 
sfc.exe 或CMD\ sfc.exe 回车 系统文件检查器 
services.msc 网络连接服务 
syskey 系统加密，(一旦加密就不能解开，保护windows xp系统的双重密码wupdmgr WIDNOWS UPDATE) 
SCANREG/RESTORE 命令恢复最近的注册表 
secedit.exe 自动化安全性配置管理 
services.exe 控制所有服务 
sethc.exe 设置高对比 
setver.exe 设置 MS-DOS 子系统向程序报告的 MS-DOS 版本号 
sfc.exe 系统文件检查 
shadow.exe 监控另外一台中端服务器会话 
shrpubw.exe 建立和共享文件夹 
sigverif.exe 文件签名验证 
smlogsvc.exe 性能日志和警报 (XP不可用) 
sndrec32.exe 录音机 
sndvol32.exe 显示声音控制信息 
snmp.exe 简单网络管理协议 (XP不可用) 
snmptrap.exe SNMP工具 (XP不可用) 
srvmgr.exe 服务器管理器 (XP不可用) 
subst.exe 将路径与驱动器盘符关联 
sysedit.exe 系统配置编辑器 
syskey.exe NT账号数据库加密工具 
sysocmgr.exe > Windows 安装程序 
systray.exe 在低权限运行systray 
taskmgr 任务管理器 
tasklist /svc(CMD)了解每个SVCHOST进程到底提供了多少系统服务(2000\98不可用) 
tlist -S(CMD) 了解每个SVCHOST进程到底提供了多少系统服务( 
taskman.exe 任务管理器 (XP不可用) 
taskmgr.exe 任务管理器 
tcmsetup.exe 电话服务客户安装 
tcpsvcs.exe TCP服务 
termsrv.exe 终端服务 
tftp.exe 将文件传输到正在运行 TFTP 服务的远程计算机或从正在运行 TFTP 服务的远程计算机传输文件 
themes.exe 桌面主题 (XP不可用) 
tlntadmn.exe Administrator Telnet服务管理 
tlntsess.exe 显示目前的Telnet会话 
tlntsvr.exe 开始Telnet服务 
tracert.exe 诊断实用程序将包含不同生存时间 (TTL) 值的 Internet 控制消息协议 (ICMP) 回显数据包发送到目标，以决定到达目标采用的路由 
tsadmin.exe Administrator 终端服务管理器 (XP不可用) 
tscon.exe 粘贴用户会话到终端对话 
tsdiscon.exe 断开终端服务的用户 
tskill.exe 杀掉终端服务 
tsprof.exe 用终端服务得出查询结果 
tsshutdn.exe 关闭系统 
unlodctr.exe 性能监视器的一部分 
upg351db.exe 升级Jet数据库 (XP不可用) 
ups.exe UPS service UPS服务 
user.exe Windows核心服务 
userinit.exe 打开我的文档 
usrmgr.exe 域用户管理器 
utilman.exe 指定2000启动时自动打开那台机器 
vwipxspx.exe 调用IPX/SPX VDM 
w32tm.exe 时间服务器 
wextract.exe 解压缩Windows文件 
winchat.exe 打开Windows聊天工具 
winhlp32.exe 运行帮助系统 
winmsd.exe 查看系统信息 
winver.exe 显示Windows版本 
wizmgr.exe Windows管理向导 (XP不可用) 
wjview.exe Java 命令行调用Java 
write.exe 打开写字板 
wscript.exe 脚本工具 
wupdmgr.exe Windows update 运行Windows update升级向导 
winver 检查Windows版本 
Win98系统工具 
开始,运行,输入Msconfig 系统配置实用工具 配置启动选项，包括config.sys、autoexec.bat、win.ini、system.ini和注册表及程序菜单中的启动项。并可设置是否故障启动。 
开始,运行,输入Regedit 注册表修改工具 注册表编辑器，如果没有把握不要随意修改注册表！ 
开始,运行,输入Regsvr32 dll注册工具 当提示找不到dll文件时，可用此来注册该动态连接库。 
开始,运行,输入Regwiz 注册向导 用于注册。校验系统文件，并可恢复系统文件。 
如果启动时出现类似*.vxd文件错误，可用此恢复该vxd文件。 
开始,运行,输入Scandskw 磁盘扫描程序,用于扫描修复磁盘。如果磁盘或文件出现错误，可用来初步修复。 
开始,运行,输入DxDiag DirectX诊断工具可用于检测DirectX运行是否正常。 
开始,运行,输入NETSCAPE 

ESC：清除当前命令行； 
F7：显示命令历史记录，以图形列表窗的形式给出所有曾经输入的命令，并可用上下箭头键选择再次执行该命令。 
F8：搜索命令的历史记录，循环显示所有曾经输入的命令，直到按下回车键为止； 
F9：按编号选择命令，以图形对话框方式要求您输入命令所对应的编号(从0开始)，并将该命令显示在屏幕上； 
Ctrl+H：删除光标左边的一个字符； 
Ctrl+C Ctrl+Break，强行中止命令执行； 
Ctrl+M：表示回车确认键； 
Alt+F7：清除所有曾经输入的命令历史记录； 
Alt+PrintScreen：截取屏幕上当前命令窗里的内容。 
病毒破坏了系统文件，请使用杀毒软件查杀病毒，然后利用Windows 2000提供的“命令控制台”中的Chkdsk /r命令检查修复系统文件即可。 


1. gpedit.msc-----组策略 
2. sndrec32-------录音机
3. Nslookup-------IP地址侦测器
4. explorer-------打开资源管理器
5. logoff---------注销命令
6. tsshutdn-------60秒倒计时关机命令
7. lusrmgr.msc----本机用户和组
8. services.msc---本地服务设置
9. oobe/msoobe /a----检查XP是否激活
10. notepad--------打开记事本
11. cleanmgr-------垃圾整理
12. net start messenger----开始信使服务
13. compmgmt.msc---计算机管理
14. net stop messenger-----停止信使服务
15. conf-----------启动netmeeting
16. dvdplay--------DVD播放器
17. charmap--------启动字符映射表
18. diskmgmt.msc---磁盘管理实用程序
19. calc-----------启动计算器
20. dfrg.msc-------磁盘碎片整理程序
21. chkdsk.exe-----Chkdsk磁盘检查
22. devmgmt.msc--- 设备管理器
23. regsvr32 /u *.dll----停止dll文件运行
24. drwtsn32------ 系统医生
25. rononce -p ----15秒关机
26. dxdiag---------检查DirectX信息
27. regedt32-------注册表编辑器
28. Msconfig.exe---系统配置实用程序
29. rsop.msc-------组策略结果集
30. mem.exe--------显示内存使用情况
31. regedit.exe----注册表
32. winchat--------XP自带局域网聊天
33. progman--------程序管理器
34. winmsd---------系统信息
35. perfmon.msc----计算机性能监测程序
36. winver---------检查Windows版本 
37. sfc /scannow-----扫描错误并复原
38. taskmgr-----任务管理器（2000／xp／2003
39. winver---------检查Windows版本 
40. wmimgmt.msc----打开windows管理体系结构(WMI) 
41. wupdmgr--------windows更新程序 
42. wscript--------windows脚本宿主设置 
43. write----------写字板 
44. winmsd---------系统信息 
45. wiaacmgr-------扫描仪和照相机向导 
46. winchat--------XP自带局域网聊天
47. mem.exe--------显示内存使用情况 
48. Msconfig.exe---系统配置实用程序 
49. mplayer2-------简易widnows media player 
50. mspaint--------画图板 
51. mstsc----------远程桌面连接 
52. mplayer2-------媒体播放机 
53. magnify--------放大镜实用程序 
54. mmc------------打开控制台 
55. mobsync--------同步命令
56. dxdiag---------检查DirectX信息 
57. drwtsn32------ 系统医生 
58. devmgmt.msc--- 设备管理器 
59. dfrg.msc-------磁盘碎片整理程序 
60. diskmgmt.msc---磁盘管理实用程序 
61. dcomcnfg-------打开系统组件服务 
62. ddeshare-------打开DDE共享设置 
63. dvdplay--------DVD播放器
64. net stop messenger-----停止信使服务 
65. net start messenger----开始信使服务 
66. notepad--------打开记事本 
67. nslookup-------网络管理的工具向导 
68. ntbackup-------系统备份和还原 
69. narrator-------屏幕“讲述人” 
70. ntmsmgr.msc----移动存储管理器 
71. ntmsoprq.msc---移动存储管理员操作请求 
72. netstat -an----(TC)命令检查接口
73. syncapp--------创建一个公文包 
74. sysedit--------系统配置编辑器 
75. sigverif-------文件签名验证程序 
76. sndrec32-------录音机 
77. shrpubw--------创建共享文件夹 
78. secpol.msc-----本地安全策略 
79. syskey---------系统加密，一旦加密就不能解开，保护windows xp系统的双重密码 
80. services.msc---本地服务设置 
81. Sndvol32-------音量控制程序 
82. sfc.exe--------系统文件检查器 
83. sfc /scannow---windows文件保护
84. tsshutdn-------60秒倒计时关机命令 
85. tourstart------xp简介（安装完成后出现的漫游xp程序） 
86. taskmgr--------任务管理器
87. eventvwr-------事件查看器 
88. eudcedit-------造字程序 
89. explorer-------打开资源管理器
90. packager-------对象包装程序 
91. perfmon.msc----计算机性能监测程序 
92. progman--------程序管理器
93. regedit.exe----注册表 
94. rsop.msc-------组策略结果集 
95. regedt32-------注册表编辑器 
96. rononce -p ----15秒关机 
97. regsvr32 /u *.dll----停止dll文件运行 
98. regsvr32 /u zipfldr.dll------取消ZIP支持
99. cmd.exe--------CMD命令提示符 
100. chkdsk.exe-----Chkdsk磁盘检查 
101. certmgr.msc----证书管理实用程序 
102. calc-----------启动计算器 
103. charmap--------启动字符映射表 
104. cliconfg-------SQL SERVER 客户端网络实用程序 
105. Clipbrd--------剪贴板查看器 
106. conf-----------启动netmeeting 
107. compmgmt.msc---计算机管理 
108. cleanmgr-------垃圾整理 
109. ciadv.msc------索引服务程序
110. osk------------打开屏幕键盘 
111. odbcad32-------ODBC数据源管理器 
112. oobe/msoobe /a----检查XP是否激活 
113. lusrmgr.msc----本机用户和组 
114. logoff---------注销命令
115. iexpress-------木马捆绑工具，系统自带
116. Nslookup-------IP地址侦测器
117. fsmgmt.msc-----共享文件夹管理器
118. utilman--------辅助工具管理器
119. gpedit.msc-----组策略 
#T=批处理 变量 宏 参数
@echo off

cls

echo %%~0  %~0
echo %%~f0   %~f0
echo %%~d0   %~d0
echo %%~p0   %~p0
echo %%~n0   %~n0
echo %%~x0   %~x0
echo %%~s0   %~s0
echo %%~a0   %~a0
echo %%~t0   %~t0
echo %%~z0   %~z0

pause
#T=前N天
@echo off
set _daysOffset_=%1
rem 假设日期格式为: 2009-06-12 星期五
call :DateToDays %date:~0,4% %date:~5,2% %date:~8,2% days
set /a days+=%_daysOffset_%
call :DaysToDate %days% yyyy MM dd
set _theDate_=%yyyy%-%MM%-%dd%
echo %_theDate_%
goto :EOF

:DateToDays %yyyy% %MM% %dd% days
setlocal
set yyyy=%1&set MM=%2&set dd=%3
if 1%yyyy% LSS 200 (
						if 1%yyyy% LSS 170 (
							set yyyy=20%yyyy%
						) else (
							set yyyy=19%yyyy%
						)
					)
set /a dd=100%dd%%%100,MM=100%MM%%%100
set /a z=14-MM,z/=12,y=yyyy+4800-z,m=MM+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF

:DaysToDate %days% yyyy MM dd
setlocal ENABLEEXTENSIONS
set /a a=%1+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5
set /a dd=-dd+e+1,MM=-m/10,MM*=12,MM+=m+3,yyyy=b*100+d-4800+m/10
(if %MM% LSS 10 set MM=0%MM%)&(if %dd% LSS 10 set dd=0%dd%)
endlocal&set %2=%yyyy%&set %3=%MM%&set %4=%dd%&goto :EOF
#T=取出星期几
for /f "tokens=2 delims= " %%j in ('Date /T') do set _WeekDay_=%%j

echo %_WeekDay_%

if %_WeekDay_%==星期一 set _WeekDayID_=7
if %_WeekDay_%==星期二 set _WeekDayID_=1
if %_WeekDay_%==星期三 set _WeekDayID_=2
if %_WeekDay_%==星期四 set _WeekDayID_=3
if %_WeekDay_%==星期五 set _WeekDayID_=4
if %_WeekDay_%==星期六 set _WeekDayID_=5
if %_WeekDay_%==星期日 set _WeekDayID_=6

rem set _DbName_=Advertisement
rem set _DBsourcePath_=\\db-prtl-01\db-prtl.tsmBackup
rem set _DBtargetPath_=E:\db-prtl.tsmbackup
rem set _cmd_=xcopy %_DBsourcePath_%\%_DbName_%\%_WeekDayID_% %_DBtargetPath_%\%_DbName_%\%_WeekDayID_%\ /E /R /Y
rem echo %_cmd_%
rem %_cmd_%

set _DbName_=CMS2005_23
set _DBsourcePath_=\\db-prtl-04\db-prtl2.tsmBackup
set _DBtargetPath_=E:\db-prtl2.tsmbackup
set _cmd_=xcopy %_DBsourcePath_%\%_DbName_%\%_WeekDayID_% %_DBtargetPath_%\%_DbName_%\%_WeekDayID_%\ /E /R /Y
echo %_cmd_%
%_cmd_%


set _DbName_=vnetwebia
set _DBsourcePath_=\\db-prtl-04\db-prtl2.tsmBackup
set _DBtargetPath_=E:\db-prtl2.tsmbackup
set _cmd_=xcopy %_DBsourcePath_%\%_DbName_%\%_WeekDayID_% %_DBtargetPath_%\%_DbName_%\%_WeekDayID_%\ /E /R /Y
echo %_cmd_%
%_cmd_%

#T=日期的前后时间计算
@echo off
title 日期查询
color 1f
if [%1]==[] call :Help
call :Date2Day %1 days
set/a days=%days%+%2
call :Day2Date %days% date
echo.
echo -----------结果---------------
echo.
echo 你查询的日期为：%date%
echo ------------------------------
rem cmd /k

:Date2Day
setlocal ENABLEEXTENSIONS 
for /f "tokens=1-3 delims=/-, " %%a in ('echo/%1') do ( 
  set yy=%%a & set mm=%%b & set dd=%%c 
)
set /a dd=100%dd%%%100,mm=100%mm%%%100 
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,j=153*m+2 
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %2=%j%&goto :EOF 

:Day2Date
setlocal ENABLEEXTENSIONS 
set /a i=%1,a=i+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a 
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5 
set /a dd=-dd+e+1,mm=-m/10,mm*=12,mm+=m+3,yy=b*100+d-4800+m/10 
(if %mm% LSS 10 set mm=0%mm%)&(if %dd% LSS 10 set dd=0%dd%) 
endlocal&set %2=%yy%-%mm%-%dd%&goto :EOF 

:Help
    rem cls
    echo ________________________________________________                       
    echo 使用方法：%~nx0 [日期] [天数] 
    echo.                           
    echo 日期格式：2007-03-31                     
    echo 天数格式：+/-查询的天数                        
    echo 示例：%~nx0 2007-03-31 3 就是查询3天后的日期  
    echo ________________________________________________
    echo.
    rem cmd /k
#T=日志前N天按日期归整 收集
@echo off

setlocal

set _daysOffset_=-200

echo ===========================================================
echo 日志前N天按日期归整  收集
echo data:
echo \\machine-01\log\app1\aaa.log.txt
echo \\machine-02\log\app2\%%_yyyy_%%#%%_MM_%%#%%_dd_%%*.log.txt
echo \\machine-03\log\app3\%%_yyyy_%%-%%_MM_%%-%%_dd_%%*.log.txt
echo \\machine-04\log\app4\%%_yyyy_%%-%%_MM_%%-%%_dd_%%\*.txt
echo ===========================================================

call :DateToDays %date:~0,4% %date:~5,2% %date:~8,2% days
set /a days+=%_daysOffset_%
call :DaysToDate %days% yyyy MM dd
rem echo %yyyy% %MM% %dd%
rem for /f "delims=" %%a in (data.txt) do echo.%%a
for /f "delims=" %%i in (data.txt) do (
	rem echo %%i
	call :ReadLine %%i %yyyy% %MM% %dd%
	)
endlocal
goto :EOF

:ReadLine %line% %yyyy% %MM% %dd%
setlocal
set _yyyy_=%2
set _MM_=%3
set _dd_=%4
for /f "tokens=1,3* delims=\" %%i in ('echo %1') do (
	set _machine_=%%i
	set _app_=%%j
)
for /f "delims=" %%i in ('echo %1') do (
	set _source_=%%i
)
rem echo [%_app_%]
set _source_=%_source_:#= %
echo copy %_source_% d:\%_machine_%\%_app_%\%_yyyy_%-%_MM_%-%_dd_%\
endlocal
goto :EOF

:DaysToDate %days% yyyy MM dd
setlocal ENABLEEXTENSIONS
set /a a=%1+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5
set /a dd=-dd+e+1,MM=-m/10,MM*=12,MM+=m+3,yyyy=b*100+d-4800+m/10
(if %MM% LSS 10 set MM=0%MM%)&(if %dd% LSS 10 set dd=0%dd%)
endlocal&set %2=%yyyy%&set %3=%MM%&set %4=%dd%&goto :EOF

:DateToDays %yyyy% %MM% %dd% days
setlocal
set yyyy=%1&set MM=%2&set dd=%3
if 1%yyyy% LSS 200 (
						if 1%yyyy% LSS 170 (
							set yyyy=20%yyyy%
						) else (
							set yyyy=19%yyyy%
						)
					)
set /a dd=100%dd%%%100,MM=100%MM%%%100
set /a z=14-MM,z/=12,y=yyyy+4800-z,m=MM+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF
#T=删除N天前的M(天)个目录
@echo off

setlocal
set _DateOffsetStart_=%1
set _DateOffsetDays_=%2
set _StepDays_=-1
set _today_=%date%
set _yyyy_=%_today_:~0,4%
set _MM_=%_today_:~5,2%
set _dd_=%_today_:~8,2%

call :DateToDays %_yyyy_% %_MM_% %_dd_% _days_
rem echo %_days_%

set /a _DateOffsetEnd_=%_DateOffsetStart_%-%_DateOffsetDays_%+1
for /F %%i in (RootsDirectorysListForRemove.txt) do (
	setlocal
	For /L %%j in (%_DateOffsetStart_%, %_StepDays_%, %_DateOffsetEnd_%) do (
		setlocal ENABLEDELAYEDEXPANSION
		set /a _days_+=%%j
		rem echo !_days_!
		call :DaysToDate !_days_! _yyyy_ _MM_ _dd_
		set _DirectoryFullPathName_=%%i\!_yyyy_!-!_MM_!-!_dd_!\
		rem echo !_DirectoryFullPathName_!
		call :RemoveOneDirectory !_DirectoryFullPathName_!
		endlocal
	)
	endlocal
)
endlocal
goto :EOF

:RemoveOneDirectory %_DirectoryFullPathName_%
setlocal ENABLEEXTENSIONS
set _directory_=%_DirectoryFullPathName_%
if exist %_directory_% (
	echo RemoveOneDirectory: %_directory_%
	echo rmdir %_directory_% /s/q
) else (
	echo RemoveOneDirectory: Not Exist %_directory_%
)
goto :EOF

:DateToDays %yyyy% %MM% %dd% days
setlocal
set yyyy=%1&set MM=%2&set dd=%3
if 1%yyyy% LSS 200 (
	if 1%yyyy% LSS 170 (
		set yyyy=20%yyyy%
	) else (
		set yyyy=19%yyyy%
	)
)
set /a dd=100%dd%%%100,MM=100%MM%%%100
set /a z=14-MM,z/=12,y=yyyy+4800-z,m=MM+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF

:DaysToDate %days% yyyy MM dd
setlocal ENABLEEXTENSIONS
set /a a=%1+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5
set /a dd=-dd+e+1,MM=-m/10,MM*=12,MM+=m+3,yyyy=b*100+d-4800+m/10
(if %MM% LSS 10 set MM=0%MM%)&(if %dd% LSS 10 set dd=0%dd%)
endlocal&set %2=%yyyy%&set %3=%MM%&set %4=%dd%&goto :EOF

#T=时钟
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style> 
<!--
@import url(css-cn.css);
-->
</style>
<title>世界时钟</title>
</head>
 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<form name="clock">
  <table align="center" cellpadding="0" cellspacing="0" height="253" bordercolordark="white" bordercolorlight="black" background="worldmap.jpg" width="680" style="font-size:9pt">
	<tr>
		
	  <td  height="34" align="center"> <font color="#FF6633"><strong>世界时钟</strong></font> 
	  </td>
	</tr>
	<tr> 
	  <td align="center">北京时间:  
		<input type="text" size="8" name="local">
		</td>
	</tr>
	<tr>
		
	  <td width="877" height="199" align="center" valign="top"> 
		<table width="680" border="1" cellspacing="0" bordercolorlight="black" bordercolordark="white" style="font-size:9pt">
		  <tr bgcolor="#CCCCCC"> 
			<td width="58" height="24" align="center"> 夏威夷 </td>
			<td width="62" align="center"> 阿拉斯加 </td>
			<td width="71" align="center"> 太平洋时间 </td>
			<td width="90" align="center"> 美国山地时间 </td>
			<td width="85" align="center"> 美国中部时间 </td>
			<td width="82" align="center"> 美国东部时间 </td>
			<td width="65" align="center"> 大西洋时间 </td>
			<td width="56" align="center"> 巴西 </td>
			<td width="73" align="center"> 大西洋-中部 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> GMT-10 </td>
			<td width="62" align="center"> GMT-9 </td>
			<td width="71" align="center"> GMT-8 </td>
			<td width="90" align="center"> GMT-7 </td>
			<td width="85" align="center"> GMT-6 </td>
			<td width="82" align="center"> GMT-5 </td>
			<td width="65" align="center"> GMT-4 </td>
			<td width="56" align="center"> GMT-3 </td>
			<td width="73" align="center"> GMT-2 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> <input type="text" size="8" name="Hawaii"> 
			</td>
			<td width="62" align="center"> <input type="text" size="8" name="alaska"> 
			</td>
			<td width="71" align="center"> <input type="text" size="8" name="pacif"> 
			</td>
			<td width="90" align="center"> <input type="text" size="8" name="mount"> 
			</td>
			<td width="85" align="center"> <input type="text" size="8" name="center"> 
			</td>
			<td width="82" align="center"> <input type="text" size="8" name="east"> 
			</td>
			<td width="65" align="center"> <input type="text" size="8" name="atl"> 
			</td>
			<td width="56" align="center"> <input type="text" size="8" name="bra"> 
			</td>
			<td width="73" align="center"> <input type="text" size="8" name="mid"> 
			</td>
		  </tr>
		  <tr bgcolor="#999999"> 
			<td height="3" colspan="9" align="center"><br>
<br>
			  <br>
 </td>
		  </tr>
		  <tr bgcolor="#CCCCCC"> 
			<td width="58" height="20" align="center"> 伦敦 </td>
			<td width="62" align="center"> 柏林 </td>
			<td width="71" align="center"> 开罗 </td>
			<td width="90" align="center"> 莫斯科 </td>
			<td width="85" align="center"> 新德里 </td>
			<td width="82" align="center"> 曼谷 </td>
			<td width="65" align="center"> 香港 </td>
			<td width="56" align="center"> 东京 </td>
			<td width="73" align="center"> 悉尼 </td>
		  </tr>
		  <tr> 
			<td width="58" align="center"> GMT </td>
			<td width="62" align="center"> GMT +1 </td>
			<td width="71" align="center"> GMT +2 </td>
			<td width="90" align="center"> GMT +3 </td>
			<td width="85" align="center"> GMT +5 </td>
			<td width="82" align="center"> GMT +7 </td>
			<td width="65" align="center"> GMT +8 </td>
			<td width="56" align="center"> GMT +9 </td>
			<td width="73" align="center"> GMT +10 </td>
		  </tr>
		  <tr> 
			<td width="58"> <input type="text" size="8" name="_GMT"> </td>
			<td width="62"> <input type="text" size="8" name="rome"> </td>
			<td width="71"> <input type="text" size="8" name="Israel"> </td>
			<td width="90"> <input type="text" size="8" name="msw"> </td>
			<td width="85"> <input type="text" size="8" name="del"> </td>
			<td width="82"> <input type="text" size="8" name="kok"> </td>
			<td width="65"> <input type="text" size="8" name="ho"> </td>
			<td width="56"> <input type="text" size="8" name="tky"> </td>
			<td width="73"> <input type="text" size="8" name="sdn"> </td>
		  </tr>
		</table>
		</td>
	</tr>
	<tr>
		
	  <td width="877" height="2" align="center"> </td>
	</tr>
</table>
</form>
<script language="JavaScript"> 
<!-- Begin
function GetTime() {
var dt = new Date();
var def = dt.getTimezoneOffset()/60;
var gmt = (dt.getHours() + def);
document.clock.local.value = (IfZero(dt.getHours()) + ":" + IfZero(dt.getMinutes()) + ":" + IfZero(dt.getSeconds()));
var ending = ":" + IfZero(dt.getMinutes()) + ":" +  IfZero(dt.getSeconds());
var rome =check24(((gmt + 1) > 24) ? ((gmt + 1) - 24) : (gmt + 1));
document.clock.rome.value = (IfZero(rome) + ending);
var isr =check24(((gmt + 2) > 24) ? ((gmt + 2) - 24) : (gmt + 2));
document.clock.Israel.value = (IfZero(isr) + ending);
var msw =check24(((gmt + 3) > 24) ? ((gmt + 3) - 24) : (gmt + 3));
document.clock.msw.value = (IfZero(msw) + ending);
var del =check24(((gmt + 5) > 24) ? ((gmt + 5) - 24) : (gmt + 5));
document.clock.del.value = (IfZero(del) + ending);
var kok =check24(((gmt +7 ) > 24) ? ((gmt +7 ) - 24) : (gmt + 7));
document.clock.kok.value = (IfZero(kok) + ending);
var ho =check24(((gmt + 8) > 24) ? ((gmt + 8) - 24) : (gmt + 8));
document.clock.ho.value = (IfZero(ho) + ending);
var tky =check24(((gmt + 9) > 24) ? ((gmt + 9) - 24) : (gmt + 9));
document.clock.tky.value = (IfZero(tky) + ending);
 
var sdn =check24(((gmt + 10) > 24) ? ((gmt + 10) - 24) : (gmt + 10));
document.clock.sdn.value = (IfZero(sdn) + ending);
var _GMT =check24(((gmt) > 24) ? ((gmt) - 24) : (gmt));
 
document.clock._GMT.value = (IfZero(_GMT) + ":" + IfZero(dt.getMinutes()) + ":" + IfZero(dt.getSeconds()));
var haw =check24(((gmt + (24-10)) > 24) ? ((gmt + (24-10)) - 24) : (gmt + (24-10)));
document.clock.Hawaii.value = (IfZero(haw) + ending);
var ala =check24(((gmt + (24-9)) > 24) ? ((gmt + (24-9)) - 24) : (gmt + (24-9)));
document.clock.alaska.value = (IfZero(ala) + ending);
var pacif =check24(((gmt + (24-8)) >= 24) ? ((gmt + (24-8)) - 24) : (gmt + (24-8)));
document.clock.pacif.value = (IfZero(pacif) + ending);
var mount =check24(((gmt + (24-7)) > 24) ? ((gmt + (24-7)) - 24) : (gmt + (24-7)));
document.clock.mount.value = (IfZero(mount) + ending);
var center =check24(((gmt + (24-6)) > 24) ? ((gmt + (24-6)) - 24) : (gmt + (24-6)));
document.clock.center.value = (IfZero(center) + ending);
var east =check24(((gmt + (24-5)) > 24) ? ((gmt + (24-5)) - 24) : (gmt + (24-5)));
document.clock.east.value = (IfZero(east) + ending);
var atl =check24(((gmt + (24-4)) > 24) ? ((gmt + (24-4)) - 24) : (gmt + (24-4)));
document.clock.atl.value = (IfZero(atl) + ending);
var bra =check24(((gmt + (24-3)) > 24) ? ((gmt + (24-3)) - 24) : (gmt + (24-3)));
bra = (bra >= 24) ? bra - 24 : bra;
document.clock.bra.value = (IfZero(bra) + ending);
var mid =check24(((gmt + (24-2)) > 24) ? ((gmt + (24-2)) - 24) : (gmt + (24-2)));
mid = (mid >= 24) ? mid - 24 : mid;
document.clock.mid.value = (IfZero(mid) + ending);
setTimeout("GetTime()", 1000);
}
function IfZero(num) {
return ((num <= 9) ? ("0" + num) : num);
}
function check24(hour) {
return (hour >= 24) ? hour - 24 : hour;
}
javascript:GetTime();
//  End -->
</script></body>
</html>
#T=网络命令解释大全
1.Arp
	显示和修改“地址解析协议”(ARP) 所使用的到以太网的 IP 或令牌环物理地址翻译表。该命令只有在安装了 TCP/IP 协议之后才可用。
	arp -a [inet_addr] [-N [if_addr]
	arp -d inet_addr [if_addr]
	arp -s inet_addr ether_addr [if_addr]
	参数
	-a
	通过询问 TCP/IP 显示当前 ARP 项。如果指定了 inet_addr，则只显示指定计算机的 IP 和物理地址。
	-g
	与 -a 相同。
	inet_addr
	以加点的十进制标记指定 IP 地址。
	-N
	显示由 if_addr 指定的网络界面 ARP 项。
	if_addr
	指定需要修改其地址转换表接口的 IP 地址（如果有的话）。如果不存在，将使用第一个可适用的接口。
	-d
	删除由 inet_addr 指定的项。
	-s
	在 ARP 缓存中添加项，将 IP 地址 inet_addr 和物理地址 ether_addr 关联。物理地址由以连字符分隔的6 个十六进制字节给定。使用带点的十进制
标记指定 IP 地址。项是永久性的，即在超时到期后项自动从缓存删除。
	ether_addr
	指定物理地址。
2.Finger
	在运行 Finger 服务的指定系统上显示有关用户的信息。根据远程系统输出不同的变量。该命令只有在安装了 TCP/IP 协议之后才可用。
	finger [-l] [user]@computer[...]
	参数
	-l
	以长列表格式显示信息。
	user
	指定要获得相关信息的用户。省略用户参数以显示指定计算机上所有用户的信息：
	@computer
3.Ftp
	将文件传送到正在运行 FTP 服务的远程计算机或从正在运行 FTP 服务的远程计算机传送文件（有时称作 daemon）。Ftp可以交互使用。单击“相关主
题”列表中的“ftp 命令”以获得可用的“ftp”子命令描述。该命令只有在安装了 TCP/IP 协议之后才可用。Ftp 是一种服务，一旦启动，将创建在其中
可以使用ftp 命令的子环境，通过键入 quit 子命令可以从子环境返回到 Windows 2000 命令提示符。当 ftp 子环境运行时，它由 ftp 命令提示符代表。
	ftp [-v] [-n] [-i] [-d] [-g] [-s:filename] [-a] [-w:windowsize] [computer]
	参数
	-v
	禁止显示远程服务器响应。
	-n
	禁止自动登录到初始连接。
	-i
	多个文件传送时关闭交互提示。
	-d
	启用调试、显示在客户端和服务器之间传递的所有 ftp 命令。
	-g
	禁用文件名组，它允许在本地文件和路径名中使用通配符字符（* 和 ?）。（请参阅联机“命令参考”中的 glob 命令。）
	-s: filename
	指定包含 ftp 命令的文本文件；当 ftp 启动后，这些命令将自动运行。该参数中不允许有空格。使用该开关而不是重定向(> )。
	-a
	在捆绑数据连接时使用任何本地接口。
	-w:windowsize
	替代默认大小为 4096 的传送缓冲区。
	computer
	指定要连接到远程计算机的计算机名或 IP 地址。如果指定，计算机必须是行的最后一个参数。
4.Nbtstat
	该诊断命令使用 NBT（TCP/IP 上的 NetBIOS）显示协议统计和当前 TCP/IP 连接。该命令只有在安装了TCP/IP 协议之后才可用。
	nbtstat [-a remotename] [-A IP address] [-c] [-n] [-R] [-r] [-S] [-s] [interval]
	参数
	-a remotename
	使用远程计算机的名称列出其名称表。
	-A IP address
	使用远程计算机的 IP 地址并列出名称表。
	-c
	给定每个名称的 IP 地址并列出 NetBIOS 名称缓存的内容。
	-n
	列出本地 NetBIOS 名称。“已注册”表明该名称已被广播 (Bnode) 或者 WINS（其他节点类型）注册。
	-R
	清除 NetBIOS 名称缓存中的所有名称后，重新装入 Lmhosts 文件。
	-r
	列出 Windows 网络名称解析的名称解析统计。在配置使用 WINS 的 Windows 2000 计算机上，此选项返回要通过广播或WINS 来解析和注册的名称数。
	-S
	显示客户端和服务器会话，只通过 IP 地址列出远程计算机。
	-s
	显示客户端和服务器会话。尝试将远程计算机 IP 地址转换成使用主机文件的名称。
	interval
	重新显示选中的统计，在每个显示之间暂停 interval 秒。按 CTRL+C 停止重新显示统计信息。如果省略该参数，nbtstat 打印一次当前的配置信息。
5.Netstat
	显示协议统计和当前的 TCP/IP 网络连接。该命令只有在安装了 TCP/IP 协议后才可以使用。
	netstat [-a] [-e] [-n] [-s] [-p protocol] [-r] [interval]
	参数
	-a
	显示所有连接和侦听端口。服务器连接通常不显示。
	-e
	显示以太网统计。该参数可以与 -s 选项结合使用。
	-n
	以数字格式显示地址和端口号（而不是尝试查找名称）。
	-s
	显示每个协议的统计。默认情况下，显示 TCP、UDP、ICMP 和 IP 的统计。-p 选项可以用来指定默认的子集。
	-p protocol
	显示由 protocol 指定的协议的连接；protocol 可以是 tcp 或 udp。如果与 -s 选项一同使用显示每个协议的统计，protocol 可以是 tcp、udp、
icmp 或 ip。
	-r
	显示路由表的内容。
	interval
	重新显示所选的统计，在每次显示之间暂停 interval 秒。按 CTRL+B 停止重新显示统计。如果省略该参数，netstat 将打印一次当前的配置信息。
6.Ping
	验证与远程计算机的连接。该命令只有在安装了 TCP/IP 协议后才可以使用。
	ping [-t] [-a] [-n count] [-l length] [-f] [-i ttl] [-v tos] [-r count] [-s count] [-j computer-list] | [-k computer-list] [-w
timeout] destination-list
	参数
	-t
	Ping 指定的计算机直到中断。
	-a
	将地址解析为计算机名。
	-n count
	发送 count 指定的 ECHO 数据包数。默认值为 4。
	-l length
	发送包含由 length 指定的数据量的 ECHO 数据包。默认为 32 字节；最大值是 65,527。
	-f
	在数据包中发送“不要分段”标志。数据包就不会被路由上的网关分段。
	-i ttl
	将“生存时间”字段设置为 ttl 指定的值。
	-v tos
	将“服务类型”字段设置为 tos 指定的值。
	-r count
	在“记录路由”字段中记录传出和返回数据包的路由。count 可以指定最少 1 台，最多 9 台计算机。
	-s count
	指定 count 指定的跃点数的时间戳。
	-j computer-list
	利用 computer-list 指定的计算机列表路由数据包。连续计算机可以被中间网关分隔（路由稀疏源）IP 允许的最大数量为9。
	-k computer-list
	利用 computer-list 指定的计算机列表路由数据包。连续计算机不能被中间网关分隔（路由严格源）IP 允许的最大数量为9。
	-w timeout
	指定超时间隔，单位为毫秒。
	destination-list
	指定要 ping 的远程计算机。
7.Rcp
	在 Windows 2000 计算机和运行远程外壳端口监控程序 rshd 的系统之间复制文件。rcp 命令是一个连接命令，从Windows 2000 计算机发出该命令时
，也可以用于其他传输在两台运行 rshd 的计算机之间复制文件。rshd 端口监控程序可以在 UNIX 计算机上使用，而在Windows 2000 上不能使用，所以
Windows 2000 计算机仅可以作为发出命令的系统参与。远程计算机必须也通过运行 rshd 提供 rcp 实用程序。
	rcp [-a | -b] [-h] [-r] source1 source2 ... sourceN destination
	参数
	-a
	指定 ASCII 传输模式。此模式在传出文件上将回车/换行符转换为回车符，在传入文件中将换行符转换为回车/换行符。该模式为默认的传输模式。
	-b
	指定二进制图像传输模式。没有执行回车/换行符转换。
	-h
	传输 Windows 2000 计算机上标记为隐藏属性的源文件。如果没有该选项，在 rcp 命令行上指定隐藏文件的效果与文件不存在一样。
	-r
	将源的所有子目录内容递归复制到目标。source 和 destination 都必须是目录，虽然即使源不是目录，使用-r 也能够工作。但将没有递归。
	source 和 destination
	格式必须为 [computer[.user]:]filename。如果忽略了 [computer[.user]:] 部分，计算机将假定为本地计算机。如果省略了 [.user] 部分，将使用
当前登录的 Windows 2000 用户名。如果使用了完全合格的计算机名，其中包含句点(.) 分隔符，则必须包含 [.user]。否则，计算机名的最后部分将解释
为用户名。如果指定了多个源文件，则destination 必须是目录。
	如果文件名不是以 UNIX 的正斜杠 (/) 或 Windows 2000 系统的反斜杠 (\) 打头，则假定相对于当前的工作目录。在Windows 2000 中，这是发出命
令的目录。在远程系统中，这是远程用户的登录目录。句点 (.) 表示当前的目录。在远程路径中使用转义字符（\、" 或 '），以便在远程计算机中使用通
配符。
8.Rexec
	在运行 REXEC 服务的远程计算机上运行命令。rexec 命令在执行指定命令前，验证远程计算机上的用户名，只有安装了TCP/IP 协议后才可以使用该命
令。
	rexec computer [-l username] [-n] command
	参数
	computer
	指定要运行 command 的远程计算机。
	-l username
	指定远程计算机上的用户名。
	-n
	将 rexec 的输入重定向到 NULL。
	command
	指定要运行的命令。
9.Route
	控制网络路由表。该命令只有在安装了 TCP/IP 协议后才可以使用。
	route [-f] [-p] [command [destination] [mask subnetmask] [gateway] [metric costmetric]
	参数
	-f
	清除所有网关入口的路由表。如果该参数与某个命令组合使用，路由表将在运行命令前清除。
	-p
	该参数与 add 命令一起使用时，将使路由在系统引导程序之间持久存在。默认情况下，系统重新启动时不保留路由。与 print 命令一起使用时，显示
已注册的持久路由列表。忽略其他所有总是影响相应持久路由的命令。
	command
	指定下列的一个命令。
	命令 目的
	print 打印路由
	add 添加路由
	delete 删除路由
	change 更改现存路由
	destination
	指定发送 command 的计算机。
	mask subnetmask
	指定与该路由条目关联的子网掩码。如果没有指定，将使用 255.255.255.255。
	gateway
	指定网关。
	名为 Networks 的网络数据库文件和名为 Hosts 的计算机名数据库文件中均引用全部 destination 或 gateway 使用的符号名称。如果命令是 print
或 delete，目标和网关还可以使用通配符，也可以省略网关参数。
	metric costmetric
	指派整数跃点数（从 1 到 9999）在计算最快速、最可靠和（或）最便宜的路由时使用。
10.Rsh
	在运行 RSH 服务的远程计算机上运行命令。该命令只有在安装了 TCP/IP 协议后才可以使用。
	rsh computer [-l username] [-n] command
	参数
	computer
	指定运行 command 的远程计算机。
	-l username
	指定远程计算机上使用的用户名。如果省略，则使用登录的用户名。
	-n
	将 rsh 的输入重定向到 NULL。
	command
	指定要运行的命令。
11.Tftp
	将文件传输到正在运行 TFTP 服务的远程计算机或从正在运行 TFTP 服务的远程计算机传输文件。该命令只有在安装了TCP/IP 协议后才可以使用。
	tftp [-i] computer [get | put] source [destination]
	参数
	-i
	指定二进制图像传送模式（也称为“八位字节”）。在二进制图像模式中，文件一个字节接一个字节地逐字移动。在传送二进制文件时使用该模式。
	如果省略了 -i，文件将以 ASCII 模式传送。这是默认的传送模式。此模式将 EOL 字符转换为 UNIX 的回车符和个人计算机的回车符/换行符。在传送
文本文件时应使用此模式。如果文件传送成功，将显示数据传输率。
	computer
	指定本地或远程计算机。
	put
	将本地计算机上的文件 destination 传送到远程计算机上的文件 source。
	get
	将远程计算机上的文件 destination 传送到本地计算机上的文件 source。
	如果将本地计算机上的文件 file-two 传送到远程计算机上的文件 file-one，请指定 put。如果将远程计算机上的文件file-two 传送到远程计算机上
的文件 file-one，请指定 get。
	因为 tftp 协议不支持用户身份验证，所以用户必须登录，并且文件在远程计算机上必须可以写入。
	source
	指定要传送的文件。如果本地文件指定为 -，则远程文件在 stdout 上打印出来（如果获取），或从 stdin（如果放置）读取。
	destination
	指定将文件传送到的位置。如果省略了 destination，将假定与 source 同名。
12.Tracert
	该诊断实用程序将包含不同生存时间 (TTL) 值的 Internet 控制消息协议 (ICMP) 回显数据包发送到目标，以决定到达目标采用的路由。要在转发数
据包上的TTL 之前至少递减 1，必需路径上的每个路由器，所以 TTL 是有效的跃点计数。数据包上的 TTL 到达 0 时，路由器应该将“ICMP 已超时”的消
息发送回源系统。Tracert 先发送 TTL 为 1 的回显数据包,并在随后的每次发送过程将 TTL 递增 1，直到目标响应或 TTL 达到最大值，从而确定路由。
路由通过检查中级路由器发送回的“ICMP 已超时”的消息来确定路由。不过，有些路由器悄悄地下传包含过期 TTL 值的数据包，而 tracert 看不到。
	tracert [-d] [-h maximum_hops] [-j computer-list] [-w timeout]target_name
	参数
	/d
	指定不将地址解析为计算机名。
	-h maximum_hops
	指定搜索目标的最大跃点数。
	-j computer-list
	指定沿 computer-list 的稀疏源路由。
	-w timeout
	每次应答等待 timeout 指定的微秒数。
	target_name
	目标计算机的名称。
13.NET命令的基本用法
Net
	以下综合了WINDOWS 98，WINDOWS WORKSTATION和WINDOWS SERVER 三个操作系统关于NET命令的解释，希望可以更全面一些。
	先说一些：
	(1)NET命令是一个命令行命令。
	(2)管理网络环境、服务、用户、登陆。。。。等本地信息
	(3)WIN 98，WIN WORKSTATION和WIN NT都内置了NET命令。
	(4)但WIN 98的NET命令和WORKSTATION、NT的NET命令不同。
	(5)WORKSTATION和SERVER中的NET命令基本相同。
	(6)获得HELP
	 (1)在NT下可以用图形的方式，开始-》帮助-》索引-》输入NET
	 (2)在COMMAND下可以用字符方式，NET /?或NET或NET HELP得到一些方法 相应的方法的帮助NETCOMMAND /HELP或NET HELP COMMAND 或NET COMMAND /?
另对于错误NET HELPMSG MESSAGE#是4位数
	(7)强制参数 所有net命令接受选项/yes和/no(可缩写为/y和/n)。[简单的说就是预先给系统的 提问一个答案]
	(8)有一些命令是马上产生作用并永久保存的，使用的时候要慎重
	(9)对于NET命令的功能都可以找到相应的图形工具的解决方案
	(10)命令的组成 命令 参数 选项 | 参数 选项 | 参数 选项 |。。。。。。 罗里罗嗦说了一大堆，其实就是6和7有用，呵呵。另有两件事：
	(1)在NT的NET命令中有一些参数是只有在SERVER环境中才能使用的
	(2)在WIN98的NET命令中有一些参数不能在DOS-WIN中使用，只能在DOS环境中使用
	下面对NET命令的不同参数的基本用法做一些初步的介绍：
	一、NET VIEW
	作 用：显示域列表、计算机列表或指定计算机的共享资源列表。
	命令格式：net view [\\computername | /domain[:domainname]
	参数介绍：
	(1)键入不带参数的net view显示当前域的计算机列表。
	(2)\\computername 指定要查看其共享资源的计算机。
	(3)/domain[:domainname]指定要查看其可用计算机的域。
	简单事例：
	(1)net view \\YFANG查看YFANG的共享资源列表。
	(2)net view /domain:LOVE查看LOVE域中的机器列表。
	二、NET USER
	作 用：添加或更改用户帐号或显示用户帐号信息。该命令也可以写为 net users。
	命令格式：net user [username [password | *] [options] [/domain]
	参数介绍：
	(1)键入不带参数的net user查看计算机上的用户帐号列表。
	(2)username添加、删除、更改或查看用户帐号名。
	(3)password为用户帐号分配或更改密码。
	(4)*提示输入密码。
	(5)/domain在计算机主域的主域控制器中执行操作。
	简单事例：
	(1)net user yfang查看用户YFANG的信息
	三、NET USE
	作 用：连接计算机或断开计算机与共享资源的连接，或显示计算机的连接信息。
	命令格式：net use [devicename | *] [\\computername\sharename[\volume] [password | *] [/user:[domainname\]username] [/delete] |
[/persistent:{yes | no]}
	参数介绍：
	键入不带参数的net use列出网络连接。
	devicename指定要连接到的资源名称或要断开的设备名称。
	\\computername\sharename服务器及共享资源的名称。
	password访问共享资源的密码。
	*提示键入密码。
	/user指定进行连接的另外一个用户。
	domainname指定另一个域。
	username指定登录的用户名。
	/home将用户连接到其宿主目录。
	/delete取消指定网络连接。
	/persistent控制永久网络连接的使用。
	简单事例：
	(1)net use e: \\YFANG\TEMP将\\YFANG\TEMP目录建立为E盘
	(2)net use e: \\YFANG\TEMP /delete断开连接
	四、NET TIME
	作 用：使计算机的时钟与另一台计算机或域的时间同步。
	命令格式：net time [\\computername | /domain[:name] [/set]
	参数介绍：
	(1)\\computername要检查或同步的服务器名。
	(2)/domain[:name]指定要与其时间同步的域。
	(3)/set使本计算机时钟与指定计算机或域的时钟同步。
	下面的这4个参数是相关的，所以一起介绍
	五、Net Start
	作 用：启动服务，或显示已启动服务的列表。
	命令格式：net start service
	六、Net Pause
	作 用：暂停正在运行的服务。
	命令格式：net pause service
	七、Net Continue
	作 用：重新激活挂起的服务。
	命令格式：net continue service
	八、NET STOP
	作 用：停止 Windows NT 网络服务。
	命令格式：net stop service
	参数介绍：我们来看看这些服务都是什么
	(1)alerter(警报)
	(2)client service for netware(Netware 客户端服务)
	(3)clipbook server(剪贴簿服务器)
	(4)computer browser(计算机浏览器)
	(5)directory replicator(目录复制器)
	(6)ftp publishing service (ftp )(ftp 发行服务)
	(7)lpdsvc
	(8)net logon(网络登录)
	(9)network dde(网络 dde)
	(10)network dde dsdm(网络 dde dsdm)
	(11)network monitor agent(网络监控代理)
	(12)nt lm security support provider(NT LM 安全性支持提供)
	(13)ole(对象链接与嵌入)
	(14)remote access connection manager(远程访问连接管理器)
	(15)remote access isnsap service(远程访问 isnsap 服务)
	(16)remote access server(远程访问服务器)
	(17)remote procedure call (rpc) locator(远程过程调用定位器)
	(18)remote procedure call (rpc) service(远程过程调用服务)
	(19)schedule(调度)
	(20)server(服务器)
	(21)simple tcp/ip services(简单 TCP/IP 服务)
	(22)snmp
	(23)spooler(后台打印程序)
	(24)tcp/ip netbios helper(TCP/IP NETBIOS 辅助工具)
	(25)ups
	(26)workstation(工作站)
	(27)messenger(信使)
	(28)dhcp client
	(29)eventlog 以下这些SERVICE只能在NT SERVER上使用
	(1)file server for macintosh
	(2)gateway service for netware
	(3)microsoft dhcp server
	(4)print server for macintosh
	(5)remoteboot
	(6)windows internet name service
	九、Net Statistics
	作 用：显示本地工作站或服务器服务的统计记录。
	命令格式：net statistics [workstation | server]
	参数介绍：
	(1)键入不带参数的net statistics列出其统计信息可用的运行服务。
	(2)workstation显示本地工作站服务的统计信息。
	(3)server显示本地服务器服务的统计信息。
	简单事例：
	(1)net statistics server | more显示服务器服务的统计信息
	十、Net Share
	作 用：创建、删除或显示共享资源。
	命令格式：net share sharename=drive:path [/users:number | /unlimited] [/remark:"text"]
	参数介绍：
	(1)键入不带参数的net share显示本地计算机上所有共享资源的信息。
	(2)sharename是共享资源的网络名称。
	(3)drive:path指定共享目录的绝对路径。
	(4)/users:number设置可同时访问共享资源的最大用户数。
	(5)/unlimited不限制同时访问共享资源的用户数。
	(6)/remark:"text "添加关于资源的注释，注释文字用引号引住。
	简单事例：
	(1)net share mylove=c:\temp /remark:"my first share"以mylove为共享名共享C:\temp
	(2)net share mylove /delete停止共享mylove目录
	十一、Net Session
	作 用：列出或断开本地计算机和与之连接的客户端的会话，也可以写为net sessions或net sess。
	命令格式：net session [\\computername] [/delete]
	参数介绍：
	(1)键入不带参数的net session显示所有与本地计算机的会话的信息。
	(2)\\computername标识要列出或断开会话的计算机。
	(3)/delete结束与\\computername计算机会话并关闭本次会话期间计算机的所有.
	简单事例：
	(1)net session \\YFANG要显示计算机名为YFANG的客户端会话信息列表。
	十二、Net Send
	作 用：向网络的其他用户、计算机或通信名发送消息。
	命令格式：net send {name | * | /domain[:name] | /users} message
	参数介绍：
	(1)name要接收发送消息的用户名、计算机名或通信名。
	(2)*将消息发送到组中所有名称。
	(3)/domain[:name]将消息发送到计算机域中的所有名称。
	(4)/users将消息发送到与服务器连接的所有用户。
	(5)message作为消息发送的文本。
	简单事例：
	(1)net send /users server will shutdown in 5 minutes.给所有连接到服务器的用户发送消息
	十三、Net Print
	作 用：显示或控制打印作业及打印队列。
	命令格式：net print [\\computername ] job# [/hold | /release | /delete]
	参数介绍：
	(1)computername共享打印机队列的计算机名。
	(2)sharename打印队列名称。
	(3)job#在打印机队列中分配给打印作业的标识号。
	(4)/hold使用 job# 时，在打印机队列中使打印作业等待。
	(5)/release释放保留的打印作业。
	(6)/delete从打印机队列中删除打印作业。
	简单事例：
	(1)net print \\YFANG\SEEME列出\\YFANG计算机上SEEME打印机队列的目录
	十四、Net Name
	作 用：添加或删除消息名（有时也称别名），或显示计算机接收消息的名称列表。
	命令格式：net name [name [/add | /delete]
	参数介绍：
	(1)键入不带参数的net name列出当前使用的名称。
	(2)name指定接收消息的名称。
	(3)/add将名称添加到计算机中。
	(4)/delete从计算机中删除名称。
	十五、Net Localgroup
	作 用：添加、显示或更改本地组。
	命令格式：net localgroup groupname {/add [/comment:"text "] | /delete} [/domain]
	参数介绍：
	(1)键入不带参数的net localgroup显示服务器名称和计算机的本地组名称。
	(2)groupname要添加、扩充或删除的本地组名称。
	(3)/comment: "text "为新建或现有组添加注释。
	(4)/domain在当前域的主域控制器中执行操作，否则仅在本地计算机上执行操作?
	(5)name [ ...]列出要添加到本地组或从本地组中删除的一个或多个用户名或组名。
	(6)/add将全局组名或用户名添加到本地组中。
	(7)/delete从本地组中删除组名或用户名。
	简单事例：
	(1)net localgroup love /add将名为love的本地组添加到本地用户帐号数据库
	(2)net localgroup love显示love本地组中的用户
	十六、Net Group
	作 用：在 Windows NT Server 域中添加、显示或更改全局组。
	命令格式：net group groupname {/add [/comment:"text "] | /delete} [/domain]
	参数介绍：
	(1)键入不带参数的net group显示服务器名称及服务器的组名称。
	(2)groupname要添加、扩展或删除的组。
	(3)/comment:"text "为新建组或现有组添加注释。
	(4)/domain在当前域的主域控制器中执行该操作，否则在本地计算机上执行操作? ?
	(5)username[ ...]列表显示要添加到组或从组中删除的一个或多个用户。
	(6)/add添加组或在组中添加用户名。
	(7)/delete删除组或从组中删除用户名。
	简单事例：
	(1)net group love yfang1 yfang2 /add将现有用户帐号yfang1和yfang2添加到本地计算机的love组
	十七、Net File
	作 用：显示某服务器上所有打开的共享文件名及锁定文件数。
	命令格式：net file [id [/close]
	参数介绍：
	(1)键入不带参数的net file获得服务器上打开文件的列表。
	(2)id文件标识号。
	(3)/close关闭打开的文件并释放锁定记录。
	十八、Net Config
	作 用：显示当前运行的可配置服务，或显示并更改某项服务的设置。
	命令格式：net config [service [options]
	参数介绍：
	(1)键入不带参数的net config显示可配置服务的列表。
	(2)service通过net config命令进行配置的服务(server或workstation)
	(3)options服务的特定选项。
	十九、Net Computer
	作 用：从域数据库中添加或删除计算机。
	命令格式：net computer \\computername {/add | /del}
	参数介绍：
	(1)\\computername指定要添加到域或从域中删除的计算机。
	(2)/add将指定计算机添加到域。
	(3)/del将指定计算机从域中删除。
	简单事例：
	(1)net computer \\cc /add将计算机 cc 添加到登录域
	二十、Net Accounts
	作 用：更新用户帐号数据库、更改密码及所有帐号的登录要求。
	命令格式：net accounts [/forcelogoff:{minutes | no}] [/minpwlen:length] [/maxpwage:{days | unlimited}] [/minpwage:days]
[/uniquepw:number] [/domain]
	参数介绍：
	(1)键入不带参数的net accounts显示当前密码设置、登录时限及域信息。
	(2)/forcelogoff:{minutes | no}设置当用户帐号或有效登录时间过期时
	(3)/minpwlen:length设置用户帐号密码的最少字符数。
	(4)/maxpwage:{days | unlimited}设置用户帐号密码有效的最大天数。
	(5)/minpwage:days设置用户必须保持原密码的最小天数。
	(6)/uniquepw:number要求用户更改密码时，必须在经过number次后才能重复使用 与之相同的密码。
	(7)/domain在当前域的主域控制器上执行该操作。
	(8)/sync当用于主域控制器时，该命令使域中所有备份域控制器同步
	简单事例：
	(1)net accounts /minpwlen:7将用户帐号密码的最少字符数设置为7
#T=右键BAT、CMD进入相应的目录并运行
@echo off
::某个目录(包括驱动器和文件夹)右键菜单打开命令提示符并进入相应的目录。
reg add "HKCR\Folder\shell\B打开命令提示符\Command" /ve /t REG_SZ /d "cmd.exe /k title 命令提示符&cd \"%%1\"" /f

::右键任意文件进入所在目录。
reg add HKCR\*\shell\CMD /ve /t REG_SZ /d "打开命令提示符(&B)" /f
reg add HKCR\*\shell\CMD\Command /ve /t REG_SZ /d "cmd.exe /k title 命令提示符" /f

::右键BAT、CMD进入相应的目录并运行。
reg add HKCR\batfile\shell\CMD /ve /t REG_SZ /d "CMD下运行&BAT" /f
reg add HKCR\batfile\shell\CMD\Command /ve /t REG_SZ /d "cmd.exe /k title 运行&\"%%1\"" /f
reg add HKCR\cmdfile\shell\CMD /ve /t REG_SZ /d "CMD下运行CMD(&B)" /f
reg add HKCR\cmdfile\shell\CMD\Command /ve /t REG_SZ /d "cmd.exe /k title 运行&\"%%1\"" /f
reg add HKCR\exefile\shell\CMD /ve /t REG_SZ /d "CMD下运行exe(&E)" /f
reg add HKCR\exefile\shell\CMD\Command /ve /t REG_SZ /d "cmd.exe /k title 运行&\"%%1\"" /f
goto :eof

::快捷键全部用B，并有注册表中快捷键用法展示。
::　快捷键用F可能会更好，因为没有重复；
::　B有一个刻录相关的也是它，但批处理用BAT的B更好记点。

::多的"用\置于前以示区别[\"]，%要成双用[%%]。
::　多"还可用双引号括起来["""]，比较繁琐且晃眼不选用。
#T=右键菜单项显示路径
@echo off

REM 在文件夹和文件对象上均添加显示路径右键菜单项

reg add HKCR\AllFilesystemObjects\shell\ShowPath\Command /f /ve /d "cmd.exe /k @echo off & echo %%1"

REM 只在文件对象上添加显示路径右键菜单项

REM reg add HKCR\*\shell\ShowPath\Command /f /ve /d "cmd.exe /k @echo off & echo 所选择对象的路径为：%%1"

REM 只在文件夹对象上添加显示路径右键菜单项

REM reg add HKCR\Directory\shell\ShowPath\Command /f /ve /d "cmd.exe /k @echo off & echo 所选择对象的路径为：%%1"

pause
#T=DynamicObject
namespace ConsoleApplication
{
	using System;
	using System.Collections.Generic;
	using System.Dynamic;
	class Program
	{

		static void Main(string[] args)
		{
			dynamic varo = new VarObject();
			varo.a = "value";
			varo.b = "2";
			varo["c"] = 3;
			var d = varo++;
			var e = varo + varo;
			varo(); 
			varo.Method(); 
			foreach(var v in varo.GetDynamicMemberNames())
			{
				Console.WriteLine(v); 
			}
			Console.WriteLine("done."); 
			Console.ReadKey();
		}
	}
	/// <summary>
	/// 动态对象
	/// </summary>
	public class VarObject : DynamicObject
	{
		/// <summary>
		/// 数据字段
		/// </summary>
		private Dictionary<string, object> ViewData = new Dictionary<string, object>();

		/// <summary>
		/// 调用 varo(); 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="args"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryInvoke(InvokeBinder binder, object[] args, out object result)
		{
			return base.TryInvoke(binder, args, out result);
		}

		/// <summary>
		/// 调用 varo.Method(); 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="args"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryInvokeMember(InvokeMemberBinder binder, object[] args, out object result)
		{
			return base.TryInvokeMember(binder, args, out result);
		}

		/// <summary>
		/// 调用 varo + varo; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="arg"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryBinaryOperation(BinaryOperationBinder binder, object arg, out object result)
		{
			return base.TryBinaryOperation(binder, arg, out result);
		}

		/// <summary>
		/// 调用 varo++; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryUnaryOperation(UnaryOperationBinder binder, out object result)
		{
			return base.TryUnaryOperation(binder, out result);
		}

		/// <summary>
		/// 调用 varo["key"]; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="indexes"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryGetIndex(GetIndexBinder binder, object[] indexes, out object result)
		{
			if (indexes == null || indexes.Length != 1)
			{
				throw new ArgumentException("indexes");
			}

			result = null;
			string key = indexes[0] as string;
			if (key != null)
			{
				result = ViewData[key];
			}
			else
			{
				throw new ArgumentException("indexes");
			}
			return true;
		}

		/// <summary>
		/// 调用 varo["key"] = "value"; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="indexes"></param>
		/// <param name="value"></param>
		/// <returns></returns>
		public override bool TrySetIndex(SetIndexBinder binder, object[] indexes, object value)
		{
			if (indexes == null || indexes.Length != 1)
			{
				throw new ArgumentException("indexes");
			}

			string key = indexes[0] as string;
			if (key != null)
			{
				ViewData[key] = value;
				return true;
			}
			else
			{
				throw new ArgumentException("indexes");
			}
		}

		/// <summary>
		/// 获取所有key
		/// </summary>
		/// <returns></returns>
		public override IEnumerable<string> GetDynamicMemberNames()
		{
			return ViewData.Keys;
		}

		/// <summary>
		/// 调用 varo.key; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="result"></param>
		/// <returns></returns>
		public override bool TryGetMember(GetMemberBinder binder, out object result)
		{
			result = ViewData[binder.Name];
			return true;
		}

		/// <summary>
		/// 调用 varo.key = "value"; 时执行
		/// dynamic varo = new VarObject();
		/// </summary>
		/// <param name="binder"></param>
		/// <param name="value"></param>
		/// <returns></returns>
		public override bool TrySetMember(SetMemberBinder binder, object value)
		{
			ViewData[binder.Name] = value;
			return true;
		}
	}
	

}

#
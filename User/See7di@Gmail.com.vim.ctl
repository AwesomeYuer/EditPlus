#TITLE=See7di.@Vim
#INFO
EditPlus Cliptext Library v1.0 written by Seven(See7di@Gmail.com).

#SORT=n

#T=编辑
#T=┉━┉━┉━┉━┉━┉
#T=没有:表示在编辑模式下
#T=按tab或:按tab
可智能切换命令
#T=:e ?
打开文件
#T=:vnew ?
打开另外一个文件
#T=:tabnew ?
打开文件
#T=:close
关闭当前文件
#T=u | ctrl+r
undo或redo
#T=x | u
删除或恢复一个字符
5x:删除5个字符
gg5x:删除行首5个字符
#T=dd
删除1行
6dd:删除光标往下的6行
#T=dG
删除全文
#T=ctrl+q -> 13jx
选中一列,然后向下选中13行执行删除
13j表示向下选中13行,x表示删除
#T=:X | :set key=
加密或解密
#T=>>
缩进
n>>缩进n行
#T=
#T=
#T=
#T=
#T=
#T=
#T= 


#T=光标
#T=┉━┉━┉━┉━┉━┉
#T=^ | $
N模式下把光标放到该行开头或末尾
#T=gg | gg$
N模式下光标移到首行开头或末尾
#T=b | w
往前或往后挑一个英文单词(9w往后移动9个单词)
#T=k | j
上下移动光标(9k往上移动9行)
#T=h | l
左右移动光标(9h往左移动9列)
#T=zr | zR
展开当前的折叠或展开此文章所有的折叠
#T=G
移到文件的最后一行
nG移到文件的第n行
#T=v/./d
或者g/^\s\{0,}$\normal dd清除空行
#T= 


#T=巨集
#T=┉━┉━┉━┉━┉━┉
#T=录制方法
1.关掉输入法并切换至N状态
2.按qa开始录制一个名字是a的巨集
3.shift+>>(表示按住shift按两次>,此时会插入一个tab制表符)
4.按j把光标下移一行,然后按^光标到本行行首
5.按q结束巨集录制
6.@a可执行1次a巨集,8@a可执行8次a巨集
#T= 


#T=设置
#T=┉━┉━┉━┉━┉━┉
#T=:set go=
set:一般性设置;go:gui option的缩写
#T=:colo ev
设置配色方案
#T=:sy on
高亮
#T=:sy clear
取消高亮
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T= 

#T=正则
#T=┉━┉━┉━┉━┉━┉
#T=%s/Vim/\r&/gc
Vim后边换行,针对全文
%表示全文
s表示替换,如s/a/b表示把a替换成b
Vim表示要替换的内容
\r表示回车
&表示被替换的部分
/gc表示无数次替换,且需要用户确认
#T=:%s/a../&\r/gc
:%s/a../\r&/gc
在a??后边插入换行
#T=:%s/\(a.\)./\1\r/gc
a后边的一个标点删除同时换行
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#T=
#
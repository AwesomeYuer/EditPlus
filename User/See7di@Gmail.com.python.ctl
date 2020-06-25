#TITLE=See7di.@Python 2.6
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=字典
	a = {'name':'xiaoming','age':23}
	字典的常用操作方法：
	1 has_key('key名称')
	判断字典里是否有该键存在，如果存在的话返回True，不存在的话返回False
	比如
	a.has_key("name")返回True
	a.has_key("sss")返回False

	2keys()返回的是字典键组成的列表
	比如a.keys()
	返回:['age','name']

	3values返回的是字典值组成的列表
	比如a.values()
	返回:[23,'xiaoming']

	4update()方法，把2个字典进行合并
	比如我现在又建立了一个
	b = {'sex':'man'}
	a.update(b)
	print a
	输出的结果是:{'age': 23, 'name': 'xiaoming', 'sex': 'man'}

	还有一些常用的方法可以通过help(a)或者python的文档来查看。
#T=列表
	嵌套：
	l3 = ['a',['b','cc']]
	索引:
	l3[1]
	分片：
	l3[2:4]
	下面有2个非常有意思的操作，＋和*
	比如:
	[1,2]+[5,6]
	结果生成了一个新的列表，[1,2,5,6]
	注意python是强类型的语言，
	如果
	a = [1,2]
	print a+"11"
	它会报错：
	Traceback (most recent call last):
	File "", line 1, in
	TypeError: can only concatenate list (not "str") to list

	如果你要相加的话，可以把a通过str()方法转换成字符类型，或者是把字符串"11"通过list()方法转换成列表类型
	python列表解析属于python的迭代中的一种，相比python for循环速度会快很多。下面看下python列表解析是怎么工作的。
	example:
	a = [x+2 for x in range(10)]
	print a
	输出的结果：
	[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

	下面说下上面这个例子的执行过程：
	python会在解释器里对range(10)进行迭代，依次把列表里的内容取出来，赋值给最左边的x,然后执行x+2的操作，
	并且把执行好的结果保存在列表里。等range(10)迭代完以后就新生成了一个列表，结果就是[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
#T=元组
	python元组是一种有序的集合类型，它也和python列表一样支持偏移操作。

	元组是怎么定义的：
	()表示空元组
	(1,)表示只有一个值的元组
	(1,2,3)3个元素的元组
	1,2,3也表示元组，只是没有()
	所以定义元组可以取得(),但是为了统一的话，最好加上(),免的出问题。

	元组支持＋和切片操作
	a = (1,2)
	b = (3,4)
	c = a + b
	print c
	结果是(1,2,3,4)
	print c[1:2]
	结果是(2,)

	一个要注意的问题
	a = (1)
	print type(a)
	结果是：
	a = (1,)
	print type(a)
	结果是:
	所以你如果要定义一个元组的话，而里面只有一个元素的话，记得加上,
	python 元组属于 [python数据类型总结] 。
	留给大家一个问题：

	因为元组是不可变的对象，所以给大家一个问题。
	a = (3,1,5,9)
	我想对元组里面的元素从小到大排序，要怎么操作
#T=字符串连接
	先介绍下效率比较低的方法：
	a = ['a','b','c','d']
	content = ''
	for i in a:
	content = content + i
	print content

	content的结果是:'abcd'
	先进方法1：
	用字符串的join方法：
	a = ['a','b','c','d']
	content = ''
	content = ''.join(a)
	print content

	content的结果:'abcd'

	先进方法2：
	用字符串的替换占位符替换
	a = ['a','b','c','d']
	content = ''
	content = '%s%s%s%s' % tuple(a)
	print content
	content的结果是:'abcd'
#T=字符串替换
	a = 'hello word'
	我把a字符串里的word替换为python
	1用字符串本身的replace方法
	a.replace('word','python')
	输出的结果是hello python

	2用正则表达式来完成替换:
	import re
	strinfo = re.compile('word')
	b = strinfo.sub('python',a)
	print b
	输出的结果也是hello python
#T=字符串截取
	python的字串列表有2种取值顺序
	1是从左到右索引默认0开始的，最大范围是字符串长度少1
	s = 'ilovepython'
	s[0]的结果是i

	2是从右到左索引默认-1开始的，最大范围是字符串开头
	s = 'ilovepython'
	s[-1]的结果是n

	上面这个是取得一个字符，如果你的实际要取得一断字符的话，可以用到python 字符串截取功能

	比如
	s = 'ilovepython'
	s[1:5]的结果是love
	当使用以冒号分隔的字符串，python返回一个新的对象，结果包含了以这对偏移标识的连续的内容，左边的开始是包含了下边界，比如
	上面的结果包含了s[1]的值l，而取到的最大范围不包括上边界，就是s[5]的值p

	多举几个里例子让大家更明白点：
	s[:3]
	结果是'ilo'，省掉:左边的话，默然左边开始的索引值是0，其实这个表达式和s[0:3]的意思是一样的。
	s[:-1]
	结果是:'ilovepytho' 就是左边开始的索引值是0，最大范围到字符串里的最后一个字符但是不包括最后一个字符。
	s[:]
	结果是:'ilovepython' 获取了从偏移0到末尾之间的元素，这是python 字符串拷贝
#T=控制语句
	python控制语句和其它的语言的控制语句有些地方是不同的，python的一些哲学思想就体现在他的控制语句上。
	1比如python提倡简单实用的思想，它就没有switch语句，如果要实现switch语句的效果
	的话可以通过2个方法来写把
	(1)通过if elif 语句来实现
	if 条件:
	...
	elif 条件:
	...
	else:
	...

	(2)通过
	info = {}
	info = {'a':'1','b':2,'c':3,'default':'ss'}
	c = info.get('a','default')

	2while语句有else语句

	a = 2

	while a > 1:
	print 'success'
	else:
	print 'error'

	当while循环条件变为False的时候，else块才被执行——这甚至也可能是在条件第一次被检验的时候。

	3 for语句有else语句

	for i in xrange(5):
	print i
	else:
	print 'loop is end'

	结果是 0 1 2 3 4 loop is end
	记住，else部分是可选的。如果包含else，它总是在for循环结束后执行一次，

	如果是遇到break语句，for 后面的else语句就不会执行了
	for i in xrange(5):
	if i == 3:
	print 'success'
	else:
	print 'loop is end'

	结果是 success
#T=赋值语句
	a = 1 a,b = 1,2
#T=调用语句
	log('aaa')
#T=选择语句
	a = 2
	if a >1 :
	print 'aaa'
	else:
	print 'bb'
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

#
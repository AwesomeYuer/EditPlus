#TITLE=See7di.@Python 2.6
#INFO
EditPlus Cliptext Library v1.0 Written by Seven(See7di@Gmail.com).
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n


#T=�ֵ�
	a = {'name':'xiaoming','age':23}
	�ֵ�ĳ��ò���������
	1 has_key('key����')
	�ж��ֵ����Ƿ��иü����ڣ�������ڵĻ�����True�������ڵĻ�����False
	����
	a.has_key("name")����True
	a.has_key("sss")����False

	2keys()���ص����ֵ����ɵ��б�
	����a.keys()
	����:['age','name']

	3values���ص����ֵ�ֵ��ɵ��б�
	����a.values()
	����:[23,'xiaoming']

	4update()��������2���ֵ���кϲ�
	�����������ֽ�����һ��
	b = {'sex':'man'}
	a.update(b)
	print a
	����Ľ����:{'age': 23, 'name': 'xiaoming', 'sex': 'man'}

	����һЩ���õķ�������ͨ��help(a)����python���ĵ����鿴��
#T=�б�
	Ƕ�ף�
	l3 = ['a',['b','cc']]
	����:
	l3[1]
	��Ƭ��
	l3[2:4]
	������2���ǳ�����˼�Ĳ���������*
	����:
	[1,2]+[5,6]
	���������һ���µ��б�[1,2,5,6]
	ע��python��ǿ���͵����ԣ�
	���
	a = [1,2]
	print a+"11"
	���ᱨ��
	Traceback (most recent call last):
	File "", line 1, in
	TypeError: can only concatenate list (not "str") to list

	�����Ҫ��ӵĻ������԰�aͨ��str()����ת�����ַ����ͣ������ǰ��ַ���"11"ͨ��list()����ת�����б�����
	python�б��������python�ĵ����е�һ�֣����python forѭ���ٶȻ��ܶࡣ���濴��python�б��������ô�����ġ�
	example:
	a = [x+2 for x in range(10)]
	print a
	����Ľ����
	[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

	����˵������������ӵ�ִ�й��̣�
	python���ڽ��������range(10)���е��������ΰ��б��������ȡ��������ֵ������ߵ�x,Ȼ��ִ��x+2�Ĳ�����
	���Ұ�ִ�кõĽ���������б����range(10)�������Ժ����������һ���б��������[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
#T=Ԫ��
	pythonԪ����һ������ļ������ͣ���Ҳ��python�б�һ��֧��ƫ�Ʋ�����

	Ԫ������ô����ģ�
	()��ʾ��Ԫ��
	(1,)��ʾֻ��һ��ֵ��Ԫ��
	(1,2,3)3��Ԫ�ص�Ԫ��
	1,2,3Ҳ��ʾԪ�飬ֻ��û��()
	���Զ���Ԫ�����ȡ��(),����Ϊ��ͳһ�Ļ�����ü���(),��ĳ����⡣

	Ԫ��֧�֣�����Ƭ����
	a = (1,2)
	b = (3,4)
	c = a + b
	print c
	�����(1,2,3,4)
	print c[1:2]
	�����(2,)

	һ��Ҫע�������
	a = (1)
	print type(a)
	����ǣ�
	a = (1,)
	print type(a)
	�����:
	���������Ҫ����һ��Ԫ��Ļ���������ֻ��һ��Ԫ�صĻ����ǵü���,
	python Ԫ������ [python���������ܽ�] ��
	�������һ�����⣺

	��ΪԪ���ǲ��ɱ�Ķ������Ը����һ�����⡣
	a = (3,1,5,9)
	�����Ԫ�������Ԫ�ش�С��������Ҫ��ô����
#T=�ַ�������
	�Ƚ�����Ч�ʱȽϵ͵ķ�����
	a = ['a','b','c','d']
	content = ''
	for i in a:
	content = content + i
	print content

	content�Ľ����:'abcd'
	�Ƚ�����1��
	���ַ�����join������
	a = ['a','b','c','d']
	content = ''
	content = ''.join(a)
	print content

	content�Ľ��:'abcd'

	�Ƚ�����2��
	���ַ������滻ռλ���滻
	a = ['a','b','c','d']
	content = ''
	content = '%s%s%s%s' % tuple(a)
	print content
	content�Ľ����:'abcd'
#T=�ַ����滻
	a = 'hello word'
	�Ұ�a�ַ������word�滻Ϊpython
	1���ַ��������replace����
	a.replace('word','python')
	����Ľ����hello python

	2��������ʽ������滻:
	import re
	strinfo = re.compile('word')
	b = strinfo.sub('python',a)
	print b
	����Ľ��Ҳ��hello python
#T=�ַ�����ȡ
	python���ִ��б���2��ȡֵ˳��
	1�Ǵ���������Ĭ��0��ʼ�ģ����Χ���ַ���������1
	s = 'ilovepython'
	s[0]�Ľ����i

	2�Ǵ��ҵ�������Ĭ��-1��ʼ�ģ����Χ���ַ�����ͷ
	s = 'ilovepython'
	s[-1]�Ľ����n

	���������ȡ��һ���ַ���������ʵ��Ҫȡ��һ���ַ��Ļ��������õ�python �ַ�����ȡ����

	����
	s = 'ilovepython'
	s[1:5]�Ľ����love
	��ʹ����ð�ŷָ����ַ�����python����һ���µĶ��󣬽�������������ƫ�Ʊ�ʶ�����������ݣ���ߵĿ�ʼ�ǰ������±߽磬����
	����Ľ��������s[1]��ֵl����ȡ�������Χ�������ϱ߽磬����s[5]��ֵp

	��ټ����������ô�Ҹ����׵㣺
	s[:3]
	�����'ilo'��ʡ��:��ߵĻ���ĬȻ��߿�ʼ������ֵ��0����ʵ������ʽ��s[0:3]����˼��һ���ġ�
	s[:-1]
	�����:'ilovepytho' ������߿�ʼ������ֵ��0�����Χ���ַ���������һ���ַ����ǲ��������һ���ַ���
	s[:]
	�����:'ilovepython' ��ȡ�˴�ƫ��0��ĩβ֮���Ԫ�أ�����python �ַ�������
#T=�������
	python�����������������ԵĿ��������Щ�ط��ǲ�ͬ�ģ�python��һЩ��ѧ˼������������Ŀ�������ϡ�
	1����python�ᳫ��ʵ�õ�˼�룬����û��switch��䣬���Ҫʵ��switch����Ч��
	�Ļ�����ͨ��2��������д��
	(1)ͨ��if elif �����ʵ��
	if ����:
	...
	elif ����:
	...
	else:
	...

	(2)ͨ��
	info = {}
	info = {'a':'1','b':2,'c':3,'default':'ss'}
	c = info.get('a','default')

	2while�����else���

	a = 2

	while a > 1:
	print 'success'
	else:
	print 'error'

	��whileѭ��������ΪFalse��ʱ��else��ű�ִ�С���������Ҳ��������������һ�α������ʱ��

	3 for�����else���

	for i in xrange(5):
	print i
	else:
	print 'loop is end'

	����� 0 1 2 3 4 loop is end
	��ס��else�����ǿ�ѡ�ġ��������else����������forѭ��������ִ��һ�Σ�

	���������break��䣬for �����else���Ͳ���ִ����
	for i in xrange(5):
	if i == 3:
	print 'success'
	else:
	print 'loop is end'

	����� success
#T=��ֵ���
	a = 1 a,b = 1,2
#T=�������
	log('aaa')
#T=ѡ�����
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
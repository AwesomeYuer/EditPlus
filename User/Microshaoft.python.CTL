#TITLE=08.Microshaoft.python
#INFO
New Cliptext library
#SORT=n

#T=代码行数统计
^#!/usr/bin/python

'''
		File	  : count.py
		Author	: Mike
		E-Mail	: Mike_Zhang@live.com
'''
import sys,os

extens = [".c",".cpp",".hpp",".h", ".cs"]
linesCount = 0
filesCount = 0

def funCount(dirName):
	global extens,linesCount,filesCount
	for root,dirs,fileNames in os.walk(dirName):
		for f in fileNames:
			fname = os.path.join(root,f)
			try :
				ext = f[f.rindex('.'):]
				if(extens.count(ext) > 0):
					print 'support'
					filesCount += 1
					print fname
					l_count = len(open(fname).readlines())
					print fname," : ",l_count
					linesCount += l_count
				else:
					 print ext," : not support"
			except:
				print "Error occur!"
				pass


if len(sys.argv) > 1 :
	for m_dir in sys.argv[1:]:
		print m_dir
		funCount(m_dir)
else :
	funCount(".")
	
print "files count : ",filesCount
print "lines count : ",linesCount

raw_input("Press Enter to continue")
#
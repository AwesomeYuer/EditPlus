#TITLE=See7di.Shtml
#INFO=EditPlus Cliptext Library v1.0 written by EMischie.

#SORT=n

#T= йн SHTML commands йн
#T=abort
<!--#abort -->
#T=charseq
<!--#charseq seq="^!" -->
#T=comment
<!--#comment text="^!" -->
#T=dir
<!--#dir localvar="^!" source="" pattern="*.*" -->
#T=echo
<!--#echo var="^!" -->
#T=elif
<!--#elif var="^!" equals="" -->
#T=else
<!--#else -->
#T=embed
<!--#embed file="^!" encoding="base64" -->
#T=endfor
<!--#endfor name="^!" -->
#T=endloop
<!--#endloop name="^!" -->
#T=endwhile
<!--#endwhile name="^!" -->
#T=exitloop
<!--#exitloop name="^!" var="" equals="" exists="true" -->
#T=foreach
<!--#foreach name="^!" var="" setvar="" -->
	
<!--#endfor name="^!" -->
#T=gwavacmd
<!--#gwavacmd process_xml="^!" localvar="" -->
#T=if
<!--#if var="^!" equals="" -->
#T=include
<!--#include file="!^" -->
#T=jdbc
<!--#jdbc select="^!" name="" -->
#T=localvar
<!--#localvar var="^!" equals="" -->
#T=loop
<!--#loop name="^!" -->
#T=math
<!--#math var="^!" operator="+" value="1" decimalplaces="" -->
#T=maxloops
<!--#maxloops equals="^!" -->
#T=rendertotarget
<!--#rendertotarget literal="^!" targettype="tempfile" target="" -->
#T=scripttimeout
<!--#scripttimeout equals="^!" -->
#T=tempfile
<!--#tempfile var="^!" action="open" -->
#T=until
<!--#until name="^!" var="" equals="" -->
#T=localvar
<!--#var var="^!" equals="" -->
#T=while
<!--#while name="^!" var="" equals="" -->
	
<!--#endwhile name="^!" -->
#

#T=$(
$(^!)
#T= 
#T= йн SHTML functions йн
#T=Decrypt
$Decrypt(basicrypt, ^!)
#T=EmbedFile
$EmbedFile(^!, RAW)
#T=Encrypt
$Encrypt(basicrypt, ^!)
#T=FormatDate
$FormatDate(^!, ) 
#T=LocalizePathSlashes
$LocalizePathSlashes(^!)
#T=QPairToText
$QPairToText(^!)
#T=RandomNumber
$RandomNumber(^!)
#T=Substr
$Substr(^!, )
#T=SpecialsLiteral
$SpecialsLiteral(^!)
#T=TextToQPair
$TextToQPair(^!)
#T=TextToURLVariable
$TextToURLVariable(^!)
#T=Translate
$Translate(B64, RAW, ^!)
#T= 

#T= йн SHTML attributes йн
#T=action
#T=close
#T=column
#T=columnname
#T=contains
#T=dbid
#T=decimalplaces
#T=defaultdb
#T=destination
#T=dim
#T=else
#T=empty
#T=encoding
#T=equalorgreater
#T=equalorless
#T=equals
#T=exists
#T=file
#T=greaterthan
#T=lessthan
#T=literal
#T=localvar
#T=name
#T=next
#T=notcontain
#T=notequal
#T=operation
#T=operator
#T=pattern
#T=process_xml
#T=recordset
#T=select
#T=seq
#T=setvar
#T=source
#T=split
#T=target
#T=targettype
#T=text
#T=usedb
#T=value
#T=var
#T= 

#T= йн SHTML values йн
#T=basicrypt 
#T=RAW 
#T=Base64
#T=B64
#T=B64WRAP
#T=timestamp
#T=now
#T=today
#T=midday
#T=midnight
#T= 

#T= йн SHTML Server Vars йн
#T=server.time.stamp
server.time.stamp
#T=server.time.weekday
server.time.weekday
#T=server.time.weekday.short
server.time.weekday.short
#T=server.time.weekday.number
server.time.weekday.number
#T=server.time.weekday.number.pad
server.time.weekday.number.pad
#T=server.time.month
server.time.month
#T=server.time.month.short
server.time.month.short
#T=server.time.month.number
server.time.month.number.pad
#T=server.time.monthday
server.time.monthday
#T=server.time.monthday.pad
server.time.monthday.pad
#T=server.time.year
server.time.year
#T=server.time.year.short
server.time.year.short
#T=server.time.hour
server.time.hour
#T=server.time.hour.24
server.time.hour.24
#T=server.time.hour.12
server.time.hour.12
#T=server.time.hour.pad
server.time.hour.pad
#T=server.time.hour.24.pad
server.time.hour.24.pad
#T=server.time.hour.12.pad
server.time.hour.12.pad
#T=server.time.minute
server.time.minute
#T=server.time.minute.pad
server.time.minute.pad
#T=server.time.second
server.time.second
#T=server.time.second.pad
server.time.second.pad
#T=server.time.ampm
server.time.ampm
#T=server.platform
server.platform
#T=server.hostname
server.hostname
#T=server.internalbuild
server.internalbuild
#T= 

#T= йн SHTML HTTP interface Vars йн
#T=httpsession.ipaddress
httpsession.ipaddress
#T=httpsession.url
httpsession.url
#T=httpsession.page
httpsession.page
#T=httpsession.username
httpsession.username
#T=httpsession.userid
httpsession.userid
#T=httpsession.client.xxxx
httpsession.client.xxxx
#T= 

#T= йн GWAVAMAN Vars йн
#T=server.hostid
server.hostid
#T=server.identity
server.identity
#T=server.uptime
server.uptime
#T=server.recoverymode
server.recoverymode
#T=server.rootdir
server.rootdir
#T=server.rootdir.slashforward
server.rootdir.slashforward
#T=server.tempdir
server.tempdir
#T= 

#T= йн GWAVAQMS Vars йн
#T=server.uptime
server.uptime
#T=server.rootdir
server.rootdir
#T=server.rootdir.slashforward
server.rootdir.slashforward
#T=server.tempdir
server.tempdir
#T= 

#T= йн Formatted Date йн
<!--#config timefmt="%m/%d/%y" -->
<!--#echo var="DATE_LOCAL" -->
#T= 

#T= йн date format codes йн
#T=%a - abbreviated weekday
%a
#T=%A - full weekday
%A
#T=%b - abbreviated month
%b
#T=%B - full month
%B
#T=%c - locale's date and time representation
%c
#T=%C - default date and time format
%C
#T=%d - day of month 01-31
%d
#T=%D - date as %m/%d/%y
%D
#T=%e - day of month 1-31 single digits preceded by a blank
%e
#T=%h - abbreviated month, alias for %b
%h
#T=%H - hour 00-23
%H
#T=%I - hour 01-12
%I
#T=%j - day of year 001-366
%j
#T=%m - month of year 01-12
%m
#T=%M - minute 00-59
%M
#T=%n - newline character
%n
#T=%p - string containing AM or PM
%p
#T=%r - time as %I:%M:%S %p
%r
#T=%R - time as %H:%M
%R
#T=%S - seconds 00-61
%S
#T=%t - insert tab character
%t
#T=%T - time as %H:%M:%S
%T
#T=%U - week number of year 00 to 53 (Sunday=1st day)
%U
#T=%w - day of week - Sunday=0
%w
#T=%W - week number of year 00 to 53(Monday=1st day)
%W
#T=%x - Country-specific date format
%x
#T=%X - Country-specific time format
%X
#T=%y - year 00 to 99
%y
#T=%Y - year 4 digits
%Y
#T=%Z - timezone name
%Z
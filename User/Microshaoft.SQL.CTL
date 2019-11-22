#TITLE=04.Microshaoft SQL
#INFO
New Cliptext library
#SORT=y

#T=ADSI
EXEC sp_addlinkedsrvlogin 'ADSI', 'false', '数据库用户名', 'ad用户名', 'ad用户名称'


GO


SELECT objectGUID,ObjectCategory,officeroom,sectionoffice,userPrincipalName,displayname,department 
FROM OPENQUERY(ADSI, 'SELECT objectGUID,ObjectCategory,officeroom,sectionoffice,userPrincipalName,displayname,department FROM ''LDAP://portal.contoso.uat/OU=部门,DC=portal,DC=contoso,DC=uat'' WHERE objectClass=''Person'' AND objectClass=''User''')


GO
#T=AlwaysOn HA Group
select
	ag.name
	, ar.replica_server_name as primary_server_role
	,
		(
			select
				replica_server_name
			from
				sys.availability_replicas as b
			where
				b.replica_id = a.read_only_replica_id
		) as secondary_route_reader_server
	, a.routing_priority
	, ar.availability_mode_desc
	, ar.failover_mode_desc
	, ar.secondary_role_allow_connections_desc
from
	sys.availability_read_only_routing_lists as a
		right join
			sys.availability_replicas as ar
				on
					a.replica_id = ar.replica_id
		join
			sys.availability_groups as ag
			on
				ar.group_id = ag.group_id

#T=AlwaysOn HA Group ReadOnly Routing
--1写2读
ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE1' WITH
(SECONDARY_ROLE (READ_ONLY_ROUTING_URL = N'TCP://SQLNODE1.CONTOSO.COM:1433'));
GO 
ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE2' WITH
(SECONDARY_ROLE (READ_ONLY_ROUTING_URL = N'TCP://SQLNODE2.CONTOSO.COM:1433'));
GO 
ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE3' WITH
(SECONDARY_ROLE (READ_ONLY_ROUTING_URL = N'TCP://SQLNODE3.CONTOSO.COM:1433'));
GO 

ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE1' WITH
(PRIMARY_ROLE (READ_ONLY_ROUTING_LIST=('SQLNODE2','SQLNODE3','SQLNODE1')));
GO
ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE2' WITH
(PRIMARY_ROLE (READ_ONLY_ROUTING_LIST=('SQLNODE3','SQLNODE1','SQLNODE2')));
GO
ALTER AVAILABILITY GROUP AOHAG
MODIFY REPLICA ON
N'SQLNODE3' WITH
(PRIMARY_ROLE (READ_ONLY_ROUTING_LIST=('SQLNODE1','SQLNODE2','SQLNODE3')));
GO

#T=Attach create database ... for Attach
USE [master]
GO

/****** Object:  Database [iFundGlobalCenter]    Script Date: 2013/12/9 12:53:44 ******/
CREATE DATABASE [iFundGlobalCenter]
 --CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iFundManagement_01', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_01.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_02', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_02.ndf' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_03', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_03.ndf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_04', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_04.ndf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyGeneralLedgerResult_FG] 
( NAME = N'DailyGeneralLedgerResult_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyGeneralLedgerResult_FG_DataFile_001.MDF' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyGeneralLedgerResult_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyGeneralLedgerResult_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyGeneralLedgerResult_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyGeneralLedgerResult_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyGeneralLedgerResult_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyGeneralLedgerResult_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedger_FG] 
( NAME = N'DailyLedger_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedger_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedger_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedger_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedger_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedger_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedger_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedger_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerApp_FG] 
( NAME = N'DailyLedgerApp_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerApp_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerApp_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerApp_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerApp_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerApp_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerApp_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerApp_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerAppHistory_FG] 
( NAME = N'DailyLedgerAppHistory_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerAppHistory_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerAppHistory_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerAppHistory_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerAppHistory_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerAppHistory_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerAppHistory_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerAppHistory_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerResult_FG] 
( NAME = N'DailyLedgerResult_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResult_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResult_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResult_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResult_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResult_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResult_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResult_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerResultRsv_FG] 
( NAME = N'DailyLedgerResultRsv_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultRsv_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultRsv_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultRsv_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultRsv_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultRsv_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultRsv_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultRsv_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerResultTransactionsFix_FG] 
( NAME = N'DailyLedgerResultTransactionsFix_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultTransactionsFix_FG_DataFile_001.MDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultTransactionsFix_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultTransactionsFix_FG_DataFile_002.NDF' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultTransactionsFix_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultTransactionsFix_FG_DataFile_003.NDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultTransactionsFix_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultTransactionsFix_FG_DataFile_004.NDF' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DailyLedgerResultVar_FG] 
( NAME = N'DailyLedgerResultVar_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultVar_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultVar_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultVar_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultVar_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultVar_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'DailyLedgerResultVar_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\DailyLedgerResultVar_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [Transactions_FG] 
( NAME = N'Transactions_FG_DataFile_001', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\Transactions_FG_DataFile_001.MDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'Transactions_FG_DataFile_002', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\Transactions_FG_DataFile_002.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'Transactions_FG_DataFile_003', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\Transactions_FG_DataFile_003.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
( NAME = N'Transactions_FG_DataFile_004', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\Transactions_FG_DataFile_004.NDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'iFundGlobalCenter_log_01', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_log_01.LDF' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_log_02', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_log_02.ndf' , SIZE = 106496KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_log_03', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_log_03.ndf' , SIZE = 106496KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB ), 
( NAME = N'iFundGlobalCenter_log_04', FILENAME = N'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\iFundGlobalCenter\iFundGlobalCenter_log_04.ndf' , SIZE = 98304KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
for attach
#T=backup SQL DataBase
create procedure [dbo].[zsp_backup_db]
	@dbName sysname = Null				--要备份的数据库名称,不指定则备份当前数据库
	, @bkPath varchar(256) = ''			--备份文件的存放目录,不指定则使用SQL默认的备份目录
	, @bkfName varchar(256) = ''		--备份文件名,文件名中可以用\DBNAME\代表数据库名,\DATE\代表日期,\TIME\代表时间
	, @bktype varchar(4) = 'FULL'		--备份类型:'DB'备份数据库,'DF' 差异备份,'LOG' 日志备份
	, @isAppend bit = 0					--1追加/0覆盖备份文件
	, @password varchar(20) = ''		--为备份文件设置的密码(仅sql2000支持),设置后,恢复时必须提供此密码
as
begin
	set @bktype = upper(@bktype)
	declare @sql varchar(8000)

	if RTRIM(LTRIM(ISNULL(@dbName,''))) = ''
	begin
		set @dbName = db_name()
	end

	if ltrim(rtrim(isnull(@bkPath, ''))) = ''
	begin
		select @bkPath = rtrim(reverse(filename))
		from master..sysfiles
		where name = 'master'

		select @bkPath = substring(@bkPath, charindex('\', @bkPath) + 1, 4000)
				, @bkPath = reverse(substring(@bkPath, charindex('\', @bkPath), 4000))
							+ 'BACKUP\'
	end

	if ltrim(rtrim(isnull(@bkfName, ''))) = ''
	begin
		set @bkfName = '\DBNAME\_\DATE\_\TIME\.BAK'
	end

	set @bkfName = replace
					(
						replace
							(
								replace
									(
										@bkfName,
										'\DBNAME\',
										@dbName
									)
								, '\DATE\'
								, convert(varchar, getdate(), 112)
							)
						, '\TIME\'
						, replace
							(
								convert(varchar, getdate(), 108), ':', ''
							)
					)
	set @sql = 'BACKUP '
				+ case @bktype when 'LOG' then 'LOG [' else 'DATABASE [' end
				+ @dbName
				+ '] TO DISK = '''
				+ @bkPath
				+ @bkfName
				+ ''' WITH '
				+ case @bktype when 'DIFF' then 'DIFFERENTIAL, ' else '' end
				+ case @isAppend when 1 then 'NOINIT' else 'INIT' end
				+ case isnull(@password,'') when '' then '' else ', PASSWORD = '''
				+ @password
				+ '''' end

	--print @sql
	exec(@sql)

	set @bkPath = @bkPath
					+ @bkfName
	--由于是覆盖备份所以不 dump
	--EXEC sp_addumpdevice 'disk', @bkfName, @bkPath
end

go

create procedure [dbo].[zsp_backup_db_daily]
	@db sysname = Null
	, @weekday int
	, @hour int
	, @path varchar(100) = ''
	, @bakType varchar(5) = 'Full'
as
begin
--print @db
if RTRIM(LTRIM(ISNULL(@db,''))) = ''
begin
	set @db = db_name()
end

declare @w char(1)
set @w = cast(@weekday as char(1))

declare @h varchar(2)
set @h = right('0' + cast(@hour as varchar(2)), 2)

set @bakType = upper(ltrim(rtrim(@bakType)))

declare @bkFile varchar(100)
set @bkFile = @db
				+ '.'
				+ @w
				+ '.'
				+ @h
				+ '.'
				+ left(@bakType, 3)
				+ '.bak'

set @path = @path
			+ '\'
			+ @db
			+ '\'
			+ @w
			+ '\'

exec zsp_backup_db @dbName = @db, @bkPath = @path, @bkfName = @bkFile, @bktype = @bakType
end

go

create procedure [dbo].[zsp_backup_db_HourlyJob]
	@rootPath varchar(256)
	, @oddPath varchar(256) = 'OddWeek'
	, @evenPath varchar(256) = 'EvenWeek'
	,@dbName sysname = null
	--严禁手动执行
as
begin
--zsp_backup_db_HourlyJob 'd:\dbbackup'
declare @now datetime
set @now = getdate()

-- 周一 到 周日 
-- 1 2 3 4 5 6 7
declare @weekDay int
set @weekDay = (@@Datefirst + datepart(weekday, @now)) % 7
			+ case when (@@Datefirst + datepart(weekday, @now)) % 7 < 2
						then 6
					else
						-1
				end

declare @hour int --钟点
set @hour = datepart(Hour, @now)

if @weekDay = 7 --周日
begin
	if @hour in (4, 5)
	begin
		--周日凌晨 4、5点不做备份,为3点的全备留出足够的时间
		return
	end
end

if RTRIM(LTRIM(ISNULL(@dbName,''))) = ''
begin
	set @dbName = db_name()
end
declare @bakType varchar(4)

if (RIGHT(@rootPath,1) != '\')
begin
	set @rootPath = @rootPath + '\'
end

if (RIGHT(@oddPath,1) != '\')
begin
	set @oddPath = @oddPath + '\'
end

if (RIGHT(@evenPath,1) != '\')
begin
	set @evenPath = @evenPath + '\'
end

declare @StartDate datetime --基准日期
set @StartDate = 0
declare @weeksDiff int
set @weeksDiff = datediff(week, @StartDate, @now)
						+ case
								when (@@Datefirst + datepart(weekday,@StartDate)) % 7 = 1
									then 1
								else
									0
							end
						- case
								when (@@Datefirst + datepart(weekday,@now)) % 7 = 1
									then 1
								else 0
							end


set @rootPath = @rootPath + case when @weeksDiff % 2 = 0 then @evenPath else @oddPath end + '\'


set @bakType = 'Log'
exec zsp_backup_db_daily @dbName, @weekDay, @hour, @rootPath, @bakType

if @hour = 3 -- 03:00
begin
	if @weekDay = 7 -- 周日 full backup
	begin
		set @bakType = 'Full'
		exec zsp_backup_db_daily @dbName, @weekDay, @hour, @rootPath, @bakType
	end
	else
	begin  -- except 周日 diff backup
		set @bakType = 'Diff'
		exec zsp_backup_db_daily @dbName, @weekDay, @hour, @rootPath, @bakType
	end
end
end

#T=backup SQL database NEW
alter procedure [zsp_backup_HourlyJob]
	@BackupRootPath varchar(max)
	,@dbName sysname = null
	, @oddWeekPath varchar(max) = 'OddWeek'
	, @evenWeekPath varchar(max) = 'EvenWeek'
	--严禁手动执行
as
begin
	--zsp_backup_HourlyJob 'd:\dbbackup'
	declare @now datetime
	set @now = getdate()
	-- 周一 到 周日
	-- 1 2 3 4 5 6 7
	declare @weekDay int
	set @weekDay = (@@Datefirst + datepart(weekday, @now)) % 7
					+ case
							when
								(@@Datefirst + datepart(weekday, @now)) % 7 < 2
									then
										6
							else
										- 1
						end

	declare @hour int --钟点
	set @hour = datepart(Hour, @now)
	if @weekDay = 7 --周日
	begin
		if @hour in (4, 5)
		begin
			--周日凌晨 4、5点不做备份,为3点的全备留出足够的时间
			return
		end
	end

	set @BackupRootPath = rtrim(ltrim(isnull(@BackupRootPath,'')))
	set @oddWeekPath = rtrim(ltrim(isnull(@oddWeekPath,'')))
	set @evenWeekPath = rtrim(ltrim(isnull(@evenWeekPath,'')))
	set @dbName = rtrim(ltrim(isnull(@dbName,'')))

	if rtrim(ltrim(isnull(@dbName,''))) = ''
	begin
		set @dbName = db_name()
	end
	if (right(@BackupRootPath,1) != '\')
	begin
		set @BackupRootPath += '\'
	end

	
	set @BackupRootPath += @dbName + '\'

	if (right(@oddWeekPath,1) != '\')
	begin
		set @oddWeekPath += '\'
	end
	if (right(@evenWeekPath,1) != '\')
	begin
		set @evenWeekPath += '\'
	end

	declare @BaseDate datetime --基准日期
	set @BaseDate = 0
	declare @weeksDiff int
	set @weeksDiff =
						datediff(week, @BaseDate, @now)
						+ case
								when
									(@@Datefirst + datepart(weekday,@BaseDate)) % 7 = 1
										then
											1
								else
											0
							end
						- case
								when
									(@@Datefirst + datepart(weekday,@now)) % 7 = 1
										then
											1
								else
											0
							end
	set @BackupRootPath +=
					case
						when
							@weeksDiff % 2 = 0
								then
									@evenWeekPath
						else
									@oddWeekPath
					end

	if (RIGHT(@BackupRootPath,1) != '\')
	begin
		set @BackupRootPath += '\'
	end

	declare @w char(1)
	set @w = cast(@weekday as char(1))

	declare @h varchar(2)
	set @h = right('0' + cast(@hour as varchar(2)), 2)

	declare @bakType varchar(25)
	set @bakType = 'LOG'
	declare @bakFile varchar(100)
	set @bakFile = @dbName
					+ '.'
					+ @w
					+ '.'
					+ @h
					+ '.'

	declare @path varchar(max)
	declare @result int = 0
	set @path =
					@BackupRootPath
					+ @bakFile
					+ @bakType
					+ '.bak'

	exec zsp_Backup_Log @dbname, @path, @result out
	select
		GETDATE()					as [DealTime]
		, 'zsp_Backup_Log'			as [Operation]
		, @dbname					as [DataBaseName]
		, @path						as [BackupFilePath]
		, @result					as [Result]

	if @hour = 3 -- 03:00
	begin
		if @weekDay = 7 -- 周日 full backup
		begin
			set @bakType = 'FUL'
			set @path =
						@BackupRootPath
						+ @bakFile
						+ @bakType
						+ '.bak'

			exec zsp_Backup_Database @dbName, @path, @result out
			select
				GETDATE()					as [DealTime]
				, 'zsp_Backup_Database'		as [Operation]
				, @dbname					as [DataBaseName]
				, @path						as [BackupFilePath]
				, @result					as [Result]
		end
		else
		begin  -- except 周日 diff backup
			set @bakType = 'DIF'
			set @path =
						@BackupRootPath
						+ @bakFile
						+ @bakType
						+ '.bak'
			exec zsp_Backup_Database_With_Differential @dbName, @path, @result out
			select
				GETDATE()										as [DealTime]
				, 'zsp_Backup_Database_With_Differential'		as [Operation]
				, @dbname										as [DataBaseName]
				, @path											as [BackupFilePath]
				, @result										as [Result]
		end
	end
end

GO

alter procedure [zsp_Backup_Database]
	@DataBaseName sysname = null
	, @Path varchar(max)
	, @Result int = 0 out
as
begin
	--exec zsp_Backup_Database default,'d:\dbbackup\OddWeek\Test\2\Test.2.23.LOG.bak'
	if rtrim(ltrim(isnull(@DataBaseName,''))) = ''
	begin
		set @DataBaseName = db_name()
	end
	backup database
			@DataBaseName
		TO DISK = @Path
			WITH
				INIT
				,compression
	begin try
		restore verifyonly
			from disk =  @Path
	end try
	begin catch
		set @Result = ERROR_NUMBER()
		SELECT
			'restore verifyonly
			from disk = ''' + @Path + '''' as SQL
			, @Result AS ErrorNumber
			, ERROR_SEVERITY() AS ErrorSeverity
			, ERROR_STATE() AS ErrorState
			, ERROR_PROCEDURE() AS ErrorProcedure
			, ERROR_LINE() AS ErrorLine
			, ERROR_MESSAGE() AS ErrorMessage
	end catch
end

go

alter procedure [zsp_Backup_Database_With_Differential]
	@DataBaseName sysname = null
	, @Path varchar(max)
	, @Result int = 0 out
as
begin
	--exec zsp_Backup_Database default, 'd:\dbbackup\OddWeek\Test\2\Test.2.23.LOG.bak'
	if rtrim(ltrim(isnull(@DataBaseName,''))) = ''
	begin
		set @DataBaseName = db_name()
	end
	backup database
			@DataBaseName
		TO DISK = @Path
			WITH
				INIT
				, Differential
				, compression
	begin try
		restore verifyonly
			from disk = @Path
	end try
	begin catch
		set @Result = ERROR_NUMBER()
		SELECT
			'restore verifyonly
			from disk = ''' + @Path + '''' as SQL
			, @Result AS ErrorNumber
			, ERROR_SEVERITY() AS ErrorSeverity
			, ERROR_STATE() AS ErrorState
			, ERROR_PROCEDURE() AS ErrorProcedure
			, ERROR_LINE() AS ErrorLine
			, ERROR_MESSAGE() AS ErrorMessage
	end catch
end

go

alter procedure [zsp_Backup_Log]
	@DataBaseName sysname = null
	, @Path varchar(max)
	, @Result int = 0 out
as
begin
	--exec zsp_Backup_Database default, 'd:\dbbackup\OddWeek\Test\2\Test.2.23.LOG.bak'
	if rtrim(ltrim(isnull(@DataBaseName,''))) = ''
	begin
		set @DataBaseName = db_name()
	end
	backup log
			@DataBaseName
		TO DISK = @Path
			WITH
				INIT
				, compression
	begin try
		restore verifyonly
			from disk = @Path
	end try
	begin catch
		set @Result = ERROR_NUMBER()
		SELECT
			'restore verifyonly
			from disk = ''' + @Path + '''' as SQL
			, @Result AS ErrorNumber
			, ERROR_SEVERITY() AS ErrorSeverity
			, ERROR_STATE() AS ErrorState
			, ERROR_PROCEDURE() AS ErrorProcedure
			, ERROR_LINE() AS ErrorLine
			, ERROR_MESSAGE() AS ErrorMessage
	end catch
end

#T=backupset 监控
select
	getdate() as now
	, a.name as [DataBaseName]
	, max
		(
			case when
					b.type in ('d')
						then
							b.backup_finish_date
				else
					null
			 end
		) as [最近数据库完整备份完成时间]
/*
	, max
		(
			case when
					b.type in ('I')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库差异备份完成时间]
*/
		, max
		(
			case when
					b.type in ('l')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库事务日志备份完成时间]
/*
		, max
		(
			case when
					b.type in ('f')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库文件或文件组备份完成时间]

		, max
		(
			case when
					b.type in ('g')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库差异文件备份完成时间]
		, max
		(
			case when
					b.type in ('p')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库部分备份完成时间]
				, max
		(
			case when
					b.type in ('q')
						then
							b.backup_finish_date
				
				else
					null
			 end
		) as [最近数据库差异部分备份完成时间]
*/		
from
	master.sys.Databases a
		left join
			msdb..backupset b
				on a.name = b.database_name
group by
	a.name
order by
	[最近数据库事务日志备份完成时间]
	, [最近数据库完整备份完成时间]

#T=base64 decode
IF OBJECT_ID(N'dbo.f_base64_decode') IS NOT NULL

    DROP FUNCTION dbo.f_base64_decode;

GO

/*-- == base64 解码=================================

    在SQL Server 中，使用FOR XML 生成xml 实例时，binary 数据

使用base64 编码，而解释xml 的时候，却没有相应的解码方法。

    使用此函数可以解决这个问题

    

    Base64 编码把个位字节（*8=24）转化为个位的字节（*6=24）

之后在位的前面补两个，形成位一个字节的形式。用下面的个字符重新

表示：“ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/”

    如果输入的数据的长度不是的倍数，则编码结果的不足部分用等号“=”

补足。

 

---------------------------------------------------------

-- 调用示例

 

    SELECT -- 还原成字符串

       v1 = CONVERT(varchar(max), v1),

       v2 = CONVERT(nvarchar(max), v2)

    FROM(

       SELECT  -- 解码base64 编码

           v1 = dbo.f_base64_decode(v1),

           v2 = dbo.f_base64_decode(v2)

       FROM(  -- 通过for xml 生成base64 编码

           SELECT

             v1 = (SELECT CONVERT(varbinary(max), 'base64 test') FOR XML PATH(''), TYPE).value('/', 'nvarchar(max)'),

              v2 = (SELECT CONVERT(varbinary(max), N'base64 解码测试') FOR XML PATH(''), TYPE).value('/', 'nvarchar(max)')

       )DATA

    )A

 

---------------------------------------------------------

-- 环境要求

 

适用于sql server 2005 或者更高的版本

 

-- ==== 邹建.02(引用请保留此信息) =============== */

CREATE FUNCTION dbo.f_base64_decode(

    @input varchar(max)

)RETURNS varbinary(max)

AS

BEGIN

    DECLARE

       @base64 char(64),

       @pos int,

       @len int,

       @output varbinary(max);

 

    SELECT

       @base64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',

       @pos = 1,

       @len = LEN(@input),

       @output = 0x;

 

    IF @input = ''

       RETURN 0x;

 

    IF @len % 4 > 0 OR @len IS NULL

       RETURN NULL;

       

    WHILE @pos < @len

    BEGIN

       SELECT

           @output = @output

              + CONVERT(binary(1), ((v1 & 63) * 4 ) | ((v2 & 48) / 16))

              + CONVERT(binary(1), ((v2 & 15) * 16) | ((v3 & 60) / 4 ))

              + CONVERT(binary(1), ((v3 & 3 ) * 64) | ((v4 & 63) / 1 )),

           @pos = @pos + 4

       FROM(

           SELECT

              v1 = CHARINDEX(SUBSTRING(@input, @pos + 0, 1) COLLATE Chinese_PRC_BIN, @base64) - 1,

              v2 = CHARINDEX(SUBSTRING(@input, @pos + 1, 1) COLLATE Chinese_PRC_BIN, @base64) - 1,

              v3 = CHARINDEX(SUBSTRING(@input, @pos + 2, 1) COLLATE Chinese_PRC_BIN, @base64) - 1,

              v4 = CHARINDEX(SUBSTRING(@input, @pos + 3, 1) COLLATE Chinese_PRC_BIN, @base64) - 1      

       )A;

    END;

 

    RETURN(SUBSTRING(@output, 1, @len / 4 * 3 - 3 + CHARINDEX('=', RIGHT(@input, 2) + '=')));

END;

#T=BOC iFund 期初余额计算 2013-06-16
USE [iFundGlobalCenter]
GO
/****** Object:  StoredProcedure [dbo].[zsp_InitializeDailyLedgerBeginingBalance]    Script Date: 2013/6/17 13:32:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[zsp_InitializeDailyLedgerBeginingBalance]
	@LedgerDate date = null
as
begin
	--exec [zsp_InitializeDailyLedgerBeginingBalance] '2013-06-13'

	declare @now datetime = getdate() --1
	if @LedgerDate is null
	begin
		set @LedgerDate = @now
	end

	declare @CNY2USDRatio decimal(38,16)
	select
		@CNY2USDRatio = CurrencyRate
	from
		CurrencyRate
	where
		CurrencyType = 'USD'

	--select @CNY2USDRatio 

	;with TLastDayLedger_Non_XYU_USD			--上日账 各核算码余额
	as
	(
		select
			max(b.DepartmentName) as BankID
			, CurrencyType
			, AccountingCategory
			, sum(DebtorBalance) as SumDebtorBalance
			, sum(CreditorBalance) as SumCreditorBalance
		from
			DailyLedgerProcess a
				left join
					Departments b
						on
							a.BankID = b.DepartmentID
		where
			CurrencyType not in
							(
								'XYU'
								,'USD'
							)
		group by
			BankID
			, CurrencyType
			, AccountingCategory
	)
	, TLastDayLedger_XYU_USD
	as
	(
		select
			max(b.DepartmentName) as BankID
			, 'USD' as CurrencyType
			, AccountingCategory
			, sum(DebtorBalance) as SumDebtorBalance
			, sum(CreditorBalance) as SumCreditorBalance
		from
			DailyLedgerProcess a
				left join
					Departments b
						on
							a.BankID = b.DepartmentID
		where
			CurrencyType in
							(
								'XYU'
								,'USD'
							)
		group by
			BankID
			, CurrencyType
			, AccountingCategory
	)
	, TLastDayLedger_Non_CNY_To_USD
	as
	(
		select
			a.BankID
			, 'USD' as CurrencyType
			, a.AccountingCategory
			, -1 * 
				a.SumDebtorBalance * b.CurrencyRate / @CNY2USDRatio as SumDebtorBalance
			, -1 * 
				a.SumCreditorBalance * b.CurrencyRate / @CNY2USDRatio as SumCreditorBalance
 		from
			TLastDayLedger_Non_XYU_USD a
				left join
					CurrencyRate b
						on
							a.CurrencyType = b.CurrencyType
		where
			a.CurrencyType not in
								(
									'CNY'
								)
		--group by
			-- a.BankID
			--, a.AccountingCategory
	)
	, TTodayDueLedger
	as
	(
		select 			
			bankID
			, CurrencyType
			, '今日到期上存本息-今日到期下借本息' as AccountingCategory
			, sum
				(
					case
						when
							TransType3 = '上存'
								then
									1
						when
							TransType3 = '下借'
								then
									-1
						else
							0
					end
					*
					(
						isnull(amount,0)
						+ ISNULL(SumInterest,0)
					)
				)  as SumDebtorBalance 
			, 0 as SumCreditorBalance
		from 
			Transactions
		where			
			EndDate = @LedgerDate
			--and TransType3 = '上存'
			and TransType = '拆借交易'
			and [Status] = 10
		group by
			BankID
			, CurrencyType
	)
	, TTodayLedgerAll
	as
	(
		select
			*
		from
			TLastDayLedger_Non_XYU_USD
		union all
		select
			*
		from
			TLastDayLedger_XYU_USD
		union all
		select
			*
		from
			TLastDayLedger_Non_CNY_To_USD
		union all
		select
			*
		from
			TTodayDueLedger
	)
	, TTodayLedgerResult
	as
	(
		select
			b.FormulaName as ForumlaName
			, a.BankID
			, a.CurrencyType
			--, a.AccountingCategory
			--, b.DCParty
			--, max(b.Factor) as MaxFactor
			--, min(b.Factor) as MinFactor
			, sum
				(
					case
						when
							b.DCParty = 'D'
								then
									a.SumDebtorBalance
						when
							b.DCParty = 'C'
								then
									a.SumCreditorBalance
						else
							0
					end
					*
					b.Factor
				) as Amount
		from
			TTodayLedgerAll a
				inner join
					Formulas b
						on
							a.AccountingCategory = b.Accounting
							--and b.FormulaName = @ForumlaName
		group by
			b.FormulaName 
			, a.BankID
			, a.CurrencyType
			--, a.AccountingCategory
			--, b.DCParty
	)
	, TTodayLedgerDetailsResult
	as
	(
		select
			b.FormulaName as ForumlaName
			, a.BankID
			, a.CurrencyType
			, a.AccountingCategory
			, b.DCParty
			, max(b.Factor) as MaxFactor
			, min(b.Factor) as MinFactor
			, sum
				(
					case
						when
							b.DCParty = 'D'
								then
									a.SumDebtorBalance
						when
							b.DCParty = 'C'
								then
									a.SumCreditorBalance
						else
							0
					end
					*
					b.Factor
				) as Amount
		from
			TTodayLedgerAll a
				inner join
					Formulas b
						on
							a.AccountingCategory = b.Accounting
							--and b.FormulaName = @ForumlaName
		group by
			b.FormulaName 
			, a.BankID
			, a.CurrencyType
			, a.AccountingCategory
			, b.DCParty
	)
	select
		*
	from
		TTodayLedgerResult
		--TTodayLedgerDetailsResult
		--TTodayLedgerAll
	where
		BankID != '总行'
		--and
		--BankiD = '福建分行'
	order by
		ForumlaName
		--,
		--,
		, bankid
		, CurrencyType
		--, AccountingCategory
end


USE [iFundGlobalCenter]
GO

/****** Object:  Table [dbo].[Formulas]    Script Date: 2013/6/16 20:26:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Formulas](
	[FormulaName] [varchar](50) NOT NULL,
	[Accounting] [varchar](50) NOT NULL,
	[DCParty] [varchar](50) NOT NULL,
	[Factor] [decimal](38, 16) NULL,
	[DebtorFactor] [decimal](38, 16) NULL,
	[CreditorFactor] [decimal](38, 16) NULL,
	[XPartyFactor] [decimal](38, 16) NULL,
	[Remarks] [varchar](100) NULL,
 CONSTRAINT [PK_Formulas_1] PRIMARY KEY CLUSTERED 
(
	[FormulaName] ASC,
	[Accounting] ASC,
	[DCParty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7077','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7121','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7131','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7132','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7136','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7138','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7151','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7161','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7172','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7185','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7195','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7201','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7205','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7211','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7212','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7214','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7215','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7216','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7217','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7219','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7221','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7225','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7241','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7242','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7245','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7246','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7250','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7251','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7259','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7301','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7302','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7308','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7309','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7312','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7314','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7315','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7316','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7401','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7406','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7407','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7408','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','7601','D',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8037','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8038','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8039','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8071','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8073','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8091','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8099','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8111','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8112','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8113','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8114','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8130','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8131','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8132','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8133','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8134','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8145','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8146','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8151','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8152','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8153','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8211','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8213','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8261','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8263','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8265','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8266','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8272','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8281','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8282','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8283','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8286','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8287','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8311','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8312','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8313','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8321','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8322','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8332','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8333','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8341','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8352','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8401','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8402','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8403','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8404','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8405','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8406','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8407','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8408','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8410','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8412','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8413','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8414','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8416','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8417','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8419','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8424','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8436','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8470','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8527','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','8642','C',1.0000000000000000,NULL,NULL,NULL,NULL)
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','存款准备金','D',-1.0000000000000000,NULL,NULL,NULL,'-存款准备金')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日客户存款上存可用余额','今日未到期客户存款上存','D',-1.0000000000000000,NULL,NULL,NULL,'-今日未到期客户存款上存')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日内部资金总可用余额','9069','C',-1.0000000000000000,NULL,NULL,NULL,'-上日9069余额贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日内部资金总可用余额','9069','D',1.0000000000000000,NULL,NULL,NULL,'+上日9069余额借方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日内部资金总可用余额','9181','C',-1.0000000000000000,NULL,NULL,NULL,'-上日9181营运资金余额贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日内部资金总可用余额','9181','D',1.0000000000000000,NULL,NULL,NULL,'+上日9181营运资金余额借方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('今日内部资金总可用余额','今日到期上存本息-今日到期下借本息','D',1.0000000000000000,NULL,NULL,NULL,'+(今日到期上存本息-今日到期下借本息)')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','7091','C',-1.0000000000000000,NULL,NULL,NULL,'-上日7091贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','7091','D',1.0000000000000000,NULL,NULL,NULL,'+上日7091借方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','8063','C',-1.0000000000000000,NULL,NULL,NULL,'-上日8063贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','8063','D',1.0000000000000000,NULL,NULL,NULL,'+上日8063借方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','9069','C',-1.0000000000000000,NULL,NULL,NULL,'-上日9069余额贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','9069','D',1.0000000000000000,NULL,NULL,NULL,'+上日9069余额借方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','9181','C',-1.0000000000000000,NULL,NULL,NULL,'-上日9181营运资金余额贷方')
INSERT INTO [Formulas]([FormulaName],[Accounting],[DCParty],[Factor],[DebtorFactor],[CreditorFactor],[XPartyFactor],[Remarks]) values ('上存行计算','9181','D',1.0000000000000000,NULL,NULL,NULL,'+上日9181营运资金余额借方')

#T=BOC 利息计算 2012-12-20
USE [FundManagement]
GO
/****** Object:  StoredProcedure [dbo].[usp_CalcDailyLedgerResult_debug3]    Script Date: 2012/12/19 11:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[usp_CalcDailyLedgerResult_debug9]
@today date = null
,@r int = -1 out
as
begin
	set xact_abort on
	begin transaction
		declare @now datetime = getdate()
		if @today is null
		begin
			set @today = @now
		end
		
			
		--select @today
		-- usp_CalcDailyLedgerResult_debug9 '2012-12-15'
		
		declare @TransType varchar(100)					--交易类型:	拆借、
		declare @AmountType varchar(100)				--金额类性:	本金、日利息、本金+总利息
		declare @DateType varchar(100)					--日期类型:	起息日、未到期日、到期日
		declare @OriginalTransDirection varchar(10)		--原始交易方向:	上存、下借



		declare @Accounting varchar(10)
		declare @OriginalTransParty varchar(10)

		delete
			[DailyLedgerResultProcessing]

		--==================================================================
		--起息日本金
		set @TransType = '拆借交易'
		set @AmountType = '本金'
		set @DateType = '起息日'
		set @OriginalTransDirection = '上存'

		;with T 
			(
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
     	select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate = @today			--起息日新交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate = @today			--起息日新交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--==================================================================
		--起息日本金
		set @OriginalTransDirection = '下借'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
	

		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate = @today			--起息日新交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate = @today			--起息日新交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--============================================================================================

		--==================================================================
		--全期日利息
		set @DateType = '全期'
		set @AmountType = '日利息'
		set @OriginalTransDirection = '上存'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate <= @today			--起息日未到期日交易
			and EndDate >= @today
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate <= @today			--起息日未到期日交易
			and endDate >= @today
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--==================================================================
		--全期日利息
		set @OriginalTransDirection = '下借'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
	

		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest
							else
								0
						end
					)
				as [CreditorBalance]
		from
			Transactions a
			, T
		where
			beginDate <= @today			--起息日未到期日交易
			and endDate >= @today
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate <= @today			--起息日未到期日交易
			and endDate >= @today
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================


		--======================================================================

		--==================================================================
		--未到期日冲回昨日
		set @AmountType = '冲回昨日'
		set @DateType = '未到期日'
		set @OriginalTransDirection = '上存'
		declare @yesterday date = dateadd(DAY, -1, @today)

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate < @yesterday			--未到期日交易
			and endDate >= @yesterday
			and TransType3 = @OriginalTransDirection	--上存
			and AmountType = @AmountType				--冲回昨日
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate < @yesterday			--未到期日交易
			and endDate >= @yesterday
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--==================================================================
		
		--未到期日冲回昨日
		set @OriginalTransDirection = '下借'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
	

		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [CreditorBalance]
		from
			Transactions a
			, T
		where
			beginDate < @yesterday			--未到期日交易
			and endDate >= @yesterday
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.DayInterest * datediff(day, a.BeginDate ,@yesterday)
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			beginDate < @yesterday			--未到期日交易
			and endDate >= @yesterday
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================
		
		--到期日本金
		--==================================================================
		--到期日本金
		set @AmountType = '本金'
		set @DateType = '到期日'
		set @OriginalTransDirection = '上存'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--==================================================================
		
		--到期日本金
		set @OriginalTransDirection = '下借'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
	

		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--=========================================================================
		--==========================================================================
		--到期日本金+总利息
		set @AmountType = '本金+总利息'
		set @DateType = '到期日'
		set @OriginalTransDirection = '上存'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================

		--==================================================================
		
		--到期日本金+总利息
		set @OriginalTransDirection = '下借'

		;with T 
			(
				[TransType]
				  ,[AmountType]
				  ,[DateType]
				  ,[OriginalTransDirection]
				  ,[AccountingRowNum]
				  ,[Accounting]
				  ,[DCParty]
				  ,[OriginalTransParty]
				  ,[Remark]
			)
		as
		(
			SELECT
				[TransType]
				,[AmountType]
				,[DateType]
				,[OriginalTransDirection]
				,[AccountingRowNum]
				,[Accounting]
				,[DCParty]
				,[OriginalTransParty]
				,[Remark]
			FROM
				[TransAccountingRules]
			where
				TransType = @TransType
				and AmountType = @AmountType 
				and DateType = @DateType
				and OriginalTransDirection = @OriginalTransDirection
		)
	

		INSERT INTO [DailyLedgerResultProcessing]
           (
			   [LedgerDate]
			   ,[BankID]
			   ,[CurrencyType]
			   ,[Accounting]
			   ,[DebtorBalance]
			   ,[CreditorBalance]
			)
		select
			@today as [LedgerDate]
			, a.BankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [CreditorBalance]
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '发起'
			and [status] = 10
		group by
			a.BankID
			, a.CurrencyType
			, T.Accounting
		union all
		select
			@today as [LedgerDate]
			, a.AgainstBankID
			, a.CurrencyType
			, T.Accounting
			,
				sum
					(
						case
							when
								T.[DCParty] = 'dr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [DebtorBalance]
			,
				sum
					(
						case
							when
								T.[DCParty] = 'cr'
									then a.Amount + a.SumInterest
							else
								0
						end
					)
				as [CreditorBalance]
												
		from
			Transactions a
			, T
		where
			endDate = @today			--到期日交易
			and TransType3 = @OriginalTransDirection
			and AmountType = @AmountType 
			and T.OriginalTransParty = '对手'
			and [status] = 10
		group by
			a.AgainstBankID
			, a.CurrencyType
			, T.Accounting			
		--=========================================================================


		select
			[LedgerDate]
			,[BankID]
			,[CurrencyType]
			,[Accounting]
			,sum([DebtorBalance]) as [DebtorBalance]
			,sum([CreditorBalance]) as [CreditorBalance]
		from
			[DailyLedgerResultProcessing]
		group by
			[LedgerDate]
			,[BankID]
			,[CurrencyType]
			,[Accounting]
		order by
			[LedgerDate]
			,[BankID]
			,[CurrencyType]
			,[Accounting]

		--*/

	commit transaction
end
#T=Cached Plan DMV 缓存执行计划
--Demo Script

set showplan_all off
set statistics profile off

--select distinct(SalesOrderID) from Sales.SalesOrderDetail

--select * from person.Address
--where StateProvinceID = 1

dbcc freeproccache()

SELECT [cp].[refcounts] 
, [cp].[usecounts] 
, [cp].[objtype] 
, [st].[dbid] 
, [st].[objectid] 
, [st].[text] 
, [qp].[query_plan] 
FROM sys.dm_exec_cached_plans cp 
CROSS APPLY sys.dm_exec_sql_text ( cp.plan_handle ) st 
CROSS APPLY sys.dm_exec_query_plan ( cp.plan_handle ) qp ;
#T=cdc 变更捕获
--步骤：本文中以GPOSDB为例
--第一步、对目标库显式启用CDC：
--在当前库使用sys.sp_cdc_enable_db。返回0（成功）或1（失败）。
--注意，无法对系统数据库和分发数据库启用该功能。且执行者需要用sysadmin角色权限。
--该存储过程的作用域是整个目标库。包含元数据、DDL触发器、cdc架构和cdc用户。
--使用以下代码启用：
USE GPOSDB  --要启用CDC的数据库
GO
EXECUTE sys.sp_cdc_enable_db;
GO
--在一开始直接执行时，出现了报错信息：
--消息22830，级别16，状态1，过程sp_cdc_enable_db_internal，第193 行
--无法更新元数据来指示已对数据库AdventureWorks 启用了变更数据捕获。
--执行命令'SetCDCTracked(Value = 1)' 时失败。
--返回的错误为15517: '无法作为数据库主体执行，因为主体"dbo"
--不存在、无法模拟这种类型的主体，或您没有所需的权限。'。请使用此操作和错误来确定失败的原因并重新提交请求。
--这里引出了另外一个知识点：错误号 15517 的错误
--这种错误会在很多地方出现，如还原数据库的时候也会有可能出现。
--共同点是：某个/些存储过程使用了具有WITHEXECUTE AS 的选项。
--使其在当前库具有了某个架构，但是当在别的地方执行时，由于没有这个架构，所以就报错，解决方法：
ALTER AUTHORIZATION ON DATABASE::[GPOSDB] TO [sa]
--经过检查，uspUpdateEmployeeHireInfo这个存储过程的确有：WITH EXECUTE AS CALLER
--使用sa的原因是即使sa被禁用，sa还是存在的。所以不会报错。
--现在重新执行：
USE GPOSDB
GO
EXECUTE sys.sp_cdc_enable_db;
GO
--启用成功，然后通过以下语句检查是否成功：
SELECT 
is_cdc_enabled,
CASE WHEN is_cdc_enabled=0 THEN 'CDC功能禁用' ELSE 'CDC功能启用' END 描述
FROM    sys.databases
WHERE   NAME = 'GPOSDB'
--创建成功后，将自动添加CDC用户和CDC架构。
--在用户和架构下面可以看到cdc用户和cdc架构
--创建这两个用户、架构的原因是因为CDC要求独占方式使用这两个架构，所以要单独创建。
--如果存在了非CDC功能创建的CDC用户、架构的话，则需要先删除该cdc命名的架构，才能开启。
--第二步、对目标表启用CDC：
--使用db_owner角色的成员执行sys.sp_cdc_enable_table为每个需要跟踪的表创建捕获实例。
--然后通过sys.tables目录视图中的is_tracked_by_cdc列来判断是否创建成功。
--默认情况下会对表的全部列做捕获。如果只需要对某些列做捕获，
--可以使用@captured_column_list参数指定这些列。
--如果要把更改表放到文件组里的话，最好创建单独的文件组（最起码与源表独立）。
--如果不想控制访问角色，则@role_name必须显式设置为null。
sys.sp_cdc_enable_table
    [ @source_schema = ] 'source_schema',
    [ @source_name = ] 'source_name' ,
    [ @role_name = ] 'role_name'
    [,[ @capture_instance = ] 'capture_instance' ]
    [,[ @supports_net_changes = ] supports_net_changes ]
    [,[ @index_name = ] 'index_name' ]
    [,[ @captured_column_list = ] 'captured_column_list' ]
    [,[ @filegroup_name = ] 'filegroup_name' ]
  [,[ @partition_switch = ] 'partition_switch' ]
--例子：
--把SYSTEMPARA 这个表开启变更捕获。
USE GPOSDB
GO
EXEC sys.sp_cdc_enable_table @source_schema = 'DBO',
    @source_name = 'SYSTEMPARA',@role_name = NULL
--然后查询是否成功：
SELECT  name ,
        is_tracked_by_cdc ,
        CASE WHEN is_tracked_by_cdc = 0 THEN 'CDC功能禁用'
             ELSE 'CDC功能启用'
        END 描述
FROM    sys.tables
WHERE   OBJECT_ID = OBJECT_ID('dbo.systempara')
--对表开启以后，可以在下图中看到多了很多cdc架构开头的表：
--刷新一下GPOSDB数据库，在系统表下面可以看到多了下面几张表
[cdc].[DBO_SYSTEMPARA_CT]
[cdc].[change_tables]
[cdc].[captured_columns]
[cdc].[ddl_history]
[cdc].[index_columns]
[cdc].[lsn_time_mapping]
[dbo].[systranschemas]
[dbo].[dtproperties]
--启动之后，可以看到SQLServer代理里面的作业，也出现了这两个作业：
[cdc.GPOSDB_capture]
[cdc.GPOSDB_cleanup]
--在可编程性-》函数-》表值函数里，也多了两个函数
[cdc].[fn_cdc_get_all_changes_DBO_SYSTEMPARA]
[cdc].[fn_cdc_get_net_changes_DBO_SYSTEMPARA]
--下面列出相关的存储过程：
--Sys.sp_cdc_add_job
--说明及例子
--Sys.sp_cdc_generate_wrapper_function
--说明及例子
--Sys.sp_cdc_change_job
--说明及例子
--Sys.sp_cdc_get_captured_columns
--说明及例子
--Sys.sp_cdc_cleanup_change_table
--说明及例子
--Sys.sp_cdc_get_ddl_history
--说明及例子
--Sys.sp_cdc_disable_db
--说明及例子  建议先禁用表，再禁用库
--Sys.sp_cdc_help_change_data_capture
--说明及例子
--Sys.sp_cdc_disable_table
--说明及例子
--Sys.sp_cdc_help_jobs
--说明及例子
--Sys.sp_cdc_drop_job
--说明及例子
--Sys.sp_cdc_scan
--说明及例子
--Sys.sp_cdc_enable_db
--说明及例子
--Sys.sp_cdc_start_job
--说明及例子
--Sys.sp_cdc_enable_table
--说明及例子
--Sys.sp_cdc_stop_job
--说明及例子
--函数：
--Cdc.fn_cdc_get_all_changes_<capture_instance>
--说明及例子
--Sys.fn_cdc_has_column_changed
--说明及例子
--Cdc.fn_cdc_get_net_changes_<capture_instance>
--说明及例子
--Sys.fn_cdc_increment_lsn
--说明及例子
--Sys.fn_cdc_decrement_lsn
--说明及例子
--Sys.fn_cdc_is_bit_set
--说明及例子
--Sys.fn_cdc_get_column_ordinal
--说明及例子
--Sys.fn_cdc_map_lsn_to_time
--说明及例子
--Sys.fn_cdc_get_max_lsn
--说明及例子
--Sys.fn_cdc_map_time_to_lsn
--说明及例子
--Sys.fn_cdc_get_min_lsn
--说明及例子
--------------------下面开始从头到尾做一个实际案例-------------------------
--下面开始从头到尾做一个实际案例
--步骤一:对目标库显式启用CDC
USE GPOSDB  --要启用CDC的数据库
GO
EXECUTE sys.sp_cdc_enable_db;
GO
--某些数据库可能存在一些存储过程包含有：execute as 等语句，此时会报错：
--文字描述：
--消息22830，级别16，状态1，过程sp_cdc_enable_db_internal，第186 行
--无法更新元数据来指示已对数据库AdventureWorks 启用了变更数据捕获。执行命令'SetCDCTracked(Value = 1)' 时失败。返回的错误为15517: '无法作为数据库主体执行，因为主体"dbo" 不存在、无法模拟这种类型的主体，或您没有所需的权限。'。请使用此操作和错误来确定失败的原因并重新提交请求。
--消息266，级别16，状态2，过程sp_cdc_enable_db_internal，第0 行
--EXECUTE 后的事务计数指示BEGIN 和COMMIT 语句的数目不匹配。上一计数= 0，当前计数= 1。
--消息266，级别16，状态2，过程sp_cdc_enable_db，第0 行
--EXECUTE 后的事务计数指示BEGIN 和COMMIT 语句的数目不匹配。上一计数= 0，当前计数= 1。
--消息3998，级别16，状态1，第1 行
--在批处理结束时检测到不可提交的事务。该事务将回滚。
--如果出现这个错误，目前的解决方法是执行下面语句，原因已在开头说明，对于没有使用EXECUTE AS的库，一般不会有这样的问题：
ALTER AUTHORIZATION ON DATABASE::[GPOSDB] TO [sa]
--现在重新执行：
USE GPOSDB
GO
EXECUTE sys.sp_cdc_enable_db;
GO
--通过以下语句检查是否成功：
SELECT 
is_cdc_enabled,
CASE WHEN is_cdc_enabled=0 THEN 'CDC功能禁用' ELSE 'CDC功能启用' END 描述
FROM    sys.databases
WHERE   NAME = 'GPOSDB'
--步骤二：对表启用CDC
USE GPOSDB
GO
EXEC sys.sp_cdc_enable_table
@source_schema = 'DBO',
@source_name = 'SYSTEMPARA',
@role_name = NULL,
@capture_instance=DEFAULT
GO
--然后查询是否成功：
SELECT  name ,
        is_tracked_by_cdc ,
        CASE WHEN is_tracked_by_cdc = 0 THEN 'CDC功能禁用'
             ELSE 'CDC功能启用'
        END 描述
FROM    sys.tables
WHERE   OBJECT_ID = OBJECT_ID('dbo.systempara')
--可以看到GPOSDB数据库里的系统表里新增了[cdc].[DBO_SYSTEMPARA_CT]表
--步骤三：检验，下面来改动数据
--先查询一下DBO_SYSTEMPARA_CT表
SELECT * FROM cdc.[DBO_SYSTEMPARA_CT]
--可以看到一条记录都没有，因为刚刚创建，并没有对原表systempara做任何增删改操作
--向[SystemPara]表插入一条记录
INSERT INTO [dbo].[SystemPara]
        ( [ParaValue] ,
          [Name] ,
          [Description]
        )
VALUES  ( '中国' , -- ParaValue - varchar(50)
          '中国' , -- Name - varchar(50)
          '中国'  -- Description - varchar(50)
        )
--查询一下DBO_SYSTEMPARA_CT表，可以看到多了一条记录
SELECT * FROM cdc.[DBO_SYSTEMPARA_CT]
--更新[SystemPara]表的一条记录
UPDATE [dbo].[SystemPara] SET [ParaValue]='德国' WHERE [Description]='中国'
--查询一下DBO_SYSTEMPARA_CT表，可以看到多了两条记录
SELECT * FROM cdc.[DBO_SYSTEMPARA_CT]
--删除[SystemPara]表的一条记录
DELETE FROM  [dbo].[SystemPara]  WHERE [Description]='中国'
--查询一下DBO_SYSTEMPARA_CT表，可以看到多了一条记录
SELECT * FROM cdc.[DBO_SYSTEMPARA_CT]
--现在来分析一下DBO_SYSTEMPARA_CT表
--可以在联机丛书上查看：
--cdc.<capture_instance>_CT  
--可以看到，这样命名的表，是用于记录源表做过更改操作的表。
--对于insert/delete操作，会有对应的一行记录，而对于update，会有两行记录。
--对于__$operation列：1 = 删除、2= 插入、3= 更新（旧值）、4= 更新（新值）
--update语句的__$operation列的值是3和4，所以一条update语句对应两条记录
--对于__$start_lsn列：由于更改是来源与数据库的事务日志，所以这里会保存其事务日志的开始序列号（LSN）
--但是微软不检查直接查询这类表，建议使用
--cdc.fn_cdc_get_all_changes_<捕获实例>
--cdc.fn_cdc_get_net_changes_<capture_instance>
-- 来查询
----------------------------------------------------------
--下文开始，来熟悉各种函数、存储过程的使用，并尝试一些不正常的操作。
--日常使用情景：
--1、查询已经开启的捕获实例：
--返回所有表的变更捕获配置信息
USE [GPOSDB]
GO
EXECUTE sys.sp_cdc_help_change_data_capture;
GO
--查看对某个实例(即表)的哪些列做了捕获监控
USE [GPOSDB]
GO
EXEC sys.sp_cdc_get_captured_columns
@capture_instance = 'systempara' -- sysname
--也可以从下面中查找配置信息
SELECT * FROM msdb.dbo.cdc_jobs
--2、查看当前配置使用sp_cdc_help_jobs：
--从上文可以看到，启用cdc之后会自动创建了两个作业，可以先使用以下语句来查看：
sp_cdc_help_jobs
--对于一个大型的OLTP系统，由于数据更改会非常频繁，变更表中的数据会非常多，
--如果存放过久（最久可以存放100年），那对数据库空间是非常大的挑战。
--此时可以调整上图中cdc.AdventureWorks_cleanup 中retention（单位：分钟）。
--3、修改配置：sp_cdc_change_job
--显示原有配置
EXEC sp_cdc_help_jobs
GO
--更改数据保留时间为100分钟
EXECUTE sys.sp_cdc_change_job
    @job_type = N'cleanup',
    @retention=100
GO
--重启一下作业，以使设置生效
--停用作业
EXEC sys.sp_cdc_stop_job N'cleanup'
GO
--启用作业
EXEC sys.sp_cdc_start_job N'cleanup'
GO
--再次查看
EXEC sp_cdc_help_jobs
GO
--可以看到retention（单位：分钟）的值变为100了
--4、停止/启用、删除/创建作业
--停用作业
EXEC sys.sp_cdc_stop_job N'cleanup'
GO
--启用作业
EXEC sys.sp_cdc_start_job N'cleanup'
GO
--删除作业
EXEC sys.sp_cdc_drop_job @job_type = N'cleanup' -- nvarchar(20)
GO
--查看作业
EXEC sys.sp_cdc_help_jobs
GO
--可以看到现在只剩下一个作业了:cdc.GPOSDB_capture
--创建作业
EXEC sys.sp_cdc_add_job
    @job_type = N'cleanup',
    @start_job = 0,
    @retention = 5760
--查看作业
EXEC sys.sp_cdc_help_jobs
GO
--5、DDL变更捕获：
--CDC除了捕获数据变更之外，还能捕获DDL操作的变化。
--前提是先要确保SQLServer 代理的启用，其实CDC功能都需要确保sql 代理正常运行
--因为所有操作都通过代理中的两个作业来实现的。
--现在先来对SYSTEMPARA 表修改一下，把PARAVALUE的长度加长
USE [GPOSDB]
GO
ALTER TABLE  [dbo].[SystemPara] ALTER COLUMN PARAVALUE VARCHAR(120) ;
GO
--然后查询ddl记录表
SELECT  * FROM    cdc.ddl_history
--6、使用CDC的函数来获取更改
--A、使用 [cdc].[fn_cdc_get_all_changes_DBO_SYSTEMPARA]
--函数报告捕获实例的当前所有可用更改
DECLARE @from_lsn BINARY(10) ,
    @to_lsn BINARY(10)
SET @from_lsn = sys.fn_cdc_get_min_lsn('SYSTEMPARA')
SET @to_lsn = sys.fn_cdc_get_max_lsn()
SELECT  *
FROM    cdc.fn_cdc_get_all_changes_DBO_SYSTEMPARA(@from_lsn, @to_lsn,N'all update old');
GO
--B、获取某个时间段的更改信息：
--先根据日志序列号（logsequence number ,LSN）来获取跟踪变更数据
--Sys.fn_cdc_map_time_to_lsn获取变更范围内的最大、最小LSN值。可以使用
Smallest greater than;
smallest greater than orequal;
largest less than;
largest less than or equal;
--如查询某个时间段插入的数据
INSERT INTO [dbo].[SystemPara]
        ( [ParaValue] ,
          [Name] ,
          [Description]
        )
VALUES  ( '中国' , -- ParaValue - varchar(50)
          '中国' , -- Name - varchar(50)
          '中国'  -- Description - varchar(50)
        )
GO
--检查数据
--1删除
--2插入
--3、4更改
--曾经插入过的记录就算delete了也可以查询出来
DECLARE @bglsn VARBINARY(10)= sys.fn_cdc_map_time_to_lsn('smallest greater than or equal',
                                                         '2013-10-21 12:00:00.997')
DECLARE @edlsn VARBINARY(10)= sys.fn_cdc_map_time_to_lsn('largest less than or equal',
                                                         GETDATE())
SELECT  *
FROM    [cdc].[DBO_SYSTEMPARA_CT]
WHERE   [__$operation] = 2
        AND [__$start_lsn] BETWEEN @bglsn AND @edlsn
--C、sys.fn_cdc_map_lsn_to_time 查询变更时间：
SELECT  [__$operation] ,
        CASE [__$operation]
          WHEN 1 THEN '删除'
          WHEN 2 THEN '插入'
          WHEN 3 THEN '更新（捕获的列值是执行更新操作前的值）'
          WHEN 4 THEN '更新（捕获的列值是执行更新操作后的值）'
        END [类型] ,
        sys.fn_cdc_map_lsn_to_time([__$start_lsn]) [更改时间] ,
        *
FROM    [cdc].[DBO_SYSTEMPARA_CT]
--D、获取LSN边界
SELECT  sys.fn_cdc_get_max_lsn() [数据库级别的最大LSN] ,
        sys.fn_cdc_get_min_lsn('cdc.DBO_SYSTEMPARA_CT') [捕获实例的lsn]
这两个值可以用于上面提到的函数里面用于筛选数据之用。
----------------------------------------------------------
--1. CDC的目的是什么？
--CDC就是极大地方便了我们获取某个表数据更新情况的一个机制。它通过一个独立的进程，
--异步读取日志文件，而不是触发器的方式工作。而且它的数据是会持久化保存到一个系统表的。
--2. CDC是不是SQL Server 2008特有的功能，对别的数据库或者早期版本是否起作用？
--CDC是SQL Server 2008特有的功能，而且是企业版特有的功能。开发版也有该功能，但仅用于测试场合。
--3. CDC读取日志，那么如果日志被截断了会怎么样？
--如果某部分日志，CDC的进程还没有读取，那么在截断日志时就会忽略这个部分,不能截断!!
--捕获进程是一个独立的，它随着代理服务启动而启动。两次扫描之间间隔5分钟。
--4. 系统表中的数据是否会永久存在？
--不会，它会被保留3天。会有一个清理的作业，每天晚上2点进行扫描。
--最后，补充一点的是，CDC功能依赖Agent服务，因为它有两个操作都是通过作业来启动的。
#T=CPU Bottlenecks
--CPU Bottlenecks
select top 50 
	sum(qs.total_worker_time) as total_cpu_time, 
	sum(qs.execution_count) as total_execution_count,
	count(*) as  number_of_statements, 
	qs.plan_handle 
from 
	sys.dm_exec_query_stats qs
group by qs.plan_handle
order by sum(qs.total_worker_time) desc

#T=cursor 游标更新
DECLARE @sum INT = 0
DECLARE @ INT = 0
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRANSACTION
	DECLARE var_cursor CURSOR
		LOCAL
		FORWARD_ONLY
		DYNAMIC
		SCROLL_LOCKS
	FOR
		SELECT
			[成绩]
		FROM
			T WITH(ROWLOCK,UPDLOCK)
		ORDER BY
			ID DESC
		FOR UPDATE OF
			[成绩]
	OPEN
		var_cursor
	FETCH NEXT FROM
		var_cursor
	INTO
		@
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@ != 0)
		BEGIN
			UPDATE
				T
			SET
				成绩 = -1 * 成绩
				, @sum += 成绩
			WHERE CURRENT OF
				var_cursor
		END
		PRINT @sum
		FETCH NEXT FROM
			var_cursor
		INTO
			@
	END
	CLOSE var_cursor
	DEALLOCATE var_cursor
COMMIT TRANSACTION
SET XACT_ABORT OFF
SET NOCOUNT OFF
SELECT @sum
SELECT *
FROM T
ORDER BY ID DESC
#T=Date And Time
DECLARE @Now DATETIME = GetDate()
DECLARE @TodayDate DATE = @Now
DECLARE @TodayDateTime DATETIME = @TodayDate
DECLARE @NowTime TIME = @Now
DECLARE @NowDateTime DATETIME = @NowTime

SELECT
	@Now							as [@Now]
	,@TodayDate						as [@TodayDate]
	,@TodayDateTime					as [@TodayDateTime]
	,@NowTime						as [@NowTime]
	,@NowDateTime					as [@NowDateTime]
	,@TodayDateTime + @NowDateTime	as [@TodayDateTime + @NowDateTime]
where
	@TodayDate = @TodayDateTime
#T=DBCC 大全
SQLSERVER DBCC命令大全
DBCC DROPCLEANBUFFERS:从缓冲池中删除所有缓存，清除缓冲区
在进行测试时，使用这个命令可以从SQLSERVER的数据缓存data cache(buffer)清除所有的测试数据，以保证测试的公正性。
需要注意的是这个命令只移走干净的缓存，不移走脏缓存。由于这个原因，在执行这个命令前，应该先执行CheckPoint，将所有脏的缓存写入磁盘，
这样在运行DBCC RROPCLEANBUFFERS 时，可以保证所有的数据缓存被清理，而不是其中的一部分。

DBCC CacheStats:显示存在于当前buffer Cache中的对象的信息，例如：hit rates，编译的对象和执行计划

DBCC ErrorLog :如果很少重启mssqlserver服务，那么服务器的日志(不是数据库事务日志)会增长得很快，而且打开和查看日志的速度也会很慢
使用这个命令，可以截断当前的服务器日志，主要是生成一个新的日志。可以考虑设置一个调度任务，每周执行这个命令自动截断服务器日志。
使用存储过程sp_cycle_errorlog也可以达到同样的目的

一、DBCC 帮助类命令
DBCC HELP('?') ：查询所有的DBCC命令
DBCC HELP('命令') ：查询指定的DBCC命令的语法说明
DBCC USEROPTIONS ：返回当前连接的活动(设置)的SET选项

二、DBCC 检查验证类命令
DBCC CHECKALLOG ('数据库名称') ：检查指定数据库的磁盘空间分配结构的一致性
DBCC CHECKCATALOG ('数据库名称') ：检查指定数据库的系统表内和系统表间的一致性
DBCC CHECKCONSTAINTS ('tablename') ：检查指定表上的指定约束或所有约束的完整性
DBCC CHECKDB ：检查数据库中的所有对象的分配和结构完整性
DBCC CHECKFILEGROUP ：检查指定文件组中所有表在当前数据库中的分配和结构完整性
DBCC CHECKTABLE ：检查指定表或索引视图的数据、索引及test、ntest和image页的完整性
DBCC CHECKIDENT ：如果存在大量数据删除，考虑在删除后，使用 dbcc checkident 重置一下自增值
http://social.msdn.microsoft.com/Forums/zh-CN/sqlserverzhchs/thread/8fa3e3a8-2ff2-4a68-be3e-92e76c380ef9/
检查指定的当前标识值
DBCC SQLPERF(UMSSTATS)：最关键的一个参考数据num runnable：表明当前有多少个线程再等待运行，如果大于等于2,考虑CPU达到瓶颈
Scheduler ID:当前机器有多少个逻辑CPU就有多少个Scheduler ID，具体怎麽看可以看一下我的这篇文章
SQLSERVER独特的任务调度算法"SQLOS"

三、DBCC 维护类命令
DBCC CLEANTABLE ('db_name','table_name') ：回收Alter table drop column语句删除可变长度列或text
DBCC DBREINDEX ：重建指定数据库的一个或多个索引 跟ALTER INDEX REBUILD差不多
DBCC INDEXDEFRAG：对表或视图上的索引和非聚集索引进行碎片整理
DBCC PINTABLE (db_id,object_id) ：将表数据驻留在内存中
查看哪些表驻留在内存的方法是：0：没有驻留 ，1：驻留
1 USE [GPOSDB]
2 GO
3 SELECT  OBJECTPROPERTY(OBJECT_ID('dbo.SystemPara'), 'tableispinned')

DBCC UNPINTABLE (db_id,object_id) ：撤消驻留在内存中的表
DBCC SHRINKDATABASE(db_id,int) ：收缩指定数据库的数据文件和日志文件大小
DBCC SHRINKFILE(file_name,int)：收缩相关数据库的指定数据文件和日志文件大小


四、DBCC 性能调节命令
DBCC dllname(FREE) ：在内存中卸载指定的扩展过程动态链接库（dll)
sp_helpextendedproc 查看加载的扩展PROC
DBCC DROPCLEANBUFFERS ：从缓冲池中删除所有缓冲区
DBCC FREEPROCCACHE ：从执行计划缓冲区删除所有缓存的执行计划
DBCC INPUTBUFFER ：显示从客户机发送到服务器的最后一个语句
DBCC OPENTRAN (db_name) ：查询某个数据库执行时间最久的事务，由哪个程序拥有
DBCC SHOW_STATISTICS ：显示指定表上的指定目标的当前统计信息分布
DBCC SHOWCONTIG ：显示指定表的数据和索引的碎片信息
DBCC SQLPERF (logspace) ：查看各个DB的日志情况
(iostats) 查看IO情况
(threads) 查看线程消耗情况
返回多种有用的统计信息
DBCC CACHESTATS ：显示SQL Server 2000内存的统计信息
DBCC CURSORSTATS ：显示SQL Server 2000游标的统计信息
DBCC MEMORYSTATS ：显示SQL Server 2000内存是如何细分的
DBCC SQLMGRSTATS ：显示缓冲区中先读和预读准备的SQL语句

五、DBCC 未公开的命令
DBCC ERRLOG ：初始化SQL Server 2000的错误日志文件
DBCC FLUSHPROCINDB (db_id) ：清除SQL Server 2005服务器内存中的某个数据库的存储过程缓存内容
DBCC BUFFER (db_name,object_name,int(缓冲区个数)) ：显示缓冲区的头部信息和页面信息
DBCC DBINFO (db_name) ：显示数据库的结构信息
DBCC DBTABLE ：显示管理数据的表(数据字典)信息
DBCC IND (db_name,table_name,index_id) ：查看某个索引使用的页面信息
DBCC REBUILDLOG ：重建SQL Server 2000事务日志文件
DBCC LOG (db_name,3) (-1~4) ：查看某个数据库的事物日志信息 显示格式可以为：-1，0，1，2，3，4 每个数字代表不同的格式
DBCC PAGE ：查看某个数据库数据页面信息
DBCC PROCBUF ：显示过程缓冲池中的缓冲区头和存储过程头
DBCC PRTIPAGE ：查看某个索引页面的每行指向的页面号
DBCC PSS (user,spid,1) ：显示当前连接到SQL Server 2000服务器的进程信息
DBCC RESOURCE ：显示服务器当前使用的资源情况
DBCC TAB (db_id,object_id) ：显示数据页面的结构

六、DBCC跟踪标记
跟踪标记用于临时设置服务器的特定特征或关闭特定行为，常用于诊断性能问题或调试存储过程或复杂的系统
DBCC TRACEON (3604) ：打开跟踪标记
DBCC TRACEOFF ：关闭跟踪标记
DBCC TRACESTATS ：查看跟踪标记状态


七、官方使用DBCC的建议
1、在系统使用率较低时运行 CHECKDB。
2、请确保未同时执行其它磁盘 I/O 操作，例如磁盘备份。
3、将 tempdb 放到单独的磁盘系统或快速磁盘子系统中。
4、允许 tempdb 在驱动器上有足够的扩展空间。 使用带有 ESTIMATE ONLY 的 DBCC 估计 tempdb 将需要多少空间。
5、避免运行占用大量 CPU 的查询或批处理作业。
6、在 DBCC 命令运行时，减少活动事务。
7、使用 NO_INFOMSGS 选项减少一些信息的输出。
8、考虑使用带有 PHYSICAL_ONLY 选项的 DBCC CHECKDB 来检查页和记录的物理结构。
PHYSICAL_ONLY 选项：只检查物理错误，不检查逻辑错误
物理错误比逻辑出更严重，因为物理错误一般SQLSERVER都不能修复的，而逻辑错误大部分SQLSERVER都可以修复
#T=DMV
SELECT
	TOP 10
	DatabaseName = DB_NAME(qt.dbid)
	,[Total Logical Reads] = SUM(total_logical_reads)
	,[Total Physical Reads] = SUM(total_physical_reads)
	,[Total Writes] = SUM(total_logical_writes)
	,[Total Duration] = SUM(qs.total_elapsed_time)
	,[Total  CPU] = SUM(qs.total_worker_time )
	,[Execution count] = SUM(qs.execution_count)
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
WHERE
	qt.dbid is not null
	and qs.last_execution_time >'2008-12-09'
GROUP BY
	DB_NAME(qt.dbid)
ORDER BY
	[Total Logical Reads] DESC;


--服务器等待的原因
SELECT
	TOP 10
	wait_type,
	wait_time_ms / 1000,
	CONVERT(DECIMAL(12,2), wait_time_ms * 100.0 / SUM(wait_time_ms) OVER())
FROM
	sys.dm_os_wait_stats
WHERE
	wait_type NOT LIKE '%SLEEP%'
ORDER BY
	wait_time_ms DESC;

--读
SELECT TOP 10
	SUM(total_logical_reads)
	, SUM(qs.execution_count)
	, DatabaseName = DB_NAME(qt.dbid)
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY
			sys.dm_exec_sql_text(qs.sql_handle) as qt
GROUP BY
	DB_NAME(qt.dbid)
ORDER BY
	1 DESC;

--写
SELECT TOP 10
	SUM(total_logical_writes)
	, SUM(qs.execution_count)
	, DB_NAME(qt.dbid)
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY
			sys.dm_exec_sql_text(qs.sql_handle) as qt
GROUP BY
	DB_NAME(qt.dbid)
ORDER BY
	1 DESC;

--数据库缺失索引
SELECT
	DatabaseName = DB_NAME(database_id)
	,[Number Indexes Missing] = count(*)
FROM
	sys.dm_db_missing_index_details
GROUP BY
	DB_NAME(database_id)
ORDER BY
	2 DESC;

--缺失索引列表信息
SELECT
	DatabaseName = DB_NAME(database_id)
	, *
FROM
	sys.dm_db_missing_index_details
Order  BY
	DB_NAME(database_id)

--高开销的缺失索引
SELECT
	TOP 10
	[Total Cost] = ROUND(avg_total_user_cost * avg_user_impact * (user_seeks + user_scans),0)
	, avg_user_impact
	, TableName = statement
	, [EqualityUsage] = equality_columns
	, [InequalityUsage] = inequality_columns
	, [Include Cloumns] = included_columns
FROM
	sys.dm_db_missing_index_groups g
		INNER JOIN
			sys.dm_db_missing_index_group_stats s
				ON s.group_handle = g.index_group_handle
		INNER JOIN  sys.dm_db_missing_index_details d
				ON d.index_handle = g.index_handle
ORDER BY
		[Total Cost] DESC;
 
--确定开销最高的未使用索引
SELECT
	TOP 10
	[Total Cost] = ROUND(avg_total_user_cost * avg_user_impact * (user_seeks + user_scans),0)
	, avg_user_impact
	, TableName = statement
	, [EqualityUsage]=equality_columns
	, [InequalityUsage]=inequality_columns
	, [Include Cloumns] = included_columns
FROM
	sys.dm_db_missing_index_groups g
		INNER JOIN
			sys.dm_db_missing_index_group_stats s
				ON s.group_handle = g.index_group_handle
		INNER JOIN sys.dm_db_missing_index_details d
			ON d.index_handle = g.index_handle
ORDER BY
		[Total Cost] DESC;
 
 
--确定最高开销索引所使用的脚本并显示结果。
-- Create required table structure only.
-- Note: this SQL must be the same as in the Database loop given in the following step.
SELECT TOP 1
	[Maintenance cost] = (user_updates + system_updates)
	,[Retrieval usage] = (user_seeks + user_scans + user_lookups)
	,DatabaseName = DB_NAME()
	,TableName = OBJECT_NAME(s.[object_id])
	,IndexName = i.name
INTO
	#TempMaintenanceCost
FROM
	sys.dm_db_index_usage_stats s
		INNER JOIN
			sys.indexes i
				ON s.[object_id] = i.[object_id]
					AND s.index_id = i.index_id
WHERE
	s.database_id = DB_ID()
	AND OBJECTPROPERTY(s.[object_id], 'IsMsShipped') = 0
	AND (user_updates + system_updates) > 0 -- Only report on active rows.
	AND s.[object_id] = -999 -- Dummy value to get table structure.
	;
-- Loop around all the databases on the server.
EXEC sp_MSForEachDB  'USE [?];
-- Table already exists.
INSERT INTO #TempMaintenanceCost
SELECT TOP 10
[Maintenance cost] = (user_updates + system_updates)
,[Retrieval usage] = (user_seeks + user_scans + user_lookups)
,DatabaseName = DB_NAME()
,TableName = OBJECT_NAME(s.[object_id])
,IndexName = i.name
FROM sys.dm_db_index_usage_stats s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id]
AND s.index_id = i.index_id
WHERE s.database_id = DB_ID()
AND i.name IS NOT NULL  -- Ignore HEAP indexes.
AND OBJECTPROPERTY(s.[object_id], ''IsMsShipped'') = 0
AND (user_updates + system_updates) > 0 -- Only report on active rows.
ORDER BY [Maintenance cost] DESC
;
'
-- Select records.
SELECT TOP 10 * FROM #TempMaintenanceCost
ORDER BY [Maintenance cost] DESC
-- Tidy up.
DROP TABLE #TempMaintenanceCost

--显示索引已被使用的次数，并按“使用率”排序。
-- Create required table structure only.
-- Note: this SQL must be the same as in the Database loop given in the -- following step.
SELECT TOP 1
	[Usage] = (user_seeks + user_scans + user_lookups)
	,DatabaseName = DB_NAME()
	,TableName = OBJECT_NAME(s.[object_id])
	,IndexName = i.name
INTO
	#TempUsage
FROM
	sys.dm_db_index_usage_stats s
		INNER JOIN sys.indexes i
			ON s.[object_id] = i.[object_id]
				AND s.index_id = i.index_id
WHERE
	s.database_id = DB_ID()
	AND OBJECTPROPERTY(s.[object_id], 'IsMsShipped') = 0
	AND (user_seeks + user_scans + user_lookups) > 0
--	Only report on active rows.
	AND s.[object_id] = -999 -- Dummy value to get table structure.
;
-- Loop around all the databases on the server.
EXEC sp_MSForEachDB  'USE [?];
-- Table already exists.
INSERT INTO #TempUsage
SELECT TOP 10
    [Usage] = (user_seeks + user_scans + user_lookups)
    ,DatabaseName = DB_NAME()
    ,TableName = OBJECT_NAME(s.[object_id])
    ,IndexName = i.name
FROM  sys.dm_db_index_usage_stats s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id]
  AND s.index_id = i.index_id
WHERE  s.database_id = DB_ID()
  AND i.name IS NOT NULL  -- Ignore HEAP indexes.
  AND OBJECTPROPERTY(s.[object_id], ''IsMsShipped'') = 0
  AND (user_seeks + user_scans + user_lookups) > 0 -- Only report on active rows.
ORDER BY [Usage] DESC
;
'
-- Select records.
SELECT TOP 10 * FROM #TempUsage ORDER BY [Usage] DESC
-- Tidy up.
DROP TABLE #TempUsage
 
逻辑上最零碎的索引所使用的脚本
-- Create required table structure only.
-- Note: this SQL must be the same as in the Database loop given in the -- following step.
SELECT TOP 1
    DatbaseName = DB_NAME()
    ,TableName = OBJECT_NAME(s.[object_id])
    ,IndexName = i.name
    ,[Fragmentation %] = ROUND(avg_fragmentation_in_percent,2)
INTO #TempFragmentation
FROM sys.dm_db_index_physical_stats(db_id(),null, null, null, null) s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id]
  AND s.index_id = i.index_id
WHERE s.[object_id] = -999 -- Dummy value just to get table structure.
;
-- Loop around all the databases on the server.
EXEC sp_MSForEachDB  'USE [?];
-- Table already exists.
INSERT INTO #TempFragmentation
SELECT TOP 10
    DatbaseName = DB_NAME()
    ,TableName = OBJECT_NAME(s.[object_id])
    ,IndexName = i.name
    ,[Fragmentation %] = ROUND(avg_fragmentation_in_percent,2)
FROM sys.dm_db_index_physical_stats(db_id(),null, null, null, null) s
INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id]
  AND s.index_id = i.index_id
WHERE s.database_id = DB_ID()
   AND i.name IS NOT NULL  -- Ignore HEAP indexes.
  AND OBJECTPROPERTY(s.[object_id], ''IsMsShipped'') = 0
ORDER BY [Fragmentation %] DESC
;
'
-- Select records.
SELECT TOP 10 * FROM #TempFragmentation ORDER BY [Fragmentation %] DESC
-- Tidy up.
DROP TABLE #TempFragmentation
 
--获得IO高的查询
SELECT
	TOP 10
	[Average IO] = (total_logical_reads + total_logical_writes) / qs.execution_count
	,[Total IO] = (total_logical_reads + total_logical_writes)
	,[Execution count] = qs.execution_count
	,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
		(
			CASE
				WHEN qs.statement_end_offset = -1
					THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
				ELSE
					qs.statement_end_offset 
			END
			- qs.statement_start_offset
		) /2
		)
	,[Parent Query] = qt.text
	,DatabaseName = DB_NAME(qt.dbid)
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY
			sys.dm_exec_sql_text(qs.sql_handle) as qt
ORDER BY
	[Average IO] DESC;
 
--获得I/O统计
Select
	wait_type
	, waiting_tasks_count
	, wait_time_ms
from
	sys.dm_os_wait_stats
where
	wait_type like 'PAGEIOLATCH%' order by wait_type

--查询当前I/O锁
select
	DB_NAME(database_id)
	, file_id
	, io_stall
	, io_pending_ms_ticks
	, scheduler_address
from
	sys.dm_io_virtual_file_stats(NULL, NULL) t1
	,sys.dm_io_pending_io_requests as t2
where t1.file_handle = t2.io_handle

--看是那5条语句导致I/O高
select
	top 5
	(total_logical_reads/execution_count) as avg_logical_reads
	, (total_logical_writes/execution_count) as avg_logical_writes
	, (total_physical_reads/execution_count) as avg_phys_reads
	, Execution_count
	, statement_start_offset as stmt_start_offset
	, sql_handle
	, plan_handle
from
	sys.dm_exec_query_stats
order by
	(total_logical_reads + total_logical_writes) Desc
--根据句柄得到语句
select
	text
from
	sys.dm_exec_sql_text(0x03000E00D4AB884E808214016B9A00000100000000000000)
 
--查询可以确定按 CPU 使用率衡量的、开销最高的查询
SELECT
	TOP 10
	[Average CPU used] = total_worker_time / qs.execution_count
	,[Total CPU used] = total_worker_time
	,[Execution count] = qs.execution_count
	,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
     (CASE WHEN qs.statement_end_offset = -1
      THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
     ELSE qs.statement_end_offset END -
qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
ORDER BY [Average CPU used] DESC;

高开销的 CLR 查询
SELECT TOP 10
[Average CLR Time] = total_clr_time / execution_count
,[Total CLR Time] = total_clr_time
,[Execution count] = qs.execution_count
,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
     (CASE WHEN qs.statement_end_offset = -1
      THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
     ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats as qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
WHERE total_clr_time <> 0
ORDER BY [Average CLR Time] DESC;

最常执行的查询
SELECT TOP 10
[Execution count] = execution_count
,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
     (CASE WHEN qs.statement_end_offset = -1
      THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
     ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
ORDER BY [Execution count] DESC;
 
受阻塞影响的查询
SELECT TOP 10
[Average Time Blocked] = (total_elapsed_time - total_worker_time) / qs.execution_count
,[Total Time Blocked] = total_elapsed_time - total_worker_time
,[Execution count] = qs.execution_count
,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
     (CASE WHEN qs.statement_end_offset = -1
      THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
     ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
ORDER BY [Average Time Blocked] DESC;

最低计划重用率
SELECT TOP 100
[Plan usage] = cp.usecounts
,[Individual Query] = SUBSTRING (qt.text,qs.statement_start_offset/2,
     (CASE WHEN qs.statement_end_offset = -1
      THEN LEN(CONVERT(NVARCHAR(MAX),
qt.text)) * 2 ELSE qs.statement_end_offset END -
qs.statement_start_offset)/2)
,[Parent Query] = qt.text
,DatabaseName = DB_NAME(qt.dbid)
,cp.cacheobjtype
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
INNER JOIN sys.dm_exec_cached_plans as cp on qs.plan_handle=cp.plan_handle
WHERE cp.plan_handle=qs.plan_handle
ORDER BY [Plan usage] ASC;
数据库连接情况
SELECT session_id,connect_time,endpoint_id,auth_scheme,num_reads,num_writes,client_net_address,connection_id from sys.dm_exec_connections order by client_net_address
查询优化器信息
select * from sys.dm_exec_query_optimizer_info
当前执行请求
select * from sys.dm_exec_requests
当前执行session
select * from sys.dm_exec_sessions

所有的调度器并产看等待运行的任务数量
select
scheduler_id,
current_tasks_count,
runnable_tasks_count
from
sys.dm_os_schedulers
where
scheduler_id < 255
 
所有的调度器并产看等待运行的任务数量
select
* 
from
sys.dm_os_schedulers
where
scheduler_id < 255
 
整个CPU使用中最占用资源的查询
select top 50
sum(qs.total_worker_time) as total_cpu_time,
sum(qs.execution_count) as total_execution_count,
count(*) as number_of_statements,
qs.plan_handle
from
sys.dm_exec_query_stats qs
group by qs.plan_handle
order by sum(qs.total_worker_time) desc
 

所有的调度器并产看等待运行的任务数量
select
scheduler_id,
current_tasks_count,
runnable_tasks_count
from
sys.dm_os_schedulers
where
scheduler_id < 255
 
所有的调度器并产看等待运行的任务数量
select
* 
from
sys.dm_os_schedulers
where
scheduler_id < 255
 
整个CPU使用中最占用资源的查询
select top 50
sum(qs.total_worker_time) as total_cpu_time,
sum(qs.execution_count) as total_execution_count,
count(*) as number_of_statements,
qs.plan_handle
from
sys.dm_exec_query_stats qs
group by qs.plan_handle
order by sum(qs.total_worker_time) desc
 
得到在给定的时间段内花费在查询优化的时间
select * from sys.dm_exec_query_optimizer_info

重编译次数最多的25个存储过程
select top 25
sql_text.text,
sql_handle,
plan_generation_num,
execution_count,
dbid,
objectid
from
sys.dm_exec_query_stats a
cross apply sys.dm_exec_sql_text(sql_handle) as sql_text
where
plan_generation_num >1
order by plan_generation_num desc

累计使用cpu最多的查询
select
highest_cpu_queries.plan_handle,
highest_cpu_queries.total_worker_time,
q.dbid,
q.objectid,
q.number,
q.encrypted,
q.[text]
from
(select top 50
qs.plan_handle,
qs.total_worker_time
from
sys.dm_exec_query_stats qs
order by qs.total_worker_time desc) as highest_cpu_queries
cross apply sys.dm_exec_sql_text(plan_handle) as q
order by highest_cpu_queries.total_worker_time desc
 
清空统计项的方法
checkpoint 检查点
dbcc freeproccache  释放缓存，小心
dbcc dropcleanbuffers 清空缓存，小心
DBCC SQLPERF ('sys.dm_os_wait_stats', CLEAR); 清空某一项
GO

综合分析:
SELECT  DB_ID(DB.dbid) '数据库名'
      , OBJECT_ID(db.objectid) '对象'
      , QS.creation_time '编译计划的时间'
      , QS.last_execution_time '上次执行计划的时间'
      , QS.execution_count '执行的次数'
      , QS.total_elapsed_time / 1000 '占用的总时间（秒）'
      , QS.total_physical_reads '物理读取总次数'
      , QS.total_worker_time / 1000 'CPU 时间总量（秒）'
      , QS.total_logical_writes '逻辑写入总次数'
      , QS.total_logical_reads N'逻辑读取总次数'
      , QS.total_elapsed_time / 1000 N'总花费时间（秒）'
      , SUBSTRING(ST.text, ( QS.statement_start_offset / 2 ) + 1,
                  ( ( CASE statement_end_offset
                        WHEN -1 THEN DATALENGTH(st.text)
                        ELSE QS.statement_end_offset
                      END - QS.statement_start_offset ) / 2 ) + 1) AS '执行语句',
                     [Parent Query] = st.text
FROM    sys.dm_exec_query_stats AS QS CROSS APPLY 
        sys.dm_exec_sql_text(QS.sql_handle) AS ST INNER JOIN
        ( SELECT    *
          FROM      sys.dm_exec_cached_plans cp CROSS APPLY
                    sys.dm_exec_query_plan(cp.plan_handle)
        ) DB
            ON QS.plan_handle = DB.plan_handle
where   SUBSTRING(st.text, ( qs.statement_start_offset / 2 ) + 1,
                  ( ( CASE statement_end_offset
                        WHEN -1 THEN DATALENGTH(st.text)
                        ELSE qs.statement_end_offset
                      END - qs.statement_start_offset ) / 2 ) + 1) not like '%fetch%'
                      ORDER BY QS.total_elapsed_time / 1000 DESC

#T=DMV duration/IO
--DBCC SQLPERF('sys.dm_exec_query_stats', CLEAR);  --清空某一项
declare @now datetime
set @now = getdate()
declare @minutes int
set @minutes = -10 --分钟
declare @execution_count int
set @execution_count = 10000

SELECT
	TOP 1000
	DatabaseName = DB_NAME(qt.dbid)
	,qs.last_execution_time
	,qs.total_elapsed_time
	,[Average Duration/Execution] = qs.total_elapsed_time * 1.0 / qs.execution_count
	,min_elapsed_time
	,max_elapsed_time
	,qs.total_worker_time
	,total_logical_reads
	,[Average Logical Reads/Execution] = total_logical_reads * 1.0 / qs.execution_count
	,total_physical_reads
	,[Average Physical Reads/Execution] = total_physical_reads * 1.0 / qs.execution_count
	,total_logical_writes
	,[Average Writes/Execution] = total_logical_writes * 1.0 / qs.execution_count
	,[Average CPU/Execution] = qs.total_worker_time * 1.0 / qs.execution_count
	,[Execution count] = qs.execution_count
	,[Individual Query] = SUBSTRING
							(
								qt.text,
								qs.statement_start_offset/2,
								(
									CASE
										WHEN qs.statement_end_offset = -1
											THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
										ELSE
											qs.statement_end_offset 
									END
									- qs.statement_start_offset
								) /2
							)
	,[Parent Query] = qt.text
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
WHERE
	qt.dbid is not null
	and qs.last_execution_time >= dateadd(minute,@minutes,@now)
	and qs.execution_count >= @execution_count
--GROUP BY
	--DB_NAME(qt.dbid)
ORDER BY
	[Average Duration/Execution] DESC
	--, [Average Logical Reads/Execution] desc
#T=DMV Lock / Session
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
SELECT
	COUNT(*)
	, request_session_id
FROM 
	( 
		SELECT
			DB_NAME(resource_database_id) AS DatabaseName 
			, request_session_id 
			, resource_type 
			,
				CASE 
					WHEN
						resource_type = 'OBJECT' 
						THEN
							OBJECT_NAME(resource_associated_entity_id) 
					WHEN
						resource_type IN ('KEY', 'PAGE', 'RID') 
						THEN
							(
								SELECT 
									OBJECT_NAME(OBJECT_ID)
								FROM
									sys.partitions p 
								WHERE
									p.hobt_id = l.resource_associated_entity_id
							) 
				END AS resource_type_name 
			, request_status 
			, request_mode 
		FROM
			sys.dm_tran_locks l 
	) AS T 
GROUP BY
	request_session_id
#T=DMV 人人都是DBA
create procedure zsp_Index_Perf_Helper
as
begin

--找出哪些表的 Index 需要改进
--在指定数据库中查找哪些表的 Index 需要改进
--根据缓存的查询计划判断 SP 是否需要优化
--发现那些 Index 的写远多于读的表 
--查看 Index 的 Statistics 最后更新时间
--查看哪些 Index 被修改的最频繁
--查看 Index 碎片化指数
--哪个 Index 上的读操作最活跃
--哪个 Index 上的写操作最活跃
--查看 Index 所使用的 Buffer 数量
--按照 IO Latch 等待请求对索引进行排行

--找出哪些表的 Index 需要改进
SELECT
	CONVERT(DECIMAL(18, 2), user_seeks * avg_total_user_cost * (avg_user_impact * 0.01)) AS [index_advantage]
	,migs.last_user_seek
	,mid.[statement] AS [Database.Schema.Table]
	,mid.equality_columns
	,mid.inequality_columns
	,mid.included_columns
	,migs.unique_compiles
	,migs.user_seeks
	,migs.avg_total_user_cost
	,migs.avg_user_impact
FROM
	sys.dm_db_missing_index_group_stats AS migs WITH (NOLOCK)
		INNER JOIN
			sys.dm_db_missing_index_groups AS mig WITH (NOLOCK)
				ON
					migs.group_handle = mig.index_group_handle
		INNER JOIN
			sys.dm_db_missing_index_details AS mid WITH (NOLOCK)
				ON
					mig.index_handle = mid.index_handle
ORDER BY
	index_advantage DESC
OPTION (RECOMPILE);


--在指定数据库中查找哪些表的 Index 需要改进
SELECT
	DISTINCT CONVERT(DECIMAL(18, 2), user_seeks * avg_total_user_cost * (avg_user_impact * 0.01)) AS [index_advantage]
	,migs.last_user_seek
	,mid.[statement] AS [Database.Schema.Table]
	,mid.equality_columns
	,mid.inequality_columns
	,mid.included_columns
	,migs.unique_compiles
	,migs.user_seeks
	,migs.avg_total_user_cost
	,migs.avg_user_impact
	,OBJECT_NAME(mid.[object_id]) AS [Table Name]
	,p.rows AS [Table Rows]
FROM
	sys.dm_db_missing_index_group_stats AS migs WITH (NOLOCK)
		INNER JOIN
			sys.dm_db_missing_index_groups AS mig WITH (NOLOCK)
				ON
					migs.group_handle = mig.index_group_handle
		INNER JOIN
			sys.dm_db_missing_index_details AS mid WITH (NOLOCK)
				ON
					mig.index_handle = mid.index_handle
		INNER JOIN
			sys.partitions AS p WITH (NOLOCK)
				ON
					p.[object_id] = mid.[object_id]
WHERE
	mid.database_id = DB_ID()
ORDER BY
	index_advantage DESC
OPTION (RECOMPILE);



--根据缓存的查询计划判断 SP 是否需要优化

SELECT
	TOP (25)
		OBJECT_NAME(objectid) AS [ObjectName]
		,query_plan
		,cp.objtype
		,cp.usecounts
FROM
	sys.dm_exec_cached_plans AS cp WITH (NOLOCK)
		CROSS APPLY
			sys.dm_exec_query_plan(cp.plan_handle) AS qp
WHERE
	CAST(query_plan AS NVARCHAR(MAX)) LIKE N'%MissingIndex%'
	AND dbid = DB_ID()
ORDER BY
	cp.usecounts DESC
OPTION (RECOMPILE);



--按照 IO Latch 等待请求对索引进行排行
SELECT
	OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) AS table_name
	,i.[name] AS index_name
	,page_io_latch_wait_count
	,page_io_latch_wait_in_ms
	,CAST(1. * page_io_latch_wait_in_ms / NULLIF(page_io_latch_wait_count, 0) AS DECIMAL(12, 2)) AS page_io_avg_lock_wait_ms
	,page_latch_wait_count
	,page_latch_wait_in_ms
	,CAST(1. * page_latch_wait_in_ms / NULLIF(page_latch_wait_count, 0) AS DECIMAL(12, 2)) AS page_avg_lock_wait_ms
FROM
	sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) ios
		INNER JOIN
			sys.indexes i
				ON
					i.object_id = ios.object_id
					AND i.index_id = ios.index_id
WHERE
	OBJECTPROPERTY(ios.object_id, 'IsUserTable') = 1
ORDER BY
	3 DESC


--查看 Index 碎片化指数
SELECT
	DB_NAME(ps.database_id) AS [Database Name]
	,OBJECT_NAME(ps.[object_id]) AS [Object Name]
	,i.[name] AS [Index Name]
	,ps.index_id
	,ps.index_type_desc
	,ps.avg_fragmentation_in_percent
	,ps.fragment_count
	,ps.page_count
	,i.fill_factor
	,i.has_filter
	,i.filter_definition
FROM
	sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, N'LIMITED') AS ps
		INNER JOIN sys.indexes AS i WITH (NOLOCK)
			ON
				ps.[object_id] = i.[object_id]
				AND ps.index_id = i.index_id
WHERE
	ps.database_id = DB_ID()
	AND ps.page_count > 2500
ORDER BY
	ps.avg_fragmentation_in_percent DESC
OPTION (RECOMPILE);



--查看 Index 的 Statistics 最后更新时间
SELECT
	SCHEMA_NAME(o.[schema_id]) + N'.' + o.[name] AS [Object Name]
	,o.type_desc AS [Object Type]
	,i.[name] AS [Index Name]
	,STATS_DATE(i.[object_id], i.index_id) AS [Statistics Date]
	,s.auto_created
	,s.no_recompute
	,s.user_created
	,st.row_count
	,st.used_page_count
FROM
	sys.objects AS o WITH (NOLOCK)
		INNER JOIN sys.indexes AS i WITH (NOLOCK)
			ON
				o.[object_id] = i.[object_id]
		INNER JOIN sys.stats AS s WITH (NOLOCK)
			ON
				i.[object_id] = s.[object_id]
				AND i.index_id = s.stats_id
		INNER JOIN
			sys.dm_db_partition_stats AS st WITH (NOLOCK)
				ON
					o.[object_id] = st.[object_id]
					AND i.[index_id] = st.[index_id]
WHERE
	o.[type] IN 
				(
					'U'
					,'V'
				)
	AND st.row_count > 0
ORDER BY
	STATS_DATE(i.[object_id], i.index_id) DESC
OPTION (RECOMPILE);

--索引
--按页编号查看数据表信息
--获取查询 SELECT 语句的执行次数排名
--看看哪些 Ad-hoc Query 在浪费资源
--查看当前处于等待状态的 Task 在等什么
--查询谁在占着 Session 连接
--查询程序占用的 SPID 信息
--查询所有执行 SQL 对应的 sql_handle
--查询最近 60 秒平均执行时间超过 300 毫秒的 SQL 语句
--查询最近 60 秒平均执行时间超过 100 毫秒的非 SELECT 语句
--查询最近 60 秒累计总执行次数大于 1000 次的 SQL 语句
--查询前 10 个可能是性能最差的 SQL 语句
--看看当前哪些查询正在活跃着


--按页编号查看数据表信息

SELECT
	sc.[name] AS [schema]
	,o.[name] AS [table_name]
	,o.type_desc
	,obd.[file_id]
	,obd.page_id
	,obd.page_level
	,obd.row_count
	,obd.free_space_in_bytes
	,obd.is_modified
	,obd.numa_node
FROM
	sys.dm_os_buffer_descriptors AS obd
		JOIN
			sys.allocation_units AS au
				ON
					obd.allocation_unit_id = au.allocation_unit_id
		JOIN
			sys.partitions AS p
				ON
					au.container_id = p.partition_id
		JOIN
			sys.objects AS o
				ON
					p.[object_id] = o.[object_id]
		JOIN
			sys.schemas AS sc
				ON
					o.[schema_id] = sc.[schema_id]
WHERE
	database_id = DB_ID()
	AND o.is_ms_shipped = 0
ORDER BY
	obd.page_id
	, o.[name]


--获取查询 SELECT 语句的执行次数排名
--SQL Server 2012 版本

SELECT
	TOP (100)
		qs.execution_count
		,qs.total_rows
		,qs.last_rows
		,qs.min_rows
		,qs.max_rows
		,qs.last_elapsed_time
		,qs.min_elapsed_time
		,qs.max_elapsed_time
		,total_worker_time
		,total_logical_reads
		,SUBSTRING(qt.[text], qs.statement_start_offset / 2 + 1, (
				CASE 
					WHEN qs.statement_end_offset = - 1
						THEN LEN(CONVERT(NVARCHAR(MAX), qt.[text])) * 2
					ELSE qs.statement_end_offset
					END - qs.statement_start_offset
				) / 2) AS query_text
FROM
	sys.dm_exec_query_stats AS qs WITH (NOLOCK)
		CROSS APPLY
			sys.dm_exec_sql_text(qs.sql_handle) AS qt
ORDER BY
	qs.execution_count DESC
OPTION (RECOMPILE);

--SQL Server 2008 R2 版本
SELECT
	TOP (100)
		qs.execution_count
		,qs.last_elapsed_time
		,qs.min_elapsed_time
		,qs.max_elapsed_time
		,total_worker_time
		,total_logical_reads
		,SUBSTRING(qt.[text], qs.statement_start_offset / 2 + 1, (
				CASE 
					WHEN qs.statement_end_offset = - 1
						THEN LEN(CONVERT(NVARCHAR(MAX), qt.[text])) * 2
					ELSE qs.statement_end_offset
					END - qs.statement_start_offset
				) / 2) AS query_text
FROM
	sys.dm_exec_query_stats AS qs WITH (NOLOCK)
		CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
ORDER BY
	qs.execution_count DESC
OPTION (RECOMPILE);

--看看哪些 Ad-hoc Query 在浪费资源
SELECT
	TOP (50)
		b.[text] AS [QueryText]
		,cp.cacheobjtype
		,cp.objtype
		,cp.size_in_bytes / 1024 AS [Plan Size in KB]
FROM
	sys.dm_exec_cached_plans AS cp WITH (NOLOCK)
		CROSS APPLY
			sys.dm_exec_sql_text(plan_handle) b
WHERE
	cp.cacheobjtype = N'Compiled Plan'
	AND cp.objtype IN
				(
					N'Adhoc'
					,N'Prepared'
				)
	AND cp.usecounts = 1
ORDER BY
	cp.size_in_bytes DESC
OPTION (RECOMPILE);




--查看当前处于等待状态的 Task 在等什么
SELECT
	dm_ws.wait_duration_ms
	,dm_ws.wait_type
	,dm_es.STATUS
	,dm_t.TEXT
	,dm_qp.query_plan
	,dm_ws.session_ID
	,dm_es.cpu_time
	,dm_es.memory_usage
	,dm_es.logical_reads
	,dm_es.total_elapsed_time
	,dm_es.program_name
	,DB_NAME(dm_r.database_id) DatabaseName
	,dm_ws.blocking_session_id
	,dm_r.wait_resource
	,dm_es.login_name
	,dm_r.command
	,dm_r.last_wait_type
FROM
	sys.dm_os_waiting_tasks dm_ws
		INNER JOIN
			sys.dm_exec_requests dm_r
				ON
					dm_ws.session_id = dm_r.session_id
		INNER JOIN
			sys.dm_exec_sessions dm_es
				ON
					dm_es.session_id = dm_r.session_id
		CROSS APPLY
				sys.dm_exec_sql_text(dm_r.sql_handle) dm_t
		CROSS APPLY
				sys.dm_exec_query_plan(dm_r.plan_handle) dm_qp
WHERE
	dm_es.is_user_process = 1;



--查询谁在占着 Session 连接
declare @Table Table
--CREATE TABLE #sp_who2 
(
	SPID INT
	,STATUS VARCHAR(255)
	,LOGIN VARCHAR(255)
	,HostName VARCHAR(255)
	,BlkBy VARCHAR(255)
	,DBName VARCHAR(255)
	,Command VARCHAR(255)
	,CPUTime INT
	,DiskIO INT
	,LastBatch VARCHAR(255)
	,ProgramName VARCHAR(255)
	,SPID2 INT
	,REQUESTID INT
	)

INSERT INTO @Table
EXEC sp_who2

SELECT *
FROM @Table w
--WHERE w.ProgramName = 'xxx'

--DROP TABLE #sp_who2



--查询程序占用的 SPID 信息
SELECT
	spid
	,a.[status]
	,hostname
	,program_name
	,cmd
	,cpu
	,physical_io
	,blocked
	,b.[name]
	,loginame
FROM
	master.dbo.sysprocesses a
		INNER JOIN
			master.dbo.sysdatabases b
				ON
					a.dbid = b.dbid
where
	hostname != ''
ORDER BY
	program_name



--查询所有执行 SQL 对应的 sql_handle

DECLARE @current_sql_handle BINARY (20);
DECLARE @sql_text_list TABLE
	(
		sql_handle BINARY (20)
		,TEXT NVARCHAR(max)
	);

DECLARE sql_handle_cursor CURSOR
FOR
SELECT
	sp.sql_handle
FROM
	sys.sysprocesses sp
WHERE
	sp.sql_handle != 0x0000000000000000000000000000000000000000
	--AND sp.program_name = 'xxxx'
	;

OPEN sql_handle_cursor

FETCH NEXT
FROM sql_handle_cursor
INTO @current_sql_handle

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO @sql_text_list (
		sql_handle
		,TEXT
		)
	SELECT
		@current_sql_handle
		,est.TEXT
	FROM
		sys.dm_exec_query_stats qs
			CROSS APPLY sys.dm_exec_sql_text(@current_sql_handle) est;

	FETCH NEXT
	FROM
		sql_handle_cursor
	INTO
		@current_sql_handle
END

SELECT
	DISTINCT *
FROM
	@sql_text_list tl
WHERE
	tl.TEXT NOT LIKE '%statement_start_offset%';

CLOSE sql_handle_cursor

DEALLOCATE sql_handle_cursor





--查询最近 60 秒平均执行时间超过 300 毫秒的 SQL 语句
declare @last_execution_time_in_SECOND int = -60
declare @avg_execution_elapsed_time_in_MILLISECOND int = 300
SELECT
	SUBSTRING
		(
			st.TEXT
			, (qs.statement_start_offset / 2) + 1
			,
				(
					(
						(
							CASE
								statement_end_offset
									WHEN
										- 1
										THEN
											DATALENGTH(st.TEXT)
									ELSE
										qs.statement_end_offset
							END
						) - qs.statement_start_offset
					) / 2
				)
				+ 1
		) AS statement_text
	,last_execution_time
	,total_elapsed_time / execution_count avg_elapsed_time
	,total_physical_reads
	,total_logical_reads
	,total_logical_writes
	,execution_count
	,total_worker_time
	,total_elapsed_time
	,creation_time
FROM
	sys.dm_exec_query_stats AS qs
		CROSS APPLY
			sys.dm_exec_sql_text(qs.sql_handle) st
WHERE
	last_execution_time > DATEADD
							(
								SECOND
								, @last_execution_time_in_SECOND
									-- -60
								, GETDATE()
							)
	AND st.[TEXT] NOT LIKE '%statement_start_offset%'
	AND total_elapsed_time / execution_count 
			>= @avg_execution_elapsed_time_in_MILLISECOND 
			-- 300
ORDER BY
	last_execution_time DESC;




--查询前 10 个可能是性能最差的 SQL 语句

SELECT
	TOP (10)
	ST.[text] AS 'SQL Statement'
	,qs.last_execution_time AS 'Last Execution Time'
	,
		(
			qs.total_logical_reads
			+ qs.total_physical_reads
			+ qs.total_logical_writes
		) / qs.execution_count AS [Average IO]
	,
		(
			qs.total_worker_time / qs.execution_count
		) / 1000000.0 AS [Average CPU Time (sec)]
	,
		(
			qs.total_elapsed_time / qs.execution_count
		) / 1000000.0 AS [Average Elapsed Time (sec)]
	,qs.execution_count AS "Execution Count"
	,qp.query_plan AS "Query Plan"
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY
			sys.dm_exec_sql_text(qs.plan_handle) st
		CROSS APPLY
			sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY
	total_elapsed_time / execution_count DESC


end
#T=INSERT INTO sql 2000
create procedure Z_SP_GenInsertSQL
(
	@TableName varchar(256)
	, @AllTopClause varchar(1000) = ''
	, @WhereOrderByClause varchar(1000) = '' --'where 1 = 1 order by null'
)
as
begin
/**//*
usage:
Z_SP_GenInsertSQL 'employees','all top 30 PERCENT with ties ','where [LastName] is not null order by employeeid desc'
*/
	declare @sql varchar(8000)
	declare @sqlValues varchar(8000)
	set @sql = ' ''(''' + char(13) + ','
	set @sqlValues = ' values ('''+ char(13) + ','
	select @sqlValues = @sqlValues + cols + ' + '',' + '''' + char(13) + ','
			,@sql = @sql + '''[' + name + '],''' + char(13) + ','
	from
	(
		select
			case
				when xtype in (48,52,56,59,60,62,104,106,108,122,127)
					then 'case when ' + name + ' is null then ''NULL'' else ' + 'cast(' + name + ' as varchar)' + ' end'
				when xtype in (58,61)
					then 'case when ' + name + ' is null then ''NULL'' else ' + ''''''''' + ' + 'cast(' + name + ' as varchar)' + '+''''''''' + ' end'
				when xtype in (167,175)
					then 'case when ' + name + ' is null then ''NULL'' else ' + ''''''''' + ' + 'replace(' + name + ','''''''','''''''''''')' + ' + ''''''''' + ' end'
				when xtype in (231,239)
					then 'case when ' + name + ' is null then ''NULL'' else ' + '''N'''''' + ' + 'replace(' + name + ','''''''','''''''''''')' + ' + ''''''''' + ' end'
				else '''NULL'''
			end as Cols
			,name
		from syscolumns
		where id = object_id(@TableName)
				--and autoval is null --忽略自增整型字段
	) T
	set @sql = 'select ' + @AllTopClause + char(13) + '''INSERT INTO ''' + char(13) + ','
				 + '''['+ @TableName + ']''' + char(13) + ','
				 + left(@sql,len(@sql)-4) + '''' + char(13) + ','')' + left(@sqlValues,len(@sqlValues)-7) + ','')'''
				 + char(13) + 'from [' + @TableName + ']'
				 + char(13) + @WhereOrderByClause
	--select @sql -- select SQL 被截断
	print @sql -- print SQL 是完整正确的
	exec (@sql)
/**//*
select *
from syscolumns	
where id = object_id('test') and autoval is null
*/
end
#T=INSERT INTO SQL 2012
alter procedure Z_SP_GenInsertSQL
(
	@TableName varchar(256)
	, @NeedAutoIdentity bit = 0
	, @AllTopClause varchar(1000) = ''
	, @WhereOrderByClause varchar(1000) = '' --'where 1 = 1 order by null'
)
as
begin
/**//*
usage:
	Z_SP_GenInsertSQL
			'accountingRules'
			,0
			,'all top 30 PERCENT with ties '
			,'where [transtype] is not null order by 1 desc'
*/
	declare @sql varchar(max)
	declare @sqlValues varchar(max)
	set @sql =
				' ''('''
				+ char(13) + char(10)
				+ ','
	set @sqlValues =
				' values ('''
				+ char(13) + char(10)
				+ ','

	;with T
	as
	(
		select
			case
				when
					xtype in (48, 52, 56, 59, 60, 62, 104, 106, 108, 122, 127)
						then
							'case when '
							+ name
							+ ' is null then ''NULL'' else '
							+ 'cast('
							+ name
							+ ' as varchar)'
							+ ' end'
				when
					xtype in (58, 61)
						then
							'case when '
							+ name
							+ ' is null then ''NULL'' else '
							+ ''''''''' + '
							+ 'cast('
							+ name
							+ ' as varchar)'
							+ '+'''''''''
							+ ' end'
				when
					xtype in (167, 175)
						then
							'case when '
							+ name
							+ ' is null then ''NULL'' else '
							+ ''''''''' + '
							+ 'replace('
							+ name
							+ ','''''''','''''''''''')'
							+ ' + '''''''''
							+ ' end'
				when
					xtype in (231, 239)
						then
							'case when '
							+ name
							+ ' is null then ''NULL'' else '
							+ '''N'''''' + '
							+ 'replace('
							+ name
							+ ','''''''','''''''''''')'
							+ ' + '''''''''
							+ ' end'
				else
					'''NULL'''
			end as Cols
			, name
		from
			syscolumns
		where
			id = object_id(@TableName)
			--and autoval is null --忽略自增整型字段
			and
				(
					(@NeedAutoIdentity = 1)
					or
					(
						@NeedAutoIdentity = 0
						and COLUMNPROPERTY(id, name, 'IsIdentity') = 0
					)
				)
	)
	select
			@sqlValues +=
						--@sqlValues
						+ cols
						+ ' + '','
						+ ''''
						+ char(13) + char(10)
						+ ','
			,@sql +=
					--@sql
					+ '''[' + name + '],'''
					+ char(13) + char(10)
					+ ','
	from
		T
	set @sql =
				'select '
					+ @AllTopClause
					+ char(13) + char(10)
					+ '''INSERT INTO '''
					+ char(13) + char(10)
					+ ','
					+ '''['+ @TableName + ']'''
					+ char(13) + char(10)
					+ ','
					+ left(@sql, len(@sql) - 5)
					+ ''''
					+ char(13) + char(10)
					+ ','')'
					+ left(@sqlValues, len(@sqlValues) - 8)
					+ ','')'''
					+ char(13) + char(10)
					+ 'from ['
					+ @TableName
					+ ']'
					+ char(13) + char(10)
					+ @WhereOrderByClause
	--select @sql -- select SQL 被截断
	print @sql -- print SQL 是完整正确的
	exec (@sql)
/**//*
select *
from syscolumns	
where id = object_id('test') and autoval is null
*/
end
#T=IO dmv stat
/*
IO ist still the biggest bottleneck and performance issue for a SQL Server. To get the best performance a good IO hardware strategy is required.
And in the planning you have to consider well where to locate which databases; but how to plan this?

With this Transact-SQL script you can analyse the IO statistics, from total overview down to file level.
Because of the use of CTE (common table expressions) you can easily modify the existing query or create your own statistic queries.
Three samples are already include, just remove the comments for the query of your interest.

Works with SQL Server 2005 and higher versions in all editions.
Requires VIEW SERVER STATE permissions.

Link:
  sys.dm_io_virtual_file_stats http://msdn.microsoft.com/en-US/library/ms190326.aspx
*/

-- Various SQL Server IO Statistics
;WITH 
 IOT AS    -- Total sums of all properties.
   (SELECT SUM(IOS.num_of_reads) AS Reads
          ,SUM(IOS.num_of_bytes_read) BytesRead
          ,SUM(IOS.io_stall_read_ms) AS IoStallReadMs
          ,SUM(IOS.num_of_writes) AS Writes
          ,SUM(IOS.num_of_bytes_written) AS BytesWritten
          ,SUM(IOS.io_stall_write_ms) AS IoStallWritesMs
          ,SUM(IOS.io_stall) AS IoStall
          ,SUM(IOS.size_on_disk_bytes) SizeOnDisk
    FROM sys.dm_io_virtual_file_stats(default, default) AS IOS)
,IOF AS   
   (SELECT DBS.name AS DatabaseName
          ,MF.name AS [FileName]
          ,MF.type_desc AS FileType
          ,SUBSTRING(MF.physical_name, 1, 3) AS Drive
          ,CASE WHEN DBS.name IN ('master', 'model', 'msdb', 'tempdb')
                THEN 1 ELSE 0 END AS IsSystemDB
          ,IOS.*
    FROM sys.dm_io_virtual_file_stats(default, default) AS IOS
         INNER JOIN sys.databases AS DBS
             ON IOS.database_id = DBS.database_id
         INNER JOIN sys.master_files AS MF
             ON IOS.database_id = MF.database_id
                AND IOS.file_id = MF.file_id)
/*
-- Detailed for each file
SELECT IOF.DatabaseName
      ,IOF.FileName
      ,IOF.FileType
      ,CONVERT(numeric(5,2), 100.0 * IOF.num_of_reads / IOT.Reads) AS [Reads%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.num_of_bytes_read / IOT.BytesRead) AS [BytesRead%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.io_stall_read_ms / IOT.IoStallReadMs) AS [IoStallReadMs%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.num_of_writes / IOT.Writes) AS [Writes%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.num_of_bytes_written / IOT.BytesWritten) AS [BytesWritten%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.io_stall_write_ms / IOT.IoStallWritesMs) AS [IoStallWritesMs%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.io_stall / IOT.IoStall) AS [IoStall%]
      ,CONVERT(numeric(5,2), 100.0 * IOF.size_on_disk_bytes / IOT.SizeOnDisk) AS [SizeOnDisk%]
FROM IOF CROSS APPLY IOT
ORDER BY IOF.DatabaseName
        ,IOF.FileType;
*/

/*
-- Overview by file type
SELECT IOF.FileType
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_reads / IOT.Reads)) AS [Reads%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_bytes_read / IOT.BytesRead)) AS [BytesRead%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall_read_ms / IOT.IoStallReadMs)) AS [IoStallReadMs%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_writes / IOT.Writes)) AS [Writes%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_bytes_written / IOT.BytesWritten)) AS [BytesWritten%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall_write_ms / IOT.IoStallWritesMs)) AS [IoStallWritesMs%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall / IOT.IoStall)) AS [IoStall%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.size_on_disk_bytes / IOT.SizeOnDisk)) AS [SizeOnDisk%]
FROM IOF CROSS APPLY IOT
GROUP BY IOF.FileType
ORDER BY IOF.FileType;
*/

-- Overview per drive
SELECT IOF.Drive
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_reads / IOT.Reads)) AS [Reads%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_bytes_read / IOT.BytesRead)) AS [BytesRead%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall_read_ms / IOT.IoStallReadMs)) AS [IoStallReadMs%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_writes / IOT.Writes)) AS [Writes%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.num_of_bytes_written / IOT.BytesWritten)) AS [BytesWritten%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall_write_ms / IOT.IoStallWritesMs)) AS [IoStallWritesMs%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.io_stall / IOT.IoStall)) AS [IoStall%]
      ,CONVERT(numeric(5,2), SUM(100.0 * IOF.size_on_disk_bytes / IOT.SizeOnDisk)) AS [SizeOnDisk%]
FROM IOF CROSS APPLY IOT
GROUP BY IOF.Drive
ORDER BY IOF.Drive;

#T=IP to Long & Long to IP
-- IP 地址转换为数字
CREATE FUNCTION dbo.f_IP2Int
					(
						@ip char(15)
					)
				RETURNS bigint
AS
BEGIN
	DECLARE
		@re bigint
	SET @re = 0
	SELECT
		@re = @re + LEFT(@ip, CHARINDEX('.', @ip + '.') - 1) * ID,
		@ip = STUFF(@ip, 1, CHARINDEX('.', @ip + '.'), '')
	FROM
		(
			SELECT ID = CAST(16777216 as bigint)
			UNION ALL
			SELECT 65536
			UNION ALL
			SELECT 256
			UNION ALL
			SELECT 1
		) A
	ORDER BY
		ID DESC
	RETURN(@re)
END
GO

-- 数字转换为IP地址
CREATE FUNCTION dbo.f_Int2IP
					(
						@IP bigint
					)
				RETURNS varchar(16)
AS
BEGIN
	DECLARE
		@re varchar(16)
	SET @re = ''
	SELECT
		@re = @re + '.' + CAST(@IP / ID as varchar),
		@IP = @IP % ID
	FROM
		(
			SELECT ID = CAST(16777216 as bigint)
			UNION ALL
			SELECT 65536
			UNION ALL 
			SELECT 256
			UNION ALL
			SELECT 1
		) A
	ORDER BY ID DESC
	RETURN
		(
			STUFF(@re, 1, 1, '')
		)
END
#T=j9988 Microshaoft 按自然秒自增号
drop table dbo.num_tb
drop table dbo.tb
create table num_tb(d datetime, id int)
insert num_tb
select '2004-01-01', 1

CREATE TABLE [tb]
(
	[AutoID] [bigint] IDENTITY(1,1) NOT NULL,
	[id] [varchar](20) NULL,
	[name] [varchar](10) NULL,
	[CreateTime] [datetime] default getdate(),
	CONSTRAINT [PK_tb] PRIMARY KEY CLUSTERED 
	(
		[AutoID] ASC
	)
) ON [PRIMARY]


create unique nonclustered index idx_id_tb on tb(id)
go

create trigger tri_tb on tb
INSTEAD OF INSERT
as
begin
	set nocount on
	declare @i int
			--,@id varchar(20)
			,@j int
	select
		@i = count(*)
	from inserted
	begin tran
		declare @now varchar(14), @latest varchar(14)
		update num_tb with(TABLOCKX)
		set 
			@now = replace(replace(replace(convert(varchar(19), getdate(), 120), '-', ''), ' ',''), ':', ''),
			@latest = replace(replace(replace(convert(varchar(19), d, 120), '-', ''), ' ',''), ':', ''),
			id = (
					case
						when  @latest = @now
								then id + @i
						else
								@i
					end
				),
			@j = (
					case
						when @latest = @now
							then id
						else
							0
					end
				),
				d = getdate()
	commit tran
	select *
		into #t
	from inserted
	update #t
	set id = @now
			 + right('000000' + rtrim(@j), 6)
		,@j = @j + 1
	insert tb (id, name)
	select id,name 
	from #t
end
go
--创建表

go


--插入记录测试
declare @i int
set @i=0
while @i< = 1000
begin
	insert into tb(name) values('张三')
	insert into tb(name)
	select '张四' union all
	select '张五' union all
	select '张六' union all
	select '张七' union all
	select '张八' union all
	select '张九' union all
	select '张十'
	set @i = @i + 1
end

select MAX(id),MIN(id),COUNT(*),
MAX(AutoID),MIN(AutoID),MAX(CreateTime),MIN(CreateTime)
from tb
group by LEFT(id, 14)
order by 3 desc


select * from tb a
where exists 
(select 1 from tb where id > a.id and AutoID < a.AutoID)


--truncate table tb
#T=j9988 日期自增号
create table num_tb(d datetime,id int)
insert num_tb select '2004-01-01', 1

create table tb(id varchar(20), name varchar(10))

create clustered index idx_clu_tb on tb(id)
go

create trigger tri_tb on tb
INSTEAD OF INSERT
as
begin
	set nocount on
	declare @i int
			,@id varchar(20)
			,@j int
	select @i = count(*)
	from inserted
	begin tran
		if exists
				(
					select 1
					from num_tb
					where convert(char(8), d, 112) = convert(char(8), getdate(), 112)
				)
		begin
			select @j=id
			from num_tb with(TABLOCKX)
			update num_tb with(TABLOCKX)
			set id=id+@i 
		end
		else
		begin
			update num_tb with(TABLOCKX)
			set d = getdate()
				,id = @i
			set @j=0
		end
	commit tran
	select *
		into #t
	from inserted
	update #t
	set id=convert(varchar(8), getdate(), 112) + right('00000' + rtrim(@j), 5)
		,@j=@j+1
	insert tb
	select * from #t
end
go

alter trigger tri_tb on tb
INSTEAD OF INSERT
as
begin
	set nocount on
	declare @i int
			,@id varchar(20)
			,@j int
	select
		@i=count(*)
	from inserted
	begin tran
		update num_tb with(TABLOCKX)
		set id = (
					case
						when convert(char(8),d,112) = convert(char(8),getdate(),112)
								then id+@i
						else
								@i
					end
				),
			@j = (
					case
						when convert(char(8),d,112) = convert(char(8),getdate(),112)
							then id
						else
							0
					end
				),
				d = getdate()
	commit tran
	select *
		into #t
	from inserted
	update #t
	set id = convert(varchar(8), getdate(), 112) + right('00000' + rtrim(@j), 5)
		,@j = @j + 1
	insert tb
	select *
	from #t
end
go
--创建表

go


--插入记录测试
declare @i int
set @i=0
while @i<=10000
begin
insert into tb(name) values('张三')
insert into tb(name) select '张四'
union all select '张五'
union all select '张六'
union all select '张七'
union all select '张八'
union all select '张九'
union all select '张十'
set @i=@i+1
end
#T=Job Status
alter proc zsp_GetJobRunStatus
@JobName varchar(128)
,@LastStatus varchar(64) = null out 
,@LastStartTime datetime = null out
,@LastStopTime datetime = null out
as
begin
	/*
	declare @LastStatus varchar(64)
			, @LastStartTime datetime
			, @LastStopTime datetime
	exec zsp_GetJobRunStatus
				'job 1'
				, @LastStatus out
				, @LastStartTime out
				, @LastStopTime out

	select
		@LastStatus --out
		, @LastStartTime --out
		, @LastStopTime --out
	*/
	;with T
	as
	(
		SELECT
			jobName		= sj.name 
			,lastStartTime	= sja.start_execution_date 
			,lastStopTime	= sja.stop_execution_date 
			,[lastStatus]		=
							CASE  
								WHEN
									ISNULL(sjh.run_status,-1) = -1
									AND sja.start_execution_date IS NULL
									AND sja.stop_execution_date IS NULL
										THEN
											'Idle' 
								WHEN
									ISNULL(sjh.run_status,-1) = -1
									AND sja.start_execution_date IS NOT NULL
									AND sja.stop_execution_date IS NULL
										THEN
											'Running' 
								WHEN
									ISNULL(sjh.run_status,-1) = 0 
										THEN
											'Failed' 
								WHEN
									ISNULL(sjh.run_status,-1) = 1
										THEN
											'Succeeded' 
								WHEN
									ISNULL(sjh.run_status,-1) = 2
										THEN
											'Retry' 
								WHEN
									ISNULL(sjh.run_status,-1) = 3
										THEN
											'Canceled' 
							END 
		FROM
			MSDB..sysjobs sj 
				JOIN
					MSDB..sysjobactivity sja 
						ON
							sj.job_id = sja.job_id  
				JOIN
					(
						SELECT
							MaxSessionid = MAX(Session_id)
						FROM
							MSDB..syssessions
					) ss 
						ON
							ss.MaxSessionid = sja.session_id 
				LEFT JOIN
					MSDB..sysjobhistory sjh 
						ON
							sjh.instance_id = sja.job_history_id
	)
	select
		@LastStatus = [lastStatus]		--varchar(10) out
		,@LastStartTime = [lastStartTime] --datetime out
		,@LastStopTime = [lastStopTime] --datetime out
	from
		T
	where
		jobName = @JobName
end
#T=Left join on 条件
;with T1
(
	F1
)
as
(
	SELECT
		a
		--,b
	FROM 
		(
			VALUES 
				 (1,'A')
				,(2,'B')
				,(3,'C')
		) AS TT1(a,b)
)
,T2
(
	F1
)
as
(
	select 2
	union all
	select 3
	union all
	select 4
)
select
	*
from
	T1 a
		left join
		--full join
			T2 b
				on
					a.F1 = b.F1
					--and
					--a.F1 = 2
					and
					b.F1 = 2
#T=Lock
--lock
select 
	request_session_id as spid, 
	resource_type as rt,  
	resource_database_id as rdb, 
	(
		case resource_type
			WHEN 'OBJECT'
				then object_name(resource_associated_entity_id)
			WHEN 'DATABASE'
				then ' '
			ELSE
			(
				select object_name(object_id)
				from sys.partitions 
				where hobt_id=resource_associated_entity_id)
		END
	) as objname,
	resource_description as rd,
	request_mode as rm, 
	request_status as rs
from sys.dm_tran_locks

#T=Log file statistics for all databases
-- Log file statistics for all databases
;with OPC
as
(
	SELECT
		RTRIM(SUB.counter_name) AS CounterName 
		,RTRIM(SUB.instance_name) AS DatabaseName 
		,SUB.cntr_value AS CounterValue 
	FROM
		[master].[sys].[dm_os_performance_counters] AS SUB 
	WHERE
		SUB.[object_name] LIKE 'MSSQL$%:Databases%'	   -- To be independed of instance name. 
		AND SUB.counter_name IN
							(
								'Log File(s) Size (KB)' 
								,'Log File(s) Used Size (KB)' 
								,'Percent Log Used' 
								,'Log Growths' 
								,'Log Shrinks' 
								,'Log Truncations'
							) 
)
SELECT
	PVT.DatabaseName 
	,CONVERT(numeric(38, 1), PVT.[Log File(s) Size (KB)] / 1024.0) AS LogFileSizeMB 
	,CONVERT(numeric(38, 1), PVT.[Log File(s) Used Size (KB)] / 1024.0) AS LogFileUsedMB 
	,CONVERT(numeric(38, 1), (PVT.[Log File(s) Size (KB)] 
						- PVT.[Log File(s) Used Size (KB)]) / 1024.0) AS LogFileFreeMB 
	,PVT.[Percent Log Used] AS PercLogUsed 
	,PVT.[Log Growths] AS LogGrowths 
	,PVT.[Log Shrinks] AS LogShrinks 
	,PVT.[Log Truncations] AS LogTrunc 
FROM 
	[OPC]
PIVOT 
	(
		SUM(OPC.CounterValue) 
		FOR OPC.CounterName IN
							(
								[Log File(s) Size (KB)] 
								,[Log File(s) Used Size (KB)] 
								,[Percent Log Used] 
								,[Log Growths] 
								,[Log Shrinks] 
								,[Log Truncations]
							) 
	) AS PVT 
ORDER BY
	PVT.DatabaseName
#T=Memory DMV
use test

--drop table tab7
create table tab7 (c1 int primary key clustered, c2 int, c3 char(2000)) 
go
begin tran
go
declare @i int
set @i = 1
while @i <= 200000
begin
insert into tab7 values (@i, rand() * 200000, replicate('a', 2000))
set @i = @i + 1
end
commit tran
go

select top 100* from tab7

update statistics tab7 with fullscan
go

set statistics time on
set statistics io on
go
 
declare @c1 int, @c2 int, @c3 char(2000)
select @c1 = c1, @c2 = c2, @c3 = c3
from tab7
where c1 < 3057
order by c2
go
declare @c1 int, @c2 int, @c3 char(2000)
select @c1 = c1, @c2 = c2, @c3 = c3
from tab7
where c1 < 3058 -- 3057
order by c2
go

--check
select num_of_reads, num_of_bytes_read,num_of_writes, num_of_bytes_written
from sys.dm_io_virtual_file_stats(db_id('tempdb'), 1)

--use sort wanring in profiler

--View memory used by DMV
while 1=1
begin
declare @c1 int, @c2 int, @c3 char(2000)
select @c1 = c1, @c2 = c2, @c3 = c3
from tab7
where c1 < 3058 -- 3057
order by c2
end

--in another session run below query
select granted_memory_kb, used_memory_kb, max_used_memory_kb
from sys.dm_exec_query_memory_grants
where session_id = 60 


--Tuning 1
sp_configure 'min memory per query (KB)',15000
go
reconfigure
go
--
sp_configure 'min memory per query (KB)',1024
go
reconfigure
go

--Tuning 2
declare @c1 int, @c2 int, @c3 varchar(4500)
select @c1 = c1, @c2 = c2, @c3 = convert(varchar(4500),c3)
from tab7
where c1 < 3058
order by c2




#T=Memory 内存占用 SQL
SELECT
	count(*) * 8.0 /1024/1024 as cached_pages_MB
	,
		CASE
			database_id
				WHEN
					32767
						THEN 'ResourceDb'
				ELSE
					db_name(database_id)
		END AS Database_name
FROM
	sys.dm_os_buffer_descriptors
GROUP BY
	db_name(database_id)
	,database_id
ORDER BY
	cached_pages_MB DESC


SELECT
	count(*)*8 AS cached_pages_kb
	, obj.name
	, obj.index_id
	, b.type_desc
	, b.name
FROM
	sys.dm_os_buffer_descriptors AS bd
		INNER JOIN
			(
				SELECT object_name(object_id) AS name
					,index_id ,allocation_unit_id,object_id
				FROM sys.allocation_units AS au
					INNER JOIN sys.partitions AS p
						ON au.container_id = p.hobt_id
							AND (au.type = 1 OR au.type = 3)
				UNION ALL
				SELECT object_name(object_id) AS name  
					,index_id, allocation_unit_id,object_id
				FROM sys.allocation_units AS au
					INNER JOIN sys.partitions AS p
						ON au.container_id = p.partition_id
							AND au.type = 2
			) AS obj
		ON bd.allocation_unit_id = obj.allocation_unit_id
		LEFT JOIN sys.indexes b on b.object_id = obj.object_id AND b.index_id = obj.index_id
 
WHERE database_id = db_id()
GROUP BY obj.name, obj.index_id ,b.name,b.type_desc
ORDER BY cached_pages_kb DESC


SELECT
	count(*)*8  as cached_pages_kb
	, convert
		(
			varchar(5)
			, convert
				(
					decimal(5,2)
					,
						(
							100-1.0 
							*
							(
								select
									count(*)
								from
									sys.dm_os_buffer_descriptors b 
								where
									b.database_id=a.database_id 
									and is_modified=0
							)
							/count(*) * 100.0
						)
				)
		)+'%' modified_percentage
		,
			CASE database_id span>
				WHEN
					32767
						THEN
							'ResourceDb'
				ELSE
					db_name(database_id)
			END AS Database_name
FROM
	sys.dm_os_buffer_descriptors a
GROUP BY
	db_name(database_id) ,database_id
ORDER BY
	cached_pages_kb DESC;
#T=Mysql日期和时间函数大全
Mysql日期和时间函数大全
对于每个类型拥有的值范围以及并且指定日期何时间值的有效格式的描述见7.3.6 日期和时间类型。 

这里是一个使用日期函数的例子。下面的查询选择了所有记录，其date_col的值是在最后30天以内： 

mysql> SELECT something FROM table 
WHERE TO_DAYS(NOW()) - TO_DAYS(date_col) select DAYOFWEEK('1998-02-03'); 
-> 3 

WEEKDAY(date) 
返回date的星期索引(0=星期一，1=星期二, ……6= 星期天)。 
mysql> select WEEKDAY('1997-10-04 22:23:00'); 
-> 5 
mysql> select WEEKDAY('1997-11-05'); 
-> 2 

DAYOFMONTH(date) 
返回date的月份中日期，在1到31范围内。 
mysql> select DAYOFMONTH('1998-02-03'); 
-> 3 

DAYOFYEAR(date) 
返回date在一年中的日数, 在1到366范围内。 
mysql> select DAYOFYEAR('1998-02-03'); 
-> 34 

MONTH(date) 
返回date的月份，范围1到12。 
mysql> select MONTH('1998-02-03'); 
-> 2 

DAYNAME(date) 
返回date的星期名字。 
mysql> select DAYNAME("1998-02-05"); 
-> 'Thursday' 

MONTHNAME(date) 
返回date的月份名字。 
mysql> select MONTHNAME("1998-02-05"); 
-> 'February' 

QUARTER(date) 
返回date一年中的季度，范围1到4。 
mysql> select QUARTER('98-04-01'); 
-> 2 

WEEK(date) 
　 
WEEK(date,first) 
对于星期天是一周的第一天的地方，有一个单个参数，返回date的周数，范围在0到52。2个参数形式WEEK()允许 
你指定星期是否开始于星期天或星期一。如果第二个参数是0，星期从星期天开始，如果第二个参数是1， 
从星期一开始。 
mysql> select WEEK('1998-02-20'); 
-> 7 
mysql> select WEEK('1998-02-20',0); 
-> 7 
mysql> select WEEK('1998-02-20',1); 
-> 8 

YEAR(date) 
返回date的年份，范围在1000到9999。 
mysql> select YEAR('98-02-03'); 
-> 1998 

HOUR(time) 
返回time的小时，范围是0到23。 
mysql> select HOUR('10:05:03'); 
-> 10 

MINUTE(time) 
返回time的分钟，范围是0到59。 
mysql> select MINUTE('98-02-03 10:05:03'); 
-> 5 

SECOND(time) 
回来time的秒数，范围是0到59。 
mysql> select SECOND('10:05:03'); 
-> 3 

PERIOD_ADD(P,N) 
增加N个月到阶段P（以格式YYMM或YYYYMM)。以格式YYYYMM返回值。注意阶段参数P不是日期值。 
mysql> select PERIOD_ADD(9801,2); 
-> 199803 

PERIOD_DIFF(P1,P2) 
返回在时期P1和P2之间月数，P1和P2应该以格式YYMM或YYYYMM。注意，时期参数P1和P2不是日期值。 
mysql> select PERIOD_DIFF(9802,199703); 
-> 11 

DATE_ADD(date,INTERVAL expr type) 
　 
DATE_SUB(date,INTERVAL expr type) 
　 
ADDDATE(date,INTERVAL expr type) 
　 
SUBDATE(date,INTERVAL expr type) 
这些功能执行日期运算。对于MySQL 3.22，他们是新的。ADDDATE()和SUBDATE()是DATE_ADD()和DATE_SUB()的同义词。 
在MySQL 3.23中，你可以使用+和-而不是DATE_ADD()和DATE_SUB()。（见例子）date是一个指定开始日期的 
DATETIME或DATE值，expr是指定加到开始日期或从开始日期减去的间隔值一个表达式，expr是一个字符串；它可以以 
一个“-”开始表示负间隔。type是一个关键词，指明表达式应该如何被解释。EXTRACT(type FROM date)函数从日期 
中返回“type”间隔。下表显示了type和expr参数怎样被关联： type值 含义 期望的expr格式 
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

MySQL在expr格式中允许任何标点分隔符。表示显示的是建议的分隔符。如果date参数是一个DATE值并且你的计算仅仅 
包含YEAR、MONTH和DAY部分(即，没有时间部分)，结果是一个DATE值。否则结果是一个DATETIME值。 

mysql> SELECT "1997-12-31 23:59:59" + INTERVAL 1 SECOND; 
-> 1998-01-01 00:00:00 
mysql> SELECT INTERVAL 1 DAY + "1997-12-31"; 
-> 1998-01-01 
mysql> SELECT "1998-01-01" - INTERVAL 1 SECOND; 
-> 1997-12-31 23:59:59 
mysql> SELECT DATE_ADD("1997-12-31 23:59:59", 
INTERVAL 1 SECOND); 
-> 1998-01-01 00:00:00 
mysql> SELECT DATE_ADD("1997-12-31 23:59:59", 
INTERVAL 1 DAY); 
-> 1998-01-01 23:59:59 
mysql> SELECT DATE_ADD("1997-12-31 23:59:59", 
INTERVAL "1:1" MINUTE_SECOND); 
-> 1998-01-01 00:01:00 
mysql> SELECT DATE_SUB("1998-01-01 00:00:00", 
INTERVAL "1 1:1:1" DAY_SECOND); 
-> 1997-12-30 22:58:59 
mysql> SELECT DATE_ADD("1998-01-01 00:00:00", 
INTERVAL "-1 10" DAY_HOUR); 
-> 1997-12-30 14:00:00 
mysql> SELECT DATE_SUB("1998-01-02", INTERVAL 31 DAY); 
-> 1997-12-02 
mysql> SELECT EXTRACT(YEAR FROM "1999-07-02"); 
-> 1999 
mysql> SELECT EXTRACT(YEAR_MONTH FROM "1999-07-02 01:02:03"); 
-> 199907 
mysql> SELECT EXTRACT(DAY_MINUTE FROM "1999-07-02 01:02:03"); 
-> 20102 

如果你指定太短的间隔值(不包括type关键词期望的间隔部分)，MySQL假设你省掉了间隔值的最左面部分。例如， 
如果你指定一个type是DAY_SECOND，值expr被希望有天、小时、分钟和秒部分。如果你象"1:10"这样指定值， 
MySQL假设日子和小时部分是丢失的并且值代表分钟和秒。换句话说，"1:10" DAY_SECOND以它等价于"1:10" MINUTE_SECOND 
的方式解释，这对那MySQL解释TIME值表示经过的时间而非作为一天的时间的方式有二义性。如果你使用确实不正确的日期， 
结果是NULL。如果你增加MONTH、YEAR_MONTH或YEAR并且结果日期大于新月份的最大值天数，日子在新月用最大的天调整。 

mysql> select DATE_ADD('1998-01-30', Interval 1 month); 
-> 1998-02-28 

注意，从前面的例子中词INTERVAL和type关键词不是区分大小写的。 
TO_DAYS(date) 
给出一个日期date，返回一个天数(从0年的天数)。 
mysql> select TO_DAYS(950501); 
-> 728779 
mysql> select TO_DAYS('1997-10-07'); 
-> 729669 

TO_DAYS()不打算用于使用格列高里历(1582)出现前的值。 

FROM_DAYS(N) 
给出一个天数N，返回一个DATE值。 
mysql> select FROM_DAYS(729669); 
-> '1997-10-07' 

TO_DAYS()不打算用于使用格列高里历(1582)出现前的值。 

DATE_FORMAT(date,format) 
根据format字符串格式化date值。下列修饰符可以被用在format字符串中： %M 月名字(January……December) 
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
%% 一个文字“%”。 

所有的其他字符不做解释被复制到结果中。 

mysql> select DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y'); 
-> 'Saturday October 1997' 
mysql> select DATE_FORMAT('1997-10-04 22:23:00', '%H:%i:%s'); 
-> '22:23:00' 
mysql> select DATE_FORMAT('1997-10-04 22:23:00', 
'%D %y %a %d %m %b %j'); 
-> '4th 97 Sat 04 10 Oct 277' 
mysql> select DATE_FORMAT('1997-10-04 22:23:00', 
'%H %k %I %r %T %S %w'); 
-> '22 22 10 10:23:00 PM 22:23:00 00 6' 
MySQL3.23中，在格式修饰符字符前需要%。在MySQL更早的版本中，%是可选的。 

TIME_FORMAT(time,format) 
这象上面的DATE_FORMAT()函数一样使用，但是format字符串只能包含处理小时、分钟和秒的那些格式修饰符。 
其他修饰符产生一个NULL值或0。 
CURDATE() 
　 
CURRENT_DATE 
以'YYYY-MM-DD'或YYYYMMDD格式返回今天日期值，取决于函数是在一个字符串还是数字上下文被使用。 
mysql> select CURDATE(); 
-> '1997-12-15' 
mysql> select CURDATE() + 0; 
-> 19971215 

CURTIME() 
　 
CURRENT_TIME 
以'HH:MM:SS'或HHMMSS格式返回当前时间值，取决于函数是在一个字符串还是在数字的上下文被使用。 
mysql> select CURTIME(); 
-> '23:50:26' 
mysql> select CURTIME() + 0; 
-> 235026 

NOW() 
　 
SYSDATE() 
　 
CURRENT_TIMESTAMP 
以'YYYY-MM-DD HH:MM:SS'或YYYYMMDDHHMMSS格式返回当前的日期和时间，取决于函数是在一个字符串还是在数字的 
上下文被使用。 
mysql> select NOW(); 
-> '1997-12-15 23:50:26' 
mysql> select NOW() + 0; 
-> 19971215235026 

UNIX_TIMESTAMP() 
　 
UNIX_TIMESTAMP(date) 
如果没有参数调用，返回一个Unix时间戳记(从'1970-01-01 00:00:00'GMT开始的秒数)。如果UNIX_TIMESTAMP()用一 
个date参数被调用，它返回从'1970-01-01 00:00:00' GMT开始的秒数值。date可以是一个DATE字符串、一个DATETIME 
字符串、一个TIMESTAMP或以YYMMDD或YYYYMMDD格式的本地时间的一个数字。 
mysql> select UNIX_TIMESTAMP(); 
-> 882226357 
mysql> select UNIX_TIMESTAMP('1997-10-04 22:23:00'); 
-> 875996580 

当UNIX_TIMESTAMP被用于一个TIMESTAMP列，函数将直接接受值，没有隐含的“string-to-unix-timestamp”变换。 

FROM_UNIXTIME(unix_timestamp) 
以'YYYY-MM-DD HH:MM:SS'或YYYYMMDDHHMMSS格式返回unix_timestamp参数所表示的值，取决于函数是在一个字符串 
还是或数字上下文中被使用。 
mysql> select FROM_UNIXTIME(875996580); 
-> '1997-10-04 22:23:00' 
mysql> select FROM_UNIXTIME(875996580) + 0; 
-> 19971004222300 

FROM_UNIXTIME(unix_timestamp,format) 
返回表示 Unix 时间标记的一个字符串，根据format字符串格式化。format可以包含与DATE_FORMAT()函数列出的条 
目同样的修饰符。 
mysql> select FROM_UNIXTIME(UNIX_TIMESTAMP(), 
'%Y %D %M %h:%i:%s %x'); 
-> '1997 23rd December 03:43:30 x' 

SEC_TO_TIME(seconds) 
返回seconds参数，变换成小时、分钟和秒，值以'HH:MM:SS'或HHMMSS格式化，取决于函数是在一个字符串还是在数字 
上下文中被使用。 
mysql> select SEC_TO_TIME(2378); 
-> '00:39:38' 
mysql> select SEC_TO_TIME(2378) + 0; 
-> 3938 

TIME_TO_SEC(time) 
返回time参数，转换成秒。 
mysql> select TIME_TO_SEC('22:23:00'); 
-> 80580 
mysql> select TIME_TO_SEC('00:39:38'); 
-> 2378

---------------------------------------------------------------------------------------------------------------------------

mysql日期处理函数

mysql日期处理函数

mysql自己有格式化日期格式的函数，可以在查询语句中使用
DATE_FORMAT(date,format) 
根据format字符串格式化date值。下列修饰符可以被用在format字符串中： %M  月名字(January……December)  
%W  星期名字(Sunday……Saturday)  
%D  有英语前缀的月份的日期(1st, 2nd, 3rd, 等等。） 
%Y  年, 数字, 4 位 
%y  年, 数字, 2 位 
%a  缩写的星期名字(Sun……Sat)  
%d  月份中的天数, 数字(00……31)  
%e  月份中的天数, 数字(0……31)  
%m  月, 数字(01……12)  
%c  月, 数字(1……12)  
%b  缩写的月份名字(Jan……Dec)  
%j  一年中的天数(001……366)  
%H  小时(00……23)  
%k  小时(0……23)  
%h  小时(01……12)  
%I  小时(01……12)  
%l  小时(1……12)  
%i  分钟, 数字(00……59)  
%r  时间,12 小时(hh:mm:ss [AP]M)  
%T  时间,24 小时(hh:mm:ss)  
%S  秒(00……59)  
%s  秒(00……59)  
%p  AM或PM  
%w  一个星期中的天数(0=Sunday ……6=Saturday ） 
%U  星期(0……52), 这里星期天是星期的第一天 
%u  星期(0……52), 这里星期一是星期的第一天 
%%  一个文字“%”。  

如需要用php处理，可先用strtotime函数将日期转换为unix时间戳，再用date函数格式化
#T=Offset Fetch 分页 sql 2012
DECLARE
	@RowNumber int = 1
	, @RowsCountPerPage int = 10;

declare
	@RowsCount bigint = 0

SELECT
	@RowsCount = COUNT(*) 
FROM
	sys.objects

WHILE
	@RowsCount >= @RowNumber
BEGIN
	;with T
		(
			id
			, ROW_NUMBER
			--, [NTILE Page Num]
		)
	as
	(
		SELECT
			--TOP (@RowsCountPerPage)
			object_id
			, ROW_NUMBER() over (order by object_id) as ROW_NUMBER
			--, 
		FROM
			sys.objects
		ORDER BY
			object_id asc
		OFFSET
			@RowNumber - 1 
				ROWS 
		FETCH NEXT
			@RowsCountPerPage
				ROWS ONLY
	)
	,T1 
		(
			ID
			, ROW_NUMBER
			, PageNumber
		)
	as
	(
	select
		TOP (@RowsCountPerPage)
		ID
		, ROW_NUMBER
		, 1 + ROW_NUMBER/@RowsCountPerPage as PageNumber
	from
		T
	)
	select
		*
	from
		T1
	--where
		--PageNumber = 10
	-- Increment @StartingRowNumber value.
	SET @RowNumber = @RowNumber + @RowsCountPerPage
	--CONTINUE
END;

#T=Oracle 11g性能优化攻略
--检查报警日志->性能差的sql->会话满了->阻塞->IO->锁->CPU->FRA闪回恢复区->hanganalyze
--DEFAULT_PERMANENT_TABLESPACE 默认的永久表空间  DEFAULT_TEMP_TABLESPACE 默认的临时表空间
select * from DATABASE_PROPERTIES where property_name IN('DEFAULT_PERMANENT_TABLESPACE','DEFAULT_TEMP_TABLESPACE');
--如何查看当前SQL*PLUS用户的sid和serial#:
select sid, serial#, status from v$session where audsid=userenv('sessionid');
--UNDO表空间的设置
SELECT NAME,VALUE FROM V$PARAMETER WHERE NAME IN('undo_tablespace','undo_management');
--是否使用本地管理及ASM
SELECT TABLESPACE_NAME, EXTENT_MANAGEMENT, SEGMENT_SPACE_MANAGEMENT,BIGFILE FROM DBA_TABLESPACES;
--/*+APPEND */ INSERT/*+APPEND */ INTO TABLE SELECT * FROM
SELECT  /*RECENTSQL */SQL_ID,CHILD_NUMBER,HASH_VALUE,ADDRESS,EXECUTIONS,SQL_TEXT FROM V$SQL WHERE PARSING_USER_ID = (SELECT USER_ID FROM ALL_USERS  WHERE USERNAME = 'ISS') AND COMMAND_TYPE IN (2,3,6,7,189) AND UPPER(SQL_TEXT) NOT LIKE UPPER('%RECENTSQL%');
--虚拟索引虚拟索引的目的，是在不必耗cpu,耗IO以及消耗大量存储空间去实际创建索引的情况，来判断一个索引是否能够对sql优化起到作用。
--CREATE INDEX IDX_NAME TABLE_NAME(COL) NOSEGMENT;
--索引监控
SELECT UA.INDEX_NAME,UA.TABLE_NAME,UA.MONITORING,UA.USED FROM V$OBJECT_USAGE UA WHERE UA.USED='NO' AND UA.TABLE_NAME LIKE 'FM%' ;
SELECT IO.NAME,T.NAME,DECODE(BITAND(I.FLAGS,65535),0,'NO','YES'),DECODE(BITAND(OU.FLAGS,1),0,'NO','YES'),OU.START_MONITORING,OU.END_MONITORING FROM SYS.OBJ$ IO,SYS.OBJ$ T,SYS.IND$ I,SYS.OBJECT_USAGE OU WHERE I.OBJ#=OU.OBJ# AND IO.OBJ#=OU.OBJ# AND T.OBJ#=I.BO#;
--加快索引的创建速度
ALTER INDEX ISS_FM_ALARM_CLEARID REBUILD PARALLEL/*并行*/ NOLOGGING/*少日志*/;
--keep缓冲池(长期占有)、recycle缓冲池(一天用那么一两次且是大对象),查询多少个数据块在缓冲区
SELECT O.OBJECT_NAME, COUNT(*) NUMBER_OF_BLOCKS FROM DBA_OBJECTS O,V$BH V WHERE O.DATA_OBJECT_ID = V.OBJD AND O.OWNER='ISS' GROUP BY O.OBJECT_NAME ORDER BY COUNT(*) DESC;
--统计级别AWR
SHOW PARAMETER STATISTICS_LEVEL;
--保存30=43200分钟,天时间间隔30分钟。
EXEC DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS(RETENTION=>43200，INTERVAL=>30);
EXEC DBMS_WORKLOAD_REPOSITORY.CREATE_BASELINE(START_SNAP_ID=>256,END_SNAP_ID=>288,BASELINE_NAME=>'BASELINE #1');
 
SELECT BASELINE_NAME,START_SNAP_ID, TO_CHAR(START_SNAP_TIME,'YYYY-MM-DD HH24:MI') START_TIME, END_SNAP_ID,TO_CHAR(END_SNAP_TIME,'YYYY-MM-DD HH24:MI') END_TIME,EXPIRATION FROM DAB_HIST_BASELINE ORDER BY BASELINE_ID;
--过去15分钟的等待事件
SELECT ASH.EVENT,SUM(ASH.WAIT_TIME+ASH.TIME_WAITED) TITAL_WAIT FROM V$ACTIVE_SESSION_HISTORY ASH WHERE ASH.SAMPLE_TIME BETWEEN SYSDATE-1/24/4 AND SYSDATE GROUP BY ASH.EVENT ORDER BY 2 DESC;
--那些用户经历了等待
SELECT S.SID,S.USERNAME,SUM(a.WAIT_TIME+a.TIME_WAITED) TOTAL_WAIT_TIME FROM V$ACTIVE_SESSION_HISTORY A,V$SESSION S WHERE A.SAMPLE_TIME BETWEEN SYSDATE-30/2880 AND SYSDATE AND A.SESSION_ID =S.SID GROUP BY S.SID, S.USERNAME ORDER BY TOTAL_WAIT_TIME DESC;
--等待事件最长的sql
SELECT A.USER_ID,U.USERNAME,TO_NCHAR(S.SQL_TEXT),SUM(A.WAIT_TIME+A.TIME_WAITED) TOTAL_WAIT_TIME FROM V$ACTIVE_SESSION_HISTORY A, V$SQLAREA S,DBA_USERS U WHERE A.SAMPLE_TIME BETWEEN SYSDATE-30/2880 AND SYSDATE AND A.SQL_ID=S.SQL_ID AND A.USER_ID=U.USER_ID GROUP BY A.USER_ID,S.SQL_TEXT,U.USERNAME;
--由于锁定所花费的等待时间
SELECT WAIT_CLASS,EVENT,TIME_WAITED/100 TIME_SECS FROM V$SYSTEM_EVENT E WHERE E.WAIT_CLASS<>'Idle' AND TIME_WAITED >0 UNION SELECT 'Time Model',STAT_NAME NAME, ROUND((value/1000000),2) TIME_SECS FROM V$SYS_TIME_MODEL WHERE STAT_NAME NOT IN('background elapsed time','background cpu time') ORDER BY 3 DESC;
 
--过去15分钟使用最多cpu的会话
SELECT * FROM (SELECT S.USERNAME,S.MODULE,S.SID,S.SERIAL#,COUNT(*) FROM V$ACTIVE_SESSION_HISTORY H, V$SESSION S WHERE H.SESSION_ID=S.SID AND H.SESSION_SERIAL#=S.SERIAL# AND SESSION_STATE='ON CPU' AND SAMPLE_TIME > SYSDATE-INTERVAL '15' MINUTE GROUP BY S.USERNAME,S.MODULE,S.SID,S.SERIAL# ORDER BY COUNT(*) DESC );
--查询数据库等待百分比
SELECT METRIC_NAME,VALUE FROM V$SYSMETRIC WHERE METRIC_NAME IN('Database CPU Time Ratio','Database Wait Time Ratio') AND INTSIZE_CSEC=(SELECT MAX(INTSIZE_CSEC) FROM V$SYSMETRIC);
--当前等待情况
SELECT WAIT_CLASS,SUM(TIME_WAITED), SUM(TIME_WAITED)/SUM(TOTAL_WAITS) SUM_WAITS FROM V$SYSTEM_WAIT_CLASS GROUP BY WAIT_CLASS ORDER BY 3 DESC;
--等待事件类型
SELECT WAIT_CLASS,NAME FROM V$EVENT_NAME WHERE NAME LIKE 'enq%' AND WAIT_CLASS <> 'Other' ORDER BY 1 DESC;
--找出是那种等待事件导致总等待事件过长
SELECT A.EVENT,A.TOTAL_WAITS,A.TIME_WAITED,A.AVERAGE_WAIT FROM V$SYSTEM_EVENT A, V$EVENT_NAME B, V$SYSTEM_WAIT_CLASS C WHERE A.EVENT_ID=B.EVENT_ID AND B.WAIT_CLASS#=C.WAIT_CLASS# AND C.WAIT_CLASS IN('Application','Administrative') ORDER BY 3 DESC;
--日志文件commit过多次数多而短
--enq: TM - contention 锁表
SELECT * FROM (SELECT C.TABLE_NAME,CO.COLUMN_NAME,CO.POSITION COLUMN_POSITION FROM USER_CONSTRAINTS C,USER_CONS_COLUMNS CO WHERE C.CONSTRAINT_NAME=CO.CONSTRAINT_NAME AND C.CONSTRAINT_TYPE='R' MINUS SELECT UI.TABLE_NAME,UIC.COLUMN_NAME,UIC.COLUMN_POSITION COLUMN_POSITION FROM USER_INDEXES UI, USER_IND_COLUMNS UIC WHERE UI.INDEX_NAME=UIC.INDEX_NAME ) ORDER BY TABLE_NAME, COLUMN_POSITION;
--深入会话级
SELECT A.SID,A.EVENT,A.TOTAL_WAITS,A.TIME_WAITED,A.AVERAGE_WAIT FROM V$SESSION_EVENT A,V$SESSION B WHERE A.TIME_WAITED >0 AND A.SID=B.SID AND B.USERNAME IS NOT NULL AND A.EVENT='enq: TX - row lock contention' ORDER BY 5 DESC;
--最近被锁住的会话
SELECT TO_CHAR(H.SAMPLE_TIME,'HH24:MI:SS' ) TIME,H.SESSION_ID SID,DECODE(H.SESSION_STATE,'WAITTING',H.EVENT,H.SESSION_STATE ) STATE,H.SQL_ID,H.BLOCKING_SESSION BLOCKER FROM V$ACTIVE_SESSION_HISTORY H,DBA_USERS U WHERE U.USER_ID=H.USER_ID AND H.SAMPLE_TIME=SYSTIMESTAMP-(2/1440);
--引起最多等待的sql
SELECT ASH.USER_ID,U.USERNAME, S.SQL_TEXT,SUM(ASH.WAIT_TIME+ASH.TIME_WAITED ) TTL_WAIT_TIME FROM V$ACTIVE_SESSION_HISTORY ASH,V$SQLAREA S,DBA_USERS U WHERE ASH.SAMPLE_TIME BETWEEN SYSDATE-60/2880 AND SYSDATE AND ASH.SQL_ID=S.SQL_ID AND ASH.USER_ID=U.USER_ID GROUP BY ASH.USER_ID,S.SQL_TEXT,U.USERNAME ORDER BY TTL_WAIT_TIME DESC;
--捕捉运行很久的SQL
select LO.START_TIME,LO.TARGET, username,sid,opname,round(sofar*100 / totalwork,0) || '%' as progress,time_remaining,sql_text from v$session_longops lo, v$sql where time_remaining <> 0 and sql_address=address and sql_hash_value = hash_value;
--某个会话在等待什么
SELECT EVENT,COUNT(*) FROM V$SESSION_WAIT GROUP BY EVENT ORDER BY COUNT(*) DESC;
SELECT EVENT,STATE,SECONDS_IN_WAIT SIW FROM V$SESSION_WAIT W WHERE W.SID='2100';
--监控临时表空间
SELECT * FROM (SELECT A.TABLESPACE_NAME,SUM(A.BYTES/1024/1024) ALLOCATED_MB FROM DBA_TEMP_FILES A WHERE A.TABLESPACE_NAME=UPPER('&&TEMP_TSNAME') GROUP BY A.TABLESPACE_NAME ) X,(SELECT SUM(B1.BYTES_USED/1024/1024 ) USED_MB, SUM(B1.BYTES_FREE/1024/1024 ) FREE_MB FROM V$TEMP_SPACE_HEADER B1 WHERE B1.TABLESPACE_NAME=UPPER('&&TEMP_TSNAME') GROUP BY B1.TABLESPACE_NAME );
--那条sql使用了temp表空间
SELECT S.SID||',',S.SERIAL# SID_SERIAL,S.USERNAME,O.BLOCKS*T.BLOCK_SIZE/1024/1024 MB_USED,O.TABLESPACE,O.SQLADDR,H.HASH_VALUE,H.SQL_TEXT FROM V$SORT_USAGE O, V$SESSION S,V$SQLAREA H,DBA_TABLESPACES T WHERE O.SESSION_ADDR = S.SADDR AND O.SQLADDR=H.ADDRESS(+) AND O.TABLESPACE = T.TABLESPACE_NAME ORDER BY S.SID;
--临时表空间使用率
SELECT S.SID||',',S.SERIAL# SID_SERIAL,S.USERNAME,S.OSUSER,P.SPID,S.MODULE,S.PROGRAM,SUM(O.BLOCKS )*T.BLOCK_SIZE/1024/1024 MB_USED,O.TABLESPACE,COUNT(*) SORTS FROM V$SORT_USAGE O, V$SESSION S,V$PROCESS P,DBA_TABLESPACES T  WHERE O.SESSION_ADDR = S.SADDR AND S.PADDR=P.ADDR AND O.TABLESPACE = T.TABLESPACE_NAME GROUP BY S.SID,S.SERIAL#,S.USERNAME,S.OSUSER,P.SPID,S.MODULE,S.PROGRAM,T.BLOCK_SIZE,O.TABLESPACE ORDER BY S.SID;
--查看一下哪个用户在用临时段:
SELECT sid,serial#,sql_address,machine,program,tablespace,segtype,contents FROM v$session se,v$sort_usage su WHERE se.saddr=su.session_addr;
--查找前十条性能差的sql:
SELECT * FROM (SELECT PARSING_USER_ID, EXECUTIONS,SORTS,COMMAND_TYPE,DISK_READS, sql_text FROM v$sqlarea ORDER BY disk_reads DESC) WHERE ROWNUM<10 ;
--等待时间最多的5个系统等待事件的获取：
select * from (select * from v$system_event where event not like 'SQL%' order by total_waits desc) where rownum<=5;
--如何查看一下某个shared_server正在忙什么:
SELECT a.username,a.machine,a.program,a.sid,a.serial#,a.status,c.piece,c.sql_text FROM v$session a,v$process b,v$sqltext c WHERE b.spid=13161 AND b.addr=a.paddr AND a.sql_address=c.address(+) ORDER BY c.piece;
--数据库共享池性能检查:
Select namespace,gets,gethitratio,pins,pinhitratio,reloads,Invalidations from v$librarycache where namespace in('SQLAREA','TABLE/PROCEDURE','BODY','TRIGGER');
--检查数据字典的命中率:
select 1-sum(getmisses)/sum(gets) "data dictionary hit ratio" from v$rowcache;
--查看耗资源的进程(top session):
select s.schemaname schema_name,decode(sign(48 - command), 1, to_char(command), 'Action Code #' || to_char(command) ) action,status session_status,s.osuser os_user_name,s.sid,p.spid,s.serial# serial_num,nvl(s.username,'[Oracle process]') user_name,s.terminal terminal,s.program program,st.value criteria_value from v$sesstat st,v$session s,v$process p where st.sid = s.sid and st.statistic# = to_number('38') and ('ALL'='ALL' or s.status ='ALL') and p.addr=s.paddr order by st.value desc,p.spid asc,s.username asc,s.osuser asc;
--监控当前数据库谁在运行什么SQL语句:
SELECT osuser, username, sql_text from v$session a, v$sqltext b where a.sql_address =b.address order by address, piece;
--如何查出前台正在发出的sql语句:
select user_name,sql_text from v$open_cursor where sid in(select sid from (select sid,serial# from v$session where status='ACTIVE'));
--查看锁（lock）情况:
select /*+ RULE */ ls.osuser os_user_name, ls.username user_name,decode(ls.type,'RW','Row wait enqueue lock','TM','DML enqueue lock','TX','Transaction enqueue lock','UL','User supplied lock') lock_type,o.object_name object,decode(ls.lmode, 1, null, 2,'Row Share',3,'Row Exclusive',4,'Share',5,'Share Row Exclusive',6,'Exclusive',null)lock_mode,o.owner,ls.sid,ls.serial# serial_num,ls.id1,ls.id2 from sys.dba_objects o,(select s.osuser,s.username,l.type,l.lmode,s.sid,s.serial#,l.id1,l.id2 from v$session s,v$lock l where s.sid=l.sid)ls where o.object_id=ls.id1 and o.owner<>'SYS' order by o.owner, o.object_name;
--查看占io较大的正在运行的session:
SELECT se.sid,se.serial#,pr.SPID,se.username,se.status,se.terminal,se.program, se.MODULE,se.sql_address,st.event,st.p1text,si.physical_reads,si.block_changes FROM v$session se,v$session_wait st,v$sess_io si,v$process pr WHERE st.sid=se.sid AND st.sid=si.sid AND se.PADDR=pr.ADDR AND se.sid>6 AND st.wait_time=0 AND st.event NOT LIKE '%SQL%' ORDER BY physical_reads DESC;
--查看表空间数据文件的读写性能:(注意：如果phyblkrd与phyrds很接近的话，则表明这个表空间中存在全表扫描的表，这些表需要调整索引或优化SQL语句)
Select name,phyrds,phywrts,avgiotim,miniotim,maxiowtm,maxiortm from v$filestat,v$datafile where v$filestat.file#=v$datafile.file#;
Select fs.name name,f.phyrds,f.phyblkrd,f.phywrts,f.phyblkwrt ,f.readtim,f.writetim from v$filestat f, v$datafile fs where f.file# = fs.file# order by fs.name;
--根据sid查看对应连接正在运行的sql
select /*+ PUSH_SUBQ */ command_type,sql_text,sharable_mem, persistent_mem,runtime_mem,sorts,version_count,loaded_versions,open_versions,users_opening,executions, users_executing,loads,first_load_time,invalidations, parse_calls,disk_reads,buffer_gets,rows_processed,sysdate start_time,sysdate finish_time,'>'|| address sql_address,'N' status from v$sqlarea where address = (select sql_address from v$session where sid='&&SID');
--根据pid查看sql语句:
select sql_text from v$sql where address in(select sql_address from v$session where sid in(select sid from v$session where paddr in (select addr from v$process where spid=&pid)));
--根据SID找ORACLE的某个进程:
select pro.spid from v$session ses,v$process pro where ses.sid=&sid and ses.paddr=pro.addr;
--查询表空间的碎片程度:
select tablespace_name,count(tablespace_name) from dba_free_space group by tablespace_name having count(tablespace_name)>10;
--查看排序段的性能:
SELECT name, value FROM v$sysstat WHERE name IN ('sorts (memory)', 'sorts (disk)');
--查看数据库的创建日期和归档方式:
Select Created, Log_Mode, Log_Mode From V$Database;

#T=oracle SQL 常用函数对比
1.绝对值 
S:select abs(-1) value
O:select abs(-1) value from dual

2.取整(大) 
S:select ceiling(-1.001) value 
O:select ceil(-1.001) value from dual

3.取整（小） 
S:select floor(-1.001) value 
O:select floor(-1.001) value from dual

4.取整（截取）
S:select cast(-1.002 as int) value 
O:select trunc(-1.002) value from dual 

5.四舍五入
S:select round(1.23456,4) value 1.23460
O:select round(1.23456,4) value from dual 1.2346

6.e为底的幂 
S:select Exp(1) value 2.7182818284590451 
O:select Exp(1) value from dual 2.71828182

7.取e为底的对数
S:select log(2.7182818284590451) value 1
O:select ln(2.7182818284590451) value from dual; 1

8.取10为底对数
S:select log10(10) value 1
O:select log(10,10) value from dual; 1

9.取平方
S:select SQUARE(4) value 16
O:select power(4,2) value from dual 16

10.取平方根
S:select SQRT(4) value 2
O:select SQRT(4) value from dual 2

11.求任意数为底的幂
S:select power(3,4) value 81
O:select power(3,4) value from dual 81

12.取随机数
S:select rand() value 
O:select sys.dbms_random.value(0,1) value from dual;

13.取符号
S:select sign(-8) value -1
O:select sign(-8) value from dual -1
----------数学函数

14.圆周率
S:SELECT PI() value 3.1415926535897931
O:不知道

15.sin,cos,tan 参数都以弧度为单位
例如：select sin(PI()/2) value 得到1（SQLServer）

16.Asin,Acos,Atan,Atan2 返回弧度

17.弧度角度互换(SQLServer，Oracle不知道)
DEGREES：弧度-〉角度
RADIANS：角度-〉弧度

---------数值间比较

18. 求集合最大值
S:select max(value) value from 
(select 1 value
union
select -2 value
union
select 4 value
union
select 3 value)a

O:select greatest(1,-2,4,3) value from dual

19. 求集合最小值
S:select min(value) value from 
(select 1 value
union
select -2 value
union
select 4 value
union
select 3 value)a

O:select least(1,-2,4,3) value from dual

20.如何处理null值(F2中的null以10代替)
S:select F1,IsNull(F2,10) value from Tbl
O:select F1,nvl(F2,10) value from Tbl
--------数值间比较

21.求字符序号
S:select ascii('a') value
O:select ascii('a') value from dual

22.从序号求字符
S:select char(97) value
O:select chr(97) value from dual

23.连接
S:select '11'+'22'+'33' value
O:select CONCAT('11','22')||33 value from dual

23.子串位置 --返回3
S:select CHARINDEX('s','sdsq',2) value 
O:select INSTR('sdsq','s',2) value from dual

23.模糊子串的位置 --返回2,参数去掉中间%则返回7
S:select patindex('%d%q%','sdsfasdqe') value 
O:oracle没发现，但是instr可以通过第四霾问刂瞥鱿执问?BR>  select INSTR('sdsfasdqe','sd',1,2) value from dual 返回6

24.求子串
S:select substring('abcd',2,2) value 
O:select substr('abcd',2,2) value from dual

25.子串代替 返回aijklmnef
S:SELECT STUFF('abcdef', 2, 3, 'ijklmn') value
O:SELECT Replace('abcdef', 'bcd', 'ijklmn') value from dual

26.子串全部替换
S:没发现
O:select Translate('fasdbfasegas','fa','我' ) value from dual

27.长度
S:len,datalength
O:length

28.大小写转换 lower,upper

29.单词首字母大写
S:没发现
O:select INITCAP('abcd dsaf df') value from dual

30.左补空格（LPAD的第一个参数为空格则同space函数）
S:select space(10)+'abcd' value
O:select LPAD('abcd',14) value from dual

31.右补空格（RPAD的第一个参数为空格则同space函数）
S:select 'abcd'+space(10) value
O:select RPAD('abcd',14) value from dual

32.删除空格
S:ltrim,rtrim
O:ltrim,rtrim,trim

33. 重复字符串
S:select REPLICATE('abcd',2) value 
O:没发现

34.发音相似性比较(这两个单词返回值一样，发音相同)
S:SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe')
O:SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe') from dual
SQLServer中用SELECT DIFFERENCE('Smithers', 'Smythers') 比较soundex的差
返回0-4，4为同音，1最高

--------------日期函数

35.系统时间
S:select getdate() value
O:select sysdate value from dual

36.前后几日
直接与整数相加减

37.求日期
S:select convert(char(10),getdate(),20) value
O:select trunc(sysdate) value from dual
select to_char(sysdate,'yyyy-mm-dd') value from dual

38.求时间
S:select convert(char(8),getdate(),108) value
O:select to_char(sysdate,'hh24:mm:ss') value from dual

39.取日期时间的其他部分
S:DATEPART 和 DATENAME 函数 （第一个参数决定） 
O:to_char函数 第二个参数决定
参数---------------------------------下表需要补充
year yy, yyyy 
quarter qq, q (季度)
month mm, m (m O无效)
dayofyear dy, y (O表星期)
day dd, d (d O无效)
week wk, ww (wk O无效)
weekday dw (O不清楚)
Hour hh,hh12,hh24 (hh12,hh24 S无效)
minute mi, n (n O无效)
second ss, s (s O无效)
millisecond ms (O无效)
----------------------------------------------

40.当月最后一天
S:不知道
O:select LAST_DAY(sysdate) value from dual

41.本星期的某一天（比如星期日）
S:不知道
O:SELECT Next_day(sysdate,7) vaule FROM DUAL;

42.字符串转时间
S:可以直接转或者select cast('2004-09-08'as datetime) value
O:SELECT To_date('2004-01-05 22:09:38','yyyy-mm-dd hh24-mi-ss') vaule FROM DUAL;

43.求两日期某一部分的差（比如秒）
S:select datediff(ss,getdate(),getdate()+12.3) value
O:直接用两个日期相减（比如d1-d2=12.3）
SELECT (d1-d2)*24*60*60 vaule FROM DUAL;

44.根据差值求新的日期（比如分钟）
S:select dateadd(mi,8,getdate()) value
O:SELECT sysdate+8/60/24 vaule FROM DUAL;

45.求不同时区时间
S:不知道
O:SELECT New_time(sysdate,'ydt','gmt' ) vaule FROM DUAL;

-----时区参数,北京在东8区应该是Ydt-------
AST ADT 大西洋标准时间
BST BDT 白令海标准时间
CST CDT 中部标准时间
EST EDT 东部标准时间
GMT 格林尼治标准时间
HST HDT 阿拉斯加—夏威夷标准时间
MST MDT 山区标准时间
NST 纽芬兰标准时间
PST PDT 太平洋标准时间
YST YDT YUKON标准时间
#T=pivot 基金
USE [Funds]
GO
/****** Object:  StoredProcedure [dbo].[zsp_Calc]    Script Date: 2013/11/14 12:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[zsp_Calc]
as
begin
;with T
as
(
	SELECT
		 [净值日期]
		 ,[基金]
		 , min([万份基金单位收益]) as [万份基金单位收益]
		 --, max([七日年化收益率]) as [七日年化收益率]
	FROM 
		[基金收益]
	group by
		[基金]
		,[净值日期]
)
, TT
as
(
select
	TOP
		100 percent
	[净值日期]
	, [工银7天理财A]
	, [余额宝]
	, [招商理财7天A级]
from
	T
PIVOT
(
	avg([万份基金单位收益])
	FOR
		[基金] IN
	(
		[工银7天理财A]
		,[余额宝]
		,[招商理财7天A级]
	)
) AS pvt
order by
	1
)
, TTT
as
(
select
	[基金]
	, max([万份基金单位收益]) as [万份基金单位最大收益]
	, min([万份基金单位收益]) as [万份基金单位最小收益]
	, avg([万份基金单位收益]) as [万份基金单位平均收益]
	, max([七日年化收益率]) as [七日年化最大收益率]
	, min([七日年化收益率]) as [七日年化最小收益率]
	, avg([七日年化收益率]) as [七日年化平均收益率]
from
	[基金收益]
group by
	[基金]
)
select
	*
from
	TT


;with T
as
(
	select
		ROW_NUMBER() over
			(
				order by
					[净值日期]
					,[基金]
					,[万份基金单位收益]
					,[七日年化收益率]
			) as F1
		,[净值日期]
		,[基金]
		,[万份基金单位收益]
		,[七日年化收益率]
	from
		[基金收益]
)
select
	--F1
	--,
	case
		when
			GROUPING(F1) = 1
				then
					getdate()
		else
			max([净值日期])
	end
	,case
		when
			GROUPING(F1) = 1
				then
					'合计'
		else
			max([基金])
	end
	,sum([万份基金单位收益])
	,sum([七日年化收益率]) 
from
	T
group by
	rollup
		(
			F1
		)

end

#T=Restore DataBase SQL
alter procedure zsp_GenRestoreSQL 
@FileName varchar(256)
, @DataBase varchar(256)
, @Type varchar(100) = 'DATABASE'
, @NoRecovery bit = 1
, @StopAt varchar(100) = ''
as
set nocount on
create table #restorefilelistonly
(
	--SQL 2008
	LogicalName varchar(512)
	,PhysicalName varchar(512)
	,Type varchar(512)
	,FileGroupName varchar(512)
	,Size varchar(512)
	,MaxSize varchar(512)
	,FileId varchar(512)
	,CreateLSN varchar(512)
	,DropLSN varchar(512)
	,UniqueId varchar(512)
	,ReadOnlyLSN varchar(512)
	,ReadWriteLSN varchar(512)
	,BackupSizeInBytes varchar(512)
	,SourceBlockSize varchar(512)
	,FileGroupId varchar(512)
	,LogGroupGUID varchar(512)
	,DifferentialBaseLSN varchar(512)
	,DifferentialBaseGUID varchar(512)
	,IsReadOnly varchar(512)
	,IsPresent varchar(512)
	,TDEThumbprint varchar(512)



/* sql 2005
	[LogicalName] varchar(512)
	,[PhysicalName] varchar(512)
	,[Type] varchar(512)
	,[FileGroupName] varchar(512)
	,[Size] varchar(512)
	,[MaxSize] varchar(512)
	,[FileId] varchar(512)
	,[CreateLSN] varchar(512)
	,[DropLSN] varchar(512)
	,[UniqueId] varchar(512)
	,[ReadOnlyLSN] varchar(512)
	,[ReadWriteLSN] varchar(512)
	,[BackupSizeInBytes] varchar(512)
	,[SourceBlockSize] varchar(512)
	,[FileGroupId] varchar(512)
	,[LogGroupGUID] varchar(512)
	,[DifferentialBaseLSN] varchar(512)
	,[DifferentialBaseGUID] varchar(512)
	,[IsReadOnly] varchar(512)
	,[IsPresent] varchar(512)
*/


/* sql 2000
	LogicalName varchar(100)
	,PhysicalName varchar(100)
	,Type varchar(100)
	,FileGroupName varchar(100)
	,[Size] varchar(100)
	,[MaxSize] varchar(100)
*/
)
insert into #restorefilelistonly
execute('restore filelistonly from disk = ''' + @filename + '''')

declare @ varchar(8000)
set @ = 'RESTORE ' + @type + ' [' + @database + '] FROM DISK = ''' + @filename + '''' + char(13) + 'WITH' + char(13) 

select @ = @ + 'MOVE '''+ LogicalName + ''' TO ''' + PhysicalName +  '''' + char(13) + ',' 
from #restorefilelistonly

if (@norecovery = 1)
begin
	set @ = @ +  'NORECOVERY'
end
else
begin
	set @ = @ +  'RECOVERY'
end
if isdate(@stopat) != 0
begin
	set @ = @ +  char(13) + ',STOPAT = ''' + cast(@stopat as varchar)+ ''''
end

drop table #restorefilelistonly
set nocount off
print @ + ',stats'


/*
exec zsp_GenRestoreSQL 'c:\n.full.bak','db_test_Restore'
print ''
exec zsp_GenRestoreSQL 'c:\n.full.bak','db_test_Restore','log',0,'2005-10-25 15:50:00'
*/

#T=RestoreHeaderOnly SQL 2012
--USE [master]
GO
/****** Object:  StoredProcedure [dbo].[zsp_RestoreHeaderOnly]    Script Date: 2014/1/18 13:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[zsp_RestoreHeaderOnly]
--@sql varchar(max)
	@Text   nvarchar(MAX),  --待分拆的字符串
	@Separator nvarchar(8) = ','     --数据分隔符
as
begin
/*
declare @Text nvarchar(max)
set @text = N'
	d:\iFundGlobalCenter.log.1.bak,
	d:\iFundGlobalCenter.log.2.bak,
	d:\iFundGlobalCenter.log.3.bak,
	d:\iFundGlobalCenter.log.4.bak,
	d:\iFundGlobalCenter.ful.5.bak
'
exec zsp_RestoreHeaderOnly @text
*/
declare @sql nvarchar(max) = N''
declare @Table table
(
	id int
	,F nvarchar(256)
)
set @Text = replace(@Text,N' ',N'')
set @Text = replace(@Text,nchar(13),N'')
set @Text = replace(@Text,nchar(10),N'')
set @Text = replace(@Text,nchar(9),N'')
set @Separator = N','
DECLARE @SeparatorLen int
SET @SeparatorLen=LEN(@Separator + N'$') - 2
set @Text = replace(@Text,N' ',N'')
declare @i int
set @i = 1
WHILE CHARINDEX(@Separator,@Text )>0
BEGIN
	declare @v nvarchar(max)
	set @v = (LEFT(@Text ,CHARINDEX(@Separator,@Text )-1))
	INSERT @Table (id,F)
	select @i,@v
	where rtrim(ltrim(@v)) != '' 
			and not exists (select 1 from @Table  where F = @v)
	if @@rowcount > 0
	begin
		set @i = @i + 1
	end
	SET @Text = STUFF(@Text ,1,CHARINDEX(@Separator,@Text )+@SeparatorLen,'')
END
INSERT @Table  (id,F)
select @i,@Text
where rtrim(ltrim(@Text)) != ''
		and not exists (select 1 from @Table where F = @Text)

select
	@sql +=
	N'RESTORE HEADERONLY FROM disk=''' + F + '''' + nchar(13) + nchar(10)
from
	@table
select @sql
declare @ table
(
--CREATE TABLE #T(
	BackupName nvarchar(256) ,
	BackupDescription nvarchar(256) ,
	BackupType int ,
	ExpirationDate datetime ,
	Compressed tinyint ,
	Position int ,
	DeviceType int ,
	UserName nvarchar(256) ,
	ServerName nvarchar(256) ,
	DatabaseName nvarchar(256) ,
	DatabaseVersion int ,
	DatabaseCreationDate datetime ,
	BackupSize numeric(38,0) ,
	FirstLSN numeric(38,0) ,
	LastLSN numeric(38,0) ,
	CheckpointLSN numeric(38,0) ,
	DatabaseBackupLSN numeric(38,0) ,
	BackupStartDate datetime ,
	BackupFinishDate datetime ,
	SortOrder int ,
	[CodePage] int ,
	UnicodeLocaleId int ,
	UnicodeComparisonStyle int ,
	CompatibilityLevel int ,
	SoftwareVendorId int ,
	SoftwareVersionMajor int ,
	SoftwareVersionMinor int ,
	SoftwareVersionBuild int ,
	MachineName nvarchar(256) ,
	Flags int ,
	BindingID uniqueidentifier ,
	RecoveryForkID uniqueidentifier ,
	Collation nvarchar(256) ,
	FamilyGUID uniqueidentifier ,
	HasBulkLoggedData bit ,
	IsSnapshot bit ,
	IsReadOnly bit ,
	IsSingleUser bit ,
	HasBackupChecksums bit ,
	IsDamaged bit ,
	BeginsLogChain bit ,
	HasIncompleteMetaData bit ,
	IsForceOffline bit ,
	IsCopyOnly bit ,
	FirstRecoveryForkID uniqueidentifier ,
	ForkPointLSN numeric(38,0) NULL ,
	RecoveryModel nvarchar(256) ,
	DifferentialBaseLSN numeric(38,0) NULL ,
	DifferentialBaseGUID uniqueidentifier ,
	BackupTypeDescription nvarchar(256) ,
	BackupSetGUID uniqueidentifier NULL
	, [CompressedBackupSize] numeric(38,0)
	, [Containment] numeric(38,0)
)
INSERT
	--#1
	@
EXEC
	(@sql)
;with T
as
(
	select
		NewBackupType = iif([BackupType] in (1, 5) , 1 ,[BackupType])
		, NewDifferentialBaseLSN = iif(backuptype=1, FirstLSN, DifferentialBaseLSN)
		, *
	from
		@
	--order by
	--	databaseName
	--	,[FirstLSN]
)
, TT
as
(
	select
		MachineName_0 =						MachineName 
		, DatabaseName_0 =					DatabaseName
		, NewBackupType_0 =					NewBackupType
		--, IsDamaged_0 =						IsDamaged
		--, BeginsLogChain_0 =				BeginsLogChain
		, LagNewBackupType =			Lag(NewBackupType)
											over
												(
													order by
														MachineName
														, DatabaseName
														, FirstLSN
												)
		, LagLastLSN =
										lag([LastLSN])
												OVER
													(
														ORDER BY
															NewBackupType
															, [FirstLSN]
													)
		, FirstLSN_0 =					FirstLSN
		, LastLSN_0 =					LastLSN
		, FirstValue_FirstLSN =				iif
												(
													backupType in (1,5)
													, --FIRST_VALUE(FirstLSN)
														min(FirstLSN)
														OVER
															(
																partition by
																	MachineName
																	, databaseName
																	, NewDifferentialBaseLSN
																order by
																	--MachineName
																	--, DatabaseName
																	--, 
																	FirstLSN
															)
													, null
												)
		, DifferentialBaseLSN_0 =		DifferentialBaseLSN
		, BackupTypeDescription_0 =		BackupTypeDescription
		, BackupFinishDate_0 =			BackupFinishDate
		, *
	from
		T
)
select
	ok =	iif(FirstLSN = LagLastLSN, 'Y', 'N')
	, *
from
	TT
order by
	MachineName
	, databaseName
	--, NewBackupType
	, FirstLSN
end

#T=rollup grouping
GO
alter proc [zsp_BranchsData]
as
begin
/*
	CREATE TABLE [原始机构数据]
	(
		[序号]				[varchar](50) NULL,
		[一级分行号]			[varchar](50) NULL,
		[一级分行名称]		[varchar](50) NULL,
		[二级分行号]			[varchar](50) NULL,
		[二级分行名称]		[varchar](50) NULL,
		--[上级机构号]		[varchar](50) NULL,
		--[上级机构名称]		[varchar](50) NULL,
		--[责任中心号]		[varchar](50) NULL,
		--[责任中心名称]		[varchar](50) NULL
	)
*/
	SELECT
		--GROUPING([一级分行号])
		--, 
		[一级分行号]		=
							iif
								(
									GROUPING([一级分行号]) = 1
									, '合计:'
									, [一级分行号]
								) ,
		[一级分行名称]	=
							iif
								(
									GROUPING([一级分行号]) = 1
									,
										cast
											(
												count(distinct [一级分行号]) as varchar
											)
									, max([一级分行名称])
								) , 
		[二级分行数量]	= count(distinct [二级分行号])
	FROM
		[原始机构数据]
	group by
		--[一级分行号]
		rollup
			(
				[一级分行号]
			)
	order by
		GROUPING([一级分行号])
		, [一级分行号]


	select
		[二级分行号] ,
		[二级分行名称]	= max([二级分行名称]) ,
		[一级分行号]		= max([一级分行号]) ,
		[一级分行名称]	= max([一级分行名称])
	from
		[原始机构数据]
	group by
		[二级分行号]
	order by
		3

;with T
as
(
	SELECT
		[一级分行组]			= GROUPING([一级分行号]) ,
		[全辖一级分行序号]	= DENSE_RANK()
								over
									(
										order by
											[一级分行号]
									) - 1 ,
		[一级分行号]			=
								iif
									(
										GROUPING([一级分行号]) = 1
										, '全部合计:'
										, [一级分行号]
									) ,
		[一级分行名称]		=
								case
									when
										GROUPING([一级分行号]) = 1
											then
												cast(count(distinct [一级分行号]) as varchar)
									when
										GROUPING([二级分行号]) = 1
										and GROUPING([一级分行号]) = 0
											then
												max([一级分行名称]) + ' 分组'
									else
										max([一级分行名称])
								end ,
		[二级分行组]			= GROUPING([二级分行号]) ,
		[辖内二级分行序号]	= ROW_NUMBER()
									over
										(
											partition by
												[一级分行号]
											order by
												[二级分行号]
										) - 1 ,
		[二级分行号]			=
								case
									when
										GROUPING([一级分行号]) = 1
										and GROUPING([二级分行号]) = 1
											then
												'全部合计:'
									when
										GROUPING([二级分行号]) = 1
											then
												'分组小计:'
									else
										[二级分行号]
								end ,
		[二级分行名称]		=
								iif
									(
										GROUPING([二级分行号]) = 1
										, cast(count(distinct [二级分行号]) as varchar)
										, max([二级分行名称])
									)
	FROM
		[原始机构数据]
	group by
		--[一级分行号]
		rollup
			(
				[一级分行号]
				, [二级分行号]
			)
)
select
	--[一级分行组] ,
	[全辖一级分行序号] ,
	[一级分行号] ,
	[一级分行名称] ,
	--[二级分行组] ,
	[辖内二级分行序号] ,
	[二级分行号] ,
	[二级分行名称]
from
	T
order by
	[一级分行号] ,
	[一级分行组] ,
	[二级分行号] ,
	[二级分行组]
end

#T=rollup grouping 汇总行 udp

USE [MessagesPush2]

CREATE TABLE [dbo].[Messages](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageID] [bigint] NULL,
	[ReceiverAppID] [varchar](50) NULL,
	[ReceiverGroupID] [varchar](50) NULL,
	[ReceiverUserID] [varchar](50) NULL,
	[SenderAppID] [varchar](50) NULL,
	[SenderGroupID] [varchar](50) NULL,
	[SenderUserID] [varchar](50) NULL,
	[Message] [varchar](max) NULL,
	[status] [tinyint] NULL,
	[SessionHostServer] [varchar](50) NULL,
	[ClientIPEndPoint] [varchar](50) NULL,
	[FirstUdpPushTransmissionTime] [datetime] NULL,
	[LastUdpPushTransmissionTime] [datetime] NULL,
	[UdpPushTransmissionTimes] [int] NULL,
	[UdpResponsedTime] [datetime] NULL,
	[HttpResponsedTime] [datetime] NULL,
	[ExpireTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[ResponseProtocol] [varchar](50) NULL,
	[Remark] [varchar](max) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_Messages]
) ON [FG_Messages] TEXTIMAGE_ON [FG_Messages]

USE [MessagesPush2]
GO
/****** Object:  StoredProcedure [dbo].[zsp_UdpStats]    Script Date: 2014/6/11 21:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[zsp_UdpStats]
	@SecondsPerUnitTime int =5
as
begin

	;with T
	as
	(
		SELECT
				CEILING
					(
						1.0 * datediff(second, [FirstUdpPushTransmissionTime], [UdpResponsedTime]) 
						/ @SecondsPerUnitTime
					)
				as [总耗时(单位:X秒)]
			, datediff(second, [FirstUdpPushTransmissionTime], [UdpResponsedTime]) as [总耗时(单位:1秒)]
			, *
		FROM
			[Messages] with(nolock)
		where
			status = 10
			and ResponseProtocol like '%udp%'
	)
	, T1
	as
	(
		SELECT
			[总耗时(单位:X秒)]
			, avg(UdpPushTransmissionTimes) as [平均发送次数]
			, count(1) as [消息数]
		FROM
			T
		where
			status = 10
			and ResponseProtocol like '%udp%'
		group by
			[总耗时(单位:X秒)]
	)
	, T2
	as
	(
		select
			ROW_NUMBER() over (order by [总耗时(单位:X秒)]) as ID
			, *
			, 100.0 * [消息数] / sum([消息数]) over (partition by 1) as 占比
		from
			T1
	)
	select
			case
				when
					grouping(ID) = 0
						then
							ID
				else
					0
			end					as ID
		--,grouping(ID)
		,
			case
				when
					grouping(ID) = 0
						then
							max([总耗时(单位:X秒)])
							* @SecondsPerUnitTime
				else
					null
			end					as [总耗时(单位:X秒)]
		,
			case
				when
					grouping(ID) = 0
						then
							max([平均发送次数])
				else
					null
			end					as [平均发送次数]
		,
			case
				when
					grouping(ID) = 0
						then
							max([消息数])
				else
					sum([消息数])
			end					as [消息数]
		,
			case
				when
					grouping(ID) = 0
						then
							max([占比])
				else
					sum([占比])
			end					as [占比]
	from
		T2
	group by
		rollup
			(
				ID
			)
	order by
		grouping(ID) desc
		, [消息数] desc
end
go



exec [zsp_UdpStats]
#T=Sequence获取新的ID
CREATE Procedure dbo.UP_UPS_I_GetUpsTxID 
(
	@oUpsTxID varchar(20) out
)
As
Begin
	BEGIN TRAN
		UPDATE
			ParSequenceNumber WITH(ROWLOCK)
		SET
			@oUpsTxID = RIGHT('0000000000000' + SequenceID, 20)
			, SequenceID = SequenceID + 1
		WHERE
			SequenceType='00'
	COMMIT TRAN
End

#T=snapshot
create database Test_Snapshot_001
on (name='Test',filename='D:\mssql\2008R2\Enterprise\MSSQL10_50.ENTERPRISE\MSSQL\snapshots\Test_Snapshot_001.ss')
as snapshot of Test
#T=sp_executesql sample
alter procedure zsp_executesql
	@ObjectName as varchar(256) =null
	, @ObjectID as int = null
	, @ObjectType as varchar(2) = null
	, @CreateDate as datetime = null
	, @KeyWord as varchar(10) = null
as
begin
	/*
		zsp_executesql
			'%'
			, 0
			, 'p'
			, '2016-10-10'
	*/
	declare @sql nvarchar(max) 
	declare @whereClause nvarchar(max) = N''
	declare @params nvarchar(max)
	declare @Table1Name nvarchar(32) = N'sys.objects'
	declare @Table2Name nvarchar(32) = N'sys.syscomments'
	declare @ int = 0
	declare @out int
	set @params = 
				N'
					@pObjectName varchar(256)
					, @pObjectID int
					, @pObjectType varchar(2)
					, @pCreateDate datetime --out
					, @pKeyWord varchar(256)  --out
					, @pOut int out
				'
	set @sql = 
				N'
					select
						*
					from
				'
	set @sql += nchar(13) + nchar(10)
				+ @Table1Name
	set @sql +=
				N' a
					left join'
	set @sql += nchar(13) + nchar(10)
				+ @Table2Name
	set @sql +=
				N' b
					on
						a.object_id = b.id
				'
	if (len(rtrim(ltrim(isnull(@ObjectName,'')))) != 0)
	begin
		if (len(rtrim(ltrim(isnull(@whereClause,'')))) = 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'where'
		end
		if (@ > 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'and'
		end
		set @whereClause += N' a.name like ''%'' + @pObjectName + ''%'''
		set @ += 1
	end
	if (len(rtrim(ltrim(isnull(@ObjectType,'')))) != 0)
	begin
		if (len(rtrim(ltrim(isnull(@whereClause,'')))) = 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'where'
		end
		if (@ > 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'and'
		end
		set @whereClause += N' a.type = @pObjectType'
		set @ += 1
	end
	if (len(rtrim(ltrim(isnull(@ObjectID,'')))) != 0)
	begin
		if (len(rtrim(ltrim(isnull(@whereClause,'')))) = 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'where'
		end
		if (@ > 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'and'
		end
		set @whereClause += N' a.object_id > @pObjectID'
		set @ += 1
	end
	if (len(rtrim(ltrim(isnull(@CreateDate,'')))) != 0)
	begin
		if (len(rtrim(ltrim(isnull(@whereClause,'')))) = 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'where'
		end
		if (@ > 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'and'
		end
		set @whereClause += N' a.Create_Date < @pCreateDate'
		set @ += 1
	end
	if (len(rtrim(ltrim(isnull(@KeyWord,'')))) != 0)
	begin
		if (len(rtrim(ltrim(isnull(@whereClause,'')))) = 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'where'
		end
		if (@ > 0)
		begin
			set @whereClause += nchar(13) + nchar(10) + N'and'
		end
		set @whereClause += N' b.[text] like ''%'' + @pKeyWord + ''%'''
		set @ += 1
	end
	set @sql += @whereClause
	set @sql += nchar(13) + nchar(10) + N'order by 1, 3 desc'
	print @sql
	exec
		sp_executesql
			@sql
			, @params
			, @ObjectName	--as varchar(256)
			, @ObjectID		--as varchar(256)
			, @ObjectType	--as varchar(2)
			, @CreateDate	--as datetime
			, @KeyWord		--as varchar(10)
			, @Out out
end
#T=Split String To Table
CREATE function [dbo].[zufn_SplitStringToTable]
(
	@Text   varchar(8000),  --待分拆的字符串
	@Separator varchar(10) = ','     --数据分隔符
)RETURNS @Table TABLE(id int,F varchar(100))
AS
/*
select *
from zufn_SplitStringToTable(',,44,,,55,77,77,',',')
*/

BEGIN
set @Text = replace(@Text,' ','')
set @Separator = ','
DECLARE @SeparatorLen int
SET @SeparatorLen=LEN(@Separator+'$')-2
set @Text = replace(@Text,' ','')
declare @i int
set @i = 1
WHILE CHARINDEX(@Separator,@Text )>0
BEGIN
	declare @v varchar(100)
	set @v = (LEFT(@Text ,CHARINDEX(@Separator,@Text )-1))
	INSERT @Table (id,F)
	select @i,@v
	where rtrim(ltrim(@v)) != '' 
			and not exists (select 1 from @Table  where F = @v)
	if @@rowcount > 0
	begin
		set @i = @i + 1
	end
	SET @Text = STUFF(@Text ,1,CHARINDEX(@Separator,@Text )+@SeparatorLen,'')
END
INSERT @Table  (id,F)
select @i,@Text
where rtrim(ltrim(@Text)) != ''
		and not exists (select 1 from @Table where F = @Text)
return
end
#T=SplitString Substring CharIndex
/*--得到字符串列表指定位置的字符
 
 可以自定义字符串列表的分隔符
 如果取数位置超出的范围,返回空字符串

--邹建 2004.07(引用请保留此信息)--*/

/*--调用示例

 --测试数据
 declare @t table(FITEM varchar(100))
 insert @t select '100.120.10' 
 union all select '20.140.10'
 union all select '150.124.150.10'
 
 --查询
 select fitem1=dbo.f_split(fitem,1,'.')
  ,fitem2=dbo.f_split(fitem,2,'.')
  ,fitem3=dbo.f_split(fitem,3,'.')
  ,fitem4=dbo.f_split(fitem,4,'.')
 from @t
--*/
create function f_split(
@s varchar(8000),  --字符串列表
@pos int, --取数位置
@splitchar varchar(10) --分隔符
)returns varchar(8000)
as
begin
 declare @i int,@ilen int

 select @i=charindex(@splitchar,@s),@ilen=len(@splitchar)
 while @i>0 and @pos>1
  select @s=substring(@s,@i+@ilen,8000)
   ,@i=charindex(@splitchar,@s)
   ,@pos=@pos-1
 return(case @pos when 1 
   then case when @i>0 then left(@s,@i-1) else @s end
   else '' end)
end
#T=SQL 2000 数据字典
SELECT 
 表名=case when a.colorder=1 then d.name else '' end,
 表说明=case when a.colorder=1 then isnull(f.value,'') else '' end,
 字段序号=a.colorder,
 字段名=a.name,
 标识=case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
 主键=case when exists(SELECT 1 FROM sysobjects where xtype='PK' and name in (
  SELECT name FROM sysindexes WHERE indid in(
   SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid
  ))) then '√' else '' end,
 类型=b.name,
 占用字节数=a.length,
 长度=COLUMNPROPERTY(a.id,a.name,'PRECISION'),
 小数位数=isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
 允许空=case when a.isnullable=1 then '√'else '' end,
 默认值=isnull(e.text,''),
 字段说明=isnull(g.[value],''),
 索引名称=isnull(h.索引名称,''),
 索引顺序=isnull(h.排序,'')
FROM syscolumns a
 left join systypes b on a.xtype=b.xusertype
 inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
 left join syscomments e on a.cdefault=e.id
 left join sysproperties g on a.id=g.id and a.colid=g.smallid  
 left join sysproperties f on d.id=f.id and f.smallid=0
 left join(--这部分是索引信息,如果要显示索引与表及字段的对应关系,可以只要此部分
  select 索引名称=a.name,c.id,d.colid
   ,排序=case indexkey_property(c.id,b.indid,b.keyno,'isdescending')
    when 1 then '降序' when 0 then '升序' end
  from sysindexes a
   join sysindexkeys b on a.id=b.id and a.indid=b.indid
   join (--这里的作用是有多个索引时,取索引号最小的那个
    select id,colid,indid=min(indid) from sysindexkeys
    group by id,colid) b1 on b.id=b1.id and b.colid=b1.colid and b.indid=b1.indid
   join sysobjects c on b.id=c.id and c.xtype='U' and  c.name<>'dtproperties'
   join syscolumns d on b.id=d.id and b.colid=d.colid
  where a.indid not in(0,255)
 ) h on a.id=h.id and a.colid=h.colid
--where d.name='要查询的表'    --如果只查询指定表,加上此条件
order by a.id,a.colorder

#T=SQL 2005 索引及主键信息
-- ========================================================================
-- 索引及主键信息

-- 邹建 2005.08(引用请保留此信息)
-- ========================================================================
SELECT 
    TableId=O.[object_id],
    TableName=O.Name,
    IndexId=ISNULL(KC.[object_id],IDX.index_id),
    IndexName=IDX.Name,
    IndexType=ISNULL(KC.type_desc,'Index'),
    Index_Column_id=IDXC.index_column_id,
    ColumnID=C.Column_id,
    ColumnName=C.Name,
    Sort=CASE INDEXKEY_PROPERTY(IDXC.[object_id],IDXC.index_id,IDXC.index_column_id,'IsDescending')
        WHEN 1 THEN 'DESC' WHEN 0 THEN 'ASC' ELSE '' END,
    PrimaryKey=CASE WHEN IDX.is_primary_key=1 THEN N'√'ELSE N'' END,
    [UNIQUE]=CASE WHEN IDX.is_unique=1 THEN N'√'ELSE N'' END,
    Ignore_dup_key=CASE WHEN IDX.ignore_dup_key=1 THEN N'√'ELSE N'' END,
    Disabled=CASE WHEN IDX.is_disabled=1 THEN N'√'ELSE N'' END,
    Fill_factor=IDX.fill_factor,
    Padded=CASE WHEN IDX.is_padded=1 THEN N'√'ELSE N'' END
FROM sys.indexes IDX
    INNER JOIN sys.index_columns IDXC
        ON IDX.[object_id]=IDXC.[object_id]
            AND IDX.index_id=IDXC.index_id
    LEFT JOIN sys.key_constraints KC
        ON IDX.[object_id]=KC.[parent_object_id]
            AND IDX.index_id=KC.unique_index_id
    INNER JOIN sys.objects O
        ON O.[object_id]=IDX.[object_id]
    INNER JOIN sys.columns C
        ON O.[object_id]=C.[object_id]
            AND O.type='U'
            AND O.is_ms_shipped=0
            AND IDXC.Column_id=C.Column_id
--    INNER JOIN  -- 对于一个列包含多个索引的情况,只显示第1个索引信息
--    (
--        SELECT [object_id], Column_id, index_id=MIN(index_id)
--        FROM sys.index_columns
--        GROUP BY [object_id], Column_id
--    ) IDXCUQ
--        ON IDXC.[object_id]=IDXCUQ.[object_id]
--            AND IDXC.Column_id=IDXCUQ.Column_id
--       

order by
	TableName
	, IndexType desc
	, IndexName
	, Index_Column_id
#T=SQL 2005 索引及主键信息 All DataBases
use Master

-- ========================================================================
-- 索引及主键信息

-- 邹建2005.08(引用请保留此信息)
-- ========================================================================
SELECT 
    ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName')),
    DatabaseID = DB_ID(),
    DatabaseName = DB_NAME(),
    TableId=O.[object_id],
    TableName=O.Name,
    IndexId=ISNULL(KC.[object_id],IDX.index_id),
    IndexName=IDX.Name,
    IndexType=ISNULL(KC.type_desc,'Index'),
    Index_Column_id=IDXC.index_column_id,
    ColumnID=C.Column_id,
    ColumnName=C.Name,
    Sort=CASE INDEXKEY_PROPERTY(IDXC.[object_id],IDXC.index_id,IDXC.index_column_id,'IsDescending')
        WHEN 1 THEN 'DESC' WHEN 0 THEN 'ASC' ELSE '' END,
    PrimaryKey=CASE WHEN IDX.is_primary_key=1 THEN N'√'ELSE N'' END,
    [UQIQUE]=CASE WHEN IDX.is_unique=1 THEN N'√'ELSE N'' END,
    Ignore_dup_key=CASE WHEN IDX.ignore_dup_key=1 THEN N'√'ELSE N'' END,
    Disabled=CASE WHEN IDX.is_disabled=1 THEN N'√'ELSE N'' END,
    Fill_factor=IDX.fill_factor,
    Padded=CASE WHEN IDX.is_padded=1 THEN N'√'ELSE N'' END
    into #ttt
FROM sys.indexes IDX
    INNER JOIN sys.index_columns IDXC
        ON IDX.[object_id]=IDXC.[object_id]
            AND IDX.index_id=IDXC.index_id
    LEFT JOIN sys.key_constraints KC
        ON IDX.[object_id]=KC.[parent_object_id]
            AND IDX.index_id=KC.unique_index_id
    INNER JOIN sys.objects O
        ON O.[object_id]=IDX.[object_id]
    INNER JOIN sys.columns C
        ON O.[object_id]=C.[object_id]
            AND O.type='U'
            AND O.is_ms_shipped=0
            AND IDXC.Column_id=C.Column_id
--    INNER JOIN  -- 对于一个列包含多个索引的情况,只显示第个索引信息
--    (
--        SELECT [object_id], Column_id, index_id=MIN(index_id)
--        FROM sys.index_columns
--        GROUP BY [object_id], Column_id
--    ) IDXCUQ
--        ON IDXC.[object_id]=IDXCUQ.[object_id]
--            AND IDXC.Column_id=IDXCUQ.Column_id
--
where
       1 = 0       
order by
       1

--GO


EXEC sp_MSForEachDB  'USE [?];
insert into #ttt

-- ========================================================================
-- 索引及主键信息

-- 邹建2005.08(引用请保留此信息)
-- ========================================================================
SELECT
    ServerName = CONVERT(sysname, SERVERPROPERTY(''ServerName'')),
    DatabaseID = DB_ID(),
    DatabaseName = DB_NAME(),
    TableId=O.[object_id],
    TableName=O.Name,
    IndexId=ISNULL(KC.[object_id],IDX.index_id),
    IndexName=IDX.Name,
    IndexType=ISNULL(KC.type_desc,''Index''),
    Index_Column_id=IDXC.index_column_id,
    ColumnID=C.Column_id,
    ColumnName=C.Name,
    Sort=CASE INDEXKEY_PROPERTY(IDXC.[object_id],IDXC.index_id,IDXC.index_column_id,''IsDescending'')
        WHEN 1 THEN ''DESC'' WHEN 0 THEN ''ASC'' ELSE '''' END,
    PrimaryKey=CASE WHEN IDX.is_primary_key=1 THEN N''√''ELSE N'''' END,
    [UQIQUE]=CASE WHEN IDX.is_unique=1 THEN N''√''ELSE N'''' END,
    Ignore_dup_key=CASE WHEN IDX.ignore_dup_key=1 THEN N''√''ELSE N'''' END,
    Disabled=CASE WHEN IDX.is_disabled=1 THEN N''√''ELSE N'''' END,
    Fill_factor=IDX.fill_factor,
    Padded=CASE WHEN IDX.is_padded=1 THEN N''√''ELSE N'''' END
FROM sys.indexes IDX
    INNER JOIN sys.index_columns IDXC
        ON IDX.[object_id]=IDXC.[object_id]
            AND IDX.index_id=IDXC.index_id
    LEFT JOIN sys.key_constraints KC
        ON IDX.[object_id]=KC.[parent_object_id]
            AND IDX.index_id=KC.unique_index_id
    INNER JOIN sys.objects O
        ON O.[object_id]=IDX.[object_id]
    INNER JOIN sys.columns C
        ON O.[object_id]=C.[object_id]
            AND O.type=''U''
            AND O.is_ms_shipped=0
            AND IDXC.Column_id=C.Column_id
--    INNER JOIN  -- 对于一个列包含多个索引的情况,只显示第个索引信息
--    (
--        SELECT [object_id], Column_id, index_id=MIN(index_id)
--        FROM sys.index_columns
--        GROUP BY [object_id], Column_id
--    ) IDXCUQ
--        ON IDXC.[object_id]=IDXCUQ.[object_id]
--            AND IDXC.Column_id=IDXCUQ.Column_id
--       
order by
       TableId, IndexId
'

select *
from #ttt
order by 1,2,3,4,5,6,7

--drop table #ttt

#T=SQL 2005/2008 数据字典
SELECT
	(case when a.colorder = 1 then d.[name] else '' end) as 表名
	, a.colorder as 字段序号
	, a.[name] as 字段名
	, (case when COLUMNPROPERTY(a.id,a.[name], 'IsIdentity') = 1 then '*'else '' end) as 标识
	, (case when (
					SELECT count(*)
					FROM sysobjects
					WHERE ([name] in (
										SELECT [name]
										FROM sysindexes
										WHERE (id = a.id)
												AND
												(indid in (
															SELECT indid
															FROM sysindexkeys
															WHERE (id = a.id)
																	AND
																	(colid in (
																				SELECT colid
																				FROM syscolumns
																				WHERE (id = a.id)
																				AND 
																				(name = a.name)
																				)
																	)
															)
												)
										)
							)
							AND
							(xtype = 'PK')
					) > 0 then '√' else '' end) as 主键
	, b.[name] as 类型
	, a.length as 占用字节数
	, COLUMNPROPERTY(a.id, a.[name], 'PRECISION') as 长度
	, isnull(COLUMNPROPERTY(a.id,a.[name], 'Scale'), 0) as 小数位数
	, (case when a.isnullable = 1 then '√' else '' end) as 允许空
	, isnull(e.text,'') as 默认值
	, isnull(g.[value],'') as 字段说明
FROM syscolumns a 
	left join systypes b
		on a.xtype = b.xusertype
	inner join sysobjects d
		on a.id = d.id and d.xtype = 'U' and d.[name] <> 'dtproperties'
	left join syscomments e
		on a.cdefault = e.id
	left join sys.extended_properties g
		on a.id = g.major_id AND a.colid = g.minor_id
order by a.id, a.colorder
#T=SQL 2005/2008 表结构信息查询 邹建
-- ========================================================================
-- 表结构信息查询

-- 邹建 2005.08(引用请保留此信息)
-- ========================================================================
SELECT
	表名		= CASE WHEN C.column_id = 1 THEN O.name ELSE N'' END ,
	表说明		= ISNULL(CASE WHEN C.column_id = 1 THEN PTB.[value] END, N'') ,
	列序号		= C.column_id ,
	列名		= C.name ,
	主键列		= ISNULL(IDX.PrimaryKey, N'') ,
	标识		= CASE WHEN C.is_identity = 1 THEN N'√' ELSE N'' END ,
	计算列		= CASE WHEN C.is_computed = 1 THEN N'√' ELSE N'' END ,
	类型		= T.name ,
	长度		= C.max_length ,
	精度		= C.[precision] ,
	小数位		= C.scale ,
	允许空		= CASE WHEN C.is_nullable = 1 THEN N'√' ELSE N'' END ,
	缺省值		= ISNULL(D.[definition], N'') ,
	列说明		= ISNULL(PFD.[value], N'') ,
	首索引名称	= ISNULL(IDX.IndexName, N'') ,
	首索引排序	= ISNULL(IDX.Sort,N'') ,
	创建时间	= O.Create_Date ,
	修改时间	= O.Modify_date
FROM sys.columns C
	INNER JOIN sys.objects O
		ON C.[object_id] = O.[object_id]
			AND O.type = 'U'
			AND O.is_ms_shipped = 0
	INNER JOIN sys.types T
		ON C.user_type_id = T.user_type_id
	LEFT JOIN sys.default_constraints D
		ON C.[object_id] = D.parent_object_id
			AND C.column_id = D.parent_column_id
			AND C.default_object_id = D.[object_id]
	LEFT JOIN sys.extended_properties PFD
		ON PFD.class = 1 
			AND C.[object_id] = PFD.major_id
			AND C.column_id = PFD.minor_id
--			AND PFD.name = 'MS_Description'					-- 字段说明对应的描述名称(一个字段可以添加多个不同name的描述)
	LEFT JOIN sys.extended_properties PTB
		ON PTB.class = 1 
			AND PTB.minor_id = 0 
			AND C.[object_id] = PTB.major_id
			AND PTB.name = 'TableDescription'				-- 表说明对应的描述名称(一个表可以添加多个不同name的描述)
	LEFT JOIN												-- 索引及主键信息
	(
		SELECT 
			IDXC.[object_id] ,
			IDXC.column_id ,
			Sort = CASE INDEXKEY_PROPERTY(IDXC.[object_id], IDXC.index_id, IDXC.index_column_id, 'IsDescending')
					WHEN 1
						THEN 'DESC'
					WHEN 0
						THEN 'ASC'
					ELSE
						'' END ,
			PrimaryKey = CASE WHEN IDX.is_primary_key = 1 THEN N'√' ELSE N'' END ,
			IndexName = IDX.Name
		FROM sys.indexes IDX
		INNER JOIN sys.index_columns IDXC
			ON IDX.[object_id] = IDXC.[object_id]
				AND IDX.index_id = IDXC.index_id
		LEFT JOIN sys.key_constraints KC
			ON IDX.[object_id] = KC.[parent_object_id]
				AND IDX.index_id = KC.unique_index_id
		INNER JOIN											-- 对于一个列包含多个索引的情况,只显示第1个索引信息
			(
				SELECT [object_id], Column_id, index_id = MIN(index_id)
				FROM sys.index_columns
				GROUP BY [object_id], Column_id
			) IDXCUQ
			ON IDXC.[object_id] = IDXCUQ.[object_id]
				AND IDXC.Column_id = IDXCUQ.Column_id
				AND IDXC.index_id = IDXCUQ.index_id
	) IDX
		ON C.[object_id] = IDX.[object_id]
			AND C.column_id = IDX.column_id
-- WHERE O.name = N'要查询的表'								-- 如果只查询指定表,加上此条件
ORDER BY O.name,C.column_id
#T=SQL Doc
SELECT sp.major_id AS id, 
so.name AS ObjectName, 
sys.schemas.name AS ObjectOwner,  
so.type AS ObjectType, 
sp.minor_id AS smallid,  
sp.name AS PropertyName, 
sp.value AS PropertyValue,
CAST(sp.value AS varbinary(MAX)) AS PropertyValueBinary,
sql_variant_property(sp.value,'BaseType') AS PropertyValueBaseType,
sql_variant_property(sp.value,'Precision') AS PropertyValuePrecision,
sql_variant_property(sp.value,'Scale') AS PropertyValueScale,
sql_variant_property(sp.value,'MaxLength') AS PropertyValueMaxLength,
CASE sp.class WHEN 4 THEN USER_NAME(sp.major_id) END AS UserName,
CASE sp.class WHEN 6 THEN (SELECT TOP 1 name FROM sys.types sst WHERE sst.user_type_id=sp.major_id) END AS UDTName,
CASE sp.class WHEN 6 THEN (SELECT TOP 1 sys.schemas.name FROM sys.schemas INNER JOIN sys.types ON sys.types.schema_id=sys.schemas.schema_id WHERE sys.types.user_type_id=sp.major_id) END AS UDTOwner,
CASE sp.class
    WHEN  3 THEN (SELECT TOP 1 ss2.name as a FROM sys.schemas ss2 WITH (NOLOCK) WHERE ss2.schema_id = sp.major_id)
    WHEN  5 THEN (SELECT TOP 1 sa2.name as a FROM sys.assemblies sa2 WITH (NOLOCK) WHERE sa2.assembly_id = sp.major_id)
    WHEN 10 THEN (SELECT TOP 1 sxsc2.name as a FROM sys.xml_schema_collections sxsc2 WITH (NOLOCK) WHERE sxsc2.xml_collection_id = sp.major_id) COLLATE database_default
    WHEN 15 THEN (SELECT TOP 1 smt2.name FROM sys.service_message_types smt2 WITH (NOLOCK) WHERE smt2.message_type_id = sp.major_id)
    WHEN 16 THEN (SELECT TOP 1 ssc2.name FROM sys.service_contracts ssc2 WITH (NOLOCK) WHERE ssc2.service_contract_id = sp.major_id)
    WHEN 17 THEN (SELECT TOP 1 ss2.name FROM sys.services ss2 WITH (NOLOCK) WHERE ss2.service_id = sp.major_id)
    WHEN 18 THEN (SELECT TOP 1 srs2.name FROM sys.remote_service_bindings srs2 WITH (NOLOCK) WHERE srs2.remote_service_binding_id = sp.major_id)
    WHEN 19 THEN (SELECT TOP 1 sr2.name FROM sys.routes sr2 WITH (NOLOCK) WHERE sr2.route_id = sp.major_id)
    WHEN 20 THEN (SELECT TOP 1 sps2.name FROM sys.partition_schemes sps2 WITH (NOLOCK) WHERE sps2.data_space_id = sp.major_id)
    WHEN 21 THEN (SELECT TOP 1 spf2.name FROM sys.partition_functions spf2 WITH (NOLOCK) WHERE spf2.function_id = sp.major_id)
    ELSE CAST(NULL AS sysname)
END AS YukonObjectName,
CASE sp.class 
    WHEN 10 THEN SCHEMA_NAME(( SELECT TOP 1 sx2.schema_id FROM sys.xml_schema_collections sx2 WITH (NOLOCK) WHERE sx2.xml_collection_id = sp.major_id))
    WHEN 6 THEN SCHEMA_NAME((SELECT TOP 1 st2.schema_id FROM sys.types st2 WITH (NOLOCK) WHERE st2.user_type_id = sp.major_id))
ELSE 
USER_NAME(CASE sp.class 
    WHEN 3 THEN (SELECT TOP 1 sch2.principal_id FROM sys.schemas sch2 WITH (NOLOCK) WHERE sch2.schema_id = sp.major_id)
    WHEN 4 THEN (SELECT TOP 1 sp2.owning_principal_id FROM sys.database_principals sp2 WITH (NOLOCK) WHERE sp2.principal_id = sp.major_id)
    WHEN 5 THEN (SELECT TOP 1 sa2.principal_id FROM sys.assemblies sa2 WITH (NOLOCK) WHERE sa2.assembly_id = sp.major_id)
    WHEN 15 THEN (SELECT TOP 1 smt2.principal_id FROM sys.service_message_types smt2 WITH (NOLOCK) WHERE smt2.message_type_id = sp.major_id)
    WHEN 16 THEN (SELECT TOP 1 ssc2.principal_id FROM sys.service_contracts ssc2 WITH (NOLOCK) WHERE ssc2.service_contract_id = sp.major_id)
    WHEN 17 THEN (SELECT TOP 1 ss2.principal_id FROM sys.services ss2 WITH (NOLOCK) WHERE ss2.service_id = sp.major_id)
    WHEN 18 THEN (SELECT TOP 1 srs2.principal_id FROM sys.remote_service_bindings srs2 WITH (NOLOCK) WHERE srs2.remote_service_binding_id = sp.major_id)
    WHEN 19 THEN (SELECT TOP 1 sr2.principal_id FROM sys.routes sr2 WITH (NOLOCK) WHERE sr2.route_id = sp.major_id)
    WHEN 23 THEN (SELECT TOP 1 sft2.principal_id FROM sys.fulltext_catalogs sft2 WITH (NOLOCK) WHERE sft2.fulltext_catalog_id = sp.major_id)
    WHEN 24 THEN (SELECT TOP 1 ssk2.principal_id FROM sys.symmetric_keys ssk2 WITH (NOLOCK) WHERE ssk2.symmetric_key_id = sp.major_id)
    WHEN 26 THEN (SELECT TOP 1 sak2.principal_id FROM sys.asymmetric_keys sak2 WITH (NOLOCK) WHERE sak2.asymmetric_key_id = sp.major_id)
    WHEN 25 THEN (SELECT TOP 1 sc2.principal_id FROM sys.certificates sc2 WITH (NOLOCK) WHERE sc2.certificate_id = sp.major_id)
    ELSE CAST(NULL AS sysname)
END)
END AS YukonObjectOwner,
CASE sp.class
    WHEN 2 then spar.name
    ELSE sc.name
END AS FieldName,
si.name AS IndexName,
pso.name AS ParentName,
pu.name AS ParentOwner,
pso.type AS ParentType,
sp.class AS type,
ddlt.name AS DdlTriggerName,
en.name AS EventNotificiationName,
qensq.name AS ENQueueName,
qensqs.name AS ENQueueSchema

FROM sys.extended_properties AS sp WITH (NOLOCK) 
LEFT JOIN sys.objects  AS so WITH (NOLOCK) ON so.object_id=sp.major_id
LEFT JOIN sys.schemas  WITH (NOLOCK) ON sys.schemas.schema_id=so.schema_id
LEFT JOIN sys.columns AS sc WITH (NOLOCK) ON sc.object_id=sp.major_id AND sc.column_id=sp.minor_id
LEFT JOIN sys.parameters AS spar WITH (NOLOCK) ON spar.object_id=sp.major_id AND spar.parameter_id=sp.minor_id
LEFT JOIN sys.indexes si WITH (NOLOCK) ON si.object_id=sp.major_id AND si.index_id=sp.minor_id
LEFT JOIN sys.objects pso  WITH (NOLOCK) ON so.parent_object_id=pso.object_id
LEFT JOIN sys.schemas pu  WITH (NOLOCK) ON pso.schema_id=pu.schema_id
LEFT JOIN sys.triggers  AS ddlt WITH (NOLOCK) ON ddlt.object_id=sp.major_id
LEFT JOIN sys.event_notifications  AS en WITH (NOLOCK) ON en.object_id=sp.major_id
LEFT JOIN sys.service_queues  AS qensq WITH (NOLOCK) ON qensq.object_id=en.parent_id
LEFT JOIN sys.schemas AS qensqs WITH (NOLOCK) ON qensqs.schema_id=qensq.SCHEMA_ID
WHERE so.NAME='schools'

#T=SQL inject SP
select a.id,MAX(a.name)
from sysobjects a
left join syscomments b
on a.id = b.id
where a.xtype = 'p'
and b.[text] like '% exec%'
group by a.id
#T=SQL Server缺少了哪些索引
SELECT mig.index_group_handle,mid.index_handle, migs.avg_total_user_cost as AvgTotalUserCostThatCouldbeReduced, migs.avg_user_impact as AvgPercentageBenefit,
'CREATE INDEX missing_index_' + CONVERT (varchar, mig.index_group_handle) + '_' + CONVERT (varchar, mid.index_handle) 
  + ' ON ' + mid.statement 
  + ' (' + ISNULL (mid.equality_columns,'') 
    + CASE WHEN mid.equality_columns IS NOT NULL AND mid.inequality_columns IS NOT NULL THEN ',' ELSE '' END 
    + ISNULL (mid.inequality_columns, '')
  + ')' 
  + ISNULL (' INCLUDE (' + mid.included_columns + ')', '') AS create_index_statement 
    FROM sys.dm_db_missing_index_groups mig
INNER JOIN sys.dm_db_missing_index_group_stats migs ON migs.group_handle = mig.index_group_handle
INNER JOIN sys.dm_db_missing_index_details mid ON mig.index_handle = mid.index_handle

#T=SQL Subsonic
SELECT 
    TABLE_CATALOG AS [Database],
    TABLE_SCHEMA AS Owner, 
    TABLE_NAME AS TableName, 
    COLUMN_NAME AS ColumnName, 
    ORDINAL_POSITION AS OrdinalPosition, 
    COLUMN_DEFAULT AS DefaultSetting, 
    IS_NULLABLE AS IsNullable, DATA_TYPE AS DataType, 
    CHARACTER_MAXIMUM_LENGTH AS MaxLength, 
    DATETIME_PRECISION AS DatePrecision,
    COLUMNPROPERTY(object_id('[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']'), COLUMN_NAME, 'IsIdentity') AS IsIdentity,
    COLUMNPROPERTY(object_id('[' + TABLE_SCHEMA + '].[' + TABLE_NAME + ']'), COLUMN_NAME, 'IsComputed') as IsComputed,
    properties.value   as    ColumnDescription  
FROM  INFORMATION_SCHEMA.COLUMNS
left   join    sys.extended_properties    properties   
  ON   object_Id(columns.Table_Name)   =    properties.major_id   --AND columns.COLLATION_SCHEMA
  AND    columns.Ordinal_position   =    properties.minor_id AND class_desc='OBJECT_OR_COLUMN' 

WHERE TABLE_NAME='schools' 
ORDER BY OrdinalPosition ASC 

#T=SQL sysfiles Info
declare @sql varchar(max)
set @sql = 'select a.[name] as DBName, t.* from [master]..sysdatabases a left join ('
declare @ varchar(max)
set @ = ''
select
	@ = @ + case when @ = '' then '' else char(10) + char(13) + 'union all' + char(10) + char(13) end
	+ 'select a' + cast(dbid as varchar) + '.groupname,'
	+ 'b'+ cast(dbid as varchar) +'.*,'
	+ cast(dbid as varchar) + ' as dbid from ['+ [name] + ']..' 
	+ 'sysfilegroups a' + cast(dbid as varchar) + ' with(nolock)'
	+ ' right join ['+ [name] + ']..sysfiles b' + cast(dbid as varchar) + ' with(nolock)'
	+ ' on a' + cast(dbid as varchar) + '.groupid'
	+ ' = b' + cast(dbid as varchar) + '.groupid'
from sysdatabases

set @sql = @sql + @ + ') T on a.dbid = t.dbid order by a.dbid'

exec (@sql)
#T=SQL2005 性能监控 DMV
--调优使用的代码

--######################清除缓存，执行检查点，用于每次观察执行计划前执行######################################################
checkpoint

dbcc freeproccache

dbcc dropcleanbuffers

DBCC FLUSHPROCINDB(null)--9为数据库的ID，可以由DB_ID()的得到
--##################################################################################

--#########################查找被缓存语句，并且查看使用次数############################################################################
SELECT cacheobjtype, usecounts as Count,
    cast(C.sql as varChar(max)) as StoredProcedure
  FROM Master.dbo.syscacheobjects C
  JOIN  Master.dbo.sysdatabases D
    ON C.dbid = C.dbid
  WHERE D.Name = DB_Name()
   -- AND ObjType = 'Adhoc'
  ORDER BY StoredProcedure
--###########################################################################################


--########################数据库总体IO分析###########################################
--#########################列出每个数据库的IO次数，得出最繁忙的DB##########################################
WITH DBIO AS
(
  SELECT
    DB_NAME(IVFS.database_id) AS db,
    CASE WHEN MF.type = 1 THEN 'log' ELSE 'data' END AS file_type,
    SUM(IVFS.num_of_bytes_read + IVFS.num_of_bytes_written) AS io,
    SUM(IVFS.io_stall) AS io_stall
  FROM sys.dm_io_virtual_file_stats(NULL, NULL) AS IVFS
    JOIN sys.master_files AS MF
      ON IVFS.database_id = MF.database_id
      AND IVFS.file_id = MF.file_id
  GROUP BY DB_NAME(IVFS.database_id), MF.type
)
SELECT db, file_type,
  CAST(1. * io / (1024 * 1024) AS DECIMAL(12, 2)) AS io_mb,
  CAST(io_stall / 1000. AS DECIMAL(12, 2)) AS io_stall_s,
  CAST(100. * io_stall / SUM(io_stall) OVER()
       AS DECIMAL(10, 2)) AS io_stall_per,
  ROW_NUMBER() OVER(ORDER BY io_stall DESC) AS rn
FROM DBIO
ORDER BY io_stall DESC;
--##########################数据库总体IO分析###########################################################################



--###################################数据库索引利用率分析#############################################
select b.name,a.* from sys.dm_db_index_usage_stats a inner join sysindexes b
on (a.object_id = b.id) order by a.user_seeks desc
--####################################数据库索引利用率分析###################################################################




--###############################前五十位CPU执行时间最长的sql文本#######################################################
SELECT
	total_cpu_time,
	total_execution_count,
total_cpu_time/total_execution_count as cpu_time_per_execution,
	number_of_statements,
	s2.text
	--(SELECT SUBSTRING(s2.text, statement_start_offset / 2, ((CASE WHEN statement_end_offset = -1 THEN (LEN(CONVERT(NVARCHAR(MAX), s2.text)) * 2) ELSE statement_end_offset END) - statement_start_offset) / 2) ) AS query_text
FROM
	(SELECT TOP 50
		SUM(qs.total_worker_time) AS total_cpu_time,
		SUM(qs.execution_count) AS total_execution_count,
		COUNT(*) AS  number_of_statements,
		qs.sql_handle --,
		--MIN(statement_start_offset) AS statement_start_offset,
		--MAX(statement_end_offset) AS statement_end_offset
	FROM
		sys.dm_exec_query_stats AS qs
	GROUP BY qs.sql_handle
	ORDER BY SUM(qs.total_worker_time)/SUM(qs.execution_count) DESC) AS stats
	CROSS APPLY sys.dm_exec_sql_text(stats.sql_handle) AS s2
--###############################前五十位CPU执行时间最长的sql文本#######################################################



--#######################查看查询计划里面的具体执行情况，是否有堵塞出现################################################

  CREATE PROCEDURE LookForPhysicalOps (@op VARCHAR(30))
AS
SELECT sql.text, qs.EXECUTION_COUNT, qs.*, p.*
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(sql_handle) sql
CROSS APPLY sys.dm_exec_query_plan(plan_handle) p
WHERE query_plan.exist('
declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
/ShowPlanXML/BatchSequence/Batch/Statements//RelOp/@PhysicalOp[. = sql:variable("@op")]
') = 1
GO

EXEC LookForPhysicalOps 'Clustered Index Scan'
EXEC LookForPhysicalOps 'Nested Loops'
EXEC LookForPhysicalOps 'Table Scan'



--##########################缺失索引性能查询#############################################################
SELECT  TOP 10 
        [Total Cost]  = ROUND(avg_total_user_cost * avg_user_impact * (user_seeks + user_scans),0) 
        , avg_user_impact
        , TableName = statement
        , [EqualityUsage] = equality_columns 
        , [InequalityUsage] = inequality_columns
        , [Include Cloumns] = included_columns
FROM        sys.dm_db_missing_index_groups g 
INNER JOIN    sys.dm_db_missing_index_group_stats s 
       ON s.group_handle = g.index_group_handle 
INNER JOIN    sys.dm_db_missing_index_details d 
       ON d.index_handle = g.index_handle
ORDER BY [Total Cost] DESC;




--##########################系统锁################################################################
SELECT request_session_id as spid, 
	 db_name(resource_database_id) as dbname, 
    CASE 
   WHEN resource_type = 'OBJECT' THEN 
         object_name(resource_associated_entity_id)	
	   WHEN resource_associated_entity_id = 0 THEN 'n/a'
   ELSE object_name(p.object_id) 
	 END as entity_name, index_id,
       resource_type as resource, 
	    resource_description as description, 
       request_mode as mode, request_status as status
FROM sys.dm_tran_locks t LEFT JOIN sys.partitions p
	ON p.hobt_id = t.resource_associated_entity_id
WHERE resource_database_id = db_id() order by entity_name desc,resource desc,[description] desc,mode desc
--############################################################################################3

#T=sqlCmd
@echo off
SET /p pathScripts="PATH Scripts: "
IF NOT EXIST "%pathScripts%" (
	echo Path not found, create the folder and come back
	Exit /b
)
SET /p pathlogs="PATH Logs: "
IF NOT EXIST "%pathlogs%" (
	echo Path not found, create the folder and come back
	Exit /b
)
cd %pathScripts%
IF NOT EXIST *.sql (
	echo No.sql file(s) in this folder, check that and come back
	Exit /b
)
FOR %%i IN (*.sql) do call :RunScript %%i 
GOTO :END 

:RunScript 
SET name=%1
SET name=%name:~0,-4%
SET name=\%name%.log
Echo Executing Script: %1 
call :StartTimer
echo Begin: %StartTime%
SQLCMD -S MACHINE_NAME\INSTANCE_NAME -i %1 -o "%pathlogs%%name%"
call :StopTimer
Echo Script Done: %1
Echo Log in: %pathlogs%%name%  
echo End: %StopTime%
echo Duration: %duration%  >> "%pathlogs%%name%"
echo Duration: %duration%
echo ------------------------------------------
:END

:StartTimer
set StartTIME=%TIME:~0,-3%
goto :EOF

:StopTimer
set StopTIME=%TIME:~0,-3%
set /A "ss=(((1%StopTIME::=-100)*60+1%-100)-(((1%StartTIME::=-100)*60+1%-100)"
set /A "hh=ss/3600+100,ss%%=3600,mm=ss/60+100,ss=ss%%60+100"
set Duration=%hh:~1%:%mm:~1%:%ss:~1%

goto :EOF
#T=SqlCmd run scripts.sql
@echo off
SET /p pathScripts="PATH Scripts: "
IF NOT EXIST "%pathScripts%" (
	echo Path not found, create the folder and come back
	Exit /b
)
SET /p pathlogs="PATH Logs: "
IF NOT EXIST "%pathlogs%" (
	echo Path not found, create the folder and come back
	Exit /b
)
cd %pathScripts%
IF NOT EXIST *.sql (
	echo No.sql file(s) in this folder, check that and come back
	Exit /b
)
FOR %%i IN (*.sql) do call :RunScript %%i 
GOTO :END 

:RunScript 
SET name=%1
SET name=%name:~0,-4%
SET name=\%name%.log
Echo Executing Script: %1 
call :StartTimer
echo Begin: %StartTime%
SQLCMD -S MACHINE_NAME\INSTANCE_NAME -i %1 -o "%pathlogs%%name%"
call :StopTimer
Echo Script Done: %1
Echo Log in: %pathlogs%%name%  
echo End: %StopTime%
echo Duration: %duration%  >> "%pathlogs%%name%"
echo Duration: %duration%
echo ------------------------------------------
:END

:StartTimer
set StartTIME=%TIME:~0,-3%
goto :EOF

:StopTimer
set StopTIME=%TIME:~0,-3%
set /A "ss=(((1%StopTIME::=-100)*60+1%-100)-(((1%StartTIME::=-100)*60+1%-100)"
set /A "hh=ss/3600+100,ss%%=3600,mm=ss/60+100,ss=ss%%60+100"
set Duration=%hh:~1%:%mm:~1%:%ss:~1%

goto :EOF
#T=SQL查询技巧
如何提高SQL查询效率

1.对查询进行优化，应尽量避免全表扫描，首先应考虑在 where 及 order by 涉及的列上建立索引。
2.应尽量避免在 where 子句中对字段进行 null 值判断，否则将导致引擎放弃使用索引而进行全表扫描，如：
	select id from t where num is null
	可以在num上设置默认值0，确保表中num列没有null值，然后这样查询：
	select id from t where num=0
3.应尽量避免在 where 子句中使用!=或<>操作符，否则将引擎放弃使用索引而进行全表扫描。
4.应尽量避免在 where 子句中使用 or 来连接条件，否则将导致引擎放弃使用索引而进行全表扫描，如：
	select id from t where num=10 or num=20
	可以这样查询：
	select id from t where num=10
	union all
	select id from t where num=20
5.in 和 not in 也要慎用，否则会导致全表扫描，如：
	select id from t where num in(1,2,3)
	对于连续的数值，能用 between 就不要用 in 了：
	select id from t where num between 1 and 3
6.下面的查询也将导致全表扫描：
	select id from t where name like '%abc%'
	若要提高效率，可以考虑全文检索。
7.如果在 where 子句中使用参数，也会导致全表扫描。因为SQL只有在运行时才会解析局部变量，但优化程序不能将访问计划的选择推迟到运行时；它必须在编译时进行选择。然 而，如果在编译时建立访问计划，变量的值还是未知的，因而无法作为索引选择的输入项。如下面语句将进行全表扫描：
	select id from t where num=@num
	可以改为强制查询使用索引：
	select id from t with(index(索引名)) where num=@num
8.应尽量避免在 where 子句中对字段进行表达式操作，这将导致引擎放弃使用索引而进行全表扫描。如：
	select id from t where num/2=100
	应改为:
	select id from t where num=100*2
9.应尽量避免在where子句中对字段进行函数操作，这将导致引擎放弃使用索引而进行全表扫描。如：
	select id from t where substring(name,1,3)='abc'--name以abc开头的id
	select id from t where datediff(day,createdate,'2005-11-30')=0--‘2005-11-30’生成的id
	应改为:
	select id from t where name like 'abc%'
	select id from t where createdate>='2005-11-30' and createdate<'2005-12-1'
10.不要在 where 子句中的“=”左边进行函数、算术运算或其他表达式运算，否则系统将可能无法正确使用索引。
11.在使用索引字段作为条件时，如果该索引是复合索引，那么必须使用到该索引中的第一个字段作为条件时才能保证系统使用该索引，否则该索引将不 会被使用，并且应尽可能的让字段顺序与索引顺序相一致。
12.不要写一些没有意义的查询，如需要生成一个空表结构：
	select col1,col2 into #t from t where 1=0
	这类代码不会返回任何结果集，但是会消耗系统资源的，应改成这样：
	create table #t(...)
13.很多时候用 exists 代替 in 是一个好的选择：
	select num from a where num in(select num from b)
	用下面的语句替换：
	select num from a where exists(select 1 from b where num=a.num)
14.并不是所有索引对查询都有效，SQL是根据表中数据来进行查询优化的，当索引列有大量数据重复时，SQL查询可能不会去利用索引，如一表中 有字段sex，male、female几乎各一半，那么即使在sex上建了索引也对查询效率起不了作用。
15.索引并不是越多越好，索引固然可以提高相应的 select 的效率，但同时也降低了 insert 及 update 的效率，因为 insert 或 update 时有可能会重建索引，所以怎样建索引需要慎重考虑，视具体情况而定。一个表的索引数最好不要超过6个，若太多则应考虑一些不常使用到的列上建的索引是否有 必要。
16.应尽可能的避免更新 clustered 索引数据列，因为 clustered 索引数据列的顺序就是表记录的物理存储顺序，一旦该列值改变将导致整个表记录的顺序的调整，会耗费相当大的资源。若应用系统需要频繁更新 clustered 索引数据列，那么需要考虑是否应将该索引建为 clustered 索引。
17.尽量使用数字型字段，若只含数值信息的字段尽量不要设计为字符型，这会降低查询和连接的性能，并会增加存储开销。这是因为引擎在处理查询和 连接时会逐个比较字符串中每一个字符，而对于数字型而言只需要比较一次就够了。
18.尽可能的使用 varchar/nvarchar 代替 char/nchar ，因为首先变长字段存储空间小，可以节省存储空间，其次对于查询来说，在一个相对较小的字段内搜索效率显然要高些。
19.任何地方都不要使用 select * from t ，用具体的字段列表代替“*”，不要返回用不到的任何字段。
20.尽量使用表变量来代替临时表。如果表变量包含大量数据，请注意索引非常有限（只有主键索引）。
21.避免频繁创建和删除临时表，以减少系统表资源的消耗。
22.临时表并不是不可使用，适当地使用它们可以使某些例程更有效，例如，当需要重复引用大型表或常用表中的某个数据集时。但是，对于一次性事 件，最好使用导出表。
23.在新建临时表时，如果一次性插入数据量很大，那么可以使用 select into 代替 create table，避免造成大量 log ，以提高速度；如果数据量不大，为了缓和系统表的资源，应先create table，然后insert。
24.如果使用到了临时表，在存储过程的最后务必将所有的临时表显式删除，先 truncate table ，然后 drop table ，这样可以避免系统表的较长时间锁定。
25.尽量避免使用游标，因为游标的效率较差，如果游标操作的数据超过1万行，那么就应该考虑改写。
26.使用基于游标的方法或临时表方法之前，应先寻找基于集的解决方案来解决问题，基于集的方法通常更有效。
27.与临时表一样，游标并不是不可使用。对小型数据集使用 FAST_FORWARD 游标通常要优于其他逐行处理方法，尤其是在必须引用几个表才能获得所需的数据时。在结果集中包括“合计”的例程通常要比使用游标执行的速度快。如果开发时 间允许，基于游标的方法和基于集的方法都可以尝试一下，看哪一种方法的效果更好。
28.在所有的存储过程和触发器的开始处设置 SET NOCOUNT ON ，在结束时设置 SET NOCOUNT OFF 。无需在执行存储过程和触发器的每个语句后向客户端发送 DONE_IN_PROC 消息。
29.尽量避免大事务操作，提高系统并发能力。
30.尽量避免向客户端返回大数据量，若数据量过大，应该考虑相应需求是否合理
#T=sql语句优化原则
sql语句优化原则 
性能不理想的系统中除了一部分是因为应用程序的负载确实超过了服务器的实际处理能力外,更多的是因为系统存在大量的SQL语句需要优化。
为了获得稳定的执行性能，SQL语句越简单越好。对复杂的SQL语句，要设法对之进行简化。

常见的简化规则如下：
 
1）不要有超过5个以上的表连接（JOIN）
2）考虑使用临时表或表变量存放中间结果。
3）少用子查询
4）视图嵌套不要过深,一般视图嵌套不要超过2个为宜。
 
连接的表越多，其编译的时间和连接的开销也越大，性能越不好控制。
最好是把连接拆开成较小的几个部分逐个顺序执行。
优先执行那些能够大量减少结果的连接。
拆分的好处不仅仅是减少SQL Server优化的时间，更使得SQL语句能够以你可以预测的方式和顺序执行。

如果一定需要连接很多表才能得到数据，那么很可能意味着设计上的缺陷。
 

连接是outer join，非常不好。因为outer join意味着必须对左表或右表查询所有行。
如果表很大而没有相应的where语句，那么outer join很容易导致table scan或index scan。
要尽量使用inner join避免scan整个表。

优化建议：
 
1）使用临时表存放t1表的结果,能大大减少logical reads（或返回行数）的操作要优先执行。
 仔细分析语句，你会发现where中的条件全是针对表t1的，所以直接使用上面的where子句查询表t1，然后把结果存放再临时表＃t1中：
 
Select t1 … into #tt1 from t1 where… --(和上面的where一样)
 
2）再把＃tt1和其他表进行连接:
 
Select #t1 …
Left outer join …
Left outer join …
 

3）修改 like 程序，去掉前置百分号。like语句却因为前置百分号而无法使用索引
4）从系统设计的角度修改语句，去掉outer join。
5）考虑组合索引或覆盖索引消除clustered index scan。
 
上面1和2点建议立即消除了worktable，性能提高了几倍以上，效果非常明显。
 
 
1）限制结果集
 
要尽量减少返回的结果行，包括行数和字段列数。
返回的结果越大，意味着相应的SQL语句的logical reads 就越大，对服务器的性能影响就越甚。
一个很不好的设计就是返回表的所有数据：
 
Select * from tablename
 
即使表很小也会导致并发问题。更坏的情况是，如果表有上百万行的话，那后果将是灾难性的。
它不但可能带来极重的磁盘IO，更有可能把数据库缓冲区中的其他缓存数据挤出，使得这些数据下次必须再从磁盘读取。
必须设计良好的SQL语句，使得其有where语句或TOP语句来限制结果集大小。

2）合理的表设计
 
SQL Server 2005将支持表分区技术。利用表分区技术可以实现数据表的流动窗口功能。
在流动窗口中可以轻易的把历史数据移出，把新的数据加入，从而使表的大小基本保持稳定。
 
另外，表的设计未必需要非常范式化。有一定的字段冗余可以增加SQL语句的效率，减少JOIN的数目，提高语句的执行速度。

3）OLAP和OLTP模块要分开
 
OLAP和OLTP类型的语句是截然不同的。前者往往需要扫描整个表做统计分析，索引对这样的语句几乎没有多少用处。
索引只能够加快那些如sum，group by之类的聚合运算。因为这个原因，几乎很难对OLAP类型的SQL语句进行优化。
而OLTP语句则只需要访问表的很小一部分数据，而且这些数据往往可以从内存缓存中得到。
为了避免OLAP 和OLTP语句相互影响，这两类模块需要分开运行在不同服务器上。
因为OLAP语句几乎都是读取数据，没有更新和写入操作，所以一个好的经验是配置一台standby 服务器，然后OLAP只访问standby服务器。

4）使用存储过程
 
可以考虑使用存储过程封装那些复杂的SQL语句或商业逻辑，这样做有几个好处。
一是存储过程的执行计划可以被缓存在内存中较长时间，减少了重新编译的时间。
二是存储过程减少了客户端和服务器的繁复交互。
三是如果程序发布后需要做某些改变你可以直接修改存储过程而不用修改程序，避免需要重新安装部署程序。

 
 
 索引优化
 
 
 
 
很多数据库系统性能不理想是因为系统没有经过整体优化，存在大量性能低下的SQL 语句。
 
这类SQL语句性能不好的首要原因是缺乏高效的索引。
 
没有索引除了导致语句本身运行速度慢外，更是导致大量的磁盘读写操作，使得整个系统性能都受之影响而变差。
 
解决这类系统的首要办法是优化这些没有索引或索引不够好的SQL语句。
 
 
 

创建索引的关键
 
 
优化SQL语句的关键是尽可能减少语句的logical reads。
 
 
这里说的logical reads是指语句执行时需要访问的单位为8K的数据页总数。
 
logical reads 越少，其需要的内存和CPU时间也就越少，语句执行速度就越快。
 

不言而喻，索引的最大好处是它可以极大减少SQL语句的logical reads数目，从而极大减少语句的执行时间。
 

创建索引的关键是索引要能够大大减少语句的logical reads。一个索引好不好，主要看它减少的logical reads多不多。
 
运行set statistics io命令可以得到SQL语句的logical reads信息。
 
set statistics io on
select au_id,au_lname ,au_fname 
from pubs..authors where au_lname ='Green'
set statistics io on

如果Logical reads很大，而返回的行数很少，也即两者相差较大，那么往往意味者语句需要优化。
 
Logical reads中包含该语句从内存数据缓冲区中访问的页数和从物理磁盘读取的页数。
 
而physical reads表示那些没有驻留在内存缓冲区中需要从磁盘读取的数据页。
 
Read-ahead reads是SQL Server为了提高性能而产生的预读。预读可能会多读取一些数据。 
 
优化的时候我们主要关注Logical Reads就可以了。
 
注意如果physical Reads或Read-ahead reads很大，那么往往意味着语句的执行时间（duration）里面会有一部分耗费在等待物理磁盘IO上。
 
 
二、单字段索引，组合索引和覆盖索引
 
　　单字段索引是指只有一个字段的索引，而组合索引指有多个字段构成的索引。
 

1． 对出现在where子句中的字段加索引
 

set statistics profile on
set statistics io on
go
select .... from tb where ...
go
set statistics profile off
set statistics io off

 
set statistics profile命令将输出语句的执行计划。
 
也许你会问，为什么不用SET SHOWPLAN_ALL呢？使用SET SHOWPLAN_ALL也是可以的。

不过set statistics profile输出的是SQL 语句的运行时候真正使用的执行计划，
 
而SET SHOWPLAN_ALL输出的是预计（Estimate）的执行计划。
 
使用SET SHOWPLAN_ALL是后面的语句并不会真正运行。
 
用了Table Scan，也就是对整个表进行了全表扫描。全表扫描的性能通常是很差的，要尽量避免。

如果上面的select语句是数据库系统经常运行的关键语句， 那么应该对它创建相应的索引。

创建索引的技巧之一是对经常出现在where条件中的字段创建索引

Table Scan也变成了Index Seek，性能极大提高

设法避免Table scan或Index scan是优化SQL 语句使用的常用技巧。通常Index Seek需要的logical reads比前两者要少得多。
 

2．组合索引
 
如果where语句中有多个字段，那么可以考虑创建组合索引。
 
组合索引中字段的顺序是非常重要的，越是唯一的字段越是要靠前。

另外，无论是组合索引还是单个列的索引，尽量不要选择那些唯一性很低的字段。

比如说，在只有两个值0和1的字段上建立索引没有多大意义。
 
所以如果对单字段进行索引，建议使用set statistics profile来验证索引确实被充分使用。logical reads越少的索引越好。
 

3．覆盖索引
 

　　覆盖索引能够使得语句不需要访问表仅仅访问索引就能够得到所有需要的数据。
 
　　因为聚集索引叶子节点就是数据所以无所谓覆盖与否，所以覆盖索引主要是针对非聚集索引而言。

　　执行计划中除了index seek外，还有一个Bookmark Lookup关键字。
 
　　Bookmark Lookup表示语句在访问索引后还需要对表进行额外的Bookmark Lookup操作才能得到数据。
 
　　也就是说为得到一行数据起码有两次IO，一次访问索引，一次访问基本表。
 
　　如果语句返回的行数很多，那么Bookmark Lookup操作的开销是很大的。
 
　　覆盖索引能够避免昂贵的Bookmark Lookup操作，减少IO的次数，提高语句的性能。
 
　　覆盖索引需要包含select子句和WHERE子句中出现的所有字段。Where语句中的字段在前面，select中的在后面。
 
　　logical reads，是大大减少了。Bookmark Lookup操作也消失了。所以创建覆盖索引是减少logical reads提升语句性能的非常有用的优化技巧。

　　实际上索引的创建原则是比较复杂的。有时候你无法在索引中包含了Where子句中所有的字段。

　　在考虑索引是否应该包含一个字段时，应考虑该字段在语句中的作用。

　　比如说如果经常以某个字段作为where条件作精确匹配返回很少的行，那么就绝对值得为这个字段建立索引。
 
　　再比如说，对那些非常唯一的字段如主键和外键，经常出现在group by，order by中的字段等等都值得创建索引。
 
 
问题1，是否值得在identity字段上建立聚集索引。
　　答案取决于identity 字段如何在语句中使用。如果你经常根据该字段搜索返回很少的行，那么在其上建立索引是值得的。
 
　　反之如果identity字段根本很少在语句中使用，那么就不应该对其建立任何索引。
 
 
问题2，一个表应该建立多少索引合适。
　　如果表的80％以上的语句都是读操作，那么索引可以多些。但是不要太多。
 
特别是不要对那些更新频繁的表其建立很多的索引。很少表有超过5个以上的索引。
 
过多的索引不但增加其占用的磁盘空间，也增加了SQL Server 维护索引的开销。
 

 
问题4：为什么SQL Server 在执行计划中没有使用你认为应该使用的索引？原因是多样的。

　　一种原因是该语句返回的结果超过了表的20％数据，使得SQL Server 认为scan比seek更有效。
 
另一种原因可能是表字段的statistics过期了，不能准确反映数据的分布情况。
 
你可以使用命令UPDATE STATISTICS tablename with FULLSCAN来更新它。
 
只有同步的准确的statistics才能保证SQL Server 产生正确的执行计划。
 
过时的老的statistics常会导致SQL Server生成不够优化的甚至愚蠢的执行计划。
 
所以如果你的表频繁更新，而你又觉得和之相关的SQL语句运行缓慢，不妨试试UPDATE STATISTIC with FULLSCAN 语句。
 
 
 
问题5、什么使用聚集索引，什么时候使用非聚集索引
 
　　在SQL Server 中索引有聚集索引和非聚集索引两种。它们的主要差别是前者的索引叶子就是数据本身，而后者的叶子节点包含的是指向数据的书签（即数据行号或聚集索引的key）。对一个表而言聚集索引只能有一个，而非聚集索引可以有多个。只是聚集索引没有Bookmark Lookup操作。
 
什么时候应该使用聚集索引?  什么时候使用非聚集索引? 取决于应用程序的访问模式。
 
我的建议是在那些关键的字段上使用聚集索引。一个表一般都需要建立一个聚集索引。
 
对于什么时候使用聚集索引，SQL Server 2000联机手册中有如下描述：
 
在创建聚集索引之前，应先了解您的数据是如何被访问的。
 
可考虑将聚集索引用于：
　　包含大量非重复值的列。
 
　　使用下列运算符返回一个范围值的查询：BETWEEN、>、>=、< 和 <=。
 
　　被连续访问的列。
 
返回大型结果集的查询。
 
经常被使用联接或 GROUP BY 子句的查询访问的列；一般来说，这些是外键列。
 
对 ORDER BY 或 GROUP BY 子句中指定的列进行索引，可以使 SQL Server 不必对数据进行排序，因为这些行已经排序。这样可以提高查询性能。
 
OLTP 类型的应用程序，这些程序要求进行非常快速的单行查找（一般通过主键）。应在主键上创建聚集索引。
 
 
 
聚集索引不适用于：
 
　　频繁更改的列
 
 
　　这将导致整行移动（因为 SQL Server 必须按物理顺序保留行中的数据值）。这一点要特别注意，因为在大数据量事务处理系统中数据是易失的。
 
 
宽键
 
　　来自聚集索引的键值由所有非聚集索引作为查找键使用，因此存储在每个非聚集索引的叶条目内。
 
 
总结：
 
如何使一个性能缓慢的系统运行更快更高效，不但需要整体分析数据库系统，找出系统的性能瓶颈，更需要优化数据库系统发出的SQL 语句。
 
一旦找出关键的SQL 语句并加与优化，性能问题就会迎刃而解。
 
 
 
 
 《 数据库技术内幕 》
处理百万级以上的数据提高查询速度的方法：

 1.应尽量避免在 where 子句中使用!=或<>操作符，否则将引擎放弃使用索引而进行全表扫描。

 2.对查询进行优化，应尽量避免全表扫描，首先应考虑在 where 及 order by 涉及的列上建立索引。

 3.应尽量避免在 where 子句中对字段进行 null 值判断，否则将导致引擎放弃使用索引而进行全表扫描，如：
     select id from t where num is null
     可以在num上设置默认值0，确保表中num列没有null值，然后这样查询：
     select id from t where num=0

 4.应尽量避免在 where 子句中使用 or 来连接条件，否则将导致引擎放弃使用索引而进行全表扫描，如：
     select id from t where num=10 or num=20
     可以这样查询：
     select id from t where num=10
     union all
     select id from t where num=20

 5.下面的查询也将导致全表扫描：(不能前置百分号)
     select id from t where name like ‘%abc%’
    若要提高效率，可以考虑全文检索。

 6.in 和 not in 也要慎用，否则会导致全表扫描，如：
     select id from t where num in(1,2,3)
     对于连续的数值，能用 between 就不要用 in 了：
     select id from t where num between 1 and 3

select xx,phone FROM send  a JOIN (
 select '13891030091' phone  union select '13992085916' …………  UNION  SELECT '13619100234' ) b 
  on  a.Phone=b.phone
--替代下面  很多数据隔开的时候
in('13891030091','13992085916','13619100234'…………)
 

7.如果在 where 子句中使用参数，也会导致全表扫描。因为SQL只有在运行时才会解析局部变量，但优化程序不能将访问计划的选择推迟到运行时；它必须在编译时进行选择。然 而，如果在编译时建立访问计划，变量的值还是未知的，因而无法作为索引选择的输入项。如下面语句将进行全表扫描：
     select id from t where num=@num     可以改为强制查询使用索引：
     select id from t with(index(索引名)) where num=@num

 8.应尽量避免在 where 子句中对字段进行表达式操作，这将导致引擎放弃使用索引而进行全表扫描。如：
     select id from t where num/2=100
     应改为:
     select id from t where num=100*2

 9.应尽量避免在where子句中对字段进行函数操作，这将导致引擎放弃使用索引而进行全表扫描。如：
     select id from t where substring(name,1,3)=’abc’–name以abc开头的id
     select id from t where datediff(day,createdate,’2005-11-30′)=0–’2005-11-30′生成的id
     应改为:
     select id from t where name like ‘abc%’
     select id from t where createdate>=’2005-11-30′ and createdate<’2005-12-1′

 10.不要在 where 子句中的“=”左边进行函数、算术运算或其他表达式运算，否则系统将可能无法正确使用索引。

 11.在使用索引字段作为条件时，如果该索引是复合索引，那么必须使用到该索引中的第一个字段作为条件时才能保证系统使用该索引，否则该索引将不会被使 用，并且应尽可能的让字段顺序与索引顺序相一致。

 12.不要写一些没有意义的查询，如需要生成一个空表结构：
     select col1,col2 into #t from t where 1=0
     这类代码不会返回任何结果集，但是会消耗系统资源的，应改成这样：
     create table #t(…)

 13.很多时候用 exists 代替 in 是一个好的选择：
     select num from a where num in(select num from b)
     用下面的语句替换：
     select num from a where exists(select 1 from b where num=a.num)

 14.并不是所有索引对查询都有效，SQL是根据表中数据来进行查询优化的，当索引列有大量数据重复时，SQL查询可能不会去利用索引，如一表中有字段 sex，male、female几乎各一半，那么即使在sex上建了索引也对查询效率起不了作用。

 15.索引并不是越多越好，索引固然可以提高相应的 select 的效率，但同时也降低了 insert 及 update 的效率，因为 insert 或 update 时有可能会重建索引，所以怎样建索引需要慎重考虑，视具体情况而定。一个表的索引数最好不要超过6个，若太多则应考虑一些不常使用到的列上建的索引是否有 必要。

 16.应尽可能的避免更新 clustered 索引数据列，因为 clustered 索引数据列的顺序就是表记录的物理存储顺序，一旦该列值改变将导致整个表记录的顺序的调整，会耗费相当大的资源。若应用系统需要频繁更新 clustered 索引数据列，那么需要考虑是否应将该索引建为 clustered 索引。

 17.尽量使用数字型字段，若只含数值信息的字段尽量不要设计为字符型，这会降低查询和连接的性能，并会增加存储开销。这是因为引擎在处理查询和连接时会 逐个比较字符串中每一个字符，而对于数字型而言只需要比较一次就够了。

 18.尽可能的使用 varchar/nvarchar 代替 char/nchar ，因为首先变长字段存储空间小，可以节省存储空间，其次对于查询来说，在一个相对较小的字段内搜索效率显然要高些。

 19.任何地方都不要使用 select * from t ，用具体的字段列表代替“*”，不要返回用不到的任何字段。

 20.尽量使用表变量来代替临时表。如果表变量包含大量数据，请注意索引非常有限（只有主键索引）。

 21.避免频繁创建和删除临时表，以减少系统表资源的消耗。

 22.临时表并不是不可使用，适当地使用它们可以使某些例程更有效，例如，当需要重复引用大型表或常用表中的某个数据集时。但是，对于一次性事件，最好使 用导出表。

 23.在新建临时表时，如果一次性插入数据量很大，那么可以使用 select into 代替 create table，避免造成大量 log ，以提高速度；如果数据量不大，为了缓和系统表的资源，应先create table，然后insert。

 24.如果使用到了临时表，在存储过程的最后务必将所有的临时表显式删除，先 truncate table ，然后 drop table ，这样可以避免系统表的较长时间锁定。

 25.尽量避免使用游标，因为游标的效率较差，如果游标操作的数据超过1万行，那么就应该考虑改写。

 26.使用基于游标的方法或临时表方法之前，应先寻找基于集的解决方案来解决问题，基于集的方法通常更有效。

 27.与临时表一样，游标并不是不可使用。对小型数据集使用 FAST_FORWARD 游标通常要优于其他逐行处理方法，尤其是在必须引用几个表才能获得所需的数据时。在结果集中包括“合计”的例程通常要比使用游标执行的速度快。如果开发时 间允许，基于游标的方法和基于集的方法都可以尝试一下，看哪一种方法的效果更好。

 28.在所有的存储过程和触发器的开始处设置 SET NOCOUNT ON ，在结束时设置 SET NOCOUNT OFF 。无需在执行存储过程和触发器的每个语句后向客户端发送 DONE_IN_PROC 消息。

 29.尽量避免向客户端返回大数据量，若数据量过大，应该考虑相应需求是否合理。

 30.尽量避免大事务操作，提高系统并发能力。


查询速度慢的原因：

1、没有索引或者没有用到索引(这是查询慢最常见的问题，是程序设计的缺陷) 
 
2、I/O吞吐量小，形成了瓶颈效应。  

3、没有创建计算列导致查询不优化。 
 
4、内存不足  

5、网络速度慢  

6、查询出的数据量过大（可以采用多次查询，其他的方法降低数据量）  

7、锁或者死锁(这也是查询慢最常见的问题，是程序设计的缺陷)  

8、sp_lock,sp_who,活动的用户查看,原因是读写竞争资源。
  
9、返回了不必要的行和列  

10、查询语句不好，没有优化  

可以通过如下方法来优化查询  

1、把数据、日志、索引放到不同的I/O设备上，增加读取速度，以前可以将Tempdb应放在RAID0上，SQL2000不在支持。数据量（尺寸）越大，提高I/O越重要.  

2、纵向、横向分割表，减少表的尺寸(sp_spaceuse)  

3、升级硬件  

4、根据查询条件,建立索引,优化索引、优化访问方式，限制结果集的数据量。注意填充因子要适当（最好是使用默认值0）。索引应该尽量小，使用字节数小的列建索引好（参照索引的创建）,不要对有限的几个值的字段建单一索引如性别字段  

5、提高网速;  

6、扩大服务器的内存,Windows   2000和SQL   server   2000能支持4-8G的内存。配置虚拟内存：虚拟内存大小应基于计算机上并发运行的服务进行配置。运行   Microsoft   SQL   Server?   2000   时，可考虑将虚拟内存大小设置为计算机中安装的物理内存的   1.5   倍。如果另外安装了全文检索功能，并打算运行   Microsoft   搜索服务以便执行全文索引和查询，可考虑：将虚拟内存大小配置为至少是计算机中安装的物理内存的   3   倍。将   SQL   Server   max   server   memory   服务器配置选项配置为物理内存的   1.5   倍（虚拟内存大小设置的一半）。  

7、增加服务器CPU个数;但是必须明白并行处理串行处理更需要资源例如内存。使用并行还是串行程是MsSQL自动评估选择的。单个任务分解成多个任务，就可以在处理器上运行。例如耽搁查询的排序、连接、扫描和GROUP   BY字句同时执行，SQL   SERVER根据系统的负载情况决定最优的并行等级，复杂的需要消耗大量的CPU的查询最适合并行处理。但是更新操作UPDATE,INSERT， DELETE还不能并行处理。  

8、如果是使用like进行查询的话，简单的使用index是不行的，但是全文索引，耗空间。   like   'a%'   使用索引   like   '%a'   不使用索引用   like   '%a%'   查询时，查询耗时和字段值总长度成正比,所以不能用CHAR类型，而是VARCHAR。对于字段的值很长的建全文索引。  

9、DB   Server   和APPLication   Server   分离；OLTP和OLAP分离  

10、分布式分区视图可用于实现数据库服务器联合体。联合体是一组分开管理的服务器，但它们相互协作分担系统的处理负荷。这种通过分区数据形成数据库服务器联合体的机制能够扩大一组服务器，以支持大型的多层   Web   站点的处理需要。有关更多信息，参见设计联合数据库服务器。（参照SQL帮助文件'分区视图'）  
    a、在实现分区视图之前，必须先水平分区表  
    b、在创建成员表后，在每个成员服务器上定义一个分布式分区视图，并且每个视图具有相同的名称。这样，引用分布式分区视图名的查询可以在任何一个成员服务器上运行。系统操作如同每个成员服务器上都有一个原始表的复本一样，但其实每个服务器上只有一个成员表和一个分布式分区视图。数据的位置对应用程序是透明的。  

11、重建索引   DBCC   REINDEX   ,DBCC   INDEXDEFRAG,收缩数据和日志   DBCC   SHRINKDB,DBCC   SHRINKFILE.   设置自动收缩日志.对于大的数据库不要设置数据库自动增长，它会降低服务器的性能。   在T-sql的写法上有很大的讲究，下面列出常见的要点：首先，DBMS处理查询计划的过程是这样的：  
    1、   查询语句的词法、语法检查          
    2、   将语句提交给DBMS的查询优化器  
    3、   优化器做代数优化和存取路径的优化  
    4、   由预编译模块生成查询规划  
    5、   然后在合适的时间提交给系统处理执行  
    6、   最后将执行结果返回给用户其次，看一下SQL   SERVER的数据存放的结构：一个页面的大小为8K(8060)字节，8个页面为一个盘区，按照B树存放。  

12、Commit和rollback的区别   Rollback:回滚所有的事物。   Commit:提交当前的事物.   没有必要在动态SQL里写事物，如果要写请写在外面如：   begin   tran   exec(@s)   commit   trans   或者将动态SQL   写成函数或者存储过程。  

13、在查询Select语句中用Where字句限制返回的行数,避免表扫描,如果返回不必要的数据，浪费了服务器的I/O资源，加重了网络的负担降低性能。如果表很大，在表扫描的期间将表锁住，禁止其他的联接访问表,后果严重。  

14、SQL的注释申明对执行没有任何影响  

15、尽可能不使用游标，它占用大量的资源。如果需要row-by-row地执行，尽量采用非光标技术,如：在客户端循环，用临时表，Table变量，用子查询，用Case语句等等。游标可以按照它所支持的提取选项进行分类：   只进   必须按照从第一行到最后一行的顺序提取行。FETCH   NEXT   是唯一允许的提取操作,也是默认方式。可滚动性   可以在游标中任何地方随机提取任意行。游标的技术在SQL2000下变得功能很强大，他的目的是支持循环。  
有四个并发选项  
READ_ONLY：不允许通过游标定位更新(Update)，且在组成结果集的行中没有锁。  
OPTIMISTIC   WITH   valueS:乐观并发控制是事务控制理论的一个标准部分。乐观并发控制用于这样的情形，即在打开游标及更新行的间隔中，只有很小的机会让第二个用户更新某一行。当某个游标以此选项打开时，没有锁控制其中的行，这将有助于最大化其处理能力。如果用户试图修改某一行，则此行的当前值会与最后一次提取此行时获取的值进行比较。如果任何值发生改变，则服务器就会知道其他人已更新了此行，并会返回一个错误。如果值是一样的，服务器就执行修改。   选择这个并发选项OPTIMISTIC   WITH   ROW   VERSIONING:此乐观并发控制选项基于行版本控制。使用行版本控制，其中的表必须具有某种版本标识符，服务器可用它来确定该行在读入游标后是否有所更改。  
在   SQL   Server   中，这个性能由   timestamp   数据类型提供，它是一个二进制数字，表示数据库中更改的相对顺序。每个数据库都有一个全局当前时间戳值：@@DBTS。每次以任何方式更改带有   timestamp   列的行时，SQL   Server   先在时间戳列中存储当前的   @@DBTS   值，然后增加   @@DBTS   的值。如果某   个表具有   timestamp   列，则时间戳会被记到行级。服务器就可以比较某行的当前时间戳值和上次提取时所存储的时间戳值，从而确定该行是否已更新。服务器不必比较所有列的值，只需比较   timestamp   列即可。如果应用程序对没有   timestamp   列的表要求基于行版本控制的乐观并发，则游标默认为基于数值的乐观并发控制。  
SCROLL   LOCKS   这个选项实现悲观并发控制。在悲观并发控制中，在把数据库的行读入游标结果集时，应用程序将试图锁定数据库行。在使用服务器游标时，将行读入游标时会在其上放置一个更新锁。如果在事务内打开游标，则该事务更新锁将一直保持到事务被提交或回滚；当提取下一行时，将除去游标锁。如果在事务外打开游标，则提取下一行时，锁就被丢弃。因此，每当用户需要完全的悲观并发控制时，游标都应在事务内打开。更新锁将阻止任何其它任务获取更新锁或排它锁，从而阻止其它任务更新该行。  
然而，更新锁并不阻止共享锁，所以它不会阻止其它任务读取行，除非第二个任务也在要求带更新锁的读取。滚动锁根据在游标定义的   SELECT   语句中指定的锁提示，这些游标并发选项可以生成滚动锁。滚动锁在提取时在每行上获取，并保持到下次提取或者游标关闭，以先发生者为准。下次提取时，服务器为新提取中的行获取滚动锁，并释放上次提取中行的滚动锁。滚动锁独立于事务锁，并可以保持到一个提交或回滚操作之后。如果提交时关闭游标的选项为关，则   COMMIT   语句并不关闭任何打开的游标，而且滚动锁被保留到提交之后，以维护对所提取数据的隔离。所获取滚动锁的类型取决于游标并发选项和游标   SELECT   语句中的锁提示。  
锁提示   只读   乐观数值   乐观行版本控制   锁定无提示   未锁定   未锁定   未锁定   更新   NOLOCK   未锁定   未锁定   未锁定   未锁定   HOLDLOCK   共享   共享   共享   更新   UPDLOCK   错误   更新   更新   更新   TABLOCKX   错误   未锁定   未锁定   更新其它   未锁定   未锁定   未锁定   更新   *指定   NOLOCK   提示将使指定了该提示的表在游标内是只读的。  

16、用Profiler来跟踪查询，得到查询所需的时间，找出SQL的问题所在;用索引优化器优化索引  

17、注意UNion和UNion   all   的区别。UNION   all好  

18、注意使用DISTINCT，在没有必要时不要用，它同UNION一样会使查询变慢。重复的记录在查询里是没有问题的  

19、查询时不要返回不需要的行、列  

20、用sp_configure   'query   governor   cost   limit'或者SET   QUERY_GOVERNOR_COST_LIMIT来限制查询消耗的资源。当评估查询消耗的资源超出限制时，服务器自动取消查询,在查询之前就扼杀掉。 SET   LOCKTIME设置锁的时间  

21、用select   top   100   /   10   Percent   来限制用户返回的行数或者SET   ROWCOUNT来限制操作的行  

22、在SQL2000以前，一般不要用如下的字句 “IS   NULL",   " <> ",   "!=",   "!> ",   "! <",   "NOT",   "NOT   EXISTS",   "NOT   IN",   "NOT   LIKE",   and   "LIKE   '%500'"，因为他们不走索引全是表扫描。
也不要在WHere字句中的列名加函数，如Convert，substring等,如果必须用函数的时候，创建计算列再创建索引来替代.还可以变通写法：WHERE   SUBSTRING(firstname,1,1)   =   'm'改为WHERE   firstname   like   'm%'（索引扫描），一定要将函数和列名分开。并且索引不能建得太多和太大。
NOT   IN会多次扫描表，使用EXISTS、NOT   EXISTS   ，IN   ,   LEFT   OUTER   JOIN   来替代，特别是左连接,而Exists比IN更快，最慢的是NOT操作.如果列的值含有空，以前它的索引不起作用，现在2000的优化器能够处理了。相同的是IS   NULL，“NOT",   "NOT   EXISTS",   "NOT   IN"能优化她，而” <> ”等还是不能优化，用不到索引。  

23、使用Query   Analyzer，查看SQL语句的查询计划和评估分析是否是优化的SQL。一般的20%的代码占据了80%的资源，我们优化的重点是这些慢的地方。  

24、如果使用了IN或者OR等时发现查询没有走索引，使用显示申明指定索引：   SELECT   *   FROM   PersonMember   (INDEX   =   IX_Title)   WHERE   processid   IN   (‘男’，‘女’)  

25、将需要查询的结果预先计算好放在表中，查询的时候再SELECT。这在SQL7.0以前是最重要的手段。例如医院的住院费计算。  

26、MIN()   和   MAX()能使用到合适的索引  

27、数据库有一个原则是代码离数据越近越好，所以优先选择Default,依次为Rules,Triggers,   Constraint（约束如外健主健CheckUNIQUE……,数据类型的最大长度等等都是约束）,Procedure.这样不仅维护工作小，编写程序质量高，并且执行的速度快。  

28、如果要插入大的二进制值到Image列，使用存储过程，千万不要用内嵌INsert来插入(不知JAVA是否)。因为这样应用程序首先将二进制值转换成字符串（尺寸是它的两倍），服务器受到字符后又将他转换成二进制值.存储过程就没有这些动作:   方法：Create   procedure   p_insert   as   insert   into   table(Fimage)   values   (@image),   在前台调用这个存储过程传入二进制参数，这样处理速度明显改善。  

29、Between在某些时候比IN速度更快,Between能够更快地根据索引找到范围。用查询优化器可见到差别。   select   *   from   chineseresume   where   title   in   ('男','女')   Select   *   from   chineseresume   where   between   '男'   and   '女'   是一样的。由于in会在比较多次，所以有时会慢些。  

30、在必要是对全局或者局部临时表创建索引，有时能够提高速度，但不是一定会这样，因为索引也耗费大量的资源。他的创建同是实际表一样。  

31、不要建没有作用的事物例如产生报表时，浪费资源。只有在必要使用事物时使用它。  

32、用OR的字句可以分解成多个查询，并且通过UNION   连接多个查询。他们的速度只同是否使用索引有关,如果查询需要用到联合索引，用UNION   all执行的效率更高.多个OR的字句没有用到索引，改写成UNION的形式再试图与索引匹配。一个关键的问题是否用到索引。  

33、尽量少用视图，它的效率低。对视图操作比直接对表操作慢,可以用stored   procedure来代替她。特别的是不要用视图嵌套,嵌套视图增加了寻找原始资料的难度。我们看视图的本质：它是存放在服务器上的被优化好了的已经产生了查询规划的SQL。对单个表检索数据时，不要使用指向多个表的视图，直接从表检索或者仅仅包含这个表的视图上读，否则增加了不必要的开销,查询受到干扰.为了加快视图的查询，MsSQL增加了视图索引的功能。  

34、没有必要时不要用DISTINCT和ORDER   BY，这些动作可以改在客户端执行。它们增加了额外的开销。这同UNION   和UNION   ALL一样的道理。   SELECT   top   20   ad.companyname,comid,position,ad.referenceid,worklocation,   convert(varchar(10),ad.postDate,120)   as   postDate1,workyear,degreedescription   FROM   jobcn_query.dbo.COMPANYAD_query   ad   where   referenceID   in('JCNAD00329667','JCNAD132168','JCNAD00337748','JCNAD00338345','JCNAD00333138','JCNAD00303570',   'JCNAD00303569','JCNAD00303568','JCNAD00306698','JCNAD00231935','JCNAD00231933','JCNAD00254567',   'JCNAD00254585','JCNAD00254608','JCNAD00254607','JCNAD00258524','JCNAD00332133','JCNAD00268618',   'JCNAD00279196','JCNAD00268613')   order   by   postdate   desc  

35、在IN后面值的列表中，将出现最频繁的值放在最前面，出现得最少的放在最后面，减少判断的次数  

36、当用SELECT   INTO时，它会锁住系统表(sysobjects，sysindexes等等)，阻塞其他的连接的存取。创建临时表时用显示申明语句，而不是 select   INTO.   drop   table   t_lxh   begin   tran   select   *   into   t_lxh   from   chineseresume   where   name   =   'XYZ'   --commit   在另一个连接中SELECT   *   from   sysobjects可以看到   SELECT   INTO   会锁住系统表，Create   table   也会锁系统表(不管是临时表还是系统表)。所以千万不要在事物内使用它！！！这样的话如果是经常要用的临时表请使用实表，或者临时表变量。  

37、一般在GROUP   BY   个HAVING字句之前就能剔除多余的行，所以尽量不要用它们来做剔除行的工作。他们的执行顺序应该如下最优：select   的Where字句选择所有合适的行，Group   By用来分组个统计行，Having字句用来剔除多余的分组。这样Group   By   个Having的开销小，查询快.对于大的数据行进行分组和Having十分消耗资源。如果Group   BY的目的不包括计算，只是分组，那么用Distinct更快  

38、一次更新多条记录比分多次更新每次一条快,就是说批处理好  

39、少用临时表，尽量用结果集和Table类性的变量来代替它,Table   类型的变量比临时表好  

40、在SQL2000下，计算字段是可以索引的，需要满足的条件如下：  

  a、计算字段的表达是确定的  
  b、不能用在TEXT,Ntext，Image数据类型  
  c、必须配制如下选项   ANSI_NULLS   =   ON,   ANSI_PADDINGS   =   ON,   …….  

41、尽量将数据的处理工作放在服务器上，减少网络的开销，如使用存储过程。存储过程是编译好、优化过、并且被组织到一个执行规划里、且存储在数据库中的 SQL语句，是控制流语言的集合，速度当然快。反复执行的动态SQL,可以使用临时存储过程，该过程（临时表）被放在Tempdb中。以前由于SQL   SERVER对复杂的数学计算不支持，所以不得不将这个工作放在其他的层上而增加网络的开销。SQL2000支持UDFs,现在支持复杂的数学计算，函数的返回值不要太大，这样的开销很大。用户自定义函数象光标一样执行的消耗大量的资源，如果返回大的结果采用存储过程  

42、不要在一句话里再三的使用相同的函数，浪费资源,将结果放在变量里再调用更快  

43、SELECT   COUNT(*)的效率教低，尽量变通他的写法，而EXISTS快.同时请注意区别：   select   count(Field   of   null)   from   Table   和   select   count(Field   of   NOT   null)   from   Table   的返回值是不同的。  

44、当服务器的内存够多时，配制线程数量   =   最大连接数+5，这样能发挥最大的效率；否则使用   配制线程数量 <最大连接数启用SQL   SERVER的线程池来解决,如果还是数量   =   最大连接数+5，严重的损害服务器的性能。  

45、按照一定的次序来访问你的表。如果你先锁住表A，再锁住表B，那么在所有的存储过程中都要按照这个顺序来锁定它们。如果你（不经意的）某个存储过程中先锁定表B，再锁定表A，这可能就会导致一个死锁。如果锁定顺序没有被预先详细的设计好，死锁很难被发现  

46、通过SQL   Server   Performance   Monitor监视相应硬件的负载   Memory:   Page   Faults   /   sec计数器如果该值偶尔走高，表明当时有线程竞争内存。如果持续很高，则内存可能是瓶颈。   Process:  

    1、%   DPC   Time   指在范例间隔期间处理器用在缓延程序调用(DPC)接收和提供服务的百分比。(DPC   正在运行的为比标准间隔优先权低的间隔)。   由于   DPC   是以特权模式执行的，DPC   时间的百分比为特权时间   百分比的一部分。这些时间单独计算并且不属于间隔计算总数的一部   分。这个总数显示了作为实例时间百分比的平均忙时。  
    2、%Processor   Time计数器　如果该参数值持续超过95%，表明瓶颈是CPU。可以考虑增加一个处理器或换一个更快的处理器。  
    3、%   Privileged   Time   指非闲置处理器时间用于特权模式的百分比。(特权模式是为操作系统组件和操纵硬件驱动程序而设计的一种处理模式。它允许直接访问硬件和所有内存。另一种模式为用户模式，它是一种为应用程序、环境分系统和整数分系统设计的一种有限处理模式。操作系统将应用程序线程转换成特权模式以访问操作系统服务)。   特权时间的   %   包括为间断和   DPC   提供服务的时间。特权时间比率高可能是由于失败设备产生的大数量的间隔而引起的。这个计数器将平均忙时作为样本时间的一部分显示。  
    4、%   User   Time表示耗费CPU的数据库操作，如排序，执行aggregate   functions等。如果该值很高，可考虑增加索引，尽量使用简单的表联接，水平分割大表格等方法来降低该值。   Physical   Disk:   Curretn   Disk   Queue   Length计数器该值应不超过磁盘数的1.5~2倍。要提高性能，可增加磁盘。   SQLServer:Cache   Hit   Ratio计数器该值越高越好。如果持续低于80%，应考虑增加内存。   注意该参数值是从SQL   Server启动后，就一直累加记数，所以运行经过一段时间后，该值将不能反映系统当前值。  

47、分析select   emp_name   form   employee   where   salary   >   3000   在此语句中若salary是Float类型的，则优化器对其进行优化为Convert(float,3000)，因为3000是个整数，我们应在编程时使用3000.0而不要等运行时让DBMS进行转化。同样字符和整型数据的转换。
#T=Store Proc Exec Count
;with T
as
(
	SELECT
		a.PLAN_HANDLE as [PLAN_HANDLE]
		, DB_NAME(b.DBID) AS [DBNAME]
		, OBJECT_SCHEMA_NAME(b.OBJECTID, b.DBID) AS [SCHEMA]
		, OBJECT_NAME(b.OBJECTID, b.DBID) AS [STORED PROC]
		, a.USECOUNTS as [USECOUNTS]
	FROM
		SYS.DM_EXEC_CACHED_PLANS a
			CROSS APPLY
				SYS.DM_EXEC_SQL_TEXT(a.PLAN_HANDLE) b
	WHERE
		DB_NAME(b.DBID) IS NOT NULL
		AND a.OBJTYPE = 'PROC' 
)
select
	[DBNAME]
	, [SCHEMA]
	, [STORED PROC]
	, max([USECOUNTS])
from
	T
GROUP BY
	PLAN_HANDLE
	, [DBNAME]
	, [SCHEMA]
	, [STORED PROC]
ORDER BY
	4
		DESC

#T=stuff XML Path
select
	stuff
		(
			(
				select
					',' + a.Name
				from
					sys.objects a
				FOR XML PATH('')
			)
			, 1
			, 1
			, ''
		)

#T=Table FileGroup
-- SQL 2012 +
-- The following two queries return information about 
-- which objects belongs to which filegroup
SELECT 
	OBJECT_NAME(i.[object_id]) AS [ObjectName]
	,i.[index_id] AS [IndexID]
	,i.[name] AS [IndexName]
	,i.[type_desc] AS [IndexType]
	,i.[data_space_id] AS [DatabaseSpaceID]
	,f.[name] AS [FileGroup]
	,d.[name] as [FileName]
	,d.[physical_name] AS [FullPathFileName]
FROM
	[sys].[indexes] i
		INNER JOIN
			[sys].[filegroups] f
				ON
					f.[data_space_id] = i.[data_space_id]
		INNER JOIN
			[sys].[database_files] d
				ON
					f.[data_space_id] = d.[data_space_id]
		INNER JOIN
			[sys].[data_spaces] s
				ON
					f.[data_space_id] = s.[data_space_id]
WHERE
	OBJECTPROPERTY(i.[object_id], 'IsUserTable') = 1
ORDER BY
	OBJECT_NAME(i.[object_id])
	,i.index_id
	,f.[name]
	,i.[data_space_id]

--SQL 2005
select
	'Object Name' =
					case si.IndID
						when 1
							then so.Name 
						else
							si.Name
					end
	, 'Object Type' =
						case 
							when si.IndID < 2
								then 'Table'
							else
								'Index'
						end
	, 'Table Name' =
						case
							when si.IndID > 1
								then so.Name
							else ' '
						end
	, 'FileGroup Name' = sfg.GroupName
	, 'System FileName' = sf.Name
from
	sysfilegroups sfg
		inner join
			sysfiles sf
				on
					sfg.groupid = sf.groupid
		inner join
			sysindexes si
				on
					sfg.groupid = si.groupid
		inner join
				sysobjects so
					on
						si.id = so.id
where
	so.type = 'U'
	and si.Name not like '#_%' escape '#'
	and so.Name not in ('dtproperties')
 order by
	2 desc
	, 3
	, 1
#T=table scan DMV
-- Get all SQL Statements with "table scan" in cached query plan 
;WITH  
 XMLNAMESPACES 
    (DEFAULT N'http://schemas.microsoft.com/sqlserver/2004/07/showplan'   
            ,N'http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS ShowPlan)  
,EQS AS 
    (SELECT EQS.plan_handle 
           ,SUM(EQS.execution_count) AS ExecutionCount 
           ,SUM(EQS.total_worker_time) AS TotalWorkTime 
           ,SUM(EQS.total_logical_reads) AS TotalLogicalReads 
           ,SUM(EQS.total_logical_writes) AS TotalLogicalWrites 
           ,SUM(EQS.total_elapsed_time) AS TotalElapsedTime 
           ,MAX(EQS.last_execution_time) AS LastExecutionTime 
     FROM sys.dm_exec_query_stats AS EQS 
     GROUP BY EQS.plan_handle)    
SELECT EQS.[ExecutionCount] 
      ,EQS.[TotalWorkTime] 
      ,EQS.[TotalLogicalReads] 
      ,EQS.[TotalLogicalWrites] 
      ,EQS.[TotalElapsedTime] 
      ,EQS.[LastExecutionTime] 
      ,ECP.[objtype] AS [ObjectType] 
      ,ECP.[cacheobjtype] AS [CacheObjectType] 
      ,DB_NAME(EST.[dbid]) AS [DatabaseName] 
      ,OBJECT_NAME(EST.[objectid], EST.[dbid]) AS [ObjectName] 
      ,EST.[text] AS [Statement]       
      ,EQP.[query_plan] AS [QueryPlan] 
FROM sys.dm_exec_cached_plans AS ECP 
     INNER JOIN EQS 
         ON ECP.plan_handle = EQS.plan_handle      
     CROSS APPLY sys.dm_exec_sql_text(ECP.[plan_handle]) AS EST 
     CROSS APPLY sys.dm_exec_query_plan(ECP.[plan_handle]) AS EQP 
WHERE EQP.[query_plan].exist('data(//RelOp[@PhysicalOp="Table Scan"][@EstimateRows * @AvgRowSize > 50000.0][1])') = 1 
      -- Optional filters 
      AND EQS.[ExecutionCount] > 1  -- No Ad-Hoc queries 
      AND ECP.[usecounts] > 1 
ORDER BY EQS.TotalElapsedTime DESC 
        ,EQS.ExecutionCount DESC;
#T=TableDiff Command line
DECLARE
    @User sysname, @Pwd sysname, @lock sysname,
    @Source nvarchar(1000), @Destination nvarchar(1000)
 
-- set parameters on here
SELECT
    @User = '',
    @Pwd = '',
    @lock = 'HOLDLOCK',
    @Source = N'publisher.pubs..titles',
    @Destination = N'subscriber.pubs..titles'
 
SELECT 'tablediff'
    + ' /sourceserver' + QUOTENAME(sSrv, '"')
    + ' /sourcedatabase' + QUOTENAME(sDb, '"')
    + ' /sourceschema' + QUOTENAME(sSch, '"')
    + ' /sourcetable' + QUOTENAME(sTb, '"')
    + CASE 
        WHEN @lock IS NULL OR @lock = '' THEN ''
        ELSE ' /sourcelocked' + QUOTENAME(@lock, '"') END
    + CASE 
        WHEN @User IS NULL OR @User = '' THEN ''
        ELSE ' /sourceuser' + QUOTENAME(@User, '"')
            + ' /sourcepassword' + QUOTENAME(@Pwd, '"')
        END
 
    + ' /destinationserver' + QUOTENAME(dSrv, '"')
    + ' /destinationdatabase' + QUOTENAME(dDb, '"')
    + ' /destinationschema' + QUOTENAME(dSch, '"')
    + ' /destinationtable' + QUOTENAME(dTb, '"')
    + CASE 
        WHEN @lock IS NULL OR @lock = '' THEN ''
        ELSE ' /destinationlocked' + QUOTENAME(@lock, '"') END
    + CASE 
        WHEN @User IS NULL OR @User = '' THEN ''
        ELSE ' /destinationuser' + QUOTENAME(@User, '"')
            + ' /destinationpassword' + QUOTENAME(@Pwd, '"')
        END
 
-- + ' /q' 
-- + ' /c'
-- + ' /strict'
 
-- + ' /b"8000"'
 
-- + ' /bf"10000"'
-- + ' /f"c:\syn.sql"'
 
-- + ' /o"c:\output.txt"'
 
-- + ' /et"TableDiffResult"'
-- + ' /dt'
 
-- + ' /rc"3"' 
-- + ' /ri"300"'
-- + ' /t"15"'
FROM(
    SELECT 
        sSrv = ISNULL(PARSENAME(Source, 4), N'localhost'),
        sDb = ISNULL(PARSENAME(Source, 3), N'master'),
        sSch = ISNULL(PARSENAME(Source, 2), N'dbo'),
        sTb = ISNULL(PARSENAME(Source, 1), N'notable'),
        dSrv = ISNULL(PARSENAME(Destination, 4), N'localhost'),
        dDb = ISNULL(PARSENAME(Destination, 3), N'master'),
        dSch = ISNULL(PARSENAME(Destination, 2), N'dbo'),
        dTb = ISNULL(PARSENAME(Destination, 1), N'notable')
    FROM(
        SELECT 
            Source = @Source, Destination = @Destination
    )A
)A


#T=Transactions Monitor
SELECT
	DMES.host_name AS 'Computer Name'
	, nt_user_name AS 'Windows Username'
	, mdsd.NAME AS 'Database with open Transaction'
	, DMES.session_id AS 'Session ID'
	, spn.open_tran
		--CASE
		--	WHEN
		--		spn.open_tran = 0
		--		THEN
		--			'There are no open transactions currently running on the' + ' ' + @databasename + ' ' + 'Database'
		--	WHEN
		--		spn.open_tran = 1
		--		THEN
		--			'There is 1 open transaction currently running on the' + ' ' + @databasename + ' ' + 'Database'
		--	WHEN
		--		spn.open_tran = 2
		--		THEN
		--			'There are 2 or more open transactions currently running on the' + ' ' + @databasename + ' ' + 'Database'
		--	WHEN
		--		spn.open_tran >= 3
		--		THEN
		--			'There are 3 or more open transactions currently running on the' + ' ' + @databasename + ' ' + 'Database'
		--END AS 'Open Transactions'
	, dmes.open_transaction_count
	, RTRIM(CAST(DMES.login_time AS NVARCHAR(30))) AS 'Date The Query window opened'
	,
		CASE
			WHEN
				DMES.is_user_process = 0
				THEN
					'No'
			WHEN
				DMES.is_user_process = 1
				THEN
					'Yes'
		END AS 'User Process'
	,
		CASE
			WHEN
				DMES.transaction_isolation_level = 0
				THEN
					'Unspecified'
			WHEN
				DMES.transaction_isolation_level = 1
				THEN
					'Read Uncommitted'
			WHEN
				DMES.transaction_isolation_level = 2
				THEN
					'Read Committed'
			WHEN
				DMES.transaction_isolation_level = 3
				THEN
					'Repeatable Read'
			WHEN
				DMES.transaction_isolation_level = 4
				THEN
					'Serializable'
			WHEN
				DMES.transaction_isolation_level = 5
				THEN
					'Snapshot'
		END AS 'Transaction Isolation Level'
	,
		CASE
			WHEN
				DMES.LOCK_TIMEOUT = '-1'
				THEN
					'No lock time out specified, the lock will expire when the transaction has completed'
			WHEN
				DMES.LOCK_TIMEOUT >= 0
				THEN
					' A Lockout Time of'
					+ ' '
					+ CAST(CONVERT(REAL, (DMES.LOCK_TIMEOUT) / (1000.00)) AS VARCHAR(MAX))
					+ ' '
					+ 'Seconds has been specified'
		END AS 'Lock Timeout'
FROM
	master..sysprocesses AS spn
		JOIN
			sys.dm_exec_sessions AS DMES
				ON DMES.session_id = spn.spid
		JOIN
			master.dbo.sysdatabases mdsd
				ON spn.dbid = mdsd.dbid
WHERE
	DMES.session_id = spn.spid
	--AND mdsd.NAME = @databasename
	AND spn.open_tran <> 0

#T=Trigger for DDL
CREATE TABLE [dbo].[zObjectsChangesLogsHistory]
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [sysname] NULL,
	[EventType] [varchar](50) NULL,
	[ObjectName] [varchar](256) NULL,
	[ObjectType] [varchar](25) NULL,
	[TSQLCommand] [nvarchar](max) NULL,
	[LoginName] [varchar](256) NULL,
	[HostName] [varchar](256) default(Host_Name()),
	[PostTime] [datetime] default(getdate()),
	[Version] [int] NOT NULL
) ON [PRIMARY]

GO

CREATE TRIGGER [ztrigger_ddl]
	ON DATABASE
	FOR
		CREATE_PROCEDURE
		, ALTER_PROCEDURE
		, DROP_PROCEDURE
		, CREATE_TABLE
		, ALTER_TABLE
		, DROP_TABLE
		, CREATE_FUNCTION
		, ALTER_FUNCTION
		, DROP_FUNCTION
		, CREATE_TRIGGER
		, ALTER_TRIGGER
		, DROP_TRIGGER
		, CREATE_VIEW
		, ALTER_VIEW
		, DROP_VIEW
		, CREATE_INDEX
		, ALTER_INDEX
		, DROP_INDEX
		, CREATE_TYPE
		, DROP_TYPE
AS
begin
--SET NOCOUNT ON
DECLARE
		@DatabaseName varchar(256)
		, @EventType varchar(50)
		, @ObjectName varchar(256)
		, @ObjectType varchar(25)
		, @TSQLCommand nvarchar(max)
		, @LoginName varchar(256)
--		, @SPID int

DECLARE @data XML = EVENTDATA()
set @DatabaseName = @data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)')
			--,@EventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
set @ObjectName = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)')
			--,@ObjectType = @data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(25)') 
			--,@TSQLCommand = @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)') 
			--,@LoginName = @data.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)')
			--,@SPID = @data.value('(/EVENT_INSTANCE/SPID)[1]', 'int')
INSERT INTO
		[zObjectsChangesLogsHistory]
		(
			DatabaseName
			, EventType
			, ObjectName
			, ObjectType
			, TSQLCommand
			, LoginName
			--, HostName
			--, PostTime
			, [Version]
		)
--select
values
		(
			@DatabaseName		-- = @data.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(256)')
			, @data.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
			, @ObjectName		--= @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(256)')
			, @data.value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(25)') 
			, @data.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)') 
			, @data.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)')
			--, @SPID	= @data.value('(/EVENT_INSTANCE/SPID)[1]', 'int')
			--, HOST_NAME()
			--, GETDATE()
			,
				(
					select
						isnull(max(version), 0) + 1
					from
						[zObjectsChangesLogsHistory]
					where
						DatabaseName = @DatabaseName
						and ObjectName = @ObjectName
				)
		)
		
END

GO

DISABLE TRIGGER [ztrigger_ddl] ON DATABASE
GO

ENABLE TRIGGER [ztrigger_ddl] ON DATABASE

#T=T-SQL: 17 个与日期时间相关的自定义函数(UDF)
/*
T-SQL: 17 个与日期时间相关的自定义函数(UDF),周日作为周的最后一天,均不受 @@DateFirst、语言版本影响
都是从老文章里收集或提炼出来的!
提示:
(@@Datefirst + datepart(weekday,@Date)) % 7 判断周几是最保险的! 与 @@DateFirst 无关,与语言版本无关
@@DateFirst 可能会导致 datepart(weekday,@Date) 不一样!
无论 @@DateFirst 等于几,无论是什么语言版本的 SQL Server 下面永远恒成立!
(@@Datefirst + datepart(weekday,@Date))%7 : 2、3、4、5、6、0、1 分别代表 周一 到 周日
-- */

create function udf_GetAge(@StartDate datetime,@EndDate datetime)
returns integer
-- 返回精确年龄 select dbo.udf_GetAge('1949-10-01',getdate())
begin
return datediff(year,@StartDate,@EndDate)
	   - case when datediff(day,dateadd(year,datediff(year,@StartDate,@EndDate),@StartDate),@EndDate) >= 0
				   then 0
			  else
				   1
		 end
end

go

create function udf_DaysOfYearByDate(@Date datetime)
returns integer
-- 返回年的天数 可判断 平(365)、润(366) 年
begin
return datediff(day,dateadd(year,datediff(year,0,@Date),0),dateadd(year,datediff(year,0,@Date) + 1,0))
end

go

create function udf_DaysOfYear(@Year integer)
returns integer
-- 返回年的天数 可判断 平(365)、润(366) 年
begin
return datediff(day,dateadd(year,@year - year(0),0),dateadd(year,@year - year(0) + 1,0))
end

go

create function udf_HalfDay(@Date datetime)
returns datetime
-- 返回 @Date 是 上午 返回 @Date 的零点,@Date 是 下午 返回 @Date 的十二点
begin
return case when datepart(hour,@Date) < 12
				 then dateadd(day,datediff(day,0,@Date),0) --上午归到 零点
			else
				 dateadd(hour,12,dateadd(day,datediff(day,0,@Date),0)) --下午归到 十二点
	   end
end

go

create function udf_WeekDiff(@StartDate datetime,@EndDate datetime)
returns integer
-- 返回 [@StartDate , @EndDate] 之间周数 周日是当周的最后一天
begin
return datediff(week,@StartDate,@EndDate) -- + 1
	   + case when (@@Datefirst + datepart(weekday,@StartDate)) % 7 = 1
				   then 1
			  else
				   0
		 end
	   - case when (@@Datefirst + datepart(weekday,@EndDate)) % 7 = 1
				   then 1
			  else 0
		 end
end

go

create function udf_WeekOfMonth(@Date datetime)
-- 返回 @Date 是所在月的第几周 周日是当周的最后一天
returns integer
begin
return datediff(week
				,case when (@@Datefirst + datepart(weekday,dateadd(month,datediff(month,0,@Date),0))) % 7 = 1
						   then dateadd(month,datediff(month,0,@Date),0) - 1
					  else
						   dateadd(month,datediff(month,0,@Date),0)
					  end
				,case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1
						   then @Date-1
					  else @Date
				 end
			   ) + 1
end

go

create function udf_WeekOfQuarter(@Date datetime)
-- 返回 @Date 是所在季度的第几周 周日是当周的最后一天
returns int
begin
return datediff(week
				,case when (@@Datefirst + datepart(weekday,dateadd(Quarter,datediff(Quarter,0,@Date),0))) % 7 = 1
						   then dateadd(Quarter,datediff(Quarter,0,@Date),0) - 1
					  else
						   dateadd(Quarter,datediff(Quarter,0,@Date),0)
				 end
				,case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1
						   then @Date - 1
					  else
						   @Date
				 end
			   ) + 1
end

go

create function udf_WeekOfYear(@Date datetime)
-- 返回 @Date 是所在年的第几周 周日是当周的最后一天
returns int
begin
return datediff(week
				,case when (@@Datefirst + datepart(weekday,dateadd(day,0,datediff(day,0,dateadd(year,datediff(year,0,@Date),0))))) % 7 = 1
						   then dateadd(day,-1,dateadd(day,0,datediff(day,0,dateadd(year,datediff(year,0,@Date),0))))
					  else
						   dateadd(day,0,datediff(day,0,dateadd(year,datediff(year,0,@Date),0))) --date 所在年的第一天 即: 一月一号
				 end
				,case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1
						   then dateadd(day,-1,@Date)
					  else
						   @Date
				 end
			   ) + 1
end

go

create function udf_WeekDay(@ int,@Date datetime)
returns datetime
-- 返回 @Date 所在周的其他天 周一 到 周日 也就是映射到 所在周的其他天 周日是当周的最后一天
begin
/*
--周日算作(上一)周的最后一天
 当 @ <= 1 代表将 @Date 映射到 所在周的星期一
 当 @ = 2 代表将 @Date 映射到 所在周的星期二
 当 @ = 3 代表将 @Date 映射到 所在周的星期三
 当 @ = 4 代表将 @Date 映射到 所在周的星期四
 当 @ = 5 代表将 @Date 映射到 所在周的星期五
 当 @ = 6 代表将 @Date 映射到 所在周的星期六
 当 @ >= 7 代表将 @Date 映射到 所在周的星期日
 可用于按周汇总 Group by,均支持跨年跨月数据
*/
return dateadd(day
			   ,case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 0 --周六
						  then case when @ between 1 and 6
										 then @ - 6
									else
										 1
							   end
					 when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1 --周日(七)
						  then case when @ between 1 and 6
										 then @ - 7
									else
										 0
							   end
					 when (@@Datefirst + datepart(weekday,@Date)) % 7 between 2 and 6 --周一至周五
						  then case when @ between 1 and 6
										 then @ + 1 - (@@Datefirst + datepart(weekday,@Date)) % 7
									else
										 8 - (@@Datefirst + datepart(weekday,@Date)) % 7
							   end
				end
			   ,@Date)
end

go

create function udf_WeekdayDiff(@Weekday integer,@StartDate datetime,@EndDate datetime)
returns integer
-- 返回 [@StartDate , @EndDate] 之间周一 到 周日的个数 周日是当周的最后一天
begin
-- @Weekday: 1: Monday , ... ,7: Sunday
return datediff(week,@StartDate,@EndDate)
	   + case when (@@Datefirst + datepart(weekday,@StartDate)) % 7
				   + case when (@@Datefirst + datepart(weekday,@StartDate)) % 7 = 0
							   then 7
						  else
							   0
					 end > @Weekday % 7 + 1
				   then 0
			  else 1
		 end
	   - case when (@@Datefirst + datepart(weekday,@EndDate)) % 7
				   + case when (@@Datefirst + datepart(weekday,@EndDate)) % 7 = 0
							   then 7
						  else 0
					 end >= @Weekday % 7 + 1
				   then
						0
			  else
				   1
		 end
/* test:

declare @b datetime
declare @e datetime

set @b = '2004-01-29'
set @e = '2004-09-05'

select @b as BeginDate ,@e as EndDate
,dbo.udf_WeekdayDiff(1,@b,@e) as CountOfMonday
,dbo.udf_WeekdayDiff(2,@b,@e) as CountOfTuesday
,dbo.udf_WeekdayDiff(3,@b,@e) as CountOfWednesday
,dbo.udf_WeekdayDiff(4,@b,@e) as CountOfThursday
,dbo.udf_WeekdayDiff(5,@b,@e) as CountOfFriday
,dbo.udf_WeekdayDiff(6,@b,@e) as CountOfSaturday
,dbo.udf_WeekdayDiff(7,@b,@e) as CountOfSunday
*/
end

go

create function udf_WeekdayID(@Date datetime)
returns integer
-- 返回 @Date 是 Monday 返回 1, ... ,是 Sunday 返回 1
begin
--1: Monday , ... ,7: Sunday
return (@@Datefirst + datepart(weekday,@Date)) % 7
	   + case when (@@Datefirst + datepart(weekday,@Date)) % 7 < 2
				   then 6
			  else
				   -1
		 end
end

go

create function udf_DayOfQuarter(@Date datetime)
-- 返回 @Date 是所在季度的第几天
returns integer
as
begin
/*
declare @date datetime
set @date = '2004-4-1'
--*/
return datediff(day
			   ,dateadd(Quarter,datediff(Quarter,0,@Date),0)
			   ,@Date
			   ) + 1
end

go

create function udf_DaysOfQuarterByDate(@Date datetime)
-- 返回 @Date 所在季度的天数
returns integer
begin
/*
declare @date datetime
set @date = '2004-4-1'
--*/
return datediff(day
			   ,dateadd(Quarter,datediff(Quarter,0,@Date),0)
			   ,dateadd(Quarter,datediff(Quarter,0,@Date) + 1,0)
			   )
end

go

create function udf_NextWorkDate(@Date datetime)
returns datetime
-- 返回 @Date 的下一个工作日
begin
/*
declare @i int
set @i = 3
declare @Date datetime
set @Date = '2005-01-02'
-- */
return case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 6 -- Friday
				 then dateadd(day,3,@Date)
			when (@@Datefirst + datepart(weekday,@Date)) % 7 = 0 -- saturday
				 then dateadd(day,2,@Date)
			else
				 dateadd(day,1,@Date)
	   end
end

go

create function udf_PreviousWorkDate(@Date datetime)
returns datetime
-- 返回 @Date 的上一个工作日
begin
/*
declare @i int
set @i = 3
declare @Date datetime
set @Date = '2005-01-02'
-- */
return case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 2 -- Monday
				 then dateadd(day,-3,@Date)
			when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1 -- Sunday
				 then dateadd(day,-2,@Date)
			else
				 dateadd(day,-1,@Date)
	   end
end

go

create function udf_WorkDateAdd(@i integer,@Date datetime)
returns datetime
-- 返回 @Date 加上一段 @i 个工作日的新值
begin
declare @ int
set @ = 0
while @ < abs(@i)
begin
   set @Date = case when @i >= 0
						 then --dbo.udf_nextworkdate(@Date)
							  case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 6 -- Friday
										then @date + 3 --dateadd(day,3,@Date)
								   when (@@Datefirst + datepart(weekday,@Date)) % 7 = 0 -- saturday
										then  @date + 2 --dateadd(day,2,@Date)
								   else
										 @date + 1 --dateadd(day,1,@Date)
							  end
					else
						 --dbo.udf_previousworkdate(@Date)
						 case when (@@Datefirst + datepart(weekday,@Date)) % 7 = 2 -- Monday
								   then  @date - 3 --dateadd(day,-3,@Date)
							  when (@@Datefirst + datepart(weekday,@Date)) % 7 = 1 -- Sunday
								   then  @date - 2  --dateadd(day,-2,@Date)
							  else
									@date - 1 --dateadd(day,-1,@Date)
						 end
			   end
			   set @ = @ + 1
end
return @Date
end

go

create function udf_GetStar (@ datetime)
returns varchar(100)
-- 返回日期所属星座,如果有静态的 星座对照码表 直接在查询中 join 效率相对更高
begin
return
(
--declare @ datetime
--set @ = getdate()
select max(star)
from
(
select '魔羯座' as star,1 as [month],1 as [day]
union all select '水瓶座',1,20
union all select '双鱼座',2,19
union all select '牡羊座',3,21
union all select '金牛座',4,20
union all select '双子座',5,21
union all select '巨蟹座',6,22
union all select '狮子座',7,23
union all select '处女座',8,23
union all select '天秤座',9,23
union all select '天蝎座',10,24
union all select '射手座',11,22
union all select '魔羯座',12,22
) stars
where dateadd(month,[month] - 1,dateadd(year,year(@) - year(0),0)) + [day] - 1 =
(
select max(dateadd(month,[month] - 1,dateadd(year,year(@) - year(0),0)) + [day] - 1)
from (
select '魔羯座' as star,1 as [month],1 as [day]
union all select '水瓶座',1,20
union all select '双鱼座',2,19
union all select '牡羊座',3,21
union all select '金牛座',4,20
union all select '双子座',5,21
union all select '巨蟹座',6,22
union all select '狮子座',7,23
union all select '处女座',8,23
union all select '天秤座',9,23
union all select '天蝎座',10,24
union all select '射手座',11,22
union all select '魔羯座',12,22
) stars
where @ >= dateadd(month,[month] - 1,dateadd(year,year(@) - year(0),0)) + [day] - 1
)
)
end
go
-- 注意这里用 40 足够了,因为每个月至多才 31 天
select a.birthdate,b.star
from employees a
left join
(
select a.*,isnull(b.month,12) as m,isnull(b.day,31) as d
from stars a
left join stars b
on a.month * 40 + a.day < b.month * 40 + b.day
and b.month * 40 + b.day  = (select min(month * 40 + day) from stars where month * 40 + day > a.month * 40 + a.day)
) b
on month(a.birthdate) * 40 + day(a.birthdate) >= b.month * 40 +  b.day
and month(a.birthdate) * 40 + day(a.birthdate) < b.m * 40 +  b.d


select e.birthdate,a.star
from employees e
left join stars a
on month(e.birthdate) * 40 + day(e.birthdate) >= a.month * 40 + a.day
left join stars b
on a.month * 40 + a.day < b.month * 40 + b.day
and b.month * 40 + b.day  = (select min(month * 40 + day) from stars where month * 40 + day > a.month * 40 + a.day)
where month(e.birthdate) * 40 + day(e.birthdate) < isnull(b.month * 40 + b.day,999)

select *
from stars a
left join stars b
on a.month * 40 + a.day < b.month * 40 + b.day
and b.month * 40 + b.day  = (select min(month * 40 + day) from stars where month * 40 + day > a.month * 40 + a.day)
go
--周历
declare @ datetime
set @ = getdate()

select @ +
case when (@@Datefirst + datepart(weekday,@)) % 7 = 0 --周六
		  then -5
	 when (@@Datefirst + datepart(weekday,@)) % 7 = 1 --周日(七)
		  then -6
	 when (@@Datefirst + datepart(weekday,@)) % 7 between 2 and 6 --周一至周五
		  then 2 - (@@Datefirst + datepart(weekday,@)) % 7
end + N.i
from
(
select 0 as i
union all select 1 union all select 2 union all select 3
union all select 4 union all select 5 union all select 6
union all select 7
) N

//csc noname1.cs
// 装配脑袋 作 C# 计算任意时段内的 之间周一 到 周日的个数 周日是当周的最后一天
using System;
public class Class1
{
 static void Main(string[] args)
 {
  System.Console.WriteLine("Hello World");
  System.DateTime Start = System.DateTime.Parse("2005-3-6");
  System.DateTime End = System.DateTime.Parse("2005-3-7");
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Monday,Start,End)); //周一
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Tuesday,Start,End));
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Wednesday,Start,End));
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Thursday,Start,End));
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Friday,Start,End));
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Saturday,Start,End));
  System.Console.WriteLine(WeekdaysIn(DayOfWeek.Sunday,Start,End)); //周七(日)
  System.Console.ReadLine();
 }
 private static int WeekdaysIn(DayOfWeek Weekday, DateTime StartDate, DateTime EndDate)
 {
  int d = (EndDate - StartDate).Days;
  int w = d / 7;
  int offset = (int) StartDate.DayOfWeek + d % 7;
  if ((int) Weekday < (int) StartDate.DayOfWeek)
  {
   Weekday = (DayOfWeek)((int) Weekday + 7);
  }
  if ((int)Weekday <= offset)
  {
   w ++;
  }
  return w;
 }
}

#T=UDT Anti SQL Inject
--In('a','b','c') 转换为 in (select colname from @Table)

D-- ================================
-- Create User-defined Table Type
-- ================================
USE Test
GO
-- Create the data type
CREATE TYPE dbo.MyType AS TABLE 
(
	col1 int NOT NULL, 
	col2 varchar(20) NULL, 
	col3 datetime NULL, 
	PRIMARY KEY (col1)
)
GO


DECLARE @MyTable MyType
INSERT INTO @MyTable(col1,col2,col3)
VALUES (1,'abc','1/1/2000'),
	(2,'def','1/1/2001'),
	(3,'ghi','1/1/2002'),
	(4,'jkl','1/1/2003'),
	(5,'mno','1/1/2004')
	
SELECT * FROM @MyTable 

go
CREATE PROC usp_test @MyTableParam MyType READONLY
as
begin
	select *
	from [Table_1]
	where f2 in(select col1 FROM @MyTableParam)
end	
GO

'Create a local table
Dim table As New DataTable("temp")
Dim col1 As New DataColumn("col1", System.Type.GetType("System.Int32"))
Dim col2 As New DataColumn("col2", System.Type.GetType("System.String"))
Dim col3 As New DataColumn("col3", System.Type.GetType("System.DateTime"))
table.Columns.Add(col1)
table.Columns.Add(col2)
table.Columns.Add(col3)
		
'Populate the table
For i As Integer = 20 To 30
	Dim vals(2) As Object
	vals(0) = i
	vals(1) = Chr(i + 90)
	vals(2) = System.DateTime.Now
	table.Rows.Add(vals)
Next

'Code
'Create a command object that calls the stored proc
Dim command As New SqlCommand("usp_AddRowsToMyTable", conn)
command.CommandType = CommandType.StoredProcedure

'Create a parameter using the new type
Dim param As SqlParameter = command.Parameters.Add("@MyTableParam", SqlDbType.Structured)
command.Parameters.AddWithValue("@UserID", "Kathi")

Code
'Set the value of the parameter
param.Value = table

'Execute the query
command.ExecuteNonQuery()
#T=WildCard * 通配符 优先级
declare  @F1 varchar(10) = 'a'
		,@F2 varchar(10) = 'b'
		,@F3 varchar(10) = 'c5'
;with T
as
(
	select 'a' as F1,'b' as F2,'c' as F3
	union all
	select 'a','b','*'
	union all
	select 'a','*','c'
	union all
	select '*','b','c'
	union all
	select 'a','*','*'
	union all
	select '*','b','*'
	union all
	select '*','*','c'
	union all
	select '*','*','*'
	union all
	select 'a1','b1','*'
	union all
	select 'a1','*','c1'
	union all
	select '*','b1','c1'
	union all
	select 'a1','*','*'
	union all
	select '*','b1','*'
	union all
	select '*','*','c1'
)
, T2
as
(
	select
		a.*
		,
			case
				when
					a.F1 = @F1 and a.F1 != '*'
						then
							3
				when
					a.F1 = '*' or a.F1 is null
						then
							2
				when
					a.F1 != @F1 and a.F1 != '*'
						then
							1
			end						as C1
		,
			case
				when
					a.F2 = @F2 and a.F2 != '*'
						then
							3
				when
					a.F2 = '*' or a.F2 is null
						then
							2
				when
					a.F2 != @F2 and a.F2 != '*'
						then
							1
			end						as C2
		,
			case
				when
					a.F3 = @F3 and a.F3 != '*'
						then
							3
				when
					a.F3 = '*' or a.F3 is null
						then
							2
				when
					a.F3 != @F3 and a.F3 != '*'
						then
							1
			end						as C3
	from
		T	a
	where
		a.F1 in ('*', @F1)
		and
		a.F2 in ('*', @F2)
		and
		a.F3 in ('*', @F3)
)
select
	a.*
	, a.C1 * 100 + a.C2 * 10 + a.C3 as FF
from
	T2 a
where
	a.F1 in ('*', @F1)
	and
	a.F2 in ('*', @F2)
	and
	a.F3 in ('*', @F3)
order by
	a.C1 desc
	, a.C2 desc
	, a.C3 desc

#T=XQuery
--建测试表
create table #testTable (UserID int,UserName varchar(50))
--插测试数据
insert into #testTable(UserID,UserName) values (1,'aaa')
insert into #testTable(UserID,UserName) values (2,'aaa')
insert into #testTable(UserID,UserName) values (3,'aaa')
insert into #testTable(UserID,UserName) values (4,'aaa')

declare @ids xml
set @ids = cast('<ids><id>1</id><id>2</id><id>3</id></ids>' as xml)

select A.* from TestUser A
	inner join
	(
		select X.c.value('.', 'int') as UserID 
			from @ids.nodes('/ids/id') as X(c)
	) B on A.UserID = B.UserID 
	
	
drop table #testTable
#T=一道褒贬不一的SQL考试题
二维关系表 T(F1,F2,F3,F4,F5,F6,F7) 表示如下关系:
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│  学生ID  │ 学生姓名 │  课程ID  │ 课程名称 │   成绩   │  教师ID  │ 教师姓名 │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S3    │   王五   │    K4    │   政治   │    53    │    T4    │  赵老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S1    │   张三   │    K1    │   数学   │    61    │    T1    │  张老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S2    │   李四   │    K3    │   英语   │    88    │    T3    │  李老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S1    │   张三   │    K4    │   政治   │    77    │    T4    │  赵老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S2    │   李四   │    K4    │   政治   │    67    │    T5    │  周老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S3    │   王五   │    K2    │   语文   │    90    │    T2    │  王老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S3    │   王五   │    K1    │   数学   │    55    │    T1    │  张老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S1    │   张三   │    K2    │   语文   │    81    │    T2    │  王老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S4    │   赵六   │    K2    │   语文   │    59    │    T1    │  王老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S1    │   张三   │    K3    │   英语   │    37    │    T3    │  李老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│    S2    │   李四   │    K1    │   数学   │    81    │    T1    │  张老师  │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│   ....   │          │          │          │          │          │          │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│   ....   │          │          │          │          │          │          │
└─────┴─────┴─────┴─────┴─────┴─────┴─────┘


请以一句 T-SQL (Ms SQL Server) 或 Jet SQL (Ms Access) 作答! 
1.如果 T 表还有一字段 F0 数据类型为自动增量整型(唯一,不会重复), 
 而且 T 表中含有除 F0 字段外,请删除其它字段完全相同的重复多余的脏记录数据(要保留其中的一条): 


2.查询列印各科成绩最高和最低的记录: (就是各门课程的最高、最低分的学生和老师) 
 课程ID,课程名称,最高分,学生ID,学生姓名,教师ID,教师姓名,最低分,学生ID,学生姓名,教师ID,教师姓名 


3.按成绩从高到低顺序,查询列印所有学生四门(数学,语文,英语,政治)课程成绩: (就是每个学生的四门课程的成绩单) 
 学生ID,学生姓名,数学,语文,英语,政治,有效课程数,有效平均分 
 (注: 有效课程即在 T 表中有该学生的成绩记录,如不明白可不列印"有效课程数"和"有效平均分") 


4.查询列印数学成绩第 10 名到第 15 名的学生成绩单 
 或列印平均成绩第 10 名到第 15 名的学生成绩单 
 [学生ID],[学生姓名],数学,语文,英语,政治,平均成绩 


5.按各科不及格率的百分数从低到高和平均成绩从高到低顺序,查询统计列印各科平均成绩和不及格率的百分数(用"N行"表示): (就是分析哪门课程难) 
 课程ID,课程名称,平均成绩,及格百分数 


6.查询列印四门课程平均成绩和及格率的百分数(用"1行4列"表示): (就是分析哪门课程难) 
 数学平均分,数学及格百分数,语文平均分,语文及格百分数,英语平均分,英语及格百分数,政治平均分,政治及格百分数 


7.按不同老师所教不同课程平均分从高到低,查询列印: (就是分析哪个老师的哪个课程水平高) 
 教师ID,教师姓名,课程ID,课程名称,平均分 (平均分按去掉一个最高分和一个最低分后取) 


8.查询统计列印各科成绩,各分数段人数: 
 课程ID,课程名称,[100-85],[85-70],[70-60],[<60] 


9.查询列印学生平均成绩及其名次 


11.查询列印参加了所有考试的学生


12.查询列印"至少"与学生"S3 (王五)"参加了相同考试的学生


13.规范化
#T=从未使用的SQL索引
select object_name(i.object_id) as ObjectName, i.name as [Unused Index]
from sys.indexes i
left join sys.dm_db_index_usage_stats s on s.object_id = i.object_id
      and i.index_id = s.index_id
      and s.database_id = db_id() 
where objectproperty(i.object_id, 'IsIndexable') = 1
AND objectproperty(i.object_id, 'IsIndexed') = 1 
and s.index_id is null -- and dm_db_index_usage_stats has no reference to this index
or (s.user_updates > 0 and s.user_seeks = 0 and s.user_scans = 0 and s.user_lookups = 0) -- index is being updated, but not used by seeks/scans/lookups
order by object_name(i.object_id) asc

#T=分区 简单示例
CREATE PARTITION FUNCTION [UPF_Monthly] (varchar(100))
AS RANGE RIGHT FOR VALUES
(
	'20140101'
	, '20140201'
	, '20140301'
);

ALTER DATABASE [PartitionsTest]
ADD FILEGROUP [FG_Partition_0001];

ALTER DATABASE [PartitionsTest] 
ADD FILE 
(
    NAME = FG_Partition_0001_File_0001,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0001_File_0001.mdf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
,
(
    NAME = FG_Partition_0001_File_0002,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0001_File_0002.ndf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
TO FILEGROUP [FG_Partition_0001];


ALTER DATABASE [PartitionsTest]
ADD FILEGROUP [FG_Partition_0002];
ALTER DATABASE [PartitionsTest] 
ADD FILE 
(
    NAME = FG_Partition_0002_File_0001,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0002_File_0001.mdf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
,
(
    NAME = FG_Partition_0002_File_0002,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0002_File_0002.ndf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
TO FILEGROUP [FG_Partition_0002];


ALTER DATABASE [PartitionsTest]
ADD FILEGROUP [FG_Partition_0003];
ALTER DATABASE [PartitionsTest] 
ADD FILE 
(
    NAME = FG_Partition_0001_File_0003,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0003_File_0001.mdf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
,
(
    NAME = FG_Partition_0001_File_0003,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0003_File_0002.ndf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
TO FILEGROUP [FG_Partition_0003];


ALTER DATABASE [PartitionsTest]
ADD FILEGROUP [FG_Partition_0004];
ALTER DATABASE [PartitionsTest] 
ADD FILE 
(
    NAME = FG_Partition_0004_File_0001,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0004_File_0001.mdf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
,
(
    NAME = FG_Partition_0004_File_0002,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Partition_0004_File_0002.ndf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
TO FILEGROUP [FG_Partition_0004];


ALTER DATABASE [PartitionsTest]
ADD FILEGROUP [FG_Indexes_0001];
ALTER DATABASE [PartitionsTest] 
ADD FILE 
(
    NAME = FG_Indexes_0001_File_0001,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Indexes_0001_File_0001.mdf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
,
(
    NAME = FG_Indexes_0001_File_0002,
    FILENAME = 'D:\mssql\data\MSSQL11.ENTERPRISE2012\MSSQL\DATA\PartitionsTest\FG_Indexes_0001_File_0002.ndf',
    SIZE = 8MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 8MB
)
TO FILEGROUP [FG_Indexes_0001];


CREATE PARTITION SCHEME UPS_Monthly
AS PARTITION [UPF_Monthly]
TO
(
	[FG_Partition_0001]
	, [FG_Partition_0002]
	, [FG_Partition_0003]
	, [FG_Partition_0004]
);

CREATE TABLE Transactions
	(
		ID int NOT NULL IDENTITY (1, 1),
		F1 varchar(50) NOT NULL,
		DealDate date not NULL,
		CreateTime datetime NULL,
		CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
		(
			[ID] ASC
			, DealDate desc
		)
		WITH
		(
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON UPS_Monthly(DealDate) 
	)
	ON UPS_Monthly(DealDate) 

#T=分区情况查询
WITH
TBINFO AS(
	SELECT
		SchemaName = S.name,
		TableName = TB.name,
		PartitionScheme = PS.name,
		PartitionFunction = PF.name,
		PartitionFunctionRangeType = CASE
				WHEN boundary_value_on_right = 0 THEN 'LEFT'
				ELSE 'RIGHT' END,
		PartitionFunctionFanout = PF.fanout,
		SchemaID = S.schema_id,
		ObjectID = TB.object_id,
		PartitionSchemeID = PS.data_space_id,
		PartitionFunctionID = PS.function_id
	FROM sys.schemas S
		INNER JOIN sys.tables TB
			ON S.schema_id = TB.schema_id
		INNER JOIN sys.indexes IDX
			on TB.object_id = IDX.object_id
				AND IDX.index_id < 2
		INNER JOIN sys.partition_schemes PS
			ON PS.data_space_id = IDX.data_space_id
		INNER JOIN sys.partition_functions PF
			ON PS.function_id = PF.function_id
),
PF1 AS(
	SELECT 
		PFP.function_id, PFR.boundary_id, PFR.value,
		Type = CONVERT(sysname, 
			CASE T.name
				WHEN 'numeric' THEN 'decimal'
				WHEN 'real' THEN 'float'
				ELSE T.name END
			+ CASE 
				WHEN T.name IN('decimal', 'numeric')
					THEN QUOTENAME(RTRIM(PFP.precision) 
						+ CASE WHEN PFP.scale > 0 THEN ',' + RTRIM(PFP.scale) ELSE '' END, '()')
				WHEN T.name IN('float', 'real')
					THEN QUOTENAME(PFP.precision, '()')
				WHEN T.name LIKE 'n%char'
					THEN QUOTENAME(PFP.max_length / 2, '()')
				WHEN T.name LIKE '%char' OR T.name LIKE '%binary'
					THEN QUOTENAME(PFP.max_length, '()')
				ELSE '' END)
	FROM sys.partition_parameters PFP
		LEFT JOIN sys.partition_range_values PFR
			ON PFR.function_id = PFP.function_id
				AND PFR.parameter_id = PFP.parameter_id
		INNER JOIN sys.types T
			ON PFP.system_type_id = T.system_type_id
),
PF2 AS(
	SELECT * FROM PF1
	UNION ALL
	SELECT
		function_id, boundary_id = boundary_id - 1, value, type
	FROM PF1
	WHERE boundary_id = 1
),
PF AS(
	SELECT 
		B.function_id, boundary_id = ISNULL(B.boundary_id + 1, 1),
		value = STUFF(
			CASE
				WHEN A.boundary_id IS NULL THEN ''
				ELSE ' AND [partition_column_name] ' + PF.LessThan + ' ' + CONVERT(varchar(max), A.value) END
			+ CASE
				WHEN A.boundary_id = 1 THEN ''
				ELSE ' AND [partition_column_name] ' + PF.MoreThan + ' ' + CONVERT(varchar(max), B.value) END,
			1, 5, ''),
		B.Type
	FROM PF1 A		
		RIGHT JOIN PF2 B
			ON A.function_id = B.function_id
				AND (A.boundary_id - 1 = B.boundary_id
					OR(A.boundary_id IS NULL AND B.boundary_id IS NULL))
		INNER JOIN(
			SELECT
				function_id,
				LessThan = CASE 
						WHEN boundary_value_on_right = 0 THEN '<='
						ELSE '<' END,
				MoreThan = CASE
						WHEN boundary_value_on_right = 0 THEN '>'
						ELSE '>=' END
			FROM sys.partition_functions 
		)PF
			ON B.function_id = PF.function_id
),
PS AS(
	SELECT 
		DDS.partition_scheme_id, DDS.destination_id,
		FileGroupName = FG.name, IsReadOnly = FG.is_read_only
	FROM sys.destination_data_spaces DDS
		INNER JOIN sys.filegroups FG
			ON DDS.data_space_id = FG.data_space_id
),
PINFO AS(
	SELECT
		RowID = ROW_NUMBER() OVER(ORDER BY SchemaID, ObjectID, PS.destination_id),
		TB.SchemaName, TB.TableName,
		TB.PartitionScheme, PS.destination_id, PS.FileGroupName, PS.IsReadOnly,
		TB.PartitionFunction, TB.PartitionFunctionRangeType, TB.PartitionFunctionFanout,
		PF.boundary_id, PF.Type, PF.value
	FROM TBINFO TB
		INNER JOIN PS
			ON TB.PartitionSchemeID = PS.partition_scheme_id
		LEFT JOIN PF
			ON TB.PartitionFunctionID = PF.function_id
				AND PS.destination_id = PF.boundary_id
)
SELECT 
	RowID,
	SchemaName = CASE destination_id 
			WHEN 1 THEN SchemaName
			ELSE N'' END,
	TableName = CASE destination_id 
			WHEN 1 THEN TableName
			ELSE N'' END,
	PartitionScheme = CASE destination_id 
			WHEN 1 THEN PartitionScheme
			ELSE N'' END,
	destination_id, FileGroupName, IsReadOnly,
	PartitionFunction = CASE destination_id 
			WHEN 1 THEN PartitionFunction
			ELSE N'' END,
	PartitionFunctionRangeType = CASE destination_id 
			WHEN 1 THEN PartitionFunctionRangeType
			ELSE N'' END,
	PartitionFunctionFanout = CASE destination_id 
			WHEN 1 THEN CONVERT(varchar(20), PartitionFunctionFanout)
			ELSE N'' END,
	boundary_id = ISNULL(CONVERT(varchar(20), boundary_id), ''),
	Type = ISNULL(Type, N''),
	value = CASE PartitionFunctionFanout 
			WHEN 1 THEN '<ALL Data>'
			ELSE ISNULL(value, N'<NEXT USED>') END
FROM PINFO
ORDER BY RowID
#T=分区数据情况查询
SELECT
	$partition.UPF_Monthly(sendtime) AS [Partition Number]
	, min(SendTime) AS [Min SendTime]
	, max(SendTime) AS [Max SendTime]
	, count(*) AS [Rows In Partition]
FROM ehomesmscontent with(nolock)
GROUP BY $partition.UPF_Monthly(SendTime)
ORDER BY [Partition Number]
#T=分区测试数据库
USE [master]
GO
/****** Object:  Database [PartitionsTest]    Script Date: 2014/12/12 9:56:22 ******/

CREATE DATABASE [PartitionsTest]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'FG_PRIMARY_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_PRIMARY_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_PRIMARY_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_PRIMARY_Data_File_002.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_PRIMARY_Data_File_003', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_PRIMARY_Data_File_003.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_PRIMARY_Data_File_004', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_PRIMARY_Data_File_004.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201412]
( NAME = N'FG_Transactions_Monthly_201412_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201412_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201412_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201412_Data_File_002.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201501]
( NAME = N'FG_Transactions_Monthly_201501_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201501_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201501_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201501_Data_File_002.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201502]
( NAME = N'FG_Transactions_Monthly_201502_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201502_Data_File_001.mdf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201502_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201502_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201503]
( NAME = N'FG_Transactions_Monthly_201503_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201503_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201503_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201503_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201504]
( NAME = N'FG_Transactions_Monthly_201504_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201504_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201504_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201504_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201505]
( NAME = N'FG_Transactions_Monthly_201505_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201505_Data_File_001.mdf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201505_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201505_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201506]
( NAME = N'FG_Transactions_Monthly_201506_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201506_Data_File_001.mdf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201506_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201506_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201507]
( NAME = N'FG_Transactions_Monthly_201507_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201507_Data_File_001.mdf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201507_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201507_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Monthly_201508]
( NAME = N'FG_Transactions_Monthly_201508_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201508_Data_File_001.mdf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Monthly_201508_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Monthly_201508_Data_File_002.ndf' , SIZE = 8MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
 FILEGROUP [FG_Transactions_Nonaligned_Indexes]
( NAME = N'FG_Transactions_Nonaligned_Indexes_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Nonaligned_Indexes_Data_File_001.mdf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB ),
( NAME = N'FG_Transactions_Nonaligned_Indexes_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_Transactions_Nonaligned_Indexes_Data_File_002.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB )
 LOG ON
( NAME = N'FG_log_Data_File_001', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_log_Data_File_001.ldf' , SIZE = 8MB , MAXSIZE = UNLIMITED , FILEGROWTH = 8192KB ),
( NAME = N'FG_log_Data_File_002', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_log_Data_File_002.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED , FILEGROWTH = 8192KB ),
( NAME = N'FG_log_Data_File_003', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_log_Data_File_003.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED , FILEGROWTH = 8192KB ),
( NAME = N'FG_log_Data_File_004', FILENAME = N'D:\mssql\data\MSSQL12.ENTERPRISE2014\MSSQL\DATA\PartitionsTest\FG_log_Data_File_004.ndf' , SIZE = 8MB , MAXSIZE = UNLIMITED , FILEGROWTH = 8192KB )


GO
ALTER DATABASE [PartitionsTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PartitionsTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PartitionsTest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PartitionsTest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PartitionsTest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PartitionsTest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PartitionsTest] SET ARITHABORT OFF
GO
ALTER DATABASE [PartitionsTest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PartitionsTest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PartitionsTest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PartitionsTest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PartitionsTest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PartitionsTest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PartitionsTest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PartitionsTest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PartitionsTest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PartitionsTest] SET  ENABLE_BROKER
GO
ALTER DATABASE [PartitionsTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PartitionsTest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PartitionsTest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PartitionsTest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PartitionsTest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PartitionsTest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PartitionsTest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PartitionsTest] SET RECOVERY FULL
GO
ALTER DATABASE [PartitionsTest] SET  MULTI_USER
GO
ALTER DATABASE [PartitionsTest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PartitionsTest] SET DB_CHAINING OFF
GO
ALTER DATABASE [PartitionsTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [PartitionsTest] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO
ALTER DATABASE [PartitionsTest] SET DELAYED_DURABILITY = DISABLED
GO
EXEC sys.sp_db_vardecimal_storage_format N'PartitionsTest', N'ON'
GO
USE [PartitionsTest]
GO
/****** Object:  PartitionFunction [UPF_Monthly]    Script Date: 2014/12/12 9:56:23 ******/
CREATE PARTITION FUNCTION [UPF_Monthly](date) AS RANGE RIGHT FOR VALUES (N'2015-01-01T00:00:00.000', N'2015-02-01T00:00:00.000', N'2015-03-01T00:00:00.000', N'2015-04-01T00:00:00.000', N'2015-05-01T00:00:00.000', N'2015-06-01T00:00:00.000', N'2015-07-01T00:00:00.000', N'2015-08-01T00:00:00.000')
GO
/****** Object:  PartitionScheme [UPS_Monthly]    Script Date: 2014/12/12 9:56:23 ******/
CREATE PARTITION SCHEME [UPS_Monthly] AS PARTITION [UPF_Monthly] TO ([FG_Transactions_Monthly_201412], [FG_Transactions_Monthly_201501], [FG_Transactions_Monthly_201502], [FG_Transactions_Monthly_201503], [FG_Transactions_Monthly_201504], [FG_Transactions_Monthly_201505], [FG_Transactions_Monthly_201506], [FG_Transactions_Monthly_201507], [FG_Transactions_Monthly_201508])
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2014/12/12 9:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [date] NULL,
	[UniqueID] [uniqueidentifier] NULL CONSTRAINT [DF_Transactions_UniqueID]  DEFAULT (newid()),
	[CreateTime] [datetime] NULL CONSTRAINT [DF_Transactions_CreateTime]  DEFAULT (getdate()),
	[Remark] [varchar](max) NULL,
	[F1] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY NONCLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Constraint_UniqueKey_ix_Transactions_UniqueID] UNIQUE NONCLUSTERED
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_Transactions_Nonaligned_Indexes]
) ON [UPS_Monthly]([TransactionDate])

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [ix_Transactions_UniqueID]    Script Date: 2014/12/12 9:56:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_Transactions_UniqueID] ON [dbo].[Transactions]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_Transactions_Nonaligned_Indexes]
GO
/****** Object:  StoredProcedure [dbo].[zsp_PartitionsInfo]    Script Date: 2014/12/12 9:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[zsp_PartitionsInfo]
as
begin
SELECT
	$partition.UPF_Monthly(TransactionDate) AS [Partition Number]
	, min(TransactionDate) AS [Min TransactionDate]
	, max(TransactionDate) AS [Max TransactionDate]
	, count(*) AS [Rows In Partition]
FROM
	Transactions with(nolock)
GROUP BY
	$partition.UPF_Monthly(TransactionDate)
ORDER BY
	[Partition Number]

;WITH
TBINFO AS(
	SELECT
		SchemaName = S.name,
		TableName = TB.name,
		PartitionScheme = PS.name,
		PartitionFunction = PF.name,
		PartitionFunctionRangeType = CASE
				WHEN boundary_value_on_right = 0 THEN 'LEFT'
				ELSE 'RIGHT' END,
		PartitionFunctionFanout = PF.fanout,
		SchemaID = S.schema_id,
		ObjectID = TB.object_id,
		PartitionSchemeID = PS.data_space_id,
		PartitionFunctionID = PS.function_id
	FROM sys.schemas S
		INNER JOIN sys.tables TB
			ON S.schema_id = TB.schema_id
		INNER JOIN sys.indexes IDX
			on TB.object_id = IDX.object_id
				AND IDX.index_id < 2
		INNER JOIN sys.partition_schemes PS
			ON PS.data_space_id = IDX.data_space_id
		INNER JOIN sys.partition_functions PF
			ON PS.function_id = PF.function_id
),
PF1 AS(
	SELECT
		PFP.function_id, PFR.boundary_id, PFR.value,
		Type = CONVERT(sysname,
			CASE T.name
				WHEN 'numeric' THEN 'decimal'
				WHEN 'real' THEN 'float'
				ELSE T.name END
			+ CASE
				WHEN T.name IN('decimal', 'numeric')
					THEN QUOTENAME(RTRIM(PFP.precision)
						+ CASE WHEN PFP.scale > 0 THEN ',' + RTRIM(PFP.scale) ELSE '' END, '()')
				WHEN T.name IN('float', 'real')
					THEN QUOTENAME(PFP.precision, '()')
				WHEN T.name LIKE 'n%char'
					THEN QUOTENAME(PFP.max_length / 2, '()')
				WHEN T.name LIKE '%char' OR T.name LIKE '%binary'
					THEN QUOTENAME(PFP.max_length, '()')
				ELSE '' END)
	FROM sys.partition_parameters PFP
		LEFT JOIN sys.partition_range_values PFR
			ON PFR.function_id = PFP.function_id
				AND PFR.parameter_id = PFP.parameter_id
		INNER JOIN sys.types T
			ON PFP.system_type_id = T.system_type_id
),
PF2 AS(
	SELECT * FROM PF1
	UNION ALL
	SELECT
		function_id, boundary_id = boundary_id - 1, value, type
	FROM PF1
	WHERE boundary_id = 1
),
PF AS(
	SELECT
		B.function_id
		, boundary_id = ISNULL(B.boundary_id + 1, 1)
		, a.value as av
		, b.value as bv
		,
		value = STUFF(
			CASE
				WHEN A.boundary_id IS NULL THEN ''
				ELSE ' AND [partition_column_name] ' + PF.LessThan + ' ' + CONVERT(varchar(max), A.value) END
			+ CASE
				WHEN A.boundary_id = 1 THEN ''
				ELSE ' AND [partition_column_name] ' + PF.MoreThan + ' ' + CONVERT(varchar(max), B.value) END,
			1, 5, ''),
		B.Type
	FROM PF1 A		
		RIGHT JOIN PF2 B
			ON A.function_id = B.function_id
				AND (A.boundary_id - 1 = B.boundary_id
					OR(A.boundary_id IS NULL AND B.boundary_id IS NULL))
		INNER JOIN(
			SELECT
				function_id,
				LessThan = CASE
						WHEN boundary_value_on_right = 0 THEN '<='
						ELSE '<' END,
				MoreThan = CASE
						WHEN boundary_value_on_right = 0 THEN '>'
						ELSE '>=' END
			FROM sys.partition_functions
		)PF
			ON B.function_id = PF.function_id
),
PS AS(
	SELECT
		DDS.partition_scheme_id, DDS.destination_id,
		FileGroupName = FG.name, IsReadOnly = FG.is_read_only
	FROM sys.destination_data_spaces DDS
		INNER JOIN sys.filegroups FG
			ON DDS.data_space_id = FG.data_space_id
),
PINFO AS(
	SELECT
		RowID = ROW_NUMBER() OVER(ORDER BY SchemaID, ObjectID, PS.destination_id),
		TB.SchemaName, TB.TableName,
		TB.PartitionScheme, PS.destination_id, PS.FileGroupName, PS.IsReadOnly,
		TB.PartitionFunction, TB.PartitionFunctionRangeType, TB.PartitionFunctionFanout,
		PF.boundary_id, PF.Type, PF.value
		,pf.av
		,pf.bv
	FROM TBINFO TB
		INNER JOIN PS
			ON TB.PartitionSchemeID = PS.partition_scheme_id
		LEFT JOIN PF
			ON TB.PartitionFunctionID = PF.function_id
				AND PS.destination_id = PF.boundary_id
)
SELECT
	RowID,
	SchemaName = CASE destination_id
			WHEN 1 THEN SchemaName
			ELSE N'' END,
	TableName = CASE destination_id
			WHEN 1 THEN TableName
			ELSE N'' END,
	PartitionScheme = CASE destination_id
			WHEN 1 THEN PartitionScheme
			ELSE N'' END,
	destination_id, FileGroupName, IsReadOnly,
	PartitionFunction = CASE destination_id
			WHEN 1 THEN PartitionFunction
			ELSE N'' END,
	PartitionFunctionRangeType = CASE destination_id
			WHEN 1 THEN PartitionFunctionRangeType
			ELSE N'' END,
	PartitionFunctionFanout = CASE destination_id
			WHEN 1 THEN CONVERT(varchar(20), PartitionFunctionFanout)
			ELSE N'' END,
	boundary_id = ISNULL(CONVERT(varchar(20), boundary_id), ''),
	Type = ISNULL(Type, N''),
	bv,
	av,
	value = CASE PartitionFunctionFanout
			WHEN 1 THEN '<ALL Data>'
			ELSE ISNULL(value, N'<NEXT USED>') END
FROM PINFO
ORDER BY RowID
end
GO
USE [master]
GO
ALTER DATABASE [PartitionsTest] SET  READ_WRITE
GO

#T=分区脚本 生成
--生成分区脚本
DECLARE @DataBaseName NVARCHAR(50)--数据库名称
DECLARE @TableName NVARCHAR(50)--表名称
DECLARE @ColumnName NVARCHAR(50)--字段名称
DECLARE @PartNumber INT--需要分多少个区
DECLARE @Location NVARCHAR(50)--保存分区文件的路径
DECLARE @Size NVARCHAR(50)--分区初始化大小
DECLARE @FileGrowth NVARCHAR(50)--分区文件增量
DECLARE @FunValue INT--分区分段值
DECLARE @i INT
DECLARE @PartNumberStr NVARCHAR(50)
DECLARE @sql NVARCHAR(max)
 
--设置下面变量
SET @DataBaseName = 'MyDataBase'
SET @TableName = 'User'
SET @ColumnName = 'Id'
SET @PartNumber = 4
SET @Location = 'E:\DataBase\'
SET @Size = '30MB'
SET @FileGrowth = '10%'
SET @FunValue = 10000000
 
 
--1.创建文件组
SET @i = 1
PRINT '--1.创建文件组'
WHILE @i <= @PartNumber
BEGIN
    SET @PartNumberStr = RIGHT('0' + CONVERT(NVARCHAR,@i),2)
    SET @sql = 'ALTER DATABASE ['+@DataBaseName +']
ADD FILEGROUP [FG_'+@TableName+'_'+@ColumnName+'_'+@PartNumberStr+']'
    PRINT @sql + CHAR(13)
    SET @i=@i+1
END
 
--2.创建文件
SET @i = 1
PRINT CHAR(13)+'--2.创建文件'
WHILE @i <= @PartNumber
BEGIN
    SET @PartNumberStr = RIGHT('0' + CONVERT(NVARCHAR,@i),2)
    SET @sql = 'ALTER DATABASE ['+@DataBaseName +']
ADD FILE
(NAME = N''FG_'+@TableName+'_'+@ColumnName+'_'+@PartNumberStr+'_data'',FILENAME = N'''+@Location+'FG_'+@TableName+'_'+@ColumnName+'_'+@PartNumberStr+'_data.ndf'',SIZE = '+@Size+', FILEGROWTH = '+@FileGrowth+' )
TO FILEGROUP [FG_'+@TableName+'_'+@ColumnName+'_'+@PartNumberStr+'];'
    PRINT @sql + CHAR(13)
    SET @i=@i+1
END
 
 
--3.创建分区函数
PRINT CHAR(13)+'--3.创建分区函数'
DECLARE @FunValueStr NVARCHAR(MAX) 
SET @i = 1
SET @FunValueStr = ''
WHILE @i < @PartNumber
BEGIN
    SET @FunValueStr = @FunValueStr + convert(NVARCHAR(50),(@i*@FunValue)) + ','
    SET @i=@i+1
END
SET @FunValueStr = substring(@FunValueStr,1,len(@FunValueStr)-1)
SET @sql = 'CREATE PARTITION FUNCTION
Fun_'+@TableName+'_'+@ColumnName+'(INT) AS
RANGE RIGHT
FOR VALUES('+@FunValueStr+')'
PRINT @sql + CHAR(13)
 
 
--4.创建分区方案
PRINT CHAR(13)+'--4.创建分区方案'
DECLARE @FileGroupStr NVARCHAR(MAX) 
SET @i = 1
SET @FileGroupStr = ''
WHILE @i <= @PartNumber
BEGIN
    SET @PartNumberStr = RIGHT('0' + CONVERT(NVARCHAR,@i),2)
    SET @FileGroupStr = @FileGroupStr + '[FG_'+@TableName+'_'+@ColumnName+'_'+@PartNumberStr+'],'
    SET @i=@i+1
END
SET @FileGroupStr = substring(@FileGroupStr,1,len(@FileGroupStr)-1)
SET @sql = 'CREATE PARTITION SCHEME
Sch_'+@TableName+'_'+@ColumnName+' AS
PARTITION Fun_'+@TableName+'_'+@ColumnName+'
TO('+@FileGroupStr+')'
PRINT @sql + CHAR(13)
 
 
--5.分区函数的记录数
PRINT CHAR(13)+'--5.分区函数的记录数'
SET @sql = 'SELECT $PARTITION.Fun_'+@TableName+'_'+@ColumnName+'('+@ColumnName+') AS Partition_num,
 MIN('+@ColumnName+') AS Min_value,MAX('+@ColumnName+') AS Max_value,COUNT(1) AS Record_num
FROM dbo.'+@TableName+'
GROUP BY $PARTITION.Fun_'+@TableName+'_'+@ColumnName+'('+@ColumnName+')
ORDER BY $PARTITION.Fun_'+@TableName+'_'+@ColumnName+'('+@ColumnName+');'
PRINT @sql + CHAR(13)
 
/*
生成的脚本如下：
--1.创建文件组
ALTER DATABASE [MyDataBase]
ADD FILEGROUP [FG_User_Id_01]
 
ALTER DATABASE [MyDataBase]
ADD FILEGROUP [FG_User_Id_02]
 
ALTER DATABASE [MyDataBase]
ADD FILEGROUP [FG_User_Id_03]
 
ALTER DATABASE [MyDataBase]
ADD FILEGROUP [FG_User_Id_04]
 
 
--2.创建文件
ALTER DATABASE [MyDataBase]
ADD FILE
(NAME = N'FG_User_Id_01_data',FILENAME = N'E:\DataBase\FG_User_Id_01_data.ndf',SIZE = 30MB, FILEGROWTH = 10% )
TO FILEGROUP [FG_User_Id_01];
 
ALTER DATABASE [MyDataBase]
ADD FILE
(NAME = N'FG_User_Id_02_data',FILENAME = N'E:\DataBase\FG_User_Id_02_data.ndf',SIZE = 30MB, FILEGROWTH = 10% )
TO FILEGROUP [FG_User_Id_02];
 
ALTER DATABASE [MyDataBase]
ADD FILE
(NAME = N'FG_User_Id_03_data',FILENAME = N'E:\DataBase\FG_User_Id_03_data.ndf',SIZE = 30MB, FILEGROWTH = 10% )
TO FILEGROUP [FG_User_Id_03];
 
ALTER DATABASE [MyDataBase]
ADD FILE
(NAME = N'FG_User_Id_04_data',FILENAME = N'E:\DataBase\FG_User_Id_04_data.ndf',SIZE = 30MB, FILEGROWTH = 10% )
TO FILEGROUP [FG_User_Id_04];
 
 
--3.创建分区函数
CREATE PARTITION FUNCTION
Fun_User_Id(INT) AS
RANGE RIGHT
FOR VALUES(10000000,20000000,30000000)
 
 
--4.创建分区方案
CREATE PARTITION SCHEME
Sch_User_Id AS
PARTITION Fun_User_Id
TO([FG_User_Id_01],[FG_User_Id_02],[FG_User_Id_03],[FG_User_Id_04])
 
 
--5.分区函数的记录数
SELECT $PARTITION.Fun_User_Id(Id) AS Partition_num,
 MIN(Id) AS Min_value,MAX(Id) AS Max_value,COUNT(1) AS Record_num
FROM dbo.User
GROUP BY $PARTITION.Fun_User_Id(Id)
ORDER BY $PARTITION.Fun_User_Id(Id);
*/
#T=分区表 分区方案 文件组
alter database [eUserprofile]
add filegroup [smsdata_FG_200908]

go

alter database [eUserprofile]
ADD FILE 
(
	NAME = smsdata_200908_01,
	FILENAME = 'r:\mssql\data\eUserProfile\smsdata_200908_01.mdf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_02,
	FILENAME = 'r:\mssql\data\eUserProfile\smsdata_200908_02.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_03,
	FILENAME = 's:\mssql\data\eUserProfile\smsdata_200908_03.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_04,
	FILENAME = 's:\mssql\data\eUserProfile\smsdata_200908_04.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_05,
	FILENAME = 't:\mssql\data\eUserProfile\smsdata_200908_05.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_06,
	FILENAME = 't:\mssql\data\eUserProfile\smsdata_200908_06.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_07,
	FILENAME = 'u:\mssql\data\eUserProfile\smsdata_200908_07.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)
,
(
	NAME = smsdata_200908_08,
	FILENAME = 'u:\mssql\data\eUserProfile\smsdata_200908_08.ndf',
	SIZE = 8MB,
	MAXSIZE = 8192MB,
	FILEGROWTH = 16MB
)

TO FILEGROUP smsdata_FG_200908

go

CREATE PARTITION FUNCTION [UPF_Monthly] (datetime)
AS RANGE RIGHT FOR VALUES 
(
	 '20090801'
	,'20090901'
	,'20091001'
	,'20091101'
	,'20091201'
	,'20100101'
	,'20100201'	
	,'20100301'
	,'20100401'
	,'20100501'
	,'20100601'
	,'20100701'
	,'20100801'
	,'20100901'
)
go

CREATE PARTITION SCHEME [UPS_SMSData_Monthly]
AS PARTITION [UPF_Monthly]
TO 
(
	  smsdata_FG_200908
	, smsdata_FG_200909
	, smsdata_FG_200910
	, smsdata_FG_200911
	, smsdata_FG_200912
	, smsdata_FG_201001
	, smsdata_FG_201002
	, smsdata_FG_201003
	, smsdata_FG_201004
	, smsdata_FG_201005
	, smsdata_FG_201006
	, smsdata_FG_201007
	, smsdata_FG_201008
	, smsdata_FG_201009
	, smsdata_FG_201010
)
#T=分区表和索引 数据库
--http://technet.microsoft.com/zh-cn/library/ms345599.aspx
USE master;
GO
IF DB_ID (N'db_sales_test') IS NOT NULL
    DROP DATABASE db_sales_test;
GO
CREATE DATABASE db_sales_test;
GO
USE db_sales_test;
GO
CREATE PARTITION FUNCTION [pf_range_fact](int) AS RANGE RIGHT FOR VALUES 
(20080801, 20080901, 20081001, 20081101, 20081201, 20090101);
GO
CREATE PARTITION SCHEME [ps_fact_sales] AS PARTITION [pf_range_fact] 
ALL TO ([PRIMARY]);
GO
CREATE TABLE fact_sales(date_id int, product_id int, store_id int, 
    quantity int, unit_price numeric(7,2), other_data char(1000))
ON ps_fact_sales(date_id);
GO
CREATE CLUSTERED INDEX ci ON fact_sales(date_id);
GO
PRINT 'Loading...';
SET NOCOUNT ON;
DECLARE @i int;
SET @i = 1;
WHILE (@i<1000000)
BEGIN
    INSERT INTO fact_sales VALUES(20080800 + (@i%30) + 1, @i%10000, @i%200, RAND() * 25, (@i%3) + 1, '');
    SET @i += 1;
END;
GO
DECLARE @i int;
SET @i = 1;
WHILE (@i<10000)
BEGIN
    INSERT INTO fact_sales VALUES(20080900 + (@i%30) + 1, @i%10000, @i%200, RAND() * 25, (@i%3) + 1, '');
    SET @i += 1;
END;
PRINT 'Done.';
GO
-- Two-partition query.
SET STATISTICS XML ON;
GO
SELECT date_id, SUM(quantity*unit_price) AS total_price
FROM fact_sales
WHERE date_id BETWEEN 20080802 AND 20080902
GROUP BY date_id ;
GO
SET STATISTICS XML OFF;
GO
-- Single-partition query.
SET STATISTICS XML ON;
GO
SELECT date_id, SUM(quantity*unit_price) AS total_price
FROM fact_sales
WHERE date_id BETWEEN 20080801 AND 20080831
GROUP BY date_id;
GO
SET STATISTICS XML OFF;
GO
#T=分区表定义及实际数据信息 2019-11-11
USE [MonthlyPartitionsTest]
GO
/****** Object:  UserDefinedFunction [dbo].[iTVF_TablesPartitionsStorageInfo]    Script Date: 11/22/2019 10:59:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[iTVF_TablesPartitionsStorageInfo] 
(	
	-- Add the parameters for the function here
	@TableName varchar(128)
)
RETURNS TABLE 
/*
SP_help 'sys.partition_range_values'
select
	*
from
	[iTVF_TablesPartitionsStorageInfo](null) a
*/
AS
RETURN 
(
with TPartitions
as
(
	SELECT
		  sc.name											as [SchemeName]
		, so.name											as [TableName]
		, p.partition_number								as [PartitionNumber]
		, pf.name											as [PartitionFunction]
		, ps.name											as [PartitionScheme]
		, pf.boundary_value_on_right						as BoundaryValueOnRight
		, iif
			(
				pf.boundary_value_on_right = 1
				, '[x , y)'
				, '(x , y]'
			)												as [BoundaryType]
		, prv.value											as [BoundaryOrignalValue]
		, isnull
			(
				prv.value
				, 
					iif
					(
						pf.boundary_value_on_right = 1
						, min
							(
								cast(prv.value as Date)
							) over (partition by pf.name) 
						, max
							(
								cast(prv.value as Date)
							) over (partition by pf.name) 
					)
			)												as BoundaryValue
		, fg.name											as [FileGroupName]
		, si.index_id										as [IndexID]
		, si.type_desc										as [IndexStructure]
		, si.name											as [Index]
		, stat.row_count									as [StorageRows]
		, stat.in_row_reserved_page_count * 8./1024./1024.	as [InRowReservedInGB]
		, stat.lob_reserved_page_count * 8./1024./1024.		as [LobReservedInGB]
	FROM
		sys.partition_functions AS pf
			JOIN
				sys.partition_schemes as ps
					on
						ps.function_id = pf.function_id
			JOIN
				sys.indexes as si
					on
						si.data_space_id = ps.data_space_id
						and
						si.index_id < 2
			JOIN
				sys.objects as so
					on
						si.object_id = so.object_id
			JOIN
				sys.schemas as sc
					on
						so.schema_id = sc.schema_id
			JOIN
				sys.partitions as p
					on 
						si.object_id = p.object_id 
						and
						si.index_id = p.index_id
			LEFT JOIN
				sys.partition_range_values as prv
					on
						prv.function_id = pf.function_id
						and
						p.partition_number
						=
						iif
							(
								pf.boundary_value_on_right = 1
								, prv.boundary_id + 1
								, prv.boundary_id
							)
						/*
							For left-based functions, partition_number = boundary_id, 
							for right-based functions we need to add 1
						*/
			JOIN
				sys.dm_db_partition_stats as stat
					on
						stat.object_id = p.object_id
						and
						stat.index_id = p.index_id
						and
						stat.index_id = p.index_id
						and
						stat.partition_id = p.partition_id
						and
						stat.partition_number = p.partition_number
			JOIN
				sys.allocation_units as au
					on
						au.container_id = p.hobt_id
						and
						au.type_desc ='IN_ROW_DATA' 
						/* Avoiding double rows for columnstore indexes. */
						/* We can pick up LOB page count from partition_stats */
			JOIN
				sys.filegroups as fg
					on
						fg.data_space_id = au.data_space_id
	where
		(
			@TableName is null
			or
			so.[name] = @TableName
		)
)
, T 
as
(
	select
		a.*
		, cast(a.BoundaryValue as date)			as LeftValue
		, cast
			(
				lead(a.BoundaryValue) 
					over
						(
							partition by a.[PartitionFunction]
							order by a.BoundaryValue
						)
				as date
			)									as RightValue
	from
		TPartitions a
)
select
	a.SchemeName
	, a.TableName
	, a.PartitionFunction
	, a.PartitionScheme
	, a.PartitionNumber
	, a.FileGroupName
	, a.BoundaryType
	, a.BoundaryValue
	, a.LeftValue
	, a.RightValue
	--, min(a.LeftValue) over()				as MinLeftValue
	--, max(a.LeftValue) over()				as MaxLeftValue
	--, min(a.RightValue) over()			as MinRightValue
	--, max(a.RightValue) over()			as MaxRightValue
	, min(a.BoundaryValue) over()			as MinBoundaryValue
	, max(a.BoundaryValue) over()			as MaxBoundaryValue
	, count(a.BoundaryValue) over()			as CountBoundaryValue
	, a.StorageRows
	, sum(a.StorageRows) over()				as TotalStorageRows
	, a.IndexID
	, a.IndexStructure
	, a.InRowReservedInGB
	, a.LobReservedInGB
from
	T a

--ORDER BY
--	SchemeName
--	, TableName
--	, [IndexID]
--	, [PartitionFunction]
--	, [PartitionNumber]

)

#T=利息资金计算.OLD.2012-12-19
USE [FundManagement]
GO
/****** Object:  StoredProcedure [dbo].[usp_CalcDailyLedgerResult_debug1]    Script Date: 2012/12/17 12:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[usp_CalcDailyLedgerResult_debug2]
@today date = null
as
begin
	set xact_abort on
	begin transaction
		declare @now datetime = getdate()
		if @today is null
		begin
			set @today = @now
		end
		
		delete
			[DailyLedgerResultProcessing]
		--where
			
		--select @today
		-- usp_CalcDailyLedgerResult_debug2 '2012-12-15'
		
		declare @AmountType varchar(100)
		declare @DirectionConsistency bit
		

		--==================================================================
		--今日新交易
		set @AmountType = '当日新交易本金'
		set @DirectionConsistency = 1
		select
			@DirectionConsistency = DirectionConsistency
		from
			AmountTypes
		where
			AmountType = @AmountType

		--交易本金
		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(amount)				--本金
			, count(1)
			, @AmountType
			, @DirectionConsistency
			, 1							--是否发起行
			, '当日新交易按发起行group by'
		from
			Transactions
		where
			beginDate = @today			--今日新交易
			and [status] = 10
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(amount)				--本金
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行			
			, '当日新交易按对手行group by'
		from
			Transactions
		where
			beginDate = @today			--今日新交易
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--本行 借出方、贷入方
		--======================================================================		


		--未到期日利息
		set @AmountType = '未到期日利息'
		set @DirectionConsistency = 1
		select
			@DirectionConsistency = DirectionConsistency
		from
			AmountTypes
		where
			AmountType = @AmountType
		
		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(DayInterest)				--日利息
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,1							--是否发起行			
			, '每日未到期交易按发起行group by'
		from
			Transactions
		where
			beginDate <= @today
			and endDate > @today
			and [status] = 10
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(DayInterest)				--日利息
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行			
			, '每日未到期交易按对手行group by'
		from
			Transactions
		where
			beginDate <= @today
			and endDate > @today
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--对手行 借出方、贷入方
		--======================================================================================


		--到期日利息
		set @AmountType = '到期日利息'
		set @DirectionConsistency = 1
		select
			@DirectionConsistency = DirectionConsistency
		from
			AmountTypes
		where
			AmountType = @AmountType
		
		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(DayInterest)				--日利息
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,1							--是否发起行			
			, '每日到期交易日利息按发起行group by'
		from
			Transactions
		where
			endDate = @today
			and [status] = 10
			and BankParty = 'Creditor'
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(DayInterest)				--日利息
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行
			, '每日到期交易日利息按对手行group by'
		from
			Transactions
		where
			endDate = @today
			and AgainstParty = 'Debtor'
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--对手行 借出方、贷入方
		--======================================================================================



		--到期日结清本金
		set @AmountType = '到期日结清本金'
		set @DirectionConsistency = 1
		select
			@DirectionConsistency = DirectionConsistency
		from
			AmountTypes
		where
			AmountType = @AmountType

		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(Amount)				--本金
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,1							--是否发起行
			, '到期交易汇总本金按发起行group by'
		from
			Transactions
		where
			endDate = @today
			and BankParty = 'creditor'
			and [status] = 10
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(Amount)				--本金
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行
			, '到期交易汇总本金按对手行group by'
		from
			Transactions
		where
			endDate = @today
			and AgainstParty = 'debtor'
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--对手行 借出方、贷入方
		--=====================================================================================

		--到期日汇总本金及结清总利息 连本带息
		set @AmountType = '到期日汇总本金及结清总利息'
		set @DirectionConsistency = 1
		select
			@DirectionConsistency = DirectionConsistency
		from
			AmountTypes
		where
			AmountType = @AmountType

		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(SumInterest)+ sum(amount)				--连本带利
			, count(1)			
			, @AmountType
			, @DirectionConsistency
			,1							--是否发起行
			, '到期交易结清总利息按发起行group by'
		from
			Transactions
		where
			endDate = @today
			and BankParty = 'Debtor'
			and [status] = 10
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(SumInterest)+ sum(amount)				--连本带利
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行			
			, '到期交易结清总利息按对手行group by'
		from
			Transactions
		where
			endDate = @today
			and AgainstParty ='Creditor'
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--对手行 借出方、贷入方

		--===============================================================

		--to do
		--冲回昨日
		set @AmountType = '冲回昨日'
		set @DirectionConsistency = 1

		declare @yesterday date = dateadd(day, -1, @today)


		--按发起行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, BankID
			, CurrencyType
			, BankParty
			, sum(DayInterest)				--日利息
			, count(1)
			, @AmountType
			, @DirectionConsistency
			,1							--是否发起行			
			, '冲回昨天按发起行group by'
		from
			Transactions
		where
			beginDate <= @yesterday
			and EndDate > @yesterday
			and [status] = 10
		group by
			BankID
			, CurrencyType
			, BankParty		--本行 借出方、贷入方

		--按对手行group by
		insert into [DailyLedgerResultProcessing]
					(
						[LedgerDate]			--[date] NOT NULL,
						,[BankID]				--[varchar](50) NOT NULL,
						,[CurrencyType]			--[varchar](3) NOT NULL,
						,[Party]				--[varchar](10) NOT NULL,
						,[Amount]				--[decimal](18, 4) NULL,
						,[Counts]
						,[AmountType]
						,[DirectionConsistency]
						,[IsSender]
						,[Remark]
					)
		select
			@today
			--min(beginDate)
			, AgainstBankID
			, CurrencyType
			, AgainstParty
			, sum(DayInterest)				--日利息
			, count(1)			
			, @AmountType
			, @DirectionConsistency
			,0							--是否发起行			
			, '冲回昨天按对手行group by'
		from
			Transactions
		where
			beginDate <= @yesterday
			and EndDate > @yesterday
			and [status] = 10
		group by
			AgainstBankID
			, CurrencyType
			, AgainstParty		--对手行 借出方、贷入方


		--=====================================================================


		--select * from [DailyLedgerResultProcessing]



		select
			a.LedgerDate
			, a.BankID
			, b.Accounting
			, sum
				(
					case
						when
							(
								a.Party = 'debtor'
								and a.DirectionConsistency = 1
							)
							or
							(
								a.Party = 'creditor'
								and a.DirectionConsistency = 0
							)
							then a.Amount
						else
							0
					end
				)
				as [DebtorBalance]
			, sum
				(
					case
						when
							(
								a.Party = 'debtor'
								and a.DirectionConsistency = 0
							)
							or
							(
								a.Party = 'creditor'
								and a.DirectionConsistency = 1
							)
							then a.Amount
						else
							0
					end
				)
				as [CreditorBalance]
			--,*
		from
			[DailyLedgerResultProcessing] a
				left join [AccountingRules] b
					on
						a.Party = b.Party
						and a.AmountType = b.AmountType
						and a.IsSender = b.Direction
		group by
			a.LedgerDate
			, a.BankID
			, b.Accounting									
		order by
			a.LedgerDate
			,a.BankID
			,b.Accounting
	commit transaction
end
#T=双not exists 至少存在
USE [Test]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 2015/4/17 15:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1](
	[GroupID] [varchar](50) NOT NULL,
	[RootID] [varchar](50) NOT NULL,
	[ID] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[RootID] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table_2]    Script Date: 2015/4/17 15:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_2](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[ColumnName] [varchar](50) NOT NULL,
	[ColumnValue] [nchar](10) NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R001', N'R001-A-A001')
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R001', N'R001-A-A002')
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R002', N'R002-A-A002')
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R002', N'R002-A-A003')
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R002', N'R002-A-A004')
GO
INSERT [dbo].[Table_1] ([GroupID], [RootID], [ID]) VALUES (N'G001', N'R003', N'R003-A-A003')
GO
SET IDENTITY_INSERT [dbo].[Table_2] ON 

GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (1, N'Person', N'Name', N'Tom       ')
GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (2, N'Person', N'Age', N'11        ')
GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (3, N'Person', N'Gender', N'F         ')
GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (4, N'Person', N'Name', N'Mike      ')
GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (5, N'Person', N'Age', N'12        ')
GO
INSERT [dbo].[Table_2] ([ID], [TableName], [ColumnName], [ColumnValue]) VALUES (6, N'Person', N'Gender', N'M         ')
GO
SET IDENTITY_INSERT [dbo].[Table_2] OFF
GO
/****** Object:  StoredProcedure [dbo].[zDoubleNotExistsTest]    Script Date: 2015/4/17 15:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[zDoubleNotExistsTest]
as
begin
--双 not exists , 不存在 不存在 , 至少 
;with T
as
(
	select
		'R001' as RootID,'R001-A-A002' as ID
	union all
	select
		'R002' as RootID,'R002-A-A005' as ID
	union all
	select
		'R002' as RootID,'R002-A-A008' as ID
	union all
	select
		'R003' as RootID,'R003-A-A003' as ID
)
, TResult
as
(
	select
		*
	from
		Table_1 a with(nolock)
	where
		not exists
			(
				select
					1
				from
					T aa
				where
					not exists
						(
							select
								1
							from
								Table_1 aaa with(nolock)
							where
								aaa.GroupID = a.GroupID
								and aaa.RootID = aa.RootID
								--每个 GroupRoot 至少存在一个
								and
									(
										exists
											(
												select
													1
												from
													T aaaa
												where
													aaaa.RootID = aaa.RootID
													--重要条件
													and
													aaaa.ID = aaa.ID
											)
									)
						)
			)
)
, TGroupsRoots		--debug
as
(
	select
		*
	from
		Table_1 a with(nolock)
	where
		not exists
			(
				select
					1
				from
					T aa
				where
					not exists
						(
							select
								1
							from
								Table_1 aaa with(nolock)
							where
								(
									aaa.GroupID = a.GroupID
								)
								and
								(
									aaa.RootID = aa.RootID
								)
						)
			)
)
, TGroupsRootsIDs		--debug
as
(
	select
		*
	from
		TGroupsRoots a
	where
		not exists
			(
				select
					1
				from
					T aa
				where
					not exists
						(
							select
								1
							from
								TGroupsRoots aaa
							where
								aaa.GroupID = a.GroupID
									
								--重要条件
								and
								aaa.RootID = aa.RootID

								--重要条件
								and
								(
									exists
										(
											select
												1
											from
												T aaaa
											where
												aaaa.RootID = aaa.RootID
												and
												aaaa.ID = aaa.ID
										)
								)
						)
			)
)
, T4
as
(
	select
		distinct
			a.GroupID
	from
		--TGroupsRootsIDs a
		TResult a
)
, T5		--debug
as
(
	select
		*
	from
		TGroupsRootsIDs a
	where
		exists
			(
				select
					1
				from
					T aa
				where
					aa.RootID = a.RootID
					and
					aa.ID = aa.ID
			)
)
, T6	--debug
as
(
	select
		a.GroupID
		, a.ID
		, b.ID as ID2
		, a.RootID
		, b.RootID as RootID2
	from
		T5 a
			full join
				T b
			on
				a.RootID = b.RootID
				and
				a.ID = b.ID
)
select
	*
from
	--TGroupsRootsIDs
	TResult
	--T5
	--T4
			a
order by
	a.GroupID
	--, a.RootID


end


GO

#T=对齐时间函数
ALTER FUNCTION [dbo].[DateTimeMinutesAlign]
	(
		@Time datetime
		, @Minutes int
	)
RETURNS datetime
AS
BEGIN
	return dateadd(minute, @Minutes * (datediff(minute, 0, @Time)/@Minutes), 0)
END

#T=年日历 简单
declare @ date = getdate()
;with
TMonths
as
(
select 0 as M
union all select 1 union all select 2 union all select 3
union all select 4 union all select 5 union all select 6
union all select 7 union all select 8 union all select 9
union all select 10 union all select 11
)
, TDays
as
(
select 0 as D
union all select 1 union all select 2 union all select 3 union all select 4 union all select 5
union all select 6 union all select 7 union all select 8 union all select 9 union all select 10
union all select 11 union all select 12 union all select 13 union all select 14
union all select 15 union all select 16 union all select 17 union all select 18
union all select 19 union all select 20 union all select 21 union all select 22
union all select 23 union all select 24 union all select 25 union all select 26
union all select 27 union all select 28 union all select 29 union all select 30
) 
, TDates
as
(
	select
		cast
			(
				dateadd(year,datediff(YEAR,0,@),0) 
				+ ROW_NUMBER() over(order by a.M) as date
			)
		 as [theDate]
	from
		TMonths a
		, Tdays b
	
)
, TYearDates
as
(
	select
		*
		,(@@Datefirst + datepart(weekday,theDate)) % 7 
       + case when (@@Datefirst + datepart(weekday,theDate)) % 7 < 2 
                   then 6 
              else 
                   -1 
         end as WeekDayID
	from
		TDates
	where
		datediff(YEAR,@,theDate) = 0
)
SELECT 
	*
FROM
	TYearDates

#T=当前所有进程运行的 SQL语句
-- Current processes and their SQL statements 
SELECT
	a.loginame AS LoginName 
	,b.name AS DatabaseName 
	,a.[status] as ProcessStatus 
	,a.cmd AS Command 
	,a.last_batch AS LastBatch 
	,a.cpu AS Cpu 
	,a.physical_io AS PhysicalIo 
	,c.row_count AS [RowCount] 
	,e.[text] AS SQLStatement 
FROM
	sys.sysprocesses a 
		INNER JOIN
			sys.databases b 
				ON
					a.dbid = b.database_id
		INNER JOIN
			sys.dm_exec_sessions c 
				ON
					a.spid = c.session_id
		CROSS APPLY
			sys.dm_exec_sql_text(a.sql_handle) e
WHERE
	a.spid >= 50  -- Exclude system processes
ORDER BY
	a.physical_io DESC
	,a.cpu DESC;
#T=执行中的SQL
SELECT
	[Spid] = session_Id
	,ecid
	,[Database] = DB_NAME(sp.dbid)
	,nt_username
	,er.status
	,wait_type
	,[Individual Query] =
							SUBSTRING
								(
									qt.text
									, er.statement_start_offset / 2
									,
										(
											CASE
												WHEN
													er.statement_end_offset = -1
													THEN
														LEN(CONVERT(NVARCHAR(MAX), qt.text))
														* 2
												ELSE
														er.statement_end_offset
											END
											- er.statement_start_offset
										)
										/ 2
								)
	,[Parent Query] = qt.text
	,Program = program_name
	,Hostname
	,nt_domain
	,start_time
FROM
	sys.dm_exec_requests er
		INNER JOIN
			sys.sysprocesses sp
				ON
					er.session_id = sp.spid
		CROSS APPLY
			sys.dm_exec_sql_text(er.sql_handle) AS qt
WHERE
	session_Id >= 51

SELECT
	m.session_id
	,m.start_time
	,m.command
	,m.wait_type
	,m.cpu_time
	,CAST(s.text AS VARCHAR(max)) AS sqlText
FROM
	master.sys.dm_exec_requests m WITH ( NOLOCK )
		CROSS APPLY
			fn_get_sql(m.sql_handle) s

SELECT
	r.session_id
	,r.start_time
	,r.command
	,r.wait_type
	,r.cpu_time
	,s.text
FROM
	sys.dm_exec_requests r
		CROSS APPLY
			sys.dm_exec_sql_text(r.sql_handle) s
#T=扩展存储过程用户角色 sysprotects
SELECT
	c.name as UserLogin,b.name as ObjectName
FROM sysprotects a
	left join sysobjects b
		on a.id = b.id
	left join sysusers c
		on a.uid = c.uid
WHERE
--a.action IN (193, 195, 196, 197, 224, 26)
--and 
b.xtype in ('x','p')
order by
	b.name

#T=排序规则 collation
select
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName')),
	DatabaseID = DB_ID(),
	DatabaseName = DB_NAME(),
	DATABASEPROPERTYEX(DB_NAME(),'collation') as database_collation_name,
	ss.name as schema_name,
	so.name as table_name,
	sc.name as column_name,
	st.system_type_id,
	st.name as type_name,
	sc.collation_name
from
	sys.objects so
		inner join
			sys.columns sc
				on so.object_id = sc.object_id
		inner join
			sys.types st
				on sc.system_type_id = st.system_type_id
		inner join
			sys.schemas ss
				on ss.schema_id = so.schema_id
where
	so.type = 'U'
	and 
	sc.collation_name is not null
	--and
	--st.system_type_id in
	--					(
	--						35 /* text */
	--						, 99 /* ntext */
	--						, 167 /* varchar */
	--						, 175 /* char */
	--						, 231 /* nvarchar, sysname */
	--						, 239 /* nchar */
	--					)
order by
	table_name,
	sc.column_id

#T=提取数字、字符串
/****** Object:  UserDefinedFunction [dbo].[F_Get_No]    Script Date: 10/18/2013 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[F_Get_No]
(
	@No varchar(100)
)
RETURNS bigint
AS
BEGIN
	WHILE PATINDEX('%[^0-9]%',@No)>0
	BEGIN
		SET @No=STUFF(@No,PATINDEX('%[^0-9]%',@No),1,'') --删掉一个非数字的字符，循环结束，剩余的为数字部分
	END
	RETURN CONVERT(bigint,@No)
END

GO

create function [dbo].[F_GetChar]
(
	@No varchar(100)
)
RETURNS varchar(100)
AS
BEGIN
	WHILE PATINDEX('%[^A-Za-z]%',@No)>0
	BEGIN
		SET @No=STUFF(@No,PATINDEX('%[^A-Za-z]%',@No),1,'') --删掉一个非数字的字符，循环结束，剩余的为数字部分
	END
	RETURN CONVERT(varchar(100),@No)
END
--select dbo.F_GetChar('wwww23')
#T=数据库的磁盘使用情况 SQL 2008 R2 报表

declare @dbsize bigint 
declare @logsize bigint 
declare @database_size_mb float  
declare @unallocated_space_mb float  
declare @reserved_mb float  
declare @data_mb float  
declare @log_size_mb float
declare @index_mb float  
declare @unused_mb float  
declare @reservedpages bigint 
declare @pages bigint 
declare @usedpages bigint

select @dbsize = sum(convert(bigint,case when status & 64 = 0 then size else 0 end)) 
        ,@logsize = sum(convert(bigint,case when status & 64 != 0 then size else 0 end)) 
from dbo.sysfiles 

select @reservedpages = sum(a.total_pages) 
        ,@usedpages = sum(a.used_pages) 
        ,@pages = sum(CASE 
                        WHEN it.internal_type IN (202,204) THEN 0 
                        WHEN a.type != 1 THEN a.used_pages 
                        WHEN p.index_id < 2 THEN a.data_pages 
                        ELSE 0 
                     END) 
from sys.partitions p  
join sys.allocation_units a on p.partition_id = a.container_id 
left join sys.internal_tables it on p.object_id = it.object_id 
 
select @database_size_mb = (convert(dec (15,2),@dbsize) + convert(dec(15,2),@logsize)) * 8192 / 1048576.0 
select @unallocated_space_mb =(case 
                                when @dbsize >= @reservedpages then (convert (dec (15,2),@dbsize) - convert (dec (15,2),@reservedpages)) * 8192 / 1048576.0  
                                else 0  
                              end)
                               
select  @reserved_mb = @reservedpages * 8192 / 1048576.0 
select  @data_mb = @pages * 8192 / 1048576.0 
select  @log_size_mb = convert(dec(15,2),@logsize) * 8192 / 1048576.0
select  @index_mb = (@usedpages - @pages) * 8192 / 1048576.0 
select  @unused_mb = (@reservedpages - @usedpages) * 8192 / 1048576.0

select 
        @database_size_mb as 'database_size_mb'
,       @reserved_mb as 'reserved_mb'
,       @unallocated_space_mb as 'unallocated_space_mb'
,       (@reserved_mb + @unallocated_space_mb) as 'data_size'
,       @log_size_mb as 'transaction_log_size'
,       cast(@unallocated_space_mb*100.0/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as  'unallocated'
,       cast(@reserved_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as 'reserved'
,       cast(@data_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as 'data'
,       cast(@index_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2)) as 'index_1'
,       cast(@unused_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as 'unused';


#T=查询所有数据库read DMV
SELECT TOP 10
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName'))
	, DatabaseName = DB_NAME(qt.dbid)
	,[Total_Logical_Reads] = SUM(total_logical_reads)
	,[Total_Writes] = SUM(total_logical_writes)
	,[Total_Physical Reads] =SUM(total_physical_reads)
	,[Total_Duration] = SUM(qs.total_elapsed_time)
	,[Total_CPU] = SUM(qs.total_worker_time )
	,[Execution_count] = SUM(qs.execution_count)
	,min(qs.creation_time) as [最早编译计划的时间]
	,max(qs.last_execution_time) as [最晚上次开始执行计划的时间]
	--,[Individual_Query] = SUBSTRING
	--						(
	--							qt.text,
	--							qs.statement_start_offset/2,
	--							(
	--								CASE
	--									WHEN qs.statement_end_offset = -1
	--										THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2
	--									ELSE
	--										qs.statement_end_offset 
	--								END
	--								- qs.statement_start_offset
	--							) /2
	--						)
	--,[Parent_Query] = qt.text
	, @@version as Version
FROM
	sys.dm_exec_query_stats qs
		CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
WHERE
	qt.dbid is not null
GROUP BY
	DB_NAME(qt.dbid)
ORDER BY
	[Total_Logical_Reads] DESC
#T=查询所有数据库空间 sys.master_files
--===========================================================================
--数据库文件大小
select
	*
	--, COUNT(distinct left([DatabaseFile],1)) OVER(PARTITION BY ServerName) AS [ServerDatabasesDisks]
	, sum([DatabaseSize(MB)]) OVER(PARTITION BY ServerName) AS [ServerSumDatabasesSize(MB)]
from
(
	select
		top 100 percent
		ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName'))
		, a.name as DatabaseName
		, count(distinct b.physical_name) as [DatabaseFilesCount]
		, count(distinct left(b.physical_name,1)) as [DatabaseDisksCount]
		, sum(b.size) as [DatabaseSize(8KB)]
		, sum(1.0 * b.size/128) as [DatabaseSize(MB)]
	from
		sys.databases a
			left join sys.master_files b
				on a.database_id = b.database_id
	group by
		a.name
	order by
		[DatabaseSize(8KB)] desc,
		a.name
) T
--===========================================================================
--数据库文件明晰
select
	a.database_id
	, a.name
	, a.create_date
	, b.physical_name
	, 1.0 * b.size/128 [size(MB)]
	, b.type
	, b.type_desc
	--, *
from
	sys.databases a
		left join sys.master_files b
			on a.database_id = b.database_id
order by
	a.database_id
--===========================================================================
--所有数据库文件大小
select
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName'))
	, count(distinct database_id) as [ServerDatabasesCount]
	, count(distinct physical_name) as [ServerDatabasesFile]
	, count(distinct left(physical_name,3)) as [ServerDatabasesDisksCount]
	, sum([size]) as [ServerSumDatabasesSize(8KB)]
	, sum(1.0 * [size]/128) as [ServerSumDatabasesSize(MB)]
	, @@version as [Version]
from
	sys.master_files
--===========================================================================
--各磁盘的空间占用
declare @T1 table
(
	drive nvarchar(2)
	, OS_Free_Space_MB int
);
insert into @T1
exec ('xp_fixeddrives')
select
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName'))
	, b.*
	, a.*
from
	@T1 a
		left join
				(
				select
					left(physical_name, 3) as [ServerDisk]
					, count(distinct database_id) as [ServerDiskDatabasesCount]
					, sum([size]) as [ServerSumDatabasesSize(8KB)]
					, sum(1.0 * [size]/128) as [ServerSumDatabasesSize(MB)]
					--, @@version as [Version]
				from
					sys.master_files with(nolock)
				group by
					left(physical_name, 3)
				) b
			on left(a.drive,1) = left(b.[ServerDisk],1)
order by
	drive

#T=查询数据库中表空间使用状况 All DataBases Tables
--查询数据库中表空间使用状况
/*-- ===================================================================
版本: SQL Server 2000, 2005
功能: 查询数据库中表空间使用状况
=================================================================== --*/
USE Master

SELECT
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName')),
	DatabaseID = DB_ID(),
	DatabaseName = DB_NAME(),
	ObjectID = DATA.id,
	Owner = USER_NAME(DATA.uid),
	ObjectName = DATA.Name,
	FileGroupName,
	Reserved = CONVERT(decimal(15, 2), DATA.Reserved / SPER.PageSperMB),
	DataSize = CONVERT(decimal(15, 2), (DATA.DataSize + DATA.[TextSize]) / SPER.PageSperMB),
	IndexSize = CONVERT(decimal(15, 2), (DATA.IndexSize - DATA.DataSize - DATA.[TextSize]) / SPER.PageSperMB),
	UnUsedSize = CONVERT(decimal(15, 2), (DATA.Reserved - DATA.IndexSize) / SPER.PageSperMB),
	DATA.Rows
	into #ttt
FROM(
	SELECT
		O.id, O.uid, O.name, O.xtype,
		Reserved = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.reserved) ELSE 0 END), 0),
		DataSize = ISNULL(SUM(CASE WHEN IX.indid < 2 THEN CONVERT(dec(15), IX.dpages) ELSE 0 END), 0),
		[TextSize] = ISNULL(SUM(CASE WHEN IX.indid = 255 THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		IndexSize = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		Rows = ISNULL(MAX(CASE WHEN IX.indid < 2 THEN IX.rows ELSE 0 END), 0),
		FileGroupName = max(sfg.GroupName)
	FROM dbo.sysindexes IX WITH(NOLOCK)
		INNER JOIN dbo.sysobjects O WITH(NOLOCK)
			ON IX.id = O.id
		inner join sysfiles sf WITH(NOLOCK)
					on ix.groupid = sf.groupid
		inner join sysfilegroups sfg WITH(NOLOCK)
					on sf.groupid = sfg.groupid
	WHERE O.xtype IN ( 'U')--, 'S')
		AND O.status > =0
		AND (IX.indid < 2 OR IX.indid = 255)
	GROUP BY O.id, O.uid, O.name, O.xtype
)DATA
	CROSS JOIN(
		SELECT PageSperMB = 1048576. / low, low
		FROM master.dbo.spt_values
		WHERE number = 1
				AND type = 'E'
	)SPER
where
	1 = 0
ORDER BY ObjectName, Owner


--GO


EXEC sp_MSForEachDB  'USE [?];
insert into #ttt
--================================================
SELECT
	ServerName = CONVERT(sysname, SERVERPROPERTY(''ServerName'')),
	DatabaseID = DB_ID(),
	DatabaseName = DB_NAME(),
	ObjectID = DATA.id,
	Owner = USER_NAME(DATA.uid),
	ObjectName = DATA.Name,
	FileGroupName,
	Reserved = CONVERT(decimal(15, 2), DATA.Reserved / SPER.PageSperMB),
	DataSize = CONVERT(decimal(15, 2), (DATA.DataSize + DATA.[TextSize]) / SPER.PageSperMB),
	IndexSize = CONVERT(decimal(15, 2), (DATA.IndexSize - DATA.DataSize - DATA.[TextSize]) / SPER.PageSperMB),
	UnUsedSize = CONVERT(decimal(15, 2), (DATA.Reserved - DATA.IndexSize) / SPER.PageSperMB),
	DATA.Rows
FROM(
	SELECT
		O.id, O.uid, O.name, O.xtype,
		Reserved = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.reserved) ELSE 0 END), 0),
		DataSize = ISNULL(SUM(CASE WHEN IX.indid < 2 THEN CONVERT(dec(15), IX.dpages) ELSE 0 END), 0),
		[TextSize] = ISNULL(SUM(CASE WHEN IX.indid = 255 THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		IndexSize = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		Rows = ISNULL(MAX(CASE WHEN IX.indid < 2 THEN IX.rows ELSE 0 END), 0),
		FileGroupName = max(sfg.GroupName)
	FROM dbo.sysindexes IX WITH(NOLOCK)
		INNER JOIN dbo.sysobjects O WITH(NOLOCK)
			ON IX.id = O.id
		inner join sysfiles sf WITH(NOLOCK)
					on ix.groupid = sf.groupid
		inner join sysfilegroups sfg WITH(NOLOCK)
					on sf.groupid = sfg.groupid
	WHERE O.xtype IN ( ''U'')--, ''S'')
		AND O.status > =0
		AND (IX.indid < 2 OR IX.indid = 255)
	GROUP BY O.id, O.uid, O.name, O.xtype
)DATA
	CROSS JOIN(
		SELECT PageSperMB = 1048576. / low, low
		FROM master.dbo.spt_values
		WHERE number = 1
				AND type = ''E''
	)SPER
ORDER BY ObjectName, Owner
--================================================
'

select *
from #ttt
order by 1,2,3,4
--drop table #ttt

#T=查询数据库中表空间使用状况 邹建
--查询数据库中表空间使用状况
/*-- ===================================================================
版本: SQL Server 2000, 2005
功能: 查询数据库中表空间使用状况
=================================================================== --*/
--USE [要查询表空间信息的库名]
GO
SELECT
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName')),
	DatabaseID = DB_ID(),
	DatabaseName = DB_NAME(),
	ObjectID = DATA.id,
	Owner = USER_NAME(DATA.uid),
	ObjectName = DATA.Name,
	FileGroupName,
	Reserved = CONVERT(decimal(15, 2), DATA.Reserved / SPER.PageSperMB),
	DataSize = CONVERT(decimal(15, 2), (DATA.DataSize + DATA.[TextSize]) / SPER.PageSperMB),
	IndexSize = CONVERT(decimal(15, 2), (DATA.IndexSize - DATA.DataSize - DATA.[TextSize]) / SPER.PageSperMB),
	UnUsedSize = CONVERT(decimal(15, 2), (DATA.Reserved - DATA.IndexSize) / SPER.PageSperMB),
	DATA.Rows
FROM(
	SELECT
		O.id, O.uid, O.name, O.xtype,
		Reserved = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.reserved) ELSE 0 END), 0),
		DataSize = ISNULL(SUM(CASE WHEN IX.indid < 2 THEN CONVERT(dec(15), IX.dpages) ELSE 0 END), 0),
		[TextSize] = ISNULL(SUM(CASE WHEN IX.indid = 255 THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		IndexSize = ISNULL(SUM(CASE WHEN IX.indid IN (0, 1, 255) THEN CONVERT(dec(15), IX.used) ELSE 0 END), 0),
		Rows = ISNULL(MAX(CASE WHEN IX.indid < 2 THEN IX.rows ELSE 0 END), 0),
		FileGroupName = max(sfg.GroupName)
	FROM dbo.sysindexes IX WITH(NOLOCK)
		INNER JOIN dbo.sysobjects O WITH(NOLOCK)
			ON IX.id = O.id
		inner join sysfiles sf WITH(NOLOCK)
					on ix.groupid = sf.groupid
		inner join sysfilegroups sfg WITH(NOLOCK)
					on sf.groupid = sfg.groupid
	WHERE O.xtype IN ( 'U')--, 'S')
		AND O.status > =0
		AND (IX.indid < 2 OR IX.indid = 255)
	GROUP BY O.id, O.uid, O.name, O.xtype
)DATA
	CROSS JOIN(
		SELECT PageSperMB = 1048576. / low, low
		FROM master.dbo.spt_values
		WHERE number = 1
				AND type = 'E'
	)SPER
ORDER BY ObjectName, Owner
GO

#T=查询数据库空间使用状况 邹建
查询数据库空间使用状况
/*-- ===================================================================
版本: SQL Server 2000, 2005
功能: 查询数据库空间使用状况
=================================================================== --*/
USE [要查询空间信息的库名]
GO
SELECT
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName')),
	DatabaseID = DB_ID(),
	DatabaseName = DB_NAME(),
	DatabaseSize = CONVERT(decimal(15, 2), DB.DbSize / SPER.PageSperMB),
	DataFileSize = CONVERT(decimal(15, 2), DB.DataFileSize / SPER.PageSperMB),
	LogFileSize = CONVERT(decimal(15, 2), DB.LogFileSize / SPER.PageSperMB),
	UnAllocated = CONVERT(decimal(15, 2), (DB.DataFileSize - DATA.Reserved) / SPER.PageSperMB),
	DataReserved = CONVERT(decimal(15, 2), DATA.Reserved / SPER.PageSperMB),
	DataSize = CONVERT(decimal(15, 2), (DATA.DataSize + DATA.[TextSize]) / SPER.PageSperMB),
	IndexSize = CONVERT(decimal(15, 2), (DATA.IndexSize - DATA.DataSize - DATA.[TextSize]) / SPER.PageSperMB),
	UnUsedSize = CONVERT(decimal(15, 2), (DATA.Reserved - DATA.IndexSize) / SPER.PageSperMB),
	CountProcedure = OBJS.ProcudureS,
	CountFunction = OBJS.FunctionS,
	CountTrigger = OBJS.TriggerS,
	CountUserTable = OBJS.TableS,
	CountView = OBJS.ViewS,
	RecoveryMode = CONVERT(varchar(12), DATABASEPROPERTYEX(DB_NAME(), N'Recovery')),
	PrimaryDrive = CONVERT(char(1), (
			SELECT TOP 1 UPPER(LEFT(FileName, 1))
			FROM master.dbo.sysdatabases WITH(NOLOCK)
			WHERE dbid = DB_ID()))
FROM(
	SELECT
		DbSize = ISNULL(SUM(CONVERT(dec(15), size)), 0),
		DataFileSize = ISNULL(SUM(CASE WHEN status & 0x40 =0 THEN CONVERT(dec(15), size) ELSE 0 END), 0),
		LogFileSize = ISNULL(SUM(CASE WHEN status & 0x40 =0 THEN 0 ELSE CONVERT(dec(15), size) END), 0)
	FROM dbo.sysfiles WITH (NOLOCK)
)DB
	CROSS JOIN(
		SELECT
			Reserved = ISNULL(SUM(CASE WHEN indid IN (0, 1, 255) THEN CONVERT(dec(15), reserved) ELSE 0 END), 0),
			DataSize = ISNULL(SUM(CASE WHEN indid < 2 THEN CONVERT(dec(15), dpages) ELSE 0 END), 0),
			[TextSize] = ISNULL(SUM(CASE WHEN indid = 255 THEN CONVERT(dec(15), used) ELSE 0 END), 0),
			IndexSize = ISNULL(SUM(CASE WHEN indid IN (0, 1, 255) THEN CONVERT(dec(15), used) ELSE 0 END), 0)
		FROM dbo.sysindexes WITH(NOLOCK)
		WHERE (indid < 2 OR indid = 255)
	)DATA
	CROSS JOIN(
		SELECT PageSperMB = 1048576. / low
		FROM master.dbo.spt_values
		WHERE number = 1
				AND type = 'E'
	)SPER
	CROSS JOIN(
		SELECT
			TableS = SUM(CASE xtype WHEN 'U' THEN 1 ELSE 0 END),
			ProcudureS = SUM(CASE xtype WHEN 'P' THEN 1 ELSE 0 END),
			ViewS = SUM(CASE xtype WHEN 'V' THEN 1 ELSE 0 END),
			TriggerS = SUM(CASE xtype WHEN 'TR' THEN 1 ELSE 0 END),
			FunctionS = SUM(CASE WHEN xtype IN('FN', 'IF', 'TF') THEN 1 ELSE 0 END)
		FROM dbo.sysobjects
	)OBJS
GO

#T=汇总行 grouping rollup pivot
USE [Funds]
GO
/****** Object:  StoredProcedure [dbo].[zsp_Calc]    Script Date: 2013/11/14 12:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[zsp_Calc]
as
begin
;with T
as
(
	SELECT
		 [净值日期]
		 ,[基金]
		 , min([万份基金单位收益]) as [万份基金单位收益]
		 --, max([七日年化收益率]) as [七日年化收益率]
	FROM 
		[基金收益]
	group by
		[基金]
		,[净值日期]
)
, TT
as
(
select
	TOP
		100 percent
	[净值日期]
	, [工银7天理财A]
	, [余额宝]
	, [招商理财7天A级]
from
	T
PIVOT
(
	avg([万份基金单位收益])
	FOR
		[基金] IN
	(
		[工银7天理财A]
		,[余额宝]
		,[招商理财7天A级]
	)
) AS pvt
order by
	1
)
, TTT
as
(
select
	[基金]
	, max([万份基金单位收益]) as [万份基金单位最大收益]
	, min([万份基金单位收益]) as [万份基金单位最小收益]
	, avg([万份基金单位收益]) as [万份基金单位平均收益]
	, max([七日年化收益率]) as [七日年化最大收益率]
	, min([七日年化收益率]) as [七日年化最小收益率]
	, avg([七日年化收益率]) as [七日年化平均收益率]
from
	[基金收益]
group by
	[基金]
)
select
	*
from
	TT


;with T
as
(
	select
		ROW_NUMBER() over
			(
				order by
					[净值日期]
					,[基金]
					,[万份基金单位收益]
					,[七日年化收益率]
			) as F1
		,[净值日期]
		,[基金]
		,[万份基金单位收益]
		,[七日年化收益率]
	from
		[基金收益]
)
select
	--F1
	--,
	case
		when
			GROUPING(F1) = 1
				then
					getdate()
		else
			max([净值日期])
	end
	,case
		when
			GROUPING(F1) = 1
				then
					'合计'
		else
			max([基金])
	end
	,sum([万份基金单位收益])
	,sum([七日年化收益率]) 
from
	T
group by
	rollup
		(
			F1
		)

end

#T=生日查询
--测试数据
--http://topic.csdn.net/t/20040908/12/3351763.html

declare @BeginDate date = '2013-12-30' --getdate()
declare @ int = 70
declare @EndDate date = dateadd(day, @, @BeginDate)
declare @TodayDate date = getdate()

select
	@BeginDate
	,@EndDate

;with persons
as
(
	SELECT 1 as ID,'aa' as [Name],cast('1999-01-01' as date) as Birthday 
	UNION ALL
	SELECT 2,'bb','1996-02-29'
	UNION ALL
	SELECT 3,'bb','1934-03-01'
	UNION ALL
	SELECT 4,'bb','1966-04-01'
	UNION ALL
	SELECT 5,'bb','1997-05-01'
	UNION ALL
	SELECT 6,'bb','1922-11-21'
	UNION ALL
	SELECT 7,'bb','1989-12-11'
)
,T
as
(
	select
		*
		,
		datediff(year, birthday, @BeginDate)
		+
		case
			when
				datediff(year, birthday, @BeginDate)
				!= datediff(year, birthday, @EndDate)
					then
						1
			else
				0
		end as years
					
	from
		persons
)
, TT
as
(
	select
		*
		, dateadd(year, years, birthday) as RecentBirthday
	from
		T

)
,TTT
as
(
	select
		*
		,
		datediff(year,birthday,RecentBirthday)
		-
		case
			when
				datediff(day,dateadd(year,datediff(year,birthday,@TodayDate),birthday),@TodayDate) >= 0
					then
					0
			else
					1
		end as TodayAge
	from
		TT

)
select
	*
from
	TTT
where
	datediff(year, Birthday, @BeginDate)
	+
	case
		when
			dateadd(year, datediff(year, Birthday, @BeginDate), Birthday) < @BeginDate
				then
					1
		else
					0
	end
	<
	datediff(year, Birthday, @EndDate)
	+
	case
		when
			dateadd(year, datediff(year, Birthday, @EndDate), Birthday) <= @EndDate
				then
					1
		else
					0
	end



DECLARE @t TABLE
(
	ID int,
	Name varchar(10),
	Birthday datetime
)
INSERT @t
SELECT 1,'aa','1999-01-01'
UNION ALL
SELECT 2,'bb','1996-02-29'
UNION ALL
SELECT 3,'bb','1934-03-01'
UNION ALL
SELECT 4,'bb','1966-04-01'
UNION ALL
SELECT 5,'bb','1997-05-01'
UNION ALL
SELECT 6,'bb','1922-11-21'
UNION ALL
SELECT 7,'bb','1989-12-11'

--查询 2003-12-05 至 2004-02-28 生日的记录
DECLARE 
	@b datetime,
	@e datetime
SELECT
	@b = '2003-11-21',
	@e = '2004-02-28'--,
	--@e = '2006-02-28'

select
	*
from
	@T
where
	datediff(year, Birthday, @b)
	+ case when dateadd(year, datediff(year, Birthday, @b), Birthday) < @b
				then 1
				else 0
		end
	<
	datediff(year, Birthday, @e)
	+ case when dateadd(year, datediff(year, Birthday, @e), Birthday) <= @e
				then 1
				else 0
		end

#T=短信额度控制
USE [SmsPlatform]
GO
/****** Object:  StoredProcedure [dbo].[usp_SmsLimitCount_V6]    Script Date: 06/17/2011 12:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zhaoyan
-- Create date: 2009-5-7
-- Description:	判断客户端是否能下行短信，如能则完成一次计数
-- =============================================
ALTER PROCEDURE [dbo].[usp_SmsLimitCount_V6]
						@userID int,
						@smn varchar(20),
						@directionTable SMSDirectionCount readonly,
						@maxLimit int out,--系统默认日限额
						@maxMonthLimit int out,--系统默认本网月限额
						@maxDifMonthLimit int out,--系统默认异网月限额
						@smsContentHash int,
						@smsContent nvarchar(500),
						@cityCode varchar(6) = '',
						@provinceCode varchar(6)='',
						@dayLeftCount int out,
						@monthLeftCount int out,
						@monthDifLeftCount int out,
						@result int out,
						@accountBalance int out,
						@isRubbishFlag bit
AS
BEGIN

	declare @now datetime
	set @now = getdate()

	declare @today datetime,
			@todayDate date
	set @today = DATEADD(DAY,datediff(day,0,@now),0)
	set @todayDate = @today
	declare @monthfirstday datetime
	set @monthfirstday = DATEADD(month,datediff(month,0,@today),0)
	

	declare @limitCount int = 0,
			@difLimitCount int = 0,
			@upCount int = 0,
			@downCount int = 0,
			@UpdatedRowCount int = 0

	--取本次短信发生额
	select
			@upCount +=
					SUM(case when SMSDirection = 0 then SMSCount else 0 end),
			@downCount +=
					SUM(case when SMSDirection = 1 then SMSCount else 0 end),
			@limitCount+=
					sum(case when SMSDirection = 2 then SMSCount else 0 end),
			@difLimitCount +=
					SUM(case when SMSDirection = 3 then SMSCount else 0 end)
	from
			@directionTable
	group by
			SMSDirection

	
declare @blackListFlag int = 0
--===============================1. 判断是否发方短信号在黑名单中====================================
	if
		(
			@isRubbishFlag = 1
			or
			exists
				(
					select
						1
					from
						SmnBlackList with(nolock)
					where
						--smn = @smn
						--or 
						UserID = @userID
				)
		)
	begin
		
		--在短信号码黑名单中或被垃圾短信拦截机制拦截不能发送短信但吃额度
		if(@isRubbishFlag = 1)
			begin
				set @result = 0
			end 
		else
			begin
				set @result = 2
			end
		--set @result = 2 --00010
		set  @blackListFlag =@result
		
		print(@provinceCode)
		print(@limitCount)
		print(@difLimitCount)
		print(@isRubbishFlag)
		exec usp_InsertSMSProvinceStatsWithRejectedSMS
			@provinceCode,
			@limitCount,
			@difLimitCount,
			@isRubbishFlag
			
		--return
	end

--===============================2. 判断短信内容是否在内容黑名单中====================================

	if (@blackListFlag = 0)
	begin
		if(
			exists
				(
					select 1
					from SmsContentBlackList with(nolock)
					where smsContentHash = @smsContentHash --filtered Noises hash
							--and smsContent = @smsContent
				)
			)
		begin
			--set @blackListFlag = 1
			--在短信内容黑名单中不能发送短信
		set @result = 4 --00100
		set  @blackListFlag =@result
		
				--2010-04-21 自动如黑名单
		--insert into SmnBlackList
		--				(
		--					smn
		--					,userid
		--					,ProvinceCode
		--					,CityCode
		--					--,SignName
		--					,updatetime
		--					,createtime
		--					,Remark
		--					,ContentIntHash
		--					--,HCode
		--					,SMSContent
		--					,MinSendTime
		--					,MaxSendTime
		--					,IntSMCount
		--					,ExtSMCount
		--					,ReqCount
		--					--,NumFlag
		--				)
		--select
		--		@smn
		--		,@userid
		--		,@ProvinceCode
		--		,@CityCode
		--		--,@SignName
		--		,@now--updatetime
		--		,@now--createtime
		--		,'Auto' --Remark
		--		,@smsContentHash --ContentIntHash
		--		--,HCode
		--		,@SMSContent
		--		,@now--MinSendTime
		--		,@now--MaxSendTime
		--		,@LimitCount--IntSMCount
		--		,@difLimitCount--ExtSMCount
		--		,1 --ReqCount
		--		--,NumFlag
		--where
		--	not exists
		--		(
		--			select 1
		--			from smnblacklist with(nolock)
		--			where 
		--				userid = @userid
		--				and smn = @smn
		--		)
		
		
		--exec usp_InsertSMSProvinceStatsWithRejectedSMS
		--	@provinceCode,
		--	@limitCount,
		--	@difLimitCount,
		--	@isRubbishFlag
			--return
		end
	end

	--在待删除列表中不能发短信

	if
		(
			exists
			(
				--select 1
				--from TempUserStatus
				--where SMSNumber is not null
				----and SMSNumber = @smn
				--and UserID = @userID
				--and Status = '05'

				select
					1
				from
					TempUserStatus with(nolock)
				where
					OpenUserID = 
								(
									select
										OpenUserID
									from
										eHomeUserBaseInfo with(nolock)
									where
										UserID = @userID
								)
								and Status = '05'
			)
	)
	begin
		set @result = 17 --10001
		return
	end

	
--===============================3. 判断发方号码是否在临时黑名单====================================

	declare @NSeconds int = 5 --秒
	declare @NCount int = 8 --条
	declare @frozenTime int = 1  --* 60 临时黑名单冻结时间(X * 60分钟 = X 小时)
	
	
	SELECT
		@NSeconds=[Seconds]
		,@NCount=[Counter]
		,@frozenTime=[FrozenMinutes] --* 60
	FROM
		[SmsPlatform].[dbo].[UserFlowControl] with(nolock)
	where
		id = 1

	declare @yearMonth int
	set @yearMonth = YEAR(@now) * 100 + MONTH(@now)

	if
		(
			exists
				(
					select
						1 
					from
						smsTempBlackList with(nolock)
					where
						smsNumber = @smn
						and ReleaseTime > @now
				)
		)
	begin
		--在短信临时黑名单中不能发送短信
		set @result = 7 --00111
		return
	end


--===============================4. 如果发送频率过高将发方号码放入临时黑名单====================================

	declare @beforeNow datetime
	set @beforeNow = DATEADD(SECOND,-1 * @NSeconds,@now)

	declare @HistoryCount int = 0

	select
		@HistoryCount = COUNT(*)
	from
		eHomeSMSContent with(nolock)
	where
		SMSNumber = @smn 
		and sendtime > @beforeNow
		and datediff(second,@beforeNow,SendTime) > 0

	if (@HistoryCount >= @NCount)
	begin
		declare @releaseTime datetime
		set @releaseTime = DATEADD(MINUTE,@frozenTime,@now)
		insert SMSTempBlackList
				(
					SMSNumber
					,ReleaseTime
				)
		values
				(
					@smn,
					@releaseTime
				)
		--短信发送频率过高，放入短信临时黑名单
		set @result = 9 --01001
		return
	end

--============================5. 取地市的短信限额 2009.9.11=======================================

	declare @IntMonthLimit int = -1,
			@ExtMonthLimit int = -1,
			@DailyLimit int = -1,
			@SelectedRowcount int =-1
	exec usp_GetSMSControlQuota
				@userID,
				@provinceCode,
				@cityCode,
				@now,
				@maxMonthLimit out,
				@maxDifMonthLimit out,	
				@maxLimit out
--=============================6. 判断是否超过月限额======================================

	set @upCount = ISNULL(@upCount,0)
	set @downCount = ISNULL(@downCount,0)
	set @limitCount = ISNULL(@limitCount,0)
	set @difLimitCount = ISNULL(@difLimitCount,0)
	
	--发送0条短信不吃额度
	if(@upCount + @downCount + @limitCount + @difLimitCount = 0)
	begin
		set @result = 11  --01011
		return
	end
	
	--初始化月发生额表
	insert eHomeUserSMSCountMonth with (rowlock)
			(
				SMSNumber,
				LimitSMSCount,
				UpSMSCount,
				DownSMSCount,
				StaticsDate,
				LimitDifSMSCount,
				ProvinceCode,
				CityCode,
				UserID
			)
	select
			@smn,
			0,
			0,
			0,
			@monthfirstday,
			0,
			@provinceCode,
			@cityCode,
			@userID
	where
			not exists
				(
					select 1
					from eHomeUserSMSCountMonth with(nolock)
					where UserID = @userID
						and StaticsDate = @monthfirstday
				)

	--初始化日发生额表
	insert eHomeUserSMSCountDaily with (rowlock)
			(
				SMSNumber,
				LimitSMSCount,
				UpSMSCount,
				DownSMSCount,
				IntLimitCount,
				ExtLimitCount,
				StaticsDate,
				ProvinceCode,
				CityCode,
				UserID
			)
		select
				@smn,
				0,
				0,
				0,
				0,
				0,
				@today,
				@provinceCode,
				@cityCode,
				@userID
		where
			not exists
				(
					select
							1
					from
							eHomeUserSMSCountDaily with(nolock)
					where
							UserID = @userID
							and StaticsDate = @today
				)		
	--todo:单独做上行和转发下行的存储过程
	SET XACT_ABORT ON	
	begin transaction
	--上行或转发下行不吃额度(记录发生额后直接Return)	
		update 
			eHomeUserSMSCountMonth with (rowlock)
		set
			UpSMSCount += @upCount,
			DownSMSCount += @downCount,
			@UpdatedRowCount += 1
		where
			UserID = @userID
			and StaticsDate = @monthfirstday -- only one record
			and	@upCount + @downCount > 0

		update
			eHomeUserSMSCountDaily with(rowlock)
		set
			UpSMSCount += @upCount,
			DownSMSCount += @downCount,
			@UpdatedRowCount += 1
		where
			UserID = @userID
			and StaticsDate = @today 
			and	@upCount + @downCount > 0
	commit
	if(@UpdatedRowCount > 0)
	begin
		set @result = 0 --00000
		return
	end
	
	--开始判断额度的事务	
	begin transaction
		declare @tempLimit int,
				@tempDifLimit int
		
		set @UpdatedRowCount = 0

		--优先记公免发生额
		update 
			eHomeUserSMSCountMonth with (rowlock)
		set
			@tempLimit = LimitSMSCount =
				case
					when LimitSMSCount + @limitCount <= @maxMonthLimit 
						then LimitSMSCount + @limitCount 
					else
						@maxMonthLimit
				end,
			@monthLeftCount = @maxMonthLimit - (LimitSMSCount + @limitCount),
			@tempDifLimit = LimitDifSMSCount =
				case
					when LimitDifSMSCount + @difLimitCount <= @maxDifMonthLimit 
						then LimitDifSMSCount + @difLimitCount
					else
						@maxDifMonthLimit
				end,
			@monthDifLeftCount = @maxDifMonthLimit - (LimitDifSMSCount + @difLimitCount)
		where
			UserID = @userID
			and StaticsDate = @monthfirstday -- only one record
			and 
				(
					@difLimitCount >0
					or
					@limitCount >0
				)
					
		declare @leftCount int = 0,
				@sumBalance int = 0

		--如果月限额剩余量分别大于0，直接取个人帐户余额
		if (@monthLeftCount >= 0 and @monthDifLeftCount >= 0)
		begin
			select
				@sumBalance = isnull(SUM(Balance),0)
			from
				[eHomeUserSMSAccount]
			where
				UserID = @userID
				and 
				BeginTime <= @now
				and
				EndTime >= @now
		end
		--否则，扣除相应的个人账户额度
		else
		begin
			--度量扣除公免额度之后是否需要扣个人帐户余额
			set @leftCount =
						(
							case
								when @monthLeftCount >= 0
									then 0
								else
									@monthLeftCount
							end
							+
							case
								when @monthDifLeftCount >= 0
									then 0
								else
									@monthDifLeftCount
							end
						)
			if(@monthLeftCount < 0)
			begin
				set @monthLeftCount = 0		
			end
			
			if(@monthDifLeftCount < 0)
			begin
				set @monthDifLeftCount = 0
			end

			declare @accountID int
			declare @balance int = 0

			DECLARE SMSAccount_cursor CURSOR 
						LOCAL
						FORWARD_ONLY
						DYNAMIC
						SCROLL_LOCKS
			FOR
				SELECT
						--Balance,
						[AccountID]
				FROM
						[eHomeUserSMSAccount]
				where
						UserID = @userID
						and
						BeginTime <= @now
						and
						EndTime >= @now
				order by 
						EndTime,
						Priority desc
				for update of
						Balance

			OPEN SMSAccount_cursor
			FETCH NEXT FROM SMSAccount_cursor
			INTO @accountID

			WHILE @@FETCH_STATUS = 0
			BEGIN

				declare @curAccountAmount int = 0
				declare @curBalance int = 0

				if (@leftCount >= 0)
				begin
					break
				end
				--记录私有帐户发生额
				if (@leftCount < 0)
				begin
					update
						eHomeUserSMSAccount
					set
						@curAccountAmount =
							case
								when Balance + @leftCount < 0
									then Balance
								else
									0 - @leftCount
							end
						,@curBalance =
									Balance =
										case
											when Balance + @leftCount < 0
												then 0
											else
												Balance + @leftCount
										end
						,@leftCount  += balance
					where CURRENT of
						SMSAccount_cursor
					set @sumBalance += @curBalance
					print('cur:' + cast(@curBalance as varchar))
					print('sum:'  + cast(@sumBalance as varchar))
				end

				set @UpdatedRowCount = 0
				update 
					[eHomeUserSMSAccountDailyDetails]
				set 
					@UpdatedRowCount += 1,
					Amount += @curAccountAmount
				where 
					UserID = @userID
					and StaticsDate = @todayDate
					and AccountID = @accountID

				if (@UpdatedRowCount = 0)
				begin
					INSERT [eHomeUserSMSAccountDailyDetails]
						(
							[AccountID]
							,[UserID]
							,[StaticsDate]
							,Amount
						)
					select
						@accountID
						,@userID
						,@now
						,@curAccountAmount
					where
						not exists
						(
							select
									1
							from
									[eHomeUserSMSAccountDailyDetails] with(nolock)
							where
									UserID = @userID
									and StaticsDate = @todayDate
									and AccountID = @accountID
						)
				end
				FETCH NEXT FROM
					SMSAccount_cursor
				INTO @accountID
			END
			CLOSE SMSAccount_cursor
			DEALLOCATE SMSAccount_cursor
		end

		--如果超限则回滚事务
		if (@leftCount < 0)
			begin
				rollback transaction
				--发送短信超限额
				set @result = 13 --01101

				select
						@monthLeftCount = @maxMonthLimit - LimitSMSCount,
						@monthDifLeftCount = @maxDifMonthLimit - LimitDifSMSCount
				from
						eHomeUserSMSCountMonth with (rowlock)
				where
						UserID = @userID
						and StaticsDate = @monthfirstday -- only one record

				--rollback transaction
				set @dayLeftCount = 0
				if (@monthLeftCount < 0)
				begin
					set @monthLeftCount = 0
				end
				if(@monthDifLeftCount < 0)
				begin
					set @monthDifLeftCount = 0
				end

				set @accountBalance = @sumBalance
				return
			end

-- ======================7. 判断是否超过日限额=======================

		set @UpdatedRowCount = 0
		declare @dailyTempLimit int
		set @dailyTempLimit = 0

		--积分帐户同样受每日限额的限制
		update
				eHomeUserSMSCountDaily with(rowlock)
		set
				@UpdatedRowCount += 1,
				@dailyTempLimit = LimitSMSCount = (LimitSMSCount + @limitCount + @difLimitCount),
				IntLimitCount += @limitCount,
				ExtLimitCount += @difLimitCount,
				@dayLeftCount = @maxLimit - @dailyTempLimit
		where
				UserID = @userID
				and StaticsDate = @today
				and
					(
						(
							@limitCount + @difLimitCount > 0 
							and LimitSMSCount <= @maxLimit - @limitCount - @difLimitCount
						)
					)

		--若超过日限额则回滚事务
		if (@UpdatedRowCount = 0)
			begin
				rollback transaction
				--短信发送超过日限额
				set @result = 15 --01111

				--select @@ROWCOUNT,6
				select 
					@dayLeftCount = @maxLimit - LimitSMSCount--Output Parameter
				from 
					eHomeUserSMSCountDaily with(rowlock)
				where 
					UserID = @userID
					and StaticsDate = @today -- only one record
				--rollback transaction

				select
					@monthLeftCount = @monthLeftCount + @limitCount,
					@monthDifLeftCount = @monthDifLeftCount + @difLimitCount

				if(@dayLeftCount < 0)
				begin
					set @dayLeftCount = 0
				end

				set @accountBalance = @sumBalance
				return
			end

			set @accountBalance = @sumBalance
		if(@blackListFlag <> 0)
		begin
			commit transaction
			return
		end
		set @result = 0 -- chenggong 00000
	commit transaction
END

#T=磁盘OS所有数据库数据文件使用情况
alter proc zsp_SpaceMon
as
create table #T
(
	  dbname nvarchar(100)
	, [file_group_name] nvarchar(500)
	, logical_file_name nvarchar(500)
	, physical_file_name nvarchar(500)
	, [space_reserved_MB]decimal(10,2)
	, [space_used_MB] decimal(10,2)
	, [space_unused_MB] decimal(10,2)
);

declare @sql nvarchar(2000)
set @sql  = N'
declare @T table
(
	  file_id int
	, file_group_id int
	, total_extents int
	, used_extents int
	, logical_file_name nvarchar(500) collate database_default
	, physical_file_name nvarchar(500) collate database_default
);

use [?]
insert into @T
exec (''DBCC SHOWFILESTATS'');

insert into #T
(
	dbname --nvarchar(100)
	, [file_group_name] --nvarchar(500)
	, logical_file_name --nvarchar(500)
	, physical_file_name --nvarchar(500)
	, [space_reserved_MB]--decimal(10,2)
	, [space_used_MB] --decimal(10,2)
	, [space_unused_MB] --decimal(10,2)
)
select
	--(row_number() over (order by t2.name))%2 as l1
	''?'' as db
	, t2.name as [file_group_name]
	, t1.logical_file_name
	, t1.physical_file_name
	, cast((total_extents * 64 / 1024.0) as decimal(10,2)) as [space_reserved_MB]
	, cast((used_extents * 64 / 1024.0) as decimal(10,2)) as [space_used_MB]
	, cast(((total_extents - used_extents) * 64 / 1024.0) as decimal(10,2)) as [space_unused_MB]
from
	@T t1
		inner join sys.data_spaces t2
			on t1.file_group_id = t2.data_space_id
order by
	  t2.name
	, t1.logical_file_name
	, t1.physical_file_name
'

exec sp_MSForEachdb @command1=@sql

declare @T1 table
(
	  drive nvarchar(2)
	, OS_Free_Space_MB int
);


insert into @T1
exec ('xp_fixeddrives');


insert into master..SpaceMonLog
(
	  drive
	, OS_Free_Space_MB
	, [db_space_unused_MB]
	, dbCount
	, StampTime
)

select
	  a.drive
	, a.OS_Free_Space_MB
	, T.[db_space_unused_MB]
	, t.dbCount
	, GETDATE() as StampTime
	--into SpaceMonLog
from
	@T1 a
		inner join
			(
				select
					  LEFT(physical_file_name, 1) as drive
					, SUM([space_unused_MB]) as [db_space_unused_MB]
					, isnull(COUNT(distinct dbname), 0) as [dbCount]
				from
					#T
				group by
					LEFT(physical_file_name,1)
			) T
on a.drive = T.drive
order by
	  T.[db_space_unused_MB]
	, a.OS_Free_Space_MB
drop table #T

select
	top 10
	*
from
	master..SpaceMonLog
order by
	stampTime desc

#T=磁盘剩余空间
declare @T1 table
(
	drive nvarchar(2)
	, OS_Free_Space_MB int
);
insert into @T1
exec ('xp_fixeddrives')


select
	ServerName = CONVERT(sysname, SERVERPROPERTY('ServerName'))
	, b.*
	, a.*
from
	@T1 a
		left join
				(
				select
					left(physical_name,3) as [ServerDisk]
					, count(distinct database_id) as [ServerDiskDatabasesCount]
					, sum([size]) as [ServerSumDatabasesSize(8KB)]
					, sum(1.0 * [size]/128) as [ServerSumDatabasesSize(MB)]
					--, @@version as [Version]
				from
					sys.master_files with(nolock)
				group by
					left(physical_name,3)
				) b
			on left(a.drive,1) = left(b.[ServerDisk],1)
order by
	drive

#T=磁盘数据文件使用情况

declare @filestats_temp_table table
(
	file_id int
	,file_group_id int
	,total_extents int
	,used_extents int
	,logical_file_name nvarchar(500) collate database_default
	,physical_file_name nvarchar(500) collate database_default
);

insert into @filestats_temp_table
exec ('DBCC SHOWFILESTATS');

select (row_number() over (order by t2.name))%2 as l1
,t2.name as [file_group_name]
,       t1.logical_file_name
,       t1.physical_file_name
,       cast(case when (total_extents * 64) < 1024 then (total_extents * 64)
                 when (total_extents * 64 / 1024.0) < 1024 then  (total_extents * 64 / 1024.0)
                 else (total_extents * 64 / 1048576.0)
        end as decimal(10,2)) as space_reserved
,       case when (total_extents * 64) < 1024 then 'KB'
                when (total_extents * 64 / 1024.0) < 1024 then  'MB'
                else 'GB'
        end as space_reserved_unit
,		cast(case when (used_extents * 64) < 1024 then (used_extents * 64)
                when (used_extents * 64 / 1024.0) < 1024 then  (used_extents * 64 / 1024.0)
                else (used_extents * 64 / 1048576.0)
        end as decimal(10,2)) as space_used
,		case when (used_extents * 64) < 1024 then 'KB'
                when (used_extents * 64 / 1024.0) < 1024 then  'MB'
                else 'GB'
        end as space_used_unit
from    @filestats_temp_table t1
inner join sys.data_spaces t2 on ( t1.file_group_id = t2.data_space_id );

#T=磁盘数据文件使用情况(MB)

declare @T table
(
	file_id int
	,file_group_id int
	,total_extents int
	,used_extents int
	,logical_file_name nvarchar(500) collate database_default
	,physical_file_name nvarchar(500) collate database_default
);

insert into @T
exec ('DBCC SHOWFILESTATS');

select
	--(row_number() over (order by t2.name))%2 as l1
	t2.name as [file_group_name]
	, t1.logical_file_name
	, t1.physical_file_name
	, cast((total_extents * 64 / 1024.0) as decimal(10,2)) as [space_reserved(MB)]
	, cast((used_extents * 64 / 1024.0) as decimal(10,2)) as [space_used_unit(MB)]
	, cast(((total_extents - used_extents) * 64 / 1024.0) as decimal(10,2)) as [space_unused_unit(MB)]
from
	@T t1
		inner join sys.data_spaces t2
			on t1.file_group_id = t2.data_space_id
order by
	t2.name
	, t1.logical_file_name
	, t1.physical_file_name 

#T=稀疏列 sparse column
/*
在下面的示例中，文档表包含列 DocID 和 Title 的通用集。生产组希望所有生产文档都有一个 ProductionSpecification 列和一个 ProductionLocation 列。市场组希望所有市场文档都有一个 MarketingSurveyGroup 列。

A. 创建具有列集的表
下面的示例创建使用稀疏列并包括列集 SpecialPurposeColumns 的表。该示例在表中插入两行，然后从表中选择数据。

注意： 
该表只有五列，以便易于显示和读取。
 

 复制代码 
 */
USE AdventureWorks2008R2;
GO

CREATE TABLE DocumentStoreWithColumnSet
(DocID int PRIMARY KEY,
Title varchar(200) NOT NULL,
ProductionSpecification varchar(20) SPARSE NULL,
ProductionLocation smallint SPARSE NULL,
MarketingSurveyGroup varchar(20) SPARSE NULL,
MarketingProgramID int SPARSE NULL,
SpecialPurposeColumns XML COLUMN_SET FOR ALL_SPARSE_COLUMNS);
GO
 
/*
B. 使用稀疏列的名称向表中插入数据
下面的示例向示例 A 中创建的表插入两行。这些示例使用稀疏列的名称，而不引用列集。

 复制代码 
 */

INSERT DocumentStoreWithColumnSet (DocID, Title, ProductionSpecification, ProductionLocation)
VALUES (1, 'Tire Spec 1', 'AXZZ217', 27)
GO

INSERT DocumentStoreWithColumnSet (DocID, Title, MarketingSurveyGroup)
VALUES (2, 'Survey 2142', 'Men 25 - 35')
GO
 
/*
C. 使用列集的名称向表中插入数据
下面的示例向示例 A 中创建的表插入第三行。这一次不使用稀疏列的名称，而是使用列集的名称，插入操作以 XML 格式为四个稀疏列中的两列提供值。

 复制代码 
 */
INSERT DocumentStoreWithColumnSet (DocID, Title, SpecialPurposeColumns)
VALUES (3, 'Tire Spec 2', '<ProductionSpecification>AXW9R411</ProductionSpecification><ProductionLocation>38</ProductionLocation>')
GO
 
/*
D. 观察使用 SELECT * 时的列集结果
下面的示例从包含列集的表中选择所有列。它返回具有稀疏列的组合值的 XML 列，而不是单独返回每个稀疏列。

 复制代码 
 */
SELECT * FROM DocumentStoreWithColumnSet ;
 
/*
下面是结果集： 

DocID Title        SpecialPurposeColumns

1      Tire Spec 1  <ProductionSpecification>AXZZ217</ProductionSpecification><ProductionLocation>27</ProductionLocation>

2      Survey 2142  <MarketingSurveyGroup>Men 25 - 35</MarketingSurveyGroup>

3      Tire Spec 2  <ProductionSpecification>AXW9R411</ProductionSpecification><ProductionLocation>38</ProductionLocation>

E. 观察按名称选择列集的结果
因为生产部门对市场数据不感兴趣，所以本示例添加 WHERE 子句以限制输出。本示例使用列集的名称。

 复制代码 
*/
SELECT DocID, Title, SpecialPurposeColumns
FROM DocumentStoreWithColumnSet
WHERE ProductionSpecification IS NOT NULL ;
 
/*
下面是结果集： 

DocID Title        SpecialPurposeColumns

1     Tire Spec 1  <ProductionSpecification>AXZZ217</ProductionSpecification><ProductionLocation>27</ProductionLocation>

3     Tire Spec 2  <ProductionSpecification>AXW9R411</ProductionSpecification><ProductionLocation>38</ProductionLocation>

F. 观察按名称选择稀疏列的结果
当表包含列集时，您仍然可以使用各列名称来查询表，如下例所示。

 复制代码 
 */
SELECT DocID, Title, ProductionSpecification, ProductionLocation 
FROM DocumentStoreWithColumnSet
WHERE ProductionSpecification IS NOT NULL ;
 

/*
下面是结果集： 

DocID Title        ProductionSpecification ProductionLocation

1     Tire Spec 1  AXZZ217                 27

3     Tire Spec 2  AXW9R411                38

G. 使用列集来更新表
下面的示例用第三个记录所在行使用的两个稀疏列的新值来更新该记录。

 复制代码 
*/
UPDATE DocumentStoreWithColumnSet
SET SpecialPurposeColumns = '<ProductionSpecification>ZZ285W</ProductionSpecification><ProductionLocation>38</ProductionLocation>'
WHERE DocID = 3 ;
GO

/*
重要提示： 
使用列集的 UPDATE 语句更新表中的所有稀疏列。未引用的稀疏列将更新为 NULL。
 


下面的示例更新第三个记录，但仅仅指定两个已填充列的其中一列的值。在 UPDATE 语句中未包括第二列 ProductionLocation，所以该列更新为 NULL。

 复制代码 
 */
UPDATE DocumentStoreWithColumnSet
SET SpecialPurposeColumns = '<ProductionSpecification>ZZ285W</ProductionSpecification>'
WHERE DocID = 3 ;
GO
 

#T=索引 Alter index rebuild/reorganize
/****** Object:  StoredProcedure [dbo].[zsp_IndexesReorganizeRebuildSQL]    Script Date: 07/15/2011 10:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[zsp_IndexesReorganizeRebuildSQL]
	  @ReorganizePercent int = 10
	, @RebuildPercent int = 15
	, @Rows int = 10000
	, @Online bit = 1
	, @FillFactor int = 85
	, @IndexType varchar(max) = '1,2' --聚集,非聚集
	, @NeedExecute bit = 0
as
/*
exec zsp_IndexesReorganizeRebuildSQL
				@ReorganizePercent = 0
				, @RebuildPercent = 0
				, @Rows = 0
				, @Online = 1
				, @FillFactor = 0
				, @IndexType = '1,2'
				, @NeedExecute = 1
*/
begin
	set nocount on
	--Microshaoft
	declare @Text varchar(max)
	declare @Table TABLE(id int,F int)
	set @Text = @IndexType
	set @Text = replace(@Text, ' ', '')
	declare @Separator char(1) = ','
	DECLARE @SeparatorLen int
	SET @SeparatorLen = LEN(@Separator + '$') - 2
	set @Text = replace(@Text, ' ', '')
	declare @i int
	set @i = 1
	WHILE CHARINDEX(@Separator, @Text) > 0
	BEGIN
		declare @v varchar(max)
		set @v = (LEFT(@Text, CHARINDEX(@Separator, @Text) - 1))
		INSERT @Table (id, F)
		select
			@i
			, @v
		where
			rtrim(ltrim(@v)) != ''
			and not exists
						(
							select
								1
							from
								@Table
							where
								F = @v
						)
		if @@rowcount > 0
		begin
			set @i = @i + 1
		end
		SET @Text = STUFF(@Text ,1, CHARINDEX(@Separator, @Text) + @SeparatorLen, '')
	END
	INSERT @Table (id, F)
	select
		@i
		, @Text
	where
		rtrim(ltrim(@Text)) != ''
		and not exists
				(
					select
						1
					from
						@Table
					where
						F = @Text
				)
				

	declare @T Table
	(
		[TableName] [varchar](max),
		[IndexName] [varchar](max),
		[IndexType] [varchar](max),
		[avg_fragmentation_in_percent] [float],
		[Rank_avg_fragmentation_in_percent] [int],
		[fill_factor] [tinyint],
		[SQL] [nvarchar](max)
	)
	insert into @T
		(
			[TableName],
			[IndexName],
			[IndexType],
			[avg_fragmentation_in_percent],
			[Rank_avg_fragmentation_in_percent],
			[fill_factor],
			[SQL]
		)
	SELECT

			t.name as TableName
			, ix.Name as IndexName
			, ix.Type_Desc as IndexType
			, avg_fragmentation_in_percent
			, RANK() OVER(ORDER BY avg_fragmentation_in_percent DESC) as Rank_avg_fragmentation_in_percent
			, ix.fill_factor
			
			
			,
				
			

				'ALTER INDEX ['
			+
				ix.name
			+
				'] ON ['
			+
				s.name
			+
				'].['
			+
				t.name
			+
				'] '
			+
				CASE
					WHEN
						ps.avg_fragmentation_in_percent >= @RebuildPercent
							THEN
								'REBUILD'
					ELSE
								'REORGANIZE'
				END
			+
				CASE
					WHEN
						pc.partition_count > 1
							THEN
								' PARTITION = ' + CAST(ps.partition_number AS varchar)
					ELSE
						''
				END
			+
				--Microshaoft
			
			
				' WITH ('
				
			+	
				'ONLINE = '
			
			+
			case
					when
						@Online = 1
						and
						not exists
							(
								select
									1
								from
									sys.index_columns aa
										inner join
											sys.columns bb
												on aa.column_id = bb.column_id
													inner join
														sys.types cc
															on bb.system_type_id = cc.system_type_id

								where
									
									aa.[object_id]=ix.[object_id]
									and
									aa.index_id = ix.index_id
									and
									(
										
										or
										bb.max_length = -1
										or
										cc.name in
												(
												  'image'
												, 'text'
										--		, 'uniqueidentifier'
										--		, 'date'
										--		, 'time'
										--		, 'datetime2'
										--		, 'datetimeoffset'
										--		, 'tinyint'
										--		, 'smallint'
										--		, 'int'
										--		, 'smalldatetime'
										--		, 'real'
										--		, 'money'
										--		, 'datetime'
										--		, 'float'
										--		, 'sql_variant'
												, 'ntext'
										--		, 'bit'
										--		, 'decimal'
										--		, 'numeric'
										--		, 'smallmoney'
										--		, 'bigint'
										--		, 'hierarchyid'
												, 'geometry'
												, 'geography'
												, 'varbinary'
										--		, 'varchar'
										--		, 'binary'
										--		, 'char'
										--		, 'timestamp'
										--		, 'nvarchar'
										--		, 'nchar'
												, 'xml'
										--		, 'sysname'
											)
											
									)
			
							)
						then
							'on'
					else
						'off'
				end
			
			+
				CASE
					WHEN
						@FillFactor > 0 and @FillFactor < 100
							THEN
								', PAD_INDEX = on, FILLFACTOR = '
								+ cast(@FillFactor as varchar)
					ELSE
								', PAD_INDEX = on'
				END
			+
				')' as [SQL]
	FROM
		sys.indexes AS ix with(nolock)
			INNER JOIN
				sys.tables t with(nolock)
					ON
						t.object_id = ix.object_id
			INNER JOIN
				sys.schemas s
					ON
						t.schema_id = s.schema_id
			INNER JOIN
					(
						SELECT
							object_id
							, index_id
							, avg_fragmentation_in_percent
							, partition_number
						FROM
							sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) --with(nolock)
					) ps
					ON
						t.object_id = ps.object_id
						AND ix.index_id = ps.index_id
			INNER JOIN
					(
						SELECT
							object_id
							, index_id
							, COUNT(DISTINCT partition_number) AS partition_count
						FROM
							sys.partitions with(nolock)
						GROUP BY
							object_id
							, index_id
					) pc
					ON
						t.object_id = pc.object_id
						AND ix.index_id = pc.index_id
	WHERE
		ix.Type in
				(
					select
							F
					from
						@Table
				)
		and
		ps.avg_fragmentation_in_percent >= @ReorganizePercent
		AND ix.name IS NOT NULL
		--引用 上面语句是网上的,加了行数判断,也可以用页数量判断
		and exists
				(
					select
						*
					from
						sys.partitions with(nolock)
					where
						object_id = t.object_id
						and [rows] >= @Rows
							/*
								引用
								控制一下记录行数,因为小表的rebuild等会根据很多参数标准来判断是否要去重建。
								网上搜索的判断因子:
								生成查询计划的阀值
								缓存机制,缓存的筛选,LRU算法
								预读机制
								checkpoint减少回滚距离
								智能join判断
								重编译
							*/
				)

	--Microshaoft
	order by
		IndexType
		, TableName
		, avg_fragmentation_in_percent desc

	DECLARE @sql varchar(max)
	declare @ int = 0
	DECLARE var_cursor CURSOR
		LOCAL
		FORWARD_ONLY
		DYNAMIC
		SCROLL_LOCKS
	FOR
	select
		[sql]
	from
		@T
	OPEN
		var_cursor
	FETCH NEXT FROM
		var_cursor
	INTO
		@sql
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		set @ += 1
		PRINT '-- print: ' + cast(@ as varchar) + ' at ' + convert(varchar(100), getdate(), 121)
		PRINT @sql
		if @NeedExecute = 1
		begin
			PRINT '-- begin execute: ' + cast(@ as varchar) + ' at ' + convert(varchar(100), getdate(), 121)
			
			begin try
			
					exec (@sql)	
			end try
			begin catch
					print 'catch error: ' + cast(ERROR_LINE() AS varchar)
						ERROR_MESSAGE()
				  --  SELECT
						--ERROR_NUMBER() AS ErrorNumber,
						--ERROR_SEVERITY() AS ErrorSeverity,
						--ERROR_STATE() AS ErrorState,
						--ERROR_PROCEDURE() AS ErrorProcedure,
						--ERROR_LINE() AS ErrorLine,
						--ERROR_MESSAGE() AS ErrorMessage;

			end catch	
			
			PRINT '-- end execute: ' + cast(@ as varchar) + ' at ' + convert(varchar(100), getdate(), 121)
		end
		PRINT char(10) + char(13)
		FETCH NEXT FROM
			var_cursor
		INTO
			@sql
	END
	CLOSE var_cursor
	DEALLOCATE var_cursor
	set nocount off
end
#T=索引 rebuild/REORGANIZE
SELECT 
		t.name as tablename
		,
			'ALTER INDEX ['
		+
			ix.name
		+
			'] ON ['
		+
			s.name
		+
			'].['
		+
			t.name
		+
			'] '
		+
			CASE
				WHEN
					ps.avg_fragmentation_in_percent > 15
						THEN
							'REBUILD'
				ELSE
							'REORGANIZE'
			END
		+
			CASE
				WHEN
						pc.partition_count > 1
							THEN ' PARTITION = ' + CAST(ps.partition_number AS nvarchar(MAX))
				ELSE ''
			END,
		avg_fragmentation_in_percent
FROM
	sys.indexes AS ix with(nolock)
		INNER JOIN
			sys.tables t with(nolock)
				ON
					t.object_id = ix.object_id
		INNER JOIN
			sys.schemas s
				ON
					t.schema_id = s.schema_id
		INNER JOIN
				(
					SELECT
						object_id
						, index_id
						, avg_fragmentation_in_percent
						, partition_number
					FROM
						sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) with(nolock)
				) ps
				ON
					t.object_id = ps.object_id
					AND ix.index_id = ps.index_id
		INNER JOIN
				(
					SELECT
						object_id
						, index_id
						, COUNT(DISTINCT partition_number) AS partition_count
					FROM
						sys.partitions with(nolock)
					GROUP BY
						object_id
						, index_id
				) pc
				ON
					t.object_id = pc.object_id
					AND ix.index_id = pc.index_id
WHERE
	ps.avg_fragmentation_in_percent > 10
	AND ix.name IS NOT NULL
	--上面语句是网上的，加了行数判断，也可以用页数量判断
	and exists
			(
				select
					*
				from
					sys.partitions with(nolock)
				where
					object_id = t.object_id
					and rows > 10000
						/*
							控制一下记录行数，因为小表的rebuild等会根据很多参数标准来判断是否要去重建。
							网上搜索的判断因子：
							生成查询计划的阀值
							缓存机制，缓存的筛选，LRU算法
							预读机制
							checkpoint减少回滚距离
							智能join判断
							重编译
						*/
			)

go

-- Ensure a USE <databasename> statement has been executed first.
SET NOCOUNT ON;
DECLARE @objectid int;
DECLARE @indexid int;
DECLARE @partitioncount bigint;
DECLARE @schemaname nvarchar(130); 
DECLARE @objectname nvarchar(130); 
DECLARE @indexname nvarchar(130); 
DECLARE @partitionnum bigint;
DECLARE @partitions bigint;
DECLARE @frag float;
DECLARE @command nvarchar(4000); 
-- Conditionally select tables and indexes from the sys.dm_db_index_physical_stats function 
-- and convert object and index IDs to names.
SELECT
	object_id AS objectid,
	index_id AS indexid,
	partition_number AS partitionnum,
	avg_fragmentation_in_percent AS frag
INTO #work_to_do
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED')
WHERE avg_fragmentation_in_percent > 10.0 AND index_id > 0;

-- Declare the cursor for the list of partitions to be processed.
DECLARE partitions CURSOR FOR SELECT * FROM #work_to_do;

-- Open the cursor.
OPEN partitions;

-- Loop through the partitions.
WHILE (1=1)
	BEGIN;
		FETCH NEXT
		   FROM partitions
		   INTO @objectid, @indexid, @partitionnum, @frag;
		IF @@FETCH_STATUS < 0 BREAK;
		SELECT @objectname = QUOTENAME(o.name), @schemaname = QUOTENAME(s.name)
		FROM sys.objects AS o
		JOIN sys.schemas as s ON s.schema_id = o.schema_id
		WHERE o.object_id = @objectid;
		SELECT @indexname = QUOTENAME(name)
		FROM sys.indexes
		WHERE  object_id = @objectid AND index_id = @indexid;
		SELECT @partitioncount = count (*)
		FROM sys.partitions
		WHERE object_id = @objectid AND index_id = @indexid;

-- 30 is an arbitrary decision point at which to switch between reorganizing and rebuilding.
		IF @frag < 30.0
			SET @command = N'ALTER INDEX ' + @indexname + N' ON ' + @schemaname + N'.' + @objectname + N' REORGANIZE';
		IF @frag >= 30.0
			SET @command = N'ALTER INDEX ' + @indexname + N' ON ' + @schemaname + N'.' + @objectname + N' REBUILD';
		IF @partitioncount > 1
			SET @command = @command + N' PARTITION=' + CAST(@partitionnum AS nvarchar(10));
		EXEC (@command);
		PRINT N'Executed: ' + @command;
	END;

-- Close and deallocate the cursor.
CLOSE partitions;
DEALLOCATE partitions;

-- Drop the temporary table.
DROP TABLE #work_to_do;
GO
#T=获取拼音
CREATE FUNCTION dbo.f_GetPY(
	@str nvarchar(4000)
)RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @py TABLE(
		ch char(1),
		hz1 nchar(1)
			COLLATE Chinese_PRC_CS_AS_KS_WS,
		hz2 nchar(1)
			COLLATE Chinese_PRC_CS_AS_KS_WS)
	INSERT @py SELECT 'A', N'吖', N'鏊'
	UNION  ALL SELECT 'B', N'八', N'簿'
	UNION  ALL SELECT 'C', N'嚓', N'错'
	UNION  ALL SELECT 'D', N'哒', N'跺'
	UNION  ALL SELECT 'E', N'屙', N'贰'
	UNION  ALL SELECT 'F', N'发', N'馥'
	UNION  ALL SELECT 'G', N'旮', N'过'
	UNION  ALL SELECT 'H', N'铪', N'蠖'
	UNION  ALL SELECT 'J', N'丌', N'竣'
	UNION  ALL SELECT 'K', N'咔', N'廓'
	UNION  ALL SELECT 'L', N'垃', N'雒'
	UNION  ALL SELECT 'M', N'妈', N'穆'
	UNION  ALL SELECT 'N', N'拿', N'糯'
	UNION  ALL SELECT 'O', N'噢', N'沤'
	UNION  ALL SELECT 'P', N'趴', N'曝'
	UNION  ALL SELECT 'Q', N'七', N'群'
	UNION  ALL SELECT 'R', N'蚺', N'箬'
	UNION  ALL SELECT 'S', N'仨', N'锁'
	UNION  ALL SELECT 'T', N'他', N'箨'
	UNION  ALL SELECT 'W', N'哇', N'鋈'
	UNION  ALL SELECT 'X', N'夕', N'蕈'
	UNION  ALL SELECT 'Y', N'丫', N'蕴'
	UNION  ALL SELECT 'Z', N'匝', N'做'

	DECLARE
		@i int
	-- 取要查询的字符串中的第一个汉字
	SET @i = PATINDEX('%[吖-做]%' COLLATE Chinese_PRC_CS_AS_KS_WS, @str)
	WHILE @i > 0
		SELECT
			-- 将找到的第一个汉字用对应的拼音首字母替换
			@str = REPLACE(@str, SUBSTRING(@str, @i, 1), ch),
			-- 取下一个要处理的汉字的位置
			@i=PATINDEX('%[吖-做]%' COLLATE Chinese_PRC_CS_AS_KS_WS,@str)
		FROM @py
		WHERE SUBSTRING(@str, @i, 1) BETWEEN hz1 AND hz2
	RETURN(@str)
END
GO

#T=表的磁盘使用情况 SQL 2008 R2 报表
--dbcc showfilestats
--DBCC SQLPERF(LOGSPACE)
SELECT
	--(row_number() over(order by a3.name, a2.name))%2 as l1,
	a3.name AS [schemaname],
	a2.name AS [tablename],
	a1.rows as row_count,
	((a1.reserved + ISNULL(a4.reserved,0))* 8)
	/1024.0--/1024.0
	AS [reserved(MB)], 
	a1.data * 8
	/1024.0--/1024.0
	AS [data(MB)],
	(
		CASE
			WHEN (a1.used + ISNULL(a4.used,0)) > a1.data 
				THEN (a1.used + ISNULL(a4.used,0)) - a1.data 
			ELSE
				0 END
	) * 8
	/1024.0--/1024.0
	 AS [index_size(MB)],
	(
		CASE
			WHEN (a1.reserved + ISNULL(a4.reserved,0)) > a1.used
				THEN (a1.reserved + ISNULL(a4.reserved,0)) - a1.used
			ELSE
				0
			END
	) * 8
	/1024.0--/1024.0
	AS [unused(MB)]
FROM
	(
		SELECT 
			ps.object_id,
			SUM (
					CASE
						WHEN
							(ps.index_id < 2)
								THEN row_count
						ELSE 0
					END
				) AS [rows],
			SUM (ps.reserved_page_count) AS reserved,
			SUM (
					CASE
						WHEN
							(ps.index_id < 2)
								THEN (ps.in_row_data_page_count + ps.lob_used_page_count + ps.row_overflow_used_page_count)
						ELSE
							(ps.lob_used_page_count + ps.row_overflow_used_page_count)
					END
				) AS data,
			SUM (ps.used_page_count) AS used
		FROM
			sys.dm_db_partition_stats ps
		GROUP BY
			ps.object_id
	) AS a1
		LEFT OUTER JOIN 
			(
				SELECT 
					it.parent_id,
					SUM(ps.reserved_page_count) AS reserved,
					SUM(ps.used_page_count) AS used
				FROM
					sys.dm_db_partition_stats ps
						INNER JOIN sys.internal_tables it 
							ON (it.object_id = ps.object_id)
				WHERE
					it.internal_type IN (202,204)
				GROUP BY
					it.parent_id
			) AS a4 
				ON (a4.parent_id = a1.object_id)
		INNER JOIN
			sys.all_objects a2
				ON ( a1.object_id = a2.object_id ) 
		INNER JOIN
			sys.schemas a3
				ON (a2.schema_id = a3.schema_id)
	WHERE
		a2.type <> N'S'
		and a2.type <> N'IT'
	ORDER BY
		3 desc
		, a3.name
		, a2.name

#T=连接 Connectivity informations 
-- Connectivity informations 
;WITH con AS 
   (SELECT SES.host_name AS HostName 
          ,CON.client_net_address AS ClientAddress 
          ,SES.login_name AS LoginName 
          ,SES.program_name AS ProgramName 
          ,EP.name AS ConnectionTyp 
          ,CON.net_transport AS NetTransport 
          ,CON.protocol_type AS ProtocolType 
          ,CONVERT(VARBINARY(9), CON.protocol_version) AS TDSVersionHex 
          ,SES.client_interface_name AS ClientInterface 
          ,CON.encrypt_option AS IsEncryted 
          ,CON.auth_scheme AS Auth 
    FROM sys.dm_exec_connections AS CON 
         LEFT JOIN sys.endpoints AS EP 
             ON CON.endpoint_id = EP.endpoint_id 
         INNER JOIN sys.dm_exec_sessions as SES 
             ON CON.session_id = SES.session_id) 
-- Detailed list 
SELECT * 
FROM con 
-- Optional filter 
--WHERE con.ClientInterface = 'ODBC' 
ORDER by con.TDSVersionHex,con.HostName 
        ,con.LoginName 
        ,con.ProgramName; 
 
/* 
-- Count of different connectivity parameters 
SELECT COUNT(*) AS [Connections #] 
      ,COUNT(DISTINCT con.HostName) AS [Hosts #] 
      ,COUNT(DISTINCT con.LoginName) AS [Logins #] 
      ,COUNT(DISTINCT con.ProgramName) AS [Programs #] 
      ,COUNT(DISTINCT con.NetTransport) AS [NetTransport #] 
      ,COUNT(DISTINCT con.TDSVersionHex) AS [TdsVersions #] 
      ,COUNT(DISTINCT con.ClientInterface) AS [ClientInterfaces #] 
FROM con; 
*/
#T=隔离级别 事务
-- SQL Server事务隔离级别实例

CREATE TABLE
		BankAccount
(
	BankAccountId		CHAR(16) NOT NULL,			-- 银行账号
	UserName			NVARCHAR(32) NOT NULL,		-- 用户
	Balance				DECIMAL(19, 2) NOT NULL,	-- 余额
	LastUpdate			SMALLDATETIME NOT NULL
)
GO

INSERT INTO
	BankAccount
VALUES
	(
		'9555500100071120',
		N'张三',
		10000.00,
		GETDATE()
	) -- 北京分行账号
INSERT INTO
	BankAccount
VALUES
	(
		'9555507551227787',
		N'张三',
		20000.00,
		GETDATE()
	) -- 深圳分行账号
GO

--二、应用场景
--假设张三在招商银行开设了两个账号，一个是招商银行北京分行，一个是招商银行深圳分行，两个账号的余额分别是10,000和20,000。
--1. 张三在网上做了一笔交易，交易额100，买方小王通过银行汇款100到张三的北京分行的账号（见下面左图），柜台操作人员向张三账号存入100（事务一），然后系统些操作日志（假设需要10秒，WAITFOR DELAY '00:00:10'）正在此时张三在ATM查了一下账号上余额（事务二），发现已经是10100，于是回去准备发货，但是事务一在写操作日志时超时，这是事务回滚，存款交易被取消，钱退给了小王，这样张三查到的账号余额事实上是事务一还没有提交的数据，导致张三错误的认为已经收到交易款项。

BEGIN TRAN
	UPDATE
		BankAccount
	SET
		Balance = Balance + 100
	WHERE
		BankAccountId = '9555500100071120'

	SELECT
		Balance
	FROM
		BankAccount
	WHERE
		BankAccountId = '9555500100071120'

WAITFOR DELAY '00:00:10'

ROLLBACK

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

---- ATM:
BEGIN TRAN
	SET TRAN ISOLATION LEVEL READ UNCOMMITTED
	SELECT
		Balance
	FROM
		BankAccount
	WHERE
		BankAccountId = '9555500100071120'
COMMIT

--一个事务读到另外一个事务还没有提交的数据，我们称之为脏读。
--解决方法：把事务隔离级别调整到READ COMMITTED，即把右上图中的SET TRAN ISOLATION LEVEL READ UNCOMMITTED更改成下图中的SET TRAN ISOLATION LEVEL READ COMMITTED。
--这时我们重复上面的动作会发现事务二会一直等到事务一执行完毕再返回结果，因为此时事务以已经把自己的更改ROLLBACK了，所以事务二可以返回正确的结果。

BEGIN TRAN
	SET TRAN ISOLATION LEVEL READ COMMITTED
	SELECT
		Balance
	FROM
		BankAccount
	WHERE
		BankAccountId = '9555500100071120'
COMMIT

--2. 张三先后两次查询某一账号的余额，在两次查询期间，小王完成了银行转账，导致两次的查询结果不同。

-- zhang 3
BEGIN TRAN

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

WAITFOR DELAY '00:00:05'

SELECT ba.Balance FROM BankAccount ba WHERE ba.BankAccountId = '9555500100071120'

COMMIT

-- little wang
BEGIN TRAN

UPDATE
	BankAccount
SET
	Balance = Balance + 100
WHERE
	BankAccountId = '9555500100071120'

COMMIT

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

--一个事务先后读取同一条记录，但两次读取的数据不同，我们称之为不可重复读。
--解决方法：把事务隔离级别调整到REPEATABLE READ。在下图中使用SET TRAN ISOLATION LEVEL REPEATABLE READ。这时我们重复上面的动作会发现事务二会一直等到事务一执行完毕再返回结果。

BEGIN TRAN

SET TRAN ISOLATION LEVEL REPEATABLE READ

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

WAITFOR DELAY '00:00:05'

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

COMMIT

--3. 张三妻子先后两次查询张三招商银行所有账号的总余额，而在此期间张三在广州招商银行分行成功开设了一个账号，并存入5000，导致张三妻子两次查询的总余额不同，在此期间张三原有两个账号的余额均未发生改变。

-- zhang 3
BEGIN TRAN

INSERT INTO BankAccount
(
	BankAccountId,
	UserName,
	Balance,
	LastUpdate
)
VALUES
(
	'9555500200051000',
	N'张三',
	5000.00,
	GETDATE()
)

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500200051000'

COMMIT

-- zhang 3's wife
BEGIN TRAN

SET TRAN ISOLATION LEVEL REPEATABLE READ

SELECT
	SUM(Balance) AS Balance
FROM
	BankAccount
WHERE
	UserName = N'张三'

WAITFOR DELAY '00:00:05'

SELECT
	SUM(Balance) AS Balance
FROM
	BankAccount
WHERE
	UserName = N'张三'

COMMIT

--一个事务先后读取一个范围的记录，但两次读取的纪录数不同，我们称之为幻象读。
--解决方法：把事务隔离级别调整到SERIALIZABLE。在下图中使用SET TRAN ISOLATION LEVEL SERIALIZABLE。这时我们重复上面的动作会发现事务二会一直等到事务一执行完毕再返回结果。

BEGIN TRAN

SET TRAN ISOLATION LEVEL SERIALIZABLE

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

WAITFOR DELAY '00:00:05'

SELECT
	Balance
FROM
	BankAccount
WHERE
	BankAccountId = '9555500100071120'

COMMIT

--三、总结

--事务隔离级别是通过数据库的锁机制来控制的，在不同的应用场景需要应用不同的事务隔离级别，
--SQL Server默认的事务隔离级别是READ COMMITTED，默认的隔离级别，已经可以满足我们大部分应用的需求。
#
#TITLE=09.Microshaoft.Interview.TQ
#INFO
New Cliptext library
#SORT=y

#T=.NET SQL
.NET + SQL开发工程师面试题
一、	基础概念
1.	OOP三大特性的理解，详述多态，用途、优点？
2.	委托与事件的关系，委托与接口是否存在相同的用途？请说明
3.	泛型的概念、用途、优点？
4.	请说明重载与覆盖的区别？
二、	开发安全
5.	列举安全开发原则
6.	列举常见的Web安全威胁？如何防范？
7.	说明SQL注入、XSS 、XSRF/CSRF 攻击方式，如何防范？请举例说明
三、	.NET基础
8.	请说明.NET中DataReader和DataSet的异同？适用场景？
9.	请说明.NET中XmlReader和XmlDocument以及其他 .NET XML API的异同？适用场景？
10.	请简单阐述一下.NET的缓存技术，适用场景，约束，刷新、同步机制？
11.	请说明.NET Remoting和Web Service的区别及应用场景？与WCF异同？适用场景？
12.	Web页面之间传递数据、保持状态方法有哪些？适用场景、约束、区别是什么？
13.	多线程编程，如何在启动线程时向线程内传递参数、数据？在“独立线程”级作用域内如何维护局部（共享）变量？
14.	请说明如何做异常处理？方式？原则？
四、	SQL数据库基础
15.	索引的作用？SQL Server有几种索引？适用场景，约束限制，区别是什么？
16.	事务（Transaction）的作用是什么？及相关特性？能否嵌套？如何解决嵌套问题？
17.	表及字段：T（EmployeeID,DepartmentID,….），主键为EmployeeID，如何查询统计中各部门人数及占全部人数的百分比，查询结果包含字段：（DepartmentID，人数，百分比）？
18.	在表中插入数据,如何快速“准确”得到刚刚插入该表的最后一行的自增量的值？
19.	请说明对 Null 的理解 Null = Null？Null != Null？
20.	简述Left join与Inner join 区别？Left join的on 条件 和 where 条件区别？
五、	代码编程
21.	请使用“数据结构”的相关理论，编程实现：
将“字符”数组“米老鼠_爱_大米”，转化为：“大米_爱_米老鼠”
22.	T-SQL如何展现显示海量数据？至少两种方法分页
23.	请列出您所知道的设计模式的名称，并编写任意两种模式的简单示例代码。
六、	附加题
24.	常见的线程同步方法有哪几种？ 分别简述，并详述一到两种 .NET BCL（基础类库）/API用法或代码
25.	常见的进程间通信方法有哪些？分别描述适用场景、约束局限性？详述一到两种.NET BCL/API用法或代码
26.	如何编写高性能的Socket程序？可以列举、说明关键技术、所用.NET BCL/API或相关代码
27.	简述AJAX客户端、服务器端实现原理，用途，可以列举关键客户端浏览器JavaScript脚本代码？约束限制有哪些？能否突破？调用安全如何保证？多种脚本库引用冲突如何解决？
28.	加解密算法的分类？说明用途、适用场景？
29.	MD5/SHA1是什么算法？用途？

#T=Active Directory
Active Directory Interview Technical Questions
1. If you want to create a forest trust in Windows 2003, what functional level must the domain be set to? 
2.What is the command line tool used to perform an authoritative restore? 
3. What is the switch used with DCPromo to promote a domain controller using a network share or backup media?
 
4. Name the FSMO roles and where they would reside in a new domain by default. 
5. What utility can be used to mount a snapshot of the Directory taken using the ntdsutil snapshot feature ? 
6. What is the benefit of a shortcut trust in Active Directory? 
7. What can a Global Group in a Windows 2008R2 domain contain when the forest functional level is set to Windows 2008R2?
 
8. Which of the following tools would allow you to identify accounts that have not been used for two months: 
LDAP, NTDSUTIL, dsquery.
 
9. GPMC can be used to backup Group Policy objects. When you restore a Group Policy Object what will not be restored ?
 
10. What are Generic SRV records and why would they be used by a client during logon? 
11. What is the function of the ISTG? 
12. Give a situation when you would use SMTP over IP transport in inter-site replication? 
13. What does Group Policy loopback mode do? 
14. What would you do if your RID Master failed and you were unable to recover it? 
15. What command would you use to register the Schema Management snap-in? 
16.What replicates the Group Policy information in SYSVOL between domain controllers? 
17.What is the purpose of configuring an Active Directory Site? 
18.Why should the infrastructure master not be located on a global catalogue server? 
19. What does an RODC do ? When would you recommend using one ? 
20.What is a Partial Attribute Set? 
21.What’s the difference between a Connection Object and a Replication Link? 
22.What is the function of the Group Policy Central Store ? 
23.When enabling Scavenging for DNS would you recommend enabling it at the zone level first or server level ? explain why ?
 
24.What is a Lingering Object? 
25.Explain the benefits of LVR Feature in Windows Server 2003? 
26.How does Active Directory Recycle Bin work? What is the relevance of Deleted Object Lifetime (DOL) and what is it’s default value?
 
27. Explain the importance of the Invocation ID of a domain controller to its replicating partner? 

#T=App-V
App-V Interview Technical Questions
1. Can you name the App-V components for the Full Infrastructure? 
2.What is the process called when creating a software package? 
3. What is the recommend target install location for the software installation? 
4. What protocols can be used for Streaming Applications? For bonus points also let me know the ports for each protocol. 
5. What is the maximum size of the App-V Client Cache for Terminal Server and Windows Desktop Client? 
6. What is the maximum size of the SFT file that can be generated? 
7. How would you review the sftlog.txt file to look at trends in errors and problems that an end user may be having? 
8. When Building a sequencer image what aspects would you look to build into the sequencer to achieve the best results? 
9. How many cores are started on the Management Server in 4.5 and 4.1? 
10. What is the default setting for Max Memory allocation and how does this setting effect the management server? 
11.Where would you configure Max Memory Allocation? 
12. Where is the app-v cache file held on Windows 7 with App-V 4.5? And what is its file name? 
13. Where is the app-v cache file held on Windows 7 with App-V 4.6? 
14. How can you clear the App-V client side cache file (.fsd)? 
15. On windows server 2008 R2 what two programs rules do you have to create to allow the Management Server to communicate with an App-V Client correctly? 
16. Why Do we have dummy ODBC connections on the sequencer? 
17. Why Do we have dummy printers set up on the sequencer? 
18.What is our best practice for anti-virus on the sequencer? 
19.What services do we recommend to stop/disable on the sequencer? 
20.What is your opinion on having the sequencer joined to the domain? 
21. can we sequence to the C:\ drive 
22.What items cannot be sequenced 
23.How can we mitigate issues that we cannot sequence?  
24.If I sequence an application on Windows XP will it work on Windows 7?  
25.What version of the sequencer can I use to sequence 64bit applications? 
26.If I sequence an application on Windows 7 x86 will it work on Windows 7 x64? 
27. What do exclusion items do? 
28.What do parse items do? 
29.What is the difference between application data and user data and how does this impact the way our clients work? 

#T=Messaging Lync/Exchange/UC
Messaging Interview Technical Questions
level 100
1. What is the primary name resolution service in Windows?

Correct Answer:::
DNS (Domain Naming System) 
2. What type of backup is used to back up the configuration information critical to Windows Server 2003, such as the registry and IIS metabase?

Correct Answer:::
System State Backup 
3. Can an Exchange organisation span multiple Active Directory Forests?

Correct Answer:::
No 
4. What are used to keep track of transactions that are committed to the database from a transaction log?

Correct Answer:::
Checkpoint Files 
5. What protocol do POP3 and IMAP4 clients use to send messages?

Correct Answer:::
SMTP (Simple Mail Transfer Protocol) 
6. What needs to be enabled to allow transaction logs to recycle themselves by overwriting the oldest log file that has been fully committed?

Correct Answer:::
Circular Logging 
7. Which management tools are available to manage Exchange 2007/10?

Correct Answer:::
? EMC (Exchange Management Console)
? EMS (Exchange Management Shell, aka PowerShell) 
8. Which Exchange 2007/10 server role is responsible for routing all messages to their destination?

Correct Answer:::
Hub Transport 
9. How many storage groups and databases does Exchange 2007 Standard Edition support?

Correct Answer:::
? 5 Databases
? 5 Storage Groups 
10. Can Exchange 2007 be installed into an Exchange 5.5 organisation?

Correct Answer:::
No 
11. Which component is used to allow users to connect to Exchange Server using a Web Browser?

Correct Answer:::
OWA (Outlook Web Access, or Outlook Web App in Exchange 2010) 
12. In Exchange 2007, which server roles can be clustered?

Correct Answer:::
Mailbox role only 
13. Which tools can you use to troubleshoot Transport (AD & Exchange)?
  
Correct Answer:::
Windows
? Telnet
? Performance Monitor
? Application Event Log

Exchange
? ExMFA (Exchange Mail-Flow Analyser)
? WinRoute (Exchange 2003)
? ESM to increase Diagnostic Logging (PowerShell in Exchange 2007/10) 
14. Which tools can be used for troubleshooting AD-related Exchange problems?

Correct Answer:::
? ADSIEdit
? LDP
? AD Users & Computers 
15. If you run into any issues when installing or upgrading Exchange, where can you find the installation log?

Correct Answer:::
? C:\Exchange Setup Progress.log (Exchange 2003)
? C:\ExchangeSetupLogs\ExchangeSetup.log  (Exchange 2007/10) 
16. What are the 5 roles available in Exchange 2007/2010?

Correct Answer:::
? Mailbox
? Hub Transport
? Client Access
? Unified Messaging
? Edge Transport 
17. How many databases and storage groups can a mailbox server running the Enterprise version of Exchange Server 2007 support?

Correct Answer:::
50 databases & 50 Storage Groups 
18. How many Cluster Nodes are possible for a single DAG?

Correct Answer:::
16 
19. What is the recommended order for deploying Exchange 2007/10 server roles?

Correct Answer:::
1-Client Access
2-Hub Transport
3-Mailbox
4-Edge
5-UM 
20. When considering deployment of Exchange 2010 in a virtualized environment, deployment of which server role is not supported?

Correct Answer:::
Unified Messaging 


level 200
1. Using PowerShell how can you produce a table of all your Exchange servers showing the servers name and the roles that are installed on it?

Correct Answer:::
Get-ExchangeServer | FT Name, ServerRoles 
2. What is used by internal users to use the AutoDiscover service?

Correct Answer:::
Internal users will query AD for the Service Connection Points (SCP) 
3. What is used by external users to access the AutoDiscover service?

Correct Answer:::
External users will use the domain portion of their Primary SMTP address to locate the AutoDiscover service, the URLs used will be either: https://<smtp-address-domain>/autodiscover/autodiscover.xml or https://autodiscover.<smtp-address-domain>/autodiscover/autodiscover.xml 
4. Your organisation would like all mail going to a partner with the SMTP domain of contoso.com to be routed through a particular smart-host. contoso.com has a number of sub-domain addresses, for example sales.contoso.com, europe.contoso.com, etc. What do you need to do in order for this to be implemented?

Correct Answer:::
Create a Send Connector with the address space of *.contoso.com, set the mail to route through the SmartHost either by IP address or FQDN 
5. What is the purpose of a scoped send connector?

Correct Answer:::
A scoped send connector can only be used by Hub transport servers in the same Active Directory site 
6. When migrating from Exchange 2003 to Exchange 2007/10, which role should be deployed first?

Correct Answer:::
Client Access Server (CAS) 
7. Your customer is going to be deploying Exchange 2007. They currently run Exchange 2003 with all their databases stored on a SAN, they would like to provide redundancy for both the server infrastructure and the databases to reduce a single point of failure in their messaging environment. What high availability feature of Exchange 2007 can they implement to achieve this?

Correct Answer:::
Cluster Continues Replication (CCR) achieves redundancy at both the server level and database level 
8. What does the Availability Service does in Exchange 2007/10?

Correct Answer:::
Provides Free/Busy data to user running Outlook 2007 or higher 
9. In Exchange 2003 which protocol was used for communication between the Front-End & Back-End servers?

Correct Answer:::
Front-End servers communicate with Back-End servers using HTTP 
10. What Exchange utility would you use to fix database problems at the page and ESE table level and what switch would you need to run the utility with?

Correct Answer:::
ESEUTIL /P 
11. What is the Transport Dumpster?

Correct Answer:::
The transport dumpster is a feature of the Hub Transport server role that is useful for CCR and LCR deployments. The transport dumpster submits recently delivered mail after an unscheduled outage. The transport dumpster should always be turned on when using CCR. Exchange 2010 uses the transport dumpster more efficiently (keeps a watermark for ever DB in the DAG based on LastLog inspected), and can contact all Hub Servers (in other sites as well) 
12. What is a quorum?

Correct Answer:::
The quorum is a disk (or disks) that plays the role of an arbitrator or resource access for the individual nodes in a cluster. It is responsible for maintain the cluster configuration for all the nodes in the cluster and making sure they each have the same information regarding ownership of the resources in the cluster – in short, it controls and keeps track of clustered resources and their locations 
13. Name 5 differences between Exchange 2007 and its predecessors

Correct Answer:::
? IOPS improvement (DAS vs. SAN, TCO)
? 64-bit technology
? High Availability (LCR/CCR/SCR)
? Storage Group configuration (CCR)
? Mailflow – direct connection vs. connector costs 
14. What are Transaction Logs and why we need them?

Correct Answer:::
To ensure the transactional integrity of the database, To allow graceful recovery with zero data loss after a system crash, To allow “roll forward” of the database after restoration from backup 
15. Why should an admin place Exchange databases and transaction logs on different physical spindles?

Correct Answer:::
? Performance
? Recovery
? I/O patterns
? Random read/writes on database
? Sequential writes on log drive 
16. Can you enable Local Continues Replication on a storage group with 4 databases?

Correct Answer:::
No 
17. What does the Disable-Mailbox task and “Remove” action under the Recipient Configuration within ECP have in common?

Correct Answer:::
Both disconnect the mailbox from the AD account, "Remove" deletes the user as well 
18. How many Hub Transport servers must be installed in each Active Directory site where a mailbox server is located? Explain your answer.

Correct Answer:::
At least one. Multiple Hub servers can be installed in the same site to provide fault tolerance and load balancing. The Store Driver runs on Hub, the MailSubmission Service runs on the Mailbox role, these components talks RPC. To pick up messages from the clients outbox and to out messages to the Clients inbox a HT transport server is vital within the Mailbox Role site. No Message could be sent/received without the HT role 
19. In Exchange 2007/10, where are all queued messages stored? And what tool should you use to see messages currently stored in messaging queues?

Correct Answer:::
All Queues are stored in the Mail.que database. You should use the Queue Viewer to access messages in messaging queues. (PowerShell or EMC/MMC) 
20. Exchange 2007/10 CAS can coexist within the same AD-Site due to ______________?

Correct Answer:::
Client Redirection, based on the external URL of the E2007 OWA virtual directory. Proxying is the wrong answer 


level 300
1. Please can you explain the following Exchange database terms: 
a. Transaction Log
b. Checkpoint File
c. Circular Logging
d. Checkpoint Depth

Correct Answer:::
a. Transaction log files contain operations on database files. They contain enough information to bring a database to a logically consistent state
b. The checkpoint file stores the checkpoint for a particular transaction log file sequence
c. The process used by Exchange to reduce the number of transaction log files stored on the Exchange server
d. The maximum amount of data that the Extensible Storage Engine can write to logs before it writes to the database 
2. Which protocols use the following ports: 
a. 389
b. 53
c. 135
d. 25
e. 443
f. 5061

Correct Answer:::
a. LDAP 
b. DNS
c. RPC
d. SMTP
e. HTTPS
f. SIP 
3. Your customer has Exchange 2007 RTM and has configured a CCR cluster, and at present all transaction log file copying and seeding occurs over the public network. What steps would you recommend the customer takes to allow transaction log file copying and seeding to occur over a mixed network?

Correct Answer:::
? Upgrade the servers to Exchange 2007 SP1 or higher
? Use the Enable-ContinuousReplicationHostName cmdlet to configure the mixed network 
4. What are the 4 types of clustering available in Exchange 2007? How do they work?

Correct Answer:::
LCR (Local Continuous Replication)
? Utilises separate storage on same server
? Log shipping & seeding occurs on local server 
CCR (Cluster Continuous Replication)
? Separate server, separate storage
? Acts in Active/Passive configuration
? Log shipping & seeding between servers
? Can span multiple AD sites
? Relies upon Majority Node Set (MNS) from a File Share Witness (FSW)
SCR (Single Continuous Replication)
? A single copy of a CCR database
? Server doesn’t have to be clustered
? Can be used for ‘lagged’ copies of database
? Can be used to form a new CCR in a different AD site in a DR situation
SCC (Single Copy Cluster)
? The traditional method of clustering in 2000/3
? At least two servers in Active/Passive configuration
? One point of storage (usually a SAN) 
5. What are the benefits of a MNS (Majority Node Set)?

Correct Answer:::
? A two-node cluster can survive a single node failure. (Voter) 
? The arbitrator is not a member of the cluster. This is a benefit because it does not receive cluster and MNS heartbeat traffic. 
? Network connection to the arbitrator does not require a single subnet with the cluster nodes. 
? The arbitrator exposing the share can be a standalone server of a different OS architecture. For example, a 32-bit Windows server can provide a vote for an IA64 cluster. 
? One arbitrator can serve multiple clusters; however, each cluster requires a separate share 
6. What are some of the major architectural changes in message routing in Exchange Server 2007 compared to Exchange 2003?

Correct Answer:::
? Removal of the linkstate table
? Removal of the MTA
? Removal of foreign connectivity connectors
? Routing Groups are no longer used
? Using AD site information to determine message delivery paths
? Having Edge in the DMZ 
7. Which feature in Exchange 2010 provides redundancy for messages while they are in transit?

Correct Answer:::
Shadow Redundancy. Exchange 2010 introduces the shadow redundancy feature to provide redundancy for messages for the entire time they're in transit. The solution involves a technique similar to the transport dumpster. With shadow redundancy, the deletion of a message from the transport databases is delayed until the transport server verifies that all of the next hops for that message have completed delivery. If any of the next hops fail before reporting back successful delivery, the message is resubmitted for delivery to that next hop 
8. What is FDS, where does it run, and what does it do?

Correct Answer:::
FDS runs on the Client Access Server and pulls the OAB files from the Mailbox server that generated the files 

#T=Platforms Core
Platforms Core Interview Technical Questions
1. What is an IP Address and what is it used for? 
2.What is DHCP and what is it used for? 
3. Describe how a DHCP client acquires an IP address from a Windows DHCP Server. 
4. What options can be set with DHCP? 
5. How can you force a Client computer to renew/acquire an IP address from a DHCP Server? 
6. What is a MAC Address? 
7. What’s the difference between Physical memory and Virtual memory in Windows? 
8. Windows memory management system divides the Windows virtual memory into two areas.  What are the names of these two areas? 
9. In Windows 2003 Server x86 what does the 3GB switch do? 
10. Where and why would you set the 3GB switch? 
11. Are there any settings that can be used to fine tune the 3GB switch? 
12. Can you use the 3GB switch in Windows 2008R2? 
13. What does the /PAE switch do? 
14. What are the main differences between Windows x86 and Windows x64? 
15. Can you tell me what a Windows bluescreen is and what generally causes them? 
16. You have a memory.dmp file from a server that is bluescreening , what tool would you use to analyse it? 
17. Can you explain the difference between a process and a thread? 
18. If an application appears to have frozen/hung what tool/tools can you use to kill the application? 
19.What is the Windows Registry and what tool can you use to manage it? 
20.In which folder are the Windows registry files “SOFTWARE” and “SYSTEM” stored? 
21. What is RAID? 
22.Can you explain RAID 5? 
23. What is the minimum amount of disks required for RAID 5 
24.Explain the difference between permissions and privileges 
25.What is the maximum file size on a harddisk formatted using the FAT32 file system? 
26. What is a BCD file in Windows Server 2008? 
27. How would you edit a BCD file? 
28.What command line can you use on Windows Server to force a group policy refresh?  
29. What tools are available to edit group policy? 

#T=SCCM
SCCM Interview Technical Questions
1. What are the major features of ConfigMgr 2007? 
2.What was introduced in R2 & R3? 
3. What role does ExecMgr perform? 
4. Why are both a DP and MP generally required in a site? 
5. Describe the SMS Provider and it's role within a site? 
6. Describe the kinds of data collected by hardware inventory? 
7. What are the reasons to choose between DPs, BDPs and secondary sites when considering how to manage a remote or branch office? 
8. Name three threads/components of SMSExec and their role on a primary site server? 
9. What is the currently supported service pack for ConfigMgr 2007? 
10. How can you control when security updates are applied to servers and critical clients in ConfigMgr? 
11. How can you modify configurations or create deployments at a site programmatically at a high level? 
12. How does a client determine if it is connected to a high speed (LAN) or slow speed (VPN) connection? Follow up: what kind of connection does the client default to if it does not fall into any boundaries? 
13. What are the three main locations for log files within a ConfigMgr site? 
14. What kind of applications can be deployed using software distribution and are there any limitations? 
15. Describe what a task sequence is and how it can be used? What are a few commonly used task sequence actions? 
16. What operating systems are supported by ConfigMgr as clients? 
17. What are the major client facing site systems? 
18.What are the various types of ConfigMgr sites?  
19.What site systems rely on IIS?  
20.What would you use SMS Trace or Trace 32 to for?  
21.Is the SMSExecutive service a 32-bit or 64-bit application?  
22.What does ConfigMgr rely on WMI for?  
23.What is the difference between Native Mode and Mixed Mode in ConfigMgr?  
24.How are discovery and client push are related? 
25.What ConfigMgr site system roles support high availability? 
26.How can client health be tracked and monitored within ConfigMgr? 
27. What is one important difference between standard software distribution packages and (software update or driver) packages? 

#T=SCOM
SCOM Interview Technical Questions
1. What identity/account should the Health Service run under, on an agent?
Correct Answer:::
Local System
 
2. What components can be clustered?
Correct Answer:::
Root Management Server (RMS)
Operations Database
Reporting Database
Audit Database
 
3. What is the supported Agent limit for a single Gateway Server?
Correct Answer:::
800
 
4. Are Groups involved in the Targeting of monitoring in OpsMgr? And if so how?
Correct Answer:::
Groups are not involved in the targeting of monitoring in OpsMgr
 
5. What tools can you use to view and explore a Management Pack outside of OpsMgr 2007?
Correct Answer:::
MP Viewer
MP Studio
Authoring Console 
 
6. Which OpsMgr Service on the Root Management Server (RMS) is responsible for communicating the Operations database?
Correct Answer:::
OpsMgr SDK Server
 
7. Can OpsMgr out-of-the-box send SMS Notifications to OpsMgr Operators \ Users?
Correct Answer:::
No.  An SMS Service Device would be required (which OpsMgr would send its SMS Notifications to.  The SMS device would then transform these and send on as SMS Texts to the Users).
 
8. Run As Profiles are new in OpsMgr 2007.  What advantages do they offer?
Correct Answer:::
Allows for increased security by limiting what credentials advanced monitoring runs under.  In additional this can be configured differently for different servers.
 
9. What new Report type is introduced with R2?
Correct Answer:::
Service Level Dashboard
 
10. Please describe what a Linked Report is in OpsMgr?
Correct Answer:::
Linked Reports are customized versions of the basic reports that ship with OpsMgr 2007.
 
11. When considering the OpsMgr Server components which component offers the worst resiliency?
Correct Answer:::
ACS Collector
 
12. Can you describe what the ACS Collector Queue is? And can you name any of the Registry entries to control this?
Correct Answer:::
This is the Queue that is used to store data from the ACS Forwarders before being sent to the ACS Database.  The 3 registry entries that allow some control are:
MaximumQueueLength
BackOffThreshold
DisconnectThreshold
 
13. Please name one of the OpsMgr Resource Kits tools?
Correct Answer:::
Sample Vista Gadget
Operations Manager Inventory (MOMInventory.exe)
Operations Manager Cleanup Tool
AEM Validation
AEM Management Pack
Active Directory Integration Sample Script
Effective Configuration Viewer
Action Account Tool (set-ActionAccount.ps1)     
MP 2 XML Dumper (MP2XMLDumper.exe)
 
14. What is the default Heartbeat of an Agent? And how frequently do they check in for new Management Pack objects?
Correct Answer:::
Agents Heartbeat in every 60 seconds
Agents check for Management Pack objects every 30 seconds
 
15. As an OpsMgr Administrator please name an OpsMgr 2007 Report that is useful in alert tuning?
Correct Answer:::
Most Common Alerts by Alert Count
 
16. Which OpsMgr component houses the Workflows that keep the Operational and Data Warehouse databases in sync?
Correct Answer:::
Root Management Server (RMS)
 
17. What two methods do you have for creating distinct Classes?
Correct Answer:::
Firstly using Authoring Console
Extending an existing Class
(XML is also a viable answer)
 
18. Please describe what Modules are in relation to the concept of Workflows? Use examples if possible.
Correct Answer:::
Modules are what make up Workflows.  All Workflows have a Data Source module, for example a Security Log.  Another example of a Module in a workflow is Write Action, such as writing data to the Operations database.
 
19. If you are creating multiple monitoring for a number of Services for a LOB application Management Pack, what is a quicker way of achieving this rather than via the console UI steps?
Correct Answer:::
By cut-and-pasting a single Service monitoring via XML editing, and modifying in XML
 
20. If the Health Service EDB database is found to be corrupt what utility can be used to help fix this issue?
Correct Answer:::
ESENTUTL 

#T=SharePoint
SharePoint Interview Technical Questions
1. Please detail you experiences with the different versions of SharePoint. 
2. Describe some of the differences between WSS 3.0 and MOSS 2007 or SharePoint Foundation and SharePoint 2010?
3. What are the pre-requisites that a server needs in order to install MOSS 2007 or SharePoint 2010?
4. Can you list the various roles that a server within a SharePoint farm can provide?
5. Can you describe the services that are provided by a Shared Service Provider or SharePoint 2010 Service Applications?
6. Can you explain to me some of the new features of SharePoint 2010 that are beneficial to a farm administrator, for example the Health Analyser?
7. Describe how you would design a MOSS 2007 or SharePoint 2010 farm that required high availability within each tier of the architecture?
8. What are the options for backing up and restoring SharePoint, what are the advantages/disadvantages of each?
9. What is an alternate access mapping and why would you need to create one? 
10. Can you give me an example of a timer job and describe the functionality that it provides?
11. Can you list some tools that you would use to investigate a performance issue with page render time?
12. Can you please tell me the various options for deploying customizations to SharePoint?
13. What are the approaches for migrating from SPS 2003 to MOSS 2007 or MOSS 2007 to SharePoint 2010?
14. What would you do to help plan/prepare for upgrade of MOSS 2007 to SharePoint 2010?
15. Can you describe the key differences between Service Applications  in SP2010 and SSPs in 2007?

#T=SQL
SQL Interview Technical Questions
1. What is a lock used for and how do locks differ from latches? 
2. Explain the different methods of capturing a query plan? 
3. What are the 2 checks that are run at regular intervals on a clustered installation of SQL Server - and what does each check do? 
4. Describe the checkpoint process.  Which setting can directly modify it’s behaviour? 
5. What is the function of the lazy writer? 
6. What is the T-Log used for in SQL Server? 
7. When do you need to backup the tail of the T-Log? Walk me through how you achieve this? 
8. How would you troubleshoot a full T-Log and what would you monitor to see why it’s full? 
9. Describe the components in a transactional replication topology and their purpose? 
10. Describe the process of lock escalation and why does it occur? 
11. How would you go about investigating a deadlock – what tools would you use? 
12. How would you monitor for disk bottlenecks - what tools would you use, counters would you observe? 
13. How do you identify fragmentation in SQL 2000 and SQL 2005/8?  How do you resolve fragmentation issues in SQL 2000 and SQL 2005/8? 
14. Walk through a typical backup strategy of a medium sized SQL 2008 production database. What considerations help you define the strategy? 
15. Describe what statistics are and what they are used for.  What options are available for viewing statistics, how do they become out of date and how would you go about updating them? 

#T=SQL BI
SQL BI Interview Technical Questions
1. Tell me what is Analysis Services and why do we need AS in business? 
2. Tell me what is the biggest challenge you have had with Analysis Services? 
3. Is it possible to have multiple instances of AS on the same Server? 
4. What is a cube?  
5. Which is higher in object hierarchy; a Database or a cube? 
6. What is a star schema and a snowflake schema? What is the difference between them? 
7. What is a dimension, a fact and a measure? 
8. What is a hierarchy and why do we need hierarchy?  
9. What is a dimension attribute? 
10. What is a dimension member? 
11. What does Cube processing mean? What does AS do during cube processing?  
12. What are the Storage Modes in Analysis Services? 
13. What is the difference between MOLAP and ROLAP? 
14. Is it possible to take an incremental back up in Analysis Services? 
15. Discuss how you monitor Analysis Services? 
16. What is the querylog table used for? How do you configure it? 
17. What is the msmdsrv.ini file? 
18. Tell me the performance counters you may use to monitor for query performance? 
19. What TCP port does Analysis Services 2005 uses? 
20. What is MDX? How is it different from TSQL? 
21. What is the Storage Engine and Formula Engine? 
22. What is the ThreadPool\Process\MaxThreads setting for?  
23. What is CoordinatorExecutionMode? 
24. What is forceCommitTimeout? 
25. What is MinMemoryLimit and TotalMemory Limit? 
26. What is the difference between 32 bit & 64 bit? 
27. What is the Hard Memory Limit? 
28. What is the Flight Recorder? 
29. What is Online Mode and Offline Mode? Tell me how to connect in online mode? 
30. What is Reporting Services? 
31. What is RDL and SMDL? 
32. What is a Shared Datasource? 
33. Walk me through the steps to create a simple report? 
34. Tell me about Subscriptions? 
35. What are the components of Reporting Services? 
36. Tell me about Scale Out Scenarios for Reporting Services? 
37. What are the options available for deploying reports? 
38. What is a Data Flow task? 
39. What is a Sequence Container? 
40. What are Variables in Integration Services? 
41. What is dtexec? 
42. What are your options for Migrating DTS packages to SSIS? 

#T=应聘漂亮的回答
1、请你自我介绍一下自己好吗？
回答提示：一般人回答这个问题过于平常，只说姓名、年龄、爱好、工作经验，这些在简历上都有。其实，企业最希望知道的是求职者能否胜任工作，包括：最强的技能、最深入研究的知识领域、个性中最积极的部分、做过的最成功的事，主要的成就等，这些都可以和学习无关，也可以和学习有关，但要突出积极的个性和做事的能力，说得合情合理企业才会相信。企业很重视一个人的礼貌，求职者要尊重考官，在回答每个问题之后都说一句“谢谢”，企业喜欢有礼貌的求职者。
2、你觉得你个性上最大的优点是什么？
回答提示：沉着冷静、条理清楚、立场坚定、顽强向上、乐于助人和关心他人、适应能力和幽默感、乐观和友爱。我在北大青鸟经过一到两年的培训及项目实战，加上实习工作，使我适合这份工作。
3、说说你最大的缺点？
回答提示：这个问题企业问的概率很大，通常不希望听到直接回答的缺点是什么等，如果求职者说自己小心眼、爱忌妒人、非常懒、脾气大、工作效率低，企业肯定不会录用你。绝对不要自作聪明地回答“我最大的缺点是过于追求完美”，有的人以为这样回答会显得自己比较出色，但事实上，他已经岌岌可危了。企业喜欢求职者从自己的优点说起，中间加一些小缺点，最后再把问题转回到优点上，突出优点的部分，企业喜欢聪明的求职者。
4、你对薪资的要求？
回答提示：如果你对薪酬的要求太低，那显然贬低自己的能力；如果你对薪酬的要求太高，那又会显得你分量过重，公司受用不起。一些雇主通常都事先对求聘的职位定下开支预算，因而他们第一次提出的价钱往往是他们所能给予的最高价钱，他们问你只不过想证实一下这笔钱是否足以引起你对该工作的兴趣。
回答样本一：我对工资没有硬性要求，我相信贵公司在处理我的问题上会友善合理。我注重的是找对工作机会，所以只要条件公平，我则不会计较太多。
回答样本二：我受过系统的软件编程的训练，不需要进行大量的培训，而且我本人也对编程特别感兴趣。因此，我希望公司能根据我的情况和市场标准的水平，给我合理的薪水。
回答样本三：如果你必须自己说出具体数目，请不要说一个宽泛的范围，那样你将只能得到最低限度的数字。最好给出一个具体的数字，这样表明你已经对当今的人才市场作了调查，知道像自己这样学历的雇员有什么样的价值。
5、你对加班的看法？
回答提示：实际上好多公司问这个问题，并不证明一定要加班，只是想测试你是否愿意为公司奉献。
回答样本：如果工作需要我会义不容辞加班，我现在单身，没有任何家庭负担，可以全身心的投入工作。但同时我也会提高工作效率，减少不必要的加班。
6、如果通过这次面试我们录用了你，但工作一段时间却发现你根本不适合这个职位，你怎么办？
回答提示：一段时间发现工作不适合我，有两种情况：①如果你确实热爱这个职业，那你就要不断学习，虚心向领导和同事学习业务知识和处事经验，了解这个职业的精神内涵和职业要求，力争减少差距；②你觉得这个职业可有可无，那还是趁早换个职业，去发现适合你的，你热爱的职业，那样你的发展前途也会大点，对单位和个人都有好处。
7、谈谈你对跳槽的看法？
回答提示：①正常的“跳槽”能促进人才合理流动，应该支持。②频繁的跳槽对单位和个人双方都不利，应该反对。
8、工作中难以和同事、上司相处，你该怎么办？
回答提示：①我会服从领导的指挥，配合同事的工作。②我会从自身找原因，仔细分析是不是自己工作做得不好让领导不满意，同事看不惯。还要看看是不是为人处世方面做得不好，如果是这样的话我会努力改正。③如果我找不到原因，我会找机会跟他们沟通，请他们指出我的不足，有问题就及时改正。④作为优秀的员工，应该时刻以大局为重，即使在一段时间内，领导和同事对我不理解，我也会做好本职工作，虚心向他们学习，我相信，他们会看见我在努力，总有一天会对我微笑的。
9、你对于我们公司了解多少？
回答提示：在去公司面试前上网查一下该公司主营业务。如回答：贵公司有意改变策略，加强与国外大厂的OEM合作，自有品牌的部分则透过海外经销商。
10、最能概括你自己的三个词是什么？
回答提示：我经常用的三个词是：适应能力强，有责任心和做事有始终，结合具体例子向主考官解释，
11、你的业余爱好是什么？
回答提示：找一些富于团体合作精神的，这里有一个真实的故事：有人被否决掉，因为他的爱好是深海潜水。主考官说：因为这是一项单人活动，我不敢肯定他能否适应团体工作。
12、作为被面试者给我打一下分？
回答提示：试着列出四个优点和一个非常非常非常小的缺点（可以抱怨一下设施，没有明确责任人的缺点是不会有人介意的）。
13、你为什么要离开原来的公司?
回答提示：①回答这个问题时一定要小心，就算在前一个工作受到再大的委屈，对公司有多少的怨言，都千万不要表现出来，尤其要避免对公司本身主管的批评，避免面试官的负面情绪及印象。建议此时最好的回答方式是将问题归咎在自己身上，例如觉得工作没有学习发展的空间，自己想在面试工作的相关产业中多加学习，或是前一份工作与自己的生涯规划不合等等，回答的答案最好是积极正面的。②我希望能获得一份更好的工作，如果机会来临，我会抓住。我觉得目前的工作，已经达到顶峰，即沒有升迁机会。
14、你欣赏哪种性格的人？
回答提示：诚实、不死板而且容易相处的人、有“实际行动”的人。
15、你通常如何对待别人的批评？
回答提示：①沈默是金，不必说什么，否则情况更糟，不过我会接受建设性的批评。②我会等大家冷靜下来再讨论。
16、怎样对待自己的失败？
回答提示：我们大家生来都不是十全十美的，我相信我有第二个机会改正我的错误。
17、你为什么愿意到我们公司来工作？
回答提示：对于这个问题，你要格外小心，如果你已经对该单位作了研究，你可以回答一些详细的原因，像“公司本身的高技术开发环境很吸引我。”、“我同公司出生在同样的时代，我希望能够进入一家与我共同成长的公司。”、“你们公司一直都稳定发展，在近几年来在市场上很有竞争力。”、“我认为贵公司能够给我提供一个与众不同的发展道路。”这都显示出你已经做了一些调查，也说明你对自己的未来有了较为具体的远景规划。
18、对这项工作，你有哪些可预见的困难？
回答提示：①不宜直接说出具体的困难，否则可能令对方怀疑应聘者不行。②可以尝试迂回战术，说出应聘者对困难所持有的态度——工作中出现一些困难是正常的，也是难免的，但是只要有坚忍不拔的毅力、良好的合作精神以及事前周密而充分的准备，任何困难都是可以克服。
19、如果录用了你，你将怎样开展工作？
回答提示： ①如果应聘者对于应聘的职位缺乏足够的了解，最好不要直接说出自己开展工作的具体办法。②可以尝试采用迂回战术来回答，如“首先听取领导的指示和要求，然后就有关情况进行了解和熟悉，接下来制定一份近期的工作计划并报领导批准，最后根据计划开展工作。”。
分析：这个问题的主要目的也是了解应聘者的工作能力和计划性、条理性，而且重点想要知道细节。如果向思路中所讲的迂回战术，面试官会认为回避问题，如果引导了几次仍然是回避的话，此人绝对不会录用了。
20、你希望与什么样的上级共事？
回答提示：①通过应聘者对上级的“希望”可以判断出应聘者对自我要求的意识，这既上一个陷阱，又是一次机会。②最好回避对上级具体的希望，多谈对自己的要求。③如“做为刚步入社会的新人，我应该多要求自己尽快熟悉环境、适应环境，而不应该对环境提出什么要求，只要能发挥我的专长就可以了。
分析：这个问题比较好的回答是，希望我的上级能够在工作中对我多指导，对我工作中的错误能够立即指出。总之，从上级指导这个方面谈，不会有大的纰漏。
21、与上级意见不一时，你将怎么办？
回答提示：①一般可以这样回答“我会给上级以必要的解释和提醒，在这种情况下，我会服从上级的意见。”②如果面试你的是总经理，而你所应聘的职位另有一位经理，且这位经理当时不在场，可以这样回答：“对于非原则性问题，我会服从上级的意见，对于涉及公司利益的重大问题，我希望能向更高层领导反映。”
分析：这个问题的标准答案是思路①，如果用②的回答，必死无疑。你没有摸清楚改公司的内部情况，先想打小报告，这样的人没有人敢要。
22、为什么选择我们公司？
回答提示：曾经在报章杂志看过关于贵公司的报道，与自己所追求的理念有志一同。而贵公司在业界的成绩也是有目共睹的，而且对员工的教育训练、升迁等也都很有制度。
分析：去面试前先做功课，了解一下该公司的背景，让对方觉得你真的很有心想得到这份工作，而不只是探探路。
23、谈谈如何适应办公室工作的新环境？
回答提示①办公室里每个人有各自的岗位与职责，不得擅离岗位。②根据领导指示和工作安排，制定工作计划，提前预备，并按计划完成。③多请示并及时汇报，遇到不明白的要虚心请教。④抓间隙时间，多学习，努力提高自己的政治素质和业务水平。
24、除了本公司外，还应聘了哪些公司？
回答提示：很奇怪，这是相当多公司会问的问题，其用意是要概略知道应徵者的求职志向，所以这并非绝对是负面答案，就算不便说出公司名称，也应回答“销售同种产品的公司”，如果应聘的其他公司是不同业界，容易让人产生无法信任的感觉。
25、你还有什么问题要问吗？
回答提示：企业的这个问题看上去可有可无，其实很关键，企业不喜欢说“没问题”的人，因为其很注重员工的个性和创新能力。企业不喜欢求职者问个人福利之类的问题，如果有人这样问：贵公司对新入公司的员工有没有什么培训项目，我可以参加吗？或者说贵公司的晋升机制是什么样的？企业将很欢迎，因为体现出你对学习的热情和对公司的忠诚度以及你的上进心。
26、如果你被录用，何时可以到职？
回答提示：大多数企业会关心就职时间，最好是回答“如果被录用的话，到职日可按公司规定上班”，但如果还未辞去上一个工作、上班时间又太近，似乎有些强人所难，因为交接至少要一个月的时间，应进一步说明原因，录取公司应该会通融的。
#T=测试面试
你认为用户、客户、开发人员、测试人员（需求阶段、研发阶段）各自的职责是什么？
请给出非功能性（质量特性）测试例子？及尝试如何设计测试方法？工具？
如何进行缺陷管理？跟踪？工具？
请设计一组在分布式并发环境下，保障应用程序（数据库）数据一致性的测试用例，包括输入参数、期望输出结果等
用户认证与用户授权的主要区别是什么？请设计相关测试用例：从“登陆框（用户名、密码）”开始包括输入参数、期望输出结果，考虑安全性
在测试过程中你是如何保障测试进度的？需求变更？（范围、时间）如何看待？
你会在什么情况下去寻求他人（如：开发人员、项目经理）的直接支持或帮助或者沟通？如何沟通？如何准备？
CS程序与Web B/S程序的主要区别是什么？在多层架构中都有哪些层？它们各自的职责是什么？
常见的Web Http Status 返回码有哪些？含义是什么？
你做过版本管理、配置管理、构建部署相关的工作吗
自动化测试手段？


1.	需求
1)	你能给出一些非功能性（或者质量）需求的例子么？
2)	如果客户需要高性能、使用极其方便而又高度安全，你会给他什么建议？
3)	你能给出一些用来描述需求的不同技术么？它们各自适用于什么场景？
4)	需求跟踪是什么意思？什么是向前追溯，什么是向后追溯？
5)	你喜欢用什么工具跟踪需求？
6)	你怎么看待需求变化？它是好是坏？给出你的理由。
7)	你怎样研究需求，发现需求？有哪些资源可以用到？
8)	你怎么给需求制定优先级？有哪些技术？
9)	在需求过程中，用户、客户、开发人员各自的职责是什么？
10)	你怎么对待不完整或是令人费解的需求？


2.	功能设计
1)	在功能设计中有哪些隐喻？给出几个成功的例子。
2)	如果有些功能的执行时间很长，怎么能让用户感觉不到太长的等待？
3)	如果用户必须要在一个很小的区域内，从一个常常的列表中选择多个条目，你会用什么控件？
4)	有哪些方法可以保证数据项的完整？
5)	建立系统原型有哪些技术？
6)	应用程序怎样建立对用户行为的预期？给出一些例子。
7)	如何入手设计一组数量庞大而又复杂的特性，你能举出一些设计思路吗？
8)	有一个列表，其中有10个元素，每个元素都有20个字段可以编辑，你怎样设计这种情况？如果是1000个元素，每个元素有3个字段呢？
9)	用不同的颜色对一段文本中的文字标记高亮，这种做法有什么问题？
10)	Web环境和Windows环境各有些什么限制？


3.	技术设计
1)	什么是低耦合和高聚合？封装原则又是什么意思？
2)	在Web应用中，你怎样避免几个人编辑同一段数据所造成的冲突？
3)	你知道设计模式吗？你用过哪些设计模式？在什么场合下用的？
4)	是否了解什么是无状态的业务层？长事务如何与之相适应？
5)	在搭建一个架构，或是技术设计时，你用过几种图？
6)	在N层架构中都有哪些层？它们各自的职责是什么？
7)	有哪些方法可以确保架构中数据的正确和健壮？
8)	面向对象设计和面向组件设计有哪些不同之处？
9)	怎样在数据库中对用户授权、用户配置、权限管理这几项功能建模？
10)	怎样按照等级制度给动物王国（包括各种物种和各自的行为）建模？


4.	程序设计
1)	你怎样保证你的代码可以处理各种错误事件？
2)	解释一下什么是测试驱动开发，举出极限编程中的一些原则。
3)	看别人代码的时候，你最关心什么地方？
4)	什么时候使用抽象类，什么时候使用接口？
5)	除了IDE以外，你还喜欢哪些必不可少的工具？
6)	你怎么保证代码执行速度快，而又不出问题？
7)	什么时候用多态，什么时候用委派？
8)	什么时候使用带有静态成员的类，什么时候使用单例？
9)	你在代码里面怎么提前处理需求的变化？给一些例子。
10)	描述一下实现一段代码的过程，从需求到最终交付。


5.	算法
1)	怎样知道一个数字是不是2的乘方？怎样判断一个数是不是奇数？
2)	怎样找出链表中间的元素？
3)	怎样改变10,000个静态HTML页面中所有电话号码的格式？
4)	举出一个你所用过的递归的例子。
5)	在散列表和排序后的列表中找一个元素，哪个查找速度最快？
6)	不管是书、杂志还是网络，你从中所学到的最后一点算法知识是什么？
7)	怎样把字符串反转？你能不用临时的字符串么？
8)	你愿意用什么类型的语言来编写复杂的算法？
9)	有一个数组，里面是从1到1,000,000的整数，其中有一个数字出现了两次，你怎么找出那个重复的数字？
10)	你知道“旅行商问题（Traveling Salesman Problem）”么？


6.	数据结构
1)	怎样在内存中实现伦敦地铁的结构？
2)	怎样以最有效的方式在数据库中存储颜色值？
3)	队列和堆栈区别是什么？
4)	用堆或者栈存储数据的区别是什么？
5)	怎样在数据库中存储N维向量？
6)	你倾向于用哪种类型的语言编写复杂的数据结构？
7)	21的二进制值是什么？十六制值呢？
8)	不管是书、杂志还是网络，你从中所学到的最后一点数据结构的知识是什么？
9)	怎样在XML文档中存储足球比赛结果（包括队伍和比分）？
10)	有哪些文本格式可以保存Unicode字符？


7.	测试
1)	什么是回归测试？怎样知道新引入的变化没有给现有的功能造成破坏？
2)	如果业务层和数据层之间有依赖关系，你该怎么写单元测试？
3)	你用哪些工具测试代码质量？
4)	在产品部署之后，你最常碰到的是什么类型的问题？
5)	什么是代码覆盖率？有多少种代码覆盖率？
6)	功能测试和探索性测试的区别是什么？你怎么对网站进行测试？
7)	测试套件、测试用例、测试计划，这三者之间的区别是什么？你怎么组织测试？
8)	要对电子商务网站做冒烟测试，你会做哪些类型的测试？
9)	客户在验收测试中会发现不满意的东西，怎样减少这种情况的发生？
10)	你去年在测试和质量保证方面学到了哪些东西？


8.	维护
1)	你用哪些工具在维护阶段对产品进行监控？
2)	要想对一个正在产品环境中被使用的产品进行升级，该注意哪些重要事项？
3)	如果在一个庞大的文件中有错误，而代码又无法逐步跟踪，你怎么找出错误？
4)	你怎样保证代码中的变化不会影响产品的其他部分？
5)	你怎样为产品编写技术文档？
6)	你用过哪些方式保证软件产品容易维护？
7)	怎样在产品运行的环境中进行系统调试？
8)	什么是负载均衡？负载均衡的方式有哪些种？
9)	为什么在应用程序的生命周期中，软件维护费用所占的份额最高？
10)	再造工程（re-engineering）和逆向工程（reverse engineering）的区别是什么？


9.	配置管理
1)	你知道配置管理中基线的含义么？怎样把项目中某个重要的时刻冻结？
2)	你一般会把哪些东西纳入版本控制？
3)	怎样可以保证团队中每个人都知道谁改变了哪些东西？
4)	Tag和Branch的区别是什么？在什么情况下该使用tag，什么时候用branch？
5)	怎样管理技术文档——如产品架构文档——的变化？
6)	你用什么工具管理项目中所有数字信息的状态？你最喜欢哪种工具？
7)	如果客户想要对一款已经发布的产品做出变动，你怎么处理？
8)	版本管理和发布管理有什么差异？
9)	对文本文件的变化和二进制文件的变化进行管理，这二者有什么不同？
10)	同时处理多个变更请求，或是同时进行增量开发和维护，这种事情你怎么看待？


10.	项目管理
1)	范围、时间、成本，这三项中哪些是可以由客户控制的？
2)	谁该对项目中所要付出的一切做出估算？谁有权设置最后期限？
3)	减少交付的次数，或是减少每个每个交付中的工作量，你喜欢哪种做法？
4)	你喜欢用哪种图来跟踪项目进度？
5)	迭代和增量的区别在哪里？
6)	试着解释一下风险管理中用到的实践。风险该如何管理？
7)	你喜欢任务分解还是滚动式计划？
8)	你需要哪些东西帮助你判断项目是否符合时间要求，在预算范围内运作？
9)	DSDM、Prince2、Scrum，这三者之间有哪些区别？
10)	如果客户想要的东西太多，你在范围和时间上怎样跟他达成一致呢？
#
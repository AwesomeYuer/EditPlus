#TITLE=10.WinDbg help
#INFO
New Cliptext library
#SORT=n

#T=SOS参考
命令 
 说明 
 
BPMD [<module name> <method name>] [-md <MethodDesc>]
 在指定模块中的指定方法处创建断点。 

如果尚未加载指定的模块和方法，则此命令将在创建断点之前等待已加载并实时编译模块的通知。 
 
CLRStack [-a] [-l] [-p]
 仅提供托管代码的堆栈跟踪。 

-p 选项显示托管函数的参数。 

-l 选项将显示有关帧中的局部变量的信息。 SOS 调试扩展无法检索本地名称，因此本地名称的输出采用 <local address> = <value> 格式。 

-a (all) 选项是一个表示 -l 和 -p 的组合的快捷方式。

在基于 x64 和 IA-64 的平台上，SOS 调试扩展不显示过渡帧。
 
COMState 
 列出每个线程的 COM 单元模型和 Context 指针（如果有）。
 
DumpArray [-start <startIndex>] [-length <length>] [-details] [-nofields] <array object address>

- 或 -

DA [-start <startIndex>] [-length <length>] [-detail] [-nofields] array object address>
 检查数组对象的元素。 

-start 选项指定开始显示元素的起始索引。

-length 选项指定要显示的元素数量。

-detail 选项使用 DumpObj 和 DumpVC 格式显示元素的详细信息。

-nofields 选项可阻止显示数组。 此选项只有在指定了 -detail 选项之后才可用。
 
DumpAssembly <Assembly address>
 显示有关程序集的信息。

DumpAssembly 命令将列出多个模块（如果存在）。

可以使用 DumpDomain 命令获取程序集的地址。
 
DumpClass <EEClass address>
 显示有关与类型关联的 EEClass 结构的信息。 

DumpClass 命令显示静态字段值，但不显示非静态字段值。

使用 DumpMT、DumpObj, Name2EE 或 Token2EE 命令获取 EEClass 结构的地址。
 
DumpDomain [<Domain address>]
 枚举在指定的 AppDomain 对象地址内加载的每个 Assembly 对象。 若在调用 DumpDomain 命令时不提供任何参数，则将列出进程中的所有 AppDomain 对象。
 
DumpHeap [-stat] [-min <size>][-max <size>] [-thinlock] [-mt <MethodTable address>] [-type <partial type name>][start [end]]
 显示有关垃圾回收堆的信息和有关对象的回收统计信息。 

如果 DumpHeap 命令检测到垃圾回收器堆中存在过多碎片，将会显示警告。 

-stat 选项将输出限制为统计类型摘要。

-min 选项忽略小于 size 参数指定的大小（单位为字节）的对象。

-max 选项忽略大于 size 参数指定的大小（单位为字节）的对象。

-thinlock 选项报告 ThinLocks。 有关更多信息，请参见 SyncBlk 命令。

-mt 选项仅列出与指定的 MethodTable 结构对应的那些对象。

-type 选项仅列出其类型名称属于指定字符串的子串的那些对象。

start 参数从指定的地址处开始列出。

end 参数在指定的地址处停止列出。
 
DumpIL [<DynamicMethod address>] [<DynamicMethodDesc address>] [<MethodDesc address>]
 显示与托管方法关联的中间语言 (IL)。 

请注意，发出的动态 IL 与从程序集加载的 IL 不同。 动态 IL 引用托管对象数组中的对象而不是引用元数据标记。
 
DumpLog [<Filename>]
 将内存中压力日志的内容写入到指定文件。 如果您不指定文件名，则此命令将在当前目录中创建一个名为 Stresslog.txt 的文件。

公共语言运行库提供了内存中压力日志，可帮助您诊断压力故障。 该日志可让您不必使用锁和 I/O 即可诊断故障。若要启用压力日志，请在 HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework 下设置下列注册表项：

(DWORD) StressLog = 1

(DWORD) LogFacility = 0xffffffff 

(DWORD) StressLogSize = 65536
 
DumpMD <MethodDesc address>
 显示有关指定地址处的 MethodDesc 结构的信息。 

可以使用 IP2MD 命令从托管函数中获取 MethodDesc 结构地址。
 
DumpMT [-MD] <MethodTable address>
 显示有关指定地址处的方法表的信息。 指定 -MD 选项将显示与对象一起定义的所有方法的列表。

每个托管对象都包含一个方法表指针。 
 
DumpMethodSig <sigaddr> <moduleaddr>
 显示有关指定地址处的 MethodSig 结构的信息。
 
DumpModule [-mt] <Module address>
 显示有关指定地址处的模块的信息。 -mt 选项显示模块中定义的类型和模块所引用的类型。 

可以使用 DumpDomain 或 DumpAssembly 命令检索模块的地址。
 
DumpObj <object address>

- 或 -

DO <object address>
 显示有关指定地址处的对象的信息。 DumpObj 命令显示对象的字段、EEClass 结构信息、方法表和大小。

可以使用 DumpStackObjects 命令检索对象的地址。

请注意，可以对 CLASS 类型的字段运行 DumpObj 命令，因为这些字段也是对象。
 
DumpRuntimeTypes 
 显示垃圾回收器堆中的运行库类型对象并列出其关联的类型名称和方法表。 
 
DumpStack [-EE] [top stack [bottom stack]]
 显示堆栈跟踪。 

-EE 选项使 DumpStack 命令仅显示托管函数。 使用 top 和 bottom 参数可限制 x86 平台上显示的堆栈帧。 

在 x86 平台上，DumpStack 命令将创建详细的堆栈跟踪。 

在基于 x64 和 IA-64 的平台上，DumpStack 命令将模拟执行调试器的 K 命令。 在基于 x64 和 IA-64 的平台上，将忽略 top 和 bottom 参数。 
 
DumpSig <sigaddr> <moduleaddr>
 显示有关指定地址处的 Sig 结构的信息。
 
DumpStackObjects [-verify] [top stack [bottom stack]]

- 或 -

DSO [-verify] [top stack [bottom stack]]
 显示在当前堆栈的边界内找到的所有托管对象。 

-verify 选项验证对象字段的每个非静态 CLASS 字段。 

将 DumpStackObject 命令与堆栈跟踪命令（如 K 命令和 CLRStack 命令）一起使用，以确定局部变量和参数的值。
 
DumpVC <MethodTable address> <Address>
 显示有关指定地址处的值类字段的信息。 

MethodTable 参数使 DumpVC 命令可以正确解释字段。 值类不使用方法表作为它的第一个字段。 
 
EEHeap [-gc] [-loader]
 显示有关内部公共语言运行库数据结构所使用的进程内存的信息。 

-gc 和 -loader 选项将此命令的输出限制为垃圾回收器或加载程序数据结构。

有关垃圾回收器的信息列出了托管堆中每个段的范围。 如果指针落在由 EEHeap -gc 给出的段范围内，则该指针是一个对象指针。
 
EEStack [-short] [-EE]
 对一个进程中的所有线程运行 DumpStack 命令。 

将 -EE 选项直接传递给 DumpStack 命令。 -short 参数将输出限制为以下类型的线程：

已获取锁的线程。 
己停止运行以允许垃圾回收的线程。 
当前在托管代码中的线程。 
 
EEVersion 
 显示公共语言运行库版本。 
 
EHInfo [<MethodDesc address>] [<Code address>]
 显示指定方法中的异常处理块。 此命令显示子句块（try 块）和处理程序块（catch 块）的代码地址和偏移量。 
 
FinalizeQueue [-detail]
 显示所有已进行终结注册的对象。

-detail 选项显示有关等待清理的任何 SyncBlocks 的附加信息以及有关等待清理的任何 RuntimeCallableWrappers (RCW) 的额外信息。 这两种数据结构都由终结器线程进行缓存和清理。
 
FindAppDomain <Object address>
 确定指定地址处的对象的应用程序域。 
 
GCHandles [-perdomain]
 显示有关进程中的垃圾回收器句柄的统计信息。 

传递 -perdomain 选项将按应用程序域排列统计信息。

使用 GCHandles 命令可查找由垃圾回收器句柄泄漏导致的内存泄漏。 例如，当代码由于强垃圾回收器句柄仍指向一个大型数组而保留该数组时，若不释放句柄就将其放弃，则会发生内存泄漏。
 
GCHandleLeaks 
 在内存中搜索进程中的对强垃圾回收器句柄和固定垃圾回收器句柄的任何引用并显示结果。 如果找到某个句柄，GCHandleLeaks 命令将显示相应的引用地址。 如果在内存中找不到句柄，此命令将显示一个通知。
 
GCInfo <MethodDesc address> <Code address>
 显示指示寄存器或堆栈位置何时包含托管对象的数据。 如果发生垃圾回收，回收器必须知道对象引用的位置，以便可以使用新的对象指针值更新相应的对象引用。
 
GCRoot [-nostacks] <Object address>
 显示有关对指定地址处的对象的引用（或根）的信息。 

GCRoot 命令将检查整个托管堆和句柄表以查找其他对象内的句柄和堆栈上的句柄。 然后，在每个堆栈中搜索对象的指针，同时还搜索终结器队列。 

此命令无法确定堆栈根是有效的还是已丢弃。 使用 CLRStack 和 U 命令可对本地或参数值所属的帧进行反汇编，以便确定堆栈根是否仍在使用中。

-nostacks 选项将搜索限制为垃圾回收器句柄和 Freachable 对象。
 
help [<command>] [<faq>]
 在未指定参数时显示所有可用命令，或者显示有关指定命令的详细帮助信息。

faq 参数显示常见问题的答案。
 
IP2MD <Code address>
 显示已实时 (JIT) 编译的代码中指定地址处的 MethodDesc 结构。 
 
MinidumpMode [0] [1]
 防止在使用小型转储时运行不安全的命令。 

传递 0 以禁用此功能或传递 1 以启用此功能。 默认情况下，MinidumpMode 值设置为 0。

使用 .dump /m 命令或 .dump 命令创建的小型转储具有有限的特定于 CLR 的数据，只允许您正确运行 SOS 命令的一个子集。 有些命令可能会因意外错误而失败，出错原因在于所需的内存区域未被映射或仅被部分映射。 此选项可防止您对小型转储运行不安全的命令。
 
Name2EE <module name> <type or method name>

- 或 -

Name2EE <module name>!<type or method name>
 显示指定模块中指定类型或方法的 MethodTable 结构和 EEClass 结构。

在进程中必须加载指定的模块。 

若要获取正确的类型名称，请使用 MSIL 反汇编程序 (Ildasm.exe) 浏览模块。 也可以将 * 作为 module name 作为参数来传递以搜索所有已加载的托管模块。 module name 参数也可以是模块调试器的名称，如 mscorlib 或 image00400000。

此命令支持 Windows 调试器语法：<module>!<type>。 类型必须是完全限定的。
 
ObjSize [<Object address>]
 显示指定对象的大小。 不带任何参数的 ObjSize 命令将显示托管线程上找到的所有对象的大小，显示进程中的所有垃圾回收器句柄，并对这些句柄指向的任何对象的大小进行合计。 除父对象之外，ObjSize 命令还包括所有子对象的大小。
 
PrintException [-nested] [<Exception object address>]

- 或 -

PE [-nested] [<Exception object address>]
 显示从指定地址处的 Exception 类派生的任何对象的字段并设置这些字段的格式。 如果不指定地址，PrintException 命令将显示在当前线程上引发的最后一个异常。 

-nested 选项显示有关嵌套异常对象的详细信息。

可以使用此命令设置 _stackTrace 字段的格式化并查看该字段，该字段是一个二进制数组。
 
ProcInfo [-env] [-time] [-mem]
 显示进程的环境变量、内核 CPU 时间和内存使用统计信息。
 
RCWCleanupList <RCWCleanupList address>
 显示在指定地址处等待清理的运行库可调用包装的列表。
 
SaveModule <Base address> <Filename>
 将加载到内存中指定地址的图像写入指定文件。 
 
StopOnException [-derived] [-create | -create2] <Exception> <Pseudo-register number>
 使调试器在引发指定异常时停止，但在引发其他异常时继续运行。 

-derived 选项用于捕获指定异常以及从指定异常派生的每个异常。 
 
SyncBlk [-all | <syncblk number>]
 显示指定的 SyncBlock 结构或所有 SyncBlock 结构。 如果不传递任何参数，SyncBlk 命令将显示与一个线程拥有的对象对应的 SyncBlock 结构。 

SyncBlock 结构是一个容器，用于存放无需为每个对象创建的额外信息。 它可以存放 COM Interop 数据、哈希代码和用于线程安全操作的锁定信息。
 
ThreadPool 
 显示有关托管线程池的信息，包括队列中工作请求的数目、完成端口线程的数目和计时器的数目。
 
Token2EE <module name> <token>
 将指定模块中的指定元数据标记转换成 MethodTable 结构或 MethodDesc 结构。

可以为 module name 参数传递 * 以在每个已加载的托管模块中查找该标记映射到的内容。 也可以传递某个模块的调试器名称，如 mscorlib 或 image00400000。
 
Threads [-live] [-special]
 显示进程中的所有托管线程。 

Threads 命令显示调试器的简写 ID、公共语言运行库线程 ID 和操作系统线程 ID。另外，Threads 命令还会显示一个“Domain”（域）列以指示正在执行线程的应用程序域、一个“APT”列以显示 COM 单元模式以及一个“Exception”（异常）列以显示线程中所引发的最后一个异常。 

-live 选项显示与活动线程关联的线程。

-special 选项显示由 CLR 创建的所有特殊线程。 特殊线程包括垃圾回收 (GC) 线程（在并行 GC 和服务器 GC 中）、调试器帮助程序线程、终结器线程、AppDomain 卸载线程和线程池计时器线程。
 
TraverseHeap [-xml] <filename>
 以 CLR 探查器能够识别的格式将堆信息写入指定文件。 -xml 选项使 TraverseHeap 命令将文件格式化为 XML。

可以从以下网址下载 CLR 探查器：http://www.microsoft.com/downloads/details.aspx?displaylang=zh-cn&familyid=90548130-4468-4bbc-9673-d6acabd5d13b
 
U [-gcinfo] [-ehinfo] <MethodDesc address> | <Code address>
 显示由方法的 MethodDesc 结构指针或方法体内的代码地址指定的托管方法的反汇编（带有批注）。 U 命令将从开始到结束显示整个方法，并带有将元数据标记转换为名称的批注。

-gcinfo 选项导致 U 命令显示方法的 GCInfo 结构。 

-ehinfo 选项显示方法的异常信息。 也可以使用 EHInfo 命令获取此信息。
 
VerifyHeap 
 检查垃圾回收器堆中是否有损坏迹象，并显示找到的任何错误。 

错误构造的平台调用可能导致堆损坏。
 
VMMap 
 遍历虚拟地址空间并显示应用于每个区域的保护类型。
 
VMStat 
 提供虚拟地址空间的摘要视图，并按应用于该内存的每种保护类型（可用、已保留、已提交、私有、已映射和映像）排序。 “TOTAL”列显示“AVERAGE”列乘以“BLK COUNT”列的结果。
 

备注

可通过以下方法使用 SOS 调试扩展：将其加载到 WinDbg.exe Debugger（WinDbg.exe 调试器） 或加载到 Visual Studio 2005 或早期版本。 可以在 WinDgb.exe 或 Visual Studio 的“即时”窗口中执行命令。

SOS 调试扩展允许您查看有关在公共语言运行库内运行的代码的信息。例如，可以使用 SOS 调试扩展显示有关托管堆的信息、查找堆损坏情况、显示运行库所使用的内部数据类型以及查看有关在运行库内运行的所有托管代码的信息。

加载 SOS 调试扩展

若要在 WinDbg.exe 调试器中加载 SOS 调试扩展，请在工具中运行以下命令；若要在 Visual Studio 中加载 SOS 调试扩展，请在调试时在“即时”窗口中运行以下命令： 

.loadby sos 

必须首先在解决方案的项目设置中启用非托管调试，才能加载 SOS 调试扩展。 对于某些语言，默认情况下将禁用非托管调试。

注意   若要在 Visual Studio 2005 中显示“即时”窗口，请依次单击“调试”菜单、“窗口”菜单，然后单击“即时”选项。也可以通过选择 Ctrl-Alt-I 打开 Visual Studio 中的“即时”窗口。

WinDbg.exe 和 Visual Studio 使用与当前使用的 Mscorwks.dll 版本对应的 SOS.dll 版本。 在 .NET Framework 1.1 和 2.0 版中，SOS.dll 安装在与 Mscorwks.dll 相同的目录中。 默认情况下，应使用与当前版本的 Mscorwks.dll 匹配的 SOS.dll 版本。 

若要使用在其他计算机上创建的转储文件，请确保该安装所附带的 Mscorwks.dll 文件存在于符号路径中，并加载相应的 SOS.dll 版本。

若要加载特定版本的 SOS.dll，请在 Windows 调试器中键入以下命令：

.load <full path to sos.dll> 

示例

下面的命令显示在地址 00ad28d0 处的数组内容。显示从第二个元素开始，连续显示五个元素。

!dumparray -start 2 -length 5 -detail 00ad28d0 

下面的命令显示在地址 1ca248 处的程序集的内容。

!dumpassembly 1ca248

下面的命令显示有关垃圾回收器堆的信息。

!dumpheap

下面的命令将内存中压力日志的内容写入到当前目录中名为 Stresslog.txt 的文件中。

!DumpLog

下面的命令显示在地址 902f40 处的 MethodDesc 结构。 

!dumpmd 902f40

下面的命令显示有关在地址 1caa50 处的模块的信息。

!dumpmodule 1caa50

下面的命令显示有关在地址 a79d40 处的对象的信息。

!DumpObj a79d40

下面的命令使用在地址 0090320c 处的方法表显示在地址 00a79d9c 处的值类的字段。

!DumpVC 0090320c 00a79d9c

下面的命令显示垃圾回收器所使用的进程内存。

!eeheap -gc

下面的命令显示所有已做好终结计划的对象。

!finalizequeue

下面的命令确定在地址 00a79d98 处的对象的应用程序域。

!findappdomain 00a79d98

下面的命令显示当前进程中的所有垃圾回收器句柄。

!gcinfo 5b68dbb8 

下面的命令显示模块 unittest.exe 的类 MainClass 中的 Main 方法的 MethodTable 和 EEClass 结构。

!name2ee unittest.exe MainClass.Main

下面的命令显示有关在模块 unittest.exe 中的地址 02000003 处的元数据标记的信息。

!token2ee unittest.exe 02000003

 

#T=Windbg 使用
配置符号文件
SRV*D:\symbols*http://msdl.microsoft.com/download/symbols
.load c:\WINDOWS\Microsoft.NET\Framework64\v2.0.50727\sos.dll
检查堆栈：
Examine the stacks

1. Examine the native callstacks
~* kb 2000
2. Examine the .net callstacks
~* e !clrstack
Q: Do you see any patterns or recognize any of the callstacks that suggests a thread is waiting for a synchronization mechanism?
Troubleshoot the hang

1. Determine the ID of the thread owning the lock
!syncblk
Q: What thread owns the lock?
Q: How many threads are waiting for the lock?
Hint: MonitorHeld = 1 for each owner and 2 for each waiter.
2. Pick one of the waiters (Hint: waiters will sit in AwareLock::Enter) and take a look at what it is doing.
~5s (move to thread 5, replace 5 with actual thread ID)
kb 2000 (examine native stack)
!clrstack (examine .net stack)
Q: In which .net function is it waiting for the lock?
3. Determine what the owning thread is doing
~5s (move to thread 5, replace 5 with actual thread ID)
kb 2000 (examine native stack)
!clrstack (examine .net stack)
Q: Why is it blocking?
4. Examine the code for .NET method owning the lock to verify your theory.
#T=WinDbg SOS Extension Cheat Sheet (看雪)
WinDbg SOS Extension Cheat Sheet

========================================================================
HELP
========================================================================

.hh
  -> Open Debugger.chm.
!SOS.help
  -> See all commands in an extension.
!SOS.help !command
  -> Get help for one command in an extension.

========================================================================
PREPARE THE ENVIRONMENT
========================================================================

---------------
SET SYMBOL PATH
---------------

.sympath
    -> Shows current symbol path.
.sympath srv*c:\symbols*\\symbols\symbols
    -> Sets symbol path.
.sympath+ srv*c:\symbolspub*http://msdl.microsoft.com/downloads/symbols
    -> Adds path to symbol path.
  
--------------------
SET SOURCE CODE PATH
--------------------

.srcpath
    -> Shows current source path.
.srcpath \\dubitgfila04\DevDivServicing\whidbey\50727.42\sources
    -> Sets source path.
.srcpath+ C:\path
    -> Adds path to source path.
  
----------------
LOAD EXTENSIONS
----------------

.chain
    -> Shows loaded extensions.  
!EEVersion 
    -> Shows .NET version and SOS version.
.load SOS
    -> Loads extension.
sxe ld mscorwks.dll; g; .loadby SOS mscorwks
sxe -c "" clrn; g; .loadby SOS mscorwks
sxe -c ".loadby sos mscorwks; g" ld mscorwks.dll
    -> Loads the right version of SOS when mscorwks.dll gets loaded.
.unload SOS
    -> Unloads extension

========================================================================
SET A BREAKPOINT
========================================================================

-----------
FIND METHOD
-----------

!DumpDomain
    -> Shows all app domains and their assemblies/modules.
!DumpAssembly <Assembly>
    -> Shows assembly info: name, modules...
!DumpModule -mt <Module>
    -> Shows Method Tables (types) defined and referenced by a module.
!DumpMT -md <Method Table> 
    -> Shows Method Descriptors of a Method Table.
!DumpMD <Method Descriptor>
    -> Shows Method Descriptor info. We can see Code Address if method
       is jitted.
!Name2EE <Module> <NameSpace.Class.Method>
!Name2EE <Module>!<NameSpace.Class.Method>
    -> Shows Method Descriptor and jitted Code Address of a method.
!Name2EE * <NameSpace.Class.Method>
!Name2EE *!<NameSpace.Class.Method>
    -> Shows Module, Method Descriptor and jitted Code Address of a 
       method.

--------------
SET BREAKPOINT
--------------

!BPMD -md <Method Descriptor>
    -> Sets breakpoint on method by Method Descriptor.
bp <Code Address>
    -> Sets breakpoint on method by jitted Code Address.
!BPMD <Module> <NameSpace.Class.Method>
    -> Sets breakpoint on method by module and name.
bl
    -> Lists breakpoints.
bd 0
bd *
    -> Disables breakpoints.
be 1
    -> Enables breakpoint.
bc 0
    -> Removes breakpoints.

-----------------
STEP THROUGH CODE
-----------------

l+t
    -> Enables source code mode. With private symbols and source code, 
       Windbg will open source code files automatically.
l-t
    -> Enables assembly mode.
p
    -> Steps over (F10).
t
    -> Steps into (F11 or F8).

========================================================================
CALL STACKS
========================================================================

--------------------------
INSPECT CURRENT CALL STACK
--------------------------

k
    -> Shows unmanaged + managed call stack.
kp
    -> Shows unmanaged + managed call stack with unmanaged parameters.
!DumpStack
    -> Shows raw call stack with unmanaged + managed calls and managed 
       Method Descriptors.
!CLRStack
    -> Shows managed call stack.
!DumpStack -EE
    -> Shows managed call stack with Method Descriptors.
!CLRStack -p
    -> Shows managed call stack with parameters.
!CLRStack -l
    -> Shows managed call stack with locals (we will only see memory 
       addresses in the stack).
!CLRStack -a
    -> Shows managed call stack with parameters and locals.
    
---------------
INSPECT OBJECTS
---------------

!DumpObj <Object>
!do <Object>
    -> Shows object info: Method Table, EEClass, size, fields...
!DumpArray <Array>
!da <Array>
    -> Shows array info: # of elements, elements, their type...  

-------------------
INSPECT SOURCE CODE
-------------------

kn
    -> Shows unmanaged + managed call stack with frame numbers.
.frame <Frame Number>
    -> Changes the local context to a specific method frame. With Source 
       Code Mode enabled, private symbols and source code, Windbg will 
       open the source code file automatically.

------------
INSPECT MSIL
------------

!IP2MD <Instruction Pointer>
!CLRStack; !IP2MD <Instruction Pointer>
!DumpStack -EE
!IP2MD @eip
    -> Gets a Method Descriptor that we can use with !DumpIL.
!DumpIL <Method Descriptor>
    -> Shows IL of a method. ILDASM.exe and Reflector.exe show the same 
       IL, but also locals.

-------------------
INSPECT SOURCE CODE
-------------------
lm; !SaveModule <Dll start> c:\sample.dll
    -> Writes a loaded dll to disk.
    
----------------
INSPECT ASSEMBLY
----------------

k
!DumpMD <Method Descriptor>
!DumpStack -EE; !DumpMD <Method Descriptor>
    -> Gets Code Address of an unmanaged or managed jitted method.
u <Code Address>
    -> Shows several lines of assembly code at a given Code Address, and 
       source code lines if we have private symbols.
uf <Code Address>
    -> Shows all the assembly code of the managed or unmanaged function 
       containing the Code Address, and source code lines if we have 
       private symbols.
!u <Code Address>
    -> Shows all the assembly code of the managed method containing the 
       Code Address, and marks that address with ">>>". 
       If address is in unmanaged method and we have private symbols and
       source code, it shows all the assembly in that method along with
       the source code itself!
       
-----------------
INSPECT REGISTERS
-----------------

r ecx    
    -> When hitting a breakpoint on a managed function, it shows its 
       first parameter (_fastcall calling convention). First parameter
       is usually the 'this' pointer.
r edx
    -> When hitting a breakpoint on a managed function, it shows its
       second parameter (_fastcall calling convention).
r esi
    -> Typically used to hold the 'this' pointer as copied from ecx.

========================================================================
THREADS
========================================================================

-------------------
INSPECT ALL THREADS
-------------------

~
    -> Shows all threads (managed and unmanaged).
!runaway
    -> Shows time consumed by each thread.
~0s
    -> Switches to thread 0.
~#s
    -> Switches to the thread where the debugger broke.
~*k100
    -> Shows all unmanaged + managed call stacks in all threads.
!Threads
    -> Shows all managed threads.
~*e !CLRStack
    -> Shows managed calls in all threads.
!Threads -special
    -> Shows all .NET related threads (managed and unmanaged).
!ThreadPool
    -> Shows ThreadPool info: number of work requests in the queue, 
       timers and completion port threads.
       
========================================================================
THREAD STACKS
========================================================================

----------------------------
INSPECT OBJECTS IN THE STACK
----------------------------

!DumpStackObjects
!dso
    -> Shows a list of references to objects that are still on the 
       thread’s stack.
       
---------------
INSPECT OBJECTS
---------------

!do <Object>
    -> Shows object info: Method Table, EEClass, size, fields...
!do -nofields <Object>
    -> Shows object info but not fields. Good to see i.e. Strings.
!da <Array>
    -> Shows array info: # of elements, elements, their type...  
!DumpVC <Method Table> <Value Type Address>
    -> Shows value type structs ('VT = 1' in '!do'). 
!DumpClass <EEClass>
    -> Shows the static fields of an object/class ('Attr = static' in 
       '!do'). These fields are part of the EEClass, a representation of 
       a class created before any method invocations are made on it. 
!DumpClass <EEClass>       
!Name2EE <Module> <NameSpace.Class>; !DumpClass <EEClass>
    -> Shows the static fields of a class.
    
========================================================================
MANAGED HEAP
========================================================================

------------
INSPECT HEAP
------------

!EEVersion
    -> Shows version of GC heap (server/workstation) and how many GC 
       heaps we have in server mode.
!EEHeap -gc
    -> Shows how many GC heaps there are and how much memory is taken by
       them.
!Threads
    -> Shows if Preemptive GC is enabled on a thread.
    
---------------------------
INSPECT OBJECTS IN THE HEAP
---------------------------

!DumpHeap
    -> Shows all objects in the heap.
!DumpHeap -stat
    -> Shows statistics of all objects in the heap: # of objects of 
       a given type/Method Table, etc.
!DumpHeap -mt <Method Table>       
!Name2EE * <NameSpace.Class.Method>; !DumpHeap -mt <Method Table>
    -> Shows all objects in the heap of a given type/Method Table.
!DumpHeap -type <Partial Class Name>
    -> Shows all objects in the heap which class name contains a text.
!DumpHeap -min 85000
!EEHeap -GC; !DumpHeap <LOH begin> <LOH allocated>
    -> Shows all objects in Large Object Heap (LOH/Gen 3).
!FinalizeQueue
    -> Shows which objects are ready for finalization and in general 
       which objects in the heap have a Finalize method.
!FinalizeQueue; dd <generation 0 begin> <generation 0 end>-4 
    -> Shows all finalizable objects in Gen 0.
!FinalizeQueue; !DumpHeap -mt <Method Table>
    -> Shows all finalizable objects of a given Method Table/type.
!DumpMT -md <Method Table>
    -> Useful to check if an object/class has Finalize and Dispose 
       methods.
!FinalizeQueue -detail
    -> Shows SyncBlocks and RuntimeCallableWrappers (RCW) registered
       for finalization.
!GCRoot <Object>
    -> Shows references to an object.
!ObjSize <Object>
    -> Shows the size of an object including its child objects.

------------------------
TROUBLESHOOT HEAP ISSUES
------------------------

!TraverseHeap c:\memory.log
    -> Generates a log file which can be analyzed with CLR Profiler.
!VerifyHeap
    -> Checks the heap for signs of corruption.

---------------------------
TROUBLESHOOT GCHANDLE LEAKS
---------------------------

!GCHandles
    -> Shows statistics of GCHandles.
!GCHandleLeaks
    -> Tracks down GCHandle leaks.
!GCHandleLeaks; !DumpObj poi(<GCHandle>)
    -> Shows the object a GCHandle references.
    
-------------------------------
TROUBLESHOOT LOADER HEAP ISSUES
-------------------------------

!DumpHeap -stat -type Assembly
    -> Shows the number of assemblies in the heap.
!DumpDomain
    -> Shows all assemblies.    
!DumpDomain; !DumpModule <Module>; dc <MetaData start> <MetaData start>+<Metadata size>
    -> Shows metadata of a module in an assembly.    
!EEHeap -loader
    -> Shows Loader Heap size and modules.

========================================================================    
BREAK ON AN EXCEPTION
========================================================================    

-----------------------
BREAK ON CLR EXCEPTIONS
-----------------------

sxe clr
sxe 0xe0434f4d
    -> Break on all CLR exceptions.
!StopOnException -create <Exception Type> 1
!soe -create <Exception Type> 1
    -> Break on a specific CLR exception type.
!soe -derived -create <Base Exception Type> 1
    -> Break on all exceptions which derive from a certain type.
sxn clr
    -> Stops breaking on CLR exceptions. If we used '!soe' before, we
       can still see the exception types of the CLR exceptions that we
       hit, but the debugger won't break on them.
sxr
    -> Resets to defaults.
    
----------------------
INSPECT CLR EXCEPTIONS
----------------------

kp; !do <Object from mscorwks!RaiseTheExceptionInternalOnly>
    -> Shows exception object info.
!PrintException <Object>
!pe <Object>
    -> Shows exception info.
!pe
    -> Shows exception info of last exception thrown in current thread.
!dso; !pe <Object>
    -> Shows exception info of an exception in the stack of current 
       thread.
!DumpHeap -type Exception; !DumpHeap -mt <Method Table>; !pe <Object>
    -> Shows exception info of an exception in the heap.
.foreach(ex {!DumpHeap -type <Partial Class Name> -short}){!pe ex;.echo}
    -> Shows exception info of all exceptions of a given type in the 
       heap.

-----------------------------------------
INSPECT METHOD WHERE WE GOT THE EXCEPTION
-----------------------------------------

!pe <Object>; !u <Instruction Pointer>; u <Memory Address>
    -> Shows the line of code where the exception happened.
    
========================================================================    
LOCKS
========================================================================  

---------------------
INSPECT MANAGED LOCKS
---------------------

!SyncBlk
    -> Shows the Index of the syncblock in the syncblock table, the 
       address of the syncblock, the thread holding it & the object 
       which syncblock we are waiting for. MonitorHeld = 1 for each 
       owner and 2 for each waiter. Used with i.e. 
       System.Threading.Monitor.
~*kp; ~*e !CLRStack -p; ~*e !dso; !SyncBlk
    -> Helps to find out which threads are waiting on the syncblock of
       which object.

-----------------------
INSPECT UNMANAGED LOCKS
-----------------------

!locks
!critsec
!SIEExt.critlist
    -> Shows info of a critical sections (unmanaged). Use with i.e.       
       System.Threading.Mutex (not based on syncblocks). 
#T=CmdTree Microshaoft
windbg ANSI Command Tree 1.0
title {"Microshaoft Commands"}
body
{"SOS Commands"}
	{"Load SOS and SOSEX"} {".loadby sos mscorwks;.load sosex"}
	{"Microshaoft Load .NET v4.0+ sos.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v4.0.30319\SOS.dll"}
	{"Microshaoft Load .NET v4.0+ mscorwks.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorwks.dll"}
	{"Microshaoft Load .NET v3.5- sos.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v2.0.50727\SOS.dll"}
	{"Microshaoft Load .NET v3.5- mscorwks.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v2.0.50727\mscorwks.dll"}
	{"Modules"}
		{"All Modules"} {"lm D sm"}
		{"Loaded Modules"} {"lmo D sm"}
		{"Loaded Modules (verbose)"} {"lmvo D sm"}
		{"Modules w/o symbols"} {"lme D sm"}
	{"Threads"}
		{"Managed Threads"} {"!threads"}
		{"Native Threads"} {"~"}
		{"Thread Pool Threads"} {"!threadpool"}
		{"Sync Block Deadlocks"} {"!dlk"}
	{"Stacks"}
		{"Current Managed Stack"} {"!clrstack"}
		{"Current Managed Stack Parameters and Locals"} {"!vars -w"}
		{"Current Native Stack"} {"kP"}
		{"Current Dump Stack"} {"!dumpstack"}
		{"All Managed Stacks"} {"~*e!clrstack"}
		{"All Managed Stack Parameters and Locals"} {"~*e!vars -w"}
		{"All Native Stacks"} {"~*kP"}
		{"All Dump Stacks"} {"!eestack"}
	{"Memory"}
		{"Stack Objects"} {"!dso"}
		{"GC Heap"} {"!eeheap -gc"}
		{"Heap Stats"} {"!dumpheap -stat"}
		{"Objects > 500 bytes"} {"!dumpheap -min 500"}
		{"Objects > 1000 bytes"} {"!dumpheap -min 1000"}
		{"Gen 2 Objects"} {"!dumpgen -stat 2"}
{"Common Commands"}
	{"Information"}
		{"Time of dump"} {".time"}
		{"Process being debugged"} {"|"}
		{"Dump Location"} {"||"}
		{"Create server on port 9999"} {".server tcp:port=9999"}
		{"Show remote connections"} {".clients"}
		{"Process Environment Block"} {"!peb"}
	{"Logging"}
		{"Open Log"} {".logopen /t /u /d"}
		{"Close Log"} {".logclose"}
	{"Modules"}
		{"All Modules"} {"lm D sm"}
		{"Loaded Modules"} {"lmo D sm"}
		{"Loaded Modules (verbose)"} {"lmvo D sm"}
		{"Modules w/o symbols"} {"lme D sm"}
	{"Stacks"}
		{"Set frame length to 2000"} {".kframes 2000"}
		{"Dump current stack w/ DML"} {"kpM 1000"}
		{"Dump stacks without private info"} {"knL 1000"}
		{"Dump stacks with all parameters"} {"kPn 1000"}
		{"Dump stacks (distance from last frame)"} {"kf 1000"}
		{"Dump stacks with Frame Pointer Omission"} {"kvn 1000"}
		{"Dump all stack"} {"~*kbn 1000"}
		{"Dump unique stacks"} {"!uniqstack -pn"}
		{"Thread environment block"} {"!teb"}
		{"Move to next frame"} {".f+"}
		{"Move to previous frame"} {".f-"}
	{"Memory"}
		{"Dump heaps"} {"!heap -a"}
	{"Automated Task"}
		{"!analyze"} {"!analyze -v"}
		{"Locks"} {"!ntsdexts.locks"}
		{"CPU time for User and Kernel Mode"} {"!runaway 7"}
	{"Managed"}
		{"Load sos"} {".loadby sos mscorwks"}
		{"Microshaoft Load .NET v4.0+ sos.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v4.0.30319\SOS.dll"}
		{"Microshaoft Load .NET v4.0+ mscorwks.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorwks.dll"}
		{"Microshaoft Load .NET v3.5- sos.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v2.0.50727\SOS.dll"}
		{"Microshaoft Load .NET v3.5- mscorwks.dll"} {".load C:\Windows\Microsoft.NET\Framework64\v2.0.50727\mscorwks.dll"}
		{"clrstack"} {"!clrstack"}
		{"Threads"} {"!threads"}
		{"Stack Objects"} {"!dso"}
		{"Exceptions"} {"!dae"}
{"Crash Dump Analysis Checklist (www.dumpanalysis.org)"}
	{"General"}
		{"Versions and locations"} {"version"}
		{"Set longer stack trace"} {".kframes 100"}
	{"Application crash or hang"}
		{"Default analysis (crash)"} {"!analyze -v"}
		{"Default analysis (hang)"} {"!analyze -v -hang"}
		{"Switch to x86 architecture"} {".load wow64exts; .effmach x86"}
		{"Critical sections (locked)"} {"!locks"}
		{"Modules"} {"lmv"}
		{"Threads (all)"} {"~*kv 250"}
		{"Threads (unique)"} {"!uniqstack"}
		{"Gflags"} {"!gflag"}
		{"Time consumed by thread"} {"!runaway"}
		{"PEB"} {"!peb"}
		{"TEB"} {"!teb"}
		{"Hooked functions (ntdll)"} {"!chkimg -lo 50 -d !ntdll -v"}
		{"Hooked functions (kernel32)"} {"!chkimg -lo 50 -d !kernel32 -v"}
		{"Hooked functions (user32)"} {"!chkimg -lo 50 -d !user32 -v"}
		{"Hooked functions (ALL)"} {"!for_each_module !chkimg -lo 50 -d !${@#ModuleName} -v"}
		{"Exception handlers"} {"!exchain"}
		{"Computer name"} {"!envvar COMPUTERNAME"}
		{"Stack of exception thread"} {"~#kv 250"}
		{"Stack of current thread"} {"~.kv 250"}
		{"Switch to thread"}
			{"#0"} {"~0s"}
			{"#1"} {"~1s"}
			{"#2"} {"~2s"}
			{"#3"} {"~3s"}
			{"#4"} {"~4s"}
			{"#5"} {"~5s"}
			{"#6"} {"~6s"}
			{"#7"} {"~7s"}
			{"#8"} {"~8s"}
			{"#9"} {"~9s"}
	{"System hang"}
		{"Default analysis"} {"!analyze -v -hang"}
		{"ERESOURCE contention"} {"!locks"}
		{"Processes and virtual memory"} {"!vm 4"}
		{"Sorted pool consumption (paged)"} {"!poolused 4"}
		{"Sorted pool consumption (nonpaged)"} {"!poolused 3"}
		{"Waiting threads"} {"!stacks"}
		{"Critical system queues"} {"!exqueue f"}
		{"I/O"} {"!irpfind"}
		{"The list of all thread stack traces"} {"!process 0 ff"}
		{"Critical sections for current process"} {"!ntsdexts.locks"}
		{"Sessions"} {"!session"}
		{"Processes"} {"!process 0 0"}
		{"Running threads"} {"!running"}
		{"Ready threads"} {"!ready"}
		{"DPC queues"} {"!dpcs"}
		{"The list of APCs"} {"!apc"}
		{"Internal queued spinlocks"} {"!qlocks"}
		{"Computer name"} {"dS srv!srvcomputername"}
		{"Switch to processor"}
			{"#0"} {"~0s"}
			{"#1"} {"~1s"}
			{"#2"} {"~2s"}
			{"#3"} {"~3s"}
			{"#4"} {"~4s"}
			{"#5"} {"~5s"}
			{"#6"} {"~6s"}
			{"#7"} {"~7s"}
	{"BSOD"}
		{"Default analysis"} {"!analyze -v"}
		{"Processes and virtual memory"} {"!vm 4"}
		{"Bugcheck callback data (prior to Windows XP SP1)"} {"!bugdump"}
		{"Bugcheck secondary callback data"} {".enumtag"}
		{"Computer name"} {"dS srv!srvcomputername"}

#T=集成 windows 上下文菜单 .reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\.dmp]
@="Debugger.Dump"

[HKEY_CLASSES_ROOT\Debugger.Dump]

[HKEY_CLASSES_ROOT\Debugger.Dump\DefaultIcon]
@="c:\\debuggers\\cdb.exe"

[HKEY_CLASSES_ROOT\Debugger.Dump\Shell]

[HKEY_CLASSES_ROOT\Debugger.Dump\Shell\Debug_Without_Remote]
@="Debug This Dump"

[HKEY_CLASSES_ROOT\Debugger.Dump\Shell\Debug_Without_Remote\Command]
@="\"C:\\debuggers\\windbg\" -z \"%1\" -c \"$<c:\\debuggers\\commands.txt\""

[HKEY_CLASSES_ROOT\Debugger.Dump\Shell\Debug_With_Remote70]
@="Debug this Dump With Remote:70"

[HKEY_CLASSES_ROOT\Debugger.Dump\Shell\Debug_With_Remote70\Command]
@="\"C:\\debuggers\\windbg\" -server tcp:port=70 -z \"%1\" -c \"$<c:\\debuggers\\commands.txt\""
#T=WinDbg 笔记
http://blog.csdn.net/iaki2008/article/details/8984744

基本命令
    ~*e!clrstack
      查看所有持有和等待锁的线程（的下一条要执行的代码）
    k
      观察非托管堆栈
lm -f
      显示已经载入的模块及其完整路径
  元命令
.hh <命令名>
      打开帮助文档，并显示其命令的文档索引
.logopen /t/u <日志文件路径>
      创建日志文件，将在windbg所有的输出同时写入此文件
.chain
      显示已经载入的扩展模块与扩展模块搜索路径链
.loadby <要加载的模块名> <已经加载的模块名>
      .Net 3.5版本及以下：.loadby sos mscorwks
      .Net 4.0：.loadby sos clr
      silverlight：.loadby sos coreclr
    .dump /ma <full dmp文件路径>
    .unload 
    .unloadall
    .help
    .time
      看进程运行了多长时间
    vertarget
      查看操作系统的信息

sos.dll扩展模块命令
!help
!dumpstackobjects
    显示当前堆栈上的所有对象
    !threadpool
    查看线程池的运行情况
    !runaway
    查看线程运行了多长时间
!gchandles
   查看gc handle的统计情况
    ~<线程序号> s
    切换到指定线程
    !clrstack
    显示当前线程的托管堆栈（能显示其代码行），使用p参数显示传入参数，使用l参数显示局部变量，使用a参数显示两者
    !dumpstack
    同时显示托管堆栈与非托管堆栈
!DumpVC <MethodTable address> <address>
    显示指定类实例的指定成员的值
    !eeheap -gc
      查看托管堆的总信息
    !dumpheap -min 200 -stat
      获取占用堆内存的各对象的统计信息
    !dumpheap -type Byte[] -min 200
      查看各Byte数组占用堆内存的详细信息
    !dumpheap -mt <MethodTable地址>
      显示托管堆中指定的MethodTable结构的那些对象的信息
    !gcroot <对象地址>
      看对象引用关系
    !do <对象地址> 
      查看对象的详细信息
    !da <对象地址>
      获取数据对象的详细信息
    !dso (DumpStackObjects)
      查看当前堆栈的所有对象
!objsize
      查看对象的大小
!FinalizeQueue
      查看终结对象队列      
    !analyze -v
      分析挂掉线程的详细情形，错误原因
    !threads
      看所有的线程统计情况，包括崩溃后各线程抛出的异常
    !syncblk
      查看哪些线程拿到了锁
    !pe
      获取当前堆栈抛出的异常信息
    !pe <异常类型的对象的地址>
      格式化打印输出指定Exception对象的信息
!eestack -short -ee
     显示所有感兴趣的（持有锁的、被劫持以执行一个垃圾收集操作、正在托管代码中执行）托管线程的堆栈

psscor.dll扩展模块命令
可从DebugDiag的安装目录获取psscor2.dll、psscor4.dll
  !printDateTime
  !convertVTDateToDate
  !convertTicksToDate
  !printIPAdress
  !dumpXmlDocument
  !dumpCollection
  !dumpThreadConfig
  !dumpField
    获取类的字段值
  !dumpDataTables
    获取所有DataTable实例
  !dumpColumnNames
    获取指定DataTable的所有列名
  !aspxpages
  !dumpASPNETCache
  !dumpHttpRuntime
  !dumpRequestQueues
  !dumpRequestTable
  !dumpHistoryTable
  !dumpBuckets
  !GetWorkItems
解决mscordacwks.dll版本错误的问题
使用.cordll命令查看需要的版本
在本地建目录A，并将其路径加入windbg的符号搜索目录路径链的链首
从运行调试目标应用程序的机器上拷贝正确版本的mscordacwks.dll至目录A，若是要用sos.dll那也拷贝过来
使用.cordll -ve -u -l重新载入


备注
    若表现为界面死掉，就直接找UI线程（STA线程就一个）
    堆栈分为本地堆栈与托管堆栈，线程号也有本地线程号与托管线程号
    在64位的winodws上使用任务管理器获取的dmp为64位，即使跑的是32位的应用程序，所以得使用windbg、adplus、debugdiag获取
    32位应用程序的dmp使用32位的windbg进行分析，64位应用程序的dmp使用64位的windbg
    符号文件路径：C:\Users\Administrator\Desktop\ConsoleApplication1t;SRV*C:\symbolscache*http://msdl.microsoft.com/download/symbols
    使用VS分析.dmp文件时，注意另创建系统符号文件缓存目录，否则下载过来的符号文件默认存储在临时目录可能会被删除。
    使用!Threads可查看所有线程以及其类型，除了手动创建Thread的类型为MTA外，使用ThreadPool，Timer，Task创建的线程的类型皆为（Threadpool Worker）

参考
  PSSCor2: Object Inspection Commands, Part 1
  http://blogs.microsoft.co.il/blogs/sasha/archive/2010/08/23/psscor2-object-inspection-commands-part-1.aspx
  PSSCor2: Object Inspection Commands, Part 2
  http://blogs.microsoft.co.il/blogs/sasha/archive/2010/08/23/psscor2-object-inspection-commands-part-2.aspx
  Debugging Tools for Windows: The psscor2 Managed Code Debugger Extension
  http://www.informit.com/articles/article.aspx?p=1583958
  SOS.dll（SOS 调试扩展）
  http://msdn.microsoft.com/zh-cn/library/vstudio/bb190764(v=vs.100).aspx
  SOS.dll (SOS Debugging Extension)
  http://msdn.microsoft.com/en-us/library/vstudio/bb190764(v=vs.1
  如何使用Windbg等工具来诊断调试.NET程序
  http://focus.it168.com/200809/msteched2008/ppt/PPT/DEV401.pdf
#T=常用命令
.load C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\sos.dll  //加载调试模块
.load C:\Windows\Microsoft.NET\Framework\v4.0.30319\SOS.dll
ld TestClass //加载调试符号
!name2ee TestClass.exe TestClass.Program.test  //显示test方法相关的地址
!dumpmt -md 00976d48         //得到类的成员函数详细信息
!dumpil 00973028    // 显示这个方法被编译器编译之后的IL代码
!dumpheap -stat  //该命令显示程序中所有对象的统计信息，显示的大小是对象本身的大小，不包括对象里面值的大小
!dumpheap -mt 790fcb30  //该命令显示MethodTable 790fcb30的详细信息
!gcroot 012919b8  //来显示一个实例的所属关系
!dumpobj(do) 012a3904 //显示一个对象的具体内容，看对象里面有什么，值是什么
!ObjSize 012a1ba4 //对象实际在内存中的大小
!eeheap -gc   //查看托管堆的情况(包括大小)
!DumpArray   //查看数组信息



windbg, sos, 等常用命令
2010-01-30 18:06
1. adplus

这个脚本工具是和debugger tools一起安装的。可以自动的帮你监视某个程序，并在你设定的条件下生成一个dump文件保存在debugger目录下。使用这些工具时，都需要将命令提示符窗口切到debugger目录。常见的用法如下：

adplus  -hang -pn w3wp.exe    
在生成hang状态下的dump时，adplus都会立即产生dump文件。在输入此命令并按enter后，此命令将立即获取一个w3wp.exe的内存切片。但是此命令会弹出一个确认窗口，如果你觉得这个比较麻烦的话，你可以在最后加上 –quiet 命令来避免窗口的弹出。

adplus -hang -p 1234 –quiet  
相信你很快就能发现，上行命令是使用的process name，而这个命令是使用的process id。同时，它可以直接生成dump，不会弹出确认窗口。

adplus -crash -pn w3wp.exe    
此命令是获取程序crash时的dump。它不同于hang立即得到dump，它会一直attach在w3wp.exe程序上，直到w3wp.exe程序crash。其它类似参数的效果都同上。

当然，如果你使用Vista的话，你可以很方便的在任务管理器(task manager)中通过右键 Create dump file获取dump文件。

 

2.  tinyget

这个工具是用来对一个网站进行压力测试的。最常用的命令是：

tinyget -srv:localhost -uri:/BuggyBits/FeaturedProducts.aspx -threads:30 -loop:50  
该命令表示同时启动30个线程发送50个请求到本地IIS上BuggyBits站点的FeaturedProducts页面。你也可以在命令窗口中使用”tinyget /?”查看更多详细的命令。

 

3.  windbg

Windbg的命令都是一点号(.)来开始的，它不同于叹号开始的命令(!)，叹号开始的命令都是sos.dll中的命令。

.load sos 
每次打开windbg调试.net程序的dump时，我们首先要输入此命令。它的用途是使得windbg可以支持托管代码(managed code)的调试。

.time  
查看dump文件生成时的时间，其中包括系统当前时间，开机总时间，程序运行总时间，程序运行在内核态总时间以及用户态总时间。

 

4. sos.dll

最强大的功能还要数sos.dll中的命令，它是我们调试.net程序的基础。下面介绍一些基本命令：

!help 
它用来查看每个命令的用法。如!help !threads，用来查看!threads 命令的具体用法。如果直接使用!help，它将列出sos的基本信息。

!threadpool
通过这个命令，我们可以很容易的看出在dump文件生成时的确切CPU使用率，同时，我们也可以看到队列中等待的work requests，timers以及completion port threads等信息。Timers，work requests以及completion port threads都是CLR的线程种类，在以后的文章中我会详细介绍。

!runaway
它是用来罗列所有正在运行的线程以及它们的CPU占用率。通过这个命令，我们可以很容易的去trouble shooting一些CPU占用率过高的问题。

!threads 
它是用来罗列所有正在运行的托管(managed)线程的详细信息，如CLR线程所在的appdomain等等。如果线程的ID显示XXXX，说明这个线程已经结束，等待被回收。

~[id]s 
此命令用来切换到某一特定线程。如 ~20s 代表切换到ID为20的线程。

!clrstack 
此命令用来显示此线程的managed code 的callstack。我们可以加上-p参数来得到更加详细的信息。

!dumpobject(!do) 
通过这个命令，我们可以查看某个特定address的object信息。如果这个address指向一个string，我们就可以看到这个string内存储了什么值。

!dumpstackobjects(!dso)  
此命令用来查看被当前线程堆栈引用的所有托管对象。

!dumparray(!da) 
当我们查看线程堆栈上的object时，我们可以使用!do命令。但是如果该object是一个array的话，!do只能得到array本身的信息，并非其存储的内容。此时!da就发挥了用场。

!objsize 
如果我们想查看一个object的total size的时候，我们需要使用!objsize命令。比如当我们!da一个array时，它显示的size仅仅是包含的type的size，并非实际的size。我们可以使用!objsize address来查看这个array的实际size。

!dumpheap 
它是用来查看堆上所有的object。通常我们加上 –stat参数来帮我们做个归类，否则它会罗列出许多繁杂的信息。同时，它还有几个比较常用的参数，如-type，-mt。-type用来列出某一特定类型的所有object，如!dumpheap –type System.String将列出堆上所有的string。-mt是用来列出某一特定MethodTable的所有object。大家知道，每一个引用类型都对应一个MethodTable，假设System.String类型的MethodTable是02c39310，那么我们还可以通过!dumpheap –mt 02c39310来找到堆上所有的string。
#
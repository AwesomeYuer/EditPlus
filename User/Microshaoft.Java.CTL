#TITLE=01.Microshaoft.Java
#INFO
New Cliptext library
#SORT=n

#T=一些java的基础知识
前言
（原标题好像有些问题，我想说的是本文不是什么实际项目中一定会应用的知识，知识基础概念问题，）关于java的基础知识，只是在大二初学时看得多些，今天看了看张孝祥老师的视频，突然发现自己根本不了解Java很多东西，有些是忘了，而有些以前根本不知道，拿来分享一下，这些你曾注意吗？（牛人就不要往下看了）
 
1.“&”和“&&”的区别分析
“&”和“&&”的区别在于，如果使用前者连接，那么无论任何情况，“&”两边的表达式都会参与计算。如果使用后者连接，当“&&”的左边为false，则将不会计算其右边的表达式。“|”和“||”的区别与“&”和“&&”的区别一样。 
public class TestAnd 
{ 
   public static void main(String[] args) 
   { 
       int x=0; 
       int y=3; 
       if(x!=0 && y==y/x) 
          System.out.println("y = "+y); 
   } 
}

 
上面例子中，由于while语句的判断条件中的第一个布尔表达式是不成立的，程序就不会判断第二个布尔表达式的值，这就是“短路”。如果两个表达式之间用“&”来连接，如果正好碰到上面所示的特殊情况，程序运行时就会出错 
2.浮点数在内存中的表示
这个在计算机原理和操作系统中看见的比较多，很基础的，例如分析0x50000000所对应的浮点数

 
2.“>>”和“>>>”是啥玩意
前者是位移运算的右移，这个不难，那后面的又是什么，区别在哪里？
任何信息在计算机中都是以二进制的形式保存的，&,|,^除了可以作为逻辑运算符，也可以做为位算符，它们对两个操作数中的每一个二进制位都进行运算。 
只有参加运算的两位都为1，&运算的结果才为1，否则就为0。 
只有参加运算的两位都为0，|运算的结果才为0，否则就为1。 


 
 
 
只有参加运算的两位不同，^运算的结果才为1，否则就为0。
我们可以对数据按二进制位进行移位操作，java的移位运算符有三种： 
<<  左移 
>>  右移 
>>> 无符号右移
public class ShiftTest 
{ 
　　public static void main(String [] args) 
　　{ 
       int x=0x80000000; 
       int y=0x80000000; 
　　　　x=x>>1; 
　　　　y=y>>>1; 
　　　　System.out.println(“0x80000000>>1 = ” + Integer.toHexString(x)); 
　　　　System.out.println(“0x80000000>>>1 = ” + Integer.toHexString(y)); 
　　} 
} 
运行结果如下： 
0x80000000>>1 = c0000000 
0x80000000>>>1 = 40000000
十六进制与二进的对比 
    0x80000000 =1000,0000, 0000, 0000, 0000, 0000, 0000, 0000 
    0xc0000000 =1100,0000, 0000, 0000, 0000, 0000, 0000, 0000 
    0x40000000 =0100,0000, 0000, 0000, 0000, 0000, 0000, 0000
3.Java中多维数组是不不是规则矩阵形式？
解释：java 中并没有真正的多维数组，只有数组的数组， Java中多维数组不一定是规则矩阵形式。比如下面两个数组：

 
下面还有两个思考题，不难但是你能否毫不犹豫的说出答案？
思考题1：
某个培训中心要为新到的学员安排房间，假设共有x个学员，每个房间可以住6人，让你用一个公式来计算他们要住的房间数？ 
答案：(x+5)/6。这种算法还可用在查看留言板的分页显示上： 其中x是总共的留言数，6是每页显示的留言数，结果就是总共有多少页。 
思考题2：
假设你要让x的值在0至9之间循环变化，请写出相应的程序代码。 
答案：
int x=0; 
while(true) 
{ 
　　x = (x+1)%10; 
}

#T=Java Remoting远程服务（上）
Java Remoting远程服务（上）
作者 李湃 发布于 2012年1月2日
领域 语言 & 开发 主题 Java , 语言 , 代码复查 , 编程
分享到         
今天我们来聊聊Java远程服务的解决方案。Java分布式远程服务的解决方案，近几年在互联网应用越来越普及。我们简单分析下，形成这种格局的背景。

相关厂商内容

Visual Studio 11 Beta 和 .NET Framework 4.5 Beta版免费下载中！
从无到有开发一个产品的时候，如果技术框架没有积累，那么代码的实现会比较随意，很多时候前端web层耦合了很多后端DAL层的代码。接下来，随着产品越来越多，每个产品的技术实现都会有很多重复代码。这就给后期的维护和升级带来了不便（比如针对某个服务做缓存优化或者日志处理，代价会非常高）。服务模块化呼之欲出！

服务模块化，就意味着代码的实现架构不再是Web层与DAL层的简单关系了。很多相似的业务会抽象为一个分布式服务，Java语言支持多种远程服务的实现，像EJB、 WebService、 RMI、Hessian等等。下面我们通过一个具体的例子来简述这些技术的使用以及在实践中如何权衡各种技术的适用场景。

用例：提供一个分布式的动物中心服务，提供猴子的名字。

1. RMI
RMI是Java提供的分布式应用API，远程方法调用RPC的实现。它的宗旨是，某个JVM下的对象可以调用其他JVM下的远程对象。RMI的底层实现是构建于TCP协议之上，将远程对象绑定具体的端口号，监听客户端的请求；客户端与远程对象的通信当中，依赖于预定义的接口，即RMI会生成一个本地Stub代理类，每次客户端调用远程对象的时候，Stub代理类会初始化参数、启动远程连接、将参数进行编组(marshal)，通过网络传输送往服务器端，并对返回的结果进行反编组(unmarshal)。对于客户端调用方来讲，RMI隐藏了对象序列化和网络传输的实现细节。



图一：RMI的调用机制[1]

图一描述了RMI调用的大体步骤：首先RMI Server会通过请求RMIRegistry(远程对象联机注册服务)绑定一个远程对象，对象的元数据信息放在一个已有的Web Server上面；然后RMI Client会发送请求到RMIRegistry获取远程对象的地址，并远程调用该对象的方法。

下面我们使用RMI来实现之前所描述的用例。

接口类IAnimalService.java
import java.rmi.Remote;
import java.rmi.RemoteException;
public interface IAnimalService extends Remote {
    String getMonkeyName() throws RemoteException;
}
实现类AnimalServiceImp.java
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
public class AnimalServiceImp implements IAnimalService {
    public AnimalServiceImp() {
    }

    @Override
    public String getMonkeyName() throws RemoteException {
        return "I'm Jacky";
    }
}
服务端AnimalServer.java
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
try {
    final int port = 8009; //绑定的端口号
    final String host = "127.0.0.1"; //本机作为服务host
    final String serviceName = "animalService"; //服务名称
    IAnimalService obj = new AnimalServiceImp();
    IAnimalService stub = (IAnimalService) UnicastRemoteObject.exportObject(obj, port); //端口绑定远程对象
    Registry registry = LocateRegistry.getRegistry();
    registry.unbind(serviceName);
    registry.bind(serviceName, stub); //注册服务地址
    System.out.println("Server Start...");
} catch (Exception e) {
    System.err.println("Server exception: " + e.toString());
    e.printStackTrace();
}
客户端Client.java
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
Registry registry = null;
final String host = "127.0.0.1";
final String serviceName = "animalService"; //服务名称
try {
    registry = LocateRegistry.getRegistry(host); //获取远程对象联机注册
    //获取动态代理类
    IAnimalService stub = (IAnimalService) registry.lookup(serviceName);
    //远程调用
    String name = stub.getMonkeyName();
    System.out.println("monkey name: " + name);
} catch (Exception e) {
    e.printStackTrace();
}
部署RMI：编译上述代码、启动RMIRegistry、运行服务端的代码(AnimalServer.java)


客户端调用RMI：运行客户端代码(Client.java)


使用RMI的利弊：

优势：面向对象的远程服务模型；基于TCP协议上的服务，执行速度快。
劣势：不能跨语言；每个远程对象都要绑定端口，不易维护；不支持分布式事务JTA
早在Applet时期，Applet+RMI是Java业内广泛推崇的方式来实现分布式计算。笔者认为RMI框架对于安全性、事务、可扩展性的支持非常有限，进而限制了其发展。

2. EJB
EJB是之前Sun公司推出的基于面向对象的服务器端组件模型。它旨在成为一个可移植的、可扩展的、事务处理的、带有安全策略的分布式解决方案。



图二：EJB在J2EE解决方案中的角色[2]

EJB的核心有三个部分：会话Bean、实体Bean、消息Bean。EJB3.0对组件模型做了很多简化，降低了开发以及配置的复杂度。本节讨论的都已EJB3.0为准。



图三：EJB3.0架构图[3]

如图三描述的那样会话Bean主要负责将业务逻辑抽象出来，会话Bean分为有状态Bean和无状态Bean，有状态Bean记录客户端的信息，无状态Bean反之。实体Bean负责持久层ORMapping的工作，EJB3.0对实体Bean做了很大的调整，提供了持久化API(JPA)，简化了开发和配置。消息Bean主要用来处理JMS中间件接受的客户端消息，即JMS队列的消费者，本质上它是一个异步的无状态会话Bean。

对于本文的用例来说，最适合使用无状态的会话Bean，下面我们来看下具体的实现。

接口类AnimalBeanLocal.java
import javax.ejb.Remote;
@Remote
public interface AnimalBeanLocal {
    String getMonkeyName();
}
无状态会话Bean AnimalBean.java
import javax.ejb.Stateless;
/**
* Session Bean implementation class AnimalBean
*/
@Stateless
public class AnimalBean implements AnimalBeanLocal {
    /**
    * Default constructor.
    */
    public AnimalBean() {
    }
    public String getMonkeyName() {
        return "I'm Jacky";
    }
}
客户端Client.java
import javax.naming.InitialContext;
//经由JNDI命明和目录服务获取EJB
Properties props = new Properties();
props.setProperty("java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory");
props.setProperty("java.naming.provider.url", "localhost:1099");
props.setProperty("java.naming.factory.url.pkgs", "org.jboss.naming");
try {
    InitialContext ctx = new InitialContext(props);
    AnimalBeanLocal proxy;
    proxy = (AnimalBeanLocal) ctx.lookup("AnimalBean/remote");
    System.out.println(helloworld.getMonkeyName());
} catch (Exception e) {
    e.printStackTrace();
}
部署EJB：启动JBOSS，并将EJB组件注册进JNDI服务


客户端调用EJB：运行客户端代码


使用EJB的利弊：

优势：可扩展性好，安全性强，支持分布式事务处理。
劣势：不能跨语言；配置相对复杂，不同J2EE容器之间很难做无缝迁移。
EJB是被诟病最多的分布式解决方案，主要原因是EJB配置复杂而且不同容器迁移起来困难。尽管EJB3.0做了很多的简化，配置起来还是相对笨重。对于学习曲线如此陡峭的技术来说，并不是企业放心采用的解决方案。

3. Web Service
Web Service是一组分布式应用模型的规范， 它定义了网络传输协议和访问服务的数据格式。该模型隐藏了技术的实现细节，旨在提供松散耦合、跨平台、跨语言的服务组件。



图四：Web Service架构图[4]

图四描述了SOAP协议实现的Web Service模型(本节讨论都以SOAP协议实现为准)，首先客户端通过UDDI(发现整合平台)找到对应的Web Service，下载对应WSDL文件，生成本地代理类，继而请求Web Service服务。UDDI的概念一直被弱化，因为客户端一般都知道Web Service的地址。

接下来我们使用Web Service来实现本文的用例。本节使用的Web Service第三方库是CXF(http://cxf.apache.org/)，规范使用的是JAX-WS。

接口类IAnimalService.java
import javax.jws.WebService;
@WebService
public interface IAnimalService {
    public String getMonkeyName();
}
实现类AnimalServiceImp.java
import javax.jws.WebService;
@WebService(endpointInterface = "IAnimalService", serviceName = "AnimalService")
public class AnimalServiceImp implements IAnimalService {
    @Override
    public String getMonkeyName() {
        return "I'm Jacky";
    }
}
服务端Server.java
import javax.xml.ws.Endpoint;
IAnimalService serviceInstance = new AnimalServiceImp();
final String address = "http://localhost:9000/animalService"; //服务名称
Endpoint.publish(address, serviceInstance); //绑定并发布服务


客户端Client.java(无需手动下载WSDL文件，动态调用Web Service)
import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
factory.getInInterceptors().add(new LoggingInInterceptor()); //日志输入拦截器
factory.getOutInterceptors().add(new LoggingOutInterceptor()); //日志输出拦截器
factory.setServiceClass(IAnimalService.class);
factory.setAddress("http://localhost:9000/animalService");
IAnimalService client = (IAnimalService) factory.create();
System.out.println(client.getMonkeyName());


使用Web Service的利弊：

优势：跨语言、跨平台，SOA思想的实现；安全性高；可以用来兼容legacy系统的功能
劣势：性能相对差，不支持两阶段事务
Web Service使用的范围非常广，比如SalesForces(http:// www.salesforce.com)，世界上最大的在线CRM提供商， 它的产品卖给使用不同技术平台的企业(.Net， Java， Ruby)，SalesForces云计算的数据接口是以Web Service的方式发布的[8]；Web Service另一个适用场景是，企业很多时候会有新老系统做数据交互，而新老系统使用的技术平台不一致，Web Service是个不错的选择。

引用
[1] http://www.tcs.uj.edu.pl/~krawczyk/programowanie_w_sieci_internet/wyklad/wyklad5-rmi/rmi/slajd1.html

[2] http://www.ibm.com/developerworks/cn/websphere/library/bestpractices/enterprise_javabean.html

[3] http://publib.boulder.ibm.com/infocenter/radhelp/v7r5/topic/com.ibm.jee5.doc/topics/cejb3vejb21.html

[4] http://www.emeraldinsight.com/journals.htm?articleid=862014&show=abstract

作者简介
李湃，上海交通大学计算机硕士毕业，5年互联网的行业经验，现就职于国内某互联网公司，喜欢开源技术，对于Java企业架构、分布式技术、高性能高可靠软件设计有极大的热情，希望能对国内社区有所贡献。博客地址：http://haperkelu2011.iteye.com/
#T=Java CodeReview CheckList
Code Review Check List
For Java Language
Project ID:		Work product:	
Checked By:		Date :	
Note:	
			
	I - DEVIATION OBJECTIVE
#		I.1 – DEVIATION	Yes	No	NA
1.		Does the code correctly implement the design?	0
0
0
2.		Does the code implement more than the design?	0
0
0
3.		Is every parameter of every method passing mechanism (value or reference) appropriate?	0
0
0
4.		Does every method return the correct value at every method return point?	0
0
0
	II – OMISSION OBJECTIVE
#		II.1 –OMISSION	Yes	No	NA
5.		Does the code completely implement the design?	0
0
0
6.		Are there any requirements of design that were not implemented?	0
0
0
	III - DEFECT OBJECTIVE
#		III.1 – Variable and Constant Declaration 	Yes	No	NA
7.		Are descriptive variable and constant names used in accord with naming conventions?	0
0
0
8.		Is every variable correctly typed?	0
0
0
9.		Is every variable properly initialized?	0
0
0
10.		Are all for-loop control variables declared in the loop header?	0
0
0
11.		Are there variables that should be constants?	0
0
0
12.		Are there attributes that should be local variables?	0
0
0
13.		Do all attributes have appropriate access modifiers (private, protected, public)?	0
0
0
14.		Are there static attributes that should be non-static or vice-versa?	0
0
0
#		III.2 – Method Definition	Yes	No	NA
15.		Are descriptive method names used in accord with naming conventions?	0
0
0
16.		Do all methods have appropriate access modifiers (private, protected, public)?	0
0
0
17.		Is every method parameter value checked before being used?	0
0
0
18.		Are there static methods that should be non-static or vice-versa?	0
0
0
#		III.3 – Class Definition	Yes	No	NA
19.		Does each class have an appropriate constructor? 	0
0
0
20.		Do any subclasses have common members that should be in the superclass?	0
0
0
21.		Can the class inheritance hierarchy be simplified?	0
0
0
#		III.4 – Data Reference	Yes	No	NA
22.		For every array reference: Is each subscript value within the defined bounds?	0
0
0
23.		For every object or array reference: Is the value certain to be non-null? 	0
0
0
#		III.5 – Computation/Numeric	Yes	No	NA
24.		Are there any computations with mixed data types?	0
0
0
25.		Is overflow or underflow possible during a computation?	0
0
0
26.		For each expressions with more than one operator: Are the assumptions about order of evaluation and precedence correct?	0
0
0
27.		Are parentheses used to avoid ambiguity?	0
0
0
28.		Does the code systematically prevent rounding errors?	0
0
0
29.		Does the code avoid additions and subtractions on numbers with greatly different magnitudes?	0
0
0
30.		Are divisors tested for zero or noise?	0
0
0
#		III.6 – Comparison/Relational	Yes	No	NA
31.		Has each boolean expression been simplified by driving negations inward?	0
0
0
32.		For every boolean test: Is the correct condition checked?	0
0
0
33.		Are there any comparisons between variables of inconsistent types? 	0
0
0
34.		Are the comparison operators correct?	0
0
0
35.		Is each boolean expression correct?	0
0
0
36.		Are there improper and unnoticed side-effects of a comparison? 	0
0
0
37.		Has an "&" inadvertently been interchanged with a "&&" or a "|" for a "||"?	0
0
0
38.		Does the code avoid comparing floating-point numbers for equality?	0
0
0
39.		Is every three-way branch (less,equal,greater) covered?	0
0
0
#		III.7 – Control Flow	Yes	No	NA
40.		For each loop: Is the best choice of looping constructs used?	0
0
0
41.		Will all loops terminate?	0
0
0
42.		When there are multiple exits from a loop, is each exit necessary and handled properly?	0
0
0
43.		Does each switch statement have a default case?	0
0
0
44.		Are missing switch case break statements correct and marked with a comment?	0
0
0
45.		Is the nesting of loops and branches too deep, and is it correct?	0
0
0
46.		Can any nested if statements be converted into a switch statement?	0
0
0
47.		Are null bodied control structures correct and marked with braces or comments?	0
0
0
48.		Does every method terminate?	0
0
0
49.		Are all exceptions handled appropriately?	0
0
0
50.		Do named break statements send control to the right place?	0
0
0
#		III.8 – Input/Output	Yes	No	NA
51.		Have all files been opened before use?	0
0
0
52.		Are the attributes of the open statement consistent with the use of the file?	0
0
0
53.		Have all files been closed after use?	0
0
0
54.		Is buffered data flushed?	0
0
0
55.		Are there spelling or grammatical errors in any text printed or displayed?	0
0
0
56.		Are error conditions checked?	0
0
0
57.		Are files checked for existence before attempting to access them?	0
0
0
58.		Are all I/O exceptions handled in a reasonable way?	0
0
0
#		III.9 – Module Interface	Yes	No	NA
59.		Are the number, order, types, and values of parameters in every method call in agreement with the called method's declaration?	0
0
0
60.		Do the values in units agree (e.g., inches versus yards)?	0
0
0
61.		If an object or array is passed, does it get changed, and changed correctly by the called method?	0
0
0
#		III.10 – Comment	Yes	No	NA
62.		Does every method, class, and file have an appropriate header comment?	0
0
0
63.		Does every attribute,variable or constant declaration have a comment?	0
0
0
64.		Is the underlying behavior of each method and class expressed in plain language?	0
0
0
65.		Is the header comment for each method and class consistent with the behavior of the method or class?	0
0
0
66.		Are all comments consistent with the code?	0
0
0
67.		Do the comments help in understanding the code?	0
0
0
68.		Are there enough comments in the code?	0
0
0
69.		Are there too many comments in the code?	0
0
0
#		III.11 – Layout and Packing	Yes	No	NA
70.		Is a standard indentation and layout format used consistently?	0
0
0
71.		For each method: Is it no more than about 60 lines long?	0
0
0
72.		For each compile module: Is no more than about 600 lines long?	0
0
0
#		III.12 – Modularity	Yes	No	NA
73.		Is there a low level of coupling between modules (methods and classes)?	0
0
0
74.		Is there a high level of cohesion within each module (methods or class)?	0
0
0
75.		Is there repetitive code that could be replaced by a call to a method that provides the behavior of the repetitive code?	0
0
0
76.		Are the Java class libraries used where and when appropriate?	0
0
0
#		III.13 – Storage Usage	Yes	No	NA
77.		Are arrays large enough?	0
0
0
78.		Are object and array references set to null once the object or array is no longer needed?	0
0
0
#		III.14 – Performance	Yes	No	NA
79.		Can better data structures or more efficient algorithms be used?	0
0
0
80.		Are logical tests arranged such that the often successful and inexpensive tests precede the more pensive and less frequently successful tests?	0
0
0
81.		Can the cost of recomputing a value be reduced by computing it once and storing the results?	0
0
0
82.		Is every result that is computed and stored actually used?	0
0
0
83.		Can a computation be moved outside a loop?	0
0
0
84.		Are there tests within a loop that do not need to be done?	0
0
0
85.		Can a short loop be unrolled?	0
0
0
86.		Are there two loops operating on the same data that can be combined into one?	0
0
0
87.		Are frequently used variables declared register?	0
0
0
88.		Are short and commonly called methods declared inline?	0
0
0
89.		Are timeouts or error traps used for external device accesses?	0
0
0
	IV - INCONSISTENCY OBJECTIVE
#		IV.1 –  Performance 	Yes	No	NA
90.		Are there any code implement in inconsistent way?	0
0
0
	V – AMBIGUITY OBJECTIVE
#		V.1 –  Variable and Constant Declaration	Yes	No	NA
91.		Are there variables with confusingly similar names?	0
0
0
92.		Are all variables properly defined with meaningful, consistent, and clear names?	0
0
0
#		V.2 –  Performance 	Yes	No	NA
93.			Are any modules excessively complex and should be restructured or split into multiple routines?	0
0
0
	VI – REDUNDANCE OBJECTIVE
#		VI.1 –  Variables 	Yes	No	NA
94.		Are there any redundant or unused variables or attributes?	0
0
0
95.		Could any non-local variables be made local?	0
0
0
#		VI.2 –  Method Definition 	Yes	No	NA
96.		Are there any uncalled or unneeded methods?	0
0
0
#		VI.3 –  Performance 	Yes	No	NA
97.			Can any code be replaced by calls to external reusable objects?	0
0
0
98.		Are there any blocks of repeated code that could be condensed into a single method?	0
0
0
99.			Are there any leftover stubs or test routines in the code?	0
0
0
	VII – SIDE-EFFECT OBJECTIVE
#		VII.1 –  Method Definition	Yes	No	NA
100.		After changing of prototype of method, Have class which calls it considered yet?	0
0
0
#		VII.2 –  Data Base	Yes	No	NA
101.		Do Upgrading and Migration process follow up changing of structures or contents of a project’s data base?	0
0
0


#T=Java编程提高性能时需注意的地方
Java编程提高性能时需注意的地方 
最近的机器内存又爆满了，出了新增机器内存外，还应该好好review一下我们的代码，有很多代码编写过于随意化，这些不好的习惯或对程序语言的不了解是应该好好打压打压了。
下面是参考网络资源和总结一些在java编程中尽可能做到的一些地方
1.尽量在合适的场合使用单例
使用单例可以减轻加载的负担，缩短加载的时间，提高加载的效率，但并不是所有地方都适用于单例，简单来说，单例主要适用于以下三个方面
第一，控制资源的使用，通过线程同步来控制资源的并发访问
第二，控制实例的产生，以达到节约资源的目的
第三，控制数据共享，在不建立直接关联的条件下，让多个不相关的进程或线程之间实现通信
2.尽量避免随意使用静态变量
要知道，当某个对象被定义为stataic变量所引用，那么gc通常是不会回收这个对象所占有的内存，如
1
2
3
public class A{
 static B b = new B();
 }
此时静态变量b的生命周期与A类同步，如果A类不会卸载，那么b对象会常驻内存，直到程序终止。
3.尽量避免过多过常的创建java对象
尽量避免在经常调用的方法，循环中new对象，由于系统不仅要花费时间来创建对象，而且还要花时间对这些对象进行垃圾回收和处理，在我们可以控制的范围内，最大限度的重用对象，最好能用基本的数据类型或数组来替代对象。
4.尽量使用final修饰符
带 有final修饰符的类是不可派生的。在Java核心API中，有许多应用final的例子，例如java.lang.String。为String类指 定final防止了使用者覆盖length()方法。另外，如果一个类是final的，则该类所有方法都是final的。java编译器会寻找机会内联 (inline)所有的final方法(这和具体的编译器实现有关)。此举能够使性能平均提高50%。
5.尽量使用局部变量
调用方法时传递的参数以及在调用中创建的临时变量都保存在栈(Stack)中，速度较快。其他变量，如静态变量，实例变量等，都在堆(Heap)中创建，速度较慢。
6.尽量处理好包装类型和基本类型两者的使用场所
虽然包装类型和基本类型在使用过程中是可以相互转换，但它们两者所产生的内存区域是完全不同的，基本类型数据产生和处理都在栈中处理，包装类型是对象，是在堆中产生实例。
在集合类对象，有对象方面需要的处理适用包装类型，其他的处理提倡使用基本类型。

 
7.慎用synchronized，尽量减小synchronize的方法
都 知道，实现同步是要很大的系统开销作为代价的，甚至可能造成死锁，所以尽量避免无谓的同步控制。synchronize方法被调用时，直接会把当前对象锁 了，在方法执行完之前其他线程无法调用当前对象的其他方法。所以synchronize的方法尽量小，并且应尽量使用方法同步代替代码块同步。
8.尽量使用StringBuilder和StringBuffer进行字符串连接
这个就不多讲了
9.尽量不要使用finalize方法
实际上，将资源清理放在finalize方法中完成是非常不好的选择，由于GC的工作量很大，尤其是回收Young代内存时，大都会引起应用程序暂停，所以再选择使用finalize方法进行资源清理，会导致GC负担更大，程序运行效率更差。
10.尽量使用基本数据类型代替对象
1
String str = "hello";
上面这种方式会创建一个“hello”字符串，而且JVM的字符缓存池还会缓存这个字符串；
1
String str = new String("hello");
此时程序除创建字符串外，str所引用的String对象底层还包含一个char[]数组，这个char[]数组依次存放了h,e,l,l,o
11.单线程应尽量使用HashMap, ArrayList
HashTable,Vector等使用了同步机制，降低了性能。
12.尽量合理的创建HashMap
当你要创建一个比较大的hashMap时，充分利用另一个构造函数
1
public HashMap(int initialCapacity, float loadFactor)
避 免HashMap多次进行了hash重构,扩容是一件很耗费性能的事，在默认中initialCapacity只有16，而loadFactor是 0.75，需要多大的容量，你最好能准确的估计你所需要的最佳大小，同样的Hashtable，Vectors也是一样的道理。
13.尽量减少对变量的重复计算
如
1
for(int i=0;i<list.size();i++)
应该改为
1
for(int i=0,len=list.size();i<len;i++)
并且在循环中应该避免使用复杂的表达式，在循环中，循环条件会被反复计算，如果不使用复杂表达式，而使循环条件值不变的话，程序将会运行的更快。
14.尽量避免不必要的创建
如
1
2
A a = new A();
 if(i==1){list.add(a);}
应该改为
1
2
3
if(i==1){
 A a = new A();
 list.add(a);}
15.尽量在finally块中释放资源
程序中使用到的资源应当被释放，以避免资源泄漏。这最好在finally块中去做。不管程序执行的结果如何，finally块总是会执行的，以确保资源的正确关闭。
16.尽量使用移位来代替’a/b’的操作
“/”是一个代价很高的操作，使用移位的操作将会更快和更有效
如
1
2
int num = a / 4;
 int num = a / 8;
应该改为
1
2
int num = a >> 2;
 int num = a >> 3;
但注意的是使用移位应添加注释，因为移位操作不直观，比较难理解
17.尽量使用移位来代替’a*b’的操作
同样的，对于’*'操作，使用移位的操作将会更快和更有效
如
1
2
int num = a * 4;
 int num = a * 8;
应该改为
1
2
int num = a << 2;
 int num = a << 3;
18.尽量确定StringBuffer的容量
StringBuffer 的构造器会创建一个默认大小(通常是16)的字符数组。在使用中，如果超出这个大小，就会重新分配内存，创建一个更大的数组，并将原先的数组复制过来，再 丢弃旧的数组。在大多数情况下，你可以在创建 StringBuffer的时候指定大小，这样就避免了在容量不够的时候自动增长，以提高性能。
如：StringBuffer buffer = new StringBuffer(1000);
19.尽量早释放无用对象的引用
大部分时，方法局部引用变量所引用的对象 会随着方法结束而变成垃圾，因此，大部分时候程序无需将局部，引用变量显式设为null。
例如：
1
2
3
4
5
Public void test(){
 Object obj = new Object();
 ……
 Obj=null;
 }
上面这个就没必要了，随着方法test()的执行完成，程序中obj引用变量的作用域就结束了。但是如果是改成下面：
 
1
2
3
4
5
6
7
Public void test(){
 Object obj = new Object();
 ……
 Obj=null;
//执行耗时，耗内存操作；或调用耗时，耗内存的方法
 ……
 }
这时候就有必要将obj赋值为null，可以尽早的释放对Object对象的引用。
20.尽量避免使用二维数组
二维数据占用的内存空间比一维数组多得多，大概10倍以上。
21.尽量避免使用split
除 非是必须的，否则应该避免使用split，split由于支持正则表达式，所以效率比较低，如果是频繁的几十，几百万的调用将会耗费大量资源，如果确实需 要频繁的调用split，可以考虑使用apache的StringUtils.split(string,char)，频繁split的可以缓存结果。
22.ArrayList & LinkedList
一 个是线性表，一个是链表，一句话，随机查询尽量使用ArrayList，ArrayList优于LinkedList，LinkedList还要移动指 针，添加删除的操作LinkedList优于ArrayList，ArrayList还要移动数据，不过这是理论性分析，事实未必如此，重要的是理解好2 者得数据结构，对症下药。
23.尽量使用System.arraycopy ()代替通过来循环复制数组
System.arraycopy() 要比通过循环来复制数组快的多
24.尽量缓存经常使用的对象
尽可能将经常使用的对象进行缓存，可以使用数组，或HashMap的容器来进行缓存，但这种方式可能导致系统占用过多的缓存，性能下降，推荐可以使用一些第三方的开源工具，如EhCache，Oscache进行缓存，他们基本都实现了FIFO/FLU等缓存算法。
25.尽量避免非常大的内存分配
有时候问题不是由当时的堆状态造成的，而是因为分配失败造成的。分配的内存块都必须是连续的，而随着堆越来越满，找到较大的连续块越来越困难。
26.慎用异常
当 创建一个异常时，需要收集一个栈跟踪(stack track)，这个栈跟踪用于描述异常是在何处创建的。构建这些栈跟踪时需要为运行时栈做一份快照，正是这一部分开销很大。当需要创建一个 Exception 时，JVM 不得不说：先别动，我想就您现在的样子存一份快照，所以暂时停止入栈和出栈操作。栈跟踪不只包含运行时栈中的一两个元素，而是包含这个栈中的每一个元素。
如 果您创建一个 Exception ，就得付出代价。好在捕获异常开销不大，因此可以使用 trycatch 将核心内容包起来。从技术上讲，您甚至可以随意地抛出异常，而不用花费很大的代价。招致性能损失的并不是 throw 操作——尽管在没有预先创建异常的情况下就抛出异常是有点不寻常。真正要花代价的是创建异常。幸运的是，好的编程习惯已教会我们，不应该不管三七二十一就 抛出异常。异常是为异常的情况而设计的，使用时也应该牢记这一原则。
文章主要是为了抛砖引玉，希望有更多牛人的指点。
===================================================
谢谢的 xuanyuan 的建议：
7.慎用synchronized，尽量减小synchronize的方法
re：同意，不过文中有个地方说错了，使用synchronized关键字并不一定都是锁定当前对象的，要看具体的锁是什么。如果是在方法上加的synchronized，则是以对象本身为锁的，如果是静态方法则锁的粒度是类。
9.尽量不要使用finalize方法
re：同意，其实不推荐用finalize方法的根本原因在于，JVM的规范并不保证何时执行该方法，所以用这个方法来释放资源很不合适，有可能造成长时间资源得不到释放。
16.尽量使用移位来代替’a/b’的操作；17.尽量使用移位来代替’a*b’的操作
re：个人不太同意这两条。这样做确实有更好的性能，但是却牺牲了可读性。这两个操作符对很多程序员来说并不直观。我认为在如今硬件价格不那么昂贵的情况下，略微牺牲一些性能，换来更好的可读性和可维护性是好的选择。
===================================================
wuzhengju 的建议：
19.尽量早释放无用对象的引用大部分时，方法局部引用变量所引用的对象 会随着方法结束而变成垃圾，因此，大部分时候程序无需将局部，引用变量显式设为null。
例如：
1
2
3
4
5
6
7
8
9
10
11
12
13
Public void test(){ 
Object obj = new Object(); 
…… 
Obj=null; 
} 
上面这个就没必要了，随着方法test()的执行完成，程序中obj引用变量的作用域就结束了。但是如果是改成下面： 
Public void test(){ 
Object obj = new Object(); 
…… 
Obj=null; 
//执行耗时，耗内存操作；或调用耗时，耗内存的方法 
…… 
}
#
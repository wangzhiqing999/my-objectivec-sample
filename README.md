my-objectivec-sample
====================

My study code


### A0001_HelloWorld
第一个 Hello World 代码。 
无技术含量，可选择性忽略。


### A0002_NSLog_Param
关于 NSLog 参数的例子。
区别于 C# 那种的 {0} {1} {2} 的方式。


### A0003_BaseDataType
原始数据类型的例子 
不是 NS 系列开头的，原始数据类型。


### A0004_NSNumber
NSNumber 数据类型的相关操作的例子。



### A0005_NsValue
NSValue 使用的例子
相当于 装箱，拆箱的处理
也就是 原始数据类型 装箱 为对象。
对象 拆箱 为 原始数据类型

### A0006_NSData
NSData 使用的例子
相当于 Byte 数组的一个处理


### A0007_DateTime
日期时间的处理的例子


### A0010_String
字符串的相关处理例子


### A0020_Array
数组的处理的例子


### A0021_ArrayPlus
关于数组排序的例子.


### A0030_NSMutableArray
可变数组处理的例子.


### A0040_Dictionary
Dictionary (关键字-值) 处理的例子.


### A0050_Set
Set 处理的例子.


### A0100_BaseClassDefine
一个基本的类的例子
主要涉及：共有/私有/静态/实例 的一些基础的知识。


### A0101_ClassProperty
类 属性的例子


### A0110_Extends
类 继承的例子


### A0120_ID
关于 ID 使用的例子.


### A0130_Block
Block 使用的例子.


### A0131_BlockThread
Block 与 多线程 使用的例子.
本例子使用一个 计算 质数的方式， 来演示 普通的计算方式。与 使用 GCD 多线程的计算方式。


### A0140_KVC
Key Value Coding 使用的例子
其功能相当于 C#、Java 中的反射处理的功能。


### A0150_KVO
Key Value Observing 使用的例子
可以理解为， 通过 反射的方式， 实现 观察者设计模式的处理。


### A0160_Protocol
Protocol 使用的例子 
目的为解决 不支持一个类继承多个类的处理


### A0170_Category
Category 使用的例子 
目的为不修改目标类，而为这个类增加扩展方法的处理


### A0180_Macro
一些基本的 宏定义代码.


### A0190_HandingError
异常处理机制的例子。
包含：
    返回错误代码、
	抛出异常、
	使用 NSError。


### A0200_File
基本的 NSFileManager 类的处理例子。
包含：
	判断文件是否存在、
	复制文件、
	判断文件内容是否一致、
	文件重命名、
	获取文件信息、
	删除文件 的处理。


### A0210_Path
基本的 目录 的处理例子。
包含：
	取得 当前目录、
	临时目录、Home 目录 的处理， 
	全路径、
	最后路径、
	路径中每个节点获取、
	文件扩展名获取、
	相对路径与绝对路径转换的处理。


### A0220_FileHandle
基本的 NSFileHandle 类的使用例子。
包含：
	打开文件(用于读取)、 
	读取数据到 NSData 、 
	打开文件(写入写入)、
	调整写入文件的指针、
	将 NSData 数据写入文件。


### A0300_Copy
复制的例子（主要是要注意，对象的 复制 与 赋值 之间的差别）
涉及 NSCopying Protocols 的例子.


### A0400_Archiving
主要演示将一个类的数据写入文件， 再从文件读取到类中的几种处理。
主要包含： 
1、简单调用 writeToFile
2、使用 NSArchiver archiveRootObject: toFile 与  NSUnarchiver unarchiveObjectWithFile 
3、自定义的类，通过实现 NSCoding  Protocols 来实现相关的处理.


### A0500_WebService
调用 C# 中的 “启用了 Ajax 的 WCF 服务” 的例子.
(手头暂时没有 Web 服务的例子代码， 临时找了个 C# 的 WCF 服务来凑数)


### A0600_Sqlite
通过引用 sqlite3.h ，来访问 Sqlite 数据库的例子.
这个需要 代码中自己手写 sql 语句，对数据库进行访问.


### A0700_CoreData
通过使用 Core Data ，来访问 Sqlite 数据库的例子.（单表 增删改查）
这个是以 ORM 的方式，来访问数据库. 有点像 Java 的 Hibernate 或者 C# 的 Entity Framework.


### A0710_CoreData_OneToMany
通过使用 Core Data ，来访问 Sqlite 数据库的例子.（一对多关系的例子）



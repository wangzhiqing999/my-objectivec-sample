//
//  main.m
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSDictionary+Printing.h"
#import "NSMutableArray+Printing.h"

#import "AddressCard.h"
#import "Foo.h"



extern void test_0001();
extern void test_0002();
extern void test_0003();
extern void test_0004();
extern void test_0005();
extern void test_0006();


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        test_0001();
        
        test_0002();
        
        test_0003();
        
        test_0004();
        
        
        test_0005();
        
        
        test_0006();
    }
    return 0;
}


//
// 用于演示， 调用 writeToFile 方法， 将类中的数据，写入文件。
// 然后用 dictionaryWithContentsOfFile 方法，根据文件中的数据，构造一个新的类.
// 这个功能， 可以模糊的认为，相当于 C#与Java中的 序列化操作。
// 也就是将 类中的数据， 保存到一个 数据文件中。
// 如果需要的话，再从数据文件中，读取信息，构造一个类.
//
void test_0001()
{
    // 初始化一个 NSDictionary 对象.
	NSDictionary *glossary =
    [NSDictionary
     dictionaryWithObjectsAndKeys:
     @"用于开发WinPhone应用的语言.",	@"C#",
     @"用于开发Android应用的语言.",	@"Java",
     @"用于开发IPhone应用的语言. ", @"Objective-C",
     nil
     ];
    
    
	NSLog (@"初始化 NSDictionary. \n");
	[glossary print];
    
	printf("\n");
    
	NSLog (@"将 NSDictionary 中的信息，写入到 glossary 文件. \n");
	// 将对象信息，写入文件.
	// writeToFile 方法 用于将对象内容写入文件
	if ([glossary writeToFile: @"glossary" atomically: YES] == NO)
		printf ("Save to file failed!\n");
    
    
    
	NSLog (@"构造一个新的 NSDictionary 对象，内容从 glossary 文件读取. \n");
	NSDictionary *glossary2;
	// dictionaryWithContentsOfFile 方法用于 从文件加载数据，构造一个类.
	glossary2 = [NSDictionary dictionaryWithContentsOfFile: @"glossary"];
	[glossary2 print];
}




//
// 用于演示， 调用 NSArchiver archiveRootObject: toFile: 方法， 将类中的数据，写入文件。
// 然后用 NSUnarchiver unarchiveObjectWithFile 方法，根据文件中的数据，构造一个新的类.

// 这个功能， 可以模糊的认为，相当于 C#与Java中的 序列化操作。
// 也就是将 类中的数据， 保存到一个 数据文件中。
// 如果需要的话，再从数据文件中，读取信息，构造一个类.

// test_0001 与 test_0002 的区别在于
// 所产生的文件格式不同。
// test_0001 产生的文件，是 可见的 文本类型的文件
// test_0002 产生的文件，是 二进制格式的文件.
//
void test_0002()
{

    // 初始化一个 NSDictionary 对象.
	NSDictionary *glossary =
    [NSDictionary
     dictionaryWithObjectsAndKeys:
     @"用于开发WinPhone应用的语言.",	@"C#",
     @"用于开发Android应用的语言.",	@"Java",
     @"用于开发IPhone应用的语言. ", @"Objective-C",
     nil
     ];
    
    
	NSLog (@"初始化 NSDictionary. \n");
	[glossary print];
    
	printf("\n");
    
	NSLog (@"使用 NSArchiver 类，将 NSDictionary 中的信息，写入到 glossary.archive 文件. \n");
	// 将对象信息，写入文件.
	// writeToFile 方法 用于将对象内容写入文件
	[NSArchiver archiveRootObject: glossary toFile: @"glossary.archive"];
    
    
    
    
    
	NSLog (@"使用 NSUnarchiver 类，构造一个新的 NSDictionary 对象，内容从 glossary.archive 文件读取. \n");
	NSDictionary *glossary2;
    
	// dictionaryWithContentsOfFile 方法用于 从文件加载数据，构造一个类.
	glossary2 = [NSUnarchiver unarchiveObjectWithFile: @"glossary.archive"];
    
    [glossary2 print];
}




//
// 用于演示， 调用 NSArchiver archiveRootObject: toFile: 方法， 将类中的数据，写入文件。
// 然后用 NSUnarchiver unarchiveObjectWithFile 方法，根据文件中的数据，构造一个新的类.

// test_0002 与 test_0003 的区别在于
// 目标类不同
// test_0002 是使用 系统自带的类，来 写入文件、读取文件。
// test_0003 是使用 自定义的类，通过实现 NSCoding  Protocols
// 自己写好
// -(void) encodeWithCoder: (NSCoder *) encoder 方法
// 与
// -(id) initWithCoder: (NSCoder *) decoder 方法.
//
void test_0003()
{
    // 定义2个字符串变量.
	NSString   *aName = @"Edward Wang";
	NSString   *aEmail = @"wangzhiqing@msn.com";
    
	// 初始化 AddressCard 对象.
	AddressCard  *card1 = [[AddressCard alloc] init];
    
	// 设置 AddressCard 对象 的属性.
	[card1 setName: aName];
	[card1 setEmail: aEmail];
    
	// 调用 AddressCard 对象 的 打印方法.
	[card1 print];

    
    NSLog (@"使用 NSArchiver 类，将 AddressCard 中的信息，写入到 AddressCard.archive 文件. \n");
	// 将对象信息，写入文件.
	// writeToFile 方法 用于将对象内容写入文件
	[NSArchiver archiveRootObject: card1 toFile: @"AddressCard.archive"];
    
    
	NSLog (@"使用 NSUnarchiver 类，构造一个新的 AddressCard 对象，内容从 AddressCard.archive 文件读取. \n");
	AddressCard  *card2;
	// dictionaryWithContentsOfFile 方法用于 从文件加载数据，构造一个类.
	card2 = [NSUnarchiver unarchiveObjectWithFile: @"AddressCard.archive"];
    
    
	[card2 print];
}



//
// 用于演示， 调用 NSArchiver archiveRootObject: toFile: 方法， 将类中的数据，写入文件。
// 然后用 NSUnarchiver unarchiveObjectWithFile 方法，根据文件中的数据，构造一个新的类.

// test_0003 与 test_0004 的区别在于
// test_0003 中的数据的属性，全部都是 Objective-C 对象。
// test_0004 中的数据的属性，包含有 Objective-C 对象 和 标准C的基础的数据类型.
// 
void test_0004()
{
    
	// 初始化 Foo 对象.
	Foo *myFoo1 = [[Foo alloc] init];
	[myFoo1 setAll: @"This is the string" iVal: 12345 fVal: 98.6 buff:"abc"];
	[myFoo1 print];
    
    
	NSLog (@"使用 NSArchiver 类，将 Foo 中的信息，写入到 foo.arch 文件. \n");
	// 将对象信息，写入文件.
	// archiveRootObject 方法 用于将对象内容写入文件
	[NSArchiver archiveRootObject: myFoo1 toFile: @"foo.arch"];
    
    
    
    
    
	NSLog (@"使用 NSUnarchiver 类，构造一个新的 Foo 对象，内容从 foo.arch文件读取. \n");
	Foo *myFoo2;
	myFoo2 = [NSUnarchiver unarchiveObjectWithFile: @"foo.arch"];
	[myFoo2 print];
}





//
// 用于演示， 一次性，将多个没有关系的 对象，
// 通过 NSKeyedArchiver 写入 NSMutableData
// 然后 NSMutableData 将内存数据，写入 文件。
//
// 然后再从文件，把数据加载到 NSData
// 然后再通过 NSKeyedUnarchiver 从 NSData 中，提取出 没有关系的对象数据.
//
void test_0005()
{
    NSMutableData     *dataArea;
	NSKeyedArchiver   *archiver;
    
    
	// Set up a data area and connect it to an NSKeyedArchiver object
  	dataArea = [NSMutableData data];
    
  	archiver = [[NSKeyedArchiver alloc]
                initForWritingWithMutableData: dataArea];
    
    
    // 定义2个字符串变量.
	NSString   *aName = @"Edward Wang";
	NSString   *aEmail = @"wangzhiqing@msn.com";
    
	// 初始化 AddressCard 对象.
	AddressCard  *card1 = [[AddressCard alloc] init];
    
	// 设置 AddressCard 对象 的属性.
	[card1 setName: aName];
	[card1 setEmail: aEmail];
    
	// 调用 AddressCard 对象 的 打印方法.
	[card1 print];

    
    // 初始化 Foo 对象.
	Foo *myFoo1 = [[Foo alloc] init];
	[myFoo1 setAll: @"This is the string" iVal: 12345 fVal: 98.6 buff:"abc"];
	[myFoo1 print];
    
    
    
    NSLog (@"使用 NSKeyedArchiver 类，将 AddressCard 中的信息，写入到 NSMutableData 内存区域中. \n");
	[archiver encodeObject: card1 forKey: @"mycard1"];
    
	NSLog (@"使用 NSKeyedArchiver 类，将 Foo 中的信息，写入到 NSMutableData 内存区域中. \n");
	[archiver encodeObject: myFoo1 forKey: @"myfoo1"];
    
	[archiver finishEncoding];
    

  	NSLog (@"将 NSMutableData 内存区域中 的数据， 写入到  myArchive  文件中. \n");
  	if ( [dataArea writeToFile: @"myArchive" atomically: YES] == NO)
       	printf ("Archiving failed!\n");
    
    
    
    
    
    
    NSData            *dataArea2;
  	NSKeyedUnarchiver *unarchiver;
    
    
	AddressCard  *card2;
	Foo *myFoo2;
    
    
	NSLog(@"从 myArchive 文件中读取数据，加载到 NSData 对象中 .");
	dataArea2 = [NSData dataWithContentsOfFile: @"myArchive"];
    
	// 初始化 NSKeyedUnarchiver 类.
	unarchiver = [[NSKeyedUnarchiver alloc]
                  initForReadingWithData: dataArea2];
    
	// Decode the objects we previously stored in the archive
	NSLog(@"使用 NSKeyedUnarchiver 类，从内存区域获取 AddressCard 对象 ");
	card2 = [unarchiver decodeObjectForKey: @"mycard1"];
	[card2 print];
    
	NSLog(@"使用 NSKeyedUnarchiver 类，从内存区域获取 Foo 对象 ");
	myFoo2 = [unarchiver decodeObjectForKey: @"myfoo1"];
	[myFoo2 print];
    
}





//
// 用于演示， 通过使用 Archiving 技术，来实现  深层次的 Copy 功能
// 也就是 对于一个数组。
// 浅层的 克隆，仅仅是 新建一个数组结构，内部的引用还是 共享的，指向同一个对象.
// 深层的 克隆，不但数据结构新建了，数组中的元素，也新建了。
// 
void test_0006()
{
    
	// 中间的内存数据.
	NSData       *data;
    
	// 首先初始化一个 数组.
	NSMutableArray  *dataArray = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString: @"one"],
                                  [NSMutableString stringWithString: @"two"],
                                  [NSMutableString stringWithString: @"three"],
                                  nil
                                  ];
    
    
	NSMutableArray   *dataArray2;
	NSMutableString  *mStr;
    
    
	NSLog (@"数组1: \n");
	[dataArray print];
    
    
	// Make a deep copy using the archiver
    
	NSLog (@"将数组1的内容，通过 NSArchiver 填充到 NSData 对象中. \n");
	data = [NSArchiver archivedDataWithRootObject: dataArray];
    
	NSLog (@"将 NSData，通过 NSUnarchiver 填充到 数组2的中. \n");
	dataArray2 = [NSUnarchiver unarchiveObjectWithData: data];
    
	NSLog (@"数组2: ");
	[dataArray2 print];
    
    
	NSLog (@"修改 数组2 的第一个 元素的内容 ！ \n");
	mStr = [dataArray2 objectAtIndex: 0];
	[mStr appendString: @"ONE"];
    
    
	NSLog (@"数组1: ");
	[dataArray print];
	NSLog (@"数组2: ");
	[dataArray2 print];
}
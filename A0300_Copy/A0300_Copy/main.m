//
//  main.m
//  A0300_Copy
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSMutableArray+Printing.h"
#import "AddressCard.h"


extern void test_0001();
extern void test_0002();
extern void test_0003();

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        test_0001();
        
        test_0002();
        
        test_0003();
    }
    return 0;
}





//
// 本例子主要用于演示， 如果数组简单 赋值的话。
// 相当于 一个指针的效果， 修改其中一个， 将会影响另外一个
// 这个效果基本上  和 Java 与 C# 中的处理机制是一样的.
// 使用 mutableCopy 进行 复制的处理， 那么修改一个， 不会影响另外一个.
//
void test_0001()
{

    NSLog(@"===== 数组的 赋值 与 复制 =====");
    
    // 首先初始化一个 数组.
    NSMutableArray  *dataArray = [NSMutableArray arrayWithObjects:
                                  @"one", @"two", @"three", @"four", nil];
    
    // 另外一个数组.
    NSMutableArray  *dataArray2;
    
    // 简单赋值.
    dataArray2 = dataArray;
    
    // 首先简单输出
    NSLog (@"简单赋值处理以后 ");
    
    NSLog (@"数组1: ");
    [dataArray print];
    NSLog (@"数组2: ");
    [dataArray2 print];
    
    
    
    [dataArray2 removeObjectAtIndex: 0];
    NSLog (@"数组2 删除掉第一个元素！  ");
    
    NSLog (@"数组1: ");
    [dataArray print];
    NSLog (@"数组2: ");
    [dataArray2 print];
    
    
    // try a Copy, then remove the first element from the copy
    dataArray2 = [dataArray mutableCopy];
    NSLog (@"使用复制处理以后  ");
    
    NSLog (@"数组1: ");
    [dataArray print];
    NSLog (@"数组2: ");
    [dataArray2 print];
    
    
    [dataArray2 removeObjectAtIndex: 0];
    NSLog (@"数组2 删除掉第一个元素！  ");
    
    NSLog (@"数组1: ");
    [dataArray print];
    NSLog (@"数组2: ");
    [dataArray2 print];
}




//
// 例子演示的结果，是显示出 数组的 mutableCopy 只是一个 浅层的复制.
// 复制后的 数组是 新的了。
// 但是 数组中的 对象的引用，还是一样的。
// 开发中需要注意 避免 浅层复制后，直接通过 方法来修改 数组中元素的属性内容。
// 这个效果基本上  和 Java 与 C# 中的处理机制是一样的.
//
void test_0002()
{
    NSLog(@"===== 数组中数据的属性发生变化 =====");
    
    
    // 首先初始化一个 数组.
    // 注意： 这里为了测试  属性的变化， 因此使用了 NSMutableString 类.
    // 如果使用 NSString 将达不到效果 （因为该类是不可变的）
	NSMutableArray  *dataArray = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString: @"one"],
                                  [NSMutableString stringWithString: @"two"],
                                  [NSMutableString stringWithString: @"three"],
                                  nil
                                  ];
    
	// 另外一个数组.
	NSMutableArray  *dataArray2;
    
	// 中间临时变量.
	NSMutableString   *mStr;
    
	dataArray2 = [dataArray mutableCopy];
	NSLog (@"使用复制处理以后  ");
    
	NSLog (@"数组1: ");
	[dataArray print];
	NSLog (@"数组2: ");
	[dataArray2 print];
    
    
    // 因为两个数组中的数据对象是 共享的，因此， 获取一个元素， 并调用方法修改属性
    // 结果将导致2个数组中数据都受影响了。
	NSLog (@"修改 数组1 的第一个 元素的内容 ！ ");
	mStr = [dataArray objectAtIndex: 0];
  	[mStr appendString: @"ONE"];
    
	NSLog (@"数组1: ");
	[dataArray print];
	NSLog (@"数组2: ");
	[dataArray2 print];
    
    
    
	NSLog (@"替换 数组1 的第二个 元素的内容 ！  ");
	mStr = [NSMutableString stringWithString:[dataArray objectAtIndex: 1]];
  	[mStr appendString: @"TWO"];
  	[dataArray replaceObjectAtIndex: 1 withObject: mStr];
    
	NSLog (@"数组1: ");
	[dataArray print];
	NSLog (@"数组2: ");
	[dataArray2 print];
}





//
// 本方法用于 演示 自定义类的 的 Copy 处理。
// 对于自己写的类，如果需要实现 copy 的处理。
// 那么需要实现 NSCopying Protocols 也就是 interface 定义的时候。
// 要写成 AddressCard: NSObject
// 然后类里面 实现 -(id) copyWithZone: (NSZone *) zone 方法.
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
    
    
	NSLog (@"复制card1。\n");
    
	// 复制 card1。
	AddressCard  *card2 = [card1 copy];
    
	// 调用 AddressCard 对象 的 打印方法.
	[card2 print];
    
    
	NSLog (@"修改card2。\n");
	[card2 setName: aEmail];
	[card2 setEmail: aName];
    
	printf("Card1：\n");
	[card1 print];
    
	printf("Card2：\n");
	[card2 print];
}

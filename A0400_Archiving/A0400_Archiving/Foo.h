//
//  Foo.h
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



// 用于测试 NSArchiver 功能的类.
// 自定义的类，需要实现  NSCoding  Protocols
// 本类的主要测试目的，是 类的属性中的数据。 不是 Objective-C 的对象
// 而是标准的 C 基础的数据类型。
// 这种情况下，encoder 与 decoder 要做一定的修改.
@interface Foo: NSObject <NSCoding>
{
	NSString    *strVal;
	int         intVal;
	float       floatVal;
    char        *buf;
}


-(void) setAll: (NSString *) ss iVal: (int) ii fVal: (float) ff  buff:(char *)  buff;

-(NSString *)   strVal;

-(int)          intVal;

-(float)        floatVal;

-(void) 		print;


@end

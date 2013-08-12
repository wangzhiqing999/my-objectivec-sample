//
//  Foo.m
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "Foo.h"

@implementation Foo



-(void) setAll: (NSString *) ss iVal: (int) ii fVal: (float) ff  buff:(char *)  buff;
{
    strVal = ss;
    intVal = ii;
    floatVal = ff;
    buf = buff;
}


-(NSString *) strVal  { return strVal; }
-(int)        intVal  { return intVal; }
-(float)      floatVal { return floatVal; }


-(void) print
{
    NSLog(@"strVal=%@; intVal=%d; floatVal=%f; buf=%s", strVal, intVal, floatVal, buf);
}


// 下面的 方法， 是 实现  NSCoding  Protocols 的方法.
-(void) encodeWithCoder: (NSCoder *) encoder
{
	if ( [encoder allowsKeyedCoding] ) {
		NSLog (@"EEE 环境支持 allowsKeyedCoding. \n");
		[encoder encodeObject: strVal forKey: @"FoostrVal"];
		[encoder encodeInt: intVal forKey: @"FoointVal"];
		[encoder encodeFloat: floatVal forKey: @"FoofloatVal"];
        
        // 注意： char *buf  类型的， 需要转换为 NSData.
        NSData *bufData = [NSData dataWithBytes:buf length:1024];
        [encoder encodeObject:bufData forKey:@"someData"];
        
	} else {
		NSLog (@"EEE 环境不支持 allowsKeyedCoding. \n");
		[encoder encodeObject: strVal];
		// 请注意：
		//     基础的数据类型，需要下面这种特定的方式来处理。
		[encoder encodeValueOfObjCType: @encode(int) at: &intVal];
		[encoder encodeValueOfObjCType: @encode(float) at: &floatVal];
        
        // 注意： char *buf  类型的， 需要转换为 NSData.
        NSData *bufData = [NSData dataWithBytes:buf length:1024];
        [encoder encodeObject:bufData];

	}
}


-(id) initWithCoder: (NSCoder *) decoder
{
	if ( [decoder allowsKeyedCoding] ) {
		NSLog (@"DDD 环境支持 allowsKeyedCoding.");
		strVal = [decoder decodeObjectForKey: @"FoostrVal"];
		intVal = [decoder decodeIntForKey: @"FoointVal"];
		floatVal = [decoder decodeFloatForKey: @"FoofloatVal"];
        
        // 注意： char *buf  类型的， 需要转换为 NSData.
        NSData *bufData = [decoder decodeObjectForKey:@"someData"];
        buf = malloc(1024);
        [bufData getBytes:buf length:1024];
        
	} else {
		NSLog (@"DDD 环境不支持 allowsKeyedCoding.");
		strVal = [decoder decodeObject];
		// 请注意：
		//     基础的数据类型，需要下面这种特定的方式来处理。
		[decoder decodeValueOfObjCType: @encode(int) at: &intVal];
		[decoder decodeValueOfObjCType: @encode(float) at: &floatVal];
        
        // 注意： char *buf  类型的， 需要转换为 NSData.
        NSData *bufData = [decoder decodeObject];
        buf = malloc(1024);
        [bufData getBytes:buf length:1024];
	}
    
	return self;
}


@end

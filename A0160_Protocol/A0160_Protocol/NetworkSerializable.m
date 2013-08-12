//
//  NetworkSerializable.m
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NetworkSerializable.h"

@implementation NetworkSerializable

//
// 本类 的  网络地址属性.
//
@synthesize networkAddress;



//
// 下面是 实现 协议的处理代码。
//


//
// 实现将对象 存储起来的处理.
//
-(NSInteger) WriteObject : (id) object
{
    NSLog(@"尝试把数据对象  %@ 存储到 网络空间上！", object);
    return 2;
}




//
// 实现 读取对象的处理.
//
-(id) ReadObject : (NSInteger) objectID
{
    NSLog(@"尝试把从网络空间上， 加载数据对象 %ld ！", objectID);
    
    id test = @"Test2";
    return test;
}





@end

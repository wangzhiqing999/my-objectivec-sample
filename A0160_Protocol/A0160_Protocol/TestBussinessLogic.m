//
//  TestBussinessLogic.m
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestBussinessLogic.h"

@implementation TestBussinessLogic


//
//  某些业务逻辑数据的属性.
//
@synthesize someBusinessData;


//
// 协议实现类的属性
//
@synthesize serializableProtocol;



//
// 测试业务逻辑。
//
-(void) doTest
{
    someBusinessData = @"Test";
    
    NSLog(@"##### 开始存储数据到 外部设备上......");
    
    NSInteger index = [serializableProtocol WriteObject:someBusinessData];
    
    NSLog(@"##### 存储完毕， 数据索引＝%ld", index);
    
    
    NSLog(@"##### 开始从外部设备上获取数据......");
    
    someBusinessData = [serializableProtocol ReadObject:index];

    NSLog(@"##### 读取完毕， 数据＝%@", someBusinessData);
}


@end

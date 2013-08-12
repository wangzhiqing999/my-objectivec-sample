//
//  LocalDiskSerializable.m
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "LocalDiskSerializable.h"

@implementation LocalDiskSerializable

//
// 本类 的  磁盘路径属性.
//
@synthesize localDiskPath;




//
// 下面是 实现 协议的处理代码。
//


//
// 实现将对象 存储起来的处理.
//
-(NSInteger) WriteObject : (id) object
{
    NSLog(@"尝试把数据对象 %@ 存储到 本地磁盘空间上！", object);
    return 1;
}




//
// 实现 读取对象的处理.
//
-(id) ReadObject : (NSInteger) objectID
{
    NSLog(@"尝试把从本地磁盘空间上， 加载数据对象 %ld ！", objectID);
    
    id test = @"Test1";
    return test;
}



//
// 实现 显示对象的数据。
//
-(void) DisplayObject : (NSInteger) objectID
{
    NSLog(@"尝试输出本地磁盘的相关信息！");
}

@end

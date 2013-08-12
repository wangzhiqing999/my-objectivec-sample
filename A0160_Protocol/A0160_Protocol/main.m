//
//  main.m
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "LocalDiskSerializable.h"
#import "NetworkSerializable.h"


#import "TestBussinessLogic.h"





int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 初始化 本地磁盘 序列化处理.
        LocalDiskSerializable *lds =[[LocalDiskSerializable alloc] init];
        
        // 初始化 网络 序列化处理.
        NetworkSerializable *ns = [[NetworkSerializable alloc] init];

        
        // 初始化 业务处理逻辑.
        TestBussinessLogic *tbl = [[TestBussinessLogic alloc] init];
        [tbl setSomeBusinessData:@"用于模拟测试的业务数据"];
        
        
        // 首先 先模拟 本地磁盘 序列化处理.
        [tbl setSerializableProtocol:lds];
        // 执行 模拟的业务逻辑.
        [tbl doTest];
        
        
        // 然后 再模拟 网络 序列化处理.
        [tbl setSerializableProtocol:ns];
        // 执行 模拟的业务逻辑.
        [tbl doTest];
        
    }
    return 0;
}


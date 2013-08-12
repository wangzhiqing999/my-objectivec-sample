//
//  main.m
//  A0120_ID
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestMain.h"
#import "TestSub.h"



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 用于测试的  ID  数据类型.
        id dataValue;
        
        
        // 初始化  对象.
        TestMain *testMain = [[TestMain alloc] init];
        TestSub *testSub = [[TestSub alloc] init];
        
        
        
        
        // 设置 ID 的值， 然后调用 print 方法.
        dataValue = testMain;
        [dataValue print];
        
        
        // 设置 ID 的值， 然后调用 print 方法.
        dataValue = testSub;
        [dataValue print];
        
        
        //问题：两次遇到[dataValue print];并且 TestMain 和 TestSub 类中都定义有print方法，系统如何知道调用哪个？
        //答案：在程序执行期间，当系统准备将print消息发送给dataValue时，它首先检查dataValue中存储的对象所属的类。
        
    }
    return 0;
}


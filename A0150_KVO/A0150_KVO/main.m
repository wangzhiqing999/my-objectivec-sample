//
//  main.m
//  A0150_KVO
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Observer.h"
#import "MyPoint.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 初始化  被观察类.
        MyPoint *point = [[MyPoint alloc] init];
        
        // 初始化  观察者类.
        Observer *observer = [[Observer alloc] initWithPoint:point];
        
        
        // 尝试修改 被观察类的属性。
        // 观察者类 将输出相关的 信息.
        point.x = 42.0;
        point.y = 55.1;
        point.x = 4200.0;
        point.y = 5500.1;
        
        
        
    }
    return 0;
}


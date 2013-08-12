//
//  main.m
//  A0100_BaseClassDefine
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "MyHelloWorld.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        
        NSLog(@"##### 首先调用静态方法");
        [MyHelloWorld sayHelloWorld];
        [MyHelloWorld sayHelloWorldOne:@"A"];
        [MyHelloWorld sayHelloWorldTwo:@"A"  theHelloTwo:@"B"];
        [MyHelloWorld sayHelloWorldThree:@"A"  theHelloTwo:@"B"   theHelloThree:@"C"];
        
        
        
        
        
        
        NSLog(@"##### 然后初始化类的实例，调用实例方法");
        
        // 初始化 MyHelloWorld 对象.
        MyHelloWorld *myData = [[MyHelloWorld alloc] initWithUserName :@"Test 测试"];
        
        // 调用测试方法.
        [myData helloWorld];
        [myData helloWorldOne:@"a"];
        [myData helloWorldTwo:@"a"   theHelloTwo:@"b"];
        [myData helloWorldThree:@"a"   theHelloTwo:@"b"   theHelloThree:@"c"];
        
        
        [myData publicHelloWorld];
        
    }
    return 0;
}


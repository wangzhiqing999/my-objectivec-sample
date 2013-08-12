//
//  main.m
//  A0180_Macro
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


// 宏定义： 这里相当于定义了一个  字符串常量 的效果.
#define THE_KEY @"MY_IMPORTANT_DATA"


// 宏定义： 这里用于 模拟 一个 调试标志.
#define DEBUGING 1


// 宏定义： 这里定义了一行 输出的语句.
#define LOG_LINE NSLog(@"%s:%d", __FILE__, __LINE__);


// 宏定义： 这里定义了一个 函数.
#define LOGVAR(var) NSLog(@"%s: %@", #var, var);





int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *someValue = @"foobar";
        
        
        // 没有使用 宏定义的 处理.
        
        [[NSUserDefaults standardUserDefaults] setObject:someValue
                            forKey:@"MY_IMPORTANT_DATA"];
        
        NSString *theValue = [[NSUserDefaults standardUserDefaults]
                              stringForKey:@"MY_IMPORTANT_DATA"];
        
        NSLog(@"测试数据：%@", theValue);
        
        
        
        // 使用 宏定义的 处理.
        // 注意：THE_KEY 被定义在 本文件的头部.
        
        [[NSUserDefaults standardUserDefaults] setObject:someValue
                              forKey:THE_KEY];
        theValue = [[NSUserDefaults standardUserDefaults]
                              stringForKey:THE_KEY];
        
        NSLog(@"测试数据：%@", theValue);
        
        
        
        
        // 注意： 好像 DEBUG 这个标志， 是系统定义的。
        // 因此这里使用  DEBUGING
#ifdef DEBUGING
        NSLog(@"程序运行在调试模式下...");
#else
        NSLog(@"程序运行在非调试模式下...");
#endif
        
        
        
        
        // 这里是 测试 使用 宏， 作为 语句来处理.
        LOG_LINE
        
        NSLog(@"%s %s", __DATE__, __TIME__);
        
        LOG_LINE
        
        
        
        
        // 这里是  测试  使用宏 ， 定义一个函数的 调用。
        LOGVAR(someValue);
        
        
    }
    return 0;
}


//
//  main.m
//  A0002_NSLog_Param
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 本例子用于 演示， 在 调试输出的时候。
        // 传递参数时候的 处理。
        // 这里不能象 C# 那样， 简单 {0} {1} 的设定了，
        // 而是需要指定数据类型的。 例如  %d
        
        
        // 定义一个  int 类型的变量。
        int aVariable = 123456;
        
        
        NSLog(@"局部变量 aVariable 的数值 ＝ %d", aVariable);
        
    }
    return 0;
}


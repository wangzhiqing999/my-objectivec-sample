//
//  main.m
//  A0110_Extends
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestSquare.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 初始化 Square 对象.
        TestSquare *myData = [[TestSquare alloc] init];
        
        // 设置 Square 的 side.
        [myData setSide:100];
        
        // 测试输出.
        NSLog(@"area=%i  perimeter=%i", [myData area], [myData perimeter] );
        
    }
    return 0;
}


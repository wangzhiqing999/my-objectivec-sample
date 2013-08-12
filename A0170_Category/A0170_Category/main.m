//
//  main.m
//  A0170_Category
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "NSMutableString+GUID.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        // 初始化一个  NSMutableString  类.
        NSMutableString *aString = [NSMutableString string];
        
        // 调用 自己通过 Category 扩展的方法.
        [aString appendGuid];
        
        
        NSLog(@"The guid: %@", aString);
        
    }
    return 0;
}


//
//  NSMutableArray+print.m
//  A0020_Array
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NSMutableArray+print.h"

@implementation NSMutableArray (print)


-(void) printNSString : (NSString *) title;
{
    NSMutableString *buff = [[NSMutableString alloc] init];
    
    [buff appendString:title];
    
    for(NSString *item in self)
    {
        [buff appendFormat:@" %@,", item];
    }

    // 输出调试信息.
    NSLog(@"%@", buff);
}



@end

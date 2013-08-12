//
//  NSMutableString+GUID.m
//  A0170_Category
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NSMutableString+GUID.h"

@implementation NSMutableString (GUID)


//
// 下面是  针对 NSMutableString 类， 新增的扩展方法.
//
-(void)appendGuid
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *str = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    [self appendString:str];
    CFRelease(uuid);
}


+(id)stringWithGuid;
{
    NSMutableString *ret = [self string];
    [ret appendGuid];
    return ret;
}


@end

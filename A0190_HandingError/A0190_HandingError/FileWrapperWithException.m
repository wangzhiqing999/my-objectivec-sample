//
//  FileWrapperWithException.m
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "FileWrapperWithException.h"



@implementation FileWrapperWithException


//
// 私有的 方法.
// 用于当处理失败的时候，去检查文件是否存在.
//
-(BOOL) fileExistsAtPath:(NSString *)inPath;
{
    // 因为是测试代码， 所以简单模拟返回 YES.
    return YES;
}


//
// 私有的 方法.
// 用于当处理失败的时候，去检查是否有访问文件的权限.
//
-(BOOL) hasPermissionForFileAtPath:(NSString *)inPath;
{
    // 因为是测试代码， 所以简单模拟返回 YES.
    return YES;
}





-(void)openFileAtPath:(NSString *)inPath;
{
    contents = [NSDictionary dictionaryWithContentsOfFile:inPath];
    
    if(!contents)
    {
        NSException *ex;
        if(![self fileExistsAtPath:inPath])
        {
            ex = [NSException
                  exceptionWithName:@"打开文件发生了异常"
                  reason:@"文件不存在."
                  userInfo:nil];
        }
        else if(![self hasPermissionForFileAtPath:inPath])
        {
            ex = [NSException
                  exceptionWithName:@"打开文件发生了异常"
                  reason:@"权限错误."
                  userInfo:nil];
        } else {
            ex = [NSException
                  exceptionWithName:@"打开文件发生了异常"
                  reason:@"未知的错误."
                  userInfo:nil];
        }
        @throw ex;
    }
}



@end

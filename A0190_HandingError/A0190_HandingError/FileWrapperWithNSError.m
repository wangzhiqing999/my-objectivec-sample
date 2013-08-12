//
//  FileWrapperWithNSError.m
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "FileWrapperWithNSError.h"

@implementation FileWrapperWithNSError


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



-(BOOL)openFileAtPath:(NSString *)inPath withError:(NSError **)outError;
{
    
    contents = [NSDictionary dictionaryWithContentsOfFile:inPath];
    
    if(!contents)
    {
        if(![self fileExistsAtPath:inPath])
        {
            NSDictionary *errorInfo =
            [NSDictionary
                dictionaryWithObject:@"文件不存在."
                forKey:NSLocalizedDescriptionKey];
            
            *outError = [NSError
                         errorWithDomain:@"FileWrapperWithNSError"
                        code:404
                        userInfo:errorInfo];
        }
        else if(![self hasPermissionForFileAtPath:inPath])
        {
            NSDictionary *errorInfo =
            [NSDictionary
                dictionaryWithObject:@"权限错误."
                forKey:NSLocalizedDescriptionKey];
            
            *outError = [NSError
                         errorWithDomain:@"FileWrapperWithNSError"
                            code:500
                            userInfo:errorInfo];
            
            
        } else {
            NSDictionary *errorInfo =
            [NSDictionary
                dictionaryWithObject:@"未知的错误."
                forKey:NSLocalizedDescriptionKey];
            
            *outError = [NSError
                         errorWithDomain:@"FileWrapperWithNSError"
                         code:501
                         userInfo:errorInfo];
            
        }
        return NO; }
    return YES;
}



@end

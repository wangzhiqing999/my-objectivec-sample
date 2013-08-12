//
//  FileWrapperWithException.h
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本例子用于演示 错误处理的一种机制。
//    就是通过 抛出 Exception 异常， 来定义错误的处理.
//
@interface FileWrapperWithException : NSObject
{
    NSDictionary *contents;
}


//
// 如果正常处理成功，那么什么事情都不会发生.
// 如果失败了，那么将抛出异常.
//
-(void)openFileAtPath:(NSString *)inPath;





@end

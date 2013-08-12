//
//  FileWrapperWithNSError.h
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本例子用于演示 错误处理的一种机制。
//    就是通过 返回值 与 NSError， 来定义错误的处理.
//
@interface FileWrapperWithNSError : NSObject
{
    NSDictionary *contents;
}


//
// 通过 返回值的 机制， 来 实现 错误处理的逻辑.
// 返回 YES 意味着处理成功， 返回 NO 意味着处理失败.
//
// NSError 这里被定义为  (NSError **)  意味着 方法内部，将对这个数据进行赋值.
// 这里的  (NSError **)outError  功能上相当于 C# 中的  ref NSError outError
//
-(BOOL)openFileAtPath:(NSString *)inPath withError:(NSError **)outError;


@end


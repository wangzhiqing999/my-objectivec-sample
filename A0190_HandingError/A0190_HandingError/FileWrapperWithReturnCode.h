//
//  FileWrapperWithReturnCode.h
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本例子用于演示 错误处理的一种机制。
//    就是通过 返回值， 来定义错误的处理.
//
@interface FileWrapperWithReturnCode : NSObject
{
    NSDictionary *contents;
}


//
// 通过 返回值的 机制， 来 实现 错误处理的逻辑.
// 返回 YES 意味着处理成功， 返回 NO 意味着处理失败.
//
-(BOOL)openFileAtPath:(NSString *)inPath;



@end

//
//  main.m
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FileWrapperWithReturnCode.h"
#import "FileWrapperWithException.h"
#import "FileWrapperWithNSError.h"




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //
        // 下面是 使用  返回值 判断 错误处理的机制。
        //
        FileWrapperWithReturnCode *wrapperWithReturnCode = [[FileWrapperWithReturnCode alloc] init];
        if([wrapperWithReturnCode openFileAtPath:@"test.txt"])
        {
            // do stuff with the file here...
            NSLog(@"进行后续的文件处理......");
        }
        else {
            // tell the user the file couldn’t be opened.
            NSLog(@"文件处理失败了......");
        }
        
        
        
        
        
        //
        // 下面是 使用  异常处理 判断 错误处理的机制。
        //
        int retCode = 0;
        @try
        {
            FileWrapperWithException *wrapperWithException = [[FileWrapperWithException alloc] init];
            
            [wrapperWithException openFileAtPath:@"test.txt"];
            
            // do stuff with the file here...
            NSLog(@"进行后续的文件处理......");
            
        }
        @catch (NSException *e)
        {
            NSString *errorName = [e name];
            NSString *errorMsg = [e reason];
            NSLog(@"捕获到了异常: %@ - %@" , errorName, errorMsg);
            retCode = -255;
        } @finally {
            
            NSLog(@"### 最终处理结果：%d", retCode);
        }
        
        
        
        
        
        
        //
        // 下面是 使用  NSError  错误处理的机制。
        //
        
        FileWrapperWithNSError *wrapper = [[FileWrapperWithNSError alloc] init];
        NSError *error = nil;
        
        
        // 由于那个 方法， 定义的时候， 是  withError:(NSError **)outError
        // 因此， 这里需要使用 withError:&error  来传递参数进去.
        if([wrapper openFileAtPath:@"test.txt" withError:&error])
        {
            // do stuff with the file here...
            NSLog(@"进行后续的文件处理......");

        }
        else {
            // tell the user the file couldn’t be opened.
            // here you have the error object filled in.
            // showErrorToUser(error);
            
            NSLog(@"NSError错误：%ld  %@",  [error code], [error domain] );

        }
        
        
        
        
    }
    return 0;
}


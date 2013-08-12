//
//  FileWrapperWithReturnCode.m
//  A0190_HandingError
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "FileWrapperWithReturnCode.h"

@implementation FileWrapperWithReturnCode



-(BOOL)openFileAtPath:(NSString *)inPath;
{
    contents = [NSDictionary dictionaryWithContentsOfFile:inPath];
    if(!contents)
        return NO;
    return YES;
}



@end

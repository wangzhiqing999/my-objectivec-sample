//
//  TestWindows.h
//  A0140_KVC
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



//
// 用于测试  KVC 使用的   窗口类.
//
@interface TestWindows : NSObject
{
    // 窗口上面的标题.
    NSString *windowsTitle;
    
    // 窗口的价钱
    NSInteger windowsMoney;
}


// 窗口上面的标题 属性.
@property(nonatomic, retain) NSString *windowsTitle;


// 窗口的价钱
@property(nonatomic) NSInteger windowsMoney;


@end

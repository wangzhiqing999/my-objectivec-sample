//
//  TestDoor.h
//  A0140_KVC
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 用于测试  KVC 使用的   门类.
//
@interface TestDoor : NSObject
{
    // 门上面的标题.
    NSString *doorTitle;
    
    // 门的价钱
    NSInteger doorMoney;
}


// 门上面的标题 属性.
@property(nonatomic, retain) NSString *doorTitle;


// 门的价钱 属性.
@property(nonatomic) NSInteger doorMoney;


@end

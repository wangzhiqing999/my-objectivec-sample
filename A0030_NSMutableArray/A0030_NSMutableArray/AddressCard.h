//
//  AddressCard.h
//  A0030_NSMutableArray
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



// 自定义类 AddressCard
// 类包含2个 内部变量，分别为 *name 与 *email

@interface AddressCard : NSObject
{
    NSString  *name;
    NSString  *email;
}




// 设置属性
-(void) setName: (NSString *) theName;
-(void) setEmail: (NSString *) theEmail;
-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;

// 获取属性
-(NSString *) name;
-(NSString *) email;


// 打印的方法.
-(void) print;


// 排序的方法.
-(NSComparisonResult) compareNames: (id) element;

@end

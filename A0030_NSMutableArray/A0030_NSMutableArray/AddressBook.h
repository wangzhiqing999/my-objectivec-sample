//
//  AddressBook.h
//  A0030_NSMutableArray
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"



@interface AddressBook : NSObject
{
    NSString        *bookName;
    NSMutableArray  *book;
}



// 根据名称初始化.
-(AddressBook *) initWithName: (NSString *) name;

// 添加 AddressCard 对象
-(void) addCard: (AddressCard *) theCard;

// 删除  AddressCard 对象
-(void) removeCard: (AddressCard *) theCard;


// 取得 拥有的 AddressCard 对象 的数量.
-(int) entries;


// 输出地址簿列表信息.
-(void) list;


// 按名称检索.
-(AddressCard *) lookup: (NSString *) theName;


-(void) sort;


/*
 
// 释放资源.
-(void) dealloc;

*/



@end

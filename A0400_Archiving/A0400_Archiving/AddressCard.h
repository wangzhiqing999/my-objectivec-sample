//
//  AddressCard.h
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


// 用于测试 NSArchiver 功能的类.
// 自定义的类，需要实现  NSCoding  Protocols
@interface AddressCard : NSObject<NSCoding>



@property(nonatomic, retain) NSString *name;

@property(nonatomic, retain) NSString *email;


-(void) print;


@end

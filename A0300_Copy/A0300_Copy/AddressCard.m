//
//  AddressCard.m
//  A0300_Copy
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard


@synthesize name;
@synthesize email;


-(void) print;
{
    NSLog(@"#####  name=%@  email=%@", name, email);
}


// 此方法为 NSCopying 中定义的方法.
-(id) copyWithZone: (NSZone *) zone
{
	AddressCard *newCard = [[AddressCard allocWithZone: zone] init];
    
    // 设置新对象的 name 属性.
	[newCard setName:  [self name]];
    // 设置新对象的 email 属性.
    [newCard setEmail: [self email]];
     
	return newCard;
}

@end

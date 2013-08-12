//
//  AddressCard.m
//  A0400_Archiving
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



// 下面的 方法， 是 实现  NSCoding  Protocols 的方法.
-(void) encodeWithCoder: (NSCoder *) encoder
{
	[encoder encodeObject: name];
	[encoder encodeObject: email];
}


-(id) initWithCoder: (NSCoder *) decoder
{
	name = [decoder decodeObject];
	email = [decoder decodeObject];
    
    return self;
}


@end

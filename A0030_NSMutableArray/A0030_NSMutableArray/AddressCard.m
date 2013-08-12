//
//  AddressCard.m
//  A0030_NSMutableArray
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard




// 设置 名称 属性.
-(void) setName: (NSString *) theName
{
	//[name release];
	name = [[NSString alloc] initWithString: theName];
}


// 设置 电子邮件 属性.
-(void) setEmail: (NSString *) theEmail
{
	//[email release];
	email = [[NSString alloc] initWithString: theEmail];
}


// 同时设置2个属性.
-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
	[self setName: theName];
	[self setEmail: theEmail];
}




// 获取 名称 属性.
-(NSString *) name
{
	return name;
}


// 获取 电子邮件 属性.
-(NSString *) email
{
	return email;
}


// 打印方法.
-(void) print
{
    printf ("====================================\n");
    printf ("|                                  |\n");
    printf ("|  %-31s |\n", [name cString]);
    printf ("|  %-31s |\n", [email cString]);
    printf ("|                                  |\n");
    printf ("|                                  |\n");
    printf ("|                                  |\n");
    printf ("|       O                  O       |\n");
    printf ("====================================\n");
    
}



// 用于排序的 方法.
-(NSComparisonResult) compareNames: (id) element
{
	return [name compare: [element name]];
}



/*

-(void) dealloc
{
	[name release];
	[email release];
	[super dealloc];
}

*/


@end

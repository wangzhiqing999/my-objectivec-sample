//
//  AddressBook.m
//  A0030_NSMutableArray
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook



// set up the AddressBook's name and an empty book
-(AddressBook *) initWithName: (NSString *) name
{
	self = [super init];
	if (self) {
		// 设置名称.
		bookName = [[NSString alloc] initWithString: name];
		// 初始化 数组.
		book = [[NSMutableArray alloc] init];
	}
	return self;
}



-(void) addCard: (AddressCard *) theCard
{
	// 向 数组中 增加  AddressCard 对象.
	[book addObject: theCard];
}



-(void) removeCard: (AddressCard *) theCard
{
	// 从 数组中 删除 AddressCard 对象.
  	[book removeObjectIdenticalTo: theCard];
}





-(int) entries
{
	// 返回数组长度.
	return [book count];
}



-(void) list
{
	int     i;
    unsigned long elements;
    
	AddressCard *theCard;
	
	
	printf ("\n======== %s =========\n", [bookName cString]);
	
	// 取得 数组长度..
	elements = [book count];
	
	for ( i = 0; i < elements; ++i ) {
		// 取得 数组中， 指定位置的元素.
		theCard = [book objectAtIndex: i];
		// 输出.
		printf ("%-20s  %-32s\n",
                [[theCard name] cString],
                [[theCard email] cString]);
	}
	
	printf("========================================\n\n");
    
}




// lookup address card by name -- assumes an exact match
-(AddressCard *) lookup: (NSString *) theName
{
	AddressCard *nextCard;
	int   i;
    unsigned long elements;
	elements = [book count];
    
	for ( i = 0; i < elements; ++i) {
		nextCard = [book objectAtIndex: i];
		if ( [[nextCard name] caseInsensitiveCompare: theName] == NSOrderedSame )
			return nextCard;
	}
	return nil;
    
}


// 排序处理.
-(void) sort
{
    [book sortUsingSelector: @selector(compareNames:)];
}




/*
 
// 释放内存.
-(void) dealloc
{
	[bookName release];
	[book release];
	[super dealloc];
}


*/


@end

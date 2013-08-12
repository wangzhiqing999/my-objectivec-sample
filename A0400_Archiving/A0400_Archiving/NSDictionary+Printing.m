//
//  NSDictionary+Printing.m
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NSDictionary+Printing.h"

@implementation NSDictionary (Printing)


-(void) print {
    
	NSEnumerator *keyEnum;
	id     key;
    
	keyEnum = [self keyEnumerator];
    
	while ( (key = [keyEnum nextObject]) != nil ) {
	    NSLog(@"%@: %@",
                key,
                [self objectForKey: key]);
	}
}


@end

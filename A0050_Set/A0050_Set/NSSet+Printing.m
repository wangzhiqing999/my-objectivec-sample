//
//  NSSet+Printing.m
//  A0050_Set
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NSSet+Printing.h"

@implementation NSSet (Printing)

-(void) print {
    
	NSEnumerator *setEnum;
	NSNumber   *element;
    
	setEnum = [self objectEnumerator];
    
	printf (" {");
    
	while ((element = [setEnum nextObject]) != nil)
		printf (" %i ", [element intValue]);
    
	printf ("}\n");
}

@end

//
//  NSMutableArray+Printing.m
//  A0400_Archiving
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "NSMutableArray+Printing.h"

@implementation NSMutableArray (Printing)


-(void) print {
	long        i, n;
	n= [self count];
	for (i = 0; i < n; ++i)
		printf ("%s ", [[self objectAtIndex: i] cString]);
    
	printf ("\n");
}


@end

//
//  Manager.h
//  A0101_ClassProperty
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"

@interface Manager : Employee
{
    NSMutableArray *reports;
}


@property (nonatomic, retain) NSMutableArray * reports;


-(void)addReport:(Employee *)inEmployee;



@end

//
//  Manager.m
//  A0101_ClassProperty
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "Manager.h"

@implementation Manager


@synthesize reports;


-(id)init; {
    if(self = [super init])
    {
        [self setReports:[NSMutableArray array]];
    }
    return self;
}


-(void)addReport:(Employee *)inEmployee;
{
    [reports addObject:inEmployee];
    [inEmployee setManager:self];
}



// 请注意这里：
// Obj-C 中， 子类覆盖父类的方法， 处理机制与 Java 差不多， 直接 同名称就覆盖掉了。
// 不需要象 C# 那样， 还要额外加一个 override 或者 new 之类的关键字。
//
-(double)bonus;
{
    
    // 这里 ：
    //    子类覆盖掉了 父类的方法。
    //    父类是 * .05
    return salary * .10;
}



@end

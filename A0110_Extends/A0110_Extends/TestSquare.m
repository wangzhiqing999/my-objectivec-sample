//
//  TestSquare.m
//  A0110_Extends
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestSquare.h"

@implementation TestSquare


-(int)side{
    return _width;
}


-(void)setSide:(int)s{
    // self指令在自身类中查找setWidth: setHeight:方法，查找不到，则调用其父类中的该方法
    [self setWidth:s];
    [self setHeight:s];
}


@end

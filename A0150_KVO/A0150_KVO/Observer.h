//
//  Observer.h
//  A0150_KVO
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyPoint.h"


// 
// 本类是一个用于 测试  Key Value Observing 功能的  观察者 类.
// 属性 MyPoint *point 为 被观察的对象.
//
@interface Observer : NSObject
{
    MyPoint *point;
}


@property (retain) MyPoint *point;


-(id)initWithPoint:(MyPoint *)inPoint;



@end

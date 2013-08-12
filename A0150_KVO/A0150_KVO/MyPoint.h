//
//  MyPoint.h
//  A0150_KVO
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



//
// 本类是一个用于 测试  Key Value Observing 功能的目标类.
// 通过下面的代码可以看出， 这个  被观察的 目标类，仅仅有两个 最基本的属性。
// 也就是  x  和  y   ，除此之外，没有其他的任何代码。
//
@interface MyPoint : NSObject
{
    CGFloat x;
    CGFloat y;
}


@property CGFloat x;

@property CGFloat y;


@end

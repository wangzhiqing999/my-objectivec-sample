//
//  TestSquare.h
//  A0110_Extends
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestRectangle.h"


@interface TestSquare : TestRectangle


/*
 注意：
   正方形 作为 长方形 的 子类，  这个在设计上， 是不合适的。 
  （因为对于 正方形 类来说， 多了2个  有干扰性质 的  长， 宽 的属性。 ）
   本例子仅仅用于  演示基本的  继承 的处理机制，
*/


-(int) side;


-(void)setSide:(int)s;



@end

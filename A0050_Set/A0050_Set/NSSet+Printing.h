//
//  NSSet+Printing.h
//  A0050_Set
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


// 当你想要为某个class添加方法s，你通常会扩充（extend，即继承）它。
// 然而这不一定是个完美方案，特别是你想要重写一个class的某个功能，但你却没有原始代码时。
// Categories允许你在现有的class加入新功能，但不需要扩充它。
// 下面的例子，为 NSSet 类， 扩展一个 print 方法，用于输出调试信息。
// Add a print method to NSSet with the Printing category
@interface NSSet (Printing)



// 本例子主要用于  演示  Set 的功能。
// 具体  关于  Categories 的详情，  参考 A0170_Category 项目.
-(void) print;

@end

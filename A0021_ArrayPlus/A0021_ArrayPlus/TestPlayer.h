//
//  TestPlayer.h
//  A0021_ArrayPlus
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本类为一个 测试的类
// 用于测试 数组的 Sending Messages to Elements
// 也就是 对于数组中的  每一个 对象， 都调用 一次 方法.
// 而不需要 开发者  手动 for () { 调用方法 } 了。
//
@interface TestPlayer : NSObject
{
    // 玩家名称.
    NSString *playerName;
    
    // 玩家等级.
    NSInteger playerLevel;
    
    // 玩家状态.
    NSString *playerStatus;
}


@property(nonatomic, retain) NSString *playerName;

@property(nonatomic) NSInteger playerLevel;

@property(nonatomic, retain) NSString *playerStatus;


// 初始化.
-(id) initWithName:(NSString *)pName withLevel:(NSInteger) pLevel withStatus:(NSString *)pStatus;




// 重置状态.
-(void)resetStatus;


// 更新状态.
-(void)updateStatus : (NSString *) newStatus;


// 输出.
-(void)print;




// 用于 排序时， 做比较的 方法
// 这种写法， 有点象 Java 里面的那种  ICompareAble 之类的处理机制.
// 不同点在于：
//    Java 里面， 是要实现一个接口， 然后写实现的方法。 如果一个类有多种比较方式，就麻烦了。
//    Objective-C 里面，不需要额外实现其他的东西。 如果一个类有多种比较方式，那么就定义多个比较的方法。
//
-(NSComparisonResult)compareTestPlayerLevel:(TestPlayer *)other;




@end

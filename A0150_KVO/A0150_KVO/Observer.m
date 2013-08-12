//
//  Observer.m
//  A0150_KVO
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "Observer.h"

@implementation Observer


// 被观察对象的属性.
@synthesize point;



//
// 观察者对象释放资源的时候。
// 需要移除掉 前面注册的 观察的处理
// 如果不移除的话， 运行期间会抱下面这样的错误：
// An instance 0x10010bcf0 of class MyPoint was deallocated while key value observers were still registered with it.
// Observation info was leaked, and may even become mistakenly attached to some other object.
//
-(void)dealloc;
{
    [point removeObserver:self forKeyPath:@"x"];
    [point removeObserver:self forKeyPath:@"y"];
}



//
// 初始化函数.
//
-(id)initWithPoint:(MyPoint *)inPoint;
{
    if(self = [super init])
    {
        // 设置被 观察的对象.
        point = inPoint;
        
        // 新增 观察者。 观察 对象的 x 属性发生变化的情况.
        [point addObserver:self forKeyPath:@"x"
                   options:(NSKeyValueObservingOptionNew|
                            NSKeyValueObservingOptionOld)
                   context:nil];
        
        // 新增 观察者。 观察 对象的 y 属性发生变化的情况.
        [point addObserver:self forKeyPath:@"y"
                   options:(NSKeyValueObservingOptionNew|
                            NSKeyValueObservingOptionOld)
                   context:nil];
         
    }
    return self;
}





//
// 当被观察对象的 数据发生变化的时候， 调用本方法 （来 更新显示 数据）
// 
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;
{
    // 获取 更新前的数据.
    NSNumber *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    // 获取 更新后的数据.
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    
    // 如果是 x 属性发生了变化.
    if([keyPath isEqual: @"x"])
        NSLog(@"属性 x 的数值发生了变化！ 由 %f 变更为 %f",
              [oldValue floatValue],
              [newValue floatValue]);
    
    
    // 如果是 y 属性发生了变化.
    if([keyPath isEqual: @"y"])
        NSLog(@"属性 y 的数值发生了变化！ 由 %f 变更为 %f",
              [oldValue floatValue],
              [newValue floatValue]);
}


@end

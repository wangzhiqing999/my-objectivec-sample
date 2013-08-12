//
//  PrimeFinderNormal.m
//  A0131_BlockThread
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "PrimeFinderNormal.h"

@implementation PrimeFinderNormal


// 计算开始时间.
@synthesize startedDate;

// 计算结束时间.
@synthesize endedDate;

// 存储质数的结果数组.
@synthesize primes;

// 计算持续时间.
@dynamic elapsedTime;


// 初始化处理.
-(id)initWithMaxNumber:(NSInteger)inMaxNumber
{
    if(self = [super init])
    {
        // 初始化 最大处理数字.
        maxNumber = inMaxNumber;
        // 初始化 结果列表.
        primes = [[NSMutableArray alloc] init];
    }
    return self;
}


// 是否是  质数的  判断方法
-(BOOL)isPrime:(NSInteger)number
{
    for(NSInteger n = 2; n < number; ++n)
        if((number % n) == 0)
            return NO;
    return YES;
}


// 开始处理.
-(void)start
{
    // 设置 计算的 开始时间.
    [self setStartedDate:[NSDate date]];
    
    // 从2开始循环， 到最大的数字.
    for(NSInteger n = 2; n <= maxNumber; ++n)
    {
        // 调用 是否是  质数的  判断方法
        // 如果是的话， 加入结果数组.
        if([self isPrime:n])
            [primes addObject:[NSNumber numberWithInteger:n]];
    }
    
    // 设置 计算的 结束时间.
    [self setEndedDate:[NSDate date]];
}



// 计算持续时间  ＝  运行结束时间 － 运行开始时间.
-(NSTimeInterval)elapsedTime
{
    return [endedDate timeIntervalSinceDate:startedDate];
}


@end

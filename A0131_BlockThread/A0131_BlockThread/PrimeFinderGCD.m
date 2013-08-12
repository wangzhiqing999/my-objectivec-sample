//
//  PrimeFinderGCD.m
//  A0131_BlockThread
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "PrimeFinderGCD.h"

@implementation PrimeFinderGCD



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
        maxNumber = inMaxNumber;
    }
    return self;
}



// 开始处理.
-(void)start
{
    // 设置 计算的 开始时间.
    [self setStartedDate:[NSDate date]];
    
    
    // 定义用于存储结果的临时变量.
    NSMutableArray *result = [NSMutableArray array];
    
    
    // 下面为 多线程处理的代码部分 .
    
    // 声明一个队列. 
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    
    // 这里使用dispatch group。
    // 一个dispatch group可以用来将多个block组成一组以监测这些Block全部完成或者等待全部完成时发出的消息。
    // 使用函数dispatch_group_create来创建，
    // 然后使用函数dispatch_group_async来将block提交至一个dispatch queue，同时将它们添加至一个组。
    dispatch_group_t group = dispatch_group_create();
    
    
    for(NSInteger number = 2; number <= maxNumber; ++number)
    {
        
        // 这里是预先定义好， 多线程处理的时候，是处理什么事情的 Block 代码.
        dispatch_block_t isPrime = ^
        {
            // 这里是简单地 判断是否是 质数的 处理逻辑
            // 如果不是质数， 简单返回.
            for(NSInteger n = 2; n < number; ++n)
                if((number % n) == 0)
                    return;
            
            // 如果代码能够执行到这里
            // 说明当前的 number 是一个质数.
            // 需要把这个 数字， 存储到结果列表中去.
            // 因为是多线程的处理， 所以要增加 @synchronized 的代码.
            @synchronized(result)
            {
                [result addObject:[NSNumber numberWithInteger:number]];
            }
        };
        
        
        // 这句话是 多线程处理的关键.
        // dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
        // async表明异步运行
        // queue则是你把任务交给谁来处理了.
        // block代表的是你要做的事情
        //
        // 
        // 下面的处理， 就是 异步运行， 让 globalQueue 去处理前面定义的 名称为 isPrime 的 Block.
        
        // 因为多线程处理过程中， 需要把结果，存储到一个  result 中。
        // 因此这里使用  dispatch_group_async，把任务分配到一个组里面进行管理.
        dispatch_group_async(group, globalQueue, isPrime);
        
    }
    
    // 等待多线程里面，每一个组的处理，都执行完毕.
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

    
    // 设置 计算的 结束时间.
    [self setEndedDate:[NSDate date]];
    
    // 设置  最终的计算结果 
    [self setPrimes:result];
}




// 计算持续时间  ＝  运行结束时间 － 运行开始时间.
-(NSTimeInterval)elapsedTime
{
    return [endedDate timeIntervalSinceDate:startedDate];
}



@end

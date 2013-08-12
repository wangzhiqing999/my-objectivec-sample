//
//  PrimeFinderFilteredVersion.m
//  A0131_BlockThread
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "PrimeFinderFilteredVersion.h"

@implementation PrimeFinderFilteredVersion




// 计算开始时间.
@synthesize startedDate;

// 计算结束时间.
@synthesize endedDate;

// 存储质数的结果数组.
@synthesize primes;

// 存储的 原始数据的 数组.
@synthesize candidates;

// 计算持续时间.
@dynamic elapsedTime;




// 初始化处理.
-(id)initWithMaxNumber:(NSInteger)inMaxNumber
{
    if(self = [super init])
    {
        // 初始化 最大处理数字.
        maxNumber = inMaxNumber;
        
        // 初始化 原始数据的 数组
        candidates = [NSMutableArray new];
        
        // 先把 从2 到 最大处理数字的数据， 填充到  原始数据的 数组中.
        for(NSInteger n = 2; n <= inMaxNumber; ++n)
        {
            [candidates addObject:[NSNumber numberWithInteger:n]];
        }
    }
    
    return self;
}




// 一个质数计算的函数
// 接收两个参数：一个是 需要计算的数据数组， 一个是用于判断质数的 Block 函数
// 返回处理之后的 质数数组.
-(NSMutableArray *)filterArray:(NSArray *)inArray
                     withBlock:(BOOL (^)(id))block
{
    NSMutableArray *result = [NSMutableArray array];
    for(id item in inArray)
    {
        // 注意： 这里的 block 的处理逻辑，是需要外部传入的.
        if(block(item))
            [result addObject:item];
    }
    return result;
}


// 开始处理.
-(void)start
{
    
    // 设置 计算的 开始时间.
    [self setStartedDate:[NSDate date]];
    
    // 定义 用于 判断 质数的 Block 代码.
    BOOL (^isPrime)(id) = ^(id number)
    {
        NSInteger value = [number integerValue];
        for(NSInteger n = 2; n < value; n++)
            if((value % n) == 0)
                return NO;
        return YES;
    };
    
    // 调用 filterArray 函数， 传递 初始数组 和 Block 进行计算
    // 并将结果设置到 Primes 属性中去.
    [self setPrimes:[self filterArray:candidates withBlock:isPrime]];
    
    // 设置 计算的 结束时间.
    [self setEndedDate:[NSDate date]];
}


// 计算持续时间  ＝  运行结束时间 － 运行开始时间.
-(NSTimeInterval)elapsedTime
{
    return [endedDate timeIntervalSinceDate:startedDate];
}



@end

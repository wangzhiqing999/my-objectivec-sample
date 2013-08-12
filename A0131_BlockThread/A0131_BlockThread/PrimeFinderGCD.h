//
//  PrimeFinderGCD.h
//  A0131_BlockThread
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 用于计算 质数的 处理 (多线程的处理方式)
//
@interface PrimeFinderGCD : NSObject
{
    // 用于存储 计算的最大数值.
    NSInteger maxNumber;
    
    // 计算开始时间.
    NSDate *startedDate;
    
    // 计算结束时间.
    NSDate *endedDate;
    
    // 存储质数的结果数组.
    NSMutableArray *primes;
}



// 存储质数的结果数组.
@property (retain, nonatomic) NSMutableArray * primes;


// 计算开始时间.
@property (retain, nonatomic) NSDate * startedDate;


// 计算结束时间.
@property (retain, nonatomic) NSDate * endedDate;


// 计算持续时间.
@property (readonly) NSTimeInterval elapsedTime;


// 初始化处理.
-(id)initWithMaxNumber:(NSInteger)inMaxNumber;


// 开始处理.
-(void)start;



@end

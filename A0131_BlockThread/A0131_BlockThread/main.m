//
//  main.m
//  A0131_BlockThread
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "PrimeFinderNormal.h"
#import "PrimeFinderFilteredVersion.h"
#import "PrimeFinderGCD.h"




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 用于计算质数的 最大数字.
        int maxNumber = 50000;
        

        NSLog(@"使用默认的处理方式，来计算 %d 以下的质数！", maxNumber);
        
        // 初始化 质数处理类.
        PrimeFinderNormal  *pfNormal = [[PrimeFinderNormal alloc]  initWithMaxNumber:maxNumber];
        
        // 计算开始.
        [pfNormal start];
        
        NSLog(@"使用默认的处理方式，结果行数 %ld 行, 耗时 %f !", [[pfNormal primes] count], [pfNormal elapsedTime]);
        
        
        
        
        
        
        
        NSLog(@"使用 Block 的处理方式，来计算 %d 以下的质数！", maxNumber);
        
        PrimeFinderFilteredVersion *pfFilteredVersion = [[PrimeFinderFilteredVersion alloc]  initWithMaxNumber:maxNumber];
        
        // 计算开始.
        [pfFilteredVersion start];
        
        NSLog(@"使用 Block 的处理方式，结果行数 %ld 行, 耗时 %f !", [[pfFilteredVersion primes] count], [pfFilteredVersion elapsedTime]);
        

        
        
        
        
        NSLog(@"使用 GCD 多线程的处理方式，来计算 %d 以下的质数！", maxNumber);
        
        PrimeFinderGCD *pfGCD = [[PrimeFinderGCD alloc]  initWithMaxNumber:maxNumber];
        
        // 计算开始.
        [pfGCD start];
        
        NSLog(@"使用 GCD 多线程的处理方式，结果行数 %ld 行, 耗时 %f !", [[pfGCD primes] count], [pfGCD elapsedTime]);
        
        
    }
    return 0;
}


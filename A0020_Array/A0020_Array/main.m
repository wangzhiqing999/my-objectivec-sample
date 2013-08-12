//
//  main.m
//  A0020_Array
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSMutableArray+print.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        
        // 演示一个最简单的 NSArray 类的初始化，以及元素数据获取的例子。
        // 需要注意：
        //    1.使用 NSArray 类的 arrayWithObjects 方法进行初始化.
        //    2.数组的最后一个元素， 需要是 nil
        
        // Create an array to contain the month names
        NSArray *monthNamesArray = [NSArray arrayWithObjects:
                               @"January",
                               @"February",
                               @"March",
                               @"April",
                               @"May",
                               @"June",
                               @"July",
                               @"August",
                               @"September",
                               @"October",
                               @"November",
                               @"December", nil ];
        
        int   i;
        
        
        // Now list all the elements in the array
        printf ("Month  Name\n=====  ====\n");
        
        
        // 通过 [数组对象名 count] 来取得  数组的  长度.
        // 通过 [数组对象名  objectAtIndex : i] 来取得数组中，指定位置的对象。
        for (i = 0; i < [monthNamesArray count]; ++i)
            printf (" %2i   %s\n", i + 1,
                    [[monthNamesArray objectAtIndex: i] cString]);
        

        // 也可以通过 象 C# 中的那种 For each 的方式来 遍历数组.
        for(NSString *item  in monthNamesArray)
        {
            NSLog(@"Use for(in) --- %@", item);
        }
        
        
        // 也可以象访问数据库游标的那种方式 不断的 Next 来获取数据.
        NSEnumerator *enumerator = [monthNamesArray objectEnumerator];
        NSString *item = nil;
        while((item = [enumerator nextObject]))
        {
            NSLog(@"Use while(nextObject) --- %@", item);
        }
        
        
        // reverseObjectEnumerator 是 从数组最后一个， 向前遍历了.
        enumerator = [monthNamesArray reverseObjectEnumerator];
        item = nil;
        while((item = [enumerator nextObject]))
        {
            NSLog(@"Use while(nextObject) (逆序) --- %@", item);
        }
        
        
        
        // 获取 数组的 第一个元素， 使用 objectAtIndex
        NSString *firstMonth = [monthNamesArray objectAtIndex:0];
        
        // 获取 数组的 最后一个元素， 使用 lastObject
        // 可以不用  objectAtIndex : count - 1 了.
        NSString *lastMonth = [monthNamesArray lastObject];
        
        NSLog(@"数组第一个元素 %@", firstMonth);
        NSLog(@"数组最后一个元素 %@", lastMonth);
        
        
        NSInteger testIndex = [monthNamesArray indexOfObject:@"May"];
        NSLog(@"May 在数组中的位置是 %ld", testIndex);

        testIndex = [monthNamesArray indexOfObject:@"如果不存在"];
        NSLog(@"不存在的数据，在数组中的位置是 %ld", testIndex);
        
        
        
        
        
        NSLog(@"###  获取一个 数组的 子集的处理.");
        
        // 定义一个 范围： 从数组的第1个元素开始（数组从0开始的）， 长度是3
        NSRange range;
        range.location = 1;
        range.length = 3;
        
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        
        NSArray *subItems = [monthNamesArray objectsAtIndexes:indexSet];
        
        for(NSString *item  in subItems)
        {
            NSLog(@"数组的子集 --- %@", item);
        }
        
        
        
        
        
        // ========================================
        // 上面是 只读的 NSArray 数组的处理.
        // 下面是 可变的 NSMutableArray 数组的处理.
        // ========================================
        
        
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:@"foo"];
        [array addObject:@"baz"];
        
        [array printNSString:@"addObject （新增）两次以后的数组内容:"];

        
        [array insertObject:@"bar" atIndex:1];
        
        
        [array printNSString:@"insertObject  atIndex:1  （指定位置插入）以后的数组内容:"];

        
        // now [@”foo”, @”bar”, @”baz]
        [array removeLastObject];
        
        [array printNSString:@"removeLastObject （删除最后一个）以后的数组内容:"];

        
        // now [@”foo”, @”bar”]
        [array removeObjectAtIndex:0];
        
        [array printNSString:@"removeObjectAtIndex:0 （删除第一个）以后的数组内容:"];
        
        
        // now [@”bar”]
        [array replaceObjectAtIndex:0 withObject:@"boz"];
        
        [array printNSString:@"replaceObjectAtIndex:0 withObject:（修改数组内容）以后的数组内容:"];
        // now [@”boz”]
        
        
        
        
        
        
        NSLog(@"＃＃＃ 通过一个求 50 以内质数的例子，来演示 NSMutableArray 类使用的例子。");
        
        int   p, prevPrime;
        unsigned long n;
        BOOL  isPrime;
        
        
        
        // 使用 arrayWithCapacity 来创建一个指定长度的 数组.
        // Create an array to store the prime numbers
        NSMutableArray *primes =
	    [NSMutableArray arrayWithCapacity: 20];
        
        
        
        // 通过 addObject 方法，把 对象 加入数组.
        // Store the first two primes (2 and 3) into the array
        [primes addObject: [NSNumber numberWithInt: 2]];
        [primes addObject: [NSNumber numberWithInt: 3]];
        
        
        
        // Calculate the remaining primes
        for (p = 5; p <= 50; p += 2) {
            // we're testing to see if p is prime
            isPrime = YES;
            i = 1;
            
            
            // 查询，当前数据，可以被 数组里面的数据整除.
            // 如果存在有，那么 设置标志位.
            do {
                // objectAtIndex 为取得 数组 指定位置的数据.
                prevPrime = [[primes objectAtIndex: i] intValue];
                if (p % prevPrime == 0)
                    isPrime = NO;
                ++i;
            } while ( isPrime == YES && p / prevPrime >= prevPrime);
            
            
            // 如果 不存在有数字可以被整除. 那么通过 addObject 方法，加入数组.
            if (isPrime)
                [primes addObject: [NSNumber numberWithInt: p]];
        }
        
        
        
        // 显示结果.
        // 首先取得 数组的 count.  也就是长度.
        n = [primes count];
        
        
        
        // 循环处理.
        for (i = 0; i < n; ++i)
            printf ("%i ", [[primes objectAtIndex: i] intValue]);
        
        
        printf ("\n");
        

        
    }
    return 0;
}


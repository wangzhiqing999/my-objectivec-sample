//
//  main.m
//  A0050_Set
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSSet+Printing.h"


// Create an integer object
// 下面这行代码，  是一个  宏定义的代码.
#define INTOBJ(v) [NSNumber numberWithInt: v]




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        // 通过 setWithObjects 初始化一个 Set.
        NSMutableSet *set1 = [NSMutableSet setWithObjects:
                              INTOBJ(1), INTOBJ(3), INTOBJ(5), INTOBJ(10), nil];
        
        // 通过 setWithObjects 初始化一个 Set.
        NSSet *set2 = [NSSet setWithObjects:
                       INTOBJ(-5), INTOBJ(100), INTOBJ(3), INTOBJ(5), nil];
        
        // 通过 setWithObjects 初始化一个 Set.
        NSSet *set3 = [NSSet setWithObjects:
                       INTOBJ(12), INTOBJ(200), INTOBJ(3), nil];
        
        
        printf ("set1: "); [set1 print];
        printf ("set2: "); [set2 print];
        
        
        // 比较两个 Set 是否一致.
        if ([set1 isEqualToSet: set2] == YES)
            NSLog (@"set1 与 set2 相等. \n");
        else
            NSLog (@"set1 与 set2 不相等. \n");
        
        
        // 成员关系测试.
        if ([set1 containsObject: INTOBJ(10)] == YES)
            NSLog (@"set1 包含 10 这个数字. \n");
        else
            NSLog (@"set1 不包含 10 这个数字. \n");
        
        
        if ([set2 containsObject: INTOBJ(10)] == YES)
            NSLog (@"set2 包含 10 这个数字.\n");
        else
            NSLog (@"set2 不包含 10 这个数字.\n");
        
        
        // 尝试 从 Set 中， 添加 / 删除 数据.
        [set1 addObject: INTOBJ(4)];
        [set1 removeObject: INTOBJ(10)];
        NSLog (@"向 set1 中 addObject 4 并 removeObject 10: ");
        [set1 print];
        
        // intersection 2个 sets
        [set1 intersectSet: set2];
        printf ("set1 intersect set2: ");
        [set1 print];
        
        
        // union 2个 sets
        [set1 unionSet:set3];
        printf ("set1 union set3: "); [set1 print];
        
        
        
        
        
        
        NSSet *set = [NSSet setWithObjects:@"one", @"two", @"three", nil];
        
        NSLog(@"输出 Set 中存在的元素：%@", [set member:@"two"]);
        NSLog(@"输出 Set 中不存在的元素：%@", [set member:@"ten"]);
        
        NSLog(@"输出 Set 中任意一个元素：%@", [set anyObject]);
        NSLog(@"输出 Set 中任意一个元素：%@", [set anyObject]);
        
        
        NSLog(@"输出 Set 中全部的元素：%@", [set allObjects]);
              
        NSLog(@"输出 Set 中是否包含 two = %hhd", [set containsObject:@"two"]);
        
        NSLog(@"输出 Set 中是否包含 ten = %hhd", [set containsObject:@"ten"]);
        
        
        
        for(NSString *item in set)
        {
            NSLog(@"for(in Set) 遍历 Set 数据 ＝ %@", item);
        }
        
        NSEnumerator *enumerator = [set objectEnumerator];
        NSString *item = nil;
        while((item = [enumerator nextObject]))
        {
            NSLog(@"while(nextObject) 遍历 Set 数据 ＝ %@", item);
        }
              
    }
    return 0;
}


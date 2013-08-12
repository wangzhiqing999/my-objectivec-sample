//
//  main.m
//  A0021_ArrayPlus
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestPlayer.h"


extern NSInteger sortByPlayerName(id player1, id player2, void *ctx);



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TestPlayer *tp1 = [[TestPlayer alloc] initWithName:@"B2" withLevel:1 withStatus:@"INIT"];
        TestPlayer *tp2 = [[TestPlayer alloc] initWithName:@"D4" withLevel:10 withStatus:@"CLOSE"];
        TestPlayer *tp3 = [[TestPlayer alloc] initWithName:@"C3" withLevel:5 withStatus:@"ACTIVE"];
        TestPlayer *tp4 = [[TestPlayer alloc] initWithName:@"A1" withLevel:15 withStatus:@"ACTIVE"];
        
        NSArray *playerArray = [NSArray arrayWithObjects:
                                tp1, tp2, tp3, tp4, nil];
        
        NSLog(@"先遍历输出一次.");
        for(TestPlayer *tp in playerArray)
        {
            [tp print];
        }
        
        
        
        // ==================================================
        // 上面是  初始的数据定义.
        // 下面是  批处理的例子代码
        // ==================================================
        
        // 开始  批量 对数组中的每一个数据.
        // 执行 对象的 resetStatus 方法.
        [playerArray makeObjectsPerformSelector:@selector(resetStatus)];
        
        NSLog(@"观察， 状态是否正确的被 重置了.");
        for(TestPlayer *tp in playerArray)
        {
            [tp print];
        }
        
        // 开始  批量 对数组中的每一个数据.
        // 执行 对象的 updateStatus 方法. 传递参数为 CLOSE.
        [playerArray makeObjectsPerformSelector:@selector(updateStatus:) withObject:@"CLOSE"];
        
        NSLog(@"观察， 状态是否正确的被 更新为 CLOSE.");
        for(TestPlayer *tp in playerArray)
        {
            [tp print];
        }
        
        
        
        // ==================================================
        // 上面是  批处理的例子代码
        // 下面是  排序的例子代码
        // ==================================================
        
        // 测试 排序处理。
        NSMutableArray *mPlayerArray = [[NSMutableArray alloc] init];
        [mPlayerArray addObject:tp1];
        [mPlayerArray addObject:tp2];
        [mPlayerArray addObject:tp3];
        [mPlayerArray addObject:tp4];
        
        // 设定排序规则. 按照 playerLevel 属性， 升序排列.
        NSSortDescriptor *descr =
            [NSSortDescriptor sortDescriptorWithKey:@"playerLevel"
                                      ascending:YES];
        NSArray *descriptors = [NSArray arrayWithObject:descr];
        
        [mPlayerArray sortUsingDescriptors:descriptors];
        
        NSLog(@"观察， 数据是否正确被 按等级 排序.");
        for(TestPlayer *tp in mPlayerArray)
        {
            [tp print];
        }
        
        
        
        // 使用 一个  特定的 排序方法， 对 数据进行排序.
        [mPlayerArray sortUsingFunction:sortByPlayerName context:nil];
        
        NSLog(@"观察， 数据是否正确被 按姓名 排序.");
        for(TestPlayer *tp in mPlayerArray)
        {
            [tp print];
        }
        
        
        
        // 使用 定义在 类里面的一个 比较方法， 对 数据进行排序.
        [mPlayerArray sortUsingSelector:@selector(compareTestPlayerLevel:)];
        
        NSLog(@"观察， 数据是否正确被 按等级 排序.");
        for(TestPlayer *tp in mPlayerArray)
        {
            [tp print];
        }
        
        
        
        // ==================================================
        // 上面是  排序的例子代码
        // 下面是  筛选数据的例子代码
        // ==================================================
        
        
        NSPredicate *predicate = [NSPredicate
                                  predicateWithFormat:@"playerLevel >= 10"];
        
        NSArray *advPlayerArray =[mPlayerArray filteredArrayUsingPredicate:predicate];
        
        
        NSLog(@"观察， 等级是否都是 大于等于 10  .");
        for(TestPlayer *tp in advPlayerArray)
        {
            [tp print];
        }
        
        
        
        
        // ==================================================
        // 上面是  筛选数据的例子代码
        // 下面是  Block相关的例子代码
        // ==================================================
        
        
        __block NSMutableArray *result = [NSMutableArray array];
        
        void (^theBlock)(id obj, NSUInteger idx, BOOL *stop) =
        ^(id obj, NSUInteger idx, BOOL *stop)
        {
            [result addObject:obj];
        };
        
        [playerArray enumerateObjectsUsingBlock:theBlock];
        
        
        NSLog(@"观察， Block 临时数组内数据是否已填充.");
        for(TestPlayer *tp in result)
        {
            [tp print];
        }
        
        
    }
    return 0;
}



//
// 用于比较 两个 player . 比较的算法为， 按 名称进行比较.
//
NSInteger sortByPlayerName(id player1, id player2, void *ctx)
{
    return [[player1 playerName]
            compare:[player2 playerName]];
}


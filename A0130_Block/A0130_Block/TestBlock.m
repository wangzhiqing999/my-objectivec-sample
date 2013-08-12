//
//  TestBlock.m
//  A0130_Block
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestBlock.h"

@implementation TestBlock




//
// 用于 测试 类的方法， 接受 Block 参数的例子。
//
-(NSMutableArray *)filterArray:(NSArray *)inArray
                     withBlock:(BOOL (^)(NSInteger))block
{
    
    // 初始化 预期的结果对象。
    NSMutableArray *result = [NSMutableArray array];
    
    // 遍历 参数中的 数字列表.
    for(NSNumber *number in inArray)
    {
        // 调用 Block， 如果返回 YES ， 那么将当前数字， 加入结果列表.
        if(block([number integerValue]))
            [result addObject:number];
    }
    
    // 返回结果.
    return result;
}




//
// 用于调试输出 数组内容。
//
-(void) showArrayInfo:(NSArray *)inArray
{
    for(int i = 0; i < [inArray count]; i ++) {
        NSLog(@"%@",  [inArray objectAtIndex:i]);
    }
}


@end

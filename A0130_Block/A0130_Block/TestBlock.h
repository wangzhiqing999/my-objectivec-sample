//
//  TestBlock.h
//  A0130_Block
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestBlock : NSObject



//
// 用于 测试 类的方法， 接受 Block 参数的例子。
//
-(NSMutableArray *)filterArray:(NSArray *)inArray
                     withBlock:(BOOL (^)(NSInteger))block;



//
// 用于调试输出 数组内容。
//
-(void) showArrayInfo:(NSArray *)inArray;


@end

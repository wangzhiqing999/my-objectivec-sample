//
//  TestPlayer.m
//  A0021_ArrayPlus
//
//  Created by wangzhiqing on 13-8-8.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestPlayer.h"

@implementation TestPlayer


@synthesize playerName;

@synthesize playerLevel;

@synthesize playerStatus;




// 初始化.
-(id) initWithName:(NSString *)pName withLevel:(NSInteger) pLevel withStatus:(NSString *)pStatus;
{
    if(self = [super init])
    {
        [self setPlayerName:pName];
        [self setPlayerLevel:pLevel];
        [self setPlayerStatus:pStatus];
    }
    
    return self;
}


// 重置状态.
-(void)resetStatus;
{
    playerStatus = @"INIT";
}


// 更新状态.
-(void)updateStatus : (NSString *) newStatus;
{
    playerStatus = newStatus;
}



// 输出.
-(void)print;
{
    NSLog(@"玩家:%@  等级:%ld  状态:%@", playerName, playerLevel, playerStatus);
}


// 排序时的比较方法.
-(NSComparisonResult)compareTestPlayerLevel:(TestPlayer *)other;
{
    if([self playerLevel] > [other playerLevel])
    {
        return  NSOrderedDescending;
    }
    if([self playerLevel] < [other playerLevel])
    {
        return NSOrderedAscending;
    }
    return NSOrderedSame;
}



@end

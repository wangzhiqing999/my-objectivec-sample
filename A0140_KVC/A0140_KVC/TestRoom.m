//
//  TestRoom.m
//  A0140_KVC
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestRoom.h"

@implementation TestRoom


// 房间的标题 属性.
@synthesize roomTitle;



// 房间的门 （用于测试  one to one） 属性.
@synthesize testDoor;



// 窗口数组 (用于测试  one to many) 属性.
@synthesize testWindowsArray;



// 房间的价钱
@synthesize roomMoney;




// 初始化函数.
-(id)initWithRoomName:(NSString *) roomName
{
    if( self =[super init] )
    {
        // 初始化 房间名称
        roomTitle = roomName;
        // 初始化窗口数组.
        testWindowsArray = [[NSMutableArray alloc] init];
    }
         
    return self;
}

         
// 显示房间信息的函数.
-(void)showRoomInfo
{
    NSLog(@"房间名称: %@  价格: %ld  . 房门标题: %@  价格: %ld ", roomTitle , roomMoney,  [testDoor doorTitle],  [testDoor doorMoney]);
    NSLog(@"窗口数量: %ld ", [testWindowsArray count]);
    for(int i = 0; i < [testWindowsArray count]; i ++)
    {
        TestWindows *testWin = [testWindowsArray objectAtIndex: i];
        NSLog(@"第 %d 个窗口的标题: %@", i+1, [testWin windowsTitle]);
    }
}


// 静态函数， 用于返回一个 默认的 测试用的房间类对象.
+(TestRoom *)getDefaultTestRoom {
    
    // 初始化 预期结果.
    TestRoom * result = [[TestRoom alloc] initWithRoomName:@"测试专用房间"];
    [result setRoomMoney:100000];
    
    
    // 初始化一个 门.
    TestDoor *resultDoor = [[TestDoor alloc] init];
    [resultDoor setDoorTitle:@"测试专用门"];
    [resultDoor setDoorMoney: 1000];
    
    // 将门设置到 房间类的  门属性上面.
    [result setTestDoor:resultDoor];
    
    
    // 设置6扇窗户.
    for(int i =0; i<6; i++)
    {
        TestWindows *resultWindos = [[TestWindows alloc] init];
        
        NSString *testWindowsName =@"窗口：";
        testWindowsName = [testWindowsName stringByAppendingFormat:@"%d", i+1];
        
        [resultWindos setWindowsTitle:testWindowsName];
        [resultWindos setWindowsMoney:1000*(i+1)];
        
        // 将窗口 加入到 房间的 窗口数组中.
        [[result testWindowsArray]  addObject:resultWindos];
    }
    
    
    
    // 返回结果。
    return result;
}


@end

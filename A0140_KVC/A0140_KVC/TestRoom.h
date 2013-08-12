//
//  TestRoom.h
//  A0140_KVC
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestDoor.h"
#import "TestWindows.h"

//
// 用于测试  KVC 使用的   房间类.
//
@interface TestRoom : NSObject
{
    
    // 房间的标题.
    NSString *roomTitle;
    
    
    // 房间的门 （用于测试  one to one）
    TestDoor *testDoor;
    
    
    // 窗口数组 (用于测试  one to many)
    NSMutableArray  *testWindowsArray;
    
    
    
    // 房间的价钱
    NSInteger roomMoney;
    
    
}



// 房间的标题 属性.
@property(nonatomic, retain) NSString *roomTitle;


// 房间的门 （用于测试  one to one） 属性.
@property(nonatomic, retain) TestDoor *testDoor;


// 窗口数组 (用于测试  one to many) 属性.
@property(retain) NSMutableArray  *testWindowsArray;


// 房间的价钱
@property(nonatomic) NSInteger roomMoney;



// 初始化函数.
-(id)initWithRoomName:(NSString *) roomName;


// 显示房间信息的函数.
-(void)showRoomInfo;


// 静态函数， 用于返回一个 默认的 测试用的房间类对象.
+(TestRoom *)getDefaultTestRoom;


@end

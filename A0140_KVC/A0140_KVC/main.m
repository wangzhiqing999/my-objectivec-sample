//
//  main.m
//  A0140_KVC
//
//  Created by wangzhiqing on 13-8-6.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestDoor.h"
#import "TestWindows.h"
#import "TestRoom.h"

extern void normalCall();
extern void kvcCall();



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        normalCall();
        
        
        kvcCall();
    }
    return 0;
}




// 普通的属性调用.
void normalCall()
{
    // 构造测试类
    TestRoom *myTestRoom = [TestRoom getDefaultTestRoom];
    
    // 简单输出。
    // [myTestRoom showRoomInfo];
    
    
    // 通过 普通方式， 来获取 房间类里面的 门／窗 的属性.
    NSLog(@"普通方式获取房间类 房间的标题 = %@", [myTestRoom roomTitle]);
    
    NSLog(@"普通方式获取房间类 门的标题 = %@", [[myTestRoom testDoor] doorTitle]);
    
    
    NSLog(@"普通方式获取房间类 窗户的数量 = %ld", [[myTestRoom testWindowsArray] count]);
    
    // 平均窗口金额.
    NSInteger windowsMoneyAvg = 0;

    // 最大窗口金额.
    NSInteger windowsMoneyMax = 0;
    // 最大窗口金额.
    NSInteger windowsMoneyMin = 0;
    
    // 合计窗口金额.
    NSInteger windowsMoneySum = 0;
    
    
    for(int i = 0; i < [[myTestRoom testWindowsArray] count]; i++)
    {
        TestWindows *testWin = [[myTestRoom testWindowsArray] objectAtIndex:i];
        
        // 计算合计.
        windowsMoneySum +=  [testWin windowsMoney];
        
        // 计算最大值.
        if(windowsMoneyMax < [testWin windowsMoney])
        {
            windowsMoneyMax = [testWin windowsMoney];
        }
        
        // 计算最小值.
        if(windowsMoneyMin == 0 || windowsMoneyMin > [testWin windowsMoney])
        {
            windowsMoneyMin = [testWin windowsMoney];
        } 
        
    }
    
    // 计算平均值.
    windowsMoneyAvg = windowsMoneySum / [[myTestRoom testWindowsArray] count];
    
    
    NSLog(@"普通方式获取房间类 窗户的总金额 = %ld", windowsMoneySum);
    NSLog(@"普通方式获取房间类 窗户的金额平均值 = %ld", windowsMoneyAvg);
    NSLog(@"普通方式获取房间类 窗户的最大金额 = %ld", windowsMoneyMax);
    NSLog(@"普通方式获取房间类 窗户的最小金额 = %ld", windowsMoneyMin);
    
    
    TestWindows *testWin3 = [[myTestRoom testWindowsArray] objectAtIndex:2];
    
    NSLog(@"普通方式获取房间类 第三扇窗的标题 = %@", [testWin3 windowsTitle]);
    
    
    
    // 通过 普通方式， 来修改 房间类里面的 门／窗 的属性.
    NSLog(@"普通方式修改房间类 房间／门／窗的标题");
    [myTestRoom setRoomTitle:@"新的普通房间"];
    [[myTestRoom testDoor] setDoorTitle : @"新的普通门"];
    [[[myTestRoom testWindowsArray] objectAtIndex:2] setWindowsTitle:@"新的普通窗"];
    
    // 简单输出。
    [myTestRoom showRoomInfo];
}




// 使用 Key Value Coding 方式的调用.
// Key Value Coding 的处理机制， 和 C#/Java 的  反射处理机制很相像.
//
// Objective-C 里面， 还有特殊的 ，用于统计的 函数。
// 包含 @avg  @count  @max  @min  @sum
//
void kvcCall()
{
    // 构造测试类
    TestRoom *myTestRoom = [TestRoom getDefaultTestRoom];
    
    // 简单输出。
    // [myTestRoom showRoomInfo];
    
    
    // 通过 KVC 方式， 来获取 房间类里面的 门／窗 的属性.
    
    NSLog(@"KVC方式获取房间类 房间的标题 = %@", [myTestRoom valueForKey : @"roomTitle"]);

    NSLog(@"KVC方式获取房间类 门的标题 = %@", [myTestRoom valueForKeyPath :@"testDoor.doorTitle" ] );
    
    NSLog(@"KVC方式获取房间类 窗户的数量 = %@", [myTestRoom valueForKeyPath: @"testWindowsArray.@count"]);
    
    NSLog(@"KVC方式获取房间类 窗户的总金额 = %@", [myTestRoom valueForKeyPath: @"testWindowsArray.@sum.windowsMoney"]);
    
    NSLog(@"KVC方式获取房间类 窗户的金额平均值 = %@", [myTestRoom valueForKeyPath: @"testWindowsArray.@avg.windowsMoney"]);
    
    NSLog(@"KVC方式获取房间类 窗户的最大金额 = %@", [myTestRoom valueForKeyPath: @"testWindowsArray.@max.windowsMoney"]);
    
    NSLog(@"KVC方式获取房间类 窗户的最小金额 = %@", [myTestRoom valueForKeyPath: @"testWindowsArray.@min.windowsMoney"]);
    
    
    
    
    TestWindows *testWin3 = [[myTestRoom testWindowsArray] objectAtIndex:2];
    
    NSLog(@"KVC方式获取房间类 第三扇窗的标题 = %@", [testWin3  valueForKey : @"windowsTitle"]);

    
    NSLog(@"KVC方式修改房间类 房间／门／窗的标题");
    
    [myTestRoom setValue:@"新的KVC房间" forKey:@"roomTitle"];
    
    [myTestRoom setValue:@"新的KVC门" forKeyPath:@"testDoor.doorTitle"];
     
    [[[myTestRoom testWindowsArray] objectAtIndex:2] setValue:@"新的KVC窗" forKey:@"windowsTitle" ];
    
    // 简单输出。
    [myTestRoom showRoomInfo];
    
}

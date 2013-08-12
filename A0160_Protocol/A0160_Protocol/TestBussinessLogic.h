//
//  TestBussinessLogic.h
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializableProtocol.h"


//
// 本类是 使用 协议（Protocol） 的一个类。
//
// 
//
@interface TestBussinessLogic : NSObject
{
    //
    // 某些业务逻辑数据.
    //
    NSString *someBusinessData;
    
    
    //
    // 这里通过  id<协议名>
    // 来实现 本类不知道 具体的实现类是什么， 仅仅需要满足协议的就可以了。
    //
    // 用 Java/C# 的说法， 就是 不知道具体的实现类是什么，仅仅需要知道，满足接口即可
    //
    id<SerializableProtocol> serializableProtocol;
    
}


//
//  某些业务逻辑数据的属性.
//
@property NSString *someBusinessData;



//
// 协议实现类的属性
//
@property id<SerializableProtocol> serializableProtocol;


//
// 测试业务逻辑。
//
-(void) doTest;


@end

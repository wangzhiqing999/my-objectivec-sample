//
//  NetworkSerializable.h
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializableProtocol.h"



//
// 这个是一个 用于学习  协议的 例子.
// 本类是 一个  实现 SerializableProtocol 协议的 类。
//
// 预期的 协议， 是序列化的处理.
// 把对象 存储到指定设备上 ， 以及 从指定设备上读取出来.
// 本类模拟 把类存储到 网络上面。
//
@interface NetworkSerializable : NSObject<SerializableProtocol>
{
    // 网络地址.
    NSString *networkAddress;
}



// 网络地址.
@property (nonatomic, retain) NSString *networkAddress;




@end

//
//  SerializableProtocol.h
//  A0160_Protocol
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



//
// 这个是一个 用于学习  协议的 例子.
// Objective-C 中的 协议（Protocol）
// 功能上有点象 Java/C# 中的  接口（Interface）
//
// Java/C# 不支持 一个类 继承多个类. 但是支持 一个类 实现多个接口（Interface）.
// Objetive-C 不支持 一个类 继承多个类. 但是支持 一个类 实现多个协议（Protocol）.
//
@protocol SerializableProtocol <NSObject>


//
// 实现将对象 存储起来的处理.
// @required 意味着  实现本协议的类， 必须要实现本方法。
//
@required
-(NSInteger) WriteObject : (id) object;



//
// 实现 读取对象的处理.
// @required 意味着  实现本协议的类， 必须要实现本方法。
//
@required
-(id) ReadObject : (NSInteger) objectID;



//
// 实现 显示对象的数据。
// @optional 意味着  实现本协议的类， 不是必须要实现本方法。
//
@optional
-(void) DisplayObject : (NSInteger) objectID;


@end

//
//  MyHelloWorld.h
//  A0100_BaseClassDefine
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//



// 定义一个新类分为2部分：
// @interface部分
//     描述类、类的数据成分以及类的方法
// @implementation部分
//     实现这些方法的实际代码
//
// 本文件是 这个类的 “interface部分”



#import <Foundation/Foundation.h>



// 定义一个新类分为2部分：
// @interface部分
//     描述类、类的数据成分以及类的方法
// @implementation部分
//     实现这些方法的实际代码
//
// 本文件是 这个类的 “interface部分”
@interface MyHelloWorld : NSObject {
    // 这里定义类的私有的变量.
    NSString * _userName;
}








// ------------------------------
// 定义类的外部访问的方法.
//     - 开头的，表示实例方法 （调用前需要创建类的实例）
// ------------------------------

// 定义一个初始化方法. ( 也可以理解为构造函数 )
-(id) initWithUserName:(NSString *)userName;






// 定义一个普通的方法.
-(void)helloWorld;


// 定义一个 单参数的方法.
-(void)helloWorldOne : (NSString *) helloOne;


// 定义两个参数的方法,
-(void)helloWorldTwo : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo;


// 定义三个参数的方法,
-(void)helloWorldThree : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo  theHelloThree: (NSString *) helloThree;



// 定义一个普通的方法.
-(void)publicHelloWorld;





// ------------------------------
//  定义类的静态方法  + 开头的 表示静态
// ------------------------------

// 定义一个类的方法  （也可以理解为 静态方法）
// 此类方法调用的时候， 不需要先初始化一个类的实例.
+(void)sayHelloWorld;


// 定义一个 单参数的方法.
+(void)sayHelloWorldOne : (NSString *) helloOne;


// 定义两个参数的方法,
+(void)sayHelloWorldTwo : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo;


// 定义三个参数的方法,
+(void)sayHelloWorldThree : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo  theHelloThree: (NSString *) helloThree;






// 定义结束的关键字.
@end

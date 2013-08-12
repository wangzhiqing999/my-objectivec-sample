// 定义一个新类分为2部分：
// @interface部分
//     描述类、类的数据成分以及类的方法
// @implementation部分
//     实现这些方法的实际代码
//
// 本文件是 这个类的  “implementation部分”




//
//  MyHelloWorld.m
//  A0100_BaseClassDefine
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//



// 指定引用的 头文件定义.
// 此行 在 Xcode 开发环境中， 新建类的时候， 会自动生成。
#import "MyHelloWorld.h"



// 类定义的实现
@implementation MyHelloWorld



// 初始化类方法的实现.
-(id) initWithUserName:(NSString *)userName {
    // ------------------------------
    // 调用父类的初始化方法.
    // ------------------------------
    self = [super init];
    
    
    // 当前初始化方法中， 需要 处理的代码.
    _userName = [userName copy];
    
    
    // ------------------------------
    // 返回类的ID. (相当于返回指针)
    // ------------------------------
    return self;
}







// 普通的方法的实现.
-(void)helloWorld {
    NSString *text = [NSString stringWithFormat:@"%@, Hello World!(无参数)", _userName];
    NSLog(@"%@", text);
}



// 单参数的方法的实现.
-(void)helloWorldOne : (NSString *) helloOne {
    NSString *text = [NSString stringWithFormat:@"%@, Hello World! %@ ！(1参数)", _userName, helloOne];
    NSLog(@"%@", text);
}



// 定义多个参数的方法,
-(void)helloWorldTwo : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo {
    NSString *text = [NSString stringWithFormat:@"%@, Hello World! %@ ！ %@ ！(2参数)", _userName, helloOne, helloTwo];
    NSLog(@"%@", text);
}



// 定义三个参数的方法,
-(void)helloWorldThree : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo  theHelloThree: (NSString *) helloThree {
    NSString *text = [NSString stringWithFormat:@"%@, Hello World! %@ ！ %@ ！ %@ ！(3参数)", _userName, helloOne, helloTwo, helloThree];
    NSLog(@"%@", text);
}






// 定义的  private （私有的）方法
// 定义方式就是  不要在  .h 文件中定义，  只在  .m  文件中定义即可。
// 这种定义方式，  和 Oracle 的 Package 处理的方式很类似。
// 就是在 头 上定义的， 就是对外公有的。  头上没有定义， 在内部代码上定义了，就是私有的。
-(void)privateHelloWorld {
    NSLog(@"如果存在有某些方法， 是 private 级别的， 不要在 .h 文件那里定义， 然后只需要简单的 － 就可以了。");
}


//  public 的方法.
-(void)publicHelloWorld {
    NSLog(@"本方法是 定义在 .h 文件中的， 相当于  public 的方法！ 本方法目的是为了测试 在 public 方法中，调用 private 的方法！");
    
    // 注意： 这里的  [self privateHelloWorld]  相当于 C# 中的 this.privateHelloWorld();
    [self privateHelloWorld];
}






// 定义一个类的方法  （也可以理解为 静态方法）
// 此类方法调用的时候， 不需要先初始化一个类的实例.
+(void)sayHelloWorld{
    NSLog(@"静态方法 sayHelloWorld 调用！");
}


// 定义一个 单参数的方法.
+(void)sayHelloWorldOne : (NSString *) helloOne {
    NSLog(@"静态方法 sayHelloWorldOne 调用！参数:%@", helloOne);
}


// 定义两个参数的方法,
+(void)sayHelloWorldTwo : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo {
    NSLog(@"静态方法 sayHelloWorldTwo 调用！参数:%@, %@", helloOne, helloTwo);
}


// 定义三个参数的方法,
+(void)sayHelloWorldThree : (NSString *) helloOne  theHelloTwo: (NSString *) helloTwo  theHelloThree: (NSString *) helloThree {
    NSLog(@"静态方法 sayHelloWorldTwo 调用！参数:%@, %@, %@", helloOne, helloTwo, helloThree);
}







@end

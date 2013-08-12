//
//  main.m
//  A0005_NsValue
//
//  Created by wangzhiqing on 13-8-9.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// 本项目用于  演示  NSValue 的使用.
//
// 一个NSValue对象是用来存储一个C或者Objective－C数据的简单容器。
// 它可以保存任意类型的数据，比如int，float，char，当然也可以是指pointers, structures, and object ids。
// NSValue类的目标就是允许以上数据类型的数据结构能够被添加到集合里，例如那些需要其元素是对象的数据结构，如NSArray或者NSSet的实例。
// 需要注意的是NSValue对象一直是不可枚举的。
//




//
// 用于测试的一个 结构体.
//
typedef struct
{
    // 代码.
    int id;
    // 高度.
    float height;
    // 标志.
    unsigned char flag;
} MyTestData;




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 定义结构体 ， 并设置数据.
        MyTestData item1;
        item1.id = 10001;
        item1.height = 1.75;
        item1.flag = 'C';
        
        
        MyTestData item2;
        item2.id = 10002;
        item2.height = 1.80;
        item2.flag = 'B';
        
        
        // 直接把一个 结构体， 简单加入 NSArray 将导致编译错误.
        // 因为 arrayWithObjects 接收的参数， 需要是 Object.
        
        // 下面这行  将编译出错.
        // NSArray *testArray = [NSArray arrayWithObjects:item1, item2, nil];
        
        
        // 这种情况下， 需要把 结构体， 封装到一个 NSValue 里面， 然后再加入 NSArray
        
        NSArray *testArray = [NSArray arrayWithObjects:
                              [NSValue value:&item1
                                withObjCType:@encode(MyTestData)],
                              [NSValue value:&item2
                                withObjCType:@encode(MyTestData)], nil];
        
        // ==================================================
        // 上面是把 结构体 装箱到 NSValue 里面的处理代码.
        // 下面是 从 NSValue 拆箱的处理代码.
        // ==================================================
        
        for(NSValue *testValue in testArray)
        {
            // 声明结构体， 准备用于存储 拆箱后的 数据.
            MyTestData testData;
            
            // 通过 getValue 方法进行处理.
            [testValue getValue: &testData];
            
            NSLog(@"id=%d; heigth=%f; flag=%c", testData.id, testData.height, testData.flag );
        }
        
    }
    return 0;
}


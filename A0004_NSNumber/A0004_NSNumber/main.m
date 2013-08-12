//
//  main.m
//  A0004_NSNumber
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



//
// 本例子用于 演示 NSNumber 的使用.
// 
//
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 测试对象.
        NSNumber          *myNumber, *floatNumber, *intNumber;
        
        // integer value
        intNumber = [NSNumber numberWithInt: 100];
        NSLog (@"使用 numberWithInt 初始化：%i\n", [intNumber intValue]);
        
        // long value
        myNumber = [NSNumber numberWithLong: 0xabcdef];
        NSLog (@"使用 numberWithLong 初始化：%li\n", [myNumber longValue]);
        
        // char value
        myNumber = [NSNumber numberWithChar: 'X'];
        NSLog (@"使用 numberWithChar 初始化：%c\n", [myNumber charValue]);
        
        // float value
        floatNumber = [NSNumber numberWithFloat: 100.00];
        NSLog (@"使用 numberWithFloat 初始化：%f\n", [floatNumber floatValue]);
        
        // double
        myNumber = [NSNumber numberWithDouble: 12345e+15];
        NSLog (@"使用 numberWithDouble 初始化：%g\n", [myNumber doubleValue]);
        
        // Wrong access here
        NSLog (@"将前面的 Double 数据，以 intValue 方式输出：%i\n", [myNumber intValue]);
        
        
        // Test two Numbers for equality
        NSLog (@"测试 intNumber 数据 与 floatNumber 是否相等！ \n");
        if ([intNumber isEqualToNumber: floatNumber] == YES)
            NSLog (@"Numbers are equal\n");
        else
            NSLog (@"Numbers are not equal\n");
        
        
        // Test if one Number is <, ==, or > second Number
        NSLog (@"测试 intNumber 数据 与 myNumber 的大小的比较！ \n");
        if ([intNumber compare: myNumber] == NSOrderedAscending)
            NSLog (@"First number is less than second\n");
        

        
        // ==================================================
        // 上面 简单 描述一下 NSNumber 类的使用。
        //
        // 下面是描述， 为什么某些情况下，要使用 NSNumber 类， 而不使用最基本的数据类型.
        // ==================================================
        
        
        // 定义2个  基本的数据类型.
        int intVal = 100;
        double  doubleVal = 123.456;
        
        
        // 当我有某些业务逻辑， 需要把 这些数字， 存储到 一个 NSArray 数组的时候.
        // 如果我使用  原始的数据类型， 那么将编译不通过.
        // 因为那个 初始化函数的名字， 就是 arrayWithObjects
        // 这个 和 C# 不同的地方在于：
        //    C# 有一个 自动的 装箱／拆箱 的处理机制。
        //    Objective-C 这里要手动完成这个操作.
        
        // 下面这行代码， 将编译出错.
        // NSArray *numberArray = [NSArray arrayWithObjects:intVal, doubleVal, nil];
        
        // 修改成下面这样，将编译通过.
        NSArray *numberArray = [NSArray arrayWithObjects:
                                [NSNumber numberWithInt: intVal],
                                [NSNumber numberWithDouble:doubleVal], nil];
        for(NSNumber *num in numberArray)
        {
            NSLog(@"数组中的数值：%@", num);
        }
        
        
        
        // ==================================================
        //
        // 下面是 NSDecimalNumber 来做数值计算的一些处理.
        // ==================================================
        
        NSDecimalNumber *decVal1 = [NSDecimalNumber decimalNumberWithString:@"100"];
        
        NSDecimalNumber *decVal2 = [NSDecimalNumber decimalNumberWithString:@"200"];
        
        // decValAdd = val1 + val2.
        NSDecimalNumber *decValAdd =[decVal1 decimalNumberByAdding:decVal2];
        
        NSLog(@"%@ + %@ = %@", decVal1, decVal2, decValAdd);
        
        
        // decValSub = val1 - val2.
        NSDecimalNumber *decValSub =[decVal1 decimalNumberBySubtracting:decVal2];
        
        NSLog(@"%@ - %@ = %@", decVal1, decVal2, decValSub);

        
        // decValMul = val1 * val2.
        NSDecimalNumber *decValMul =[decVal1 decimalNumberByMultiplyingBy:decVal2];
        
        
        NSLog(@"%@ * %@ = %@", decVal1, decVal2, decValMul);

        
        
        // decValDiv = val1 * val2.
        NSDecimalNumber *decValDiv =[decVal1 decimalNumberByDividingBy:decVal2];
        
        
        NSLog(@"%@ / %@ = %@", decVal1, decVal2, decValDiv);

        
        
    }
    return 0;
}


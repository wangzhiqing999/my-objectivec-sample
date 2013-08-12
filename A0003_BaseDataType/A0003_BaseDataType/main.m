//
//  main.m
//  A0003_BaseDataType
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 本例子用于 列出  基本的数据类型。
        
        
        //  +/-  2,147,483,647
        int testInt = -12345;
 
        
        unsigned int testUint = 12345;
        
        
        float testFloat = 12345.678;
        
        
        double testDouble = 123456.789;
        
        
        long testLong = 1234567890;
        
        
        long long testLongLong = 1234567890;
        
        
        char testChar = 'A';
        
        
        // 注意： BOOL 只能是  YES  或者  NO.
        BOOL testBool = YES;
        
        
     
        

        /*
         
         Object-c提供基本数据类型：int、float、double、char
         
         Int：
         八进制 整型第一位为0，NSLog的格式符为：
         %o 显示的八进制不带前导0
         %#o显示的八进制带前导0
         十六进制以0x开头的整型，NSLog的格式符为：
         %x 显示的十六进制不带前导0x
         %#x显示的十六进制带前导0x
         若（%X或%#X）显示的十六进制用大写
         
         
         Float：
         NSLog的格式符：%f
         NSLog的格式符：%e  科学计数法显示值
         NSLog的格式符：%g指数的值小于-4大于5，采用%e，否则采用%f
         
         十六进制的浮点常量包含前导0x或0X,后面紧跟一个或多个十进制或十六进制数字，再后是p或P，最后是可以带符号的二进制指数。
         
         注：若无特殊说明，Object-c将所有的浮点常量看做double值，要显示double值可使用和float 一样的格式符。
         
         */
        
        
        
        NSLog(@"testInt = %d;  testUint = %d ", testInt,  testUint);
        
        
        NSLog(@"testInt (八进制 不带前导0) = %o;  testInt (八进制 带前导0)  = %#o ", testInt,  testInt);
        NSLog(@"testInt (16进制 不带前导0x) = %x;  testInt (16进制 带前导0x)  = %#x ", testInt,  testInt);
        NSLog(@"testInt (16进制 不带前导0x 大写) = %X;  testInt (16进制 带前导0x 大写)  = %#X ", testInt,  testInt);
        
        
        
        NSLog(@"testFloat = %f;  testDouble = %f ", testFloat,  testDouble);
        NSLog(@"testFloat (科学计数法)= %e;  testDouble (科学计数法) = %e ", testFloat,  testDouble);
        
        
        
        NSLog(@"testLong = %ld;  testLongLong = %lld ", testLong,  testLongLong);
        
        
        NSLog(@"testChar = %hhd;  testBool = %hhd ", testChar,  testBool);
        
        
        
        
        
        
        
        
    }
    return 0;
}



/**********
 
 有关OBjective-C格式输出符
 
 %@:             Objective-C对象,印有字符串返回descriptionWithLocale:如果于的话,或描述相反.CFTypeRef工作对象,返回的结果的CFCopyDescription功能.(这个翻译有问题建议按照自己的理解方式理解)。
 
 %%:             为'%'字符;
 
 %d,%D,%i:   为32位整型数(int);
 
 %u,%U:        为32位无符号整型数(unsigned int);
 
 %hi:   为有符号的16位整型数(short);
 
 %hu:  为无符号的16位整型数(unsigned shord);
 
 %qi:   为有符号的64位整型数(long long);
 
 %qu:  为无符号的64位整型数(unsigned long long);
 
 %x:    为32位的无符号整型数(unsigned int),打印使用数字0-9的十六进制,小写a-f;
 
 %X:    为32位的无符号整型数(unsigned int),打印使用数字0-9的十六进制,大写A-F;
 
 %qx:   为无符号64位整数(unsigned long long),打印使用数字0-9的十六进制,小写a-f;
 
 %qX:   为无符号64位整数(unsigned long long),打印使用数字0-9的十六进制,大写A-F;
 
 %o,%O:   为32位的无符号整数（unsigned int),打印八进制数;
 
 %f:      为64位的浮点数(double);
 
 %e:      为64位的浮点数(double),打印使用小写字母e,科学计数法介绍了指数的增大而减小;
 
 %E:      为64位的浮点数(double),打印科学符号使用一个大写E介绍指数的增大而减小;
 
 %g:      为64位的浮点数(double),用%e的方式打印指数,如果指数小于4或者大于等于精度,那么%f的风格就会有不同体现;
 
 %G:      为64位的浮点数(double),用%E的方式打印指数,如果指数小于4或者大于等于精度,那么%f的风格就会有不同体现;
 
 %c:       为8位的无符号字符%c(unsigned char),通过打印NSLog()将其作为一个ASCII字符,或者,不是一个ASCII字符,八进制格式\ddd或统一标准的字符编码的十六进制格式\udddd,在这里d是一个数字;
 
 %C:       为16位Unicode字符%C(unichar),通过打印NSLog()将其作为一个ASCII字符,或者,不是一个ASCII字符,八进制格式\ddd或统一标准的字符编码的十六进制格式\\udddd,在这里d是一个数字;
 
 %s:       对于无符号字符数组空终止,%s系统中解释其输入编码,而不是别的,如utf-8;
 
 %S:       空终止一系列的16位Unicode字符;
 
 %p:       空指针(无效*)，打印十六进制的数字0-9和小写a-f,前缀为0x;
 
 %L:       在明确规定的长度下,进行修正,下面的一批数据a,A,e,E,f,F,g,G应用于双精度长整型的参数;
 
 %a:       为64位的浮点数(double),按照科学计数法打印采用0x和一个十六进制数字前使用小写小数点p来介绍指数的增大而减小;
 
 %A:       为64位的浮点数(double),按照科学计数法打印采用0X和一个十六进制数字前使用大写字母小数点P界扫指数的增大而减小；
 
 %F:       为64位的浮点数(double),按照十进制表示法进行打印；
 
 %z:       修改说明在%z长度以下d,i,o,u,x,X适用于某一指定类型的转换或者适用于一定尺寸的整数类型的参数;
 
 %t:       修改说明在%t长度以下d,i,o,u,x,X适用于某一指定类型或一定尺寸的整数类型的转换的参数;
 
 %j:       修改说明在%j长度以下d,i,o,u,x,X适用于某一指定类型或一定尺寸的整数类型的转换的参数。
 
 **********/

//
//  main.m
//  A0130_Block
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TestBlock.h"



// 定义一个   使用  Block 作为 参数的   函数.
extern void useCodeBlock(int (^isAdminBlock)(NSString *value));



extern void TestReadDataInOneScope();
extern void TestReadDataInOneScope2();
extern void TestReadDataInOneScope3();
extern void TestBlockVariable();





//
// 知识点：  使用 typedef， 相当于  定义一次 Block 的  参数与 返回值。
//    在后续处理中， 可以简单的使用前面定义好的  名称， 来写代码。
//    避免多次写很长的  int (^MyTestBlock)(int)
//
typedef int (^MyTestBlock)(int);

MyTestBlock genBlock();





int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //  Block  有点象 C++ 中的  函数的指针。
        
        
        
        // 定义 Block 的基本参数与返回值。
        // 这里的  参数是 NSString，  返回值 是 void ， 也就是没有返回值.
        void (^myBlock)(NSString *x);
        
        // 前面定义的是 基本参数与返回值。
        // 下面是 具体的 实现.
        myBlock = ^(NSString *x)
        {
            NSLog(@"myBlock 被调用了 ...... %@", x);
        };
        
        
        // 然后是 调用这个 Block.
        myBlock (@"最简单的 Block 调用测试！");
        
        
        
        
        
        
        //
        // 下面是 Block 的多种定义的方式。
        //
        
        void (^myBlock1)(NSString *x) = ^(NSString *x)
        {
            NSLog(@"myBlock1 被调用了 ...... %@", x);
        };
        
        myBlock1 (@"定义 Block 参数与返回值的同时， 定义 Block 的实现！");
        
        
        
        
        void (^anotherBlock)(NSString *x) = ^(NSString *x) { NSLog(@"anotherBlock 被调用了 ......   %@", x); };
        anotherBlock (@"定义 Block 参数与返回值的同时， 定义 Block 的实现！");
        
        
        
        void (^aVoidBlock)() = ^{ NSLog(@"aVoidBlock 被调用了 ...... blah"); };
        aVoidBlock();
        
        
        
        // 下面这行出错了， 暂时原因不明.
        // doIt(^(NSString *x){ NSLog(@"%@", x); });

        
        
        
        
        
        
        
        //
        // 下面用于 测试 把  Block 作为函数的参数， 进行处理.
        //
        NSLog(@"测试 把  Block 作为函数的参数， 进行处理.");
        
        // 这个 Block 用于 完全匹配的处理逻辑.
        int (^fullMatchBlock)(NSString *value) = ^(NSString *value)
        {
            if([value isEqualToString: @"Admin"] ) {
                return 0;
            }
            return -1;
        };
        
        
        // 这个 Block 用于 模糊匹配的处理逻辑.
        int (^likeMatchBlock)(NSString *value) = ^(NSString *value)
        {
            if([[value uppercaseString] isEqualToString: @"ADMIN"] ) {
                return 0;
            }
            return -1;
        };
        
        
        // 调用  使用  Block 作为参数的函数。
        // 传递的参数为： 完全匹配的 处理逻辑.
        useCodeBlock(fullMatchBlock);
        
        // 传递的参数为： 模糊匹配的 处理逻辑.
        useCodeBlock(likeMatchBlock);
        
        
        
        
        
        
        
        
        
        //
        // 下面测试， 把 Block 作为 类的一个方法的 参数的处理的例子。
        //
        
        NSLog(@"测试， 把 Block 作为 类的一个方法的 参数的处理的例子。");
        
        // 这个 Block 用于 判断是否是奇数的处理逻辑.
        BOOL (^isOddBlock)(NSInteger value) = ^(NSInteger value)
        {
            if(value % 2 == 1) {
                return YES;
            }
            return NO;
        };
        
        // 这个 Block 用于 判断是否是偶数的处理逻辑.
        BOOL (^isEvenBlock)(NSInteger value) = ^(NSInteger value)
        {
            if(value % 2 == 0) {
                return YES;
            }
            return NO;
        };
        
        
        
        // 数字的数组
        NSMutableArray *initArray = [NSMutableArray arrayWithCapacity: 10];
        // 初始化数据,
        for(int i =0; i < 10; i ++) {
            [initArray addObject: [NSNumber numberWithInt: i]];
        }
        
        
        // 初始化  处理类.
        TestBlock *testBlock = [TestBlock alloc];
        
        
        // 传入 初始化数组  和  奇数的处理逻辑的 
        NSMutableArray *oddArray = [testBlock  filterArray:initArray  withBlock: isOddBlock];
        // 调试输出结果：
        NSLog(@"奇数!");
        [testBlock  showArrayInfo : oddArray];
         
         
         
         // 传入 初始化数组  和  偶数的处理逻辑的
         NSMutableArray *evenArray = [testBlock  filterArray:initArray  withBlock: isEvenBlock];
         // 调试输出结果：
         NSLog(@"偶数!");
        [testBlock  showArrayInfo : evenArray];
        
        
        
        
        
        
        
        
        
        NSLog(@"测试， Block 访问 同一 Scope 内变量的 的例子。");
        TestReadDataInOneScope();
        TestReadDataInOneScope2();
        TestReadDataInOneScope3();
        
        
        
        
        
        
        
        NSLog(@"测试， Block Variable 的例子。");
        TestBlockVariable();
        
        
        
        
        
        
        
        
        
        NSLog(@"测试， Block  的生命周期的例子。");
        
        MyTestBlock outBlock = genBlock();
        int result = outBlock(5);
        
        // 由于使用了  ARC， 下面这句话 无法编译通过了 ...
        // NSLog(@"result is %ld",(unsigned long)[outBlock retainCount] ); // segmentation fault
        NSLog(@"result is %d",result  );
        
        
    }
    return 0;
}








// 这个是一个  使用  block  作为 参数的 函数的 例子
void useCodeBlock(int (^isAdminBlock)(NSString *value))
{
    if(0 == isAdminBlock(@"Admin"))
        NSLog(@"Admin 数据匹配 ， 执行相应的后续处理...");
    else
        NSLog(@"Admin 数据不匹配...");
    
    
    if(0 == isAdminBlock(@"ADMIN"))
        NSLog(@"ADMIN 数据匹配 ， 执行相应的后续处理...");
    else
        NSLog(@"ADMIN 数据不匹配...");
    
}



//
// 测试 读取同一 scope 内的变量的数值。
//
void TestReadDataInOneScope()
{
    int outA = 8;
    
    int (^myPtr) (int) = ^(int a) {return outA+a;};
    
    // block 裡面可以讀同一個scope的outA的值
    int result = myPtr(3); // result is 11
    
    NSLog(@"TestReadDataInOneScope  Result is %d", result);
}


//
// 测试 读取同一 scope 内的变量的数值。
// 事實上呢，myPtr在其主體用到outA這個變數值的時候是做了一個copy的動作把outA的值copy下來。
// 所以之後outA即使換了新的值對於myPtr裡copy的值是沒有影響到的。
// 
void TestReadDataInOneScope2()
{
    int outA = 8;
    int (^myPtr) (int) = ^(int a) {return outA+a;};
    // block 裡面可以讀同一個scope的outA的值
    outA = 5; // 在呼叫myPtr之前改變outA的值
    int result = myPtr(3); // result 的值還是 11並不是 8
    
    NSLog(@"TestReadDataInOneScope2  Result is %d", result);
}


void TestReadDataInOneScope3()
{
    static int outA = 8;
    int (^myPtr) (int) = ^(int a) {return outA+a;};
    // block 裡面可以讀同一個scope的outA的值
    outA = 5; // 在呼叫myPtr之前改變outA的值
    int result = myPtr(3); // result 的值是 8，因為outA是個static 變數會直接反應其值
    
    NSLog(@"TestReadDataInOneScope3  Result is %d", result);
}




//
// Block Variable
// 在某個變數前面如果加上修飾字 _ _block 的話(注意block前有兩個下底線)，
// 這個變數又稱為block variable。那麼在block裡就可以任意修改此變數值，變數值的改變也可以知道。
//
void TestBlockVariable()
{
    
    __block int num = 5;
    
    int (^myPtr) (int) = ^(int a) { return num++;};
    int (^myPtr2) (int) = ^(int a) { return num++;};
    
    int result = myPtr(0);
    NSLog(@"TestBlockVariable  Result is %d", result);

    
    result = myPtr2(0);
    NSLog(@"TestBlockVariable  Result is %d", result);
    
}








//
// 本函数 用于返回一个  Block.
// 本函数的测试目的，  是为了 检验  Block 的生命周期的问题 .
//
MyTestBlock genBlock() {
    
    int a = 3;
    MyTestBlock inBlock = ^(int n) {
        return n*a;
    };
    
    
    // 由于使用了  ARC， 下面这句话 正常的运行了。
    return inBlock ;
    
    
    // 如果未使用   ARC,  那么预期的写法是
    // return [[inBlock copy] autorelease] ; 
    
    
}


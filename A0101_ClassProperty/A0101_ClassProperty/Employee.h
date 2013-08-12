//
//  Employee.h
//  A0101_ClassProperty
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//



// #import <Foundation/Foundation.h>

#import <Cocoa/Cocoa.h>


@interface Employee : NSObject{
    NSString *firstName;
    NSString *lastName;
    NSDate *birthDate;
    NSDate *dateOfEmployment;
    Employee *manager;
    NSString *ssn;
    double salary;
}


/*

关于 @property
 
在头文件中：
@property int count;

等效于在头文件中声明2个方法：
- (int)count;
-(void)setCount:(int)newCount;
 
 
 
实现文件(.m)中
@synthesize count;
 
等效于在实现文件(.m)中实现2个方法。
- (int)count
{
  return count;
}
 
-(void)setCount:(int)newCount
{
  count = newCount;
}

 
 

声明property的语法为：
@property (参数1,参数2) 类型 名字;

其中参数主要分为三类：
 
读写属性： （readwrite/readonly）
setter语意：（assign/retain/copy）
原子性： （atomicity/nonatomic）
 
各参数意义如下：
  readwrite    产生setter\getter方法
  readonly     只产生简单的getter,没有setter。
  assign       默认类型,setter方法直接赋值，而不进行retain操作
  retain       setter方法对参数进行release旧值，再retain新值。
  copy         setter方法进行Copy操作，与retain一样
  nonatomic    禁止多线程，变量保护，提高性能
 
*/




// 名
@property (nonatomic, retain) NSString * firstName;

// 姓
@property (nonatomic, retain) NSString * lastName;

// 生日
@property (nonatomic, retain) NSDate * birthDate;

// 入职日期。
@property (nonatomic, retain) NSDate * dateOfEmployment;


// 主管 （注意，这里 没有写 retain）
@property (nonatomic) Employee * manager;


//
@property (nonatomic, retain) NSString * ssn;


// 年龄 （ 注意： 这里的  readonly 意味着  这个属性是  只读的！ ）
@property (nonatomic, readonly) NSTimeInterval age;


// 薪水  （注意，这里 没有写 retain）
@property (nonatomic) double salary;




// 带参数的 构造函数。
-(id)initWithFirstName:(NSString *)inFirstName
              lastName:(NSString *)inLastName
             birthDate:(NSDate *)inBirthDate
                   ssn:(NSString *)inSsn;


-(void)giveRaise:(double)percentage;


-(double)bonus;





@end

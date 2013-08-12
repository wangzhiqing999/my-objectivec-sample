//
//  Employee.m
//  A0101_ClassProperty
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "Employee.h"

@implementation Employee


@synthesize firstName;

@synthesize lastName;

@synthesize birthDate;

@synthesize dateOfEmployment;


@synthesize manager;


@synthesize ssn;

@synthesize salary;

@dynamic age;



// 不带参数的  构造函数.
-(id)init {
    if(self = [super init])
    {
    }
    return self;
}



// 带参数的 构造函数。
-(id)initWithFirstName:(NSString *)inFirstName
              lastName:(NSString *)inLastName
             birthDate:(NSDate *)inBirthDate ssn:(NSString *)inSsn;
{

    // ------------------------------
    // 调用父类的初始化方法.
    // ------------------------------
    if(self = [super init]) {
        
        // 当前初始化方法中， 需要 处理的代码.
        // 这里就是  简单的设置 类里面的属性。
        [self setFirstName : inFirstName];
        
        [self setLastName : inLastName];
        
        [self setBirthDate : inBirthDate];

        [self setSsn : inSsn];
    }
    
    // ------------------------------
    // 返回类的ID. (相当于返回指针)
    // ------------------------------
    return self;

}





-(NSTimeInterval)age;
{
    return [birthDate timeIntervalSinceNow];
}


-(void)giveRaise:(double)percentage;
{
    salary = salary + (salary * percentage);
}


-(double)bonus;
{
    return salary * .05;
}



@end

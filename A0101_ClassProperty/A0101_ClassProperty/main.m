//
//  main.m
//  A0101_ClassProperty
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Manager.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Employee *joeBlow = [[Employee alloc]
                             initWithFirstName:@"Joe"
                             lastName:@"Blow"
                             birthDate:
                             [NSDate dateWithNaturalLanguageString:@"12/01/1990"]
                             ssn:@"555-12-1212"];
        
        
        Employee *janeDoe = [[Employee alloc]
                             initWithFirstName:@"Jane"
                             lastName:@"Doe"
                             birthDate:
                             [NSDate dateWithNaturalLanguageString:@"11/01/1985"]
                             ssn:@"555-12-1212"];
        
        
        Manager *johnAppleseed = [[Manager alloc]
                                  initWithFirstName:@"John"
                                  lastName:@"Appleseed"
                                  birthDate:
                                  [NSDate dateWithNaturalLanguageString:@"11/01/1970"]
                                  ssn:@"555-12-1212"];
        
        
        [johnAppleseed addReport:joeBlow];
        
        
        [johnAppleseed addReport:janeDoe];
        joeBlow.salary = 50000;
        janeDoe.salary = 75000;
        johnAppleseed.salary = 100000;
        NSMutableArray *allEmployees = [NSMutableArray array];
        [allEmployees addObject:joeBlow];
        [allEmployees addObject:janeDoe];
        [allEmployees addObject:johnAppleseed];
        
        
        for(Employee *employee in allEmployees)
        {
            [employee giveRaise:.10];
            NSLog(@"Employee %@ %@’s salary is: %.2f with a bonus of: %.2f",
                  employee.firstName, employee.lastName, employee.salary,
                  employee.bonus);
        }
        
    }
    return 0;
}


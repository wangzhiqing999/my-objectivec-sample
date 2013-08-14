//
//  TestStudent.h
//  A0710_CoreData_OneToMany
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TestClass;

@interface TestStudent : NSManagedObject

@property (nonatomic, retain) NSString * testStudentName;
@property (nonatomic, retain) TestClass *inTestClass;

@end

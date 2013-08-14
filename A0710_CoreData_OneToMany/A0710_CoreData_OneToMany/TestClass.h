//
//  TestClass.h
//  A0710_CoreData_OneToMany
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TestClass : NSManagedObject

@property (nonatomic, retain) NSString * testClassName;
@property (nonatomic, retain) NSSet *studentArray;
@end

@interface TestClass (CoreDataGeneratedAccessors)

- (void)addStudentArrayObject:(NSManagedObject *)value;
- (void)removeStudentArrayObject:(NSManagedObject *)value;
- (void)addStudentArray:(NSSet *)values;
- (void)removeStudentArray:(NSSet *)values;

@end

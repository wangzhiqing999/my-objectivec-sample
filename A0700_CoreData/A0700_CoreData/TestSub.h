//
//  TestSub.h
//  A0700_CoreData
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TestSub : NSManagedObject

@property (nonatomic, retain) NSNumber * subID;
@property (nonatomic, retain) NSString * subValue;
@property (nonatomic, retain) NSNumber * mainID;
@property (nonatomic, retain) NSManagedObject *testMain;

@end

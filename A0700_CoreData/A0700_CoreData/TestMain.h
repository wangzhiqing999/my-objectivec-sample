//
//  TestMain.h
//  A0700_CoreData
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TestMain : NSManagedObject

@property (nonatomic, retain) NSNumber * mainID;
@property (nonatomic, retain) NSString * mainValue;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSDate * lastUpdateDate;

@end

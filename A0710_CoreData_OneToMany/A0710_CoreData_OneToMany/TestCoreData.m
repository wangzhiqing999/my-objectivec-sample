//
//  TestCoreData.m
//  A0700_CoreData
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestCoreData.h"

@implementation TestCoreData


@synthesize managedObjectModel;

@synthesize managedObjectContext;

@synthesize persistentStoreCoordinator;




//
// managedObjectModel的初始化赋值函数
//
-(NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return managedObjectModel;
}


//
// 初始化Core Data使用的数据库
//
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    // 得到数据库的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // CoreData是建立在SQLite之上的，数据库名称需与Xcdatamodel文件同名
    NSURL *storeUrl = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"OneToManyModel.sqlite"]];
    
    
    NSLog(@"数据库地址：%@", storeUrl);
    
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return persistentStoreCoordinator;
}



//
// managedObjectContext的初始化赋值函数
//
-(NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator =[self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc]init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}


@end

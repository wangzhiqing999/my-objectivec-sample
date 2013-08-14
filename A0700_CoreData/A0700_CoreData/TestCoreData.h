//
//  TestCoreData.h
//  A0700_CoreData
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>


@interface TestCoreData : NSObject


//
// 数据模型对象
// 可以将这个东西看作是数据库的轮廓，或者结构。
// 这里包含了各个实体的定义信息，
// 一般来说，使用编辑器来操作这个物体，添加属性，建立属性之间的关系等等，
// 当然也可以使用代码。
//
@property(strong,nonatomic)NSManagedObjectModel *managedObjectModel;


//
// 上下文对象
// 可以将这一部分看作是数据的实际内容，
// 这也是整个数据库中对开发者而言最重要的部分，
// 基本上，插入数据，查询数据，删除数据的工作都在这里完成。
//
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;


//
// 持久性存储区
// 可以将这个东西看作是数据库连接库
// 在这里，设置数据存储的名字和位置，以及数据存储的时机。
// 
@property(strong,nonatomic)NSPersistentStoreCoordinator *persistentStoreCoordinator;



//
// 初始化Core Data使用的数据库
//
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator;

//
// managedObjectModel的初始化赋值函数
//
-(NSManagedObjectModel *)managedObjectModel;

//
// managedObjectContext的初始化赋值函数
//
-(NSManagedObjectContext *)managedObjectContext;









@end

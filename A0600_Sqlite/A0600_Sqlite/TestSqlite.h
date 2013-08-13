//
//  TestSqlite.h
//  A0600_Sqlite
//
//  Created by wangzhiqing on 13-8-13.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// 如果你想引用xcode提供的框架或类库，在xcode目录最上方点击你的工程，在右方的TARGET内选择Build Phases标签，在Link Binary With Libraries内点击+加号，搜索libsqlite3.dylib，即将sqlite3库文件添加至工程中。
//
#import "sqlite3.h"




@interface TestSqlite : NSObject


//
// sqlite 数据库对象.
//
@property(nonatomic)sqlite3*    m_sql;

//
// sqlite 数据库名.
//
@property(nonatomic,retain)NSString*    m_dbName;




//
// 打开或创建数据库.
// 因为 Sqlite 是一个文件的数据库，如果文件不存在，将会在需要的时候，创建文件.
//
-(BOOL)openOrCreateDatabase:(NSString*)DbName;


//
// 关闭数据库.
//
-(void)closeDatabase;




//
// 创建一个 Sqlite 表.
// 因为 Sqlite 是一个文件的数据库，如果文件不存在，将会在需要的时候，创建文件.
// 新创建的数据库，自然是什么表也没有的， 这种情况下，需要先 执行 SQL 语句，来创建表.
//
-(BOOL)createTable:(NSString*)sqlCreateTable;


//
// 执行更新表的 sql 语句.
//
-(BOOL)updateTable:(NSString*)sqlUpdate;



//
// 执行数据库查询处理.
//
-(NSArray*)querryTable:(NSString*)sqlQuerry;



//
// 执行数据库查询处理.
//
-(NSArray*)querryTableByCallBack:(NSString*)sqlQuerry;



@end

//
//  main.m
//  A0600_Sqlite
//
//  Created by wangzhiqing on 13-8-13.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//


//
// sqlite 数据库的名称.
//
#define DATABASE_NAME @"my_test.sqlite3"



#import <Foundation/Foundation.h>
#import "TestSqlite.h"



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 初始化测试类实例.
        TestSqlite *db = [[TestSqlite alloc] init];
        
        // 设置数据库名称.
        db.m_dbName = DATABASE_NAME;
        
        
        [db createTable:@"CREATE TABLE IF NOT EXISTS testTable(testId INTEGER PRIMARY KEY autoincrement,userId    TEXT,userName    TEXT,userOther    INTEGER);"];
        
        
        [db updateTable:@"INSERT INTO testTable (userId,userName,userOther)values('55555','haha','12')"];
        
        
        NSArray* array = [db querryTableByCallBack:@"select * from testTable"];
        
        
        for(NSDictionary *data in array)
        {
            NSLog(@"数据库查询结果：testId＝%@; userId＝%@; userName＝%@; userOther=%@",
                  [data objectForKey:@"testId"],
                  [data objectForKey:@"userId"],
                  [data objectForKey:@"userName"],
                  [data objectForKey:@"userOther"]);
        }
    }
    return 0;
}




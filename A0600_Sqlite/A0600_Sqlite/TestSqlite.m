//
//  TestSqlite.m
//  A0600_Sqlite
//
//  Created by wangzhiqing on 13-8-13.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestSqlite.h"

@implementation TestSqlite


//
// sqlite 数据库对象.
//
@synthesize m_sql;

//
// sqlite 数据库名.
//
@synthesize m_dbName;



- (void) dealloc
{
    self.m_sql = nil;
    self.m_dbName = nil;
}



//
// 打开或创建数据库.
// 因为 Sqlite 是一个文件的数据库，如果文件不存在，将会在需要的时候，创建文件.
//
-(BOOL)openOrCreateDatabase:(NSString*)dbName
{
    self.m_dbName = dbName;
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [path objectAtIndex:0];
    
    // 尝试调用 sqlite3_open  方法打开数据库.
    if(sqlite3_open([[documentsDirectory stringByAppendingPathComponent:dbName] UTF8String],&m_sql) != SQLITE_OK)
    {
        NSLog(@"创建数据库失败");
        return    NO;
    }
    return YES;
}


//
// 关闭数据库.
//
-(void)closeDatabase
{
    // 调用 sqlite3_close 方法， 关闭数据库.
    sqlite3_close(self.m_sql);
}



//
// 创建一个 Sqlite 表.
// 因为 Sqlite 是一个文件的数据库，如果文件不存在，将会在需要的时候，创建文件.
// 新创建的数据库，自然是什么表也没有的， 这种情况下，需要先 执行 SQL 语句，来创建表.
//
-(BOOL)createTable:(NSString*)sqlCreateTable
{
    // 首先 先打开数据库.
    if (![self openOrCreateDatabase:self.m_dbName]) {
        return NO;
    }
    
    // 错误信息.
    char *errorMsg;
    
    // 通过调用 sqlite3_exec 方法， 来执行一个 创建表的 sql 语句.
    if (sqlite3_exec (self.m_sql, [sqlCreateTable  UTF8String],NULL, NULL, &errorMsg) != SQLITE_OK)
    {
        NSLog(@"创建数据表失败:%s",errorMsg);
        return NO;
    }
    
    // 关闭数据库.
    [self closeDatabase];
    return YES;
}




//
// 执行更新表的 sql 语句.
//
-(BOOL)updateTable:(NSString*)sqlUpdate
{
    // 首先 先打开数据库.
    if (![self openOrCreateDatabase:self.m_dbName]) {
        return NO;
    }
    
    // 错误信息.
    char* errorMsg = NULL;
    
    // 通过调用 sqlite3_exec 方法， 来执行一个 创建表的 sql 语句.
    if(sqlite3_exec(self.m_sql, [sqlUpdate UTF8String],0, NULL, &errorMsg) == SQLITE_OK)
    {
        [self closeDatabase];
        return YES;
    }
    else {
        printf("更新表失败:%s",errorMsg);
        [self closeDatabase];
        return NO;
    }

    // return YES;
}





//
// 执行数据库查询处理.
//
-(NSArray*)querryTable:(NSString*)sqlQuerry
{
    // 首先 先打开数据库.
    if (![self openOrCreateDatabase:self.m_dbName]) {
        return nil;
    }
    
    
    // 查询的结果 行数.
    int row = 0;
    // 查询的结果 列数.
    int column = 0;
    // 查询过程中产生的错误信息.
    char*    errorMsg = NULL;
    // 查询结果的数组.
    char**    dbResult = NULL;
    
    
    // 初始化预期的返回结果.
    NSMutableArray*    array = [[NSMutableArray alloc] init];
    
    
    // 调用 sqlite3_get_table 方法， 执行 查询的 sql 语句.
    if(sqlite3_get_table(m_sql, [sqlQuerry UTF8String], &dbResult, &row,&column, &errorMsg ) == SQLITE_OK)
    {
        // 查询结果为 0 行.
        if (0 == row) {
            [self closeDatabase];
            return nil;
        }
        
        
        // 实际的数据存储的 物理索引.
        int index = column;
        
        // 依次遍历查询结果中的每一行.
        for(int i = 0; i < row ; i++ ) {
            
            // 每一行的数据，将使用一个 NSMutableDictionary 对象来进行存储.
            NSMutableDictionary*    dic = [[NSMutableDictionary alloc] init];
            
            // 依次遍历每一列.
            for(int j = 0 ; j < column; j++ ) {
                
                if (dbResult[index]) {
                    
                    // 根据  物理地址的索引  index  获取数据.
                    NSString*    value = [[NSString alloc] initWithUTF8String:dbResult[index]];
                    
                    // 根据列 的索引 j  获取列的标题.
                    NSString*    key = [[NSString alloc] initWithUTF8String:dbResult[j]];
                    
                    // 数据加入 NSMutableDictionary 结果对象中.
                    [dic setObject:value forKey:key];
    
                    
                }
                
                // 物理索引地址递增.
                index ++;
            }
            
            // NSMutableDictionary 结果对象， 结果最终的结果数组.
            [array addObject:dic];
        }
        
    }
    else
    {
        // 查询处理执行失败了. 输出信息，并关闭数据库.
        printf("%s",errorMsg);
        [self closeDatabase];
        return nil;
    }
    
    // 关闭数据库.
    [self closeDatabase];
    
    // 返回结果.
    return array;
}




//
// 单独处理单行数据.
// 此方法是在调用 sqlite3_exec 的时候， 提供的一个参数.
// 用于一次处理一行数据
// (而不是象前面的那个 querryTable 方法，所有数据都检索完了， 才开始处理 )
//
int processData(void* arrayResult,int columnCount,char** columnValue, char** columnName)
{
    // 一行数据
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    
    // 遍历每一列.
    for(int i = 0 ; i < columnCount; i ++ )
    {
        if (columnValue[i]) {
            
            // 根据列 的索引 i  获取列的标题.
            NSString* key = [[NSString alloc] initWithUTF8String:columnName[i]];
            
            // 根据列 的索引 i  获取列的数值.
            NSString* value = [[NSString alloc] initWithUTF8String:columnValue[i]];
            
            // 数据加入 NSMutableDictionary 结果对象中.
            [dic setObject:value forKey:key];
            
        }
        
    }
    
    // 单行数据， 加入数组中.
    [(__bridge NSMutableArray*)arrayResult addObject:dic];

    
    return 0;
}


//
// 以回调的方式， 查询数据库数据 .
//
-(NSArray*)querryTableByCallBack:(NSString*)sqlQuerry
{
    
    // 首先 先打开数据库.
    if (![self openOrCreateDatabase:self.m_dbName]) {
        return nil;
    }
    
    // 错误信息.
    char*    errorMsg = NULL;
    
    // 预期结果.
    NSMutableArray* arrayResult = [[NSMutableArray alloc] init];
    
    // 执行查询处理.
    if (sqlite3_exec(self.m_sql,
                     [sqlQuerry UTF8String],
                     processData,
                     (__bridge void*)(arrayResult),
                     &errorMsg) != SQLITE_OK) {
        printf("查询出错:%s",errorMsg);
    }
    
    // 关闭数据库.
    [self closeDatabase];
    
    // 返回最终的结果数组.
    return arrayResult;
}

@end

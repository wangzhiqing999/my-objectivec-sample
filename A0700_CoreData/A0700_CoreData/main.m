//
//  main.m
//  A0700_CoreData
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//


//
// 项目中加入CoreData，首先需要引入 CoreData FrameWork。
// 这里需要先点击target，然后再点击Build Phases，在下面的界面中找到LinkBinary With Libraries。
// 点击箭头，展开这一项，然后再点击加号，出现Framework项界面。
// 在搜索框中输入CoreData，这时出现CoreData.framework，选中它并点击Add按钮而加入CoreData FrameWork。
//



//
// 当 CoreData FrameWork 加入完毕后， 可以去创建一个 数据模型。
// 也就是选择好项目，鼠标右键，选择 New File, 弹出界面中， 找到 Core Data.
// 然后选择好 Data Model 后，按 Next 按钮，  输入 Data Model 的名字。
// 然后按 Create 按钮，进行创建。
//
// 在本例子代码中， 这个文件名为 “TestModel.xcdatamodeld”



//
// 创建好之后， 打开刚才创建的文件，可以开始设计 Entity 和 Attribute
// (也就是相当于 设计 表 与 列)
//
// 在本例子中， 设计了一个 TestMain 的表
// 包含的列名称为： mainID, mainValue, createDate, lastUpdateDate
//
// 本来还想测试一下 表关联 TastMain 和 TestSub 一对多的.
// 发现代码有点长，先暂时缓缓
//


// 设计完毕后， 通过菜单的 Editor——Create NSManagedObject Subclass，
// 点击create，就完成了。
// 完成后可以看到工程中多了一个TestMain的h和m文件，这就是Core Data模型中的实体对象。
//
// 由于这个 TestMain 是通过 生成出来的， 暂时没有测试过  修改这个文件以后，再生成会不会被覆盖。
//


// 注： 代码运行完毕后， 通过运行 sqlite 的命令行客户端
// sqlite3 TestModel.sqlite
//
// .table 命令，将列出当前数据库所有的表.
// Core Data 创建的表， 将是 Z＋类名的大写.
// 例如本例子代码，运行的结果为：
// sqlite> .table
// ZTESTMAIN     ZTESTSUB      Z_METADATA    Z_PRIMARYKEY
//
//
// .scheam 表名字， 将列出 创建表的 sql 语句.
// 例如本例子代码，运行的结果为：
// sqlite> .schema ztestmain
// CREATE TABLE ZTESTMAIN ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZMAINID INTEGER, ZCREATEDATE TIMESTAMP, ZMAINVALUE VARCHAR );
//
// 请注意： 数据库表的 主键， 是 自动产生的 Z_PK.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "TestCoreData.h"
#import "TestMain.h"
#import "TestSub.h"


// 测试写数据.
extern void test_insert(TestCoreData *testCodeData);


// 测试读取数据.
extern TestMain* test_select(TestCoreData *testCodeData);


// 测试更新数据.
extern void test_update(TestCoreData *testCodeData,  TestMain *testMainData);


// 测试删除数据.
extern void test_delete(TestCoreData *testCodeData,  TestMain *testMainData);




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        TestCoreData *testCodeData = [[TestCoreData alloc] init];
        
        // 测试通过  Core Data 向数据库中写数据.
        test_insert(testCodeData);
        
        // 测试通过  Core Data 向数据库中读取数据.
        TestMain *firstData = test_select(testCodeData);
        
        if(firstData != nil)
        {
            // 测试更新数据.
            test_update(testCodeData,  firstData);
            
            
            // 注： 可以暂时注释掉下面这行， 运行一次
            // 然后跑 sqlite 客户端下去核对一下数据。
            
            // 测试删除数据.
            test_delete(testCodeData,  firstData);

        }
        
        
    }
    return 0;
}



//
// 测试更新数据库数据.
//
void test_insert(TestCoreData *testCodeData)
{

    // 让CoreData在上下文中创建一个新对象(托管对象)
    TestMain *testMainData = (TestMain *)
    [NSEntityDescription insertNewObjectForEntityForName:@"TestMain" inManagedObjectContext:testCodeData.managedObjectContext];
    
    
    // 设置 对象的属性.
    testMainData.mainID = [NSNumber numberWithInt:100] ;
    testMainData.mainValue = @"测试CoreData";
    testMainData.createDate = [NSDate date];
    testMainData.lastUpdateDate = [NSDate date];
    
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [testCodeData.managedObjectContext save:&error];
    
    if(!isSaveSuccess)
    {
        NSLog(@"Error: %@, %@", error,[error userInfo]);
    }
    else
    {
        NSLog(@"插入处理成功执行完毕！");
    }
    
}




// 测试读取数据.
TestMain* test_select(TestCoreData *testCodeData)
{
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //设置要检索哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TestMain"inManagedObjectContext:testCodeData.managedObjectContext];
    
    //设置请求实体
    [request setEntity:entity];
    
    //指定对结果的排序方式
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createDate" ascending:NO];
    
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    [request setSortDescriptors:sortDescriptions];

    
    NSError *error = nil;
    
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[testCodeData.managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
    
    if (mutableFetchResult == nil)
    {
        NSLog(@"Error: %@,%@", error,[error userInfo]);
    }
    
    NSLog(@"The count of TestMain:%li",(unsigned long)[mutableFetchResult count]);
    
    for(TestMain *oneLine in mutableFetchResult)
    {
        NSLog(@"TestMain:%@; Value:%@;  Date:%@",oneLine.mainID,oneLine.mainValue, oneLine.createDate);
    }
    
    if([mutableFetchResult count] == 0) {
        // 如果没有检索到数据，那么返回 nil.
        return nil;
    }
    
    
    // 有数据的情况下，返回首行.
    return (TestMain*) [mutableFetchResult objectAtIndex:0];
}




// 测试更新数据.
// 注意： 这里传递进来的数据， 是 前一个步骤， 查询出来的数据。
// 如果这里简单 new 一个对象，将导致 插入一行数据.
//
void test_update(TestCoreData *testCodeData,  TestMain *testMainData)
{
    // 修改 mainID.
    testMainData.mainID =  [NSNumber numberWithInt:testMainData.mainID.intValue + 1];
    
    // 修改 内容.
    testMainData.mainValue = @"测试CoreData修改数据！";
    
    // 修改  最后修改时间.
    testMainData.lastUpdateDate = [NSDate date];
    
    NSError *error;
    BOOL isUpdateSuccess = [testCodeData.managedObjectContext save:&error];
    
    if(!isUpdateSuccess)
    {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
    else
    {
        NSLog(@"更新处理成功执行完毕！");
    }
    
}



// 测试删除数据.
void test_delete(TestCoreData *testCodeData,  TestMain *testMainData)
{
    [testCodeData.managedObjectContext deleteObject:testMainData];
    
    NSError *error;
    BOOL isUpdateSuccess = [testCodeData.managedObjectContext save:&error];
    
    if(!isUpdateSuccess)
    {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
    else
    {
        NSLog(@"删除处理成功执行完毕！");
    }

}


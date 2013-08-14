//
//  main.m
//  A0710_CoreData_OneToMany
//
//  Created by wangzhiqing on 13-8-14.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

#import "TestCoreData.h"
#import "TestClass.h"
#import "TestStudent.h"


// 注意：
//    本例子是在 A0700_CoreData 的基础上编写的。
//    那个例子， 仅仅演示对 一个数据库表的操作。
//    本例子用于演示一个 一对多的关系的处理。
//
//
// 这里定义了2个 Entity， 一个是班级 (TestClass) 一个是学生（TestStudent）
//
// 在创建 Data Model 的过程中
// 首先， 简单地创建完2个表(Entity)，和表的属性(Attribute)。
//
// 属性创建完毕后， 创建 2个表的关联 (Relationsip)
// 首先，简单创建 关联的属性名称（Relationsip）， 和关联表的类型（Destination）
//
// 然后， 选择 班级 (TestClass) 的关联，  右边迁移到属性窗口。
// 将这个属性，设置为 To-Many Relationsip
//
// 本例子没有清除垃圾数据。
// 如有核对数据太麻烦，可自行删除数据库文件后，再次执行。


// 测试写数据.
extern void test_insert(TestCoreData *testCodeData);


// 测试读取数据.
extern TestClass* test_select(TestCoreData *testCodeData);

// 测试修改数据.
extern void test_update(TestCoreData *testCodeData,  TestClass *testClassData);


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TestCoreData *testCodeData = [[TestCoreData alloc] init];
     
        // 插入.
        test_insert(testCodeData);
        
        // 查询.
        TestClass *firstClass = test_select(testCodeData);
        
        if(firstClass != nil)
        {
            // 更新.
            test_update(testCodeData, firstClass);
        
            // 再检索。
            firstClass = test_select(testCodeData);
        }
    }
    return 0;
}






// 测试写数据.
void test_insert(TestCoreData *testCodeData)
{
    
    // 让CoreData在上下文中创建一个新对象(托管对象)
    TestClass *testClassData = (TestClass *)
        [NSEntityDescription insertNewObjectForEntityForName:@"TestClass" inManagedObjectContext:testCodeData.managedObjectContext];
    
    
    // 设置 班级对象的属性.
    testClassData.testClassName = @"测试班级名称";
    
    
    
    // 创建一个 学生对象.
    for(int i =1; i<=5; i++)
    {
        TestStudent *testStudent = (TestStudent *)
            [NSEntityDescription insertNewObjectForEntityForName:@"TestStudent" inManagedObjectContext:testCodeData.managedObjectContext];
        
        // 设置 学生对象的属性
        testStudent.testStudentName = [NSString stringWithFormat:@"测试学生姓名 %d", i];
        
        // 建立关联.
        testStudent.inTestClass = testClassData;
    }
    

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
TestClass* test_select(TestCoreData *testCodeData)
{
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //设置要检索哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TestClass"inManagedObjectContext:testCodeData.managedObjectContext];
    
    //设置请求实体
    [request setEntity:entity];
    

    NSError *error = nil;
    
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[testCodeData.managedObjectContext executeFetchRequest:request error:&error]mutableCopy];
    
    if (mutableFetchResult == nil)
    {
        NSLog(@"Error: %@,%@", error,[error userInfo]);
    }
    
    NSLog(@"The count of TestMain:%li",(unsigned long)[mutableFetchResult count]);
    
    for(TestClass *oneLine in mutableFetchResult)
    {
        NSLog(@"TestClass:%@;  学生数:%ld",
              oneLine.testClassName, [oneLine.studentArray count]);
        
        for(TestStudent *oneStudent in oneLine.studentArray)
        {
            NSLog(@"TestStudnet:%@", oneStudent.testStudentName);
        }
    }
    
    if([mutableFetchResult count] == 0) {
        // 如果没有检索到数据，那么返回 nil.
        return nil;
    }
    
    
    // 有数据的情况下，返回首行.
    return (TestClass*) [mutableFetchResult objectAtIndex:0];

}


// 测试更新数据.
// 注意： 这里传递进来的数据， 是 前一个步骤， 查询出来的数据。
// 如果这里简单 new 一个对象，将导致 插入一行数据.
//
void test_update(TestCoreData *testCodeData,  TestClass *testClassData)
{
    
    testClassData.testClassName = @"修改后的班级名称";
    
    
    int tmpIndex = 0;
    
    // 待删除数据集合.
    NSMutableSet *waitToRemoveSet = [[NSMutableSet alloc] init];
    
    // 注意：这里变量名字没有起好。
    // 我原本以为生成的属性， 是 NSArray 数据类型的.
    // 结果发现数据类型是 NSSet 的.
    for(TestStudent *stu in testClassData.studentArray)
    {
        if(tmpIndex % 2 == 0)
        {
            // 删除掉 奇数 的学生关联。
            // 先暂时加入  待删除集合.
            [waitToRemoveSet addObject:stu];
        }
        
        tmpIndex ++;
    }
    
    
    // 完成删除的处理.
    [testClassData removeStudentArray:waitToRemoveSet];
    
    // 注意： 上面这个操作， 不是物理删除学生数据。
    // 仅仅是 删除 班级 与 学生 之间的关联信息。
    // 对于本例子来说，就是 把 其中的 3个 学生的 所属班级的值，设置为 NULL.
    
    
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

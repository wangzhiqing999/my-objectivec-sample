//
//  main.m
//  A0200_File
//
//  Created by wangzhiqing on 13-8-9.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


extern void test_0001();
extern void test_0002();
extern void test_0003();
extern void test_0004();

extern void before_test();
extern void after_test();


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        before_test();
        
        test_0001();
        test_0002();
        test_0003();
        test_0004();
        
        
        after_test();
        
    }
    return 0;
}




#define TEST_DIR_NAME  @"test_dir_name"
#define TEST_FILE_NAME  @"testfile.txt"


//
// 主要用于创建一些  测试的 目录、文件。
//
void before_test()
{
    // 文件管理器.
    NSFileManager *NSFm = [NSFileManager defaultManager];
    NSError *error = nil;
    
    if ([NSFm createDirectoryAtPath:TEST_DIR_NAME
        withIntermediateDirectories:NO
                         attributes:nil
                              error:&error] == NO)
    {
        NSLog (@"创建 %@ 目录失败了!", TEST_DIR_NAME);
        return;
    }
    
    
    // 定义一个 C 的字符串常量， 用于向 NSData 内写数据.
    const char *string="Hi,this is a c string";
    
    // 创建NSData对象
    NSData *data=[NSData dataWithBytes:string length:strlen(string)+1];
    
    // 将数据写入文件中.
    [data writeToFile:TEST_FILE_NAME  atomically:TRUE];
    
    
}


//
// 删除 初始化的时候， 创建的 测试的 目录、文件。
//
void after_test()
{
    NSFileManager *NSFm = [NSFileManager defaultManager];
    NSError *error = nil;
    
    if ([NSFm removeItemAtPath:TEST_DIR_NAME
                         error:&error] == NO)
    {
        NSLog (@"删除 %@ 目录失败了!", TEST_DIR_NAME);
        return;
    }
    
    if ([NSFm removeItemAtPath:TEST_FILE_NAME
                         error:&error] == NO)
    {
        NSLog (@"删除 %@ 文件失败了!", TEST_FILE_NAME);
        return;
    }
}






//
// 本例子用于 测试  访问 当前路径 的基本信息.
//
void test_0001()
{
    NSLog(@"========== 0001 ==========");
    
    NSString              *path;
    NSDirectoryEnumerator *dirEnum;
    NSArray               *dirArray;
    NSUInteger              i, n;
    
    // 文件管理器.
    NSFileManager     *NSFm;
    
    // Need to create an instance of the file manager
    NSFm = [NSFileManager defaultManager];
    
    // 文件管理器 的 currentDirectoryPath 为 取得当前路径名.
    path = [NSFm currentDirectoryPath];
    NSLog (@"当前路径为： %@", path);
    
    
    // Enumerate the directory
    // 文件管理器 的 enumeratorAtPath 方法  为 取得当前路径下的 所有元素.
    dirEnum = [NSFm enumeratorAtPath: path];
    
    // 遍历 当前路径下的所有 元素， 并输出.
    while ((path = [dirEnum nextObject]) != nil)
        NSLog (@"%@", path);
    
    // 错误处理类.
    NSError *error = nil;
    // Another way to enumerate a directory
    // 文件管理器 的 contentsOfDirectoryAtPath 方法 
    dirArray = [NSFm contentsOfDirectoryAtPath:[NSFm currentDirectoryPath] error:&error];
    
    NSLog (@"遍历 当前路径下的所有 元素， 并输出:");
    
    // 遍历 当前路径下的所有 元素， 并输出.
    n = [dirArray count];
    for (i = 0; i < n; ++i)
        NSLog (@"%@", [dirArray objectAtIndex: i]);
}




//
// 本方法用于测试 创建、更名、删除 目录
// 以及 切换 当前目录的例子代码.
//
void test_0002()
{
    
    NSLog(@"========== 0002 ==========");
    
    // 文件名.
    NSString        *dirName = @"testdir";
    NSString        *newDirName = @"newdir";
    NSString        *path;
    
    // 文件管理器.
    NSFileManager     *NSFm;
    
    // Need to create an instance of the file manager
    NSFm = [NSFileManager defaultManager];
    
    // 文件管理器 的 currentDirectoryPath 为 取得当前路径名.
    path = [NSFm currentDirectoryPath];
    NSLog (@"当前路径为： %@", path);
    
    
    NSError *error = nil;
    
    // Create a new directory
    // 文件管理器 的 createDirectoryAtPath 方法  用于创建路径.
    if ([NSFm createDirectoryAtPath:dirName
        withIntermediateDirectories:NO
        attributes:nil
        error:&error] == NO)
    {
        NSLog (@"创建 %@ 目录失败了!", dirName);
        return;
    } else {
        NSLog(@"创建 %@ 目录成功！", dirName);
    }
    
    // Rename the new directory
    // 文件管理器 的 movePath 方法  用于 重命名路径.
    if( [NSFm moveItemAtPath:dirName toPath:newDirName error:&error]== NO)
    {
        NSLog (@"目录更名为 %@ 失败了!" , newDirName);
        return;
    } else {
        NSLog(@"目录更名为 %@ 成功！", newDirName);
    }
    
    
    // Change directory into the new directory
    // 文件管理器 的 changeCurrentDirectoryPath 方法  用于 变更路径.
    if ([NSFm changeCurrentDirectoryPath: newDirName] == NO) {
        NSLog (@"变更当前路径为 %@ 失败了!", newDirName);
        return;
    }
    
    
    // Now get and display current working directory
    // 文件管理器 的 currentDirectoryPath 为 取得当前路径名.
    NSLog (@"当前路径为： %@", [NSFm currentDirectoryPath]);
    
    
    // 把当前路径切换回来。
    if ([NSFm changeCurrentDirectoryPath: path] == NO) {
        NSLog (@"变更当前路径失败了!");
        // return;
    }
    
    
    // 删除前面创建的路径.
    if ([NSFm removeItemAtPath:newDirName error:&error] == NO)
    {
        NSLog (@"删除测试路径 %@ 失败了!", newDirName);
    } else {
        NSLog (@"删除测试路径 %@ 成功了!", newDirName);
    }
    
    
}





void test_0003()
{
    // 文件名.
    NSString          *fName = @"testfile.txt";
    // 文件管理器.
    NSFileManager     *NSFm;
    // 文件内容数据.
    NSData            *fileData;
    
    // Need to create an instance of the file manager
    NSFm = [NSFileManager defaultManager];
    
    
    // Read the file newfile2
    // 文件管理器 的 contentsAtPath 方法  用于 读取文件.
    fileData = [NSFm contentsAtPath: fName];
    
    if (fileData == nil) {
        NSLog (@"File read failed!\n");
        return ;
    }
    
    // Write the data to newfile3
    // 文件管理器 的 createFileAtPath 方法  用于 写入文件.
    if ([NSFm createFileAtPath: @"newfile3" contents: fileData
                    attributes: nil] == NO) {
        NSLog (@"Couldn't create the copy!\n");
        return ;
    }
    
    NSLog (@"复制文件， 由 %@ 复制到 %@ 处理成功!\n", fName, fName);
    
    // 错误处理类.
    NSError *error = nil;
    if ([NSFm removeItemAtPath:@"newfile3"
                         error:&error] == NO)
    {
        NSLog (@"删除 %@ 文件失败了!", fName);
        return;
    }
    
}



void test_0004()
{
    // 文件名.
    NSString          *fName = @"testfile.txt";
    // 文件管理器.
    NSFileManager     *NSFm;
    // 文件基本属性信息.
    NSDictionary      *attr;
    // 错误处理类.
    NSError *error = nil;
    
    
    // Need to create an instance of the file manager
    NSFm = [NSFileManager defaultManager];
    
    
    // Let's make sure our test file exists first
    // 文件管理器 类的 fileExistsAtPath 方法 用于判断 文件是否存在.
    if ([NSFm fileExistsAtPath: fName] == NO) {
        NSLog (@"File doesn't exist!\n");
        return ;
    }
    

    // Now let's make a copy
    // 文件管理器 类的 copyPath 方法 用于 复制文件.
    if ([NSFm copyItemAtPath: fName toPath: @"newfile" error:&error] == NO) {
        NSLog (@"File copy failed!\n");
        return ;
    }
    
    // Let's test to see if the two files are identical
    // 文件管理器 类的 contentsEqualAtPath 方法 用于 判断文件内容是否一致.
    if ([NSFm contentsEqualAtPath: fName andPath: @"newfile"] == NO) {
        NSLog (@"Files are not equal!\n");
        return ;
    }
    
    // Now let's rename the copy
    // 文件管理器 类的 movePath 方法 用于 对文件进行重命名处理.
    if ([NSFm moveItemAtPath: @"newfile" toPath: @"newfile2"
               error:&error] == NO) {
        NSLog (@"File rename failed!\n");
        return ;
    }
    
    // Get the size of newfile2
    // 文件管理器 类的 fileAttributesAtPath 方法 用于获取文件信息.
    if ((attr = [NSFm attributesOfItemAtPath: @"newfile2"
                              error:&error]) == nil) {
        NSLog (@"Couldn't get file attributes!\n");
        return ;
    }
    
    NSLog (@"文件大小为： %i bytes\n",
           [[attr objectForKey: NSFileSize] intValue]);
    
    // And finally, let's delete the original file
    // 文件管理器 类的 removeFileAtPath 用于删除文件.
    if ([NSFm removeItemAtPath: @"newfile2" error:&error] == NO) {
        NSLog (@"File removal failed!\n");
        return ;
    }
    
    NSLog (@"判断文件是否存在、复制文件、比较文件、重命名文件、获取文件属性、删除文件的处理执行完毕!");
}

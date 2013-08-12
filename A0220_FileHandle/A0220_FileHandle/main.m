//
//  main.m
//  A0220_FileHandle
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


extern void before_test();
extern void after_test();

extern void test_0001();
extern void test_0002();


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        before_test();
        
        
        test_0001();
        test_0002();
        
        
        after_test();
    }
    return 0;
}







#define TEST_FILE_NAME  @"testfile.txt"
#define TEST_FILE_NAME2  @"testfile2.txt"

//
// 主要用于创建一些  测试的 目录、文件。
//
void before_test()
{
    // 定义一个 C 的字符串常量， 用于向 NSData 内写数据.
    const char *string="Hi,this is a c string";
    
    // 创建NSData对象
    NSData *data=[NSData dataWithBytes:string length:strlen(string)+1];
    
    // 将数据写入文件中.
    [data writeToFile:TEST_FILE_NAME  atomically:TRUE];
    
    // 将数据写入文件中.
    [data writeToFile:TEST_FILE_NAME2  atomically:TRUE];
}


//
// 删除 初始化的时候， 创建的 测试的 目录、文件。
//
void after_test()
{
    NSFileManager *NSFm = [NSFileManager defaultManager];
    NSError *error = nil;

    if ([NSFm removeItemAtPath:TEST_FILE_NAME
                         error:&error] == NO)
    {
        NSLog (@"删除 %@ 文件失败了!", TEST_FILE_NAME);
        return;
    }
    
    if ([NSFm removeItemAtPath:TEST_FILE_NAME2
                         error:&error] == NO)
    {
        NSLog (@"删除 %@ 文件失败了!", TEST_FILE_NAME2);
        return;
    }
}




void test_0001()
{
    NSFileHandle      *inFile, *outFile;
	NSData            *buffer;
    
    

	// 打开 testfile 文件
	// NSFileHandle 类的  fileHandleForReadingAtPath 方法， 用于打开文件用于 读取.
	inFile = [NSFileHandle fileHandleForReadingAtPath: TEST_FILE_NAME];
    
	if (inFile == nil) {
	    NSLog (@"Open of testfile for reading failed\n");
	    return;
	}
    

	// NSFileManager 类的 createFileAtPath 用于 创建 文件.
	// 内容 与 属性， 都设置为 空.
	// 因为这里 仅仅创建一个空白文件
	// 填写文件内容的工作，在后面处理.
	[[NSFileManager defaultManager] createFileAtPath: @"testout.txt"
                                            contents: nil attributes: nil];
    

	// 打开 输出文件用于输出.
	// NSFileHandle 类的  fileHandleForWritingAtPath 方法， 用于打开文件用于 写入.
	outFile = [NSFileHandle fileHandleForWritingAtPath: @"testout.txt"];
    
	if (outFile == nil) {
	    NSLog (@"Open of testout for writing failed\n");
	    return;
	}
    
	// Truncate the output file since it may contain data
	[outFile truncateFileAtOffset: 0];
    

	// NSFileHandle 的 readDataToEndOfFile 方法，用于 读取 文件的内容.
	buffer = [inFile readDataToEndOfFile];
    
	// NSFileHandle 的 writeData 方法，用于 向文件 写入内容.
	[outFile writeData: buffer];
    
    

	// NSFileHandle 的 closeFile 方法，用于关闭文件.
	[inFile closeFile];
	[outFile closeFile];
}




void test_0002()
{
    NSFileHandle      *inFile, *outFile;
	NSData            *buffer;
    
    
	// Open the file testfile for reading
	// 打开 testfile 文件
	// NSFileHandle 类的  fileHandleForReadingAtPath 方法， 用于打开文件用于 读取.
	inFile = [NSFileHandle fileHandleForReadingAtPath: TEST_FILE_NAME];
    
	if (inFile == nil) {
	    NSLog (@"Open of testfile for reading failed\n");
	    return;
	}
    

	// 打开 输出文件用于输出.
	// NSFileHandle 类的  fileHandleForWritingAtPath 方法， 用于打开文件用于 写入.
	outFile = [NSFileHandle fileHandleForWritingAtPath: TEST_FILE_NAME2];
    
	if (outFile == nil) {
	    NSLog (@"Open of testout for writing failed\n");
	    return;
	}
    
    
	// NSFileHandle 类的 seekToEndOfFile 方法。
	// 将文件指针 移动到 文件末尾
	// 用于 文件追加处理.
	[outFile seekToEndOfFile];
    
	// NSFileHandle 的 readDataToEndOfFile 方法，用于 读取 文件的内容.
	buffer = [inFile readDataToEndOfFile];
    
	// NSFileHandle 的 writeData 方法，用于 向文件 写入内容.
	[outFile writeData: buffer];
    
    
	// Close the two files
	// NSFileHandle 的 closeFile 方法，用于关闭文件.
	[inFile closeFile];
	[outFile closeFile];
}

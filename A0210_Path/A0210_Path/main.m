//
//  main.m
//  A0210_Path
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


extern void test_0001();


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        test_0001();
        
    }
    return 0;
}




//
// 取得 当前目录、临时目录、Home 目录 的处理，
// 全路径、最后路径、路径中每个节点获取、文件扩展名获取
//
void test_0001() {
    
    
    // 文件管理器.
	NSFileManager     *NSFm;
    
    
	NSString          *fName = @"Objective-C.txt";
	NSString          *path, *tempdir, *extension, *homedir, *fullpath;
    

	NSArray           *components;
	int               i;
    long              n;
    
    
	// 初始化 文件管理器. 初始为 "当前目录"
	NSFm = [NSFileManager defaultManager];
    
    
	// Get the temporary working directory
	// NSTemporaryDirectory 为 临时工作目录类.
	tempdir = NSTemporaryDirectory ();
	NSLog (@"临时目录(Temporary Directory)为：%@\n", tempdir);
    
    
	// Extract the base directory from current directory
	path = [NSFm currentDirectoryPath];
	NSLog (@"当前的基本目录（全路径）为：%@\n",  path);
	NSLog (@"当前的基本目录（最后路径）为：%@\n", [path lastPathComponent]);
    
    
	// Create a full path to the file fName in current directory
	// stringByAppendingPathComponent 方法，用于 在 一个 路径后面，追加 路径/文件信息.
	fullpath = [path stringByAppendingPathComponent: fName];
	NSLog (@"对于文件 %@ 在当前目录下的全路径为： %@\n", fName, fullpath);
    
    
	// Get the file name extension
	// pathExtension 方法，是用于获取 扩展名.
	extension = [fullpath pathExtension];
	NSLog (@"文件 %@ 的扩展名为：%@\n", fullpath, extension);
    
    
	// Get user's home directory
	// NSHomeDirectory 方法， 是用于获取 用户的 home 目录的方法.
	homedir = NSHomeDirectory ();
	NSLog (@"你的 home 目录为：%@\n", homedir);
    
    
	// Divide a path into its components
	// pathComponents 方法，为获取一个 路径的 组成部分
	// 将结果返回给一个数组.
	components = [homedir pathComponents];
	// 取得数组的长度.
	n = [components count];
	NSLog (@"home 目录的组成部分：");
	for (i = 0; i < n; ++i)
        NSLog (@"  %@\n", [components objectAtIndex: i]);
    
}
//
//  main.m
//  A0006_NSData
//
//  Created by wangzhiqing on 13-8-9.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>



//
// 本例子用于 演示 NSData 的使用.
// Cocoa中使用NSData类型来实现缓冲区
// 其实你可以把NSData当作JAVA 中的字节数组
// 用于存储二进制的数据类型
// 譬如从网络下载回来的文件等。
// 对于32位应用程序NSData缓存区最多可以存储2GB的数据。
//

// NSData的创建使用如下的类方法
//   +(NSData*)dataWithBytes:(const void*) bytes length:(NSUInteger) length;
// 第一参数指定你要缓冲的数据的起始位置,也就是指针里存储的首地址,第二个参数指定数据的长度.




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 定义一个 C 的字符串常量， 用于向 NSData 内写数据.
        const char *string="Hi,this is a c string";
        
        // 创建NSData对象
        NSData *data=[NSData dataWithBytes:string length:strlen(string)+1];
        
        NSLog(@"data ------%@",data);
        NSLog(@"data length=%ld,string='%s'",(unsigned long)[data length],[data bytes]);
        
        // 将数据写入文件中.
        [data writeToFile:@"my_test_file.txt" atomically:TRUE];
        
        
        
        // ==================================================
        // 上面是  构造一个 NSData 对象， 然后把数据写到文件中去.
        // 下面是 读取上面那个文件的信息。
        // ==================================================
        
        NSFileManager *fm;
        NSData *fileData;
        
        fm = [NSFileManager defaultManager];
        
        // 读取文件.
        fileData = [fm contentsAtPath:@"my_test_file.txt"];
        
        
        NSLog(@"fileData ------%@",fileData);
        NSLog(@"fileData length=%ld,string='%s'",(unsigned long)[fileData length],[fileData bytes]);
        
        
        
        // 写入文件.
        // atomically 参数意思：如果文件已存在，如果是 YES，那么先备份后覆盖。 否则直接覆盖。
        [fileData writeToFile:@"my_test_file2.txt" atomically:YES];
        
        
        // ==================================================
        // 在实际开发过程中 经常需要将NSData类型与其他类型进行转换
        // ==================================================
        
        
        // 1.NSData 与 NSString
        // NSString --> NSData
        NSString *aString = @"1234567";
        NSData *aData = [aString dataUsingEncoding: NSUTF8StringEncoding];
        
        // NSData --> NSString
        NSString *aString2 = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
        
        NSLog(@"NSString %@ 转换为 NSData 以后， 再转换为 NSString %@", aString, aString2);
        
        
        
        // 2. NSData 与 Byte
        // Byte --> NSData
        Byte aByte[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
        NSData *bData = [[NSData alloc] initWithBytes:aByte length:24];
        
        Byte *aByte2 = (Byte *)[bData bytes];
        
        NSLog(@"Byte %s 转换为 NSData 以后， 再转换为 Byte %s", aByte, aByte2);
        
        
        
        // 3. NSData 与 UIImage
        
        /***
        
        // UIImage --> NSData
        NSData *imageData = UIImagePNGRepresentation(aimae);

        //NSData --> UIImage
        UIImage *aimage = [UIImage imageWithData: imageData];
        //从本地文件沙盒中取图片并转换为 NSData
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *name = [NSString stringWithFormat:@"ceshi.png"];
        NSString *finalPath = [path stringByAppendingPathComponent:name];
        NSData *imageData = [NSData dataWithContentsOfFile: finalPath];
        UIImage *aimage = [UIImage imageWithData: imageData];
        
        ***/
        
        
        
        
        // 4. NSData 与 NSMutableData
        // NSData --> MSMutableData
        NSData *nsData= aData;
        NSMutableData *mdata=[[NSMutableData alloc]init];
        mdata=[NSData dataWithData:nsData];
        
        NSLog(@"NSData 数据转换到 MSMutableData 以后 %@", mdata);
        
        
        
        // 5. 多个 NSData 合并为一个 NSMutableData
        
        NSMutableData *mData2 = [NSMutableData alloc];
        [mData2 appendData:aData];
        [mData2 appendData:bData];
        
        NSLog(@"多个 NSData 合并为一个 NSMutableData 以后 %@", mData2);
        
        
    }
    return 0;
}


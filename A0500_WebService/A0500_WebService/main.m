//
//  main.m
//  A0500_WebService
//
//  Created by wangzhiqing on 13-8-13.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//


// 用于 测试 下载 Web 上的文件的处理的  URL 地址.
#define WEB_DOWNLOAD_FILE @"http://192.168.253.78/index.htm"


// 用于 测试 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
#define WEB_AJAX_WCF_SERVICE_BASIC @"http://192.168.253.78/WcfTestService.svc/DoWork"

// 用于 测试 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”  (带参数的)
#define WEB_AJAX_WCF_SERVICE_BASIC_PARAM @"http://192.168.253.78/WcfTestService.svc/DoWork3?hello=%@&world=%@"


// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的.
#define WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT @"http://192.168.253.78/WcfTestService.svc/GetUser?userName=zhao"



// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的列表.
#define WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT_LIST @"http://192.168.253.78/WcfTestService.svc/GetAllUser"






#import <Foundation/Foundation.h>


// 简单测试  从网站下载文件.
extern void test_download();



// 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
extern void test_basic_wcf_service();


// 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”  (带参数的)
extern void test_basic_wcf_service_param();


// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的.
extern void test_basic_wcf_service_return_object();


// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的列表.
extern void test_basic_wcf_service_return_object_list();



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 从网站下载文件.
        test_download();
        
        // 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务” (无参数)
        test_basic_wcf_service();
        
        // 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务” (带参数的)
        test_basic_wcf_service_param();
        
        // 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
        // 返回的数据， 是一个对象的.
        test_basic_wcf_service_return_object();
        
        
        // 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
        // 返回的数据， 是一个对象的列表.
        test_basic_wcf_service_return_object_list();
    }
    
    
    return 0;
}





//
// 从网站下载文件.
//
void test_download()
{
    NSLog(@"#####  测试简单下载文件 %@", WEB_DOWNLOAD_FILE);
    
    // 首先要通过待下载资源的URL新建NSURL对象.
    NSURL *remoteTextFileURL = [NSURL URLWithString:WEB_DOWNLOAD_FILE];
    
    // 接下来，使用NSURL对象的内容新建如下NSData对象：
    NSData *remoteTextFileData = [NSData dataWithContentsOfURL:remoteTextFileURL];

    // 通过 NSData 对象的方法， 将数据写到文件当中去.
    [remoteTextFileData writeToFile:@"test.html" atomically:YES];

}


// 简单调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
void test_basic_wcf_service()
{
    NSLog(@"##### 测试调用一个 C# 当中的 启用了 Ajax 的 WCF 服务  %@", WEB_AJAX_WCF_SERVICE_BASIC);

    
    // 前面的处理  和  下载的处理  基本一致.
    
    // 首先要通过待下载资源的URL新建NSURL对象.
    NSURL *requestURL = [NSURL URLWithString:WEB_AJAX_WCF_SERVICE_BASIC];
    // 接下来，使用NSURL对象的内容新建如下NSData对象：
    NSData *responseData = [NSData dataWithContentsOfURL:requestURL];
    
    NSLog(@"调用 启用了 Ajax 的 WCF 服务 成功！");

    
    
    // 当获取到服务器的反馈以后， 就要开始完成 JSON 数据解析的处理了.
    NSError *error = nil;
    NSDictionary *resultJSON =
        [NSJSONSerialization JSONObjectWithData:responseData
                options:0  error:&error];

    if(!error)
    {
        // 注：这里为什么是 “d”.
        // 这个是因为，实际调用的地址， 是一个为 jQuery 调用的
        // 实际返回的文本内容格式为： {"d":"Today is 2013年08月13日 14:27:24:834"}
        NSString *resultStr = [resultJSON objectForKey:@"d"];
        
        NSLog(@"解析服务器返回的 JSON 数据 成功！返回结果＝%@",  resultStr);
    }
    else
    {
        NSLog(@"解析 JSON 数据的过程中， 发生了异常！");
    }
}



void test_basic_wcf_service_param()
{
    NSString *urlStr = [NSString stringWithFormat:WEB_AJAX_WCF_SERVICE_BASIC_PARAM, @"TestHello", @"TestWorld"];
    
    NSLog(@"##### 测试调用一个 C# 当中的 启用了 Ajax 的 WCF 服务  %@", urlStr);
    
    // 前面的处理  和  下载的处理  基本一致.
    
    // 首先要通过待下载资源的URL新建NSURL对象.
    NSURL *requestURL = [NSURL URLWithString:urlStr];
    // 接下来，使用NSURL对象的内容新建如下NSData对象：
    NSData *responseData = [NSData dataWithContentsOfURL:requestURL];
    
    NSLog(@"调用 启用了 Ajax 的 WCF 服务 成功！");
    
    
    
    // 当获取到服务器的反馈以后， 就要开始完成 JSON 数据解析的处理了.
    NSError *error = nil;
    NSDictionary *resultJSON =
    [NSJSONSerialization JSONObjectWithData:responseData
                                    options:0  error:&error];
    
    if(!error)
    {
        // 注：这里为什么是 “d”.
        // 这个是因为，实际调用的地址， 是一个为 jQuery 调用的
        // 实际返回的文本内容格式为： {"d":"Today is 2013年08月13日 14:27:24:834"}
        NSString *resultStr = [resultJSON objectForKey:@"d"];
        
        NSLog(@"解析服务器返回的 JSON 数据 成功！返回结果＝%@",  resultStr);
    }
    else
    {
        NSLog(@"解析 JSON 数据的过程中， 发生了异常！");
    }

}





// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的.
void test_basic_wcf_service_return_object()
{
    
    NSLog(@"##### 测试调用一个 C# 当中的 启用了 Ajax 的 WCF 服务  %@", WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT);
    
    // 前面的处理  和  下载的处理  基本一致.
    
    // 首先要通过待下载资源的URL新建NSURL对象.
    NSURL *requestURL = [NSURL URLWithString:WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT];
    // 接下来，使用NSURL对象的内容新建如下NSData对象：
    NSData *responseData = [NSData dataWithContentsOfURL:requestURL];
    
    NSLog(@"调用 启用了 Ajax 的 WCF 服务 成功！");
    
    
    
    // 当获取到服务器的反馈以后， 就要开始完成 JSON 数据解析的处理了.
    NSError *error = nil;
    NSDictionary *resultJSON =
    [NSJSONSerialization JSONObjectWithData:responseData
                                    options:0  error:&error];
    
    if(!error)
    {
        // 注：这里为什么是 “d”.
        // 这个是因为，实际调用的地址， 是一个为 jQuery 调用的
        // 实际返回的文本内容格式为： {"d":{"__type":"UserInfo:#","LoginName":"zhao","Password":"123"}}
        
        NSDictionary *resultDataObject = [resultJSON objectForKey:@"d"];

        NSString *loginName = [resultDataObject objectForKey:@"LoginName"];
        
        NSString *password = [resultDataObject objectForKey:@"Password"];
        
        
        NSLog(@"解析服务器返回的 JSON 数据 成功！返回结果 LoginName＝%@ ; Password = %@",  loginName,  password);
    }
    else
    {
        NSLog(@"解析 JSON 数据的过程中， 发生了异常！");
    }

    
}




// 用于 测试  调用一个  C# 当中的 “启用了 Ajax 的 WCF 服务”
// 返回的数据， 是一个对象的列表.
void test_basic_wcf_service_return_object_list()
{
    NSLog(@"##### 测试调用一个 C# 当中的 启用了 Ajax 的 WCF 服务  %@", WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT_LIST);
    
    // 前面的处理  和  下载的处理  基本一致.
    
    // 首先要通过待下载资源的URL新建NSURL对象.
    NSURL *requestURL = [NSURL URLWithString:WEB_AJAX_WCF_SERVICE_BASIC_RETURN_OBJECT_LIST];
    // 接下来，使用NSURL对象的内容新建如下NSData对象：
    NSData *responseData = [NSData dataWithContentsOfURL:requestURL];
    
    NSLog(@"调用 启用了 Ajax 的 WCF 服务 成功！");
    
    
    
    // 当获取到服务器的反馈以后， 就要开始完成 JSON 数据解析的处理了.
    NSError *error = nil;
    NSDictionary *resultJSON =
    [NSJSONSerialization JSONObjectWithData:responseData
                                    options:0  error:&error];
    
    if(!error)
    {
        // 注：这里为什么是 “d”.
        // 这个是因为，实际调用的地址， 是一个为 jQuery 调用的
        // 实际返回的文本内容格式为： {"d":[{"__type":"UserInfo:#","LoginName":"zhao","Password":"123"},{"__type":"UserInfo:#","LoginName":"qian","Password":"456"},{"__type":"UserInfo:#","LoginName":"sun","Password":"789"},{"__type":"UserInfo:#","LoginName":"li","Password":"abc"}]}
        
        
        NSArray *resultDataObjectList = [resultJSON objectForKey:@"d"];
        
        for(NSDictionary *resultDataObject in  resultDataObjectList)
        {
            NSString *loginName = [resultDataObject objectForKey:@"LoginName"];
        
            NSString *password = [resultDataObject objectForKey:@"Password"];
        
        
            NSLog(@"解析服务器返回的 JSON 数据 成功！返回结果 LoginName＝%@ ; Password = %@",  loginName,  password);
        }
    }
    else
    {
        NSLog(@"解析 JSON 数据的过程中， 发生了异常！");
    }
}



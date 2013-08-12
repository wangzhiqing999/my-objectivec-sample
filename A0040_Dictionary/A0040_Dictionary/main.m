//
//  main.m
//  A0040_Dictionary
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        
        NSLog(@"构造 NSDictionary");
        
        NSDictionary *dict;
        
        
        
        // 语法出错了...
        // normal initializer...
        /*
        dict = [[NSDictionary alloc]
                   initWithObjects : @"foo", @"bar", @"baz"
                   forKeys : @"one", @"two", @"three"
                   count:3
                ];
        */
        
        
        
        // 语法出错了...
        /*
        // factory method
        dict = [NSDictionary
                dictionaryWithObjects:@"foo", @"bar", @"baz"
                forKeys:@"one", @"two", @"three"
                count:3];
        */
        
        
        
        
        // just like the NSArray...
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                @"键值 one 对应的数据！", @"one",
                @"键值 two 对应的数据！", @"two",
                @"键值 three 对应的数据！", @"three",
                @"键值 four 对应的数据！", @"four",
                @"键值 five 对应的数据！", @"five",
                nil];
        
        
        NSLog(@"dict[one]=%@", [dict objectForKey:@"one"]);
        NSLog(@"dict[two]=%@", [dict objectForKey:@"two"]);
        
        
        
        // 提供一个 Key 的数组， 通过 NSDictionary 获取 Value 的数组.
        
        NSArray *keys = [NSArray arrayWithObjects:@"one", @"ten", @"two", nil];
        
        NSArray *items = [dict objectsForKeys:keys notFoundMarker:[NSNull null]];
        
        for(NSString *item in items)
        {
            NSLog(@"根据 Key 数组获取 Value 数据 ＝ %@", item);
        }
        
        
        
        
        NSArray *objects = [dict allValues];
        for(NSString *obj in objects)
        {
            NSLog(@"遍历所有的数值（allValues） ＝ %@", obj);
        }
        
        objects = [dict allKeys];
        for(NSString *obj in objects)
        {
            NSLog(@"遍历所有的关键字（allKeys） ＝ %@", obj);
        }
        
        // default is to iterate the keys
        for(NSString *key in dict)
        {
            NSLog(@"遍历所有的关键字（默认）＝ %@", [dict objectForKey:key]);
        }
        
        
        
        // ==================================================
        // 上面的是 只读的 NSDictionary （初始化赋值后不可修改）
        // 下面是 可更新的 NSMutableDictionary （允许动态修改内部数据）
        // ==================================================
        
        
        NSLog(@"##### 构造 NSMutableDictionary! ");
        
        // 初始化 NSMutableDictionary.
        NSMutableDictionary *glossary = [NSMutableDictionary dictionary];
        
        // 向 Dictionary 中填充数据.
        // 方法是：  setObject:  数据   forKey: 关键字.
        [glossary setObject:
         @"关键字 测试1 对应的数据 （动态追加的）"
                     forKey: @"测试1" ];
        
        [glossary setObject:
         @"关键字 测试2 对应的数据 （动态追加的）"
                     forKey: @"测试2"];
        
        [glossary setObject:
         @"关键字 测试3 对应的数据 （动态追加的）"
                     forKey: @"测试3"];
        
        
        
        // 从 Dictionary 中获取数据.
        // 方法是   objectForKey: 关键字.
        NSLog(@"测试1: %@",
                [glossary objectForKey: @"测试1"]);
        
        NSLog(@"测试2: %@",
                [glossary objectForKey: @"测试2"]);
        
        NSLog(@"测试3: %@",
                [glossary objectForKey: @"测试3"]);
        

        
        // 这里动态删除一个数据.
        [glossary removeObjectForKey:@"测试2"];
        
        
        
        // 元素.
        NSEnumerator *keyEnum;
        // 关键字.
        NSString     *key;
        
        
        // 取得关键字集合.
        // 获取方法是  keyEnumerator
        keyEnum = [glossary keyEnumerator];
        
        // 遍历每一个 关键字对应的 数据.
        while ( (key = [keyEnum nextObject]) != nil ) {
            // 根据 关键字 获取数据的方法是 objectForKey
            NSLog(@"Key = %@:  value =  %@", key,
                    [glossary objectForKey: key]);
        }

        
        
        
        

        
        
        
    }
    return 0;
}


//
//  main.m
//  A0007_DateTime
//
//  Created by wangzhiqing on 13-8-9.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本例子用于演示基本的 日期／时间的  处理逻辑.
//
//
//


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 取得当前时间.
        NSDate *now = [NSDate date];
        NSLog(@"现在当前系统时间＝%@", now);
        
        
        //
        // 简单的日期时间增减处理. (计算单位 ：秒)
        // 如果需要 其他的计算单位， 见后面的处理的例子。
        //
        NSDate *anHourAgo = [now dateByAddingTimeInterval:-3600];
        NSDate *anHourFromNow = [now dateByAddingTimeInterval:3600];
        NSLog(@"一小时前＝%@； 一小时后＝%@ ", anHourAgo, anHourFromNow);
        
        
        
        // 两个日期时间之间的  差值.
        NSTimeInterval timeBetween = [now timeIntervalSinceDate:anHourAgo];
        
        NSLog(@"%@ 与 %@ 之间的差值为 %f", now, anHourAgo, timeBetween);
        
        
        
        // 日期 相关的比较函数.
        NSLog(@"%@ 与 %@ 比较， 比较大的那个日期时间是：%@", now, anHourAgo, [now laterDate:anHourAgo]);
        
        NSLog(@"%@ 与 %@ 比较， 比较小的那个日期时间是：%@", now, anHourAgo, [now earlierDate:anHourAgo]);
        
        // 这里比较的返回结果为 枚举类型 NSOrderedDescending
        NSLog(@"%@ 与 %@ 比较, 结果为：%ld", now, anHourAgo,[now compare:anHourAgo]);
        
        
        
        //
        // 自己指定 年月日  来创建一个日期。
        //
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setMonth:4];
        [components setDay:13];
        [components setYear:2010];
        NSCalendar *currentCalendar = [NSCalendar currentCalendar];
        NSDate *date = [currentCalendar dateFromComponents:components];
        
        NSLog(@"通过自己指定 年／月／日 来创建一个日期对象 = %@", date);
        
        
        
        
        // 复杂单位的 日期时间 计算处理.
        NSCalendar *calendar = [NSCalendar currentCalendar];
        components = [calendar components:(NSYearCalendarUnit |
                                           NSMonthCalendarUnit |
                                           NSDayCalendarUnit)
                                 fromDate:now];
        [components setMonth:([components month] - 1)];
        
        NSDate *oneMonthAgo = [calendar dateFromComponents:components];
        NSLog(@"一月以前＝%@", oneMonthAgo);
        
        
        
        // 时区转换.
        /***
        
         暂时还有点问题......
         
        NSCalendar *japaneseCalendar =
            [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
        
        components = [calendar components:(NSYearCalendarUnit |
                                           NSMonthCalendarUnit |
                                           NSDayCalendarUnit)
                                 fromDate:now];
        
        NSDate *inJapan = [japaneseCalendar dateFromComponents:components];
        
        NSLog(@"日本时区的当前时间＝%@", inJapan);
        
        ***/
        
        
        
        // ==================================================
        // 日期 格式化为 字符串.
        // ==================================================
        
        // 日期类.
        NSDate *myDate = [NSDate date];
        
        // 格式化类 （使用 setDateStyle 设置格式）
        NSDateFormatter *f1 = [[NSDateFormatter alloc] init];
        [f1 setDateStyle:NSDateFormatterShortStyle];
        
        // 格式化类 （使用 setDateFormat 设置格式）
        NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
        [f2 setDateFormat:@"yyyy'年'MM'月'dd'日'"];
        
        // 日期格式化为 字符串.
        NSString *dateStr1 = [f1 stringFromDate:myDate];
        NSString *dateStr2 = [f2 stringFromDate:myDate];
        
        NSLog(@"日期 %@ 格式化为字符串＝ %@", myDate, dateStr1);
        NSLog(@"日期 %@ 格式化为字符串＝ %@", myDate, dateStr2);
        
        
        // ==================================================
        // 字符串 解析为 日期.
        // ==================================================
        
        NSDate *date1 = [f1 dateFromString:dateStr1];
        NSDate *date2 = [f2 dateFromString:dateStr2];

        NSLog(@"字符串 %@ 解析为日期 ＝ %@",dateStr1, date1);
        NSLog(@"字符串 %@ 解析为日期 ＝ %@",dateStr2, date2);
        
        
    }
    return 0;
}


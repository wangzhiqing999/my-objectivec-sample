//
//  main.m
//  A0010_String
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 预定义一个  NSString  对象.
        NSString *str = @"NSString 对象测试代码！ Test! ";
        // 使用 NSLog 来输出 NSString  对象 的内容.
        NSLog (@"%@\n", str);
        
        
        
        // 一个 Java 和 Objective-C 都需要注意的问题。
        
        // string1和string2 内容一样，编译期间能够确定，因此运行时共享相同地址.
        NSString *string1 = @"this is a string";
        NSString *string2 = @"this is a string"; // same object as string1
        
        // string3 内容是一样的， 但是由于是 运行时产生的， 因此地址不一样
        NSString *string3 = [@"this is " stringByAppendingString: @"a string"];
        
        
        NSLog (@"string1 == string2 结果＝%d", string1 == string2); // true
        
        NSLog (@"[string1 isEqual:string2] 结果＝%d", [string1 isEqual:string2] ); // also true
        
        NSLog (@"[string1 isEqual:string3] 结果＝%d", [string1 isEqual:string3]); // true
        
        NSLog (@"string1 == string3 结果＝%d", string1 == string3); // false
        
        
        
        
        // 简单的 NSString 的 长度、复制、追加、比较、大小写转换的例子。
        
        
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res;
        NSComparisonResult compareResult;
        
        
        // Count the number of characters
        NSLog (@"测试字符串1 的长度为: %li\n", [str1 length]);
        
        // Copy one string to another
        res = [NSString stringWithString: str1];
        NSLog (@"复制 测试字符串1: %@\n", res);
        
        // Copy one string to the end of another
        str2 = [str1 stringByAppendingString: str2];
        NSLog (@"通过追加方式复制 测试字符串: %@\n", str2);
        
        
        // 判断两个 字符串 是否一样.
        if ([str1 isEqualToString: res] == YES)
            NSLog (@"str1 == res\n");
        else
            NSLog (@"str1 != res\n");
        
        // Test if one string is <, == or > than another
        compareResult = [str1 compare: str2];
        if (compareResult == NSOrderedAscending)
            NSLog (@"str1 < str2\n");
        else if (compareResult == NSOrderedSame)
            NSLog (@"str1 == str2\n");
        else // must be NSOrderedDescending
            NSLog (@"str1 > str2\n");
        
        
        // 将字符串 转换为 大写.
        res = [str1 uppercaseString];
        NSLog (@"大写: %@\n", res);
        
        // 将字符串 转换为 小写.
        res = [str1 lowercaseString];
        NSLog (@"小写: %@\n", res);
        NSLog (@"原始: %@\n", str1);
        
        
        
        // stringWithFormat
        // 功能上面， 相当于 C# 中的 String.Format.
        
        NSString *cardName = @"Ace";
        NSString *cardSuit = @"Spades";
        str = [NSString stringWithFormat:@"The winning card is %@ of %@.",
               cardName, cardSuit];
        
        NSLog(@"使用 stringWithFormat 格式化，结果：%@", str);
        
        
        str = [NSString stringWithFormat:@"在代码的第 %d 行发现了问题.",
               123];
        NSLog(@"使用 stringWithFormat 格式化，结果：%@", str);
        
        str = [NSString stringWithFormat:@"帐户余额 %.2f .",
               123.456];
        
        NSLog(@"使用 stringWithFormat 格式化，结果：%@", str);
  
        
        
        
        NSLog(@"====================  NSRange  ====================");
        
        
        //  简单的 NSString 的 substring（FromIndex、ToIndex、WithRange）与 rangeOfString 处理的例子。
        
        NSRange  subRange;
        
        
        // Extract first 4 chars from string
        res = [str1 substringToIndex: 3];
        NSLog (@"字符串 str1 的前3个字符(substringToIndex: 3): %@\n", res);
        
        
        // Extract chars to end of string starting at index 5
        res = [str1 substringFromIndex: 5];
        NSLog (@"字符串 str1 的从第5个字符开始的后面的字符(substringFromIndex: 5): %@\n", res);
        
        
        
        // Extract chars from index 8 through 13 (6 chars)
        res = [[str1 substringFromIndex: 8] substringToIndex: 6];
        NSLog (@"字符串 str1 的从第8个字符开始到第13个字符结束(substringFromIndex: 8 substringToIndex: 6): %@\n", res);
        
        // An easier way to do the same thing
        res = [str1 substringWithRange: NSMakeRange (8, 6)];
        NSLog (@"字符串 str1 的从第8个字符开始到第13个字符结束( NSMakeRange (8, 6) ): %@\n", res);
        
        
        
        // Locate one string inside another
        subRange = [str1 rangeOfString: @"string A"];
        NSLog (@"String is at index %li, length is %li\n",
               subRange.location, subRange.length);
        
        subRange = [str1 rangeOfString: @"string B"];
        
        if (subRange.location == NSNotFound)
            NSLog (@"String not found\n");
        else
            NSLog (@"String is at index %li, length is %li\n",
                   subRange.location, subRange.length);
        

        
        
        NSLog(@"====================  NSMutableString  ====================");
        
        
        // NSMutableString 类中，对字符串的 插入、追加、查找、替换 等操作的例子。
        
        NSString            *search, *replace;
        NSMutableString     *mstr;
        NSRange             substr;
        
        
        // Create mutable string from immutable
        mstr = [NSMutableString stringWithString: str1];
        NSLog (@"使用 stringWithString 初始化：%@\n", mstr);
        
        
        // Insert characters starting at a specific index
        [mstr insertString: @" mutable" atIndex: 7];
        NSLog (@"调用 insertString 进行中间插入：%@\n", mstr);
        
        // Effective concatentation if insert at end
        [mstr insertString: @" and string B" atIndex: [mstr length]];
        NSLog (@"调用 insertString 进行末尾追加：%@\n", mstr);
        
        // Or can use appendString directly
        [mstr appendString: @" and string C"];
        NSLog (@"调用 appendString 进行末尾追加：%@\n", mstr);
        
        
        // 使用  appendFormat  进行 格式化的追加.
        [mstr appendFormat: @" and string %@ ",  @"D."];
        NSLog (@"调用 appendFormat 进行末尾追加：%@\n", mstr);
        
        
        // Delete substring based on range
        [mstr deleteCharactersInRange: NSMakeRange (16, 13)];
        NSLog (@"调用 deleteCharactersInRange 进行范围删除：%@\n", mstr);
        
        
        // Find range first and then use it for deletion
        substr = [mstr rangeOfString: @"string B and "];
        if (substr.location != NSNotFound) {
            [mstr deleteCharactersInRange: substr];
            NSLog (@"使用 rangeOfString 查找，再用 deleteCharactersInRange 删除：%@\n", mstr);
        }
        
        // Set the mutable string directly
        [mstr setString: @"This is string A"];
        NSLog (@"使用 setString 直接设置：%@\n", mstr);
        
        
        
        // Now let's replace a range of chars with another
        [mstr replaceCharactersInRange: NSMakeRange(8, 8)
                            withString: @"a mutable string"];
        NSLog (@"使用 replaceCharactersInRange 进行字符替换：%@\n", mstr);
        
        
        
        // Search and replace
        search = @"This is";
        replace = @"An example of";
        substr = [mstr rangeOfString: search];
        if (substr.location != NSNotFound) {
            [mstr replaceCharactersInRange: substr
                                withString: replace];
            NSLog (@"使用 rangeOfString 查找，再用 replaceCharactersInRange 替换：%@\n", mstr);
        }
        
        
        
        
        // Search and replace all occurrences
        search = @"a";
        replace = @"X";
        substr = [mstr rangeOfString: search];
        while (substr.location != NSNotFound) {
            [mstr replaceCharactersInRange: substr
                                withString: replace];
            substr = [mstr rangeOfString: search];
        }
        NSLog (@"使用 rangeOfString 查找，再依次全部 用 replaceCharactersInRange 替换：%@\n", mstr);
        

        
        NSLog(@"====================  Split & Join ====================");
        
        // 使用 componentsSeparatedByString 把字符串 拆分为 数组.
        str = @"This is a string of words.";
        NSArray *words = [str componentsSeparatedByString:@" "];
        
        for(int i =0; i<[words count]; i++)
        {
            NSLog(@"%@", [words objectAtIndex:i]);
        }
        
        // 使用 componentsJoinedByString 把 数组 合并为  字符串.
        str = [words componentsJoinedByString:@";"];
        
        NSLog(@"%@", str);
        
    }
    return 0;
}


//
//  NSMutableString+GUID.h
//  A0170_Category
//
//  Created by wangzhiqing on 13-8-7.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 本例子是处理 分类（Category）的例子。
// 请注意：文件名称有点奇怪， 是 NSMutableString+GUID
// 这个名称是 Xcode 生成的。
// 操作方式是 创建一个 分类（Category）
// 然后， Category 那里输入 GUID
// Category On 那里， 输入 NSMutableString
// 简单的理解， 就是 针对 NSMutableString 类，做一些 GUID 功能上的扩展。
//
//
// 通过分类( category ) 可以模块的方式向现有的类添加方法 。
// 它提供了一种简单的方式, 用它可以将类的定义模块化到相关方法的组或分类中。
// 它还提供了扩展现有类定义的简便方式, 并且不必访问类的源代码, 也无需创建子类.
//
//
// 关于分类的一些注意事项
// A、尽管分类可以访问原始类的实例变量,但是它不能添加自身的任何变量。如果需要添加变量,可以考虑创建子类。
// B、分类可以重载该类中的另一个方法,但是通常认为这种做法不可取。因为,重载之后,再不能访问原来的方法。
// C、可以拥有很多分类。
// D、和一般接口部分不同的是,不必实现分类中的所有方法。这对于程序扩展很有用,可以在该分类中声明所有方法,然后在一段时间之后才实现它。
// E、通过使用分类添加新方法来扩展类不仅会影响这个类,同时也会影响它的所有子类。
//
@interface NSMutableString (GUID)


//
// 下面是  针对 NSMutableString 类， 新增的扩展方法.
//
-(void)appendGuid;


+(id)stringWithGuid;



//
// 测试 定义了接口， 但是还没有实现的一个方法。
// 这个 会产生一些 编译警告信息。
// 
-(void)testNoTimetoWrite;


@end

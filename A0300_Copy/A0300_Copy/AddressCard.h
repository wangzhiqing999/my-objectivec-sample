//
//  AddressCard.h
//  A0300_Copy
//
//  Created by wangzhiqing on 13-8-12.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// 请注意这里的 NSCopying.
// 本类的 测试目的
// 就是测试自定义的类， 通过实现 NSCopying Protocols, 来进行 Copy 的操作.
//
@interface AddressCard : NSObject<NSCopying>



@property(nonatomic, retain) NSString *name;

@property(nonatomic, retain) NSString *email;




-(void) print;

@end

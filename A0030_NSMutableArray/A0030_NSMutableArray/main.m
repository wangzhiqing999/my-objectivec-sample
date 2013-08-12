//
//  main.m
//  A0030_NSMutableArray
//
//  Created by wangzhiqing on 13-7-30.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
#import "Addressbook.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        //  通过 AddressBook 类，来处理，将 AddressCard 对象的数据，加入 NSMutableArray 数组，以及遍历数组处理的例子。
        
        
        // 定义字符串变量.
        NSString  *aName = @"Julia Kochan";
        NSString  *aEmail = @"jewls337@axlc.com";
        NSString  *bName = @"Tony Iannino";
        NSString  *bEmail = @"tony.iannino@techfitness.com";
        NSString  *cName = @"Stephen Kochan";
        NSString  *cEmail = @"steve@kochan-wood.com";
        NSString  *dName = @"Jamie Baker";
        NSString  *dEmail = @"jbaker@kochan-wood.com";
        
        // 初始化 AddressCard 对象.
        AddressCard *card1 = [[AddressCard alloc] init];
        AddressCard *card2 = [[AddressCard alloc] init];
        AddressCard *card3 = [[AddressCard alloc] init];
        AddressCard *card4 = [[AddressCard alloc] init];
        
        // 初始化 AddressBook 对象.
        AddressBook  *myBook = [AddressBook alloc];
        
        // 设置 AddressCard 对象属性.
        [card1 setName: aName andEmail: aEmail];
        [card2 setName: bName andEmail: bEmail];
        [card3 setName: cName andEmail: cEmail];
        [card4 setName: dName andEmail: dEmail];
        
        // 初始化 address book 对象.
        myBook = [myBook initWithName: @"Linda's Address Book."];
        
        NSLog (@"初始化以后，地址簿中的记录数: %i\n", [myBook entries]);
        
        // 向 address book 对象中， 添加 AddressCard 对象.
        [myBook addCard: card1];
        [myBook addCard: card2];
        [myBook addCard: card3];
        [myBook addCard: card4];
        
        NSLog (@"添加AddressCard对象以后，地址簿中的记录数: %i\n\n", [myBook entries]);
        
        // List all the entries in the book now
        [myBook list];
        
        
        
        
        // 通过 AddressBook 类，来处理 在 NSMutableArray 数组中，查询数据 （不区分大小写） 的例子。
        
        
        
        AddressCard  *myCard;
        
        
        // Look up a person by name
        NSLog (@"尝试检索: Stephen Kochan\n");
        
        myCard = [myBook lookup: @"stephen kochan"];
        
        if (myCard != nil)
            [myCard print];
        else
            printf ("Not found!\n");
        
        
        
        // Try another lookup
        NSLog (@"尝试检索: Wes Rosenberg\n");
        myCard = [myBook lookup: @"Wes Rosenberg"];
        if (myCard != nil)
            [myCard print];
        else
            printf ("Not found!\n");
        
        
        
        
        // 通过 AddressBook 类，来处理 在 NSMutableArray 数组中，删除 元素 的处理。
        
        
        // Look up a person by name
        NSLog (@"尝试检索: Stephen Kochan\n");
        myCard = [myBook lookup: @"stephen kochan"];
        
        if (myCard != nil)
            [myCard print];
        else
            printf ("Not found!\n");
        
        
        // Now remove the entry from the phone book
        [myBook removeCard: myCard];
        
        NSLog (@"删除记录: Stephen Kochan\n");
        
        // verify it's gone
        [myBook list];
        
        
        
        // 演示 NSMutableArray 数组的 sortUsingSelector 方法，来进行排序的处理。
        
        
        NSLog (@"未排序前的 打印.\n");
        [myBook list];
        
        NSLog (@"排序.\n");
        [myBook sort];
        
        NSLog (@"排序后的打印.\n");
        [myBook list];
        
    }
    return 0;
}


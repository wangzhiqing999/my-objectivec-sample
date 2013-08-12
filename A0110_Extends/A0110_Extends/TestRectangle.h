//
//  TestRectangle.h
//  A0110_Extends
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestRectangle : NSObject
{
    // 宽.
    int _width;
    // 高.
    int _height;
}



-(int) width;
-(void) setWidth:(int)newWidth;


-(int) height;
-(void) setHeight:(int)newHeight;



-(int)area;
-(int)perimeter;



@end

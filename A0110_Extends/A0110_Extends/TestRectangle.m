//
//  TestRectangle.m
//  A0110_Extends
//
//  Created by wangzhiqing on 13-8-5.
//  Copyright (c) 2013年 wangzhiqing. All rights reserved.
//

#import "TestRectangle.h"

@implementation TestRectangle




-(int) width{
    return _width;
}
-(void) setWidth:(int)newWidth{
    _width = newWidth;
}



-(int) height{
    return _height;
}
-(void) setHeight:(int)newHeight {
    _height = newHeight;
}



-(int)area{
    return _width*_height;
}



-(int)perimeter{
    return (_width+_height)*2;
}

@end

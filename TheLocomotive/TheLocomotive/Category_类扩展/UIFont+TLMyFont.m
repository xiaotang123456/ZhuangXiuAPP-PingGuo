//
//  UIFont+TLMyFont.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/5.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "UIFont+TLMyFont.h"
#import "Header.h"

@implementation UIFont (TLMyFont)

/**
 设置文字大小
 
 @param textSize 文字标准尺寸
 @return 文字实际尺寸
 */
+ (UIFont *)myFontSize:(CGFloat)textSize
{
    UIFont *font = [[UIFont alloc]init];
    if (SCREEN_WIDTH <= 375) {
        font = [UIFont systemFontOfSize:textSize];
    } else {
        font = [UIFont systemFontOfSize:1.5*textSize];
    }
    return font;
}

@end

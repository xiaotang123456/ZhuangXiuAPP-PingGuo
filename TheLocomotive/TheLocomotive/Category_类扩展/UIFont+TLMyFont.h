//
//  UIFont+TLMyFont.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/5.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TLMyFont)

/**
 设置文字大小

 @param textSize 文字标准尺寸
 @return 文字实际尺寸
 */
+ (UIFont *)myFontSize:(CGFloat)textSize;

@end

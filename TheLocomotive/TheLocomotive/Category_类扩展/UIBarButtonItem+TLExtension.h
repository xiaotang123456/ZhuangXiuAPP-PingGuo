//
//  UIBarButtonItem+TLExtension.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/5.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TLExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end

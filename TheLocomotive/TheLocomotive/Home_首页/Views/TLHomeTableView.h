//
//  TLHomeTableView.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/6.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLHomeTableView : UITableView
/** 轮播图片数组 */
@property (nonatomic, strong)NSArray *photosArr;
@property (nonatomic, strong)NSArray *hotArr;
@property (nonatomic,copy) NSString *STR;
@property (nonatomic) NSInteger TAG;
@end

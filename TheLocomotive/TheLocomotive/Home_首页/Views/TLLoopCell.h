//
//  TLLoopCell.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/7.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLLoopCell : UITableViewCell

/** 轮播图片数组 */
@property (nonatomic, strong)NSArray *photosArr;

+ (instancetype)tlloopCellWithTableView:(UITableView *)tableView;

@end

//
//  TLMyCell.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLMyCell : UITableViewCell


/** 标题 */
@property (nonatomic, copy)NSString *title;
/** Icon名称 */
@property (nonatomic, copy)NSString *IconName;

+ (instancetype)tlmycellWithTableView:(UITableView *)tableView;


@end

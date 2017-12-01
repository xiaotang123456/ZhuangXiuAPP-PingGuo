//
//  TLTeamCell.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTeamCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *IntroductionLabel;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *IntroductionText;
+ (instancetype)tlteamCellWithTableView:(UITableView *)tabdleView;

@end

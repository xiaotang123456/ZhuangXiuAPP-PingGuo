//
//  TLWorksCell.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^KDianzanCall)();
typedef void (^KCancelDianzanCall)();
@interface TLWorksCell : UITableViewCell

/** 设计师头像ImageView */
@property (weak, nonatomic) IBOutlet UIImageView *DesginersIconImgView;
/** 设计师姓名 */
@property (weak, nonatomic) IBOutlet UILabel *DesginersNameLabel;
/** 作品图片ImageView */
@property (weak, nonatomic) IBOutlet UIImageView *WorksImgView;

/** 作品主题/标题 */
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
/** 作品简介 */
@property (weak, nonatomic) IBOutlet UILabel *IntroduceLabel;
/** 作品浏览人数 */
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel;
/** 点赞数量 */
@property (weak, nonatomic) IBOutlet UIButton *DianZanBtn;

@property (weak, nonatomic) IBOutlet UIImageView *EyesImgView;

@property(nonatomic,strong) KDianzanCall kDianzanCall;
@property(nonatomic,strong) KCancelDianzanCall kCancelDianzanCall;

@property (nonatomic, copy) NSString *title;

+ (instancetype)tlworksCellWithTableVview:(UITableView *)tableView;

-(void)setKDianzanCall:(KDianzanCall)kDianzanCall;
-(void)setKCancelDianzanCall:(KCancelDianzanCall)kCancelDianzanCall;

@end

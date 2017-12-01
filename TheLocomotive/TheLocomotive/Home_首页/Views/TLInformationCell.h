//
//  TLInformationCell.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLInformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgeViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameL;



@property (nonatomic, copy) NSString *title;
+ (instancetype)TLInformationCellWithTableView:(UITableView *)tabdleView;

@end

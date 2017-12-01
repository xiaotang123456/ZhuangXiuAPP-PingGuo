//
//  TLMyCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLMyCell.h"

@interface TLMyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *ImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation TLMyCell

+ (instancetype)tlmycellWithTableView:(UITableView *)tableView
{
    
    
    TLMyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLMyCell"];
    if (cell == nil) {
        cell = [[TLMyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLMyCell"];
    }
    return cell;
    
}


- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
    self.ImgView.image = [UIImage imageNamed:title];
}

- (void)setIconName:(NSString *)IconName
{
    _IconName = IconName;
    self.ImgView.image = [UIImage imageNamed:IconName];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

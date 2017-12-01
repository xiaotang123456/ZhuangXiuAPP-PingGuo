//
//  TLWorksCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLWorksCell.h"
#import "Header.h"

@interface TLWorksCell ()


@end

@implementation TLWorksCell

+ (instancetype)tlworksCellWithTableVview:(UITableView *)tableView
{
    TLWorksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLWorksCell"];
    if (cell == nil) {
        cell = [[TLWorksCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLWorksCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



#pragma mark --- /*** 点赞按钮点击事件
- (IBAction)DianZanButionAction:(UIButton *)sender {
    
    TLNSLog(@"点个赞");
    sender.selected = !sender.isSelected;
    
    self.DianZanBtn.layer.cornerRadius = 5;
    self.DianZanBtn.layer.masksToBounds = YES;
    if (sender.selected) {
        if (_kDianzanCall) {
            _kDianzanCall();
        }
    }else{//取消
        if (_kCancelDianzanCall) {
            _kCancelDianzanCall();
        }
    }
}



- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.TitleLabel.text = title;
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

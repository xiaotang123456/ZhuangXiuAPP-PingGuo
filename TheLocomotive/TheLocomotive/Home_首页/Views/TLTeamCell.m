//
//  TLTeamCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLTeamCell.h"

@interface TLTeamCell ()


@end

@implementation TLTeamCell


+ (instancetype)tlteamCellWithTableView:(UITableView *)tabdleView
{
    TLTeamCell *cell = [tabdleView dequeueReusableCellWithIdentifier:@"TLTeamCell"];
    if (cell == nil) {
        cell = [[TLTeamCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLTeamCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.TitleLabel.text = title;
}


- (void)setIntroductionText:(NSString *)IntroductionText
{
    _IntroductionText = IntroductionText;
    
    self.IntroductionLabel.text = IntroductionText;
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

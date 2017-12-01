//
//  TLInformationCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLInformationCell.h"

@interface TLInformationCell ()



@end

@implementation TLInformationCell

+ (instancetype)TLInformationCellWithTableView:(UITableView *)tabdleView
{
    TLInformationCell *cell = [tabdleView dequeueReusableCellWithIdentifier:@"TLInformationCell"];
    if (cell == nil) {
        cell = [[TLInformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLInformationCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.nameL.text = title;
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

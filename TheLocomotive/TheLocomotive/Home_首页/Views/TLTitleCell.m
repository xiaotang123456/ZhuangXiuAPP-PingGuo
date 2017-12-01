//
//  TLTitleCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/7.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLTitleCell.h"
#import "Header.h"

@interface TLTitleCell ()

/** 资料Label */
@property (weak, nonatomic) IBOutlet UILabel *DataLble;
/** 作品Label */
@property (weak, nonatomic) IBOutlet UILabel *WorksLabel;
/** 团队Label */
@property (weak, nonatomic) IBOutlet UILabel *TeamLabel;

@end


@implementation TLTitleCell

+ (instancetype)tltitleCellWithTableView:(UITableView *)tableView
{
    TLTitleCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TLTitleCell"];
    if (cell == nil) {
        cell = [[TLTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLTitleCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark --- /*** 资料、作品、团队按钮点击事件
//资料
- (IBAction)DatasButtonAction:(UIButton *)sender {
    
    TLNSLog(@"点击了资料按钮");
    NSString *url = [NSString stringWithFormat:@"%@FrmData?sid=%@",APP_URL,APPIDENTIFICATION];
    NSDictionary *dict = @{@"url":url};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeteam" object:nil userInfo:dict];
}
//作品
- (IBAction)WorksButtonAction:(UIButton *)sender {
    
    TLNSLog(@"点击了作品按钮");
    NSString *url = [NSString stringWithFormat:@"%@FrmWorksQuery?sid=%@",APP_URL,APPIDENTIFICATION];
    NSDictionary *dict = @{@"url":url};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeteam" object:nil userInfo:dict];
    
}
//团队
- (IBAction)TeamButtonAction:(UIButton *)sender {
    
    TLNSLog(@"点击了团队按钮");
    NSString *url = [NSString stringWithFormat:@"%@FrmTeam?sid=%@",APP_URL,APPIDENTIFICATION];
    NSDictionary *dict = @{@"url":url};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeteam" object:nil userInfo:dict];
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

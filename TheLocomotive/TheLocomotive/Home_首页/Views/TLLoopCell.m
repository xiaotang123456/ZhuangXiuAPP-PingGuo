//
//  TLLoopCell.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/7.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLLoopCell.h"
#import "TLShufflingFigure.h"
#import "Header.h"
#import "JAScrollView.h"
@interface TLLoopCell ()

@property (nonatomic, strong)TLShufflingFigure *LBT;

@end

@implementation TLLoopCell


+ (instancetype)tlloopCellWithTableView:(UITableView *)tableView
{
    TLLoopCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"TLLoopCell"];
    if (Cell == nil) {
        
        Cell = [[TLLoopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TLLoopCell"];
    }
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Cell;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = TLRGBAColor(240, 240, 240, 1);
     
    }
    return self;
}


- (void)CreatedSubViews
{

    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 19 * SCREEN_WIDTH/50);
    JAScrollView *scroll = [[JAScrollView alloc] initWithFrame:rect withImages:self.photosArr withIsRunloop:NO withBlock:^(NSInteger index) {
        //   NSLog(@"点击了index%zd",index);
        
    }];
    [self.contentView addSubview:scroll];
}

- (void)setPhotosArr:(NSArray *)photosArr
{
    _photosArr = photosArr;
    if (photosArr.count > 0) {
        self.LBT.photosArr = photosArr;
    }
     [self CreatedSubViews];
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

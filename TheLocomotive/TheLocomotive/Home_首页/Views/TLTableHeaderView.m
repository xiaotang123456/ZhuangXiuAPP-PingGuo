//
//  TLTableHeaderView.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/7.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLTableHeaderView.h"
#import "Header.h"

#define SELFWIDTH self.frame.size.width
#define SELFHIGHT self.frame.size.height

@interface TLTableHeaderView ()
/** 热门作品 */
@property (weak, nonatomic) IBOutlet UIButton *WorksBtn;
/** 精选资料 */
@property (weak, nonatomic) IBOutlet UIButton *DatasBtn;
/** 推荐团队 */
@property (weak, nonatomic) IBOutlet UIButton *TeamBtn;
/** 资讯动态 */
@property (weak, nonatomic) IBOutlet UIButton *InformationBtn;
/** 底部滑动View */
@property (weak, nonatomic) IBOutlet UIView *SlippageView;



@end

@implementation TLTableHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"TLTableHeaderView" owner:nil options:nil];
        self = nibArray[0];
        self.frame = frame;
        
        
    }
    return self;
}

#pragma mark --- /*** 按钮点击事件
/** 热门作品 */
- (IBAction)WorksBtnAction:(UIButton *)sender {
    
    [self SlidingSlippageViewAndchangeButtonTitleColor:sender];
    [self TLTableHeaderViewDelegateWithButton:sender];
    TLNSLog(@"点击按钮：%@",sender.titleLabel.text);

    
}
/** 精选资料 */
- (IBAction)DatasBtnAction:(UIButton *)sender {
    
    [self SlidingSlippageViewAndchangeButtonTitleColor:sender];
    [self TLTableHeaderViewDelegateWithButton:sender];
    
    TLNSLog(@"点击按钮：%@",sender.titleLabel.text);
   
    
   
}
/** 推荐团队 */
- (IBAction)TeamBtnAction:(UIButton *)sender {
    
    
    [self SlidingSlippageViewAndchangeButtonTitleColor:sender];
    [self TLTableHeaderViewDelegateWithButton:sender];

    TLNSLog(@"点击按钮：%@",sender.titleLabel.text);

}
/** 资讯动态 */
- (IBAction)InformationBtnAction:(UIButton *)sender {
    
    [self SlidingSlippageViewAndchangeButtonTitleColor:sender];
    [self TLTableHeaderViewDelegateWithButton:sender];
    TLNSLog(@"点击按钮：%@",sender.titleLabel.text);

}

#pragma mark --- /*** 滑动底部View及改变文字颜色
- (void)SlidingSlippageViewAndchangeButtonTitleColor:(UIButton *)sender
{
    
    for (UIButton *btn in self.subviews) {
        
        if (btn.tag == sender.tag) {
            
            sender.selected = YES;
            
            CGFloat X = sender.frame.origin.x;
            //滑动底部View
           
            [UIView animateWithDuration:0.5 animations:^{
                CGRect frame = self.SlippageView.frame;
                frame.origin.x = X - 5;
                self.SlippageView.frame = frame;
            } completion:^(BOOL finished) {
            
            }];
            
        }else{
            
            if ([btn isKindOfClass:[UIButton class]]) {
                btn.selected = NO;
            } else {
                
            }
            
        }
        
    }
}


#pragma mark --- /*** 布局子控件
- (void)layoutSubviews
{
    /**
     *    Margin:按钮间的间距
     *    BtnWith:按钮的宽度
     *    Btnhhight:按钮的高度
     */
    
    CGFloat BtnHight = 14;
    CGFloat BtnWidth = 70;
    CGFloat Margin = (SELFWIDTH - (4 * BtnWidth))/5;
    
    self.WorksBtn.frame = CGRectMake(Margin, 16, BtnWidth, BtnHight);
    self.DatasBtn.frame = CGRectMake((2 * Margin) + BtnWidth, 16, BtnWidth, BtnHight);
    self.TeamBtn.frame = CGRectMake((3 * Margin) + (2 * BtnWidth) , 16, BtnWidth, BtnHight);
    self.InformationBtn.frame = CGRectMake((4 * Margin) + (3 * BtnWidth), 16, BtnWidth, BtnHight);
    if ([self.title isEqualToString:@"热门作品"]) {
          CGFloat X = self.WorksBtn.frame.origin.x;
        self.WorksBtn.selected = YES;
          self.SlippageView.frame = CGRectMake(Margin - 5, 44, 80, 2);
    }else if ([self.title isEqualToString:@"精选资料"]){
         CGFloat X = self.DatasBtn.frame.origin.x;
          self.DatasBtn.selected = YES;
        self.WorksBtn.selected = NO;
          self.SlippageView.frame = CGRectMake(X - 5, 44, 80, 2);
    }else if ([self.title isEqualToString:@"推荐团队"]){
         CGFloat X = self.TeamBtn.frame.origin.x;
         self.TeamBtn.selected = YES;
         self.WorksBtn.selected = NO;
          self.SlippageView.frame = CGRectMake(X - 5, 44, 80, 2);
    }else if ([self.title isEqualToString:@"资讯动态"]){
         CGFloat X = self.InformationBtn.frame.origin.x;
         self.InformationBtn.selected = YES;
         self.WorksBtn.selected = NO;
        self.SlippageView.frame = CGRectMake(X - 5, 44, 80, 2);
    }
  
   // self.SlippageView.frame = CGRectMake(Margin - 5, 44, 80, 2);
    
}


#pragma mark --- /*** 设置调用TLTableHeaderViewDelegate代理方法

- (void)TLTableHeaderViewDelegateWithButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(tltableheaderViewWithData:WithButtonTag:)]) {
        
        [self.delegate tltableheaderViewWithData:sender.titleLabel.text WithButtonTag:sender.tag];
    }
}







@end

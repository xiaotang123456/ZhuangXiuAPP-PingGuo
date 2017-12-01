//
//  TLMyHeaderView.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLMyHeaderView.h"
#import "Header.h"

@interface TLMyHeaderView ()
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *headImage;

/** 姓名 */
@property (weak, nonatomic) IBOutlet UIButton *NameBtn;
/** VIP */
@property (weak, nonatomic) IBOutlet UIButton *ViPBtn;


@end

@implementation TLMyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"TLMyHeaderView" owner:nil options:nil];
        self = nibArray[0];
//        self.layer.cornerRadius = 20;
//        self.layer.masksToBounds = YES;
//        self.layer.borderWidth = 1;
//        self.layer.borderColor =
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:USERICON]];
        self.headImage.layer.cornerRadius = 30;
        self.headImage.clipsToBounds = YES;
        self.headImage.userInteractionEnabled = YES;
        self.frame = frame;
        [self.NameBtn setTitle:USERNAME forState:UIControlStateNormal];
        self.headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headBtn.frame  = self.headImage.bounds;
        self.headBtn.backgroundColor = [UIColor clearColor];
        [self.headImage addSubview:self.headBtn];
        
    }
    return self;
}





#pragma mark --- /*** 点击事件

/** 姓名 */
- (IBAction)NameButtonAction:(UIButton *)sender {
    
}

/** VIP */
- (IBAction)VIPButtonAction:(UIButton *)sender {
    
}






@end

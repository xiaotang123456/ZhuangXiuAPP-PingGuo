//
//  TLWelcomeViewController.m
//  TheLocomotive
//
//  Created by user on 2017/11/22.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLWelcomeViewController.h"
#import "AppDelegate.h"
#import "TLLoginController.h"
#import "Header.h"

#define MaxPage  4

@interface TLWelcomeViewController ()<UIScrollViewDelegate>

@end

@implementation TLWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
    
}

-(void)initSubView
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    UIScrollView *scrollview=[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:scrollview];
    scrollview.contentSize=CGSizeMake(width*MaxPage,height-20);
    scrollview.pagingEnabled=YES;
    scrollview.delegate=self;
    scrollview.showsHorizontalScrollIndicator=NO;
    for (int i=0; i<MaxPage; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(width*i, 0, width, height)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"welcome%d",i]];
        [scrollview addSubview:imageView];
        if (i==MaxPage-1) {
            UITapGestureRecognizer * tgs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(BtnDidClick)];
            [imageView setUserInteractionEnabled:YES];
            [imageView addGestureRecognizer:tgs];
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    if (scrollView.contentOffset.x/width>MaxPage-1) {
        [self BtnDidClick];
    }
}

-(void)BtnDidClick
{
    [[NSUserDefaults standardUserDefaults]setObject:@"yes" forKey:@"fristGuide"];
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha=0;
    } completion:^(BOOL finished) {
        TLLoginController *loginVC = [[TLLoginController alloc]init];
        AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        appdelegate.window.rootViewController = loginVC;
    }];
    
}
-(void)dealloc
{
    NSLog(@"dealloc释放");
}




@end

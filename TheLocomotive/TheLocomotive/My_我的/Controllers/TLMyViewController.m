//
//  TLMyViewController.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/3.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLMyViewController.h"
#import "TLMyTableView.h"
#import "Header.h"
#import "TLWebViewController.h"
#import "TLLoginController.h"
@interface TLMyViewController ()

@property (nonatomic, strong) TLMyTableView *myTableView;
@property (nonatomic, strong)NSArray   *titleArray;

@end

@implementation TLMyViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = TLRGBAColor(250, 250, 250, 1);
    
    
    self.titleArray = @[@"我的作品",@"关于我们",@"意见反馈",@"我的邀请码",@"我的积分",@"退出登录"];
    //添加TableView
    self.myTableView = [[TLMyTableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.myTableView.tableFooterView = [[UIView alloc] init];
    self.myTableView.titleArray = self.titleArray;
    [self.view  addSubview:self.myTableView];
    [self.myTableView reloadData];
    __weak TLMyViewController *weakself = self;
    self.myTableView.kSeleCall = ^(NSString *url) {
        TLWebViewController *we = [[TLWebViewController alloc] init];
        we.aURL = url;
        we.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:we animated:YES];
    };
    self.myTableView.kTuichuCall = ^{
        TLLoginController *log = [[TLLoginController alloc] init];
        [weakself presentViewController:log animated:YES completion:nil];
    };
    
}








- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end

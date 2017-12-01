//
//  TLMyTableView.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLMyTableView.h"
#import "TLMyHeaderView.h"
#import "Header.h"
#import "TLMyCell.h"

@interface TLMyTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TLMyTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate  = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
    
        [self RegisterCell];
    }
    return self;
}

#pragma mark --- /*** 注册Cell
- (void)RegisterCell
{
    //headerView
    [self registerNib:[UINib nibWithNibName:@"TLMyHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"TLMyHeaderView"];
    //cell
    [self registerNib:[UINib nibWithNibName:@"TLMyCell" bundle:nil] forCellReuseIdentifier:@"TLMyCell"];
}
#pragma mark --- /*** 数据源UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TLMyCell *cell = [TLMyCell tlmycellWithTableView:tableView];
    
      cell.title = self.titleArray[indexPath.row];
     return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *url ;
    if (indexPath.row == 0) {
        url = [NSString stringWithFormat:@"%@?type=my&sid=%@",MyWorker,APPIDENTIFICATION];
        if (_kSeleCall) {
            _kSeleCall(url);
        }
    }else if (indexPath.row == 1){
        url = [NSString stringWithFormat:@"%@?sid=%@",AboutMy,APPIDENTIFICATION];
        if (_kSeleCall) {
            _kSeleCall(url);
        }
    }else if (indexPath.row == 2){
        url = [NSString stringWithFormat:@"%@?sid=%@",SugtionBack,APPIDENTIFICATION];
        if (_kSeleCall) {
            _kSeleCall(url);
        }
    }else if (indexPath.row == 3){
        url = [NSString stringWithFormat:@"%@?code=%@&sid=%@",MyInviteCode,USERCODE,APPIDENTIFICATION];
        if (_kSeleCall) {
            _kSeleCall(url);
        }
    }else if (indexPath.row == 4){
        url = [NSString stringWithFormat:@"%@?sid=%@",MyJiFen,APPIDENTIFICATION];
        if (_kSeleCall) {
            _kSeleCall(url);
        }
    }else if (indexPath.row == 5){
       
        if (_kTuichuCall) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:@"" forKey:@"userName"];
            [defaults setObject:@"" forKey:@"userIcon"];
            [defaults setObject:@"" forKey:@"APPIdentification"];
            [defaults setObject:@"" forKey:@"Code"];
            [defaults setObject:@"" forKey:@"Vip"];
            [defaults synchronize];
            _kTuichuCall();
        }
        
    }
   
    
}
#pragma mark --- /*** 代理UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//headerView高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (SCREEN_WIDTH < 375) {
        return 165;

    }
    return 202;
}

//headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TLMyHeaderView *headerView = [[TLMyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    [headerView.headBtn addTarget:self action:@selector(headEdit) forControlEvents:UIControlEventTouchUpInside];
    return headerView;
}

-(void)headEdit{
    NSString *url = [NSString stringWithFormat:@"%@?sid=%@",MyEditURL,APPIDENTIFICATION];
    if (_kSeleCall) {
        _kSeleCall(url);
    }
    
}



@end

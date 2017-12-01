//
//  TLHomeViewController.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/3.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLHomeViewController.h"
#import "UIBarButtonItem+TLExtension.h"
#import "Header.h"
#import "TLHomeTableView.h"
#import "DSImageBrowse.h"
#import "TLHotMOdel.h"
#import "TLWebViewController.h"
@interface TLHomeViewController ()

@property (nonatomic, strong)TLHomeTableView *homeTableView;
//广告
@property(nonatomic,strong) NSMutableArray *adImages;
@property(nonatomic,strong) NSMutableArray *hotArray;
//图片详细
@property(nonatomic,strong) NSMutableArray *phoneImages;
@end

@implementation TLHomeViewController
-(NSMutableArray *)adImages
{
    if (!_adImages) {
        _adImages = [NSMutableArray array];
    }
    return _adImages;
}
-(NSMutableArray *)phoneImages
{
    if (!_phoneImages) {
        _phoneImages = [NSMutableArray array];
    }
    return _phoneImages;
}
-(NSMutableArray *)hotArray
{
    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

#pragma mark --- /*** 方法viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TLRGBAColor(240, 240, 240, 1);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"搜索" highImage:@"" target:self action:@selector(rightButtonAction)];
    //创建子控件
    [self CreateSubVies];
   
    //加载轮播图数据
    [self DownloadDataForURL:LOOP_URL WithParameters:@{}];
    //加载热门作品
    
    [self DownloadDataForURL1:@"0"];
    
    
    
    
}

#pragma mark --- /*** 创建子控件
- (void)CreateSubVies
{
    self.homeTableView = [[TLHomeTableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 108) style:UITableViewStyleGrouped];
   
    [self.view addSubview:self.homeTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBgColor:) name:@"changeBgColor" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeteam:) name:@"changeteam" object:nil];
}
- (void)changeBgColor:(NSNotification *)notification{
    
   NSString *str = notification.userInfo[@"type"];
    self.homeTableView.STR = str;
    if ([str isEqualToString:@"热门作品"]) {
        self.homeTableView.TAG = 0;
        [self DownloadDataForURL1:@"0"];
        
    }else if ([str isEqualToString:@"精选资料"]){
         self.homeTableView.TAG = 1;
         [self DownloadDataForURL1:@"1"];
    }else if ([str isEqualToString:@"推荐团队"]){
         self.homeTableView.TAG = 2;
         [self DownloadDataForURL1:@"2"];
    }else if ([str isEqualToString:@"资讯动态"]){
         self.homeTableView.TAG = 3;
         [self DownloadDataForURL1:@"3"];
    }
 
}
-(void)changeteam:(NSNotification *)notification{
    
     NSString *str = notification.userInfo[@"url"];
    TLWebViewController *we = [[TLWebViewController alloc] init];
    we.aURL = str;
    we.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:we animated:YES];
}
#pragma mark --- /*** 加载网络数据
//轮播图
- (void)DownloadDataForURL:(NSString *)URLString WithParameters:(NSDictionary *)parameters
{
    
    TLNetworking *TLNet = [TLNetworking sharedInstance];
    
    [TLNet GET:URLString parameters:parameters Withsuccess:^(id responseObject) {
        
      //  TLNSLog(@"首页加载数据成功：%@",responseObject);
        if ([responseObject[@"status"] isEqualToString:@"true"]) {
            NSArray *arr = responseObject[@"data"];
            for (NSDictionary *dict  in arr) {
                [self.adImages addObject:dict[@"imgUrl_"]];
                NSLog(@"dict = %@",dict[@"imgUrl_"]);
            }
            self.homeTableView.photosArr = self.adImages;
        }
         [self.homeTableView reloadData];
        
    } WithFailure:^(NSError *error) {
        
        TLNSLog(@"首页加载数据失败：%@",error);
        
        
    }];
    
}
//作品
- (void)DownloadDataForURL1:(NSString *)type
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    TLNetworking *TLNet = [TLNetworking sharedInstance];
    NSDictionary *worksDict = @{@"page":@"1",@"size":@"20",@"uCode_":USERCODE};
    NSString *urlstr ;
    if ([type isEqualToString:@"0"]) {
        urlstr = WORKS_URL;
    }else if ([type isEqualToString:@"1"]){
        urlstr = SELE_URL;
    }else if ([type isEqualToString:@"2"]){
        urlstr = TEAMS_URL;
    }else if ([type isEqualToString:@"3"]){
        urlstr = INFORMATION_URL;
    }
    [self.hotArray removeAllObjects];
    [TLNet GET:urlstr parameters:worksDict Withsuccess:^(id responseObject) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
          TLNSLog(@"首页加载数据成功：%@",responseObject);
        if ([responseObject[@"status"] isEqualToString:@"true"]) {
            NSArray *arr = responseObject[@"data"];
            [self handleData:arr];
        }
     
        
    } WithFailure:^(NSError *error) {
         [MBProgressHUD hideHUDForView:self.view animated:YES];
        TLNSLog(@"首页加载数据失败：%@",error);
        
        
    }];
    
}

-(void)handleData:(NSArray *)array{
    
    for (NSDictionary *dict in array) {
        TLHotMOdel *model = [[TLHotMOdel alloc] init];
        model.workId = dict[@"id_"];
        model.dianzanCount_ = dict[@"dianzanCount_"];
        model.dianzanCount1_ = dict[@"dianzanCount1_"];
        model.imgUrl1_ = dict[@"imgUrl1_"];
        model.imgUrl_ = dict[@"imgUrl_"];
        model.remark_ = dict[@"remark_"];
        model.sumLook_ = dict[@"sumLook_"];
        model.title_ = dict[@"title_"];
        model.userName_ = dict[@"userName_"];
        [self.hotArray addObject:model];
    }
    self.homeTableView.hotArr = self.hotArray;
  //  [self.homeTableView reloadData];
    //刷新当前section
    NSIndexSet *indexset = [[NSIndexSet alloc]initWithIndex:1];
    [self.homeTableView reloadSections:indexset withRowAnimation:UITableViewRowAnimationNone];
    
}
#pragma mark - UIView Event
//当前暂无数据所以传的indexpath  后期有数据直接传model就好
-(void)pushToCheckPhote:(NSDictionary *)dict
{
    TLNetworking *TLNet = [TLNetworking sharedInstance];
    [self.phoneImages removeAllObjects];
    [TLNet GET:IMAGE_URL parameters:dict Withsuccess:^(id responseObject) {
        
        //  TLNSLog(@"图片加载数据成功：%@",responseObject);
        if ([responseObject[@"status"] isEqualToString:@"true"]) {
            NSArray *arr = responseObject[@"data"];
            for (NSDictionary *dict  in arr) {
                NSString *str = dict[@"imgUrl_"];
                str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
                [self.phoneImages addObject:str];
                
            }
            DSWebImageViewController *vc = [[DSWebImageViewController alloc] initWithImages:self.phoneImages currentImage:self.phoneImages[0]];
            [self.navigationController pushViewController:vc animated:YES];
        }
       
        
    } WithFailure:^(NSError *error) {
        
        TLNSLog(@"首页加载数据失败：%@",error);
        
        
    }];
    
  
}
-(void)pushToCheckPhote1:(NSDictionary *)dict{
    NSString *aurl = dict[@"url"];
    TLWebViewController *we = [[TLWebViewController alloc] init];
    we.aURL = aurl;
    we.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:we animated:YES];
}
#pragma mark --- /*** 右边搜索按钮点击事件
- (void)rightButtonAction
{
    TLNSLog(@"首页搜索按钮");
    NSString *url = [NSString stringWithFormat:@"%@?sid=%@",MySearch,APPIDENTIFICATION];
    TLWebViewController *we = [[TLWebViewController alloc] init];
    we.aURL = url;
    we.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:we animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

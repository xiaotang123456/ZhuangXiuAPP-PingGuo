//
//  TLBaseTabBarController.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/3.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLBaseTabBarController.h"
#import "TLHomeViewController.h"
#import "TLMyViewController.h"
#import "TLNavigationController.h"
#import "Header.h"
#import "TLLoginController.h"



@interface TLBaseTabBarController ()

@end

@implementation TLBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UINavigationBar appearance];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    //首页
    [self setupChildVc:[[TLHomeViewController alloc]init] title:@"首页" image:@"首页1" selectedImage:@"首页2"];
    
    
    //我的
    [self setupChildVc:[[TLMyViewController alloc]init] title:@"我的" image:@"我的1" selectedImage:@"我的2"];
    
}





#pragma mark --- 初始化子控制器
/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    TLNavigationController *nvc = [[TLNavigationController alloc]initWithRootViewController:vc];
    nvc.navigationBar.barTintColor  = TLRGBAColor(255, 255, 255, 1);
    // 添加为子控制器
    [self addChildViewController:nvc];
}




@end

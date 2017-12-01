//
//  TLLoginController.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/9.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLLoginController.h"
#import "Header.h"
#import "TLBaseModel.h"
#import "TLLoginModel.h"
#import "TLHomeViewController.h"
#import "TLBaseTabBarController.h"
#import "TLReristerController.h"


@interface TLLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;

@end

@implementation TLLoginController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.LoginBtn.layer.cornerRadius = 5;
    
    //账号输入框设置
    UIImageView *Imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"手机号"]];
    Imgview.contentMode = UIViewContentModeCenter;
    Imgview.frame = CGRectMake(0, 0, 50,0);
    self.userNameTF.leftView = Imgview;
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    //密码输入框设置
    UIImageView *pswImgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"密码"]];
    pswImgview.contentMode = UIViewContentModeCenter;
    pswImgview.frame = CGRectMake(0, 0, 50,0);
    self.pswTF.leftView = pswImgview;
    self.pswTF.leftViewMode = UITextFieldViewModeAlways;
    
}

- (IBAction)backButtonAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --- /*** 按钮点击事件
//登录按钮点击事件
- (IBAction)LoginButtonAction:(UIButton *)sender {
    TLNSLog(@"点击了登录按钮");
    
    if (self.userNameTF.text.length == 0 || self.pswTF.text.length == 0) {
        
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:nil message:@"用户名或密码都不能为空" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alerVC removeFromParentViewController];
        }];
        
        [alerVC addAction:action];
        
        [self presentViewController:alerVC animated:YES completion:nil];
        
    }
    
    
    TLNetworking  *TLNet = [TLNetworking sharedInstance];
    
    NSDictionary *dict = @{@"userName":self.userNameTF.text,@"password":self.pswTF.text};
   
    [TLNet GET:LOGIN_URL parameters:dict Withsuccess:^(id responseObject) {
        TLNSLog(@"登录请求成功：%@",responseObject);
        
        TLBaseModel  *baseModel = [TLBaseModel yy_modelWithJSON:responseObject];
        
      NSDictionary *dict = baseModel.ArrayData[0];
        
        TLLoginModel *userMsgModel = [TLLoginModel yy_modelWithDictionary:dict];
        if (baseModel.status) {
        //    NSLog(@"userMsgModel.code_ = %@",userMsgModel.code_);
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
           // [defaults setObject:@"loginSuccess" forKey:@"loginState"];
            [defaults setObject:userMsgModel.name_ forKey:@"userName"];
            [defaults setObject:userMsgModel.imgUrl_ forKey:@"userIcon"];
            [defaults setObject:userMsgModel.sid forKey:@"APPIdentification"];
            [defaults setObject:userMsgModel.code_ forKey:@"Code"];
            [defaults setObject:userMsgModel.isVip_ forKey:@"Vip"];
            
            
            [defaults synchronize];
            
            TLBaseTabBarController *homeVC = [[TLBaseTabBarController alloc]init];
            
            [self presentViewController:homeVC animated:YES completion:nil];
            
           // TLNSLog(@"8888:%@\n%@\n%@\n%@\n%@",LOGINSTATE,USERNAME,USERICON,USERCODE,APPIDENTIFICATION);
        }
        
        
        
    } WithFailure:^(NSError *error) {
        TLNSLog(@"登录失败****：%@",error);
        
    }];
    
    
    
    
    
    
}

//注册按钮点击事件
- (IBAction)RegisterButtonAction:(UIButton *)sender {
    TLNSLog(@"点击了注册按钮");
    
    TLReristerController *registerVC = [[TLReristerController alloc]init];
    registerVC.url = Register_URL;
    [self presentViewController:registerVC animated:YES completion:nil];
 //   registerVC.hidesBottomBarWhenPushed = YES;
 //   [self.navigationController pushViewController:registerVC animated:YES];
    
}

//忘记密码按钮点击事件
- (IBAction)ForgatPasswordButtonAction:(UIButton *)sender {
    TLNSLog(@"点击了忘记密码按钮");
    TLReristerController *registerVC = [[TLReristerController alloc]init];
    registerVC.url = ForgetPW;
    [self presentViewController:registerVC animated:YES completion:nil];
}

#pragma mark --- /***
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userNameTF resignFirstResponder];
    [self.pswTF resignFirstResponder];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end

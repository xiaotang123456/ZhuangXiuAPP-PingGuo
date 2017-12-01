//
//  TLReristerController.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/10.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLReristerController.h"
#import <WebKit/WebKit.h>
#import "Header.h"
#import "TLLoginController.h"

@interface TLReristerController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *myWebView;

@end

@implementation TLReristerController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //上传注册手机类型
    [self UploadIphoneType];
//    self.myWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20)];
//    
//    
//    self.myWebView.scrollView.bounces = NO;
//    self.myWebView.UIDelegate = self;
//    self.myWebView.navigationDelegate = self;
//    
//    [[self.myWebView configuration].userContentController addScriptMessageHandler:self name:@"webViewApp"];
    // 创建配置
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 创建UserContentController（提供JavaScript向webView发送消息的方法）
    WKUserContentController* userContent = [[WKUserContentController alloc] init];
    // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
      //JS调用OC
    [userContent addScriptMessageHandler:self name:@"webViewApp"];
    // 将UserConttentController设置到配置文件
    config.userContentController = userContent;
    
    // 高端的自定义配置创建WKWebView
    self.myWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20) configuration:config];
    self.myWebView.UIDelegate = self;
    self.myWebView.navigationDelegate = self;
    // 设置访问的URL
    NSURL *url = [NSURL URLWithString:_url];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
    
    [self.myWebView loadRequest:request];
    [self.view addSubview:self.myWebView];

}
#pragma mark ---/*** 向后台发送注册手机的类型
 - (void)UploadIphoneType
{
    TLNetworking *TLNet = [TLNetworking sharedInstance];
    
    NSDictionary *dict = @{@"type":@"iphone"};
    
    [TLNet GET:UPLODAPHONETYPE parameters:dict Withsuccess:^(id responseObject) {
        
        TLNSLog(@"向后台发送注册手机的类型请求失成功：%@",responseObject);
        
    } WithFailure:^(NSError *error) {
        
        TLNSLog(@"向后台发送注册手机的类型请求失败");
        
    }];
}




#pragma mark --/*** WKNavigationDelegate
//出现白屏时刷新页面
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView
{
    
    [webView reload];
}


#pragma mark --/*** WKScriptMessageHandler代理方法（js交互）
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
    TLNSLog(@"====>>: %@",message);
    NSDictionary * dic = message.body;
    TLNSLog(@"webView:%@",dic);
    [self goBackClick];
    
}

- (void)goBackClick
{
    
   // TLLoginController *homeVC = [[TLLoginController alloc]init];
   // [self presentViewController:homeVC animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.myWebView.configuration.userContentController removeScriptMessageHandlerForName:@"webViewApp"];
}

- (void)dealloc {
    
    [[self.myWebView configuration].userContentController removeScriptMessageHandlerForName:@"webViewApp"];
   
}


@end

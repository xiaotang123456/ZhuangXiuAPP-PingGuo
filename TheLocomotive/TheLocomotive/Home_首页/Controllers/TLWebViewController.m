//
//  TLWebViewController.m
//  TheLocomotive
//
//  Created by cts on 2017/11/29.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLWebViewController.h"
#import <WebKit/WebKit.h>
#import "Header.h"

#define KscreenW  [UIScreen mainScreen].bounds.size.width
#define KscreenH  [UIScreen mainScreen].bounds.size.height
@interface TLWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong) WKWebView *wkWebview;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation TLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //进度条初始化
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView.backgroundColor = [UIColor blueColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.2f);
    [self.view addSubview:self.progressView];
   [self createWebview];
}

-(void)createWebview{
    
    //初始化一个WKWebViewConfiguration对象
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    WKUserContentController* userContent = [[WKUserContentController alloc] init];
    //初始化偏好设置属性：preferences
    config.preferences = [WKPreferences new];
    //The minimum font size in points default is 0;
    config.preferences.minimumFontSize = 10;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = YES;
    [userContent addScriptMessageHandler:self name:@"webViewApp"];
    [userContent addScriptMessageHandler:self name:@"savePictrue"];
    // 将UserConttentController设置到配置文件
    config.userContentController = userContent;
    self.wkWebview = [[WKWebView alloc]initWithFrame:CGRectMake(0,0, KscreenW, KscreenH) configuration:config];
    self.wkWebview.UIDelegate = self;
    self.wkWebview.navigationDelegate = self;
    [self.view addSubview:self.wkWebview];
    NSLog(@"_aURL = %@",_aURL);
    [self.wkWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_aURL]]];
   
//    //OC调用JS
//    [self.wkWebview evaluateJavaScript:@"mytest()" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
//        //TODO
//    }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
     [self.wkWebview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     self.navigationController.navigationBar.hidden = NO;
}

-(void)goBackClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)saveXiangce:(NSString *)url{
    UIImageView *imageV = [[UIImageView alloc] init];
    [imageV sd_setImageWithURL:[NSURL URLWithString:url]];
    NSString *confirmStr = @"保存图片";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSString *actionStr = @"取消";
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:actionStr style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        UIImageWriteToSavedPhotosAlbum(imageV.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }];
   
    [alert addAction:action0];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark 保存图片后的回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{

    NSString*message =@"";
    
    if(!error) {
        
        message =@"成功保存到相册！";
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertControl addAction:action];
        
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }
    else
    {
        
        message = [error description];

        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertControl addAction:action];
        
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }
    
}
//JS调用OC
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"webViewApp"]) {
        //TODO
        [self goBackClick];
    }else if ([message.name isEqualToString:@"savePictrue"]){
        //保存相册
        NSLog(@"message.body = %@",message.body);
        NSDictionary *dict = message.body;
        //
        [self saveXiangce:dict[@"imgUrl"]];
    }
}


- (void)dealloc {
    
    [[self.wkWebview configuration].userContentController removeScriptMessageHandlerForName:@"webViewApp"];
    [self.wkWebview removeObserver:self forKeyPath:@"estimatedProgress"];
}
#pragma mark - WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.2f);
    
    [self.view bringSubviewToFront:self.progressView];
    
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"加载完成");
    self.progressView.hidden = YES;
   
}
#pragma mark KVO的监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
   
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        self.progressView.progress = self.wkWebview.estimatedProgress;
        
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.2倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.2f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }
    
    
    
    
}


@end

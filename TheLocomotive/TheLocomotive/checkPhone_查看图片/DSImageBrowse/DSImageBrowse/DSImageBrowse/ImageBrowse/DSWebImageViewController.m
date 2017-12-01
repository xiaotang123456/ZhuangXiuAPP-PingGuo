//
//  DSWebImageViewController.m
//  DSImageBrowse
//
//  Created by 黄铭达 on 2017/9/4.
//  Copyright © 2017年 黄铭达. All rights reserved.
//

#import "DSWebImageViewController.h"
#import "DSImageShowView.h"
#import <AVFoundation/AVFoundation.h>
@interface DSWebImageViewController ()

@property (nonatomic, strong) NSArray   *images;
@property (nonatomic, copy)   NSString  *currentImage;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic,strong)UILabel *numberLabel;
@end

@implementation DSWebImageViewController

- (instancetype)initWithImages:(NSArray <NSString *>*)images currentImage:(NSString *)currentImage {
    self = [super init];
    if (self) {
        _index = 0;
        _images = images;
        _currentImage = currentImage;
        for (int i = 0; i < images.count; i++) {
            if ([currentImage isEqualToString:images[i]]) {
                _index = i;
                break;
            }
        }
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *items = [NSMutableArray array];
    for (NSString *url in _images) {
        DSImageScrollItem *item = [[DSImageScrollItem alloc] init];
        item.cancelPan = YES;
        item.largeImageURL =[NSURL URLWithString:url];
        item.largeImageSize = CGSizeZero;
        [items addObject:item];
    }

    DSImageShowView *scrollView = [[DSImageShowView alloc] initWithItems:items type:DSImageShowtypeWebImage tapBlock:^{
        NSLog(@"单击了");
    }];
    [scrollView addObserver:self forKeyPath:@"numberStr" options:NSKeyValueObservingOptionNew context:@"hhjiang"];
    scrollView.longPressBlock = ^(UIImageView *imageView) {
        NSString *confirmStr = @"保存图片";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        NSString *actionStr = @"取消";
        UIAlertAction *action0 = [UIAlertAction actionWithTitle:actionStr style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
        }];
        
        [alert addAction:action0];
        [alert addAction:action1];
        [self presentViewController:alert animated:YES completion:nil];
    };
    [self.view addSubview:scrollView];
    [scrollView showWebImageIndex:_index];
    
    [self initSubView];
    
}

-(void)initSubView
{
    self.numberLabel.text=[NSString stringWithFormat:@"%d/%ld",1,_images.count];
    [self.view addSubview:self.numberLabel];
    
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(10, 40, 20, 20);
    [backBtn setImage:[UIImage imageNamed:@"箭头返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPopToVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context) {
        NSLog(@"%@",change);
        self.numberLabel.text=[change objectForKey:@"new"];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tabBarController.tabBar.hidden=NO;
}
-(void)backPopToVC
{
    [self.navigationController popViewControllerAnimated:YES];
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
-(UILabel *)numberLabel
{
    if (_numberLabel==nil) {
        _numberLabel=[[UILabel alloc]init];
        _numberLabel.bounds=CGRectMake(0, 0, 100, 20);
        _numberLabel.center=CGPointMake(self.view.bounds.size.width/2,self.view.bounds.size.height-20);
        _numberLabel.textAlignment=NSTextAlignmentCenter;
        _numberLabel.font=[UIFont systemFontOfSize:15];
        _numberLabel.textColor=[UIColor whiteColor];
    }
    return _numberLabel;
}

@end

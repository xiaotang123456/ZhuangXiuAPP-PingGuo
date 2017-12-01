//
//  TLShufflingFigure.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/6.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLShufflingFigure.h"
#import "Header.h"
#import "UIImageView+WebCache.h"
#import "JAScrollView.h"

#define SELFWIDTH self.frame.size.width
#define SELFHIGHT self.frame.size.height

@interface TLShufflingFigure ()<UIScrollViewDelegate>
/** myScrollView */
@property (nonatomic, strong)UIScrollView *myScrollView;
/** 左边ImgView */
@property (nonatomic, strong)UIImageView  *leftImgView;
/** 中间ImgView */
@property (nonatomic, strong)UIImageView  *centerImgView;
/** 右边ImgView */
@property (nonatomic, strong)UIImageView  *rightImgView;

/** 分页指示器 */
@property (nonatomic, strong)UIPageControl  *pageControl;
/** 中间图片索引 */
@property (nonatomic, assign)NSInteger currentImgIndex;

/** 定时器 */
@property (nonatomic, strong)NSTimer  *Timer;

@end

@implementation TLShufflingFigure

#pragma mark --- /*** 方法initWithFrame:(CGRect)frame

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
       // [self CreareSubViews];
        [self adView];
    }
    return self;
}
-(void)adView{
    CGRect rect = CGRectMake(0, 0, SELFWIDTH, SELFHIGHT);
    JAScrollView *scroll = [[JAScrollView alloc] initWithFrame:rect withImages:self.photosArr withIsRunloop:NO withBlock:^(NSInteger index) {
     //   NSLog(@"点击了index%zd",index);
      
    }];
    [self addSubview:scroll];
}
#pragma mark --- /*** 创建SubView
- (void)CreareSubViews
{
    /***  ScrollView  ***/
    self.myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SELFWIDTH, SELFHIGHT)];
    self.myScrollView.contentSize = CGSizeMake(SELFWIDTH * 3, SELFHIGHT);
    self.myScrollView.contentOffset = CGPointMake(SELFWIDTH, 0);
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.delegate = self;
    self.myScrollView.bounces = NO;
    self.myScrollView.pagingEnabled = YES;
    [self addSubview:self.myScrollView];
    
    /***  ImgView  ***/
    //左边ImgView
    self.leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SELFWIDTH, SELFHIGHT)];
    self.leftImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.leftImgView.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:self.leftImgView];
    
    //中间ImgView
    self.centerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SELFWIDTH, 0, SELFWIDTH, SELFHIGHT)];
    self.centerImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.centerImgView.backgroundColor = [UIColor yellowColor];
    
    //[self.centerImgView addTarget:self action:@selector(ImageViewClick)];
    [self.myScrollView addSubview:self.centerImgView];
    
    //右边ImgView
    self.rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SELFWIDTH * 2, 0, SELFWIDTH, SELFHIGHT)];
    
    self.rightImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.rightImgView.backgroundColor = [UIColor blueColor];
    [self.myScrollView addSubview:self.rightImgView];
    
    /*** 分页指示器 ***/
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SELFHIGHT - 30, SELFWIDTH, 30)];
    //    self.pageControl.backgroundColor = [UIColor cyanColor];
    self.pageControl.currentPageIndicatorTintColor = TLRGBAColor(61, 190, 160, 1);
    self.pageControl.pageIndicatorTintColor = TLRGBAColor(181, 181, 181, 1);
    [self addSubview: self.pageControl];
    
}

#pragma mark --- /*** 添加图片
- (void)setPhotosArr:(NSArray *)photosArr
{
    _photosArr = photosArr;
    
    if (photosArr.count > 0) {
        
        [self SetTheDefineValue:photosArr];
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            [self StartTimer];
        });
        
        
    }
}

- (void)SetTheDefineValue:(NSArray *)photosArray
{
   // self.photosArr = @[@"SC001.jpg",@"SC002.jpg",@"SC003.jpg",@"SC004.jpg",@"SC005.jpg",@"SC006.jpg"];
    
   // self.leftImgView.image = [UIImage imageNamed:photosArray[photosArray.count - 1]];
   // self.centerImgView.image = [UIImage imageNamed:photosArray[0]];
   // self.rightImgView.image = [UIImage imageNamed:photosArray[1]];
      [self.leftImgView sd_setImageWithURL:[NSURL URLWithString:photosArray[photosArray.count - 1]] placeholderImage:nil];
     [self.centerImgView sd_setImageWithURL:[NSURL URLWithString:photosArray[0]] placeholderImage:nil];
     [self.rightImgView sd_setImageWithURL:[NSURL URLWithString:@"http://uzu-2017-test.oss-cn-hangzhou.aliyuncs.com/zxa/img/33a62431-474d-41e8-942e-c92550d5f179.jpg"] placeholderImage:nil];
    _currentImgIndex = 0;
    NSLog(@"rrr = %@",photosArray[1]);
    self.pageControl.numberOfPages = photosArray.count;
    self.pageControl.currentPage = _currentImgIndex;
    
}

#pragma mark --- /*** 定时器
//开启定时器
- (void)StartTimer
{
        
        self.Timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_Timer forMode:NSRunLoopCommonModes];
    
}

/** 停止定时器，并将定时器清空(因为一旦定时器被停止,就不能再次被使用,所以停止之后立即清空)*/
- (void)StopTimer:(NSTimer *)timer
{
    [timer invalidate];
    //timer = nil;
}

//定时器调用的方法
- (void)timerClick
{
    NSInteger page = (self.pageControl.currentPage + 1)%self.photosArr.count;
    self.pageControl.currentPage = page;
    
    [self reloadValue];
    
    [self.myScrollView setContentOffset:CGPointMake(SELFWIDTH, 0) animated:NO];
}

#pragma mark --- UIScrollViewdelegate

//将要开始
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self StopTimer:self.Timer];
    //    NSLog(@"停止计时器");
}



//退拽将要停止
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    NSLog(@"开启计时器");
    [self StartTimer];
}

//拖拽停止后
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self reloadValue];
    
    [self.myScrollView setContentOffset:CGPointMake(SELFWIDTH, 0) animated:NO];
    self.pageControl.currentPage = _currentImgIndex;
}


//重新赋值
- (void)reloadValue
{
    NSInteger leftImgIndex,rightImgIndex;
    
    CGPoint offset = [self.myScrollView contentOffset];
    /** 判断左滑还是右滑 */
    if (offset.x >= SELFWIDTH) {//右滑
        _currentImgIndex = (_currentImgIndex + 1)%self.photosArr.count;
    } else if(offset.x < SELFWIDTH){//左滑
        _currentImgIndex = (_currentImgIndex + self.photosArr.count - 1)%self.photosArr.count;
    }
    
    self.centerImgView.image = [UIImage imageNamed:self.photosArr[_currentImgIndex]];
    
    
    //重新设计左右图片
    leftImgIndex = (_currentImgIndex + self.photosArr.count - 1)%self.photosArr.count;
    
    self.leftImgView.image = [UIImage imageNamed:self.photosArr[leftImgIndex]];
    
    rightImgIndex = (_currentImgIndex + 1) % self.photosArr.count;
    self.rightImgView.image = [UIImage imageNamed:self.photosArr[rightImgIndex]];
}

//轮播图点击事件
- (void)ImageViewClick
{
    NSLog(@"点击图片:%ld",self
          .pageControl.currentPage);
}




@end

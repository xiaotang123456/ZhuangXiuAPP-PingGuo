//
//  TLHomeTableView.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/6.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLHomeTableView.h"
#import "TLTableHeaderView.h"
#import "Header.h"
#import "TLLoopCell.h"
#import "TLTitleCell.h"
#import "TLWorksCell.h"
#import "TLTeamCell.h"
#import "TLInformationCell.h"
#import "TLHotMOdel.h"



@interface TLHomeTableView ()<UITableViewDelegate,UITableViewDataSource,TLTableHeaderViewDelegate>

{
   // NSString *STR;
  //  NSInteger TAG;
}


@end

@implementation TLHomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellAccessoryNone;
        [self RegisterCell];
        _STR = @"热门作品";
    }
    return self;
}

#pragma mark --- /*** 注册cell
- (void)RegisterCell
{
    //tableView的HeaderView
  //  [self registerNib:[UINib nibWithNibName:@"TLTableHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"TLTableHeaderView"];
    
    [self registerClass:[TLLoopCell class] forCellReuseIdentifier:@"TLLoopCell"];
    [self registerNib:[UINib nibWithNibName:@"TLTitleCell" bundle:nil] forCellReuseIdentifier:@"TLTitleCell"];
    //----------------------
    [self registerNib:[UINib nibWithNibName:@"TLWorksCell" bundle:nil] forCellReuseIdentifier:@"TLWorksCell"];
    [self registerNib:[UINib nibWithNibName:@"TLTeamCell" bundle:nil] forCellReuseIdentifier:@"TLTeamCell"];
    [self registerNib:[UINib nibWithNibName:@"TLInformationCell" bundle:nil] forCellReuseIdentifier:@"TLInformationCell"];
}

#pragma mark --- /*** 数据源 UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return self.hotArr.count;
    
}

//相关Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一个section
    if (indexPath.section == 0) {
        //第0行
        if (indexPath.row == 0) {
            
            TLLoopCell *loopCell =  [TLLoopCell tlloopCellWithTableView:tableView];
            loopCell.photosArr = self.photosArr;
            
            return loopCell;
        }
        //第1行
        if (indexPath.row == 1) {
            TLTitleCell *titleCell = [TLTitleCell tltitleCellWithTableView:tableView];
            
            return titleCell;
        }
        
        
    }
    //第二个section
    if (indexPath.section == 1) {
        
         TLHotMOdel *model = self.hotArr[indexPath.row];
        if (_TAG == 2) {
            TLTeamCell *teamCell = [TLTeamCell tlteamCellWithTableView:tableView];
            teamCell.title = _STR;
            teamCell.IntroductionText = _STR;
            [teamCell.ImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl_]];
            teamCell.TitleLabel.text = model.title_;
            teamCell.IntroductionLabel.text = model.remark_;
            return teamCell;
        }
        
        if (_TAG == 3) {
            TLInformationCell *informationCell = [TLInformationCell TLInformationCellWithTableView:tableView];
            informationCell.title = _STR;
            [informationCell.ImgeViewLabel sd_setImageWithURL:[NSURL URLWithString:model.imgUrl_]];
            informationCell.nameL.text = model.title_;
            return informationCell;
        }
        
        TLWorksCell *worksCell = [TLWorksCell tlworksCellWithTableVview:tableView];
        worksCell.title = _STR;
        if (_TAG == 1) {
            
            worksCell.DesginersNameLabel.hidden = YES;
            worksCell.DesginersIconImgView.hidden = YES;
            
        }else{
            worksCell.DesginersNameLabel.hidden = NO;
            worksCell.DesginersIconImgView.hidden = NO;
        }
       
        [worksCell.DesginersIconImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl1_]];
        worksCell.DesginersNameLabel.text = model.userName_;
        [worksCell.WorksImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl_]];
        worksCell.TitleLabel.text = model.title_;
        worksCell.IntroduceLabel.text = model.remark_;
        worksCell.NumberLabel.text = model.sumLook_;
        [worksCell.DianZanBtn setTitle:model.dianzanCount_ forState:UIControlStateNormal] ;
        if ([model.dianzanCount1_ isEqualToString:@"0"]) {
            worksCell.DianZanBtn.selected = NO;
        }else{
              worksCell.DianZanBtn.selected = YES;
        }
     
        //点赞回调
        worksCell.kDianzanCall = ^{
            [self dianzan:indexPath :@"1"];
            
        };
        worksCell.kCancelDianzanCall = ^{
            [self dianzan:indexPath :@"0"];
          
        };
        return worksCell;
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    cell.textLabel.text = _STR;
    
    return cell;
}

#pragma mark --- /*** 代理 UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        TLTableHeaderView *footerView = [[TLTableHeaderView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 46)];
        footerView.delegate = self;
        footerView.title = _STR;
        return footerView;
    }
    return nil;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return (19 * SCREEN_WIDTH/50) + 10;
        }
        if (indexPath.row == 1) {
            return 111;
        }
    }
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 8;
}

//FooterView高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 46;
    }
    return CGFLOAT_MIN;
}
//HeaderView高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当前暂无数据所以传的indexpath  后期有数据直接传model就好
    TLHotMOdel *model = self.hotArr[indexPath.row];
    NSDictionary *dict ;
    if ([_STR isEqualToString:@"热门作品"] || [_STR isEqualToString:@"精选资料"]) {
        if ([_STR isEqualToString:@"热门作品"]) {
         dict = @{@"imgId":model.workId,@"type_":@(1)};
        }else{
          dict = @{@"imgId":model.workId,@"type_":@(0)};
        }
      
    [[self getCurrentViewController] performSelector:@selector(pushToCheckPhote:) withObject:dict];
    }else{
        if ([_STR isEqualToString:@"推荐团队"]) {
            dict = @{@"url":[NSString stringWithFormat:@"%@?id_=%@&sid=%@",TeamDetail,model.workId,APPIDENTIFICATION]};
        }else{
            dict = @{@"url":[NSString stringWithFormat:@"%@?id_=%@&sid=%@",DongtaiDetail,model.workId,APPIDENTIFICATION]};
        }
         [[self getCurrentViewController] performSelector:@selector(pushToCheckPhote1:) withObject:dict];
    }
   
}

#pragma mark --- /*** 代理方法TLTableHeaderViewDelegate
- (void)tltableheaderViewWithData:(NSString *)string WithButtonTag:(NSInteger)tag
{
    _STR = string;
    _TAG = tag;
    NSIndexSet *indexset = [[NSIndexSet alloc]initWithIndex:1];
    [self reloadSections:indexset withRowAnimation:UITableViewRowAnimationNone];
    NSDictionary *dict = @{@"type":string};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBgColor" object:nil userInfo:dict];
   
}

#pragma mark - 获取当前view对应的视图控制器
- (UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
//点赞
-(void)dianzan: (NSIndexPath *)indexpath :(NSString *)num{
    TLNetworking *TLNet = [TLNetworking sharedInstance];
    TLHotMOdel *model = self.hotArr[indexpath.row];
    NSDictionary *dict;
    NSLog(@"num =%@",num);
    if ([_STR isEqualToString:@"热门作品"]) {
       dict = @{@"type_":@"1",@"number_":num,@"adminCode_":model.workId,@"uCode_":USERCODE};
    }else{
        dict = @{@"type_":@"2",@"number_":num,@"adminCode_":model.workId,@"uCode_":USERCODE};
    }
  
    [TLNet GET:DianZanURL parameters:dict Withsuccess:^(id responseObject) {
        
          TLNSLog(@"图片加载数据成功：%@",responseObject);
        if ([responseObject[@"status"] isEqualToString:@"true"]) {
            NSDictionary *dict = @{@"type":_STR};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBgColor" object:nil userInfo:dict];
        }
        
        
    } WithFailure:^(NSError *error) {
        
        TLNSLog(@"首页加载数据失败：%@",error);
        
        
    }];
}

@end

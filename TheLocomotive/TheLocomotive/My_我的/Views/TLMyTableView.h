//
//  TLMyTableView.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/8.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^KSeleCall)(NSString *url);
typedef void(^KTuichuCall)();
@interface TLMyTableView : UITableView

@property (nonatomic, strong)NSArray   *titleArray;
@property(nonatomic,strong) KSeleCall kSeleCall;
@property(nonatomic,strong) KTuichuCall kTuichuCall;
-(void)setKSeleCall:(KSeleCall)kSeleCall;
-(void)setKTuichuCall:(KTuichuCall)kTuichuCall;
@end

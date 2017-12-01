//
//  TLTableHeaderView.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/7.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TLTableHeaderViewDelegate <NSObject>

/**
 TLTableHeaderView通过此方法传递数据到外面

 @param string 传递的数据
 */
- (void)tltableheaderViewWithData:(NSString *)string WithButtonTag:(NSInteger)tag;

@end

@interface TLTableHeaderView : UIView
@property(nonatomic,copy) NSString *title;
@property (nonatomic, weak) id<TLTableHeaderViewDelegate> delegate;


@end

//
//  TLBaseModel.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/10.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLBaseModel : NSObject
/** 数组数据 */
@property (nonatomic, strong)NSArray *ArrayData;
/** 字典数据 */
@property (nonatomic, strong)NSDictionary *DictData;
/** 字符串数据 */
@property (nonatomic, copy)NSString *StringData;
/** 后台返回的信息 */
@property (nonatomic, copy)NSString *message;
/** 请求状态 1：成功，0：失败 */
@property (nonatomic, copy)NSString *status;



@end

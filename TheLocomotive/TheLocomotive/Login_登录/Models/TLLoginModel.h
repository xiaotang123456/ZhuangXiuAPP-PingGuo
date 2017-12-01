//
//  TLLoginModel.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/10.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLLoginModel : NSObject
/*
 "code_" = 13144091518;
 "id_" = eeb5dd4e7423465e9c8cdab7ec090dad;
 "imgUrl_" = "http://uzu-2017-test.oss-cn-hangzhou.aliyuncs.com/zxa/img/d321e317-882d-4919-8534-a6c6af707df1.jpg";
 "mobile_" = 13144091518;
 "name_" = "\U5c0f\U88d5";
 sid = 28a43f745b5c4588a97c759858970b33;
 */
/** 用户code_ */
@property (nonatomic, copy)NSString *code_;
/** 用户ID */
@property (nonatomic, copy)NSString *id_;
/** 用户头像链接 */
@property (nonatomic, copy)NSString *imgUrl_;
/** 用户电话号码 */
@property (nonatomic, copy)NSString *mobile_;
/** 用户名称 */
@property (nonatomic, copy)NSString *name_;
/** APP标识 */
@property (nonatomic, copy)NSString *sid;

/** 会员 */
@property (nonatomic, copy)NSString *isVip_;


@end

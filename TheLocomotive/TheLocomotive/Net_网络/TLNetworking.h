//
//  TLNetworking.h
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/9.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(id responseObject);
typedef void(^Failure)(NSError *error);

@interface TLNetworking : NSObject

/**
 POST请求方法
 
 @param URLString 发起请求的连接
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure;

/**
 单例创建对象
 
 @return HANetworking对象
 */
+ (instancetype)sharedInstance;

/**
 GET请求方法
 
 @param URLString 发起请求的连接
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure;


/**
 GET请求URL 数组

 @param URLArray 发起请求的连接数组
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)GETURLArray:(NSArray *)URLArray parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure;
@end

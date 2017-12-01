//
//  TLNetworking.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/9.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLNetworking.h"
#import <AFNetworking.h>

@implementation TLNetworking

/**
 单例创建对象
 
 @return HANetworking对象
 */
+ (instancetype)sharedInstance
{
    static TLNetworking *netWorking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorking = [[TLNetworking alloc]init];
    });
    return netWorking;
}

/**
 POST请求方法
 
 @param URLString 发起请求的链接
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [sessionManager POST:URLString parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

/**
 GET请求方法
 
 @param URLString 发起请求的连接
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
//    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    sessionManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [sessionManager GET:URLString parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

/**
 GET请求URL 数组
 
 @param URLArray 发起请求的连接数组
 @param dic 需要上传的数据
 @param success 请求成功后返回的数据
 @param failure 请求失败返回的数据
 */
- (void)GETURLArray:(NSArray *)URLArray parameters:(NSDictionary *)dic Withsuccess:(Success)success WithFailure:(Failure)failure
{
    for (NSString *urlString in URLArray) {
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
        
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        
        [sessionManager GET:urlString parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        
        
        
    }
}

@end

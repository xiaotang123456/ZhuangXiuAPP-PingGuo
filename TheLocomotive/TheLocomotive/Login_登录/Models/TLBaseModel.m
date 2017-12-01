//
//  TLBaseModel.m
//  TheLocomotive
//
//  Created by 箫海岸 on 2017/11/10.
//  Copyright © 2017年 箫海岸. All rights reserved.
//

#import "TLBaseModel.h"

@implementation TLBaseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ArrayData" : @"data",
             @"DictData" : @"data",
             @"StringData" : @"data"};
}



@end

//
//  DemoParam.m
//  HDServices
//
//  Created by Aaron on 16/3/18.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "DemoParam.h"

@implementation DemoParam

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"ID"
                                                       }];
}


@end

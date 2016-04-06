//
//  DemoModel.m
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "NodesModel.h"

@implementation NodesModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                      @"id": @"ID"
                                                       }];
}

@end

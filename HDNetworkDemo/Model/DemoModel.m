//
//  DemoModel.m
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModelItem

@end

@implementation DemoModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                      @"id": @"ID"
                                                       }];
}

@end

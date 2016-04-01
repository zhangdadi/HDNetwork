//
//  MemberModel.m
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "MemberModel.h"

@implementation MemberModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                         @"id": @"Id"
                                                         }];
}
@end

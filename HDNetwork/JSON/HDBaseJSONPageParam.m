//
//  BaseJSONPageParam.m
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDBaseJSONPageParam.h"

@interface HDBaseJSONPageParam ()

/**
 *  分页大小，默认为10，如需要修改请在子类的Init方法里
 */
@property (nonatomic, assign) NSInteger pageSize;


@end

@implementation HDBaseJSONPageParam

- (instancetype)init {
    return [self initWithPageSize:10];
}

- (instancetype)initWithPageSize:(NSInteger)pageSize {
    self = [super init];
    if (self) {
        _pageIndex = 1;
        _pageSize = pageSize;
    }
    return self;
}

@end

//
//  HDNWConfig.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWConfig.h"

@implementation HDNWConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.resultSelf = HDNWAPIResult.self;
    }
    return self;
}

- (HDNWResultConfig *)resultConfig {
    if (_resultConfig == nil) {
        _resultConfig = [[HDNWResultConfig alloc] init];
    }
    return _resultConfig;
}

- (HDNWTokenConfig *)tokenConfig {
    if (_tokenConfig == nil) {
        _tokenConfig = [[HDNWTokenConfig alloc] init];
    }
    return _tokenConfig;
}


- (HDNWPageConfig *)pageConfig {
    if (_pageConfig == nil) {
        _pageConfig = HDNWPageConfig.new;
    }
    return _pageConfig;
}

@end

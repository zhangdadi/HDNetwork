//
//  HDNWTokenConfig.m
//  chat_im
//
//  Created by zhangdadi on 2021/9/7.
//  Copyright © 2021 Reese. All rights reserved.
//

#import "HDNWTokenConfig.h"

@implementation HDNWTokenConfig
- (instancetype)init {
    self = [super init];
    if (self) {
        self.accessTokenType = HDNWAccessTokenTypeHead;
        self.accessTokenName = @"access_token";
    }
    return self;
}


@end

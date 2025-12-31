//
//  HDNWResultConfig.m
//  chat_im
//
//  Created by zhangdadi on 2021/9/7.
//  Copyright © 2021 Reese. All rights reserved.
//

#import "HDNWResultConfig.h"

@implementation HDNWResultConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.codeName = @"code";
        self.msgName = @"msg";
        self.dataName = @"data";
        self.codeValueSucceed = 0;
    }
    return self;
}

@end

//
//  APIResult.m
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDAPIResult.h"
#import "HDAPIResult_Net.h"

@implementation HDAPIResult

+ (instancetype)parse:(id)jsonData
{
    if (!jsonData) return nil;
    
    HDAPIResult *result = [[HDAPIResult alloc] init];
    result.code = [[jsonData objectForKey:@"Code"] intValue];
    result.data = [jsonData objectForKey:@"Data"];
    if ([result.data  isEqual: @"null"]) {
        result.data = nil;
    }
    result.msg = [jsonData objectForKey:@"Msg"];
    return result;
}

- (BOOL)isSucc {
    return (self.code == HDAPIResultType_OK ? YES : NO);
}

@end

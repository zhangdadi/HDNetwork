//
//  HDNWAPIResult.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWAPIResult.h"
#import "HDNWConfig.h"

@implementation HDNWAPIResult

+ (instancetype)parse:(NSDictionary *)jsonData {
    if (!jsonData) return nil;
    if (![jsonData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    HDNWAPIResult *result = [[HDNWAPIResult alloc] init];
    NSNumber *code = [jsonData objectForKey:[HDNWConfig shared].resultConfig.codeName];
    result.code = [code intValue];
    result.isSucc = result.code == [HDNWConfig shared].resultConfig.codeValueSucceed ? YES : NO;
    result.msg = jsonData[[HDNWConfig shared].resultConfig.msgName];
    
    result.result = jsonData;
    result.data = jsonData[[HDNWConfig shared].resultConfig.dataName];
    
    if ([result.data isEqual: @"null"]) {
        result.data = nil;
    }
    return result;
}


@end

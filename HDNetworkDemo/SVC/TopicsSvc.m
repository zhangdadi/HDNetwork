//
//  TopicsSvc.m
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "TopicsSvc.h"
#import "HDBaseSvc_Net.h"
#import "HDAPIResult_Net.h"

@implementation TopicsSvc

+ (instancetype)getHotWithCmpleted:(void(^)(HDAPIResult *result, NSArray<TitleModel> *list))completed {
    return [HDBaseSvc getUrl:@"api/topics/hot.json"].completionBlock(^(HDAPIResult *result) {
        NSArray<TitleModel> *list = [TitleModel parse:result.data];
        completed(result, list);
    }).start();
}

+ (instancetype)getLatestWithCmpleted:(void(^)(HDAPIResult *result, HotModel *model))completed {
    return [HDBaseSvc getUrl:@"api/topics/latest.json"].completionBlock(^(HDAPIResult *result) {
        HotModel *model = [HotModel parse:result.data];
        completed(result, model);
    }).start();
}


@end

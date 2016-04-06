//
//  NodesSvc.m
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/6.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "NodesSvc.h"
#import "HDAPIResult_Net.h"
#import "HDBaseSvc_Net.h"


@implementation NodesSvc

+ (instancetype)getShowWithParam:(NodesParam *)param cmpleted:(void(^)(HDAPIResult *result, NodesModel *model))completed {
    return [HDBaseSvc getUrl:@"api/nodes/show.json"].param(param).refresh(YES).completionBlock(^(HDAPIResult *result){
        NodesModel *model = [NodesModel parse:result.data];
        completed(result, model);
    }).start();
    
}


@end

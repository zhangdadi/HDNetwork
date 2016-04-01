//
//  DemoSvc.m
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "DemoSvc.h"
#import "HDAPIResult_Net.h"
#import "HDBaseSvc_Net.h"
#import "DemoParam.h"


@implementation DemoSvc

+ (instancetype)getDataWithParam:(DemoParam *)param cmpleted:(void(^)(HDAPIResult *result, DemoModel *model))completed {
    
    return [HDBaseSvc getUrl:@"api/nodes/show.json"].param(param).refresh(YES).completionBlock(^(HDAPIResult *result){
        DemoModel *model = [DemoModel parse:result.data];
        completed(result, model);

    }).start();
    
}

@end

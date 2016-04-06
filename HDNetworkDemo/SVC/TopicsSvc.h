//
//  TopicsSvc.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseSvc.h"
#import "HDAPIResult.h"
#import "TitleModel.h"

@interface TopicsSvc : HDBaseSvc

//最热主题 - url:https://www.v2ex.com/api/topics/hot.json

+ (instancetype)getHotWithCmpleted:(void(^)(HDAPIResult *result, NSArray<TitleModel> *list))completed;

//最新主题 - url:https://www.v2ex.com/api/topics/latest.json

+ (instancetype)getLatestWithCmpleted:(void(^)(HDAPIResult *result, TitleModel *model))completed;

@end

//
//  NodesSvc.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/6.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseSvc.h"
#import "NodesModel.h"
#import "NodesParam.h"

@interface NodesSvc : HDBaseSvc

//节点信息 - url:https://www.v2ex.com/api/nodes/show.json

+ (instancetype)getShowWithParam:(NodesParam *)param cmpleted:(void(^)(HDAPIResult *result, NodesModel *model))completed;

@end

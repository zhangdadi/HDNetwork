//
//  DemoSvc.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDBaseSvc.h"
#import "DemoModel.h"
#import "DemoParam.h"

@interface DemoSvc : HDBaseSvc

+ (instancetype)getDataWithParam:(DemoParam *)param cmpleted:(void(^)(HDAPIResult *result, DemoModel *model))completed;

@end

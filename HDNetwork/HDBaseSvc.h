//
//  BaseSvc.h
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDAPIResult.h"

@interface HDBaseSvc : NSObject

//加载首页
- (void)loadFirstPage;

//加载下一页
- (void)loadNextPage;


@end

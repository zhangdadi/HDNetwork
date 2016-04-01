//
//  APIResult_Net.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDAPIResult.h"

typedef NS_ENUM(int, HDAPIResultType) {
    /**
     *  成功
     */
    HDAPIResultType_OK = 0,
    /**
     *  失败
     */
    HDAPIResultType_Failed,
};



@interface HDAPIResult ()

@property (nonatomic, assign) HDAPIResultType  code;
@property (nonatomic, strong) id    data;

+ (instancetype)parse:(NSDictionary*)jsonData;


@end

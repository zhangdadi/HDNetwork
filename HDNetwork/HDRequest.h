//
//  DBHelper.h
//  HDServices
//
//  Created by zhangdadi on 15/4/1.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDAPIResult.h"
#import "HDAPIResult_Net.h"
#import "HDBaseJSONParam.h"

@class HDRequest;
typedef void (^DBHelperCompletionBlock)(HDAPIResult *result);


@protocol HDRequestProtocol  <NSObject>

+ (instancetype)getUrl:(NSString *)url;
+ (instancetype)postUrl:(NSString *)url;

/**
 *  参数
 */
@property (nonatomic, copy, readonly) HDRequest<HDRequestProtocol> *(^param)(HDBaseJSONParam *param);

/**
 *  api版本，默认为1
 */
@property (nonatomic, copy, readonly) HDRequest<HDRequestProtocol> *(^apiVersion)(NSString *apiVersion);

/**
 *  是否缓存，默认缓存
 */
@property (nonatomic, copy, readonly) HDRequest<HDRequestProtocol> *(^refresh)(BOOL refresh);

/**
 *  回调
 */
@property (nonatomic, copy, readonly) HDRequest<HDRequestProtocol> *(^completionBlock)(DBHelperCompletionBlock completed);

/**
 *  开始
 */
@property (nonatomic, copy, readonly) id (^start)();

@end


@interface HDRequest : NSObject<HDRequestProtocol>


@end

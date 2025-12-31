//
//  HDNWConfig.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWSingle.h"
#import "HDNWTokenConfig.h"
#import "HDNWResultConfig.h"
#import "HDNWAPIResult.h"
#import "HDNWPageConfig.h"


/// 配置单例
@interface HDNWConfig : HDNWSingle

/// url前缀
@property(nonatomic, copy) NSString *apiBaseUrl;


/// token配置
@property(nonatomic, strong) HDNWTokenConfig *tokenConfig;

/// 请求参数配置
@property(nonatomic, strong) HDNWResultConfig *resultConfig;

@property(nonatomic, assign) id<HDNWAPIResultProtocol> resultSelf;

@property(nonatomic, strong) HDNWPageConfig *pageConfig;


@end


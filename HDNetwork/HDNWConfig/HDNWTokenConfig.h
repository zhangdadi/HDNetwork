//
//  HDNWTokenConfig.h
//  chat_im
//
//  Created by zhangdadi on 2021/9/7.
//  Copyright © 2021 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>

/// token类型
typedef NS_ENUM(NSInteger, HDNWAccessTokenType) {
    /// token放在请求头部
    HDNWAccessTokenTypeHead = 0,
    /// token放在请求参数里
    HDNWAccessTokenTypeBody= 1,
};


@interface HDNWTokenConfig : NSObject

/// 请求accessToken
@property(nonatomic, copy) NSString *accessToken;

/// accessToken名称，默认为access_token
@property(nonatomic, copy) NSString *accessTokenName;

/// accessToken类型，默认放在头部
@property(nonatomic, assign) HDNWAccessTokenType accessTokenType;

@end


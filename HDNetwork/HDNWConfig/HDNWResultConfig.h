//
//  HDNWResultConfig.h
//  chat_im
//
//  Created by zhangdadi on 2021/9/7.
//  Copyright © 2021 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HDNWResultConfig : NSObject
/// 接口返回的code-key名，默认是code
@property(nonatomic, copy) NSString *codeName;

/// code成功的编码值，默认0表示成功
@property(nonatomic, assign) int codeValueSucceed;

/// 接口返回的msg-key名，默认是msg
@property(nonatomic, copy) NSString *msgName;

/// 接口返回的data-key名，默认是data
@property(nonatomic, copy) NSString *dataName;


@end


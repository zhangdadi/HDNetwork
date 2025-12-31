//
//  HDNWManager.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import <Foundation/Foundation.h>
#import "HDNWAPIResult.h"
#import "HDNWConfig.h"

@class HDNWManager;
typedef void (^HDNWCompletionBlock)(id<HDNWAPIResultProtocol> result, id data);

@protocol HDNWManagerProtocol  <NSObject>

+ (instancetype)get;
+ (instancetype)post;
//+ (instancetype)update; //上传文件


/// 会拼接配置类里的apiBaseUrl
@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^url)(NSString *url);

/// 不会拼接url
@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^urlPath)(NSString *urlPath);

@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^param)(NSObject *param);

@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^paramDict)(NSDictionary *paramDict);

@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^paramArray)(NSArray *paramArray);

/**
 *  回调
 */
@property (nonatomic, copy, readonly) HDNWManager<HDNWManagerProtocol> *(^completionBlock)(HDNWCompletionBlock completed);

/**
 *  开始，传入modelClass则回调成modelClass的解析，传入空则返回字典
 */
@property (nonatomic, copy, readonly) HDNWManager *(^start)(Class modelClass);

@end

@interface HDNWManager: NSObject<HDNWManagerProtocol>

/**
 *  加载首页，首页下标为1
 */
- (void)loadFirstPageFromOne;

/**
 *  加载首页，首页下标为0
 */
- (void)loadFirstPage;

/**
 *  加载下一页
 */
- (void)loadNextPage;

@end


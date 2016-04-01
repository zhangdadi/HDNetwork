//
//  DBHelper.m
//  HDServices
//
//  Created by zhangdadi on 15/4/1.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDRequest.h"
#import "AFNetworking.h"
#import "HDAPIResult_Net.h"
#import "HDNetworkConfig.h"


//请求类型
typedef NS_ENUM(int, HttpType) {
    HttpTypeGet = 0,
    HttpTypePost
};


@interface HDRequest ()
{
    HDBaseJSONParam *_param;
    NSString *_apiVersion;
    BOOL _refresh;
    DBHelperCompletionBlock _completionBlock;
}

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) HttpType httpType;


@end

@implementation HDRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        _apiVersion = @"1";
        _refresh = YES;
    }
    return self;
}

+ (instancetype)getUrl:(NSString *)url {
    HDRequest *helper = [[HDRequest alloc] init];
    helper.url = url;
    helper.httpType = HttpTypeGet;
    return helper;
}

+ (instancetype)postUrl:(NSString *)url {
    HDRequest *helper = [[HDRequest alloc] init];
    helper.url = url;
    helper.httpType = HttpTypePost;
    return helper;
}

- (HDRequest<HDRequestProtocol> *(^)(HDBaseJSONParam*))param {
    return ^id(HDBaseJSONParam *param) {
        _param = param;
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(NSString*))apiVersion {
    return ^id(NSString *apiVersion) {
        _apiVersion = apiVersion;
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(BOOL))refresh {
    return ^id(BOOL refresh) {
        _refresh = refresh;
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(DBHelperCompletionBlock))completionBlock {
    return ^id(DBHelperCompletionBlock completionBlock) {
        _completionBlock = [completionBlock copy];
        return self;
    };
}

- (id (^)())start {
    return ^id() {
        switch (_httpType) {
            case HttpTypeGet:
                [HDRequest getData:_url isRefresh:_refresh apiVersion:_apiVersion params:[_param toDictionary] completed:_completionBlock];
                break;
            case HttpTypePost:
                [HDRequest postData:_url apiVersion:_apiVersion params:[_param toDictionary] completed:_completionBlock];
                break;
                
            default:
                break;
        }
        return nil;
    };
}

+ (void)getData:(NSString *)url
      isRefresh:(BOOL)refresh
     apiVersion:(NSString*)apiVersion
         params:(NSDictionary*) params
      completed:(void (^)(HDAPIResult *result))completed {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self getBaseURL]];

    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        HDAPIResult *result = [[HDAPIResult alloc] init];
        result.data = responseObject;
        if (completed) {
            completed(result);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求不通");
    }];
    
}

+ (void)postData:(NSString *)url
     apiVersion:(NSString*)apiVersion
         params:(NSDictionary*) params
      completed:(void (^)(HDAPIResult *result))completed {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self getBaseURL]];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        HDAPIResult *result = [[HDAPIResult alloc] init];
        result.data = responseObject;
        if (completed) {
            completed(result);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求不通");
    }];
    
}

#pragma mark - 私有方法

+ (NSURL *)getBaseURL {
    return [NSURL URLWithString:[HDNetworkConfig sharedInstance].baseUrl];
}

+ (NSDictionary *)getHttpHeadDicta {
    return [HDNetworkConfig sharedInstance].httpHeadDict;
}

#pragma mark -

- (HDBaseJSONParam *)getParam {
    return _param;
}

@end

//
//  HDNWManager.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWManager.h"
#import "HDNWConfig.h"
#import "AFNetworking.h"
#import "HDNWLog.h"
#import "YYModel.h"

//请求类型
typedef NS_ENUM(int, HttpType) {
    HttpTypeGet = 0,
    HttpTypePost,
    HttpTypeUpdate
};

@interface HDNWManager () {
    NSString *_url;
    NSObject *_param;
    NSDictionary *_paramDict;
    NSArray *_paramArray;
    HDNWCompletionBlock _completionBlock;
    Class _modelClass;
    
}
@property (nonatomic, assign) HttpType httpType;
@property(nonatomic, strong) NSDictionary *myParamDict;
@property(nonatomic, assign) BOOL isStopLoad;

@end

@implementation HDNWManager

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)get {
    HDNWManager *helper = [[HDNWManager alloc] init];
    helper.httpType = HttpTypeGet;
    return helper;
}

+ (instancetype)post {
    HDNWManager *helper = [[HDNWManager alloc] init];
    helper.httpType = HttpTypePost;
    return helper;
}

+ (instancetype)update {
    HDNWManager *helper = [[HDNWManager alloc] init];
    helper.httpType = HttpTypeUpdate;
    return helper;
}


- (HDNWManager<HDNWManagerProtocol> *(^)(NSString*))url {
    return ^id(NSString *url) {
        self->_url = [NSString stringWithFormat:@"%@%@", [HDNWConfig shared].apiBaseUrl, url];
        return self;
    };
}

- (HDNWManager<HDNWManagerProtocol> *(^)(NSString*))urlPath {
    return ^id(NSString *urlPath) {
        self->_url = urlPath;
        return self;
    };
}

- (HDNWManager<HDNWManagerProtocol> *(^)(NSObject*))param {
    return ^id(NSObject *param) {
        self->_param = param;
        return self;
    };
}

- (HDNWManager<HDNWManagerProtocol> *(^)(NSDictionary*))paramDict {
    return ^id(NSDictionary *paramDict) {
        self->_paramDict = paramDict;
        return self;
    };
}

- (HDNWManager<HDNWManagerProtocol> *(^)(NSArray*))paramArray {
    return ^id(NSArray *paramArray) {
        self->_paramArray = paramArray;
        return self;
    };
}

- (HDNWManager<HDNWManagerProtocol> *(^)(HDNWCompletionBlock))completionBlock {
    return ^id(HDNWCompletionBlock completionBlock) {
        self->_completionBlock = [completionBlock copy];
        return self;
    };
}

- (HDNWManager *(^)(Class))start {
    return ^id(Class modelClass) {
        self->_modelClass = modelClass;
        [self request];
        return self;
    };
}


- (void)request {
    if (_httpType == HttpTypeGet) {
        [self requestGet];
    }
    
    if (_httpType == HttpTypePost) {
        [self requestPost];
    }
}

- (void)creatParam {
    NSDictionary *dict = nil;
    if (_param) {
        dict = [self->_param yy_modelToJSONObject];
    } else {
        dict = _paramDict;
    }
    if (HDNWConfig.shared.tokenConfig.accessTokenType == HDNWAccessTokenTypeBody) {
        NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:dict];
        temp[[HDNWConfig shared].tokenConfig.accessTokenName] = [HDNWConfig shared].tokenConfig.accessToken;
        dict = temp;
    }
    
    self.myParamDict = dict;
    self.isStopLoad = YES;
    
}

- (void)requestGet {
    AFHTTPSessionManager *manager = [HDNWManager apiManager];
    [self creatParam];
    NSString *urlStr = _url;

    if (_paramArray) {
        for (id item in _paramArray) {
            urlStr = [NSString stringWithFormat:@"%@/%@", urlStr, item];
        }
    }
    
    urlStr = [urlStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [manager GET:urlStr parameters:self.myParamDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HDNWLog(@"请求url:%@", task.currentRequest.URL);
        HDNWLog(@"返回数据:%@", [responseObject yy_modelToJSONString]);
        self.isStopLoad = NO;
        
        id<HDNWAPIResultProtocol> result = [HDNWConfig.shared.resultSelf parse:responseObject];
        if (self->_completionBlock) {
            self->_completionBlock(result, [self parse:result.data]);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HDNWLog(@"请求url-网络异常:%@", task.currentRequest.URL);
        self.isStopLoad = NO;
       
        HDNWAPIResult *result = [[HDNWAPIResult alloc] init];
        result.code = -99999;
        result.msg = @"网络异常，请检查网络设置";
        
        if (self->_completionBlock) {
            self->_completionBlock(result, nil);
        }
    }];
}

- (void)requestPost {
    NSString *urlStr = _url;
    [self creatParam];
    
    urlStr = [urlStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    

    AFHTTPSessionManager *manager = [HDNWManager apiManager];
    [manager POST:urlStr parameters:self.myParamDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HDNWLog(@"请求url:%@,请求参数:%@", task.currentRequest.URL, self.myParamDict);
        HDNWLog(@"返回数据:%@", responseObject);
        self.isStopLoad = NO;
        
        
        id<HDNWAPIResultProtocol> result = [HDNWConfig.shared.resultSelf parse:responseObject];
        
        if (self->_completionBlock) {
            self->_completionBlock(result, [self parse:result.data]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HDNWLog(@"请求url:%@,请求参数:%@", task.currentRequest.URL, self.myParamDict);
        self.isStopLoad = NO;
        
        HDNWAPIResult *result = [[HDNWAPIResult alloc] init];
        result.code = -99999;
        result.msg = @"网络异常，请检查网络设置";
        
        if (self->_completionBlock) {
            self->_completionBlock(result, nil);
        }
    }];
}

#pragma mark -

- (id)parse:(id)jsonData{
    if (!jsonData || jsonData == (id)kCFNull) return jsonData;
    
    if (_modelClass == nil) {
        return jsonData;
    }
    
    if ([jsonData isKindOfClass:[NSDictionary class]]) {
        return [_modelClass yy_modelWithDictionary:jsonData];
    } else if ([jsonData isKindOfClass:[NSArray class]]) {
        return [NSArray yy_modelArrayWithClass:_modelClass json:jsonData];
    } else {
        NSData *temp = nil;
        NSData *json = nil;
        if ([jsonData isKindOfClass:[NSString class]]) {
            json = [(NSString *)jsonData dataUsingEncoding : NSUTF8StringEncoding];
        } else if ([jsonData isKindOfClass:[NSData class]]) {
            json = jsonData;
        }
        if (json) {
            temp = [NSJSONSerialization JSONObjectWithData:json options:kNilOptions error:NULL];
            return [self parse:temp];
        }
    }
    
    HDNWLog(@"无数据");
    return jsonData;
}

+ (NSDictionary *)dictionaryWithJSON:(id)json {
    if (!json || json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    return dic;
}


#pragma mark -

/**
 *  加载首页
 */
- (void)loadFirstPage {
    [self loadFirstPage:0];
}

- (void)loadFirstPageFromOne {
    [self loadFirstPage:1];
}

/**
 *  加载首页
 */
- (void)loadFirstPage:(int)pageIndex {
    if (self.myParamDict) {
        NSNumber *page = self.myParamDict[[HDNWConfig shared].pageConfig.pageIndexName];
        if (page == nil) {
            page = self.myParamDict[@"pageIndex"];
            if (page == nil) {
                HDNWLog(@"引接口参数不支持自动加载首页方法，请配置");
            } else {
                [self.myParamDict setValue:@(pageIndex) forKey:@"pageIndex"];
            }
        } else {
            [self.myParamDict setValue:@(pageIndex) forKey:[HDNWConfig shared].pageConfig.pageIndexName];
        }
        _param = nil;
        self.paramDict(self.myParamDict).start(self->_modelClass);
    } else {
        HDNWLog(@"引接口参数不支持自动加载首页方法，请配置");
    }
}

/**
 *  加载下一页
 */
- (void)loadNextPage {
    if (self.myParamDict) {
        NSNumber *page = self.myParamDict[[HDNWConfig shared].pageConfig.pageIndexName];
        if (page == nil) {
            page = self.myParamDict[@"pageIndex"];
            if (page == nil) {
                HDNWLog(@"引接口参数不支持自动加载首页方法，请配置");
            } else {
                
                [self.myParamDict setValue:@(page.intValue + 1) forKey:@"pageIndex"];
            }
        } else {
            [self.myParamDict setValue:@(page.intValue + 1) forKey:[HDNWConfig shared].pageConfig.pageIndexName];
        }
        _param = nil;
        self.paramDict(self.myParamDict).start(self->_modelClass);
    } else {
        HDNWLog(@"引接口参数不支持自动加载首页方法，请配置");
    }
    
}

#pragma mark -

+ (AFHTTPSessionManager *)formatManager:(AFHTTPSessionManager *)manager {
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    manager.requestSerializer.timeoutInterval = 30;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/json",
                                                         @"text/plain",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"image/gif",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         @"video/mp4",
                                                         @"video/quicktime",
                                                         nil];
    
    return manager;
}

+ (AFHTTPSessionManager *)formatBodyManager:(AFHTTPSessionManager *)manager {
    
    manager.requestSerializer.timeoutInterval = 30;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}


+ (AFHTTPSessionManager *)apiManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] init];
        [self formatManager:manager];
    });
    
    if ([HDNWConfig shared].tokenConfig.accessToken) {
        [manager.requestSerializer setValue:[HDNWConfig shared].tokenConfig.accessToken forHTTPHeaderField:[HDNWConfig shared].tokenConfig.accessTokenName];
    }
    return manager;
}

+ (AFHTTPSessionManager *)bodyManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] init];
        [self formatBodyManager:manager];
    });
    
    if ([HDNWConfig shared].tokenConfig.accessToken) {
        [manager.requestSerializer setValue:[HDNWConfig shared].tokenConfig.accessToken forHTTPHeaderField:[HDNWConfig shared].tokenConfig.accessTokenName];
    }
    return manager;
}

- (NSObject *)getParam {
    return _param;
}

// 返回上传数据类型
+ (NSString *)getUploadDataMimeType:(NSString *)key {
    NSString *mimeType = nil;
    key = [key lowercaseString];
    if ([key rangeOfString:@".jpg"].location != NSNotFound || [key rangeOfString:@"image"].location != NSNotFound) {
        mimeType = @"image/jpeg";
    }else if ([key rangeOfString:@".png"].location != NSNotFound) {
        mimeType = @"image/png";
        
    }else if ([key rangeOfString:@".mp3"].location != NSNotFound) {
        mimeType = @"audio/mpeg";
        
    }else if ([key rangeOfString:@".qt"].location != NSNotFound) {
        mimeType = @"video/quicktime";
        
    }else if ([key rangeOfString:@".mp4"].location != NSNotFound) {
        mimeType = @"video/mp4";
        
    }else if ([key rangeOfString:@".amr"].location != NSNotFound) {
        mimeType = @"audio/amr";
    }else if ([key rangeOfString:@".gif"].location != NSNotFound) {
        mimeType = @"image/gif";
    }else if ([key rangeOfString:@".mov"].location != NSNotFound) {
        mimeType = @"video/quicktime";
    }else if ([key rangeOfString:@".wav"].location != NSNotFound) {
        mimeType = @"audio/wav";
    }else {
        mimeType = @"";
    }
    
    return mimeType;
}

- (NSString *)getParamStr:(NSDictionary *)paramDict {
    NSMutableString *paramStr = [NSMutableString string];
    NSArray *keys = [[paramDict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    for (NSInteger i = 0; i < keys.count; i ++) {
        NSString *key = keys[i];
        if ([key isEqualToString:@"salt"]) {
            continue;
        }
        if ([key isEqualToString:@"access_token"]) {
            continue;
        }
        NSString *value = paramDict[key];
        if ([paramDict[key] isKindOfClass:[NSNumber class]]) {
            NSNumber *num = paramDict[key];
            value = [num stringValue];
        }
        if (value == nil || [value isKindOfClass:[NSNull class]]) {
            value = @"";
        }

        [paramStr appendString:value];
    }
    return paramStr;
}

@end

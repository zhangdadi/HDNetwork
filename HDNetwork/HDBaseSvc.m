//
//  BaseSvc.m
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDBaseSvc.h"
#import "HDRequest_Net.h"
#import "HDBaseJSONPageParam.h"

@interface HDBaseSvc ()

@property (nonatomic, strong) HDRequest *help;

@end

@implementation HDBaseSvc

- (void)loadFirstPage {
    NSLog(@"loadFirstPage");
    HDBaseJSONParam *param = [_help getParam];
    if ([param isKindOfClass:[HDBaseJSONPageParam class]]) {
        ((HDBaseJSONPageParam *)param).pageIndex = 0;
        _help.start();
    } else{
        NSLog(@"此接口不能分页");
    }

}

- (void)loadNextPage {
    NSLog(@"loadNextPage");
    HDBaseJSONParam *param = [_help getParam];
    if ([param isKindOfClass:[HDBaseJSONPageParam class]]) {
        ((HDBaseJSONPageParam *)param).pageIndex++;
        _help.start();
    } else{
        NSLog(@"此接口不能分页");
    }
}


#pragma mark - 重写协议

+ (instancetype)getUrl:(NSString *)url {
    HDBaseSvc *svc = [[HDBaseSvc alloc] init];
    svc.help = [HDRequest getUrl:url];
    return svc;
}

+ (instancetype)postUrl:(NSString *)url {
    HDBaseSvc *svc = [[HDBaseSvc alloc] init];
    svc.help = [HDRequest postUrl:url];
    return svc;
}

- (HDRequest<HDRequestProtocol> *(^)(HDBaseJSONParam*))param {
    return ^id(HDBaseJSONParam *param) {
        _help.param(param);
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(NSString*))apiVersion {
    return ^id(NSString *apiVersion) {
        _help.apiVersion(apiVersion);
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(BOOL))refresh {
    return ^id(BOOL refresh) {
        _help.refresh(refresh);
        return self;
    };
}

- (HDRequest<HDRequestProtocol> *(^)(DBHelperCompletionBlock))completionBlock {
    return ^id(DBHelperCompletionBlock completionBlock) {
        _help.completionBlock(completionBlock);
        return self;
    };
}

- (id (^)())start {
    return ^id() {
        _help.start();
        return self;
    };
}


@end

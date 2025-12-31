//
//  HDNWPageParam.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWPageParam.h"
#import "HDNWConfig.h"

@implementation HDNWPageParam

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pageSize = 10;
    }
    return self;
}

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"pageIndex": [HDNWConfig shared].pageConfig.pageIndexName,
        @"pageSize": [HDNWConfig shared].pageConfig.pageSizeName,
    };
}

@end

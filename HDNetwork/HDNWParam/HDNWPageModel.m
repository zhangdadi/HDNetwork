//
//  HDNWPageModel.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWPageModel.h"
#import "HDNWConfig.h"

@implementation HDNWPageModel

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"pageIndex": [HDNWConfig shared].pageConfig.pageIndexName,
        @"pageSize": [HDNWConfig shared].pageConfig.pageSizeName,
        @"totalRow": [HDNWConfig shared].pageConfig.totalRowName,
        @"totalPage": [HDNWConfig shared].pageConfig.totalPageName,
    };
}

@end

//
//  HDNWPageConfig.m
//  HDNetworkDemo
//
//  Created by zhangdadi on 2022/8/11.
//

#import "HDNWPageConfig.h"

@implementation HDNWPageConfig
- (instancetype)init {
    self = [super init];
    if (self) {
        self.pageIndexName = @"page";
        self.pageSizeName = @"size";
        self.totalRowName = @"totalRow";
        self.totalPageName = @"totalPage";
    }
    return self;
}
@end

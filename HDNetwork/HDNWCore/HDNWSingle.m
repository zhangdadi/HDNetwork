//
//  HDNWSingle.m
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import "HDNWSingle.h"
#import <objc/runtime.h>
#import "HDNWLog.h"

@implementation HDNWSingle

+ (instancetype)shared {
    id instance = objc_getAssociatedObject(self, @"instance");
    if (!instance) {
        instance = [[super allocWithZone:NULL] init];
        HDNWLog(@"单例创建:%@",instance);
        objc_setAssociatedObject(self, @"instance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shared];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    Class selfClass = [self class];
    return [selfClass shared];
}

@end

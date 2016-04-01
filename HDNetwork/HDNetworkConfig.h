//
//  HDNetworkConfig.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDNetworkConfig : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *cdnUrl;
@property (strong, nonatomic) NSDictionary *httpHeadDict;


@end

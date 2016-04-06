//
//  NodeModel.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"


@interface NodeModel : HDBaseJSONModel

@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *title_alternative;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSInteger topics;
@property (nonatomic, strong) NSString *avatar_mini;
@property (nonatomic, strong) NSString *avatar_normal;
@property (nonatomic, strong) NSString *avatar_large;

@end


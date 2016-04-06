//
//  DemoModel.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"

@interface NodesModel : HDBaseJSONModel
@property (nonatomic, assign) NSNumber *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@end


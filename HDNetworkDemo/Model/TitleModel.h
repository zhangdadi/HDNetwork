//
//  TitleModel.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"
#import "MemberModel.h"
#import "NodeModel.h"

@interface TitleModel : HDBaseJSONModel

@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *content_rendered;
@property (nonatomic, assign) NSInteger replies;
@property (nonatomic, strong) MemberModel *member;
@property (nonatomic, strong) NodeModel *node;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) NSInteger last_modified;
@property (nonatomic, assign) NSInteger last_touched;

@end

@protocol TitleModel <NSObject> @end

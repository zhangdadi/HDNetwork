//
//  MemberModel.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"

@interface MemberModel : HDBaseJSONModel
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *tagline;
@property (nonatomic, strong) NSString *avatar_mini;
@property (nonatomic, strong) NSString *avatar_normal;
@property (nonatomic, strong) NSString *avatar_large;

@end


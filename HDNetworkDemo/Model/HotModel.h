//
//  HotModel.h
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"
#import "TitleModel.h"

@interface HotModel : HDBaseJSONModel
@property (nonatomic, strong) NSArray<TitleModel> *titleModel;
@end



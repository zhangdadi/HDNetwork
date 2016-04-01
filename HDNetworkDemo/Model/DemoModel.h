//
//  DemoModel.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDBaseJSONModel.h"


@interface DemoModelItem : HDBaseJSONModel

@property (nonatomic, assign) NSInteger CityCode;
@property (nonatomic, strong) NSString *CityName;
@property (nonatomic, strong) NSString *FirstWord;
@property (nonatomic, assign) NSInteger Id;

@end
@protocol DemoModelItem <NSObject>
@end



@interface DemoModel : HDBaseJSONModel
@property (nonatomic, assign) NSNumber *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@end


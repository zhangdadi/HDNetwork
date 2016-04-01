//
//  BaseJSONModel.h
//  shareNNShop
//
//  Created by adh-mjb on 14-10-28.
//  Copyright (c) 2014年 adh 马骏斌. All rights reserved.
//

#import "JSONModel.h"
#import "HDAPIResult.h"

@interface HDBaseJSONModel : JSONModel

/**
 *  将dictionary转化为model
 */
+(id)parse:(id)jsonData;

-(id)initWithDictionary:(NSDictionary*)dict;

@end

//
//  BaseJSONModel.m
//  shareNNShop
//
//  Created by adh-mjb on 14-10-28.
//  Copyright (c) 2014年 adh 马骏斌. All rights reserved.
//

#import "HDBaseJSONModel.h"

@implementation HDBaseJSONModel

// 将dictionary(array)转化为model(model list)
+(id)parse:(id)jsonData{
    id data = nil;
    
    if([jsonData isKindOfClass:[NSDictionary class]]){
        data = [self parseDict:jsonData];
    }else if([jsonData isKindOfClass:[NSArray class]]){
        data = [self parseArray:jsonData];
    }
    
    return data;
}

// 将dictionary转化为model
+(id)parseDict:(NSDictionary*)dict{
    id data = [[self alloc]initWithDictionary:dict];
    return data;
}

// 将dictionary数组转化为model数组
+(id)parseArray:(NSArray*)arrDict{
    
    if(![arrDict isKindOfClass:[NSArray class]]) return nil;
    
    NSArray *list = (NSArray*)[self arrayOfModelsFromDictionaries:arrDict];
    return list;
}

// 允许服务器端返回的Model缺省属性
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

-(id)initWithDictionary:(NSDictionary*)dict{
    return [self initWithDictionary:dict error:nil];
}

@end

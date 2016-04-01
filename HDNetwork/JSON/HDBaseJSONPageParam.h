//
//  BaseJSONPageParam.h
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDBaseJSONParam.h"

@interface HDBaseJSONPageParam : HDBaseJSONParam

@property (nonatomic, assign) NSInteger pageIndex; //默认为1

/**
 *  子类修改默认的分页大小时在Init方法里调用，外部不要调用。
 *
 *  @param pageSize 分页大小，默认为10
 *
 */
- (instancetype)initWithPageSize:(NSInteger)pageSize;

@end

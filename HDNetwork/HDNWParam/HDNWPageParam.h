//
//  HDNWPageParam.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import <Foundation/Foundation.h>


@interface HDNWPageParam : NSObject
/**
 *  页码，默认为0
 */
@property (nonatomic, assign) NSInteger pageIndex;

/**
 *  分页大小，默认为10
 */
@property (nonatomic, assign) NSInteger pageSize;

@end


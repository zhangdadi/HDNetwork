//
//  HDNWPageConfig.h
//  HDNetworkDemo
//
//  Created by zhangdadi on 2022/8/11.
//

#import <Foundation/Foundation.h>



@interface HDNWPageConfig : NSObject
/// 分页请求中:页码名称，默认为page
@property(nonatomic, copy) NSString *pageIndexName;

/// 分页请求中:每页大小名称，默认为size
@property(nonatomic, copy) NSString *pageSizeName;

/**
 *  分页请求中:总的数量名称，默认为totalRow
 */
@property (nonatomic, copy) NSString *totalRowName;

/**
 *  分页请求中:总的页码数名称，默认为totalPage
 */
@property (nonatomic, copy) NSString *totalPageName;
@end



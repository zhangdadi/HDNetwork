//
//  HDNWPageModel.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import <Foundation/Foundation.h>


@interface HDNWPageModel : NSObject

/**
 *  页码
 */
@property (nonatomic,assign) NSInteger pageIndex;

/**
 *  每页大小
 */
@property (nonatomic,assign) NSInteger pageSize;

/**
 *  总的数量，一共有多少条数据
 */
@property (nonatomic, assign) NSInteger totalRow;

/**
 *  总的页码数
 */
@property (nonatomic, assign) NSInteger totalPage;


/// 如果重写此方法，请调用父类的方法获取字典后再跟子类的组装
+ (NSDictionary*)modelCustomPropertyMapper;


@end


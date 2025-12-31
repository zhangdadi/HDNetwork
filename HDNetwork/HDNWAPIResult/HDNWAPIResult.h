//
//  HDNWAPIResult.h
//  HDNetwork
//
//  Created by zhangdadi on 2021/9/6.
//

#import <Foundation/Foundation.h>

@protocol HDNWAPIResultProtocol <NSObject>

@required
/**
 *  请求是否成功，YES表示成功，否则为NO。
 */
@property (nonatomic, assign) BOOL isSucc;

/**
 *  code码
 */
@property (nonatomic, assign) int  code;

/**
 *  接口提示信息
 */
@property (nonatomic, copy) NSString    *msg;

/**
 *  data数据
 */
@property (nonatomic, copy) NSDictionary *data;

/**
 *  原始数据
 */
@property (nonatomic, copy) NSDictionary *result;

/**
 *  解析原数据
 *
 *  @param jsonData 接口返回的原数据
 *
 *  @return 本类
 */
+ (instancetype)parse:(NSDictionary*)jsonData;

@end


@interface HDNWAPIResult : NSObject<HDNWAPIResultProtocol>

/**
 *  请求是否成功，YES表示成功，否则为NO。
 */
@property (nonatomic, assign) BOOL isSucc;

/**
 *  code码
 */
@property (nonatomic, assign) int  code;

/**
 *  接口提示信息
 */
@property (nonatomic, copy) NSString    *msg;

/**
 *  data数据
 */
@property (nonatomic, copy) NSDictionary *data;

/**
 *  原始数据
 */
@property (nonatomic, copy) NSDictionary *result;

/**
 *  解析原数据
 *
 *  @param jsonData 接口返回的原数据
 *
 *  @return 本类
 */
+ (instancetype)parse:(NSDictionary*)jsonData;

@end


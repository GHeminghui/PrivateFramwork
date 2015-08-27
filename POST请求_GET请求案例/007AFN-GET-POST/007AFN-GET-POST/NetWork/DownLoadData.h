//
//  DownLoadData.h
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface DownLoadData : NSObject

// 获取首页所有数据
//+ (NSURLSessionDataTask *)getAllDataWithBlock:(void (^)(NSDictionary *result))block;


//通过GET下载xml数据
+ (NSURLSessionDataTask *)getWetherData:(void (^) (id obj, NSError *err))block;

//通过POST下载xml数据
+ (NSURLSessionDataTask *)postWetherData:(void (^) (id obj, NSError *err))block;


@end
















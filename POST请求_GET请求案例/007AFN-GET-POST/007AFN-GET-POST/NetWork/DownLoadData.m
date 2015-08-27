//
//  DownLoadData.m
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "DownLoadData.h"
#import "AFAppDotNetAPIClient.h"
#import "NSString+URLEncoding.h"

@implementation DownLoadData

//通过GET下载xml数据
+ (NSURLSessionDataTask *)getWetherData:(void (^) (id obj, NSError *err))block {
//http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=北京
    
//    如果是GET请求，接口中有汉字，必须转码，否则请求失败或者会崩溃
    NSString *path = [@"WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=北京" URLEncodedString];
    
    
    return [[AFAppDotNetAPIClient sharedClient] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
//        NSLog(@"%@",responseObject);
        
        NSData *data = (NSData *)responseObject;
        
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        if (block) {
            block(result,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (block) {
            block(nil,error);
        }
    }];
    
}


//通过POST下载xml数据
+ (NSURLSessionDataTask *)postWetherData:(void (^) (id obj, NSError *err))block {

//    http://www.webxml.com.cn/
//    WebServices/WeatherWebService.asmx/getWeatherbyCityName
    
    NSString *path = @"WebServices/WeatherWebService.asmx/getWeatherbyCityName";
//    在AFN里面，请求体不需要转码
//    在AFN中会自动设置来自上传流的头信息
//    NSString *httpBody = @"theCityName=北京";
    NSDictionary *parameters = @{@"theCityName":@"北京"};
    
    return [[AFAppDotNetAPIClient sharedClient] POST:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"成功");
        NSData *data = (NSData *)responseObject;
        
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        if (block) {
            block(result,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
        if (block) {
            block(nil,error);
        }
    }];
    

}

@end










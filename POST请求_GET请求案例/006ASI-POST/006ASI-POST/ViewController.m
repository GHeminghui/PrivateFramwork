//
//  ViewController.m
//  003ASI-GET
//
//  Created by 黎跃春 on 15/8/27.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "NSString+URLEncoding.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@interface ViewController ()<ASIHTTPRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    1.地址 NSString
    NSString *path = [@"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName" URLEncodedString];
   
    //    2.将NSString转换成URL
    NSURL *url = [NSURL URLWithString:path];
    
//
    
    //    3.建立请求
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    (1)设置请求方式为POST
    [request setRequestMethod:@"POST"];
//    （2）设置请求体
    NSString *httpBody = [@"theCityName=大连" URLEncodedString];
    [request appendPostData:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
//    （3）设置来自上传流的头信息
    /*
     Content-Type: application/x-www-form-urlencoded
     Content-Length: length
     */
    [request addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    [request addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%ld",httpBody.length]];
    
    //    4.设置委托
    request.delegate = self;
    //    5.开始异步下载
    [request startAsynchronous];
    
}

#pragma mark --ASIHTTPRequestDelegate
//开始请求
- (void)requestStarted:(ASIHTTPRequest *)request {
    
    NSLog(@"%s",__func__);
}
//请求成功
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"%s %@",__func__,request.responseString);
}
//请求失败
- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"%s",__func__);
}


@end






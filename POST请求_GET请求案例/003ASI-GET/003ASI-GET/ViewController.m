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
@interface ViewController ()<ASIHTTPRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    1.地址 NSString
    NSString *path = [@"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=北京" URLEncodedString];
    //    http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=%E5%8C%97%E4%BA%AC
    //    2.将NSString转换成URL
    NSURL *url = [NSURL URLWithString:path];
    
//    3.建立请求
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
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






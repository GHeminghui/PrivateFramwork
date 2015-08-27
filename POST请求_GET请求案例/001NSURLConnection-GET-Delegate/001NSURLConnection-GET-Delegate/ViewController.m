//
//  ViewController.m
//  001NSURLConnection-GET-Delegate
//
//  Created by 黎跃春 on 15/8/27.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "NSString+URLEncoding.h"
@interface ViewController ()< NSURLConnectionDataDelegate>
{
   __strong NSMutableData *_data;//用于接收下载下来的数据
}
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
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    4.通过NSURLConnection开始请求
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
}


#pragma mark --NSURLConnectionDataDelegate
//数据开始请求时回调的方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    _data = nil;
    _data = [NSMutableData data];
    NSLog(@"%s",__func__);
}
//数据请求过程中回调的方法,这个方法数据量可能会被调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    [_data appendData:data];
    NSLog(@"%s",__func__);
}
//数据请求成功回调的方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

    NSString *content = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%s %@",__func__,content);
}

//数据请求失败时会回调的方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

    NSLog(@"%s",__func__);
}


@end

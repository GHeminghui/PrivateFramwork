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
    NSString *path = @"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName";
    //    2.将NSString转换成URL
    NSURL *url = [NSURL URLWithString:path];
    //    3.建立请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request默认请求方式是GET，需要修改成POST
    [request setHTTPMethod:@"POST"];
//    拼接请求体,并且转码
    NSString *httpBody = [@"theCityName=上海" URLEncodedString];
//    设置请求体
    [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
//    设置来自上传流的头信息
    /*Content-Type: application/x-www-form-urlencoded
     Content-Length: length*/
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request addValue:[NSString stringWithFormat:@"%ld",httpBody.length] forHTTPHeaderField:@"Content-Length"];
    
    
    
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

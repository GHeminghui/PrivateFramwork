//
//  ViewController.m
//  002NSURLConnection-GET-Block
//
//  Created by 黎跃春 on 15/8/27.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "NSString+URLEncoding.h"
@interface ViewController ()

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
    
    //    4.通过block请求数据
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSLog(@"--%@",[NSThread currentThread]);
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"==%@",[NSThread currentThread]);
        
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"%@",content);
        });
        
    }];
    NSLog(@"++%@",[NSThread currentThread]);
}



@end

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
    NSString *path = [@"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=北京" URLEncodedString];
    //    http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=%E5%8C%97%E4%BA%AC
    //    2.将NSString转换成URL
    NSURL *url = [NSURL URLWithString:path];
    //    3.建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
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

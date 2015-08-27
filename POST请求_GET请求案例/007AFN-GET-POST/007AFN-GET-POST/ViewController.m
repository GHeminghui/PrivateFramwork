//
//  ViewController.m
//  007AFN-GET-POST
//
//  Created by 黎跃春 on 15/8/27.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DownLoadData getWetherData:^(id obj, NSError *err) {
       
        NSLog(@"GET:%@",obj);
        
    }];
    
    [DownLoadData postWetherData:^(id obj, NSError *err) {
        NSLog(@"POST:%@",obj);
    }];
    
}



@end






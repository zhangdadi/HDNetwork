//
//  ViewController.m
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "ViewController.h"
#import "TopicsSvc.h"
#import "NodesSvc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [TopicsSvc getHotWithCmpleted:^(HDAPIResult *result, NSArray<TitleModel> *list) {
        if (result.isSucc) {
            NSLog(@"请求成功，获取的数据个数：%ld", list.count);
        } else {
            NSLog(@"请求失败:%@", result.msg);
        }
    }];
    
    
    NodesParam *param = [[NodesParam alloc] init];
    param.name = @"python";
    [NodesSvc getShowWithParam:param cmpleted:^(HDAPIResult *result, NodesModel *model) {
        if (result.isSucc) {
            NSLog(@"请求成功，获取的数据：%@", model);
        } else {
            NSLog(@"请求失败:%@", result.msg);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

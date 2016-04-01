//
//  ViewController.m
//  HDNetworkDemo
//
//  Created by Aaron on 16/4/1.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "ViewController.h"
#import "TopicsSvc.h"
#import "DemoSvc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [TopicsSvc getHotWithCmpleted:^(HDAPIResult *result, NSArray<TitleModel> *list) {
        NSLog(@"%@", list);
    }];
    
    DemoParam *param = [[DemoParam alloc] init];
    param.ID = 2;
    [DemoSvc getDataWithParam:param cmpleted:^(HDAPIResult *result, DemoModel *model) {
         NSLog(@"%@", model);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

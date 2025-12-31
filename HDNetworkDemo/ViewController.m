//
//  ViewController.m
//  HDNetworkDemo
//
//  Created by zhangdadi on 2022/4/19.
//

#import "ViewController.h"
#import "HDNetwork.h"
#import "DemoParam.h"
#import "AFNetworking.h"

@interface ViewController ()
@property(nonatomic, strong) HDNWManager *pageManager;
@property(nonatomic, strong) UIButton *addButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//https://api-wanbaolou.xoyo.com/api/buyer/goods/list?game_id=jx3&zone_id=z01&server_id=gate0126&game=jx3&page=1&size=10&goods_type=1
//    self.pageManager = [HDNWManager get].url(@"buyer/goods/list").paramDict(@{@"game_id":@"jx3",@"zone_id":@"z01", @"server_id":@"gate0126"});
    
    self.pageManager = [HDNWManager get].url(@"buyer/goods/list").paramDict(@{@"game_id":@"jx3",@"zone_id":@"z01", @"server_id":@"gate0126"}).completionBlock(^(HDNWAPIResult *result, id data) {
        NSLog(@"%@", data);
    }).start(nil);
    
    
    DemoParam *param = DemoParam.new;
    param.pageIndex = 1;
    param.game_id = @"jx3";
    param.zone_id = @"z01";
    param.server_id = @"gate0126";
    self.pageManager = [HDNWManager get].url(@"buyer/goods/list").param(param).completionBlock(^(id<HDNWAPIResultProtocol> result, id data) {
        NSLog(@"%@", data);

    }).start(nil);
    
}


@end

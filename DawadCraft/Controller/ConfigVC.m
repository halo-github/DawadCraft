//
//  ConfigVC.m
//  DawadCraft
//
//  Created by Fenix on 16/5/24.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ConfigVC.h"

@interface ConfigVC ()

@end

@implementation ConfigVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _buttonTab.dataArr = [[NSMutableArray  alloc] initWithObjects:@{@"飞控":@"FlyConfig"}, nil];
    _buttonTab.dataArr = [[NSMutableArray  alloc] initWithObjects:@{@"飞控":@"FlyConfig"},@{@"相机":@"CameraConfig"},@{@"显示":@"ShowConfig"},@{@"遥控器":@"RemoteController"},@{@"其他":@"Others"}, nil];
    _buttonTab.commonView = _genericView;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

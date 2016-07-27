//
//  HelpVC.m
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "HelpVC.h"
#import "CompanyIntroduceView.h"
#import "GuideView.h"
@interface HelpVC ()

@end

@implementation HelpVC

-(void)loadView
{
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _buttonTab.dataArr = [[NSMutableArray  alloc] initWithObjects:@{@"公司介绍":@"CompanyIntroduceView"},@{@"指南文档":@"GuideView"},@{@"功能介绍":@"FunctionView"},@{@"版本更新":@"UpdateView"}, nil];
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

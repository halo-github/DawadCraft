//
//  HelpVC.m
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "HelpVC.h"
#import "ButtonRow.h"
#import "CompanyIntroduceView.h"
#import "GuideView.h"
@interface HelpVC ()

@end

@implementation HelpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttons.delegate = self;
    self.buttons.genericVW = self.genericView;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)selected:(UIButton *)button
{
//    [self.companyIntroduceVW awakeFromNib];
//    [(GuideView*)self.companyIntroduceVW awakeFromNib];
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

//
//  HelpVC.h
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommmonButtonRow.h"
#import "CompanyIntroduceView.h"
@interface HelpVC : UIViewController
@property (strong, nonatomic) IBOutlet CompanyIntroduceView *genericView;
@property (weak, nonatomic) IBOutlet CommmonButtonRow *buttonTab;
//@property (nonatomic, strong) NSMutableArray *dataArr;



@end

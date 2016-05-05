//
//  HelpVC.h
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonRow.h"
#import "CompanyIntroduceView.h"
@interface HelpVC : UIViewController<ButtonRowDelegate>
@property (weak, nonatomic) IBOutlet ButtonRow *buttons;
@property (weak, nonatomic) IBOutlet UIView *genericView;




@end

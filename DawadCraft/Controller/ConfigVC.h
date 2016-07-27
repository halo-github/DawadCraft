//
//  ConfigVC.h
//  DawadCraft
//
//  Created by Fenix on 16/5/24.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommmonButtonRow.h"
#import "FlyConfig.h"
@interface ConfigVC : UIViewController
@property (weak, nonatomic) IBOutlet CommmonButtonRow *buttonTab;
@property (weak, nonatomic) IBOutlet FlyConfig *genericView;

@end

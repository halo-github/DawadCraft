//
//  ButtonRow.h
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//
#import "GenericView.h"
#import <UIKit/UIKit.h>

@protocol ButtonRowDelegate <NSObject>

-(void)selected:(UIButton*)button;

@end

@interface ButtonRow : UIView
@property (nonatomic, strong) NSDictionary *viewWithBtn;
@property (strong, nonatomic) IBOutlet UIView *subview;

@property (weak, nonatomic) IBOutlet UIButton *IntroduceBtn;
@property (weak, nonatomic) IBOutlet UIButton *guideBtn;
@property (weak, nonatomic) IBOutlet UIButton *functionBtn;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, weak) id <ButtonRowDelegate>delegate;
@property (nonatomic)CGRect genericViewFrame;
@property (nonatomic, strong) UIView *genericVW;
@end

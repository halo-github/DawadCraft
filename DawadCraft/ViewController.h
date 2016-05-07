//
//  ViewController.h
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MPMoviePlayerController;
@interface ViewController : UIViewController
@property (nonatomic, strong) MPMoviePlayerController* movieCtrl ;
@property (strong, nonatomic) IBOutlet UIView *backView;

@end


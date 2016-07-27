//
//  PostureView.h
//  DawadCraft
//
//  Created by Fenix on 16/5/18.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostureView : UIView
@property (strong, nonatomic) IBOutlet UIView *subview;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (nonatomic) CATransform3D perp;
@property (nonatomic,strong)NSTimer *timer;
-(void)startTimer;
-(void)stopTimer;
@end

//
//  Playerview.h
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayerView : UIView
@property (nonatomic, strong) AVPlayer *player;

+(id)sharedPlayer;
@end

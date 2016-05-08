//
//  PlayerLayer.h
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayerLayer : CALayer
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playItem;
+(id)sharedLayer;
@end

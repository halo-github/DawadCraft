//
//  PlayerLayer.m
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "PlayerLayer.h"
#import <AVFoundation/AVFoundation.h>
@implementation PlayerLayer
+(id)sharedLayer
{
    static PlayerLayer *g_layer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_layer = [[PlayerLayer alloc] init];
    });
    return g_layer;
}

+(Class)class
{
    return [AVPlayerLayer class];
}
@end

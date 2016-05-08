//
//  Playerview.m
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(id)sharedPlayer
{
    static dispatch_once_t onceTokern;
    static PlayerView *g_player = nil;
    dispatch_once(&onceTokern, ^{
        g_player = [[PlayerView alloc] init];
    });
    return g_player;
}

+(Class)layerClass
{
    return [AVPlayerLayer class];
    
}

-(AVPlayer*)player
{
    return [(AVPlayerLayer*)[self layer] player];
}

-(void)setPlayer:(AVPlayer *)player
{
    [(AVPlayerLayer*)[self layer] setPlayer:player];
}


@end

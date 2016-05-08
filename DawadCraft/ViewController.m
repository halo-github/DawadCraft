//
//  ViewController.m
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ViewController.h"
#import "CompanyIntroduceView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "PlayerView.h"
#import "PlayerLayer.h"
@interface ViewController ()

@end

@implementation ViewController
//-(void)loadView
//{
//    [super loadView];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Never give up" ofType:@"mp4"];
    NSURL *playUrl = [NSURL fileURLWithPath:path];
//    self.movieCtrl = [[MPMoviePlayerController alloc] initWithContentURL:playUrl];
//    self.movieCtrl.controlStyle = MPMovieControlStyleNone;
//    self.movieCtrl.view.frame = self.view.bounds;
////    self.backView = self.movieCtrl.view;
//    
//    [self.movieCtrl prepareToPlay];
//    [self.movieCtrl play];
//    [self.view addSubview:self.movieCtrl.view];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:playUrl];
    AVPlayer *plr = [AVPlayer playerWithPlayerItem:item];
    PlayerView *plrView = [PlayerView sharedPlayer];
    AVPlayerLayer *layer  = plrView.layer;
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    plrView.player = plr;
    plrView.frame = self.view.bounds;
    [plr play];
    [self.view  addSubview:plrView];
    
 }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.movieCtrl play];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.movieCtrl pause];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:playUrl];
    AVPlayer *plr = [AVPlayer playerWithPlayerItem:item];
    //    AVPlayerLayer *plrLayer =
    PlayerView *plrView = [PlayerView sharedPlayer];
    AVPlayerLayer *layer  = plrView.layer;
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    plrView.player = plr;
    plrView.frame = self.view.bounds;
    [plr play];
    [self.view  addSubview:plrView];

//    _movieCtrl = [[MPMoviePlayerController alloc] initWithContentURL:playUrl];
//    _movieCtrl.controlStyle = MPMovieControlStyleNone;
//    _movieCtrl.view.frame = _view.bounds;
////    _backView = _movieCtrl.view;
//    
//    [_movieCtrl prepareToPlay];
//    [_movieCtrl play];
//    [_view addSubview:_movieCtrl.view];
    
 }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[[PlayerView sharedPlayer] player] play];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[[PlayerView sharedPlayer] player] pause];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

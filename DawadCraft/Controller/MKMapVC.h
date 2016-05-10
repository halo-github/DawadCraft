//
//  MKMapVC.h
//  DawadCraft
//
//  Created by Fenix on 16/5/7.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "DrawLine.h"
#import "DrawView.h"
#import "cornerRadiusBtn.h"
#import "PlayerView.h"
@interface MKMapVC : UIViewController<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *localtionManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) DrawLine *drawView;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *singlePointBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *singlLineBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *drawBtn;



@property (weak, nonatomic) IBOutlet UIView *videoView;

@end

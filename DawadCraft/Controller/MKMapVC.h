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
#import "cornerRadiusBtn.h"
#import "PlayerView.h"
#import "PostureView.h"
@interface MKMapVC : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,MKAnnotation>
{
    BOOL videoBtnsExtend;
    BOOL videoExtend ;
}
@property (nonatomic, strong) CLLocationManager *localtionManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) DrawLine *drawView;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *singlePointBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *singlLineBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *drawBtn;

@property (weak, nonatomic) IBOutlet cornerRadiusBtn *viewAngleBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *leftBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *rightBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *aheadBtn;

@property (weak, nonatomic) IBOutlet PostureView *posture;

@property (weak, nonatomic) IBOutlet UIButton *configBtn;

@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UISlider *cameraSld;

@property (weak, nonatomic) IBOutlet cornerRadiusBtn *takePIcBtn;
@property (weak, nonatomic) IBOutlet cornerRadiusBtn *takeVideoBtn;

@end

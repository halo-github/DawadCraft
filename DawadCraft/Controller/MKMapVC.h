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
@interface MKMapVC : UIViewController<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *localtionManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

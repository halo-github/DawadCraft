//
//  MKMapVC.m
//  DawadCraft
//
//  Created by Fenix on 16/5/7.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "MKMapVC.h"

@interface MKMapVC ()

@end

@implementation MKMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.localtionManager = [[CLLocationManager alloc] init];
    self.localtionManager.delegate = self;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self.localtionManager requestAlwaysAuthorization];
    }
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
//    self.mapView.delegate = self;
#endif
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//    NSLog(@"ddfs");
//}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coord = [userLocation coordinate];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
    [self.mapView setRegion:region animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [manager requestWhenInUseAuthorization];
            }
            break;
            
        default:
            break;
    }

}
@end

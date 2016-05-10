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
    
    [self.mapView addSubview:self.drawView];
//    self.drawView = [[DrawView alloc] initWithFrame:CGRectZero];
    self.drawView = [[DrawLine alloc] initWithFrame:CGRectZero];
    self.drawView.userInteractionEnabled = YES;
    self.drawView.alpha = 0.5;
    self.drawView.backgroundColor = [UIColor blackColor];
    [self.mapView addSubview:self.drawView];
    
    
#endif
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)drawBtn:(id)sender {
    UIButton *btn =sender;
    if ([btn.titleLabel.text isEqualToString:@"draw"]) {
        [btn setTitle:@"OK" forState:UIControlStateNormal];
        [UIView animateWithDuration:1 animations:^{
            self.drawView.frame = self.view.bounds;
        }];
        
    } else {
        [btn setTitle:@"draw" forState:UIControlStateNormal];
        [UIView animateWithDuration:1 animations:^{
            self.drawView.frame = CGRectZero;
        }];

    }
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
- (IBAction)doubleTap:(UITapGestureRecognizer *)sender {
    NSInteger small = 0,big = 0;
    CGRect rectSmall = CGRectZero;
    CGRect rectBIg = CGRectZero;
    NSArray *arr = [self.view subviews];
    for (NSInteger i = 0;  i<self.view.subviews.count;i++) {
        if (self.mapView == arr[i]) {
            big = i;
            rectBIg = self.mapView.frame;
        }
        else if (self.videoView == arr[i])
        {
            small = i;
//            rectSmall = self.videoView
            }
    }
    [self.view exchangeSubviewAtIndex:small withSubviewAtIndex:big];
    
}
//展开画布和按钮
- (IBAction)extendToDraw:(id)sender {
    CGRect rct1 = self.singlePointBtn.frame;
    CGFloat moveX = rct1.size.width+10;
    CGFloat moveY = rct1.size.height/2+5;
    if (self.singlLineBtn.hidden == YES && self.singlePointBtn.hidden == YES) {
        self.singlePointBtn.hidden = NO;
        self.singlLineBtn.hidden = NO;
        [UIView animateWithDuration:0.5f animations:^{
//            展开
            self.singlePointBtn.transform = CGAffineTransformMakeTranslation(moveX, -moveY);
            self.singlLineBtn.transform = CGAffineTransformMakeTranslation(moveX, moveY);
//            self.singlLineBtn.transform = CGAffineTransformMakeRotation(2*M_PI);
            self.drawView.frame = self.view.bounds;
        }];
    }
    else
    {
        [UIView animateWithDuration:.5f animations:^{
//            收回
            self.singlePointBtn.transform = CGAffineTransformMakeTranslation(0, 0);
            self.singlLineBtn.transform = CGAffineTransformMakeTranslation(0, 0);
            self.drawView.frame = CGRectZero;
        } completion:^(BOOL finished) {
            self.singlePointBtn.hidden = YES;
            self.singlLineBtn.hidden = YES;
        }];
        
    }
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

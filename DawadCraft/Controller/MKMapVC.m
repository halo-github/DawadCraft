//
//  MKMapVC.m
//  DawadCraft
//
//  Created by Fenix on 16/5/7.
//  Copyright © 2016年 Fenix. All rights reserved.
//
#define SHIFTDURATION 1
#define EXTENDDURATION1 0.5f
#define EXTENDDURATION2 0.33f
#import "MKMapVC.h"
#import "PostureView.h"
#import  <AFNetworkReachabilityManager.h>
#import <MapKit/MKAnnotation.h>
#import "PathEntity.h"
@interface MKMapVC ()
//需要切换的视图，约束拉线出来，方便修改
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bigViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bigViewLeading;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *smallViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *smallViewLeading;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labTrailing;
@end

@implementation MKMapVC
#pragma mark 根视图
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi]) {
        NSLog(@"wifi connected");
    }
    else if ([[AFNetworkReachabilityManager sharedManager] isReachable])
    {
        
    }
    _smallViewLeading.constant = self.view.bounds.size.width*0.75;
    _smallViewTop.constant = self.view.bounds.size.height*0.75;

    videoExtend = NO;
    videoBtnsExtend = NO;
    NSArray *arr1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",arr1[0]);
//    定位管理
    _localtionManager = [[CLLocationManager alloc] init];
    _localtionManager.delegate = self;
//    iOS 8.0 以后请求授权
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [_localtionManager requestAlwaysAuthorization];
    }
    _mapView.mapType = MKMapTypeStandard;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    
//    [_mapView addSubview:_drawView];
    _drawView = [[DrawLine alloc] initWithFrame:CGRectZero];
    _drawView.userInteractionEnabled = YES;
    _drawView.alpha = 0.5;
    _drawView.backgroundColor = [UIColor blackColor];
    [_mapView addSubview:_drawView];
    NSLog(@"%@,%@",_mapView,_mapView.delegate);
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
#pragma mark 地图部分

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coord = [userLocation coordinate];
    NSLog(@"%f   %f",coord.latitude,coord.longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
    [_mapView setRegion:region animated:YES];
}

-(void)addPointsOnMapview:(MKMapView*)map
{
    for ( PathEntity *ent in _drawView.locationArr) {
        //        根据view上的位置，转换成map上的经纬度
        CLLocationCoordinate2D coordinnate = [_mapView convertPoint:CGPointMake(ent.x, ent.y) toCoordinateFromView:_drawView];
        MKPointAnnotation *anot = [[MKPointAnnotation alloc] init];
        anot.coordinate = coordinnate;
        [_mapView addAnnotation:anot];
        
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseID = @"ano";
    MKPinAnnotationView *anoView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    if (!anoView) {
        anoView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
    }
    anoView.canShowCallout = YES;
    anoView.animatesDrop = YES;
    anoView.pinColor = MKPinAnnotationColorGreen;
    if (annotation == [_mapView.annotations firstObject]) {
        anoView.pinColor = MKPinAnnotationColorRed;
    } else if(annotation == [_mapView.annotations lastObject]){
        anoView.pinColor = MKPinAnnotationColorPurple;
    }
    return anoView;
}
#pragma mark 功能按钮部分
- (IBAction)doubleTap:(UITapGestureRecognizer *)sender {
//    首次点击是本地存储view的index

    [self localSave];
    NSArray *indexs =[[NSUserDefaults standardUserDefaults] objectForKey:@"indexOfMapViewAndVedioView"] ;
    NSInteger indexSmall = [[indexs lastObject]  integerValue];
    NSInteger indexBig = [[indexs firstObject] integerValue];
    [self exchangeViewIndex:indexSmall withIndex:indexBig];
    videoExtend = !videoExtend?YES:NO;
}
- (IBAction)locateBtn:(id)sender {
    CLLocationCoordinate2D coord = [_mapView.userLocation coordinate];
    NSLog(@"%f   %f",coord.latitude,coord.longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
    [_mapView setRegion:region animated:YES];
}

//展开画布和按钮
- (IBAction)extendToDraw:(id)sender {
    if (_singlLineBtn.hidden == YES && _singlePointBtn.hidden == YES) {
        [self extend1];
        //移除之前的大头针
        [_mapView removeAnnotations:_mapView.annotations];
    } else {
        [self shrink1];
        [self addPointsOnMapview:_mapView];
    }
}


- (IBAction)extendToView:(id)sender {
    if (!videoBtnsExtend) {
        [self extend2];
    } else {
        [self shrink2];
    }
}

-(void)extend1
{
    CGRect rct1 = _singlePointBtn.frame;
    CGFloat moveX = rct1.size.width+10;
    CGFloat moveY = rct1.size.height/2+5;
    _singlePointBtn.hidden = NO;
    _singlLineBtn.hidden = NO;
    [UIView animateWithDuration:EXTENDDURATION1 animations:^{
        _singlePointBtn.alpha = 1;
        _singlLineBtn.alpha = 1;
        //            展开
        _singlePointBtn.transform = CGAffineTransformMakeTranslation(moveX, -moveY);
        _singlLineBtn.transform = CGAffineTransformMakeTranslation(moveX, moveY);
        //            _singlLineBtn.transform = CGAffineTransformMakeRotation(2*M_PI);
        _drawView.frame = _mapView.bounds;
    }];
}

-(void)shrink1
{
    if (_singlLineBtn.hidden == NO && _singlePointBtn.hidden == NO)
    {
        [UIView animateWithDuration:EXTENDDURATION1 animations:^{
            //            收回
            _singlePointBtn.alpha = 0;
            _singlLineBtn.alpha = 0;
            _singlePointBtn.transform = CGAffineTransformMakeTranslation(0, 0);
            _singlLineBtn.transform = CGAffineTransformMakeTranslation(0, 0);
            _drawView.frame = CGRectZero;
        } completion:^(BOOL finished) {
            _singlePointBtn.hidden = YES;
            _singlLineBtn.hidden = YES;
            _drawView.locationArr = nil;
            [_drawView setNeedsDisplay];
        }];
    }
}


-(void)extend2
{
     if (_leftBtn.hidden == YES && _rightBtn.hidden == YES && _aheadBtn.hidden == YES) {
                CGFloat moveX = _viewAngleBtn.frame.size.width+5;//移动距离
         //        显示视角按钮组
                _leftBtn.hidden = NO;
                _rightBtn.hidden = NO;
                _aheadBtn.hidden = NO;
                [UIView animateWithDuration:EXTENDDURATION1 animations:^{
                    _leftBtn.alpha = 1;
                    _rightBtn.alpha = 1;
                    _aheadBtn.alpha = 1;
                    _leftBtn.transform = CGAffineTransformMakeTranslation(moveX, 0);
                    _aheadBtn.transform = CGAffineTransformMakeTranslation(2*moveX, 0);
                    _rightBtn.transform = CGAffineTransformMakeTranslation(3*moveX, 0);
                }];
         videoBtnsExtend = YES;
     }
}
-(void)shrink2
{
     if (_leftBtn.hidden == NO && _rightBtn.hidden == NO   && _aheadBtn.hidden == NO) {
                [UIView animateWithDuration:EXTENDDURATION1 animations:^{
                    _leftBtn.alpha = 0;
                    _aheadBtn.alpha = 0;
                    _rightBtn.alpha = 0;
                    _leftBtn.transform = CGAffineTransformMakeTranslation(0, 0);
                    _aheadBtn.transform = CGAffineTransformMakeTranslation(0, 0);
                    _rightBtn.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    _leftBtn.hidden = YES;
                    _rightBtn.hidden = YES;
                    _aheadBtn.hidden = YES;
                }];
         videoBtnsExtend = NO;
     }
}

-(void)extend3
{
    _takeVideoBtn.hidden = NO;
    CGFloat moveX = _takePIcBtn.frame.size.width+2;
    [UIView animateWithDuration:EXTENDDURATION2 animations:^{
        _takeVideoBtn.alpha = 1;
        _takeVideoBtn.transform = CGAffineTransformMakeTranslation(-moveX, 0);
        //
    } completion:^(BOOL finished) {
        _takePIcBtn.hidden = NO;
        [UIView animateWithDuration:EXTENDDURATION2 animations:^{
            _takePIcBtn.alpha = 1;
            _takePIcBtn.transform = CGAffineTransformMakeTranslation(-moveX, 0);
        } completion:^(BOOL finished) {
            _cameraSld.hidden = NO;
            [UIView animateWithDuration:EXTENDDURATION2 animations:^{
                _cameraSld.alpha = 1;
                _cameraSld.center = CGPointMake(_takePIcBtn.center.x-moveX, _cameraSld.center.y);
            } completion:^(BOOL finished) {
            }];
        }];
    }];
}

-(void)shrink3
{
    CGFloat moveX = _takePIcBtn.frame.size.width+2;
    [UIView animateWithDuration:EXTENDDURATION2 animations:^{
        _cameraSld.alpha = 0;
         _cameraSld.center = CGPointMake(_takePIcBtn.center.x+moveX, _cameraSld.center.y);
    } completion:^(BOOL finished) {
        _cameraSld.hidden = YES;
        [UIView animateWithDuration:EXTENDDURATION2 animations:^{
            _takePIcBtn.alpha = 0;
            _takePIcBtn.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            _takePIcBtn.hidden = YES;
            [UIView animateWithDuration:EXTENDDURATION2 animations:^{
                _takeVideoBtn.alpha = 0;
                _takeVideoBtn.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:^(BOOL finished) {
                _takeVideoBtn.hidden = YES;
            }];
        }];
    }];
}


-(void)localSave
{
    //    dispatch_once本地存储index
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSInteger mapViewIndex = 0,vedioViewIndex = 0;
        NSArray *arr = [self.view subviews];
        for (NSInteger i = 0; i < arr.count; i ++) {
            UIView *aView = [arr objectAtIndex:i];
            if (aView.tag == 1001) {
                mapViewIndex = i;
            }
            if (aView.tag == 1002) {
                vedioViewIndex = i;
            }
        }
        NSArray *indexArr = [NSArray arrayWithObjects:[NSNumber numberWithInteger:mapViewIndex],[NSNumber numberWithInteger:vedioViewIndex], nil];
        [[NSUserDefaults standardUserDefaults] setObject:indexArr forKey:@"indexOfMapViewAndVedioView"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });
}
#pragma mark 视图切换
-(void)exchangeViewIndex:(NSInteger)upIndex withIndex:(NSInteger)lowIndex
{
    [self shrink1];
    [self shrink2];
    [self exchangeConstantA:_bigViewTop withConstantB:_smallViewTop];
    [self exchangeConstantA:_bigViewLeading withConstantB:_smallViewLeading];
    //    修改约束后
    _takeVideoBtn.hidden = NO;
    _takePIcBtn.hidden = NO;
    //地图与视图切换时切换成相应的按钮
    if (!videoExtend) {
        [self extend3];
    }
    else
    {
        [self shrink3];
    }
    
    [UIView animateWithDuration:SHIFTDURATION animations:^{
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        //      切换画图，实拍图按钮
        if (_bigViewTop.constant != 0) {
            _drawBtn.hidden = YES;
            _viewAngleBtn.hidden = NO;
        }
        else
        {
            _drawBtn.hidden = NO;
            _viewAngleBtn.hidden = YES;
        }
    }];
    [self.view exchangeSubviewAtIndex:lowIndex withSubviewAtIndex:upIndex];
    
}

-(void)exchangeConstantA:(NSLayoutConstraint*)a withConstantB:(NSLayoutConstraint*)b
{
    CGFloat c = 0.0;
    c = b.constant;
    b.constant = a.constant;
    a.constant = c;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//定位管理器需要实现的协议
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
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_posture stopTimer];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _cameraSld.transform = CGAffineTransformMakeRotation(-0.5*M_PI);
    [_posture startTimer];
}

-(void)viewDidAppear:(BOOL)animated
{

}
@end

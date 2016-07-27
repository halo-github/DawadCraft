//
//  DrawLine.h
//  DawadCraft
//
//  Created by Fenix on 16/5/9.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface DrawLine : UIView
{
    CGMutablePathRef path;
    CGContextRef context;
    CGPoint firstLocation;
    CGPoint secondLocation;
    CGPoint thirdLocation;
}
@property (nonatomic, strong) NSMutableArray *locationArr;
@property (nonatomic, strong) MKMapView *mapView;
-(id)initWithFrame:(CGRect)frame;
@end

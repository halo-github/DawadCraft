//
//  PathEntity.m
//  DawadCraft
//
//  Created by Fenix on 16/5/21.
//  Copyright © 2016年 Fenix. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PathEntity.h"

@implementation PathEntity
-(id)initWithLocation:(CGPoint)point
{
    if (self = [super init]) {
        _x = point.x;
        _y = point.y;
    }
    return self;
}

@end

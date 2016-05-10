//
//  DrawLine.h
//  DawadCraft
//
//  Created by Fenix on 16/5/9.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawLine : UIView
{
    CGMutablePathRef path;
    CGContextRef context;
}
-(id)initWithFrame:(CGRect)frame;
@end

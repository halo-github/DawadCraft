//
//  DrawView.h
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
{
    CGContextRef context;
    CGLayerRef layer;
    float brushWidth;
    float brushColor;
}
@end

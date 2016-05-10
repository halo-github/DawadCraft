//
//  DrawView.m
//  DawadCraft
//
//  Created by Fenix on 16/5/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "DrawView.h"
@implementation DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        context = CGBitmapContextCreate(NULL, self.frame.size.width, self.frame.size.height, 8, 4 *self.frame.size.width, colorSpace, kCGImageAlphaPremultipliedFirst);
        CGColorSpaceRelease(colorSpace);
        
        layer = CGLayerCreateWithContext(context, self.frame.size, NULL);
        CGContextRef layerContext = CGLayerGetContext(layer);
        brushWidth = 5.0;
        CGContextSetLineWidth(layerContext, brushWidth);
        CGContextSetLineCap(layerContext, kCGLineCapRound);
        brushColor = 0.0;
        CGContextSetRGBStrokeColor(layerContext, brushColor, brushColor, brushColor, 1);
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextDrawImage(currentContext, [self bounds], imageRef);
    CGImageRelease(imageRef);
    CGContextDrawLayerInRect(currentContext, [self bounds], layer);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch tapCount] == 2) {
        CGContextClearRect(context, [self bounds]);
        [self setNeedsDisplay];
    } else {
        [self touchesMoved:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    CGPoint pastLocation = [touch previousLocationInView:self];
    
    CGContextRef layerContext = CGLayerGetContext(layer);
    CGContextBeginPath(layerContext);
    CGContextMoveToPoint(layerContext, pastLocation.x, pastLocation.y);
    CGContextAddLineToPoint(layerContext, location.x, location.y);
    CGContextStrokePath(layerContext);
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGContextDrawLayerInRect(context, [self bounds], layer);
    CGContextClearRect(context, [self bounds]);
}

- (void)dealloc
{
    CGContextRelease(context);
    CGLayerRelease(layer);
//    [super dealloc];
}

@end

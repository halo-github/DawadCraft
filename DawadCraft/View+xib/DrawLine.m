//
//  DrawLine.m
//  DawadCraft
//
//  Created by Fenix on 16/5/9.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineWidth(context, 5);
    CGContextDrawPath(context, kCGPathStroke);
}

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectZero;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2;
        self.alpha = 0.5f;
            }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    path = CGPathCreateMutable();
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    CGPathMoveToPoint(path, nil, location.x, location.y);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location  =[touch locationInView:self];
    CGPathAddLineToPoint(path, nil, location.x, location.y);
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
     CGPathAddLineToPoint(path, nil, location.x, location.y);
    [self setNeedsDisplay];
    }

//-(void)DrawLineWithColor:(UIColor*)color width:(CGFloat)lineWidth fromPoint:(CGPoint)from toPoint:(CGPoint)to
//{
//        UIGraphicsBeginImageContext(self.frame.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(context, color.CGColor);
//    CGContextSetLineWidth(context, lineWidth);
//    CGContextMoveToPoint(context, from.x, from.y);
//    CGContextAddLineToPoint(context, to.x, to.y);
//    CGContextStrokePath(context);
//    [self setNeedsDisplay];
//   UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(from.x, from.y, 1, 1)];
//    imageView.backgroundColor = [UIColor redColor];
//    imageView.image = image;
//    [self addSubview:imageView];
////    return image;
////    self.image = image;
//}

@end

//
//  DrawLine.m
//  DawadCraft
//
//  Created by Fenix on 16/5/9.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "DrawLine.h"
#import "PathEntity.h"
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
    CGContextSetLineWidth(context, 2);
    CGContextDrawPath(context, kCGPathStroke);
    for (PathEntity *ent in _locationArr) {
        CGContextAddEllipseInRect(context, CGRectMake(ent.x-2, ent.y-2, 4, 4));
        CGContextStrokePath(context);
    }
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
//   滑动开始创建路径
    path = CGPathCreateMutable();
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    CGPathMoveToPoint(path, nil, self.center.x, self.center.y);
    CGPathAddLineToPoint(path, nil, location.x, location.y);
    [self setNeedsDisplay];
//    
    PathEntity *start  = [[PathEntity alloc] initWithLocation:self.center];
    PathEntity *entity = [[PathEntity alloc] initWithLocation:location];
    firstLocation = location;
    secondLocation = CGPointZero;
    thirdLocation = CGPointZero;
//    secondLocation = location;
    
    _locationArr = [NSMutableArray arrayWithObjects:start,entity, nil];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//    滑动中画线
{
    UITouch *touch = [touches anyObject];
    CGPoint location  =[touch locationInView:self];
    CGPathAddLineToPoint(path, nil, location.x, location.y);
    
    if (thirdLocation.x != 0&&thirdLocation.y != 0 && secondLocation.x != 0&&secondLocation.y != 0)
    {
        firstLocation = secondLocation;
        secondLocation = thirdLocation;
        thirdLocation = location;
        CGFloat aCos = [self acosWithA:firstLocation andB:secondLocation andC:thirdLocation];
//        NSLog(@"%f",aCos);
        if (aCos < 8*M_PI/9) {
            NSLog(@"%f",aCos);
            NSLog(@"这里发生转折");
//            CGContextAddEllipseInRect(context, CGRectMake(secondLocation.x-2, secondLocation.y, 4, 4));
            [_locationArr addObject:[[PathEntity alloc] initWithLocation:secondLocation]];
        }
    }
   else if (secondLocation.x == 0&&secondLocation.y == 0) {
        secondLocation = location;
    }
   else if (thirdLocation.x == 0&&thirdLocation.y == 0) {
        thirdLocation = location;
    }
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
     CGPathAddLineToPoint(path, nil, location.x, location.y);
    [_locationArr addObject:[[PathEntity alloc] initWithLocation:location]];
    [self setNeedsDisplay];
    
    }

-(CGFloat)acosWithA:(CGPoint)a andB:(CGPoint)b andC:(CGPoint)c
{
    CGFloat aa = (c.x-b.x)*(c.x-b.x) + (c.y-b.y)*(c.y-b.y);
    CGFloat bb = (c.x-a.x)*(c.x-a.x) + (c.y-a.y)*(c.y-a.y);
    CGFloat cc = (a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y);
    CGFloat ac = sqrt(aa*cc);
    return acos((aa + cc - bb)/(2*ac));
}
@end

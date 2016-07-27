//
//  cornerRadiusBtn.m
//  DawadCraft
//
//  Created by Fenix on 16/5/9.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "cornerRadiusBtn.h"

@implementation cornerRadiusBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 
*/
- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 3);
//    CGContextAddEllipseInRect(context, rect);
//    CGContextDrawPath(context, kCGPathStroke);
    
}

-(void)setFrame:(CGRect)frame
{
//    [super setFrame:frame];
//    self.layer.cornerRadius = 15;
//    self.layer.masksToBounds = YES;
//    self.layer.borderWidth = 1;
//    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}
-(void)awakeFromNib
{
//    CGRect rect = self.frame;
//    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.width);
    self.layer.cornerRadius = 20;
//    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}





@end

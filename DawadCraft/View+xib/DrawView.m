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
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint preLocation = [touch previousLocationInView:self];
    CGPoint location  =[touch locationInView:self];
    

}
@end

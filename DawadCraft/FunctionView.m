//
//  FunctionView.m
//  DawadCraft
//
//  Created by Fenix on 16/5/6.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "FunctionView.h"

@implementation FunctionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self.subview setFrame:self.bounds];
    [self addSubview:self.subview];
}

-(void)dealloc
{
    [self.subview removeFromSuperview];
    self.subview = nil;
}
@end

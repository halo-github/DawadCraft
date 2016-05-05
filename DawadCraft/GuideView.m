//
//  GuideView.m
//  DawadCraft
//
//  Created by Fenix on 16/5/5.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "GuideView.h"

@implementation GuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"GuideView" owner:self options:nil];
    [self.subview setFrame:self.bounds];
    [self addSubview:self.subview];
}
@end

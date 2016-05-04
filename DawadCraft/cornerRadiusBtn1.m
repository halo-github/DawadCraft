//
//  cornerRadiusBtn1.m
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "cornerRadiusBtn1.h"

@implementation cornerRadiusBtn1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.layer.cornerRadius = 0.05*(self.bounds.size.width + self.bounds.size.height);
    self.layer.borderWidth = 1;
//    self.layer.borderColor
}
@end

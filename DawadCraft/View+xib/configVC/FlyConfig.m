//
//  FlyConfig.m
//  DawadCraft
//
//  Created by Fenix on 16/5/24.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "FlyConfig.h"

@implementation FlyConfig

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"FlyConfig" owner:self options:nil];
    [_contentView setFrame:self.frame];
    [self addSubview:_contentView];
}
@end

//
//  ShowConfig.m
//  DawadCraft
//
//  Created by Fenix on 16/5/26.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ShowConfig.h"

@implementation ShowConfig

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ShowConfig" owner:self options:nil];
    [_contentView setFrame:self.frame];
    [self addSubview:_contentView];
}
@end

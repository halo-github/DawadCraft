//
//  Others.m
//  DawadCraft
//
//  Created by Fenix on 16/5/26.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "Others.h"

@implementation Others

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"Others" owner:self options:nil];
    [_contentView setFrame:self.frame];
    [self addSubview:_contentView];
}

@end

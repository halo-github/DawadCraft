//
//  bottonLine.m
//  DawadCraft
//
//  Created by Fenix on 16/5/25.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "BottonLine.h"

@implementation BottonLine

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
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}
@end

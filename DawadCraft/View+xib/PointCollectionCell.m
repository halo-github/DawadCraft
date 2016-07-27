//
//  PointCollectionCell.m
//  DawadCraft
//
//  Created by Fenix on 16/5/19.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "PointCollectionCell.h"

@implementation PointCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])  {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
    }
    return self;
}
@end

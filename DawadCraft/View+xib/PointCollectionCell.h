//
//  PointCollectionCell.h
//  DawadCraft
//
//  Created by Fenix on 16/5/19.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "PointCollectionCell.h"
@interface PointCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *latitudeLab;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLab;
@property (weak, nonatomic) IBOutlet UILabel *heightLab;

@end

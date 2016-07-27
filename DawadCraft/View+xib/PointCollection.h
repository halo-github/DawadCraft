//
//  PointCollection.h
//  DawadCraft
//
//  Created by Fenix on 16/5/19.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointCollection : UIView<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

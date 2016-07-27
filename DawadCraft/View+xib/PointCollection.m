//
//  PointCollection.m
//  DawadCraft
//
//  Created by Fenix on 16/5/19.
//  Copyright © 2016年 Fenix. All rights reserved.
//
#define REUSEID @"collectionCell"
#define SELECTEDCOLOR  [UIColor blueColor];
#define DESELECTEDCOLOR  [UIColor redColor];
#import "PointCollection.h"
#import "PointCollectionCell.h"
@implementation PointCollection
 static NSString  *reuseID =@"collectionCell";
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    self.backgroundColor  = [UIColor clearColor];
    [[NSBundle mainBundle] loadNibNamed:@"PointCollection" owner:self options:nil];
    [_contentView setFrame:self.frame];
    [self addSubview:_contentView];
    _dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3"@"4", nil];
    
    
//    注册cell
    [_collection registerClass:[PointCollectionCell class] forCellWithReuseIdentifier:reuseID];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  
        return 10;

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PointCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PointCollectionCell *cell = (PointCollectionCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = SELECTEDCOLOR;
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    PointCollectionCell *cell = (PointCollectionCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = DESELECTEDCOLOR;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.bounds.size.width*0.1, self.bounds.size.height-5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(self.bounds.size.width*0.1, self.bounds.size.height-5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width*0.3, self.bounds.size.height-5);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 5);
}
@end

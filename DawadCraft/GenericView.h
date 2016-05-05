//
//  GenericView.h
//  DawadCraft
//
//  Created by Fenix on 16/5/5.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GenericView;
@protocol GenericViewDelegate <NSObject>
-(void)GenericView:(GenericView*)genericVW changeWithClick:(UIButton*)btn;
@end
@interface GenericView : UIView
@property (nonatomic, weak) id <GenericViewDelegate> delegate;

@end

//
//  PathEntity.h
//  DawadCraft
//
//  Created by Fenix on 16/5/21.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathEntity : NSObject
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
-(id)initWithLocation:(CGPoint)point;
@end

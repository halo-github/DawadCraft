//
//  CommmonBUttonRow.h
//  DawadCraft
//
//  Created by Fenix on 16/5/24.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommmonButtonRow : UIView<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *buttonTab;
@property (nonatomic, strong) NSMutableArray *dataArr;
//dataArr 内objcet格式要求 ：{@"按钮名":@"xib名"}
@property (nonatomic, strong) UIView *commonView;
@end

//
//  CommmonBUttonRow.m
//  DawadCraft
//
//  Created by Fenix on 16/5/24.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "CommmonButtonRow.h"
#import <objc/runtime.h>
@implementation CommmonButtonRow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"CommmonButtonRow" owner:self options:nil];
    [_contentView setFrame:self.frame];
    [self addSubview:_contentView];
}

- (void) setDataArr:(NSMutableArray*)dataArr
{
//    懒加载
    _dataArr = [NSMutableArray arrayWithArray:dataArr];
    _buttonTab.delegate = self;
    _buttonTab.dataSource = self;
    _buttonTab.rowHeight = 40;
    
//    [_buttonTab selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];//貌似没用
    [self tableView:_buttonTab didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataArr&&_dataArr.count) {
        return _dataArr.count;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    NSDictionary *dic = [_dataArr objectAtIndex:indexPath.row];
    NSString *btnName = [[dic allKeys] firstObject];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.bounds.size.width-10, _buttonTab.rowHeight)];
    lab.text = btnName;
    lab.textColor = [UIColor blueColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.adjustsFontSizeToFitWidth = YES;//根据尺寸，字体自适应
    [cell.contentView addSubview:lab];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_dataArr objectAtIndex:indexPath.row];
    NSString *xibName = [[dic allValues] firstObject];
    BOOL Found = NO;
    for (UIView *view in _commonView.subviews) {
        if ([xibName isEqualToString:NSStringFromClass([view class])]) {
                [_commonView bringSubviewToFront:view];
                Found = YES;
        }
    }
    if (!Found) {
        const char *className = [xibName cStringUsingEncoding:NSASCIIStringEncoding];
        Class newClass = objc_getClass(className);//runtime
        UIView *aView = [[newClass alloc] initWithFrame:_commonView.bounds];
        [aView awakeFromNib];
        [_commonView addSubview:aView];

    }
//    CATransition *transition;
//    transition.duration = 0.5f;
//    transition.type = kCATransitionReveal;
//    transition.timingFunction = UIViewAnimationCurveEaseInOut;
//    [_commonView.layer addAnimation:transition forKey:@"sdf"];
}
@end

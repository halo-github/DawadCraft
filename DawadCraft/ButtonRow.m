//
//  ButtonRow.m
//  DawadCraft
//
//  Created by Fenix on 16/5/4.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ButtonRow.h"
#import <objc/runtime.h>
@implementation ButtonRow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib
{
    self.viewWithBtn = @{@"2001":@"CompanyIntroduceView",@"2002":@"GuideView",@"2003":@"FunctionView",@"2004":@"UpdateView"};
    [[NSBundle mainBundle] loadNibNamed:@"ButtonRow" owner:self options:nil];
    [self.subview setFrame:self.bounds];
    [self addSubview:self.subview];
}
- (IBAction)IntroduceBtn:(id)sender {
    if (!self.genericVW) {
        return;
    }

//清理原来的子视图
    for (UIView *subV in self.genericVW.subviews) {
        [subV removeFromSuperview];
    }
//runtime动态获取新类名
    UIButton *btn = (UIButton*)sender;
    NSString *key = [NSString stringWithFormat:@"%lu",btn.tag];
    NSString *value = [self.viewWithBtn objectForKey:key];
    const char *className = [value cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
//新视图加载
    id newView = [[newClass alloc] initWithFrame:self.genericVW.bounds];
    [newView awakeFromNib];
    [self.genericVW addSubview:newView];
    //    更改按钮状态
    self.selectedBtn.selected = NO;
    self.selectedBtn = btn;
    self.selectedBtn.selected = YES;
       }



@end

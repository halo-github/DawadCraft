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
   
    UIButton *btn = (UIButton*)sender;
    NSString *key = [NSString stringWithFormat:@"%lu",btn.tag];
    NSString *value = [self.viewWithBtn objectForKey:key];
    const char *className = [value cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    id newView = [[newClass alloc] initWithFrame:self.genericVW.frame];
    [newView awakeFromNib];
    [self.superview addSubview:newView];
    
       }


- (IBAction)updateBtn:(id)sender {
    
}
- (IBAction)guideBtn:(id)sender {
    if (!self.genericVW) {
        return;
    }
    NSLog(@"%@",self.genericVW);
    UIButton *btn = (UIButton*)sender;
    NSString *key = [NSString stringWithFormat:@"%lu",btn.tag];
    NSString *value = [self.viewWithBtn objectForKey:key];
    const char *className = [value cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    id newView = [[newClass alloc] initWithFrame:self.genericVW.frame];
    [self.superview addSubview:newView];
    [newView awakeFromNib];
}
- (IBAction)functionBtn:(id)sender {
    self.selectedBtn = sender;
    if (self.delegate&&[self.delegate respondsToSelector:@selector(selected:)]) {
        [self.delegate selected:self.selectedBtn];
    }
}
@end

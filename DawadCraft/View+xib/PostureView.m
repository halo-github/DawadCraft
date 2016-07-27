//
//  PostureView.m
//  DawadCraft
//
//  Created by Fenix on 16/5/18.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "PostureView.h"

@implementation PostureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"PostureView" owner:self options:nil];
    [self.subview setFrame:self.frame];
    [self addSubview:self.subview];
    self.img.layer.shadowOpacity = 0.8;//阴影
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animationWithDic) userInfo:nil repeats:YES];
    _timer =[NSTimer timerWithTimeInterval:1 target:self selector:@selector(animationWithDic) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void)startTimer
{
    [_timer fire];
}

-(void)stopTimer
{
//    [_timer invalidate];
}
-(void)animationWithDic
{
//    随机数模拟
    int x = (arc4random()%1000);
    int y = (arc4random()%1000);
    int z = (arc4random()%1000);
    int fx = arc4random() % 2? 1 : -1;
    int fy = arc4random()  % 2? 1 : -1;
    int fz = arc4random() % 2 ? 1 : -1;
    float px = fx * x * 0.00314;
    float py = fy * y * 0.00314 ;
    float pz = fz * z * 0.00314;
//    printf("%f  %f  %f\n",px,py,pz);
//    简单动画
    CATransform3D aa1 = CATransform3DMakeRotation(px, 1, 0, 0);
    CATransform3D aa2 = CATransform3DMakeRotation(py, 0, 1, 0);
    CATransform3D aa3 = CATransform3DMakeRotation(pz, 0, 0, 1);
    CATransform3D transf = CATransform3DConcat(aa1, CATransform3DConcat(aa3,aa2));
    CATransform3D perspected = CATransform3DPerspect(transf, CGPointMake(0, 0), 500);
    CABasicAnimation *anib = [CABasicAnimation animation];
    anib.keyPath = @"transform";
    anib.duration =1;
    anib.fromValue = [NSValue valueWithCATransform3D:self.perp];
    anib.toValue = [NSValue valueWithCATransform3D:perspected];
    //    anib.autoreverses = YES;
    anib.fillMode = kCAFillModeForwards;
    anib.removedOnCompletion = NO;
    [self.img.layer addAnimation:anib forKey:@"key"];
    self.perp = perspected;
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ; //透视图关键设置，镜头距离
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

@end

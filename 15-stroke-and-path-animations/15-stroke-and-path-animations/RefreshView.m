//
//  RefreshView.m
//  15-stroke-and-path-animations
//
//  Created by xpchina2003 on 2017/5/31.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "RefreshView.h"


@interface RefreshView () <UIScrollViewDelegate>
    
    @property (nonatomic, strong) UIScrollView *scrollView;
    @property (nonatomic, assign) BOOL refreshing;
    @property (nonatomic, assign) CGFloat progress;
    @property (nonatomic, assign) BOOL isRefreshing;
    @property (nonatomic, strong) CAShapeLayer *ovalShapeLayer;
    @property (nonatomic, strong) CALayer *airplaneLayer;
    
@end

@implementation RefreshView


    
- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollerView
{
    self.scrollView = scrollerView;
    
//    scrollerView.delegate = self;
    if (self = [super initWithFrame:frame]) {
        
        self.isRefreshing = NO;
        self.refreshing = NO;
        self.progress = 0.0;
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh-view-bg.png"]];
        imgView.frame = self.bounds;
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.clipsToBounds = true;
        [self addSubview:imgView];
        
        self.ovalShapeLayer = [CAShapeLayer layer];
        self.ovalShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.ovalShapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.ovalShapeLayer.lineWidth = 4.0;
        self.ovalShapeLayer.lineDashPattern = @[@2,@3];
        
        CGFloat refreshRadius = self.frame.size.height/2*0.8;
        
        self.ovalShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width/2-refreshRadius, self.frame.size.height/2-refreshRadius, 2*refreshRadius, 2*refreshRadius)].CGPath;
        
        
        [self.layer addSublayer:self.ovalShapeLayer];
        
        UIImage *airPlanImage = [UIImage imageNamed:@"airplane.png"];
        self.airplaneLayer = [CALayer layer];
        self.airplaneLayer.contents = (__bridge id _Nullable)(airPlanImage.CGImage);
        self.airplaneLayer.bounds = CGRectMake(0, 0, airPlanImage.size.width, airPlanImage.size.height);
        self.airplaneLayer.position = CGPointMake(self.frame.size.width/2+self.frame.size.height/2*0.8,self.frame.size.height/2);
        [self.layer addSublayer:self.airplaneLayer];
        
        self.airplaneLayer.opacity = 0.0;
        
    }
    return self;

}
    
#pragma mark --UIScrollerView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = MAX(-(scrollView.contentOffset.y+scrollView.contentInset.top), 0.0);
    self.progress = MIN(MAX(offset/self.frame.size.height, 0.0), 1.0);
    
    if (!self.isRefreshing) {
        [self redrawFromProgress:self.progress];
    }
}
    
   - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
    {
        if (!self.isRefreshing && self.progress >= 1.0) {
            if ([self.delegate respondsToSelector:@selector(refreshViewDidRefresh:)]) {
                [self.delegate refreshViewDidRefresh:self];
                [self beginRefresh];
            }
        }
    }
    
    - (void)beginRefresh
    {
        self.isRefreshing = true;
        
        [UIView animateWithDuration:0.3 animations:^{
            UIEdgeInsets newInsets = self.scrollView.contentInset;
            newInsets.top += self.frame.size.height;
            self.scrollView.contentInset = newInsets;
            
        }];
        
        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @(- 0.5);
        strokeStartAnimation.toValue = @1.0;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.0;
        strokeEndAnimation.toValue = @1.0;
        
        CAAnimationGroup *strokeAnimationGroup = [CAAnimationGroup animation];
        strokeAnimationGroup.duration = 1.5;
        strokeAnimationGroup.repeatDuration = 5.0;
        strokeAnimationGroup.animations = @[strokeStartAnimation,strokeEndAnimation];
        [self.ovalShapeLayer addAnimation:strokeAnimationGroup forKey:nil];
        
        CAKeyframeAnimation *flightAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        flightAnimation.path = self.ovalShapeLayer.path;
        flightAnimation.calculationMode = kCAAnimationPaced;
        
        CABasicAnimation *airplaneOrientationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        airplaneOrientationAnimation.fromValue = @0.0;
        airplaneOrientationAnimation.toValue = @(2.0* M_PI);
        
        CAAnimationGroup *flightAnimationGroup = [CAAnimationGroup animation];
        flightAnimationGroup.duration = 1.5;
        flightAnimationGroup.repeatDuration = 5.0;
        flightAnimationGroup.animations = @[flightAnimation,airplaneOrientationAnimation];
        [self.airplaneLayer addAnimation:flightAnimationGroup forKey:nil];
        
    }
    
    - (void)endRefreshing{
    
        self.isRefreshing = NO;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            UIEdgeInsets newInsets = self.scrollView.contentInset;
            newInsets.top -= self.frame.size.height;
            self.scrollView.contentInset = newInsets;
        } completion:nil];
    
    }
    
    - (void)redrawFromProgress:(CGFloat)progress
    {
        self.ovalShapeLayer.strokeEnd = progress;
        self.airplaneLayer.opacity = progress;
    }

@end

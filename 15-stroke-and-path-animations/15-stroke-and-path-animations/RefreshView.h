//
//  RefreshView.h
//  15-stroke-and-path-animations
//
//  Created by xpchina2003 on 2017/5/31.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RefreshView;
@protocol RefreshDelegate <NSObject>

@optional
- (void)refreshViewDidRefresh:(RefreshView *)refreshView;

@end

@interface RefreshView : UIView

@property (nonatomic, weak) id<RefreshDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL refreshing;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, weak) CAShapeLayer *ovalShapeLayer;
@property (nonatomic, weak) CALayer *airplaneLayer;

@end

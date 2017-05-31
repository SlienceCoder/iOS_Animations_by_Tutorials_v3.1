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

    
    - (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollerView;
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView;
    - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
    - (void)endRefreshing;

@end

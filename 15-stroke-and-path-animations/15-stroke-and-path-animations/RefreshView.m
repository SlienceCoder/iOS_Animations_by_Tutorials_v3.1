//
//  RefreshView.m
//  15-stroke-and-path-animations
//
//  Created by xpchina2003 on 2017/5/31.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh-view-bg.png"]];
        imgView.frame = self.bounds;
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.clipsToBounds = true;
        [self addSubview:imgView];
        
        self.ovalShapeLayer
        
        
        
    }
    return self;
}

@end

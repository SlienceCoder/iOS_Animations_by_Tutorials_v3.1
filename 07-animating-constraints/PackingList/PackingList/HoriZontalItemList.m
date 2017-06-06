//
//  HoriZontalItemList.m
//  PackingList
//
//  Created by xpchina2003 on 2017/6/6.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "HoriZontalItemList.h"

@interface HoriZontalItemList ()
@property (nonatomic, assign) CGFloat buttonWidth ;
@property (nonatomic,assign) CGFloat padding;
@end

@implementation HoriZontalItemList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initInView:(UIView *)inView
{
    CGRect rect = CGRectMake(inView.frame.size.width, 120, inView.frame.size.width, 80);
  self =  [self initWithFrame:rect];
    
    self.alpha = 0.0;
    
    for (int i = 0; i < 10; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"summericons_100px_0\(%d).png",i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.center = CGPointMake(i*self.buttonWidth + self.buttonWidth/2, self.buttonWidth/2);
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        [imageView addGestureRecognizer:tap];
    }
    
    
    
}

@end

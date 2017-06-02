//
//  SnowView.m
//  Flight Info
//
//  Created by xpchina2003 on 2017/6/2.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CAEmitterLayer *emitter = [CAEmitterLayer layer];
        emitter.emitterPosition = CGPointMake(self.bounds.size.width/2, 0);
        emitter.emitterSize = self.bounds.size;
        emitter.emitterShape = kCAEmitterLayerRectangle;
        
        CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
        emitterCell.contents = [UIImage imageNamed:@"flake.png"];
        emitterCell.birthRate = 200;
        emitterCell.lifetime = 3.5;
        emitterCell.color = [UIColor whiteColor].CGColor;
        emitterCell.redRange = 0.0;
        emitterCell.blueRange = 0.1;
        emitterCell.greenRange = 0.0;
        emitterCell.velocity = 10;
        emitterCell.velocityRange = 350;
        emitterCell.emissionRange = (CGFloat)M_PI_2;
        emitterCell.emissionLongitude = (CGFloat)-M_PI;
        emitterCell.yAcceleration = 70;
        emitterCell.xAcceleration = 0;
        emitterCell.scale = 0.33;
        emitterCell.scaleRange = 1.25;
        emitterCell.scaleSpeed = -0.25;
        emitterCell.alphaRange = 0.5;
        emitterCell.alphaSpeed = -0.15;
        
        emitter.emitterCells = @[emitterCell];
        
    }
    return self;
}

@end

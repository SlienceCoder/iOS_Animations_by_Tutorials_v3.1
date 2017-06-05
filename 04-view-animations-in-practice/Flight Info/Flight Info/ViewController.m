//
//  ViewController.m
//  Flight Info
//
//  Created by xpchina2003 on 2017/6/2.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "ViewController.h"
#import "SnowView.h"
#import "FlightModel.h"


typedef NS_ENUM(NSInteger,AnimationDirection) {
    positive = 1,
    negative = -1

};

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *summaryIcon;
@property (weak, nonatomic) IBOutlet UILabel *sumary;
@property (weak, nonatomic) IBOutlet UILabel *flightNr;
@property (weak, nonatomic) IBOutlet UILabel *gateNr;
@property (weak, nonatomic) IBOutlet UILabel *departingFrom;
@property (weak, nonatomic) IBOutlet UILabel *arrivingTo;
@property (weak, nonatomic) IBOutlet UIImageView *planeImage;
@property (weak, nonatomic) IBOutlet UILabel *flightStatus;
@property (weak, nonatomic) IBOutlet UIImageView *statusBanner;
@property (nonatomic, strong) SnowView *snowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.sumary addSubview:self.summaryIcon];
    CGPoint iconF = self.summaryIcon.center;
    iconF.y = self.sumary.frame.size.height / 2;
    self.summaryIcon.center = iconF;
    
    // add the snow effect layer
    self.snowView = [[SnowView alloc] initWithFrame:CGRectMake(-150, -100, 300, 50)];
    UIView *snowClipView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+50, self.view.frame.size.width, self.view.frame.size.height)];
    snowClipView.clipsToBounds = YES;
    [snowClipView addSubview:self.snowView];
    [self.view addSubview:snowClipView];
    
//    [self changeFlight:];
    
}

- (void)changeFlight:(FlightModel *)model
{
    
    BOOL animated = NO;
    self.sumary.text = model.summary;
    
    if (animated) {
        
    }
}

- (void)fadeImageView:(UIImageView *)imageView toImage:(UIImage *)toImage showEffects:(BOOL)showEffects
{
    [UIView transitionWithView:imageView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imageView.image = toImage;
    } completion:nil];
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.snowView.alpha = showEffects ? 1.0 :0.0;
    } completion:nil];
    
}

- (void)cubeTransition:(UILabel *)label text:(NSString *)text direction:(AnimationDirection)direction
{
    UILabel *auxLabel = [[UILabel alloc] initWithFrame:label.frame];
    auxLabel.text = text;
    auxLabel.font = label.font;
    auxLabel.textAlignment = label.textAlignment;
    auxLabel.textColor = label.textColor;
    auxLabel.backgroundColor = label.backgroundColor;
    
//    CGFloat auxLabelOffset = (CGFloat)direction * label.frame.size.height/2.0;
//    auxLabel.transform = CGAffineTransformScale(, 0, 0.1)
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

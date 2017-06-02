//
//  ViewController.m
//  BahamaAirLoginScreen
//
//  Created by xpchina2003 on 2017/6/2.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UILabel *topTitle;
@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;

@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) UIImageView *status;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) NSArray *messages;

@property (nonatomic, assign) CGPoint statusPosition;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.topTitle.centerX -= self.view.bounds.size.width;
    self.username.centerX -= self.view.bounds.size.width;
    self.password.centerX -= self.view.bounds.size.width;
    
    
    self.cloud1.alpha = 1.0;
    self.cloud2.alpha = 1.0;
    self.cloud3.alpha = 1.0;
    self.cloud4.alpha = 1.0;
    
    self.login.centerY += 30;
    self.login.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.topTitle.centerX += self.view.bounds.size.width;
    }];

    [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.username.centerX += self.view.bounds.size.width;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
         self.password.centerX += self.view.bounds.size.width;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.cloud1.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.cloud2.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.cloud3.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.cloud4.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.login.centerY -= 30;
        self.login.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messages = @[@"Connecting ...", @"Authorizing ...", @"Sending credentials ...", @"Failed"];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.spinner.frame = CGRectMake(-20, 6, 20, 20);
    [self.spinner startAnimating];
    self.spinner.alpha = 0;
    [self.login addSubview:self.spinner];
    
    self.status = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
    self.status.hidden = YES;
    self.status.center = self.login.center;
    [self.view addSubview:self.status];
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(0, 0, self.status.frame.size.width, self.status.frame.size.height);
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    self.label.textColor = [UIColor colorWithRed:0.89 green:0.38 blue:0 alpha:1.0];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.status addSubview:self.label];
    
    self.login.layer.cornerRadius = 8.0;
    self.login.layer.masksToBounds = YES;
    
    self.statusPosition = self.status.center;

}

- (IBAction)login:(id)sender {
    
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       CGRect bounds = self.login.bounds;
        bounds.size.width += 80;
        self.login.bounds = bounds;
    } completion:^(BOOL finished) {
        [self showMessage:0];
    }];
    
    [UIView animateWithDuration:0.33 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.login.centerY += 60;
        self.login.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1.0];
        self.spinner.center = CGPointMake(40, self.login.frame.size.height/2);
        self.spinner.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)showMessage:(int)index
{
    self.label.text = self.messages[index];
    
    [UIView transitionWithView:self.status duration:0.33 options:UIViewAnimationOptionTransitionCurlDown | UIViewAnimationOptionCurveEaseOut  animations:^{
        self.status.hidden = NO;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (index < self.messages.count-1) {
                [self removeMessage:index];
            } else {
            
            }
        });
    }];
    
}

- (void)removeMessage:(int)index
{
    [UIView animateWithDuration:0.33 delay:0 options:0 animations:^{
        self.status.centerX += self.view.frame.size.width;
    } completion:^(BOOL finished) {
        
        self.status.hidden = YES;
        self.status.center =  self.statusPosition;
        
        [self showMessage:index+1];
        
    }];
}


@end

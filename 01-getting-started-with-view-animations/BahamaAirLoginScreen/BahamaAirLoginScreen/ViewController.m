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


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.topTitle.centerX -= self.view.bounds.size.width;
    self.username.centerX -= self.view.bounds.size.width;
    self.password.centerX -= self.view.bounds.size.width;
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
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [self.view addSubview:self.label];
    
    self.login.layer.cornerRadius = 8.0;
    self.login.layer.masksToBounds = YES;
    
    

}

- (IBAction)login:(id)sender {
    
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       CGRect bounds = self.login.bounds;
        bounds.size.width += 80;
        self.login.bounds = bounds;
    } completion:nil];
    
    [UIView animateWithDuration:0.33 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.login.centerY += 60;
        self.login.backgroundColor = [UIColor colorWithRed:0.85 green:0.83 blue:0.45 alpha:1.0];
        self.spinner.center = CGPointMake(40, self.login.frame.size.height/2);
        self.spinner.alpha = 1.0;
        
    } completion:nil];
    
    
}



@end

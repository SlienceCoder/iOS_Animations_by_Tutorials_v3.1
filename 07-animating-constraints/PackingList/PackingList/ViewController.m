//
//  ViewController.m
//  PackingList
//
//  Created by xpchina2003 on 2017/6/6.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "ViewController.h"
#import "HoriZontalItemList.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;


@property (nonatomic, strong) HoriZontalItemList *slider;
@property (nonatomic, assign) BOOL isMenuOpen;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *itemTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化
    self.isMenuOpen = NO;
    self.items = @[@5,@6,@7];
    self.itemTitles = @[@"Icecream money", @"Great weather", @"Beach ball", @"Swim suit for him", @"Swim suit for her", @"Beach games", @"Ironing board", @"Cocktail mood", @"Sunglasses", @"Flip flops"];
    
    self.tableView.rowHeight = 54.0;
}


#pragma mark --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = self.itemTitles[[self.items[indexPath.row] integerValue]];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"summericons_100px_0\(%@).png",self.items[indexPath.row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showItem:[self.items[indexPath.row] intValue]];
}
- (void)showItem:(int)index
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"summericons_100px_0\(%d).png",index]]];
    imageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.masksToBounds = YES;
    imageView.translatesAutoresizingMaskIntoConstraints = NO; // ????
    [self.view addSubview:imageView];
    
    
    // 添加限制
   NSLayoutConstraint *conx = [imageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    NSLayoutConstraint *conBottom = [imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:imageView.frame.size.height];
    NSLayoutConstraint *conWidth = [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.33 constant:-50];
    NSLayoutConstraint *conheight = [imageView.heightAnchor constraintEqualToAnchor:imageView.widthAnchor];
    
    
    [NSLayoutConstraint activateConstraints:@[conx,conBottom,conWidth,conheight]];
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:0 animations:^{
        
        conBottom.constant = -imageView.frame.size.height/2;
        conWidth.constant = 0.0;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}



- (IBAction)actionToggleMenu:(id)sender {
    self.isMenuOpen = !self.isMenuOpen;
    
    for (NSLayoutConstraint *constraint in self.titleLabel.superview.constraints) {
        
        if (constraint.firstItem == self.titleLabel && constraint.firstAttribute == NSLayoutAttributeCenterX) {
            constraint.constant = self.isMenuOpen ? -100 : 0.0;
            return;
        }
        
        if ([constraint.identifier isEqualToString:@"TitleCenterY"]) {
            constraint.active = NO;
            
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.titleLabel.superview attribute:NSLayoutAttributeCenterY multiplier:self.isMenuOpen ? 0.67 : 1.0 constant:5.0];
            newConstraint.identifier = @"TitleCenterY";
            newConstraint.active = YES;
            return;
        }
        
    }
    
    self.menuHeightConstraint.constant = self.isMenuOpen ? 200:60;
    self.titleLabel.text = self.isMenuOpen ? @"Select Item" : @"Packing List";
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGFloat angle = self.isMenuOpen ? M_PI / 4 : 0.0;
        self.buttonMenu.transform = CGAffineTransformMakeRotation(angle);
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];
    if (self.isMenuOpen) {
        self.slider
    }
    
    
}
@end

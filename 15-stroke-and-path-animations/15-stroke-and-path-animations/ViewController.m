//
//  ViewController.m
//  15-stroke-and-path-animations
//
//  Created by xpchina2003 on 2017/5/31.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import "ViewController.h"
#import "RefreshView.h"

#define  kRefreshViewHeight 110.0

@interface ViewController () <RefreshDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *packItems;
@property (nonatomic, strong) RefreshView *refreshView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.packItems = @[@"Ice cream money", @"Great weather", @"Beach ball", @"Swimsuit for him", @"Swimsuit for her", @"Beach games", @"Ironing board", @"Cocktail mood", @"Sunglasses", @"Flip flops"];
    
    
    self.title = @"Vacation pack list";
    self.view.backgroundColor = [UIColor colorWithRed:0 green:154.0/255.0 blue:222.0/255.0 alpha:1.0];
    self.tableView.rowHeight = 64.0;
    
    CGRect refreshrect = CGRectMake(0, -kRefreshViewHeight, self.view.frame.size.width, kRefreshViewHeight);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.refreshView = [[RefreshView alloc] initWithFrame:refreshrect scrollView:self.tableView];
    self.refreshView.delegate = self;
    [self.view addSubview:self.refreshView];
    
}

#pragma mark --UItableViewDelegate和数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CElLL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = self.packItems[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"summericons_100px_0%ld.png",(long)indexPath.row]];
    
    return cell;
    
}
- (void)delay:(double)seconds 
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
    });
}
    
#pragma mark --REfreshViewDelegate
- (void)refreshViewDidRefresh:(RefreshView *)refreshView
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.refreshView endRefreshing];
        });
       
    }
    
#pragma mark --ScrollerViewDelegate
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView
    {
    
        [self.refreshView scrollViewDidScroll:scrollView];
    }
    - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
    {
        [self.refreshView scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
@end

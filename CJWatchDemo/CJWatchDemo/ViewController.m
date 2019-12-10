//
//  ViewController.m
//  CJWatchDemo
//
//  Created by chujian.zheng on 2019/9/6.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DataViewController.h"
#import "DataSharingViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titles;

@end

#pragma mark - life cycle
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"数据传输", @"数据共享"];
    
    [self buildUI];
}

#pragma mark - UI
- (void)buildUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = self.titles[indexPath.row];
    
    if ([title isEqualToString:@"数据传输"]) {
        DataViewController *vc = [[DataViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([title isEqualToString:@"数据共享"]) {
        DataSharingViewController *vc = [[DataSharingViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end

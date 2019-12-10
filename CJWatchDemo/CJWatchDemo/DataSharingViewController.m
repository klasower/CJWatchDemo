//
//  DataSharingViewController.m
//  CJWatchDemo
//
//  Created by chujian.zheng on 2019/9/12.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "DataSharingViewController.h"

@interface DataSharingViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation DataSharingViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
}

#pragma mark - UI
- (void)buildUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 44.0)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, self.textField.frame.origin.y + self.textField.frame.size.height + 100, [UIScreen mainScreen].bounds.size.width - 20, 44.0);
    [self.view addSubview:button];
    [button setTitle:@"S A V E" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

#pragma mark - Actions
- (void)save:(UIButton *)button {
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.klasower.demo"];
    
    [defaults setObject:self.textField.text forKey:@"kDataSharingKey"];
    
    [defaults synchronize];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@12, @22, @33, @10, @1, @3, @55, @12, nil];
    
    // 冒泡排序
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = 0; j < array.count - 1 - i; j++) {
            if ([array[j] integerValue] > [array[j+1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    
    // 快速排序
    
}

@end

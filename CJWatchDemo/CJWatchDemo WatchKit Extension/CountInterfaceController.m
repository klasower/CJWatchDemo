//
//  CountInterfaceController.m
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/10.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "CountInterfaceController.h"
#import "Counter.h"

@interface CountInterfaceController ()

@property (strong, nonatomic) IBOutlet WKInterfaceButton *countButton;

@property (nonatomic, strong) Counter *counter;

@end

@implementation CountInterfaceController

#pragma mark - life cycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.counter = [Counter sharedInstance];
    
    [self updateButtonTitle];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - actions

/// 点击数量按钮
- (IBAction)countButtonPressed {
    
    [self.counter increase];
    
    [self.counter save];
    
    [self updateButtonTitle];
    
}

/// 长按菜单-点击重置
- (IBAction)resetAction {
    
    [self.counter reset];
    
    [self updateButtonTitle];
}

/// 更新按钮标题
- (void)updateButtonTitle {
    [self.countButton setTitle:[NSString stringWithFormat:@"%d", self.counter.count]];
}

@end




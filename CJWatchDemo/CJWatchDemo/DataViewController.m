//
//  DataViewController.m
//  CJWatchDemo
//
//  Created by chujian.zheng on 2019/9/11.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "DataViewController.h"

#import <WatchConnectivity/WatchConnectivity.h>

@interface DataViewController ()<WCSessionDelegate>

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UILabel *countLbl;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

#pragma mark - UI
- (void)buildUI {
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 44.0)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, self.textField.frame.origin.y + self.textField.frame.size.height + 100, [UIScreen mainScreen].bounds.size.width - 20, 44.0);
    [self.view addSubview:button];
    [button setTitle:@"S E N D" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    
    self.countLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, button.frame.origin.y + button.frame.size.height + 100, [UIScreen mainScreen].bounds.size.width - 20, 44.0)];
    self.countLbl.textAlignment = NSTextAlignmentCenter;
    self.countLbl.font = [UIFont systemFontOfSize:36];
    [self.view addSubview:self.countLbl];
    
}

#pragma mark - Actions
- (void)send:(UIButton *)button {
    
    WCSession *session = [WCSession defaultSession];
    
    [session sendMessage:@{@"text":self.textField.text} replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
        NSLog(@"replay: %@", replyMessage);
    } errorHandler:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
}

#pragma mark - WCSessionDelegate

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.countLbl.text = [NSString stringWithFormat:@"%@", [message objectForKey:@"count"]];
    });
}

- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error  API_AVAILABLE(ios(9.3)){
}

- (void)sessionDidBecomeInactive:(WCSession *)session {
    
}

- (void)sessionDidDeactivate:(WCSession *)session {
    
}

@end

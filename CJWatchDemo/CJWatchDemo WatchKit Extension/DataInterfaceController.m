//
//  DataInterfaceController.m
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/11.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "DataInterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface DataInterfaceController ()<WCSessionDelegate>

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *label;

@property (nonatomic, assign) NSInteger count;

@end

@implementation DataInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
}

- (void)willActivate {

    [super willActivate];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

- (void)didDeactivate {

    [super didDeactivate];
}

- (IBAction)send {
    
    WCSession *session = [WCSession defaultSession];
    
    [session sendMessage:@{@"count":@(self.count++)} replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
        
    } errorHandler:^(NSError * _Nonnull error) {
        
    }];
    
}

#pragma mark - WCSessionDelegate

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    NSString *text = [message objectForKey:@"text"];
    [_label setText:text];
}

- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error  API_AVAILABLE(ios(9.3)){
}

@end




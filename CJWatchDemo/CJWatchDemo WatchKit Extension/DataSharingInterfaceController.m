//
//  DataSharingInterfaceController.m
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/12.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "DataSharingInterfaceController.h"

@interface DataSharingInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *label;

@end

@implementation DataSharingInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self loadData];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)update {
    
    [self loadData];
    
}

- (void)loadData {
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.klasower.demo"];

    [_label setText:[defaults objectForKey:@"kDataSharingKey"]];
}

@end




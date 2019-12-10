//
//  InterfaceController.m
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/6.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "InterfaceController.h"

@interface RowController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;

@end

@implementation RowController

@end

@interface InterfaceController ()

@property (strong, nonatomic) IBOutlet WKInterfaceTable *table;

@property (nonatomic, strong) NSArray *titles;

@end


@implementation InterfaceController

#pragma mark - life cycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    self.titles = @[@"计数器", @"数据传输", @"数据共享"];
    
    [_table setNumberOfRows:self.titles.count withRowType:@"Row"];
    
    [self.titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RowController *controller = [self.table rowControllerAtIndex:idx];
        [controller.titleLabel setText:obj];
    }];
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
- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    [self pushControllerWithName:self.titles[rowIndex] context:nil];
}

@end




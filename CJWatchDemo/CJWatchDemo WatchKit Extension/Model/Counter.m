//
//  Counter.m
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/6.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import "Counter.h"

static NSString *const counterKey = @"counterKey";

@implementation Counter

static Counter *_sharedInstance = nil;
static dispatch_once_t onceToken;

+ (instancetype)sharedInstance {
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Counter alloc] init];
        [_sharedInstance load];
    });
    return _sharedInstance;
}

- (void)increase {
    _count++;
}

- (void)save {
    [[NSUserDefaults standardUserDefaults] setInteger:_count forKey:counterKey];
}

- (void)load {
    _count = [[NSUserDefaults standardUserDefaults] integerForKey:counterKey];
}

- (void)reset {
    _count = 0;
    [self save];
}

@end

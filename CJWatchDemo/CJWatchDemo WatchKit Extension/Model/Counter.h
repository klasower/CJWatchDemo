//
//  Counter.h
//  CJWatchDemo WatchKit Extension
//
//  Created by chujian.zheng on 2019/9/6.
//  Copyright © 2019 BIT Net Technology(Tian Jin)co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Counter : NSObject

@property (nonatomic, assign) NSInteger count;

+ (instancetype)sharedInstance;

/// 数量+1
- (void)increase;

/// 保存到本地
- (void)save;

/// 加载本地数据
- (void)load;

/// 重置为0并保存
- (void)reset;

@end

NS_ASSUME_NONNULL_END

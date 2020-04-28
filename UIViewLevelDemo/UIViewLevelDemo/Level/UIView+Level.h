//
//  UIView+Level.h
//  UIViewLevelDemo
//
//  Created by Liyun on 2020/4/28.
//  Copyright © 2020 Liyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Level)

/// UIView的层级字段 越大越在底层 相同的level按addSubview顺序
@property(nonatomic, assign) NSInteger     level;

@end

NS_ASSUME_NONNULL_END

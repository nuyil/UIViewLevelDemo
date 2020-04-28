//
//  UIView+Level.m
//  UIViewLevelDemo
//
//  Created by Liyun on 2020/4/28.
//  Copyright © 2020 Liyun. All rights reserved.
//

#import "UIView+Level.h"
#import <objc/runtime.h>

static const void *lyLevel = &lyLevel;

@implementation UIView (Level)

+ (void)load {
    [self swizzleInstanceMethod:@selector(addSubview:)];
}

+ (void)swizzleInstanceMethod:(SEL)sel {
    
    SEL other = NSSelectorFromString([NSString stringWithFormat:@"ly_%@",NSStringFromSelector(sel)]);
    
    Method org = class_getInstanceMethod(self, sel);
    Method method = class_getInstanceMethod(self, other);
    
    if (class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method))) {
        class_replaceMethod(self, other, method_getImplementation(org), method_getTypeEncoding(org));
    } else {
        method_exchangeImplementations(org, method);
    }
}

- (void)ly_addSubview:(UIView *)view{
    NSArray *tmp = self.subviews;
    
    for (NSUInteger i=tmp.count; i>0; i--) {
        UIView *v = tmp[i-1];
        if(view.level <= v.level){
            [self insertSubview:view aboveSubview:v];
            break;
        }
    }
    
    /// 有可能level最高 循环比较到最后 也没有插入进去
    /// 如果新来的 level 最大 插在最底部
    if(![self.subviews containsObject:view]){
        [self insertSubview:view atIndex:0];
    }
}


#pragma mark - Set & Get
- (void)setLevel:(NSInteger)level{
    objc_setAssociatedObject(self, lyLevel, @(level), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)level{
    return [objc_getAssociatedObject(self, lyLevel) integerValue];
}

@end

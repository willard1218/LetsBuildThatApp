//
//  UIView+Helpers.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "UIView+Helpers.h"

@implementation UIView (Helpers)
- (void)addConstraintsWithFormat:(NSString *)format views:(NSArray <UIView *>*)views {
    NSMutableDictionary <NSString *, UIView*> *viewDictionary;
    viewDictionary = [NSMutableDictionary dictionary];
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = [NSString stringWithFormat:@"v%ld", idx];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        viewDictionary[key] = view;
    }];
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:viewDictionary]];
}
@end

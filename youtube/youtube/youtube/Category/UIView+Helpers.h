//
//  UIView+Helpers.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helpers)
- (void)addConstraintsWithFormat:(NSString *)format views:(NSArray <UIView *>*)views;
@end

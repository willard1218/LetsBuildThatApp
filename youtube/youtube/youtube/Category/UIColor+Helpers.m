//
//  UIColor+Helpers.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)
+ (UIColor *)rgb:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}
@end

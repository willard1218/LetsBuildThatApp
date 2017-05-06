//
//  Setting.m
//  youtube
//
//  Created by willard on 2017/5/7.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "Setting.h"

@implementation Setting
- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName {
    self = [self init];
    if (self) {
        _name = name;
        _imageName = imageName;
    }
    
    return self;
}
@end

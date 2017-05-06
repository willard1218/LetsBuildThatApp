//
//  Setting.h
//  youtube
//
//  Created by willard on 2017/5/7.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageName;
- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName;
@end

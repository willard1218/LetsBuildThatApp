//
//  SettingsLauncher.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsLauncher : NSObject
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *blackView;
- (void)showSettings;
@end

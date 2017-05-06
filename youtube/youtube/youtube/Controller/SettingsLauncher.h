//
//  SettingsLauncher.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeController.h"
@class Setting;
@interface SettingsLauncher : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) NSArray <Setting *> *settings;
@property (nonatomic, strong) HomeController *homeController;
- (void)showSettings;
@end

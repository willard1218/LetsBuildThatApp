//
//  MenuBar.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"
@interface MenuBar : UIView
@property (nonatomic, strong) NSLayoutConstraint *horizontalBarLeftAnchorConstraint;
@property (nonatomic, weak) HomeController *homeController;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

//
//  SettingsLauncher.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "SettingsLauncher.h"

@implementation SettingsLauncher

- (void)showSettings {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _blackView = [[UIView alloc] init];
    _blackView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDismiss)];
    
    [_blackView addGestureRecognizer:tapGestureRecognizer];
    [window addSubview:_blackView];
    [window addSubview:self.collectionView];
    
    CGFloat height = 200;
    CGFloat y = window.frame.size.height - height;
    self.collectionView.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, height);
    
    _blackView.frame = window.frame;
    _blackView.alpha = 0;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.blackView.alpha = 1;
        self.collectionView.frame = CGRectMake(0, y, window.frame.size.width, window.frame.size.height);
    } completion:nil];
    
}

- (void)handleDismiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 0;
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        self.collectionView.frame = CGRectMake(0,
                                               window.frame.size.height,
                                               self.collectionView.frame.size.width,
                                               self.collectionView.frame.size.height);
    }];
}

- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = [UIColor whiteColor];
    return _collectionView;
}
@end

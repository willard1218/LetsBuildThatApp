//
//  SettingsLauncher.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "SettingsLauncher.h"
#import "Setting.h"
#import "SettingCell.h"

@implementation SettingsLauncher
const static NSString *cellId = @"SettingsLauncherCell";
const static CGFloat cellHeight = 50;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView registerClass:SettingCell.class forCellWithReuseIdentifier:cellId];
    }
    
    return self;
}
- (void)showSettings {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _blackView = [[UIView alloc] init];
    _blackView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDismiss:)];
    
    [_blackView addGestureRecognizer:tapGestureRecognizer];
    [window addSubview:_blackView];
    [window addSubview:self.collectionView];
    
    CGFloat height = (CGFloat)self.settings.count * cellHeight;
    CGFloat y = window.frame.size.height - height;
    self.collectionView.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, height);
    
    _blackView.frame = window.frame;
    _blackView.alpha = 0;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.blackView.alpha = 1;
        self.collectionView.frame = CGRectMake(0, y, window.frame.size.width, window.frame.size.height);
    } completion:nil];
    
}

- (void)handleDismiss:(Setting *)setting {
     [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.blackView.alpha = 0;
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        self.collectionView.frame = CGRectMake(0,
                                               window.frame.size.height,
                                               self.collectionView.frame.size.width,
                                               self.collectionView.frame.size.height);
    } completion:^(BOOL finished) {
        if ([setting isKindOfClass:Setting.class] && ![setting.name isEqualToString:@""] && ![setting.name isEqualToString:@"Cancel"]) {
            [self.homeController showControllerForSetting:setting];
        }
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

- (NSArray<Setting *> *)settings {
    if (_settings) {
        return _settings;
    }
    
    _settings = @[[[Setting alloc] initWithName:@"Settings" imageName:@"settings"],
                  [[Setting alloc] initWithName:@"Terms & privacy policy" imageName:@"privacy"],
                  [[Setting alloc] initWithName:@"Send Feedback" imageName:@"feedback"],
                  [[Setting alloc] initWithName:@"Help" imageName:@"help"],
                  [[Setting alloc] initWithName:@"Switch Account" imageName:@"switch_account"],
                  [[Setting alloc] initWithName:@"Cancel" imageName:@"cancel"]];
    
    return _settings;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.settings.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SettingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.setting = self.settings[indexPath.item];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width, cellHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Setting *setting = self.settings[indexPath.item];
    [self handleDismiss:setting];
}
@end

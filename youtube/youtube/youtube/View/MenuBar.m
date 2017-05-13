//
//  MenuBar.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "MenuBar.h"
#import "MenuCell.h"

@interface MenuBar() <UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation MenuBar
static const NSString *cellId = @"cellId";

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self addSubview:self.collectionView];
        [self addConstraintsWithFormat:@"H:|[v0]|" views:@[_collectionView]];
        [self addConstraintsWithFormat:@"V:|[v0]|" views:@[_collectionView]];
        [self.collectionView registerClass:MenuCell.class forCellWithReuseIdentifier:cellId];
        
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.collectionView selectItemAtIndexPath:selectedIndexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        
        [self setupHorizontalBar];
    }
    
    return self;
}

- (void)setupHorizontalBar {
    UIView *horizontalBarView = [[UIView alloc] init];
    horizontalBarView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    horizontalBarView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:horizontalBarView];
    
    _horizontalBarLeftAnchorConstraint = [horizontalBarView.leftAnchor constraintEqualToAnchor:self.leftAnchor];
    
    _horizontalBarLeftAnchorConstraint.active = YES;
    
    [horizontalBarView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [horizontalBarView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:1.f/4].active = YES;
    [horizontalBarView.heightAnchor constraintEqualToConstant:4].active = YES;
    
}

- (UICollectionView *)collectionView {
    if (_collectionView) {
        return _collectionView;
    }
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = [UIColor rgb:230 green:32 blue:31];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    return _collectionView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [_homeController scrollToMenuIndex:indexPath.item];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    NSArray *imageNames = @[@"home", @"trending", @"subscriptions", @"account"];
    cell.imageView.image = [[UIImage imageNamed:imageNames[indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    cell.tintColor = [UIColor rgb:91 green:14 blue:13];

   
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.width / 4, self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
@end

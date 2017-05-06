//
//  ViewController.m
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "HomeController.h"
#import "VideoCell.h"
#import "MenuBar.h"
@interface HomeController ()
@property (nonatomic, strong) MenuBar *menuBar;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Home";
    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, self.view.frame.size.height)];
    
    titleLabel.text = @"Home";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titleLabel;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self.collectionView registerClass:VideoCell.class forCellWithReuseIdentifier:@"cellId"];
    [self setupMenuBar];
}

- (MenuBar *)menuBar {
    if (_menuBar) {
        return _menuBar;
    }
    
    _menuBar = [[MenuBar alloc] init];
    return _menuBar;
}

- (void)setupMenuBar {
    [self.view addSubview:self.menuBar];
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:@[_menuBar]];
    [self.view addConstraintsWithFormat:@"V:|[v0(50)]" views:@[_menuBar]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = (self.view.frame.size.width - 16 - 16) * 9 / 16;
    CGSize size = CGSizeMake(self.view.frame.size.width, height + 16 + 68);
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
@end

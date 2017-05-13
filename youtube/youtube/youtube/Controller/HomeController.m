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
#import "Video.h"
#import "SettingsLauncher.h"
#import "Setting.h"
#import "ApiService.h"
@interface HomeController ()
@property (nonatomic, strong) MenuBar *menuBar;
@property (nonatomic, strong) NSArray <Video *> *videos;
@property (nonatomic, strong) SettingsLauncher *settingsLauncher;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchVideos];

    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, self.view.frame.size.height)];
    
    titleLabel.text = @"  Home";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titleLabel;
    
  
    [self setupMenuBar];
    [self setupNavBarButtons];
    [self setupCollectionView];
}

- (void)setupCollectionView {
    if ([self.collectionView.collectionViewLayout isKindOfClass:UICollectionViewFlowLayout.class]) {
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
    }
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"cellId"];
    
    self.collectionView.pagingEnabled = YES;
}

- (MenuBar *)menuBar {
    if (_menuBar) {
        return _menuBar;
    }
    
    _menuBar = [[MenuBar alloc] init];
    _menuBar.homeController = self;
    return _menuBar;
}

- (void)setupMenuBar {
    self.navigationController.hidesBarsOnSwipe = YES;
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor rgb:230 green:32 blue:31];
    
    [self.view addSubview:redView];
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:@[redView]];
    [self.view addConstraintsWithFormat:@"V:[v0(50)]" views:@[redView]];
    
    
    [self.view addSubview:self.menuBar];
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:@[_menuBar]];
    [self.view addConstraintsWithFormat:@"V:[v0(50)]" views:@[_menuBar]];
    
    [_menuBar.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor].active = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _menuBar.horizontalBarLeftAnchorConstraint.constant = scrollView.contentOffset.x / 4;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSInteger index = (CGFloat) targetContentOffset->x / self.view.frame.size.width;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    NSLog(@"%@", indexPath);
    [_menuBar.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    
}


- (void)setupNavBarButtons {
    UIImage *searchImage = [[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *moreImage = [[UIImage imageNamed:@"nav_more_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(handleSearch)];
    
    UIBarButtonItem *moreButtonItem = [[UIBarButtonItem alloc] initWithImage:moreImage style:UIBarButtonItemStylePlain target:self action:@selector(handleMore)];
    
    
    self.navigationItem.rightBarButtonItems = @[moreButtonItem, searchBarButtonItem];
    
    
}

- (void)handleMore {
    [self.settingsLauncher showSettings];
}

- (void)handleSearch {
    [self scrollToMenuIndex:2];
}

- (void)scrollToMenuIndex:(NSInteger)menuIndex {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:menuIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)fetchVideos {
    [[ApiService sharedInstance] fetchVideosWithDownloadCompletion:^(NSArray<Video *> *videos) {
        _videos = videos;
        [self.collectionView reloadData];
    }];
}

- (SettingsLauncher *)settingsLauncher {
    if (_settingsLauncher) {
        return _settingsLauncher;
    }
    
    _settingsLauncher = [[SettingsLauncher alloc] init];
    _settingsLauncher.homeController = self;
    return _settingsLauncher;
}

- (void)showControllerForSetting:(Setting *)setting {
    UIViewController *dummySettingsViewController = [[UIViewController alloc] init];
    
    dummySettingsViewController.view.backgroundColor = [UIColor whiteColor];
    dummySettingsViewController.navigationItem.title = setting.name;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [self.navigationController pushViewController:dummySettingsViewController animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    NSArray *colors = @[[UIColor blueColor], [UIColor greenColor], [UIColor grayColor], [UIColor purpleColor]];
    cell.backgroundColor = colors[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    return size;
}

@end

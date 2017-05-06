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
@interface HomeController ()
@property (nonatomic, strong) MenuBar *menuBar;
@property (nonatomic, strong) NSArray <Video *> *videos;
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
    [self setupNavBarButtons];
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

- (void)setupNavBarButtons {
    UIImage *searchImage = [[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *moreImage = [[UIImage imageNamed:@"nav_more_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(handleSearch)];
    
    UIBarButtonItem *moreButtonItem = [[UIBarButtonItem alloc] initWithImage:moreImage style:UIBarButtonItemStylePlain target:self action:@selector(handleMore)];
    
    
    self.navigationItem.rightBarButtonItems = @[moreButtonItem, searchBarButtonItem];
    
    
}

- (void)handleMore {
    
}
- (void)handleSearch {
    
}

- (NSArray<Video *> *)videos {
    if (_videos) {
        return _videos;
    }
    
    Channel *kanyeChannel = [[Channel alloc] init];
    kanyeChannel.name = @"KanyeIsTheBestChannel";
    kanyeChannel.profileImageName = @"kanye_profile";
    
    Video *blankSpaceVideo = [[Video alloc] init];
    
    blankSpaceVideo.title = @"Taylor Swift - Blank Space";
    blankSpaceVideo.thumbnailImageName = @"taylor_swift_blank_space";
    blankSpaceVideo.channel = kanyeChannel;
    blankSpaceVideo.numberOfViews = @23932843093;
    
    Video *badBloodVideo = [[Video alloc] init];
    badBloodVideo.title = @"Taylor Swift - Bad Blood featuring Kendrick Lamar";
    badBloodVideo.thumbnailImageName = @"taylor_swift_bad_blood";
    badBloodVideo.channel = kanyeChannel;
    badBloodVideo.numberOfViews = @57989654934;
    
    _videos = @[blankSpaceVideo, badBloodVideo];
    return _videos;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.video = self.videos[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = (self.view.frame.size.width - 16 - 16) * 9 / 16;
    CGSize size = CGSizeMake(self.view.frame.size.width, height + 16 + 88);
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
@end

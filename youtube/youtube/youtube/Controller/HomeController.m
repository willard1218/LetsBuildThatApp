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
    
    [self fetchVideos];
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

- (void)fetchVideos {
    NSURL *url = [NSURL URLWithString:@"https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray <Video *> *videos = [NSMutableArray array];
        
        for (NSDictionary *dictionary in json) {
            Video *video = [[Video alloc] init];
            video.title = dictionary[@"title"];
            video.thumbnailImageName = dictionary[@"thumbnail_image_name"];
            
            NSDictionary *channelDictionary = dictionary[@"channel"];
            
            Channel *channel = [[Channel alloc] init];
            channel.name = channelDictionary[@"name"];
            channel.profileImageName = channelDictionary[@"profile_image_name"];
            
            video.channel = channel;
            
            [videos addObject:video];
        }
        
        _videos = videos.copy;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
        
    }] resume];
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

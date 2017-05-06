//
//  VideoCell.m
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "VideoCell.h"
@interface VideoCell()
@property (nonatomic, strong) UIImageView *thumbnailImageView;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UIImageView *userProfileImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *subtitleTextView;
@end

@implementation VideoCell

- (void)setupViews {
    [super setupViews];
    [self addSubview:self.thumbnailImageView];
    [self addSubview:self.separatorView];
    [self addSubview:self.userProfileImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleTextView];
    
    _thumbnailImageView.frame = CGRectMake(0, 0, 100, 100);
    
    [self addConstraintsWithFormat:@"H:|-16-[v0]-16-|" views:@[_thumbnailImageView]];
    
    [self addConstraintsWithFormat:@"H:|-16-[v0(44)]-(8)-[v1]-16-|" views:@[_userProfileImageView, _titleLabel]];
    
    [self addConstraintsWithFormat:@"H:[v0(44)]-(8)-[v1]-16-|" views:@[_userProfileImageView, _subtitleTextView]];
    
    [self addConstraintsWithFormat:@"V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|" views:@[_thumbnailImageView, _userProfileImageView, _separatorView]];
    
    [self addConstraintsWithFormat:@"V:[v0]-4-[v1(20)]-4-[v2(30)]" views:@[_thumbnailImageView, _titleLabel, _subtitleTextView]];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:@[_separatorView]];
    
    
    
}

- (UIImageView *)thumbnailImageView {
    if (_thumbnailImageView) {
        return _thumbnailImageView;
    }
    
    _thumbnailImageView = [[UIImageView alloc] init];
    _thumbnailImageView.backgroundColor = [UIColor blueColor];
    _thumbnailImageView.image = [UIImage imageNamed:@"taylor_swift_blank_space"];
    _thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
    _thumbnailImageView.clipsToBounds = YES;
    return _thumbnailImageView;
}

- (UIView *)separatorView {
    if (_separatorView) {
        return _separatorView;
    }
    
    _separatorView = [[UIView alloc] init];
    _separatorView.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1];
    return _separatorView;
}

- (UIImageView *)userProfileImageView {
    if (_userProfileImageView) {
        return _userProfileImageView;
    }
    
    _userProfileImageView = [[UIImageView alloc] init];
    _userProfileImageView.backgroundColor = [UIColor greenColor];
    _userProfileImageView.image = [UIImage imageNamed:@"taylor_swift_profile"];
    _userProfileImageView.layer.cornerRadius = 22;
    _userProfileImageView.layer.masksToBounds = YES;
    return _userProfileImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"Taylor Swift - Blank Space";
    return _titleLabel;
}

- (UITextView *)subtitleTextView {
    if (_subtitleTextView) {
        return _subtitleTextView;
    }
    
    _subtitleTextView = [[UITextView alloc] init];
    _subtitleTextView.text = @"TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago";
    _subtitleTextView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0);
    _subtitleTextView.textColor = [UIColor lightGrayColor];
    return _subtitleTextView;
}
@end

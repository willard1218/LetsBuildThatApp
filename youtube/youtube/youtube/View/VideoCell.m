//
//  VideoCell.m
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"
#import "CustomImageView.h"
@interface VideoCell()
@property (nonatomic, strong) CustomImageView *thumbnailImageView;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) CustomImageView *userProfileImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *subtitleTextView;

@property (nonatomic, strong) NSLayoutConstraint *titleLabelHeightConstraint;
@end

@implementation VideoCell
@synthesize video = _video;

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
    
    [self addConstraintsWithFormat:@"V:|-16-[v0]-8-[v1(44)]-32-[v2(1)]|" views:@[_thumbnailImageView, _userProfileImageView, _separatorView]];
    
    [self addConstraintsWithFormat:@"V:[v0]-4-[v1]-4-[v2(30)]" views:@[_thumbnailImageView, _titleLabel, _subtitleTextView]];
    
    _titleLabelHeightConstraint = [_titleLabel.heightAnchor constraintEqualToConstant:44];
    _titleLabelHeightConstraint.active = YES;
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:@[_separatorView]];
    
    
    
}

- (void)setupProfileImage {
    if (_video.channel.profileImageName) {
        [_userProfileImageView loadImageUsingUrlString:_video.channel.profileImageName];
    }
}

- (void)setupThumbnailImage {
    if (_video.thumbnailImageName) {
        [_thumbnailImageView loadImageUsingUrlString:_video.thumbnailImageName];
    }
}

- (UIImageView *)thumbnailImageView {
    if (_thumbnailImageView) {
        return _thumbnailImageView;
    }
    
    _thumbnailImageView = [[CustomImageView alloc] init];
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
    
    _userProfileImageView = [[CustomImageView alloc] init];
    _userProfileImageView.backgroundColor = [UIColor greenColor];
    _userProfileImageView.image = [UIImage imageNamed:@"taylor_swift_profile"];
    _userProfileImageView.layer.cornerRadius = 22;
    _userProfileImageView.layer.masksToBounds = YES;
    _userProfileImageView.contentMode = UIViewContentModeScaleAspectFit;
    return _userProfileImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"Taylor Swift - Blank Space";
    _titleLabel.numberOfLines = 2;
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


- (Video *)video {
    if (!_video) {
        return _video;
    }
    
    _video = [[Video alloc] init];
    return _video;
}

- (void)setVideo:(Video *)video {
    _video = video;
    _titleLabel.text = _video.title;
    [self setupProfileImage];
    [self setupThumbnailImage];
    
    if (_video.channel.name && _video.numberOfViews) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        NSString *subtitleText = [NSString stringWithFormat:@"%@ • %@ • 2 years ago ", _video.channel.name, [numberFormatter stringFromNumber:_video.numberOfViews]];
        
        _subtitleTextView.text = subtitleText;
    }
    
    
    if (_video.title) {
        CGSize size = CGSizeMake(self.frame.size.width - 16 - 44 - 8 - 16, 1000);
        NSStringDrawingOptions options = (NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
        CGRect estimatedRect = [_video.title boundingRectWithSize:size options:options attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        
        if (estimatedRect.size.height > 20) {
            _titleLabelHeightConstraint.constant = 44;
        } else {
            _titleLabelHeightConstraint.constant = 20;
        }
        
        
    }
}

@end

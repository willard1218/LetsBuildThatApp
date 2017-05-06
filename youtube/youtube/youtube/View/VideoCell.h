//
//  VideoCell.h
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *thumbnailImageView;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UIImageView *userProfileImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *subtitleTextView;
@end

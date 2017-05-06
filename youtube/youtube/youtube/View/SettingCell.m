//
//  SettingCell.m
//  youtube
//
//  Created by willard on 2017/5/7.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "SettingCell.h"
#import "Setting.h"

@implementation SettingCell

- (void)setupViews {
    [super setupViews];
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.iconImageView];

    [self addConstraintsWithFormat:@"H:|-8-[v0(30)]-8-[v1]|" views: @[self.iconImageView, self.nameLabel]];
    
    [self addConstraintsWithFormat:@"V:|[v0]|" views: @[self.nameLabel]];
    
    [self addConstraintsWithFormat:@"V:[v0(30)]"  views: @[self.iconImageView]];
    [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

- (void)setHighlighted:(BOOL)highlighted {
    super.highlighted = highlighted;
    self.backgroundColor = (highlighted) ? [UIColor darkGrayColor] : [UIColor whiteColor];
    
    self.nameLabel.textColor = (highlighted) ? [UIColor whiteColor] : [UIColor blackColor];
    
    self.iconImageView.tintColor = (highlighted) ? [UIColor whiteColor] : [UIColor blackColor];
}

- (void)setSetting:(Setting *)setting {
    self.nameLabel.text = setting.name;
    
    if (setting.imageName) {
        self.iconImageView.image = [[UIImage imageNamed:setting.imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        self.iconImageView.tintColor = [UIColor darkGrayColor];
    }
}


- (UILabel *)nameLabel {
    if (_nameLabel) {
        return _nameLabel;
    }
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"Setting";
    _nameLabel.font = [UIFont systemFontOfSize:13];
    return _nameLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView) {
        return _iconImageView;
    }
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"settings"];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    return _iconImageView;
}


@end

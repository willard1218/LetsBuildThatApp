//
//  MenuCell.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "MenuCell.h"
@interface MenuCell ()

@end

@implementation MenuCell
- (void)setupViews {
    [super setupViews];
    [self addSubview:self.imageView];
    [self addConstraintsWithFormat:@"H:[v0(28)]" views:@[_imageView]];
    [self addConstraintsWithFormat:@"V:[v0(28)]" views:@[_imageView]];
    
    
    [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [_imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

- (UIImageView *)imageView {
    if (_imageView) {
        return _imageView;
    }
    
    _imageView = [[UIImageView alloc] init];
    _imageView.tintColor = [UIColor rgb:91 green:14 blue:13];
    
    return _imageView;
}

- (void)setHighlighted:(BOOL)highlighted {
    super.highlighted = highlighted;
    _imageView.tintColor = (highlighted) ? [UIColor whiteColor] : [UIColor rgb:91 green:14 blue:13];
}

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    _imageView.tintColor = (selected) ? [UIColor whiteColor] : [UIColor rgb:91 green:14 blue:13];
}
@end

//
//  SettingCell.h
//  youtube
//
//  Created by willard on 2017/5/7.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "BaseCell.h"
@class Setting;
@interface SettingCell : BaseCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) Setting *setting;
@property (nonatomic, strong) UIImageView *iconImageView;
@end

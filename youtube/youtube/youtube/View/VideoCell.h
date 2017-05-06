//
//  VideoCell.h
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@class Video;
@interface VideoCell : BaseCell
@property (nonatomic, strong) Video *video;
@end

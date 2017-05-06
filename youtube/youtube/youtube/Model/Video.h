//
//  Video.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Channel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileImageName;
@end


@interface Video : NSObject
@property (nonatomic, strong) NSString *thumbnailImageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *numberOfViews;
@property (nonatomic, strong) NSDate *updateDate;

@property (nonatomic, strong) Channel *channel;
@end

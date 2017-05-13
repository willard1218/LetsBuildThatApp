//
//  ApiService.h
//  youtube
//
//  Created by willard on 2017/5/13.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"

typedef void(^DownloadCompletion)(NSArray <Video *>*videos);

@interface ApiService : NSObject
+ (ApiService *)sharedInstance;

- (void)fetchVideosWithDownloadCompletion:(DownloadCompletion)completion;
@end

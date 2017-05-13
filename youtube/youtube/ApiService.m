//
//  ApiService.m
//  youtube
//
//  Created by willard on 2017/5/13.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "ApiService.h"

@implementation ApiService
+ (ApiService *)sharedInstance {
    static ApiService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ApiService alloc] init];
    });
    
    return instance;
}

- (void)fetchVideosWithDownloadCompletion:(DownloadCompletion)completion {
    
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
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(videos.copy);
        });
        
        
    }] resume];
}

@end

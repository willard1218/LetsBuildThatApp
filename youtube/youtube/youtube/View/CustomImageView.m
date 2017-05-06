//
//  CustomImageView.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView
- (void)loadImageUsingUrlString:(NSString *)urlString {
    _imageUrlString = urlString;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    self.image = nil;
    
    UIImage *imageCache = [_imageCache objectForKey:urlString];
    if (imageCache) {
        self.image = imageCache;
    }
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *imageToCache = [UIImage imageWithData:data];
            
            if ([self.imageUrlString isEqualToString:urlString]) {
                self.image = imageToCache;
            }
            
            [_imageCache setObject:imageToCache forKey:urlString];
            
        });
    }] resume];
    
}

@end

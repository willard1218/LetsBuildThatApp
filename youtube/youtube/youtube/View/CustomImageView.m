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
    
    UIImage *imageFromCache = [self.imageCache objectForKey:urlString];
    if (imageFromCache) {
        self.image = imageFromCache;
        return;
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

- (NSCache *)imageCache {
    if (_imageCache) {
        return _imageCache;
    }
    
    _imageCache = [[NSCache alloc] init];
    return _imageCache;
}
@end

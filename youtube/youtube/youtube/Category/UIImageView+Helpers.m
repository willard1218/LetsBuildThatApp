//
//  UIImageView+Helpers.m
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import "UIImageView+Helpers.h"

@implementation UIImageView (Helpers)
- (void)loadImageUsingUrlString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [UIImage imageWithData:data];
        });
    }] resume];
    
}
@end

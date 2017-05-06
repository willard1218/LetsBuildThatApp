//
//  CustomImageView.h
//  youtube
//
//  Created by willard on 2017/5/6.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIImageView
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, strong) NSString *imageUrlString;
- (void)loadImageUsingUrlString:(NSString *)urlString;
@end

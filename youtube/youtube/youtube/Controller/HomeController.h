//
//  ViewController.h
//  youtube
//
//  Created by willard on 2017/4/19.
//  Copyright © 2017年 willard. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Setting;
@interface HomeController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

- (void)showControllerForSetting:(Setting *)setting;
@end


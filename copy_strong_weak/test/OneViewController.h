//
//  OneViewController.h
//  test
//
//  Created by CityMedia on 2019/3/6.
//  Copyright © 2019年 free. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneViewController : UIViewController

@property(nonatomic,copy) void (^block)(void);

/**
 * code
 */
@property(nonatomic,copy) NSString * code;

@end

NS_ASSUME_NONNULL_END

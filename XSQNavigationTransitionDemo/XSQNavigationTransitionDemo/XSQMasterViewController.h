//
//  ViewController.h
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/27.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSQMasterViewController : UIViewController


@property (nonatomic, weak) UIPercentDrivenInteractiveTransition *interactiveTransition;

@property (nonatomic, strong) UIView *thumbView;

@end


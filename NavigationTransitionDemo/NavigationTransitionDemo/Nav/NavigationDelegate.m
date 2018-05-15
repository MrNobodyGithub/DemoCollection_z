//
//  NavigationDelegate.m
//  NavigationTransitionDemo
//
//  Created by CityMedia on 2018/5/15.
//  Copyright © 2018年 free. All rights reserved.
//

#import "NavigationDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"

#import "AnimatedTransitioningPush.h"
#import "AnimatedTransitioningPop.h"


@interface NavigationDelegate()

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;
@property(nonatomic,strong) AnimatedTransitioningPush * animationPush;
@property(nonatomic,strong) AnimatedTransitioningPop  * animationPop;

@end
@implementation NavigationDelegate

-(UIPercentDrivenInteractiveTransition *)interactiveTransition{
    if (!_interactiveTransition) {
        _interactiveTransition = [UIPercentDrivenInteractiveTransition new];
    }
    return  _interactiveTransition;
}

#pragma mark - UINavigationControllerDelegate;
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
//        OneViewController * vcFrom = (OneViewController *)fromVC;
        [self.interactiveTransition updateInteractiveTransition:0];
        
        if (!_animationPush) {
            _animationPush = [[AnimatedTransitioningPush alloc] init];
        }
        return _animationPush;
    }
    if (operation == UINavigationControllerOperationPop) {
        TwoViewController * vcTwo = (TwoViewController *)fromVC;
        [self.interactiveTransition updateInteractiveTransition:0];
        vcTwo.interactiveTransition = self.interactiveTransition;
        if (!_animationPop) {
            _animationPop = [[AnimatedTransitioningPop alloc] init];
         }
        return _animationPop;
    }
    return nil;
    

//    if (operation == UINavigationControllerOperationPop && [fromVC isKindOfClass:[XSQDetailViewController class]] && [toVC isKindOfClass:[XSQMasterViewController class]]) {
//
//        XSQDetailViewController *detailViewController = (XSQDetailViewController *)fromVC;
//        [self.interactiveTransition updateInteractiveTransition:0];
//        detailViewController.interactiveTransition = self.interactiveTransition;
//
//        XSQMasterViewController *masterViewController = (XSQMasterViewController *)toVC;
//
//        if (!self.shrinkAnimator) {
//            self.shrinkAnimator = [[XSQShrinkAnimatorObject alloc] initWithThumbView:masterViewController.thumbView];
//        }
//        return self.shrinkAnimator;
//    }
    
    
    //    if (operation == UINavigationControllerOperationPush && [fromVC isKindOfClass:[XSQMasterViewController class]] && [toVC isKindOfClass:[XSQDetailViewController class]]) {
    //
    //        XSQMasterViewController *masterViewController = (XSQMasterViewController *)fromVC;
    //
    //        if (!self.expandAnimator) {
    //            self.expandAnimator = [[XSQExpandAnimatorObject alloc] initWithThumbView:masterViewController.thumbView];
    //        }
    //        return self.expandAnimator;
    //    }
    
    
}

@end
